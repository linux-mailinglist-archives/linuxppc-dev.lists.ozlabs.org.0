Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CC1E9AA7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 12:20:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4735bT15bBzF46D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 22:20:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4735XT4fGhzF43Y
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 22:17:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="RrWboUUZ"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4735XS6vJBz8t0w
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 22:17:44 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4735XS6NJkz9sPd; Wed, 30 Oct 2019 22:17:44 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="RrWboUUZ"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4735XR6WZwz9sP3
 for <linuxppc-dev@ozlabs.org>; Wed, 30 Oct 2019 22:17:42 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4735XL061Nz9vC14;
 Wed, 30 Oct 2019 12:17:38 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=RrWboUUZ; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 8oLoA8iLo8_S; Wed, 30 Oct 2019 12:17:37 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4735XK697qz9vC12;
 Wed, 30 Oct 2019 12:17:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1572434257; bh=G8bQ4IoWdLpGydX+AaY9b3CtO9lASyHxISoKBUDy3LQ=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=RrWboUUZ8akgy1hwEAhhgqFKNTIlUMJDdtfY/Yr7yfxM9wsDdVvnV3cTOsdM1o1Qw
 pNzm5CyH2ORYQSdmhgjXsjqqIlcTCdasKpRPCDALQ58SnjyDfmtbyS1lNfJ8HSiE5U
 1ryCgMQX/1DNsNxxOAOLqPU5LeX/wKZB6XVA75K0=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EE4678B7C8;
 Wed, 30 Oct 2019 12:17:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Wy_FjYxV8Mac; Wed, 30 Oct 2019 12:17:38 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8A70A8B7C7;
 Wed, 30 Oct 2019 12:17:38 +0100 (CET)
Subject: Re: [PATCH] powerpc: Add build-time check of ptrace PT_xx defines
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
References: <20191030111231.22720-1-mpe@ellerman.id.au>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <5e5533f8-aef6-18bd-d810-8d00cfbbb175@c-s.fr>
Date: Wed, 30 Oct 2019 12:17:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191030111231.22720-1-mpe@ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 30/10/2019 à 12:12, Michael Ellerman a écrit :
> As part of the uapi we export a lot of PT_xx defines for each register
> in struct pt_regs. These are expressed as an index from gpr[0], in
> units of unsigned long.
> 
> Currently there's nothing tying the values of those defines to the
> actual layout of the struct.
> 
> But we *don't* want to change the uapi defines to derive the PT_xx
> values based on the layout of the struct, those values are ABI and
> must never change.
> 
> Instead we want to do the reverse, make sure that the layout of the
> struct never changes vs the PT_xx defines. So add build time checks of
> that.
> 
> This probably seems paranoid, but at least once in the past someone
> has sent a patch that would have broken the ABI if it hadn't been
> spotted. Although it probably would have been detected via testing,
> it's preferable to just quash any issues at the source.

While you are playing with pt_regs_check(), could you also take the 
patch from Mathieu https://patchwork.ozlabs.org/patch/1009816/ ?

Christophe

> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>   arch/powerpc/kernel/ptrace.c | 63 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 63 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/ptrace.c b/arch/powerpc/kernel/ptrace.c
> index 8c92febf5f44..abd888bada03 100644
> --- a/arch/powerpc/kernel/ptrace.c
> +++ b/arch/powerpc/kernel/ptrace.c
> @@ -3398,4 +3398,67 @@ void __init pt_regs_check(void)
>   		     offsetof(struct user_pt_regs, result));
>   
>   	BUILD_BUG_ON(sizeof(struct user_pt_regs) > sizeof(struct pt_regs));
> +
> +	// Now check that the pt_regs offsets match the uapi #defines
> +	#define CHECK_REG(_pt, _reg) \
> +		BUILD_BUG_ON(_pt != (offsetof(struct user_pt_regs, _reg) / \
> +				     sizeof(unsigned long)));
> +
> +	CHECK_REG(PT_R0,  gpr[0]);
> +	CHECK_REG(PT_R1,  gpr[1]);
> +	CHECK_REG(PT_R2,  gpr[2]);
> +	CHECK_REG(PT_R3,  gpr[3]);
> +	CHECK_REG(PT_R4,  gpr[4]);
> +	CHECK_REG(PT_R5,  gpr[5]);
> +	CHECK_REG(PT_R6,  gpr[6]);
> +	CHECK_REG(PT_R7,  gpr[7]);
> +	CHECK_REG(PT_R8,  gpr[8]);
> +	CHECK_REG(PT_R9,  gpr[9]);
> +	CHECK_REG(PT_R10, gpr[10]);
> +	CHECK_REG(PT_R11, gpr[11]);
> +	CHECK_REG(PT_R12, gpr[12]);
> +	CHECK_REG(PT_R13, gpr[13]);
> +	CHECK_REG(PT_R14, gpr[14]);
> +	CHECK_REG(PT_R15, gpr[15]);
> +	CHECK_REG(PT_R16, gpr[16]);
> +	CHECK_REG(PT_R17, gpr[17]);
> +	CHECK_REG(PT_R18, gpr[18]);
> +	CHECK_REG(PT_R19, gpr[19]);
> +	CHECK_REG(PT_R20, gpr[20]);
> +	CHECK_REG(PT_R21, gpr[21]);
> +	CHECK_REG(PT_R22, gpr[22]);
> +	CHECK_REG(PT_R23, gpr[23]);
> +	CHECK_REG(PT_R24, gpr[24]);
> +	CHECK_REG(PT_R25, gpr[25]);
> +	CHECK_REG(PT_R26, gpr[26]);
> +	CHECK_REG(PT_R27, gpr[27]);
> +	CHECK_REG(PT_R28, gpr[28]);
> +	CHECK_REG(PT_R29, gpr[29]);
> +	CHECK_REG(PT_R30, gpr[30]);
> +	CHECK_REG(PT_R31, gpr[31]);
> +	CHECK_REG(PT_NIP, nip);
> +	CHECK_REG(PT_MSR, msr);
> +	CHECK_REG(PT_ORIG_R3, orig_gpr3);
> +	CHECK_REG(PT_CTR, ctr);
> +	CHECK_REG(PT_LNK, link);
> +	CHECK_REG(PT_XER, xer);
> +	CHECK_REG(PT_CCR, ccr);
> +#ifdef CONFIG_PPC64
> +	CHECK_REG(PT_SOFTE, softe);
> +#else
> +	CHECK_REG(PT_MQ, mq);
> +#endif
> +	CHECK_REG(PT_TRAP, trap);
> +	CHECK_REG(PT_DAR, dar);
> +	CHECK_REG(PT_DSISR, dsisr);
> +	CHECK_REG(PT_RESULT, result);
> +	#undef CHECK_REG
> +
> +	BUILD_BUG_ON(PT_REGS_COUNT != sizeof(struct user_pt_regs) / sizeof(unsigned long));
> +
> +	/*
> +	 * PT_DSCR isn't a real reg, but it's important that it doesn't overlap the
> +	 * real registers.
> +	 */
> +	BUILD_BUG_ON(PT_DSCR < sizeof(struct user_pt_regs) / sizeof(unsigned long));
>   }
> 
