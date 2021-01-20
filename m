Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 641172FD501
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 17:11:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLVrK3ZdhzDqBt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 03:11:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLVpC0HPlzDqgS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 03:09:22 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 75401AB7F;
 Wed, 20 Jan 2021 16:09:19 +0000 (UTC)
Date: Wed, 20 Jan 2021 17:09:18 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>
Subject: Re: [PATCH v3] [PATCH] powerpc/sstep: Check ISA 3.0 instruction
 validity before emulation
Message-ID: <20210120160918.GV6564@kitsune.suse.cz>
References: <161114113785.214433.12934683302522893921.stgit@thinktux.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <161114113785.214433.12934683302522893921.stgit@thinktux.local>
User-Agent: Mutt/1.11.3 (2019-02-01)
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
Cc: naveen.n.rao@linux.ibm.com, ravi.bangoria@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 20, 2021 at 04:43:14PM +0530, Ananth N Mavinakayanahalli wrote:
> We currently unconditionally try to emulate newer instructions on older
> Power versions that could cause issues. Gate it.
Fixes: 350779a29f11 ("powerpc: Handle most loads and stores in instruction emulation code")

There are more that would apply but most of the checks land in code
added by the above.

Thanks

Michal
> 
> Signed-off-by: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>
> ---
> 
> [v3] Addressed Naveen's comments on scv and addpcis
> [v2] Fixed description
> 
>  arch/powerpc/lib/sstep.c |   46 ++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 44 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
> index bf7a7d62ae8b..5a425a4a1d88 100644
> --- a/arch/powerpc/lib/sstep.c
> +++ b/arch/powerpc/lib/sstep.c
> @@ -1304,9 +1304,11 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>  		if ((word & 0xfe2) == 2)
>  			op->type = SYSCALL;
>  		else if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) &&
> -				(word & 0xfe3) == 1)
> +				(word & 0xfe3) == 1) {	/* scv */
>  			op->type = SYSCALL_VECTORED_0;
> -		else
> +			if (!cpu_has_feature(CPU_FTR_ARCH_300))
> +				return -1;
> +		} else
>  			op->type = UNKNOWN;
>  		return 0;
>  #endif
> @@ -1530,6 +1532,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>  	case 19:
>  		if (((word >> 1) & 0x1f) == 2) {
>  			/* addpcis */
> +			if (!cpu_has_feature(CPU_FTR_ARCH_300))
> +				return -1;
>  			imm = (short) (word & 0xffc1);	/* d0 + d2 fields */
>  			imm |= (word >> 15) & 0x3e;	/* d1 field */
>  			op->val = regs->nip + (imm << 16) + 4;
> @@ -2439,6 +2443,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>  			break;
>  
>  		case 268:	/* lxvx */
> +			if (!cpu_has_feature(CPU_FTR_ARCH_300))
> +				return -1;
>  			op->reg = rd | ((word & 1) << 5);
>  			op->type = MKOP(LOAD_VSX, 0, 16);
>  			op->element_size = 16;
> @@ -2448,6 +2454,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>  		case 269:	/* lxvl */
>  		case 301: {	/* lxvll */
>  			int nb;
> +			if (!cpu_has_feature(CPU_FTR_ARCH_300))
> +				return -1;
>  			op->reg = rd | ((word & 1) << 5);
>  			op->ea = ra ? regs->gpr[ra] : 0;
>  			nb = regs->gpr[rb] & 0xff;
> @@ -2475,6 +2483,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>  			break;
>  
>  		case 364:	/* lxvwsx */
> +			if (!cpu_has_feature(CPU_FTR_ARCH_300))
> +				return -1;
>  			op->reg = rd | ((word & 1) << 5);
>  			op->type = MKOP(LOAD_VSX, 0, 4);
>  			op->element_size = 4;
> @@ -2482,6 +2492,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>  			break;
>  
>  		case 396:	/* stxvx */
> +			if (!cpu_has_feature(CPU_FTR_ARCH_300))
> +				return -1;
>  			op->reg = rd | ((word & 1) << 5);
>  			op->type = MKOP(STORE_VSX, 0, 16);
>  			op->element_size = 16;
> @@ -2491,6 +2503,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>  		case 397:	/* stxvl */
>  		case 429: {	/* stxvll */
>  			int nb;
> +			if (!cpu_has_feature(CPU_FTR_ARCH_300))
> +				return -1;
>  			op->reg = rd | ((word & 1) << 5);
>  			op->ea = ra ? regs->gpr[ra] : 0;
>  			nb = regs->gpr[rb] & 0xff;
> @@ -2542,6 +2556,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>  			break;
>  
>  		case 781:	/* lxsibzx */
> +			if (!cpu_has_feature(CPU_FTR_ARCH_300))
> +				return -1;
>  			op->reg = rd | ((word & 1) << 5);
>  			op->type = MKOP(LOAD_VSX, 0, 1);
>  			op->element_size = 8;
> @@ -2549,6 +2565,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>  			break;
>  
>  		case 812:	/* lxvh8x */
> +			if (!cpu_has_feature(CPU_FTR_ARCH_300))
> +				return -1;
>  			op->reg = rd | ((word & 1) << 5);
>  			op->type = MKOP(LOAD_VSX, 0, 16);
>  			op->element_size = 2;
> @@ -2556,6 +2574,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>  			break;
>  
>  		case 813:	/* lxsihzx */
> +			if (!cpu_has_feature(CPU_FTR_ARCH_300))
> +				return -1;
>  			op->reg = rd | ((word & 1) << 5);
>  			op->type = MKOP(LOAD_VSX, 0, 2);
>  			op->element_size = 8;
> @@ -2569,6 +2589,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>  			break;
>  
>  		case 876:	/* lxvb16x */
> +			if (!cpu_has_feature(CPU_FTR_ARCH_300))
> +				return -1;
>  			op->reg = rd | ((word & 1) << 5);
>  			op->type = MKOP(LOAD_VSX, 0, 16);
>  			op->element_size = 1;
> @@ -2582,6 +2604,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>  			break;
>  
>  		case 909:	/* stxsibx */
> +			if (!cpu_has_feature(CPU_FTR_ARCH_300))
> +				return -1;
>  			op->reg = rd | ((word & 1) << 5);
>  			op->type = MKOP(STORE_VSX, 0, 1);
>  			op->element_size = 8;
> @@ -2589,6 +2613,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>  			break;
>  
>  		case 940:	/* stxvh8x */
> +			if (!cpu_has_feature(CPU_FTR_ARCH_300))
> +				return -1;
>  			op->reg = rd | ((word & 1) << 5);
>  			op->type = MKOP(STORE_VSX, 0, 16);
>  			op->element_size = 2;
> @@ -2596,6 +2622,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>  			break;
>  
>  		case 941:	/* stxsihx */
> +			if (!cpu_has_feature(CPU_FTR_ARCH_300))
> +				return -1;
>  			op->reg = rd | ((word & 1) << 5);
>  			op->type = MKOP(STORE_VSX, 0, 2);
>  			op->element_size = 8;
> @@ -2609,6 +2637,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>  			break;
>  
>  		case 1004:	/* stxvb16x */
> +			if (!cpu_has_feature(CPU_FTR_ARCH_300))
> +				return -1;
>  			op->reg = rd | ((word & 1) << 5);
>  			op->type = MKOP(STORE_VSX, 0, 16);
>  			op->element_size = 1;
> @@ -2717,12 +2747,16 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>  			op->type = MKOP(LOAD_FP, 0, 16);
>  			break;
>  		case 2:		/* lxsd */
> +			if (!cpu_has_feature(CPU_FTR_ARCH_300))
> +				return -1;
>  			op->reg = rd + 32;
>  			op->type = MKOP(LOAD_VSX, 0, 8);
>  			op->element_size = 8;
>  			op->vsx_flags = VSX_CHECK_VEC;
>  			break;
>  		case 3:		/* lxssp */
> +			if (!cpu_has_feature(CPU_FTR_ARCH_300))
> +				return -1;
>  			op->reg = rd + 32;
>  			op->type = MKOP(LOAD_VSX, 0, 4);
>  			op->element_size = 8;
> @@ -2775,6 +2809,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>  			break;
>  
>  		case 1:		/* lxv */
> +			if (!cpu_has_feature(CPU_FTR_ARCH_300))
> +				return -1;
>  			op->ea = dqform_ea(word, regs);
>  			if (word & 8)
>  				op->reg = rd + 32;
> @@ -2785,6 +2821,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>  
>  		case 2:		/* stxsd with LSB of DS field = 0 */
>  		case 6:		/* stxsd with LSB of DS field = 1 */
> +			if (!cpu_has_feature(CPU_FTR_ARCH_300))
> +				return -1;
>  			op->ea = dsform_ea(word, regs);
>  			op->reg = rd + 32;
>  			op->type = MKOP(STORE_VSX, 0, 8);
> @@ -2794,6 +2832,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>  
>  		case 3:		/* stxssp with LSB of DS field = 0 */
>  		case 7:		/* stxssp with LSB of DS field = 1 */
> +			if (!cpu_has_feature(CPU_FTR_ARCH_300))
> +				return -1;
>  			op->ea = dsform_ea(word, regs);
>  			op->reg = rd + 32;
>  			op->type = MKOP(STORE_VSX, 0, 4);
> @@ -2802,6 +2842,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
>  			break;
>  
>  		case 5:		/* stxv */
> +			if (!cpu_has_feature(CPU_FTR_ARCH_300))
> +				return -1;
>  			op->ea = dqform_ea(word, regs);
>  			if (word & 8)
>  				op->reg = rd + 32;
> 
> 
