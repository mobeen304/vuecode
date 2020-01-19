export default
	{
		 path: '/customers',component:Admin,
      beforeEnter: (to, from, next) => {
        if (!token) next('/login')
          // if the user is not authenticated, `next` is called twice
          next()
      },
     children:[
          {
          path: '',
          name:'Customers',
          component: Customer,
            props:{
                pageTitle: 'Customer',
                subTitle: ''
            },
          },
          {
          path: 'newcustomers',
          name:'NewCustomers',
          component: NewCustomer,
            props:{
                pageTitle: 'Customer',
                subTitle: ''
            },
          },
          {
          path: 'customer/:id',
          name:'NewCustomers',
          component: NewCustomer,
            props:{
                pageTitle: 'Customer',
                subTitle: ''
            },
          }
      ]
}