Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B194D3F8133
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 05:42:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gw7vV4P6gz2yP5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 13:42:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=jIpmv8UV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=jIpmv8UV; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gw7ts4lCxz2xrt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Aug 2021 13:41:41 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gw7tq63LGz9sWc;
 Thu, 26 Aug 2021 13:41:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1629949299;
 bh=DOw2l6Jda3DqQNHFGaITrApyDjSMpEMLIntdf1DiSP0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=jIpmv8UVeu5dr3PjzdyCas29MtHm7Yh99AmOc530xFwa+L1Oi5y3jCO+qO+rtvYsL
 q0l5hw6pemI8mYmn7qn7j3p/GSU1rx0jDZdoyTOnHNw2M7k0D+ofKnKiYL966IwrF+
 wBwwmE3j/otN99PTlnegLwg5bKJvDTByqGf1gploLvZoMVyX47jxlorPSjdyfvZdwq
 kQtVesz74C6ZCYkwlam0vHnvUbHB2X1vns0QKCBLwqA91lMuJ7X2hl1Kd7SuvI+n6I
 W39d3/5e4GPl5ljXmTt5db9z2hh6WRytOWWWw8ictlESSmv59W4iTjcpN+BaCXZgMk
 H4cS5GIbCU/Dg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH] powerpc: Make set_endian() return EINVAL when not
 supporting little endian
In-Reply-To: <b29c29d205737a833262df38e01c07139f1c3dec.1629899011.git.christophe.leroy@csgroup.eu>
References: <b29c29d205737a833262df38e01c07139f1c3dec.1629899011.git.christophe.leroy@csgroup.eu>
Date: Thu, 26 Aug 2021 13:41:39 +1000
Message-ID: <87bl5kc1os.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> There is no point in modifying MSR_LE bit on CPUs not supporting
> little endian.

Isn't that an ABI break?

set_endian(PR_ENDIAN_BIG) should work on a big endian CPU, even if it
does nothing useful.

cheers

> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index 185beb290580..b2b9919795a2 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -1995,6 +1995,10 @@ int set_endian(struct task_struct *tsk, unsigned int val)
>  {
>  	struct pt_regs *regs = tsk->thread.regs;
>  
> +	if (!cpu_has_feature(CPU_FTR_PPC_LE) &&
> +	    !cpu_has_feature(CPU_FTR_REAL_LE))
> +		return -EINVAL;
> +
>  	if ((val == PR_ENDIAN_LITTLE && !cpu_has_feature(CPU_FTR_REAL_LE)) ||
>  	    (val == PR_ENDIAN_PPC_LITTLE && !cpu_has_feature(CPU_FTR_PPC_LE)))
>  		return -EINVAL;
> -- 
> 2.25.0
