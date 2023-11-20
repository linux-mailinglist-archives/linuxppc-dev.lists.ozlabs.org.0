Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FD47F1DF8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 21:23:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m7cZ1/Pt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SYzV770twz3cZx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 07:23:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=m7cZ1/Pt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SYgHy3HLVz2yV3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Nov 2023 19:13:34 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 84D5160E33;
	Mon, 20 Nov 2023 08:13:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19F46C433C8;
	Mon, 20 Nov 2023 08:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700468011;
	bh=ari9wo1XoYun0yaKy/tdlcuFpG5Hb73YARYEbigpow0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=m7cZ1/PtAIKryeYVcTq42sf/MhlONMsblo9pv71Jkv4YvDgI0kPuds8fiDHsHz8GO
	 elCLSnO4WuAeTSXXdwWNLAjSXtJbDNnRRJekTyeCDczOXs/xuhB5h5UhUGqOflDILP
	 DiQCPvVYOPRAnJPICcuGPVzUkPlVHPUnKf89TY6FHAvhwpDPdwzPwCifpoQOdybucj
	 eRnCnL/q/V4RJmIncmLfK4E+urmpeHMclqtm5Z2vzUyC1BKdms10QBQ0kRdw13P8zW
	 eUI3yHcMDbRTh4YGx/Nz8RURnFmKmWOl9YOR69pYBj/vrQCkiaFARarMyqAmTFxIBy
	 TTrWCflpeex3A==
X-Mailer: emacs 29.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>
To: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 07/13] powerpc/rtas: Warn if per-function lock isn't
 held
In-Reply-To: <20231117-papr-sys_rtas-vs-lockdown-v4-7-b794d8cb8502@linux.ibm.com>
References: <20231117-papr-sys_rtas-vs-lockdown-v4-0-b794d8cb8502@linux.ibm.com>
 <20231117-papr-sys_rtas-vs-lockdown-v4-7-b794d8cb8502@linux.ibm.com>
Date: Mon, 20 Nov 2023 13:43:24 +0530
Message-ID: <871qcklu57.fsf@kernel.org>
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
> If the function descriptor has a populated lock member, then callers
> are required to hold it across calls. Now that the firmware activation
> sequence is appropriately guarded, we can warn when the requirement
> isn't satisfied.
>
> __do_enter_rtas_trace() gets reorganized a bit as a result of
> performing the function descriptor lookup unconditionally now.
>

Reviewed-by: Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>

> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> ---
>  arch/powerpc/kernel/rtas.c | 21 +++++++++------------
>  1 file changed, 9 insertions(+), 12 deletions(-)
>
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index e38ba05ad613..deb6289fcf9c 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -685,28 +685,25 @@ static void __do_enter_rtas(struct rtas_args *args)
>  
>  static void __do_enter_rtas_trace(struct rtas_args *args)
>  {
> -	const char *name = NULL;
> +	struct rtas_function *func = rtas_token_to_function(be32_to_cpu(args->token));
>  
> -	if (args == &rtas_args)
> -		lockdep_assert_held(&rtas_lock);
>  	/*
> -	 * If the tracepoints that consume the function name aren't
> -	 * active, avoid the lookup.
> +	 * If there is a per-function lock, it must be held by the
> +	 * caller.
>  	 */
> -	if ((trace_rtas_input_enabled() || trace_rtas_output_enabled())) {
> -		const s32 token = be32_to_cpu(args->token);
> -		const struct rtas_function *func = rtas_token_to_function(token);
> +	if (func->lock)
> +		WARN_ON(!mutex_is_locked(func->lock));
>  
> -		name = func->name;
> -	}
> +	if (args == &rtas_args)
> +		lockdep_assert_held(&rtas_lock);
>  
> -	trace_rtas_input(args, name);
> +	trace_rtas_input(args, func->name);
>  	trace_rtas_ll_entry(args);
>  
>  	__do_enter_rtas(args);
>  
>  	trace_rtas_ll_exit(args);
> -	trace_rtas_output(args, name);
> +	trace_rtas_output(args, func->name);
>  }
>  
>  static void do_enter_rtas(struct rtas_args *args)
>
> -- 
> 2.41.0
