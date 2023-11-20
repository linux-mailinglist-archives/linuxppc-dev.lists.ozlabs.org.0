Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA007F1DE9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 21:19:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aCqghi4j;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SYzPN3mNFz3cN3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 07:19:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aCqghi4j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SYg9j0J35z3cM5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Nov 2023 19:08:09 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 366D460F8C;
	Mon, 20 Nov 2023 08:08:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4930EC433C9;
	Mon, 20 Nov 2023 08:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700467686;
	bh=mmRV9QZpg7A1c/LOpJuuV2xhWtZOmQacu/whLJikIxo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=aCqghi4jzNUhY1JhZbQ12B4TQCA0XKBNLqjTB8ePY9ZsAzWcJKHvAWNO/LOkC1H1F
	 nr0UWsRVFbi+Uq4Th+DE4XmxI4riIteQrXrs6MXrA3y345mEkCDIekm+J/1kim9xwp
	 aNoJEEGiKEP1gV4964mJUC69KuAv4uXXM/NNiTsJD1X1OAyf/O8H1GytTXtNDwAP5h
	 wbBkB19nVUk85bG6QtwFSDY7U2r0qv03XbI7KggUlCSW5sjGjuZNILFHg3QAYUYYui
	 dMOjP9Tmi4Q+0RYZj7R+G3wT/cyRCr9I7tFTUyX5a2ejoaS1AcmvM7JpPctbge7aKt
	 eF6KFYALM6CYw==
X-Mailer: emacs 29.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>
To: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 02/13] powerpc/rtas: Fall back to linear search on
 failed token->function lookup
In-Reply-To: <20231117-papr-sys_rtas-vs-lockdown-v4-2-b794d8cb8502@linux.ibm.com>
References: <20231117-papr-sys_rtas-vs-lockdown-v4-0-b794d8cb8502@linux.ibm.com>
 <20231117-papr-sys_rtas-vs-lockdown-v4-2-b794d8cb8502@linux.ibm.com>
Date: Mon, 20 Nov 2023 13:37:59 +0530
Message-ID: <87il5wlue8.fsf@kernel.org>
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
> Enabling any of the powerpc:rtas_* tracepoints at boot is likely to
> result in an oops on RTAS platforms. For example, booting a QEMU
> pseries model with 'trace_event=powerpc:rtas_input' in the command
> line leads to:
>
>   BUG: Kernel NULL pointer dereference on read at 0x00000008
>   Oops: Kernel access of bad area, sig: 7 [#1]
>   NIP [c00000000004231c] do_enter_rtas+0x1bc/0x460
>   LR [c00000000004231c] do_enter_rtas+0x1bc/0x460
>   Call Trace:
>     do_enter_rtas+0x1bc/0x460 (unreliable)
>     rtas_call+0x22c/0x4a0
>     rtas_get_boot_time+0x80/0x14c
>     read_persistent_clock64+0x124/0x150
>     read_persistent_wall_and_boot_offset+0x28/0x58
>     timekeeping_init+0x70/0x348
>     start_kernel+0xa0c/0xc1c
>     start_here_common+0x1c/0x20
>
> (This is preceded by a warning for the failed lookup in
> rtas_token_to_function().)
>
> This happens when __do_enter_rtas_trace() attempts a token to function
> descriptor lookup before the xarray containing the mappings has been
> set up.
>
> Fall back to linear scan of the table if rtas_token_to_function_xarray
> is empty.
>

Reviewed-by: Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>

> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> Fixes: 24098f580e2b ("powerpc/rtas: add tracepoints around RTAS entry")
> ---
>  arch/powerpc/kernel/rtas.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index 1ad1869e2e96..f0051881348a 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -557,11 +557,21 @@ static const struct rtas_function *rtas_token_to_function(s32 token)
>  		return NULL;
>  
>  	func = xa_load(&rtas_token_to_function_xarray, token);
> +	if (func)
> +		return func;
> +	/*
> +	 * Fall back to linear scan in case the reverse mapping hasn't
> +	 * been initialized yet.
> +	 */
> +	if (xa_empty(&rtas_token_to_function_xarray)) {
> +		for_each_rtas_function(func) {
> +			if (func->token == token)
> +				return func;
> +		}
> +	}
>  
> -	if (WARN_ONCE(!func, "unexpected failed lookup for token %d", token))
> -		return NULL;
> -
> -	return func;
> +	WARN_ONCE(true, "unexpected failed lookup for token %d", token);
> +	return NULL;
>  }
>  
>  /* This is here deliberately so it's only used in this file */
>
> -- 
> 2.41.0
