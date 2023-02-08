Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D0968EE99
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 13:10:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBf2p0978z3f4n
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 23:10:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=U1EAR+DJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBf1v2PvXz2yw6
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Feb 2023 23:09:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=U1EAR+DJ;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PBf1v0sQ1z4xyd;
	Wed,  8 Feb 2023 23:09:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1675858179;
	bh=GxhZcQoyzgYNodFCtvm5/T1d/H92WsQvMrWtb2gZ1No=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=U1EAR+DJAECeqsWMvWg6ZsJecMMxi7SFbidTyYXs48Z6zFyzJVtb4EBN3rIkAxndZ
	 o/q3BvR5hd73oI2izt1fW8bkm1gacw7VaPksL3x76EArQPosqyTxsLhifO+pDUqPb5
	 coqP8CD8ULE6yIkUUg9luYN0jGCVynfu9cLHm0g/IRawhqJvxorz++bJ/4tLcW5icg
	 KHvBszKjZBVUDREd6uloJLZVG1dIj+vtgaYSWA+G0RwuXx8gsEFvlGBEsOqoA/Y62E
	 rpa6mRcSgp7X97H76CYxqLEUSeh2AgPN+4fNIuu+WfjMlh40mwvtYBKBfWhMr27WpP
	 R63fAIwd3HMkg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch via B4 Submission Endpoint
 <devnull+nathanl.linux.ibm.com@kernel.org>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Kajol
 Jain <kjain@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>, Mahesh
 J Salgaonkar <mahesh@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>,
 Nick Child <nnac123@linux.ibm.com>
Subject: Re: [PATCH v2 18/19] powerpc/rtas: introduce rtas_function_token() API
In-Reply-To: <20230125-b4-powerpc-rtas-queue-v2-18-9aa6bd058063@linux.ibm.com>
References: <20230125-b4-powerpc-rtas-queue-v2-0-9aa6bd058063@linux.ibm.com>
 <20230125-b4-powerpc-rtas-queue-v2-18-9aa6bd058063@linux.ibm.com>
Date: Wed, 08 Feb 2023 23:09:38 +1100
Message-ID: <87lel8we7x.fsf@mpe.ellerman.id.au>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch via B4 Submission Endpoint
<devnull+nathanl.linux.ibm.com@kernel.org> writes:
> From: Nathan Lynch <nathanl@linux.ibm.com>
>
> Users of rtas_token() supply a string argument that can't be validated
> at build time. A typo or misspelling has to be caught by inspection or
> by observing wrong behavior at runtime.
>
> Since the core RTAS code now has consolidated the names of all
> possible RTAS functions and mapped them to their tokens, token lookup
> can be implemented using symbolic constants to index a static array.
>
> So introduce rtas_function_token(), a replacement API which does that,
> along with a rtas_service_present()-equivalent helper,
> rtas_function_implemented(). Callers supply an opaque predefined
> function handle which is used internally to index the function
> table. Typos or other inappropriate arguments yield build errors, and
> the function handle is a type that can't be easily confused with RTAS
> tokens or other integer types.

Why not go all the way and have the rtas_call() signature be:

  int rtas_call(rtas_fn_handle_t fn, int, int, int *, ...);


And have it do the token lookup internally? That way a caller can never
inadvertantly pass a random integer to rtas_call().

And instead of eg:

	error = rtas_call(rtas_function_token(RTAS_FN_GET_TIME_OF_DAY), 0, 8, ret);

we'd just need:

	error = rtas_call(RTAS_FN_GET_TIME_OF_DAY, 0, 8, ret);


Doing the conversion all at once might be tricky. So maybe we need to add
rtas_fn_call() which takes rtas_fn_handle_t so we can convert cases individually?

Anyway just a thought. I guess we could merge this as-is and then do a
further change to use rtas_fn_handle_t later.

> diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
> index 14fe79217c26..fe400438c1fb 100644
> --- a/arch/powerpc/include/asm/rtas.h
> +++ b/arch/powerpc/include/asm/rtas.h
> @@ -103,6 +103,99 @@ enum rtas_function_index {
>  	rtas_fnidx(WRITE_PCI_CONFIG),
>  };
>  
> +/*
> + * Opaque handle for client code to refer to RTAS functions. All valid
> + * function handles are build-time constants prefixed with RTAS_FN_.
> + */
> +typedef struct {
> +	const enum rtas_function_index index;
> +} rtas_fn_handle_t;
> +
> +#define rtas_fn_handle(x_) ((const rtas_fn_handle_t) { .index = rtas_fnidx(x_), })
> +
> +#define RTAS_FN_CHECK_EXCEPTION                   rtas_fn_handle(CHECK_EXCEPTION)
> +#define RTAS_FN_DISPLAY_CHARACTER                 rtas_fn_handle(DISPLAY_CHARACTER)
> +#define RTAS_FN_EVENT_SCAN                        rtas_fn_handle(EVENT_SCAN)
> +#define RTAS_FN_FREEZE_TIME_BASE                  rtas_fn_handle(FREEZE_TIME_BASE)
> +#define RTAS_FN_GET_POWER_LEVEL                   rtas_fn_handle(GET_POWER_LEVEL)
> +#define RTAS_FN_GET_SENSOR_STATE                  rtas_fn_handle(GET_SENSOR_STATE)
> +#define RTAS_FN_GET_TERM_CHAR                     rtas_fn_handle(GET_TERM_CHAR)
> +#define RTAS_FN_GET_TIME_OF_DAY                   rtas_fn_handle(GET_TIME_OF_DAY)
> +#define RTAS_FN_IBM_ACTIVATE_FIRMWARE             rtas_fn_handle(IBM_ACTIVATE_FIRMWARE)
> +#define RTAS_FN_IBM_CBE_START_PTCAL               rtas_fn_handle(IBM_CBE_START_PTCAL)
> +#define RTAS_FN_IBM_CBE_STOP_PTCAL                rtas_fn_handle(IBM_CBE_STOP_PTCAL)
> +#define RTAS_FN_IBM_CHANGE_MSI                    rtas_fn_handle(IBM_CHANGE_MSI)
> +#define RTAS_FN_IBM_CLOSE_ERRINJCT                rtas_fn_handle(IBM_CLOSE_ERRINJCT)
> +#define RTAS_FN_IBM_CONFIGURE_BRIDGE              rtas_fn_handle(IBM_CONFIGURE_BRIDGE)
> +#define RTAS_FN_IBM_CONFIGURE_CONNECTOR           rtas_fn_handle(IBM_CONFIGURE_CONNECTOR)
> +#define RTAS_FN_IBM_CONFIGURE_KERNEL_DUMP         rtas_fn_handle(IBM_CONFIGURE_KERNEL_DUMP)
> +#define RTAS_FN_IBM_CONFIGURE_PE                  rtas_fn_handle(IBM_CONFIGURE_PE)
> +#define RTAS_FN_IBM_CREATE_PE_DMA_WINDOW          rtas_fn_handle(IBM_CREATE_PE_DMA_WINDOW)
> +#define RTAS_FN_IBM_DISPLAY_MESSAGE               rtas_fn_handle(IBM_DISPLAY_MESSAGE)
> +#define RTAS_FN_IBM_ERRINJCT                      rtas_fn_handle(IBM_ERRINJCT)
> +#define RTAS_FN_IBM_EXTI2C                        rtas_fn_handle(IBM_EXTI2C)
> +#define RTAS_FN_IBM_GET_CONFIG_ADDR_INFO          rtas_fn_handle(IBM_GET_CONFIG_ADDR_INFO)
> +#define RTAS_FN_IBM_GET_CONFIG_ADDR_INFO2         rtas_fn_handle(IBM_GET_CONFIG_ADDR_INFO2)
> +#define RTAS_FN_IBM_GET_DYNAMIC_SENSOR_STATE      rtas_fn_handle(IBM_GET_DYNAMIC_SENSOR_STATE)
> +#define RTAS_FN_IBM_GET_INDICES                   rtas_fn_handle(IBM_GET_INDICES)
> +#define RTAS_FN_IBM_GET_RIO_TOPOLOGY              rtas_fn_handle(IBM_GET_RIO_TOPOLOGY)
> +#define RTAS_FN_IBM_GET_SYSTEM_PARAMETER          rtas_fn_handle(IBM_GET_SYSTEM_PARAMETER)
> +#define RTAS_FN_IBM_GET_VPD                       rtas_fn_handle(IBM_GET_VPD)
> +#define RTAS_FN_IBM_GET_XIVE                      rtas_fn_handle(IBM_GET_XIVE)
> +#define RTAS_FN_IBM_INT_OFF                       rtas_fn_handle(IBM_INT_OFF)
> +#define RTAS_FN_IBM_INT_ON                        rtas_fn_handle(IBM_INT_ON)
> +#define RTAS_FN_IBM_IO_QUIESCE_ACK                rtas_fn_handle(IBM_IO_QUIESCE_ACK)
> +#define RTAS_FN_IBM_LPAR_PERFTOOLS                rtas_fn_handle(IBM_LPAR_PERFTOOLS)
> +#define RTAS_FN_IBM_MANAGE_FLASH_IMAGE            rtas_fn_handle(IBM_MANAGE_FLASH_IMAGE)
> +#define RTAS_FN_IBM_MANAGE_STORAGE_PRESERVATION   rtas_fn_handle(IBM_MANAGE_STORAGE_PRESERVATION)
> +#define RTAS_FN_IBM_NMI_INTERLOCK                 rtas_fn_handle(IBM_NMI_INTERLOCK)
> +#define RTAS_FN_IBM_NMI_REGISTER                  rtas_fn_handle(IBM_NMI_REGISTER)
> +#define RTAS_FN_IBM_OPEN_ERRINJCT                 rtas_fn_handle(IBM_OPEN_ERRINJCT)
> +#define RTAS_FN_IBM_OPEN_SRIOV_ALLOW_UNFREEZE     rtas_fn_handle(IBM_OPEN_SRIOV_ALLOW_UNFREEZE)
> +#define RTAS_FN_IBM_OPEN_SRIOV_MAP_PE_NUMBER      rtas_fn_handle(IBM_OPEN_SRIOV_MAP_PE_NUMBER)
> +#define RTAS_FN_IBM_OS_TERM                       rtas_fn_handle(IBM_OS_TERM)
> +#define RTAS_FN_IBM_PARTNER_CONTROL               rtas_fn_handle(IBM_PARTNER_CONTROL)
> +#define RTAS_FN_IBM_PHYSICAL_ATTESTATION          rtas_fn_handle(IBM_PHYSICAL_ATTESTATION)
> +#define RTAS_FN_IBM_PLATFORM_DUMP                 rtas_fn_handle(IBM_PLATFORM_DUMP)
> +#define RTAS_FN_IBM_POWER_OFF_UPS                 rtas_fn_handle(IBM_POWER_OFF_UPS)
> +#define RTAS_FN_IBM_QUERY_INTERRUPT_SOURCE_NUMBER rtas_fn_handle(IBM_QUERY_INTERRUPT_SOURCE_NUMBER)
> +#define RTAS_FN_IBM_QUERY_PE_DMA_WINDOW           rtas_fn_handle(IBM_QUERY_PE_DMA_WINDOW)
> +#define RTAS_FN_IBM_READ_PCI_CONFIG               rtas_fn_handle(IBM_READ_PCI_CONFIG)
> +#define RTAS_FN_IBM_READ_SLOT_RESET_STATE         rtas_fn_handle(IBM_READ_SLOT_RESET_STATE)
> +#define RTAS_FN_IBM_READ_SLOT_RESET_STATE2        rtas_fn_handle(IBM_READ_SLOT_RESET_STATE2)
> +#define RTAS_FN_IBM_REMOVE_PE_DMA_WINDOW          rtas_fn_handle(IBM_REMOVE_PE_DMA_WINDOW)
> +#define RTAS_FN_IBM_RESET_PE_DMA_WINDOWS          rtas_fn_handle(IBM_RESET_PE_DMA_WINDOWS)
> +#define RTAS_FN_IBM_SCAN_LOG_DUMP                 rtas_fn_handle(IBM_SCAN_LOG_DUMP)
> +#define RTAS_FN_IBM_SET_DYNAMIC_INDICATOR         rtas_fn_handle(IBM_SET_DYNAMIC_INDICATOR)
> +#define RTAS_FN_IBM_SET_EEH_OPTION                rtas_fn_handle(IBM_SET_EEH_OPTION)
> +#define RTAS_FN_IBM_SET_SLOT_RESET                rtas_fn_handle(IBM_SET_SLOT_RESET)
> +#define RTAS_FN_IBM_SET_SYSTEM_PARAMETER          rtas_fn_handle(IBM_SET_SYSTEM_PARAMETER)
> +#define RTAS_FN_IBM_SET_XIVE                      rtas_fn_handle(IBM_SET_XIVE)
> +#define RTAS_FN_IBM_SLOT_ERROR_DETAIL             rtas_fn_handle(IBM_SLOT_ERROR_DETAIL)
> +#define RTAS_FN_IBM_SUSPEND_ME                    rtas_fn_handle(IBM_SUSPEND_ME)
> +#define RTAS_FN_IBM_TUNE_DMA_PARMS                rtas_fn_handle(IBM_TUNE_DMA_PARMS)
> +#define RTAS_FN_IBM_UPDATE_FLASH_64_AND_REBOOT    rtas_fn_handle(IBM_UPDATE_FLASH_64_AND_REBOOT)
> +#define RTAS_FN_IBM_UPDATE_NODES                  rtas_fn_handle(IBM_UPDATE_NODES)
> +#define RTAS_FN_IBM_UPDATE_PROPERTIES             rtas_fn_handle(IBM_UPDATE_PROPERTIES)
> +#define RTAS_FN_IBM_VALIDATE_FLASH_IMAGE          rtas_fn_handle(IBM_VALIDATE_FLASH_IMAGE)
> +#define RTAS_FN_IBM_WRITE_PCI_CONFIG              rtas_fn_handle(IBM_WRITE_PCI_CONFIG)
> +#define RTAS_FN_NVRAM_FETCH                       rtas_fn_handle(NVRAM_FETCH)
> +#define RTAS_FN_NVRAM_STORE                       rtas_fn_handle(NVRAM_STORE)
> +#define RTAS_FN_POWER_OFF                         rtas_fn_handle(POWER_OFF)
> +#define RTAS_FN_PUT_TERM_CHAR                     rtas_fn_handle(PUT_TERM_CHAR)
> +#define RTAS_FN_QUERY_CPU_STOPPED_STATE           rtas_fn_handle(QUERY_CPU_STOPPED_STATE)
> +#define RTAS_FN_READ_PCI_CONFIG                   rtas_fn_handle(READ_PCI_CONFIG)
> +#define RTAS_FN_RTAS_LAST_ERROR                   rtas_fn_handle(RTAS_LAST_ERROR)
> +#define RTAS_FN_SET_INDICATOR                     rtas_fn_handle(SET_INDICATOR)
> +#define RTAS_FN_SET_POWER_LEVEL                   rtas_fn_handle(SET_POWER_LEVEL)
> +#define RTAS_FN_SET_TIME_FOR_POWER_ON             rtas_fn_handle(SET_TIME_FOR_POWER_ON)
> +#define RTAS_FN_SET_TIME_OF_DAY                   rtas_fn_handle(SET_TIME_OF_DAY)
> +#define RTAS_FN_START_CPU                         rtas_fn_handle(START_CPU)
> +#define RTAS_FN_STOP_SELF                         rtas_fn_handle(STOP_SELF)
> +#define RTAS_FN_SYSTEM_REBOOT                     rtas_fn_handle(SYSTEM_REBOOT)
> +#define RTAS_FN_THAW_TIME_BASE                    rtas_fn_handle(THAW_TIME_BASE)
> +#define RTAS_FN_WRITE_PCI_CONFIG                  rtas_fn_handle(WRITE_PCI_CONFIG)
> +
>  #define RTAS_UNKNOWN_SERVICE (-1)
>  #define RTAS_INSTANTIATE_MAX (1ULL<<30) /* Don't instantiate rtas at/above this value */
>  
> @@ -309,6 +402,11 @@ extern void (*rtas_flash_term_hook)(int);
>  
>  extern struct rtas_t rtas;
>  
> +s32 rtas_function_token(const rtas_fn_handle_t handle);
> +static inline bool rtas_function_implemented(const rtas_fn_handle_t handle)
> +{
> +	return rtas_function_token(handle) != RTAS_UNKNOWN_SERVICE;
> +}
>  extern int rtas_token(const char *service);
>  extern int rtas_service_present(const char *service);
>  extern int rtas_call(int token, int, int, int *, ...);
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index 41c430dc40c2..17e59306ce63 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -453,6 +453,26 @@ static struct rtas_function rtas_function_table[] __ro_after_init = {
>  	},
>  };
>  
> +/**
> + * rtas_function_token() - RTAS function token lookup.
> + * @handle: Function handle, e.g. RTAS_FN_EVENT_SCAN.
> + *
> + * Context: Any context.
> + * Return: the token value for the function if implemented by this platform,
> + *         otherwise RTAS_UNKNOWN_SERVICE.
> + */
> +s32 rtas_function_token(const rtas_fn_handle_t handle)
> +{
> +	const size_t index = handle.index;
> +	const bool out_of_bounds = index >= ARRAY_SIZE(rtas_function_table);
> +
> +	if (WARN_ONCE(out_of_bounds, "invalid function index %zu", index))
> +		return RTAS_UNKNOWN_SERVICE;

This needs:

+	// If RTAS is not present or not initialised (yet) return unknown
+	if (!rtas.dev)
+		return RTAS_UNKNOWN_SERVICE;
+

Otherwise powernv breaks because it looks up tokens and gets back 0,
because we never got as far as rtas_function_table_init() (to set all the
tokens to RTAS_UNKNOWN_SERVICE), because we bailed out at the start of
rtas_initialize() when we found no /rtas node.

> +	return rtas_function_table[index].token;
> +}
> +EXPORT_SYMBOL_GPL(rtas_function_token);
> +
>  static int rtas_function_cmp(const void *a, const void *b)
>  {
>  	const struct rtas_function *f1 = a;


cheers
