Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 590C82C7EE5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 08:41:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ckxxd3zbJzDr75
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 18:41:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Li8YP/Nm; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ckxqq64fTzDr41
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 18:36:23 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AU7W9HG051682
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 02:36:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=KPBJ4KuOoZ9zaFKElyJyj6fEOF0z39SjyeAzGNtp41U=;
 b=Li8YP/NmoP1g1JcBVJtv03mdxPWYPUKIBzp+Q85xYjTbj9kzCi2dQcLLoPpbH70IABN5
 +AOoDxC95wMVW7M6cuty3JxitpCnGAfr1jstxYwtzcIN78JsROSohLeNHN/b9nEduUSL
 AW2iSHkknDGJiJTdujD9nT37QjIw1EFoKqlQO5jGVg4mYH8oSSknXaCnkDb+6rZyVB/e
 SR/1hShzDMijxE6lUpp/Y6YXr4JrrRYnCFPvc9mfmsmRWtqToHthzww/OtrM/P3Rc/zc
 Sc30ZDRrkiupwQi3zVsf5oTeJE1AuCE+NdpFbekJu3P0eVAFX7BK+BbDVvUyVfGaUY1U 5Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 354spv3m3p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 02:36:19 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AU7WL1m052782
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 02:36:19 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 354spv3m3e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Nov 2020 02:36:19 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AU7RJZk005275;
 Mon, 30 Nov 2020 07:36:18 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02dal.us.ibm.com with ESMTP id 353e6994hf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Nov 2020 07:36:18 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AU7aHFI19398920
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Nov 2020 07:36:17 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 901FB6E04E;
 Mon, 30 Nov 2020 07:36:17 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3BA7D6E04C;
 Mon, 30 Nov 2020 07:36:16 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.199.58.227])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 30 Nov 2020 07:36:15 +0000 (GMT)
X-Mailer: emacs 27.1 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 03/19] powerpc: bad_page_fault, do_break get
 registers from regs
In-Reply-To: <20201128144114.944000-4-npiggin@gmail.com>
References: <20201128144114.944000-1-npiggin@gmail.com>
 <20201128144114.944000-4-npiggin@gmail.com>
Date: Mon, 30 Nov 2020 13:06:14 +0530
Message-ID: <87r1obpa8h.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-30_02:2020-11-26,
 2020-11-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999
 bulkscore=0 malwarescore=0 suspectscore=0 mlxscore=0 spamscore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011300045
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> Similar to the previous patch this makes interrupt handler function
> types more regular so they can be wrapped with the next patch.
>
> bad_page_fault and do_break are not performance critical.
>

Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

> [32s DABR code from Christophe Leroy <christophe.leroy@csgroup.eu>]
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/include/asm/bug.h             |  2 +-
>  arch/powerpc/include/asm/debug.h           |  3 +--
>  arch/powerpc/kernel/entry_32.S             | 18 +-----------------
>  arch/powerpc/kernel/exceptions-64e.S       |  3 +--
>  arch/powerpc/kernel/exceptions-64s.S       |  3 +--
>  arch/powerpc/kernel/head_8xx.S             |  5 ++---
>  arch/powerpc/kernel/head_book3s_32.S       |  3 +++
>  arch/powerpc/kernel/process.c              |  7 +++----
>  arch/powerpc/kernel/traps.c                |  2 +-
>  arch/powerpc/mm/book3s64/hash_utils.c      |  4 ++--
>  arch/powerpc/mm/book3s64/slb.c             |  2 +-
>  arch/powerpc/mm/fault.c                    | 10 +++++-----
>  arch/powerpc/platforms/8xx/machine_check.c |  2 +-
>  13 files changed, 23 insertions(+), 41 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
> index 897bad6b6bbb..49162faba33f 100644
> --- a/arch/powerpc/include/asm/bug.h
> +++ b/arch/powerpc/include/asm/bug.h
> @@ -113,7 +113,7 @@
>  struct pt_regs;
>  long do_page_fault(struct pt_regs *);
>  long hash__do_page_fault(struct pt_regs *);
> -extern void bad_page_fault(struct pt_regs *, unsigned long, int);
> +void bad_page_fault(struct pt_regs *, int);
>  extern void _exception(int, struct pt_regs *, int, unsigned long);
>  extern void _exception_pkey(struct pt_regs *, unsigned long, int);
>  extern void die(const char *, struct pt_regs *, long);
> diff --git a/arch/powerpc/include/asm/debug.h b/arch/powerpc/include/asm/debug.h
> index ec57daf87f40..0550eceab3ca 100644
> --- a/arch/powerpc/include/asm/debug.h
> +++ b/arch/powerpc/include/asm/debug.h
> @@ -52,8 +52,7 @@ extern void do_send_trap(struct pt_regs *regs, unsigned long address,
>  			 unsigned long error_code, int brkpt);
>  #else
>  
> -extern void do_break(struct pt_regs *regs, unsigned long address,
> -		     unsigned long error_code);
> +void do_break(struct pt_regs *regs);
>  #endif
>  
>  #endif /* _ASM_POWERPC_DEBUG_H */
> diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
> index 8cdc8bcde703..57b8e95ea2a0 100644
> --- a/arch/powerpc/kernel/entry_32.S
> +++ b/arch/powerpc/kernel/entry_32.S
> @@ -657,10 +657,6 @@ ppc_swapcontext:
>  	.globl	handle_page_fault
>  handle_page_fault:
>  	addi	r3,r1,STACK_FRAME_OVERHEAD
> -#ifdef CONFIG_PPC_BOOK3S_32
> -	andis.  r0,r5,DSISR_DABRMATCH@h
> -	bne-    handle_dabr_fault
> -#endif
>  	bl	do_page_fault
>  	cmpwi	r3,0
>  	beq+	ret_from_except
> @@ -668,23 +664,11 @@ handle_page_fault:
>  	lwz	r0,_TRAP(r1)
>  	clrrwi	r0,r0,1
>  	stw	r0,_TRAP(r1)
> -	mr	r5,r3
> +	mr	r4,r3		/* err arg for bad_page_fault */
>  	addi	r3,r1,STACK_FRAME_OVERHEAD
> -	lwz	r4,_DAR(r1)
>  	bl	bad_page_fault
>  	b	ret_from_except_full
>  
> -#ifdef CONFIG_PPC_BOOK3S_32
> -	/* We have a data breakpoint exception - handle it */
> -handle_dabr_fault:
> -	SAVE_NVGPRS(r1)
> -	lwz	r0,_TRAP(r1)
> -	clrrwi	r0,r0,1
> -	stw	r0,_TRAP(r1)
> -	bl      do_break
> -	b	ret_from_except_full
> -#endif
> -
>  /*
>   * This routine switches between two different tasks.  The process
>   * state of one is saved on its kernel stack.  Then the state
> diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
> index 25fa7d5a643c..dc728bb1c89a 100644
> --- a/arch/powerpc/kernel/exceptions-64e.S
> +++ b/arch/powerpc/kernel/exceptions-64e.S
> @@ -1018,9 +1018,8 @@ storage_fault_common:
>  	bne-	1f
>  	b	ret_from_except_lite
>  1:	bl	save_nvgprs
> -	mr	r5,r3
> +	mr	r4,r3
>  	addi	r3,r1,STACK_FRAME_OVERHEAD
> -	ld	r4,_DAR(r1)
>  	bl	bad_page_fault
>  	b	ret_from_except
>  
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
> index 690058043b17..77b730f515c4 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -2136,8 +2136,7 @@ EXC_COMMON_BEGIN(h_data_storage_common)
>  	GEN_COMMON h_data_storage
>  	addi    r3,r1,STACK_FRAME_OVERHEAD
>  BEGIN_MMU_FTR_SECTION
> -	ld	r4,_DAR(r1)
> -	li	r5,SIGSEGV
> +	li	r4,SIGSEGV
>  	bl      bad_page_fault
>  MMU_FTR_SECTION_ELSE
>  	bl      unknown_exception
> diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
> index 8acd365a2be6..71ad7ce28469 100644
> --- a/arch/powerpc/kernel/head_8xx.S
> +++ b/arch/powerpc/kernel/head_8xx.S
> @@ -376,10 +376,9 @@ do_databreakpoint:
>  	addi	r3,r1,STACK_FRAME_OVERHEAD
>  	mfspr	r4,SPRN_BAR
>  	stw	r4,_DAR(r11)
> -#ifdef CONFIG_VMAP_STACK
> -	lwz	r5,_DSISR(r11)
> -#else
> +#ifndef CONFIG_VMAP_STACK
>  	mfspr	r5,SPRN_DSISR
> +	stw	r5,_DSISR(r11)
>  #endif
>  	EXC_XFER_STD(0x1c00, do_break)
>  
> diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
> index 7addf67832f9..5875f8795d5b 100644
> --- a/arch/powerpc/kernel/head_book3s_32.S
> +++ b/arch/powerpc/kernel/head_book3s_32.S
> @@ -689,7 +689,10 @@ handle_page_fault_tramp_1:
>  #endif
>  	/* fall through */
>  handle_page_fault_tramp_2:
> +	andis.	r0, r5, DSISR_DABRMATCH@h
> +	bne-	1f
>  	EXC_XFER_LITE(0x300, handle_page_fault)
> +1:	EXC_XFER_STD(0x300, do_break)
>  
>  #ifdef CONFIG_VMAP_STACK
>  .macro save_regs_thread		thread
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index d421a2c7f822..0bdd3ed653df 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -660,11 +660,10 @@ static void do_break_handler(struct pt_regs *regs)
>  	}
>  }
>  
> -void do_break (struct pt_regs *regs, unsigned long address,
> -		    unsigned long error_code)
> +void do_break(struct pt_regs *regs)
>  {
>  	current->thread.trap_nr = TRAP_HWBKPT;
> -	if (notify_die(DIE_DABR_MATCH, "dabr_match", regs, error_code,
> +	if (notify_die(DIE_DABR_MATCH, "dabr_match", regs, regs->dsisr,
>  			11, SIGSEGV) == NOTIFY_STOP)
>  		return;
>  
> @@ -682,7 +681,7 @@ void do_break (struct pt_regs *regs, unsigned long address,
>  		do_break_handler(regs);
>  
>  	/* Deliver the signal to userspace */
> -	force_sig_fault(SIGTRAP, TRAP_HWBKPT, (void __user *)address);
> +	force_sig_fault(SIGTRAP, TRAP_HWBKPT, (void __user *)regs->dar);
>  }
>  #endif	/* CONFIG_PPC_ADV_DEBUG_REGS */
>  
> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index 5006dcbe1d9f..902fcbd1a778 100644
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c
> @@ -1641,7 +1641,7 @@ void alignment_exception(struct pt_regs *regs)
>  	if (user_mode(regs))
>  		_exception(sig, regs, code, regs->dar);
>  	else
> -		bad_page_fault(regs, regs->dar, sig);
> +		bad_page_fault(regs, sig);
>  
>  bail:
>  	exception_exit(prev_state);
> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
> index 0f0bd4af4b2d..731518e7d56f 100644
> --- a/arch/powerpc/mm/book3s64/hash_utils.c
> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> @@ -1537,7 +1537,7 @@ long do_hash_fault(struct pt_regs *regs)
>  	 * the access, or panic if there isn't a handler.
>  	 */
>  	if (unlikely(in_nmi())) {
> -		bad_page_fault(regs, ea, SIGSEGV);
> +		bad_page_fault(regs, SIGSEGV);
>  		return 0;
>  	}
>  
> @@ -1576,7 +1576,7 @@ long do_hash_fault(struct pt_regs *regs)
>  			else
>  				_exception(SIGBUS, regs, BUS_ADRERR, ea);
>  		} else {
> -			bad_page_fault(regs, ea, SIGBUS);
> +			bad_page_fault(regs, SIGBUS);
>  		}
>  		err = 0;
>  
> diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
> index cc34d50874c1..ae89ad516247 100644
> --- a/arch/powerpc/mm/book3s64/slb.c
> +++ b/arch/powerpc/mm/book3s64/slb.c
> @@ -898,7 +898,7 @@ void do_bad_slb_fault(struct pt_regs *regs)
>  		if (user_mode(regs))
>  			_exception(SIGSEGV, regs, SEGV_BNDERR, regs->dar);
>  		else
> -			bad_page_fault(regs, regs->dar, SIGSEGV);
> +			bad_page_fault(regs, SIGSEGV);
>  	} else if (err == -EINVAL) {
>  		unrecoverable_exception(regs);
>  	} else {
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index 390a296b16a3..e11989be8f1c 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -562,14 +562,14 @@ long do_page_fault(struct pt_regs *regs)
>  	/* 32 and 64e handle errors in their asm code */
>  	if (unlikely(err)) {
>  		if (err > 0) {
> -			bad_page_fault(regs, address, err);
> +			bad_page_fault(regs, err);
>  			err = 0;
>  		} else {
>  			/*
>  			 * do_break() may change NV GPRS while handling the
>  			 * breakpoint. Return -ve to caller to do that.
>  			 */
> -			do_break(regs, address, error_code);
> +			do_break(regs);
>  		}
>  	}
>  #endif
> @@ -591,14 +591,14 @@ long hash__do_page_fault(struct pt_regs *regs)
>  	err = __do_page_fault(regs, address, error_code);
>  	if (unlikely(err)) {
>  		if (err > 0) {
> -			bad_page_fault(regs, address, err);
> +			bad_page_fault(regs, err);
>  			err = 0;
>  		} else {
>  			/*
>  			 * do_break() may change NV GPRS while handling the
>  			 * breakpoint. Return -ve to caller to do that.
>  			 */
> -			do_break(regs, address, error_code);
> +			do_break(regs);
>  		}
>  	}
>  
> @@ -612,7 +612,7 @@ NOKPROBE_SYMBOL(hash__do_page_fault);
>   * It is called from the DSI and ISI handlers in head.S and from some
>   * of the procedures in traps.c.
>   */
> -void bad_page_fault(struct pt_regs *regs, unsigned long address, int sig)
> +void bad_page_fault(struct pt_regs *regs, int sig)
>  {
>  	const struct exception_table_entry *entry;
>  	int is_write = page_fault_is_write(regs->dsisr);
> diff --git a/arch/powerpc/platforms/8xx/machine_check.c b/arch/powerpc/platforms/8xx/machine_check.c
> index 88dedf38eccd..656365975895 100644
> --- a/arch/powerpc/platforms/8xx/machine_check.c
> +++ b/arch/powerpc/platforms/8xx/machine_check.c
> @@ -26,7 +26,7 @@ int machine_check_8xx(struct pt_regs *regs)
>  	 * to deal with that than having a wart in the mcheck handler.
>  	 * -- BenH
>  	 */
> -	bad_page_fault(regs, regs->dar, SIGBUS);
> +	bad_page_fault(regs, SIGBUS);
>  	return 1;
>  #else
>  	return 0;
> -- 
> 2.23.0
