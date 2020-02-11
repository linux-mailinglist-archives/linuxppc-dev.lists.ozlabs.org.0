Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5D21589E8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 07:07:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48GskZ6Gc1zDqGP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 17:07:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=ZC5QCST5; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Gshl2B9lzDq9y
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2020 17:05:59 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48Gshf66Tgz9tx2s;
 Tue, 11 Feb 2020 07:05:54 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=ZC5QCST5; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id lYmW4uyak55x; Tue, 11 Feb 2020 07:05:54 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48Gshf4plGz9tx2k;
 Tue, 11 Feb 2020 07:05:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1581401154; bh=w2LNBLOz80mSk1zBQ9/hj5F5bzZFh/rtNt8mxdnL/p8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ZC5QCST5ZD6vjD89YUKIzed0JOkIeUYWLpVDkSXF9wFRdrxnCrZEnuHv01jfmwDw0
 L6Gzzh0pVXn44uSX8TpsCM8Zp5j+e6ucPqZKRF9hUzoa0wPd7yYxeyku6VcDyVolca
 mIMsih/BTXRkcdJf4yluWPabn8zbNYknrPZ0c0RU=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 749868B78A;
 Tue, 11 Feb 2020 07:05:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 1671euywGXaz; Tue, 11 Feb 2020 07:05:55 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 976338B776;
 Tue, 11 Feb 2020 07:05:54 +0100 (CET)
Subject: Re: [PATCH v2 04/13] powerpc sstep: Add support for prefixed
 load/stores
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200211053355.21574-1-jniethe5@gmail.com>
 <20200211053355.21574-5-jniethe5@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <340b5cda-49e3-854b-fc0d-4c3694dda03d@c-s.fr>
Date: Tue, 11 Feb 2020 07:05:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200211053355.21574-5-jniethe5@gmail.com>
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
Cc: bala24@linux.ibm.com, alistair@popple.id.au, mpe@ellerman.id.a,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 11/02/2020 à 06:33, Jordan Niethe a écrit :
> This adds emulation support for the following prefixed integer
> load/stores:
>    * Prefixed Load Byte and Zero (plbz)
>    * Prefixed Load Halfword and Zero (plhz)
>    * Prefixed Load Halfword Algebraic (plha)
>    * Prefixed Load Word and Zero (plwz)
>    * Prefixed Load Word Algebraic (plwa)
>    * Prefixed Load Doubleword (pld)
>    * Prefixed Store Byte (pstb)
>    * Prefixed Store Halfword (psth)
>    * Prefixed Store Word (pstw)
>    * Prefixed Store Doubleword (pstd)
>    * Prefixed Load Quadword (plq)
>    * Prefixed Store Quadword (pstq)
> 
> the follow prefixed floating-point load/stores:
>    * Prefixed Load Floating-Point Single (plfs)
>    * Prefixed Load Floating-Point Double (plfd)
>    * Prefixed Store Floating-Point Single (pstfs)
>    * Prefixed Store Floating-Point Double (pstfd)
> 
> and for the following prefixed VSX load/stores:
>    * Prefixed Load VSX Scalar Doubleword (plxsd)
>    * Prefixed Load VSX Scalar Single-Precision (plxssp)
>    * Prefixed Load VSX Vector [0|1]  (plxv, plxv0, plxv1)
>    * Prefixed Store VSX Scalar Doubleword (pstxsd)
>    * Prefixed Store VSX Scalar Single-Precision (pstxssp)
>    * Prefixed Store VSX Vector [0|1] (pstxv, pstxv0, pstxv1)
> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v2: - Combine all load/store patches
>      - Fix the name of Type 01 instructions
>      - Remove sign extension flag from pstd/pld
>      - Rename sufx -> suffix
> ---
>   arch/powerpc/lib/sstep.c | 165 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 165 insertions(+)
> 
> diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
> index 65143ab1bf64..0e21c21ff2be 100644
> --- a/arch/powerpc/lib/sstep.c
> +++ b/arch/powerpc/lib/sstep.c
> @@ -187,6 +187,44 @@ static nokprobe_inline unsigned long xform_ea(unsigned int instr,
>   	return ea;
>   }
>   
> +/*
> + * Calculate effective address for a MLS:D-form / 8LS:D-form
> + * prefixed instruction
> + */
> +static nokprobe_inline unsigned long mlsd_8lsd_ea(unsigned int instr,
> +						  unsigned int suffix,
> +						  const struct pt_regs *regs)
> +{
> +	int ra, prefix_r;
> +	unsigned int  dd;
> +	unsigned long ea, d0, d1, d;
> +
> +	prefix_r = instr & (1ul << 20);
> +	ra = (suffix >> 16) & 0x1f;
> +
> +	d0 = instr & 0x3ffff;
> +	d1 = suffix & 0xffff;
> +	d = (d0 << 16) | d1;
> +
> +	/*
> +	 * sign extend a 34 bit number
> +	 */
> +	dd = (unsigned int) (d >> 2);
> +	ea = (signed int) dd;
> +	ea = (ea << 2) | (d & 0x3);
> +
> +	if (!prefix_r && ra)
> +		ea += regs->gpr[ra];
> +	else if (!prefix_r && !ra)
> +		; /* Leave ea as is */
> +	else if (prefix_r && !ra)
> +		ea += regs->nip;
> +	else if (prefix_r && ra)
> +		; /* Invalid form. Should already be checked for by caller! */
> +
> +	return ea;
> +}
> +
>   /*
>    * Return the largest power of 2, not greater than sizeof(unsigned long),
>    * such that x is a multiple of it.
> @@ -1166,6 +1204,7 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>   		  unsigned int instr, unsigned int suffix)
>   {
>   	unsigned int opcode, ra, rb, rc, rd, spr, u;
> +	unsigned int suffixopcode, prefixtype, prefix_r;
>   	unsigned long int imm;
>   	unsigned long int val, val2;
>   	unsigned int mb, me, sh;
> @@ -2652,6 +2691,132 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>   
>   	}
>   
> +/*
> + * Prefixed instructions
> + */
> +	switch (opcode) {
> +	case 1:

Why not include it in the above switch () ?

Should it be enclosed by #ifdef __powerpc64__, or will this new ISA also 
apply to 32 bits processors ?

> +		prefix_r = instr & (1ul << 20);
> +		ra = (suffix >> 16) & 0x1f;
> +		op->update_reg = ra;
> +		rd = (suffix >> 21) & 0x1f;
> +		op->reg = rd;
> +		op->val = regs->gpr[rd];
> +
> +		suffixopcode = suffix >> 26;
> +		prefixtype = (instr >> 24) & 0x3;
> +		switch (prefixtype) {
> +		case 0: /* Type 00  Eight-Byte Load/Store */
> +			if (prefix_r && ra)
> +				break;
> +			op->ea = mlsd_8lsd_ea(instr, suffix, regs);
> +			switch (suffixopcode) {
> +			case 41:	/* plwa */
> +				op->type = MKOP(LOAD, PREFIXED | SIGNEXT, 4);
> +				break;
> +			case 42:        /* plxsd */
> +				op->reg = rd + 32;
> +				op->type = MKOP(LOAD_VSX, PREFIXED, 8);
> +				op->element_size = 8;
> +				op->vsx_flags = VSX_CHECK_VEC;
> +				break;
> +			case 43:	/* plxssp */
> +				op->reg = rd + 32;
> +				op->type = MKOP(LOAD_VSX, PREFIXED, 4);
> +				op->element_size = 8;
> +				op->vsx_flags = VSX_FPCONV | VSX_CHECK_VEC;
> +				break;
> +			case 46:	/* pstxsd */
> +				op->reg = rd + 32;
> +				op->type = MKOP(STORE_VSX, PREFIXED, 8);
> +				op->element_size = 8;
> +				op->vsx_flags = VSX_CHECK_VEC;
> +				break;
> +			case 47:	/* pstxssp */
> +				op->reg = rd + 32;
> +				op->type = MKOP(STORE_VSX, PREFIXED, 4);
> +				op->element_size = 8;
> +				op->vsx_flags = VSX_FPCONV | VSX_CHECK_VEC;
> +				break;
> +			case 51:	/* plxv1 */
> +				op->reg += 32;
> +
> +				/* fallthru */
> +			case 50:	/* plxv0 */
> +				op->type = MKOP(LOAD_VSX, PREFIXED, 16);
> +				op->element_size = 16;
> +				op->vsx_flags = VSX_CHECK_VEC;
> +				break;
> +			case 55:	/* pstxv1 */
> +				op->reg = rd + 32;
> +
> +				/* fallthru */
> +			case 54:	/* pstxv0 */
> +				op->type = MKOP(STORE_VSX, PREFIXED, 16);
> +				op->element_size = 16;
> +				op->vsx_flags = VSX_CHECK_VEC;
> +				break;
> +			case 56:        /* plq */
> +				op->type = MKOP(LOAD, PREFIXED, 16);
> +				break;
> +			case 57:	/* pld */
> +				op->type = MKOP(LOAD, PREFIXED, 8);
> +				break;
> +			case 60:        /* stq */
> +				op->type = MKOP(STORE, PREFIXED, 16);
> +				break;
> +			case 61:	/* pstd */
> +				op->type = MKOP(STORE, PREFIXED, 8);
> +				break;
> +			}
> +			break;
> +		case 1: /* Type 01 Eight-Byte Register-to-Register */
> +			break;
> +		case 2: /* Type 10 Modified Load/Store */
> +			if (prefix_r && ra)
> +				break;
> +			op->ea = mlsd_8lsd_ea(instr, suffix, regs);
> +			switch (suffixopcode) {
> +			case 32:	/* plwz */
> +				op->type = MKOP(LOAD, PREFIXED, 4);
> +				break;
> +			case 34:	/* plbz */
> +				op->type = MKOP(LOAD, PREFIXED, 1);
> +				break;
> +			case 36:	/* pstw */
> +				op->type = MKOP(STORE, PREFIXED, 4);
> +				break;
> +			case 38:	/* pstb */
> +				op->type = MKOP(STORE, PREFIXED, 1);
> +				break;
> +			case 40:	/* plhz */
> +				op->type = MKOP(LOAD, PREFIXED, 2);
> +				break;
> +			case 42:	/* plha */
> +				op->type = MKOP(LOAD, PREFIXED | SIGNEXT, 2);
> +				break;
> +			case 44:	/* psth */
> +				op->type = MKOP(STORE, PREFIXED, 2);
> +				break;
> +			case 48:        /* plfs */
> +				op->type = MKOP(LOAD_FP, PREFIXED | FPCONV, 4);
> +				break;
> +			case 50:        /* plfd */
> +				op->type = MKOP(LOAD_FP, PREFIXED, 8);
> +				break;
> +			case 52:        /* pstfs */
> +				op->type = MKOP(STORE_FP, PREFIXED | FPCONV, 4);
> +				break;
> +			case 54:        /* pstfd */
> +				op->type = MKOP(STORE_FP, PREFIXED, 8);
> +				break;
> +			}
> +			break;
> +		case 3: /* Type 11 Modified Register-to-Register */
> +			break;
> +		}
> +	}
> +
>   #ifdef CONFIG_VSX
>   	if ((GETTYPE(op->type) == LOAD_VSX ||
>   	     GETTYPE(op->type) == STORE_VSX) &&
> 

Christophe
