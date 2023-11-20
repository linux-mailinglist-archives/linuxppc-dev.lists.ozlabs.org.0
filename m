Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 778CA7F1DE8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 21:18:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IcSm+vWz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SYzNS2WtSz3ccN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 07:18:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IcSm+vWz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SYg913Jg0z2xWJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Nov 2023 19:07:33 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4014960DD9;
	Mon, 20 Nov 2023 08:07:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57818C433C7;
	Mon, 20 Nov 2023 08:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700467649;
	bh=g6apXNUF5vgaqLhFLZm3KNG/cN0AMYXL6d/Xt0KI65I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=IcSm+vWz5JnNGS18F720MOSOym7mtYIUzFjAjKpEAj5u0vXq2wSzNMso6Zjq+QmET
	 3TbnvEipSNvR18DG1tleqt3SQ9WiU0r6rfT1pwmo2czaXZa58KD8k44sdfSEcKuRYk
	 4yEJVb2Wbw9WArf4gK6st8qkDLV2FzQYJpoPNCax6RdjTXY9NuHHMWEEO8pdIc6lUm
	 RYyuouwTWZpMgKbAKn/AOKQ5fDFBG0UyStql5GzoTBDGHK0RakYG1Ci7kOizyByJbL
	 fsJhX/UQaR4s8EM3mbOOSjR9Masxac1WBlu5N+B9tUm7vBqPvaQGCZ3bXc4wMJMxYT
	 3DdagtD2nSwHw==
X-Mailer: emacs 29.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>
To: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 01/13] powerpc/rtas: Add for_each_rtas_function()
 iterator
In-Reply-To: <20231117-papr-sys_rtas-vs-lockdown-v4-1-b794d8cb8502@linux.ibm.com>
References: <20231117-papr-sys_rtas-vs-lockdown-v4-0-b794d8cb8502@linux.ibm.com>
 <20231117-papr-sys_rtas-vs-lockdown-v4-1-b794d8cb8502@linux.ibm.com>
Date: Mon, 20 Nov 2023 13:37:06 +0530
Message-ID: <87leaslufp.fsf@kernel.org>
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
> Add a convenience macro for iterating over every element of the
> internal function table and convert the one site that can use it. An
> additional user of the macro is anticipated in changes to follow.
>

Reviewed-by: Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>

> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> ---
>  arch/powerpc/kernel/rtas.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index eddc031c4b95..1ad1869e2e96 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -454,6 +454,11 @@ static struct rtas_function rtas_function_table[] __ro_after_init = {
>  	},
>  };
>  
> +#define for_each_rtas_function(funcp)                                       \
> +	for (funcp = &rtas_function_table[0];                               \
> +	     funcp < &rtas_function_table[ARRAY_SIZE(rtas_function_table)]; \
> +	     ++funcp)
> +
>  /*
>   * Nearly all RTAS calls need to be serialized. All uses of the
>   * default rtas_args block must hold rtas_lock.
> @@ -525,10 +530,10 @@ static DEFINE_XARRAY(rtas_token_to_function_xarray);
>  
>  static int __init rtas_token_to_function_xarray_init(void)
>  {
> +	const struct rtas_function *func;
>  	int err = 0;
>  
> -	for (size_t i = 0; i < ARRAY_SIZE(rtas_function_table); ++i) {
> -		const struct rtas_function *func = &rtas_function_table[i];
> +	for_each_rtas_function(func) {
>  		const s32 token = func->token;
>  
>  		if (token == RTAS_UNKNOWN_SERVICE)
>
> -- 
> 2.41.0
