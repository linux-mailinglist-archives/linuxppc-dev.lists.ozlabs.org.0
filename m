Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F107F1DF1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 21:22:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bAtc4aPp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SYzTC5XV2z3dWP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 07:22:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bAtc4aPp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SYgGm1TnCz2xdf
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Nov 2023 19:12:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id C497AB80957;
	Mon, 20 Nov 2023 08:12:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96B9DC433C8;
	Mon, 20 Nov 2023 08:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700467949;
	bh=fSm7n8cRW/K3lFV5od+C+C7wrZdZtNiN4wLp6vV8QIA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bAtc4aPpsQLOHF1dl3/P9wnYVwkzPUsm02SQSLLp+UtaLXiTStZ1SnjHE12HRwKGH
	 INy9pWD/UH5k5fIWu6PRfqLml5D6SJPEvPe5sfMWqXTfVACpVkfkoiytyo27h64BH3
	 zn5/VHZwgxU1HTBvlIVQvHFR0yHO08G6/i3PEJ3QQUjBKegSbA69ONov2R0n3mumcy
	 T0EsUoe2fvKXenQbI5DPcZH9daTDrq+gb+xYNt7QL9TIBqqk8JA93+sJpHu5cME5XH
	 qqK1Z2gYBqnY3Gq3Rh6HkFKkAKiAWquWyg4MeKF2Zp04WhtjHPt+krd/VlCxLYDNWN
	 m6Ob6NsCtPnEA==
X-Mailer: emacs 29.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>
To: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 06/13] powerpc/rtas: Serialize firmware activation
 sequences
In-Reply-To: <20231117-papr-sys_rtas-vs-lockdown-v4-6-b794d8cb8502@linux.ibm.com>
References: <20231117-papr-sys_rtas-vs-lockdown-v4-0-b794d8cb8502@linux.ibm.com>
 <20231117-papr-sys_rtas-vs-lockdown-v4-6-b794d8cb8502@linux.ibm.com>
Date: Mon, 20 Nov 2023 13:42:22 +0530
Message-ID: <874jhglu6x.fsf@kernel.org>
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
> Use the function lock API to prevent interleaving call sequences of
> the ibm,activate-firmware RTAS function, which typically requires
> multiple calls to complete the update. While the spec does not
> specifically prohibit interleaved sequences, there's almost certainly
> no advantage to allowing them.
>

Can we document what is the equivalent thing the userspace does? 

Reviewed-by: Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>

> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> ---
>  arch/powerpc/kernel/rtas.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index 52f2242d0c28..e38ba05ad613 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -1753,10 +1753,14 @@ void rtas_activate_firmware(void)
>  		return;
>  	}
>  
> +	rtas_function_lock(RTAS_FN_IBM_ACTIVATE_FIRMWARE);
> +
>  	do {
>  		fwrc = rtas_call(token, 0, 1, NULL);
>  	} while (rtas_busy_delay(fwrc));
>  
> +	rtas_function_unlock(RTAS_FN_IBM_ACTIVATE_FIRMWARE);
> +
>  	if (fwrc)
>  		pr_err("ibm,activate-firmware failed (%i)\n", fwrc);
>  }
>
> -- 
> 2.41.0
