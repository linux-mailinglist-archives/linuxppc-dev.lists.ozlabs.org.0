Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBC6FC4A2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 11:49:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DJBZ1tv6zF7S5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 21:49:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DGKB27WWzF7RD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 20:24:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="dT+kTu6+"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47DGK86mv8z9s7T;
 Thu, 14 Nov 2019 20:24:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1573723485;
 bh=Dq7NW4klV4GxHT1oNqdnPAGrN68C+hoVfrP2Pb0IXcs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=dT+kTu6+/7TIMNxlEx1NDQPpULL2+1zfqJ+NHNsr7R31lqunFGgaL3emKJ6s8u5CL
 QYjFXnpzEg+8t5UF1g1VJPPMczqTpGmfb6CI8Y0FmeXPjS6A4GiDKRQCheG08f8ppb
 ihU47C4OvatTXUjjTtw95ACCJjoaTkDhHDi5lXLkUbj490cPMgrNGH9+Gx5bYBSjkb
 +6mi2t3QOty39wiT9BugiOXMKmuBjwaa56STR2a76ZTnXicXFLLSq/uyvU/SmtX+aq
 Wqp2EUOGhtXw0Zhckr05x1oovqMnrZgtaV5JJw2PS/Ffkg1Q+mRt9UMDU207AP9lbb
 OBdQsF4GuVMKA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, ravi.bangoria@linux.ibm.com
Subject: Re: [PATCH 2/2] powerpc/hw_breakpoints: Rewrite 8xx breakpoints to
 allow any address range size.
In-Reply-To: <1ed0de54ce6021fa0fdf50e938365546a4f5e316.1566925030.git.christophe.leroy@c-s.fr>
References: <b1142845c040b9702d1609d5ec473d97595dc0c3.1566925029.git.christophe.leroy@c-s.fr>
 <1ed0de54ce6021fa0fdf50e938365546a4f5e316.1566925030.git.christophe.leroy@c-s.fr>
Date: Thu, 14 Nov 2019 20:24:41 +1100
Message-ID: <87zhgyzu7a.fsf@mpe.ellerman.id.au>
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

Christophe Leroy <christophe.leroy@c-s.fr> writes:
> Unlike standard powerpc, Powerpc 8xx doesn't have SPRN_DABR, but
> it has a breakpoint support based on a set of comparators which
> allow more flexibility.
>
> Commit 4ad8622dc548 ("powerpc/8xx: Implement hw_breakpoint")
> implemented breakpoints by emulating the DABR behaviour. It did
> this by setting one comparator the match 4 bytes at breakpoint address
> and the other comparator to match 4 bytes at breakpoint address + 4.
>
> Rewrite 8xx hw_breakpoint to make breakpoints match all addresses
> defined by the breakpoint address and length by making full use of
> comparators.
>
> Now, comparator E is set to match any address greater than breakpoint
> address minus one. Comparator F is set to match any address lower than
> breakpoint address plus breakpoint length.
>
> When the breakpoint range starts at address 0, the breakpoint is set
> to match comparator F only. When the breakpoint range end at address
> 0xffffffff, the breakpoint is set to match comparator E only.
> Otherwise the breakpoint is set to match comparator E and F.
>
> At the same time, use registers bit names instead of hardcode values.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/reg_8xx.h  | 14 ++++++++++
>  arch/powerpc/kernel/hw_breakpoint.c |  3 ++
>  arch/powerpc/kernel/process.c       | 55 ++++++++++++++++++++++---------------
>  3 files changed, 50 insertions(+), 22 deletions(-)

I thought Ravi was going to pick this up in his series, but seems not.
So now this no longer applies since I merged that series.

Can one of you rebase and resend please?

cheers

> diff --git a/arch/powerpc/include/asm/reg_8xx.h b/arch/powerpc/include/asm/reg_8xx.h
> index abc663c0f1db..98e97c22df8b 100644
> --- a/arch/powerpc/include/asm/reg_8xx.h
> +++ b/arch/powerpc/include/asm/reg_8xx.h
> @@ -37,7 +37,21 @@
>  #define SPRN_CMPE	152
>  #define SPRN_CMPF	153
>  #define SPRN_LCTRL1	156
> +#define   LCTRL1_CTE_GT		0xc0000000
> +#define   LCTRL1_CTF_LT		0x14000000
> +#define   LCTRL1_CRWE_RW	0x00000000
> +#define   LCTRL1_CRWE_RO	0x00040000
> +#define   LCTRL1_CRWE_WO	0x000c0000
> +#define   LCTRL1_CRWF_RW	0x00000000
> +#define   LCTRL1_CRWF_RO	0x00010000
> +#define   LCTRL1_CRWF_WO	0x00030000
>  #define SPRN_LCTRL2	157
> +#define   LCTRL2_LW0EN		0x80000000
> +#define   LCTRL2_LW0LA_E	0x00000000
> +#define   LCTRL2_LW0LA_F	0x04000000
> +#define   LCTRL2_LW0LA_EandF	0x08000000
> +#define   LCTRL2_LW0LADC	0x02000000
> +#define   LCTRL2_SLW0EN		0x00000002
>  #ifdef CONFIG_PPC_8xx
>  #define SPRN_ICTRL	158
>  #endif
> diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
> index 28ad3171bb82..d8bd4dbef561 100644
> --- a/arch/powerpc/kernel/hw_breakpoint.c
> +++ b/arch/powerpc/kernel/hw_breakpoint.c
> @@ -163,6 +163,9 @@ int hw_breakpoint_arch_parse(struct perf_event *bp,
>  	 */
>  	if (!ppc_breakpoint_available())
>  		return -ENODEV;
> +	/* 8xx can setup a range without limitation */
> +	if (IS_ENABLED(CONFIG_PPC_8xx))
> +		return 0;
>  	length_max = 8; /* DABR */
>  	if (dawr_enabled()) {
>  		length_max = 512 ; /* 64 doublewords */
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index 8fc4de0d22b4..79e4f072a746 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -751,28 +751,6 @@ static inline int __set_dabr(unsigned long dabr, unsigned long dabrx)
>  		mtspr(SPRN_DABRX, dabrx);
>  	return 0;
>  }
> -#elif defined(CONFIG_PPC_8xx)
> -static inline int __set_dabr(unsigned long dabr, unsigned long dabrx)
> -{
> -	unsigned long addr = dabr & ~HW_BRK_TYPE_DABR;
> -	unsigned long lctrl1 = 0x90000000; /* compare type: equal on E & F */
> -	unsigned long lctrl2 = 0x8e000002; /* watchpoint 1 on cmp E | F */
> -
> -	if ((dabr & HW_BRK_TYPE_RDWR) == HW_BRK_TYPE_READ)
> -		lctrl1 |= 0xa0000;
> -	else if ((dabr & HW_BRK_TYPE_RDWR) == HW_BRK_TYPE_WRITE)
> -		lctrl1 |= 0xf0000;
> -	else if ((dabr & HW_BRK_TYPE_RDWR) == 0)
> -		lctrl2 = 0;
> -
> -	mtspr(SPRN_LCTRL2, 0);
> -	mtspr(SPRN_CMPE, addr);
> -	mtspr(SPRN_CMPF, addr + 4);
> -	mtspr(SPRN_LCTRL1, lctrl1);
> -	mtspr(SPRN_LCTRL2, lctrl2);
> -
> -	return 0;
> -}
>  #else
>  static inline int __set_dabr(unsigned long dabr, unsigned long dabrx)
>  {
> @@ -793,6 +771,37 @@ static inline int set_dabr(struct arch_hw_breakpoint *brk)
>  	return __set_dabr(dabr, dabrx);
>  }
>  
> +static inline int set_breakpoint_8xx(struct arch_hw_breakpoint *brk)
> +{
> +	unsigned long lctrl1 = LCTRL1_CTE_GT | LCTRL1_CTF_LT | LCTRL1_CRWE_RW |
> +			       LCTRL1_CRWF_RW;
> +	unsigned long lctrl2 = LCTRL2_LW0EN | LCTRL2_LW0LADC | LCTRL2_SLW0EN;
> +
> +	if (brk->address == 0)
> +		lctrl2 |= LCTRL2_LW0LA_F;
> +	else if (brk->address + brk->len == 0)
> +		lctrl2 |= LCTRL2_LW0LA_E;
> +	else
> +		lctrl2 |= LCTRL2_LW0LA_EandF;
> +
> +	mtspr(SPRN_LCTRL2, 0);
> +
> +	if ((brk->type & HW_BRK_TYPE_RDWR) == 0)
> +		return 0;
> +
> +	if ((brk->type & HW_BRK_TYPE_RDWR) == HW_BRK_TYPE_READ)
> +		lctrl1 |= LCTRL1_CRWE_RO | LCTRL1_CRWF_RO;
> +	if ((brk->type & HW_BRK_TYPE_RDWR) == HW_BRK_TYPE_WRITE)
> +		lctrl1 |= LCTRL1_CRWE_WO | LCTRL1_CRWF_WO;
> +
> +	mtspr(SPRN_CMPE, brk->address - 1);
> +	mtspr(SPRN_CMPF, brk->address + brk->len);
> +	mtspr(SPRN_LCTRL1, lctrl1);
> +	mtspr(SPRN_LCTRL2, lctrl2);
> +
> +	return 0;
> +}
> +
>  void __set_breakpoint(struct arch_hw_breakpoint *brk)
>  {
>  	memcpy(this_cpu_ptr(&current_brk), brk, sizeof(*brk));
> @@ -800,6 +809,8 @@ void __set_breakpoint(struct arch_hw_breakpoint *brk)
>  	if (dawr_enabled())
>  		// Power8 or later
>  		set_dawr(brk);
> +	else if (IS_ENABLED(CONFIG_PPC_8xx))
> +		set_breakpoint_8xx(brk);
>  	else if (!cpu_has_feature(CPU_FTR_ARCH_207S))
>  		// Power7 or earlier
>  		set_dabr(brk);
> -- 
> 2.13.3
