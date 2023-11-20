Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 680267F1DEE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 21:20:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OMp+2p7o;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SYzRD2HdRz3dRV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 07:20:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OMp+2p7o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SYgBW42qsz2xX4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Nov 2023 19:08:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F29DF60DD9;
	Mon, 20 Nov 2023 08:08:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29538C433C7;
	Mon, 20 Nov 2023 08:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700467728;
	bh=lkGJbBhzt4uBoIEMuq5X2qrIOhM5VgUvh4+hyROkw9A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OMp+2p7oPr4+Ivv3JiTjS8x3oAMmd/U4xhpFonJtU9e6W4lYXLNK7qwIi7UMS4G7v
	 17X7lSLGmp1aOiuTcz8NIR6fG4q5ue4Uo9bUmauVuZU+jcI8RVP1m5EHZMll6rH7qA
	 CFp5csv4b4Au1Kh0/7Svp0BiBdrMT0iauSTkZnLvVWSafXVWzinRyvgFsZS1ferO6w
	 0WKoR+j/Pt7eqTqcFfMtRA/v8KREmGQZxYIfjEosZimbSyGLBrqSBf9az0chXPfwTV
	 II03RcSCz1xzWHJqP2IZZWOXe3PbUp3NYfGqsxsUI3tYSq9NTTIaezEkdk6wQUom6m
	 IJl2Gv2Em6cWQ==
X-Mailer: emacs 29.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>
To: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 04/13] powerpc/rtas: Factor out function descriptor
 lookup
In-Reply-To: <20231117-papr-sys_rtas-vs-lockdown-v4-4-b794d8cb8502@linux.ibm.com>
References: <20231117-papr-sys_rtas-vs-lockdown-v4-0-b794d8cb8502@linux.ibm.com>
 <20231117-papr-sys_rtas-vs-lockdown-v4-4-b794d8cb8502@linux.ibm.com>
Date: Mon, 20 Nov 2023 13:38:41 +0530
Message-ID: <87cyw4lud2.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Tue, 21 Nov 2023 07:17:50 +1100
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, tyreld@linux.ibm.com, Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
writes:

> From: Nathan Lynch <nathanl@linux.ibm.com>
>
> Move the function descriptor table lookup out of rtas_function_token()
> into a separate routine for use in new code to follow. No functional
> change.
>

Reviewed-by: Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>

> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> ---
>  arch/powerpc/kernel/rtas.c | 31 +++++++++++++++++++------------
>  1 file changed, 19 insertions(+), 12 deletions(-)
>
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index f0051881348a..1fc0b3fffdd1 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -469,29 +469,36 @@ static struct rtas_function rtas_function_table[] __ro_after_init = {
>  static DEFINE_RAW_SPINLOCK(rtas_lock);
>  static struct rtas_args rtas_args;
>  
> -/**
> - * rtas_function_token() - RTAS function token lookup.
> - * @handle: Function handle, e.g. RTAS_FN_EVENT_SCAN.
> - *
> - * Context: Any context.
> - * Return: the token value for the function if implemented by this platform,
> - *         otherwise RTAS_UNKNOWN_SERVICE.
> - */
> -s32 rtas_function_token(const rtas_fn_handle_t handle)
> +static struct rtas_function *rtas_function_lookup(const rtas_fn_handle_t handle)
>  {
>  	const size_t index = handle.index;
>  	const bool out_of_bounds = index >= ARRAY_SIZE(rtas_function_table);
>  
>  	if (WARN_ONCE(out_of_bounds, "invalid function index %zu", index))
> -		return RTAS_UNKNOWN_SERVICE;
> +		return NULL;
>  	/*
>  	 * Various drivers attempt token lookups on non-RTAS
>  	 * platforms.
>  	 */
>  	if (!rtas.dev)
> -		return RTAS_UNKNOWN_SERVICE;
> +		return NULL;
> +
> +	return &rtas_function_table[index];
> +}
> +
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
> +	const struct rtas_function *func = rtas_function_lookup(handle);
>  
> -	return rtas_function_table[index].token;
> +	return func ? func->token : RTAS_UNKNOWN_SERVICE;
>  }
>  EXPORT_SYMBOL_GPL(rtas_function_token);
>  
>
> -- 
> 2.41.0
