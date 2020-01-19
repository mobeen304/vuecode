<template>
	<div>
		<notifications group="success" />
		<notifications group="error" />
		<notifications group="info" />
	</div>
</template>

<script type="text/javascript">
	export default {
		name: "notification",
		methods: {
			success(msg) {
				this.$notify({
				  group: 'success',
				  title: 'Success',
				  text: msg
				});
			}

		}
	}
</script>