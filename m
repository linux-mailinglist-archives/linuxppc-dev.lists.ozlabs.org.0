Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FC424020C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 08:42:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQ5wq6nDdzDqRk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 16:42:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQ5vF3C6YzDqRg
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Aug 2020 16:40:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=hyX5VUeF; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BQ5vF0Y4Sz9sTF;
 Mon, 10 Aug 2020 16:40:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1597041641;
 bh=LMuH3ri2Eh/vI8VNrQEM061ubTEZflO37+kDO+JVQs0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=hyX5VUeFbmg26nSgT3dHYer35C65ZrabBRZbRC/S4tD2iSHeoXWuXNpLDzgRmpjge
 d3Bo2w9Mp3x9yYA65F4JvWyuOdOSFdPlXMrxUfsLEEfiy0z4T0R2NPuUrvNorbokST
 S+xtNVHuHssIHKXNFMx6ct51JExASy2NekG3UQG37cXx3dNkRKRjPDaKt7nu3rWbtv
 TPyDBXLZuWkuBICaA8VuVvDILRzwZOP4A+cU1r6ifkdV3hke6DSKWVf9mqYhLuflIm
 4dT67sZL61pN7YvQFMP9H7/g/wqDj480aWjuXzR2N8+TbfRbTLSGw9lWgP9L+KX71n
 grTIaEdHv+Bjw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/rtas: Restrict RTAS requests from userspace
In-Reply-To: <20200702161932.18176-1-ajd@linux.ibm.com>
References: <20200702161932.18176-1-ajd@linux.ibm.com>
Date: Mon, 10 Aug 2020 16:40:37 +1000
Message-ID: <87bljjxau2.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: nathanl@linux.ibm.com, leobras.c@gmail.com, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi ajd,

Thanks for taking care of this.

I was going to merge this as-is, but given it's fixing a long standing
issue there's not really a big rush. So a few comments below.

Andrew Donnellan <ajd@linux.ibm.com> writes:
> A number of userspace utilities depend on making calls to RTAS to retrieve
> information and update various things.
>
> The existing API through which we expose RTAS to userspace exposes more
> RTAS functionality than we actually need, through the sys_rtas syscall,
> which allows root (or anyone with CAP_SYS_ADMIN) to make any RTAS call they
> want with arbitrary arguments.
>
> Many RTAS calls take the address of a buffer as an argument, and it's up to
> the caller to specify the physical address of the buffer as an argument. We
> allocate a buffer (the "RMO buffer") in the Real Memory Area that RTAS can
> access, and then expose the physical address and size of this buffer in
> /proc/powerpc/rtas/rmo_buffer. Userspace is expected to read this address,
> poke at the buffer using /dev/mem, and pass an address in the RMO buffer to
> the RTAS call.
>
> However, there's nothing stopping the caller from specifying whatever
> address they want in the RTAS call, and it's easy to construct a series of
> RTAS calls that can overwrite arbitrary bytes (even without /dev/mem
> access).
>
> Additionally, there are some RTAS calls that do potentially dangerous
> things and for which there are no legitimate userspace use cases.
>
> In the past, this would not have been a particularly big deal as it was
> assumed that root could modify all system state freely, but with Secure
> Boot and lockdown we need to care about this.
>
> We can't fundamentally change the ABI at this point, however we can address
> this by implementing a filter that checks RTAS calls against a list
> of permitted calls and forces the caller to use addresses within the RMO
> buffer.
>
> The list is based off the list of calls that are used by the librtas
> userspace library, and has been tested with a number of existing userspace
> RTAS utilities. For compatibility with any applications we are not aware of
> that require other calls, the filter can be turned off at build time.
>
> Reported-by: Daniel Axtens <dja@axtens.net>
> Cc: stable@vger.kernel.org
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> ---
>  arch/powerpc/Kconfig       |  13 +++
>  arch/powerpc/kernel/rtas.c | 198 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 211 insertions(+)
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 9fa23eb320ff..0e2dfe497357 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -973,6 +973,19 @@ config PPC_SECVAR_SYSFS
>  	  read/write operations on these variables. Say Y if you have
>  	  secure boot enabled and want to expose variables to userspace.
>  
> +config PPC_RTAS_FILTER
> +	bool "Enable filtering of RTAS syscalls"
> +	default y
> +	depends on PPC_RTAS
> +	help
> +	  The RTAS syscall API has security issues that could be used to
> +	  compromise system integrity. This option enforces restrictions on the
> +	  RTAS calls and arguments passed by userspace programs to mitigate
> +	  these issues.
> +
> +	  Say Y unless you know what you are doing and the filter is causing
> +	  problems for you.
> +
>  endmenu
>  
>  config ISA_DMA_API
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index a09eba03f180..ec1cae52d8bd 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -324,6 +324,23 @@ int rtas_token(const char *service)
>  }
>  EXPORT_SYMBOL(rtas_token);
>  
> +#ifdef CONFIG_PPC_RTAS_FILTER
> +

I think this could be combined with the #ifdef block below?

> +static char *rtas_token_name(int token)
> +{
> +	struct property *prop;
> +
> +	for_each_property_of_node(rtas.dev, prop) {
> +		const __be32 *tokp = prop->value;
> +
> +		if (tokp && be32_to_cpu(*tokp) == token)
> +			return prop->name;
> +	}
> +	return NULL;
> +}
> +
> +#endif /* CONFIG_PPC_RTAS_FILTER */
> +
>  int rtas_service_present(const char *service)
>  {
>  	return rtas_token(service) != RTAS_UNKNOWN_SERVICE;
> @@ -1110,6 +1127,184 @@ struct pseries_errorlog *get_pseries_errorlog(struct rtas_error_log *log,
>  	return NULL;
>  }
>  
> +#ifdef CONFIG_PPC_RTAS_FILTER
> +
> +/*
> + * The sys_rtas syscall, as originally designed, allows root to pass
> + * arbitrary physical addresses to RTAS calls. A number of RTAS calls
> + * can be abused to write to arbitrary memory and do other things that
> + * are potentially harmful to system integrity, and thus should only
> + * be used inside the kernel and not exposed to userspace.
> + *
> + * All known legitimate users of the sys_rtas syscall will only ever
> + * pass addresses that fall within the RMO buffer, and use a known
> + * subset of RTAS calls.
> + *
> + * Accordingly, we filter RTAS requests to check that the call is
> + * permitted, and that provided pointers fall within the RMO buffer.
> + * The rtas_filters list contains an entry for each permitted call,
> + * with the indexes of the parameters which are expected to contain
> + * addresses and sizes of buffers allocated inside the RMO buffer.
> + */
> +struct rtas_filter {
> +	const char name[32];

Using a const char * for the name would be more typical, meaning the
strings would end up in .rodata, and could be merged with other uses of
the same strings.

> +
> +	/* Indexes into the args buffer, -1 if not used */
> +	int rmo_buf_idx1;
> +	int rmo_size_idx1;
> +	int rmo_buf_idx2;
> +	int rmo_size_idx2;

The "rmo" prefix is probably unnecessary?

> +};
> +
> +struct rtas_filter rtas_filters[] = {

Should be static, and __ro_after_init ?

> +	{ "ibm,activate-firmware", -1, -1, -1, -1 },

Would it be worth making the indices 1-based, allowing 0 to be the
unused value, meaning you only have to initialise the used fields?

It would require adjusting them before use, but there's only 4 places
they're used, and you could probably use a macro to do the - 1.

> +	{ "ibm,configure-connector", 0, -1, 1, -1 },	/* Special cased, size 4096 */

Does it make sense to put the hard coded sizes in the structure as well?

eg. fixed_size1 = 4096,

I think that would avoid the need for any strcmps in the code.

> +	{ "display-character", -1, -1, -1, -1 },
> +	{ "ibm,display-message", 0, -1, -1, -1 },
> +	{ "ibm,errinjct", 2, -1, -1, -1 },		/* Fixed size of 1024 */
> +	{ "ibm,close-errinjct", -1, -1, -1, -1 },
> +	{ "ibm,open-errinct", -1, -1, -1, -1 },
> +	{ "ibm,get-config-addr-info2", -1, -1, -1, -1 },
> +	{ "ibm,get-dynamic-sensor-state", 1, -1, -1, -1 },
> +	{ "ibm,get-indices", 2, 3, -1, -1 },
> +	{ "get-power-level", -1, -1, -1, -1 },
> +	{ "get-sensor-state", -1, -1, -1, -1 },
> +	{ "ibm,get-system-parameter", 1, 2, -1, -1 },
> +	{ "get-time-of-day", -1, -1, -1, -1 },
> +	{ "ibm,get-vpd", 0, -1, 1, 2 },
> +	{ "ibm,lpar-perftools", 2, 3, -1, -1 },
> +	{ "ibm,platform-dump", 4, 5, -1, -1 },
> +	{ "ibm,read-slot-reset-state", -1, -1, -1, -1 },
> +	{ "ibm,scan-log-dump", 0, 1, -1, -1 },
> +	{ "ibm,set-dynamic-indicator", 2, -1, -1, -1 },
> +	{ "ibm,set-eeh-option", -1, -1, -1, -1 },
> +	{ "set-indicator", -1, -1, -1, -1 },
> +	{ "set-power-level", -1, -1, -1, -1 },
> +	{ "set-time-for-power-on", -1, -1, -1, -1 },
> +	{ "ibm,set-system-parameter", 1, -1, -1, -1 },
> +	{ "set-time-of-day", -1, -1, -1, -1 },
> +	{ "ibm,suspend-me", -1, -1, -1, -1 },
> +	{ "ibm,update-nodes", 0, -1, -1, -1 },		/* Fixed size of 4096 */
> +	{ "ibm,update-properties", 0, -1, -1, -1 },	/* Fixed size of 4096 */
> +	{ "ibm,physical-attestation", 0, 1, -1, -1 },
> +};
> +
> +static void dump_rtas_params(int token, int nargs, int nret,
> +			     struct rtas_args *args)
> +{
> +	int i;
> +	char *token_name = rtas_token_name(token);
> +
> +	pr_err_ratelimited("sys_rtas: token=0x%x (%s), nargs=%d, nret=%d (called by %s)\n",
> +			   token, token_name ? token_name : "unknown", nargs,
> +			   nret, current->comm);
> +	pr_err_ratelimited("sys_rtas: args: ");
> +
> +	for (i = 0; i < nargs; i++) {
> +		u32 arg = be32_to_cpu(args->args[i]);
> +
> +		pr_cont("%08x ", arg);
> +		if (arg >= rtas_rmo_buf &&
> +		    arg < (rtas_rmo_buf + RTAS_RMOBUF_MAX))
> +			pr_cont("(buf+0x%lx) ", arg - rtas_rmo_buf);
> +	}

This can leak the location of the RMO buf into dmesg. I know it's
visible via /proc, but the /proc file is 0400.

So I think it's probably safer if we just don't dump the args, or their
relation to the RMO buf.

> +
> +	pr_cont("\n");
> +}
> +
> +static bool in_rmo_buf(u32 base, u32 end)
> +{
> +	return base >= rtas_rmo_buf &&
> +		base < (rtas_rmo_buf + RTAS_RMOBUF_MAX) &&
> +		base <= end &&
> +		end >= rtas_rmo_buf &&
> +		end < (rtas_rmo_buf + RTAS_RMOBUF_MAX);
> +}
> +
> +static bool block_rtas_call(int token, int nargs,
> +			    struct rtas_args *args)
> +{
> +	int i;
> +	const char *reason;
> +	char *token_name = rtas_token_name(token);

This code isn't particularly performance critical, but I think it would
be cleaner to do the token lookup once at init time, and store the token
in the filter array?

Then this code would only be doing token comparisons.

> +
> +	if (!token_name)
> +		goto err_notpermitted;
> +
> +	for (i = 0; i < ARRAY_SIZE(rtas_filters); i++) {
> +		struct rtas_filter *f = &rtas_filters[i];
> +		u32 base, size, end;
> +
> +		if (strcmp(token_name, f->name))
> +			continue;
> +
> +		if (f->rmo_buf_idx1 != -1) {
> +			base = be32_to_cpu(args->args[f->rmo_buf_idx1]);
> +			if (f->rmo_size_idx1 != -1)
> +				size = be32_to_cpu(args->args[f->rmo_size_idx1]);
> +			else if (!strcmp(token_name, "ibm,errinjct"))
> +				size = 1024;
> +			else if (!strcmp(token_name, "ibm,update-nodes") ||
> +				 !strcmp(token_name, "ibm,update-properties") ||
> +				 !strcmp(token_name, "ibm,configure-connector"))
> +				size = 4096;
> +			else
> +				size = 1;
> +
> +			end = base + size - 1;
> +			if (!in_rmo_buf(base, end)) {
> +				reason = "address pair 1 out of range";

I don't think we need to give the user this much detail about what they
did wrong, all cases can just print "call not permitted" IMO.

> +				goto err;
> +			}
> +		}
> +
> +		if (f->rmo_buf_idx2 != -1) {
> +			base = be32_to_cpu(args->args[f->rmo_buf_idx2]);
> +			if (f->rmo_size_idx2 != -1)
> +				size = be32_to_cpu(args->args[f->rmo_size_idx2]);
> +			else if (!strcmp(token_name, "ibm,configure-connector"))
> +				size = 4096;
> +			else
> +				size = 1;
> +			end = base + size - 1;
> +
> +			/*
> +			 * Special case for ibm,configure-connector where the
> +			 * address can be 0
> +			 */
> +			if (!strcmp(token_name, "ibm,configure-connector") &&
> +			    base == 0)
> +				return false;
> +
> +			if (!in_rmo_buf(base, end)) {
> +				reason = "address pair 2 out of range";
> +				goto err;
> +			}
> +		}
> +
> +		return false;
> +	}
> +
> +err_notpermitted:
> +	reason = "call not permitted";
> +
> +err:
> +	pr_err_ratelimited("sys_rtas: RTAS call blocked - exploit attempt? (%s)\n",
> +			   reason);
> +	dump_rtas_params(token, nargs, 0, args);
> +	return true;
> +}
> +
> +#else
> +
> +static bool block_rtas_call(int token, int nargs,
> +			    struct rtas_args *args)
> +{
> +	return false;
> +}
> +
> +#endif /* CONFIG_PPC_RTAS_FILTER */
> +
>  /* We assume to be passed big endian arguments */
>  SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
>  {
> @@ -1147,6 +1342,9 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
>  	args.rets = &args.args[nargs];
>  	memset(args.rets, 0, nret * sizeof(rtas_arg_t));
>  
> +	if (block_rtas_call(token, nargs, &args))
> +		return -EINVAL;
> +
>  	/* Need to handle ibm,suspend_me call specially */
>  	if (token == ibm_suspend_me_token) {
>  

cheers
