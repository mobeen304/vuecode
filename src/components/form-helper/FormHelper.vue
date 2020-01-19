<template>
	<div :class="parent_class">
    <!--begin::Portlet-->
    <div class="kt-portlet">
        <div class="kt-portlet__head">
            <div class="kt-portlet__head-label">
                     <slot name="heading"></slot>
            </div>
             <div class="kt-portlet__head-toolbar">
               <div class="kt-portlet__head-wrapper">
                  <div class="kt-portlet__head-actions">
                    <slot name="processing"></slot>
                     
                  </div>
               </div>
            </div>
        </div>

        <!--begin::Form-->
        <form class="kt-form">
            <div class="kt-portlet__body">
                <div class="form-group form-group-last">
                <slot name="error"></slot>
                    
                </div>
                <slot name="form-fields"></slot>
            </div>
            <div class="kt-portlet__foot">
                <div class="kt-form__actions">
                    <slot name="action-button"></slot>
                </div>
            </div>
        </form>
        <!--end::Form-->
    </div>
    <!--end::Portlet-->

    <!--begin::Portlet-->
   
    <!--end::Portlet-->
</div>
</template>

<script type="text/javascript">
	export default{
		props:['parent_class'],
		name: 'FormHelper'
	}
</script>