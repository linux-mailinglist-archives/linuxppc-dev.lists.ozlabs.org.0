Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F73C4E64DF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Mar 2022 15:16:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KPS293qMnz3bP7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Mar 2022 01:16:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fvidASYQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::335;
 helo=mail-ot1-x335.google.com; envelope-from=mopsfelder@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=fvidASYQ; dkim-atps=neutral
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KPS1T02D0z2xtc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Mar 2022 01:15:40 +1100 (AEDT)
Received: by mail-ot1-x335.google.com with SMTP id
 w17-20020a056830111100b005b22c584b93so3363822otq.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Mar 2022 07:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=03Tjb4Jq8+Dg7Cq/FM0ZZxXuvnfH1uuatOS6kR6N69M=;
 b=fvidASYQeO6SUdFCMpLgrZajFXqny9WtOUaD2Zc/3Ybx6J3W7OuTvtooyM732KB+bW
 nRIES3DO9b5uN3LB2r04rMhpiQ5XfiEOR/AixNlyGUrN4Dx0W5Zo0r70PR83yx8gCilq
 Tq6XuxjqVzm42L1gSSC9lkBzd26BDDU9h2BUzpLEzpw5is6FhSTcPZcV3gJGZits8hiZ
 0T2D7L6JsVkpJ0QZi2m4zE0nd7XU1j0pIjMwUJZ2nANzFrobsJHnnaT7JDCVY1w1pmpZ
 zv3J1l23Pk3qWLStudRTypP3USu38UOzhibu3TmOTrmnYV0dlefgSrFW/4KoqG6S9tb5
 vu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=03Tjb4Jq8+Dg7Cq/FM0ZZxXuvnfH1uuatOS6kR6N69M=;
 b=gBjc4w/YEYhufEzCyactLQpzwGZbPmQlDfA4et7plUJyofIfOFDde4s4yeC+vjzXDZ
 TahpmVeENW6bICnkT0rNoTQSjyGSk/kKl2cQPnkLnotOpTqNP7n5Zv2oVOMxnqjLapKH
 5zFweUqhP6nrL5h7cNZfrY1iQLb00MfUL9c8oyR78FL7kl3QPDzKBEgqzX2V+aFRPacx
 zKS9E4AgRx9+IwaiiLuJqBOnV76EeuaKx5ziWf7dKNdWVNIS5QV8Uw4cmo+OF0jb9F6z
 yYsR670PsXN39jZPOJMWz05KUKVoE5PFy4OSOj03QadczBbmrUzC9SCYpHH5Rfq2KLdS
 Jpbg==
X-Gm-Message-State: AOAM532UgG+L4u2HL5GCmKiJn//agN1GdDS7v38bTwa+v0hIl8J6lhd7
 CykVa3DdCBCg6uHNVUUVZvw=
X-Google-Smtp-Source: ABdhPJwAgCNQaCWFkXdha1R8yGLjkeC8Cf8bRJN3a2PWO4NID0VnHijGHnTlR3+xDvy6kdtVqZLNPQ==
X-Received: by 2002:a05:6830:25d6:b0:5c9:49ef:3c5b with SMTP id
 d22-20020a05683025d600b005c949ef3c5bmr2183546otu.331.1648131335629; 
 Thu, 24 Mar 2022 07:15:35 -0700 (PDT)
Received: from ?IPV6:2804:2230:8010:16c0::2? ([2804:2230:8010:16c0::2])
 by smtp.gmail.com with ESMTPSA id
 e8-20020a9d63c8000000b005b235a56831sm1380107otl.49.2022.03.24.07.15.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 07:15:35 -0700 (PDT)
Message-ID: <9b5ec756-a074-390a-0955-6d973eacac28@gmail.com>
Date: Thu, 24 Mar 2022 11:15:32 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] powerpc: Reject probes on instructions that can't be
 single stepped
Content-Language: en-US
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
References: <cover.1648030681.git.naveen.n.rao@linux.vnet.ibm.com>
 <e81779aa105d67799742c3e3f59075dce9f05cfb.1648030681.git.naveen.n.rao@linux.vnet.ibm.com>
From: =?UTF-8?Q?Murilo_Opsfelder_Ara=c3=bajo?= <mopsfelder@gmail.com>
In-Reply-To: <e81779aa105d67799742c3e3f59075dce9f05cfb.1648030681.git.naveen.n.rao@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi, Naveen.

Some comments below.

On 3/23/22 08:51, Naveen N. Rao wrote:
> Per the ISA, a Trace interrupt is not generated for:
> - [h|u]rfi[d]
> - rfscv
> - sc, scv, and Trap instructions that trap
> - Power-Saving Mode instructions
> - other instructions that cause interrupts (other than Trace interrupts)
> - the first instructions of any interrupt handler (applies to Branch and Single Step tracing;
> CIABR matches may still occur)
> - instructions that are emulated by software
> 
> Add a helper to check for instructions belonging to the first four
> categories above and to reject kprobes, uprobes and xmon breakpoints on
> such instructions. We reject probing on instructions belonging to these
> categories across all ISA versions and across both BookS and BookE.
> 
> For trap instructions, we can't know in advance if they can cause a
> trap, and there is no good reason to allow probing on those. Also,
> uprobes already refuses to probe trap instructions and kprobes does not
> allow probes on trap instructions used for kernel warnings and bugs. As
> such, stop allowing any type of probes/breakpoints on trap instruction
> across uprobes, kprobes and xmon.
> 
> For some of the fp/altivec instructions that can generate an interrupt
> and which we emulate in the kernel (altivec assist, for example), we
> check and turn off single stepping in emulate_single_step().
> 
> Instructions generating a DSI are restarted and single stepping normally
> completes once the instruction is completed.
> 
> In uprobes, if a single stepped instruction results in a non-fatal
> signal to be delivered to the task, such signals are "delayed" until
> after the instruction completes. For fatal signals, single stepping is
> cancelled and the instruction restarted in-place so that core dump
> captures proper addresses.
> 
> In kprobes, we do not allow probes on instructions having an extable
> entry and we also do not allow probing interrupt vectors.
> 
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> ---
>   arch/powerpc/include/asm/probes.h | 55 +++++++++++++++++++++++++++++++
>   arch/powerpc/kernel/kprobes.c     |  4 +--
>   arch/powerpc/kernel/uprobes.c     |  5 +++
>   arch/powerpc/xmon/xmon.c          | 11 +++----
>   4 files changed, 67 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/probes.h b/arch/powerpc/include/asm/probes.h
> index c5d984700d241a..21ab5b6256b590 100644
> --- a/arch/powerpc/include/asm/probes.h
> +++ b/arch/powerpc/include/asm/probes.h
> @@ -31,6 +31,61 @@ typedef u32 ppc_opcode_t;
>   #define MSR_SINGLESTEP	(MSR_SE)
>   #endif
>   
> +static inline bool can_single_step(u32 inst)
> +{
> +	switch (inst >> 26) {

Can't ppc_inst_primary_opcode() be used instead?

> +	case 2:		/* tdi */
> +		return false;
> +	case 3:		/* twi */
> +		return false;
> +	case 17:	/* sc and scv */
> +		return false;
> +	case 19:
> +		switch ((inst >> 1) & 0x3ff) {
> +		case 18:	/* rfid */
> +			return false;
> +		case 38:	/* rfmci */
> +			return false;
> +		case 39:	/* rfdi */
> +			return false;
> +		case 50:	/* rfi */
> +			return false;
> +		case 51:	/* rfci */
> +			return false;
> +		case 82:	/* rfscv */
> +			return false;
> +		case 274:	/* hrfid */
> +			return false;
> +		case 306:	/* urfid */
> +			return false;
> +		case 370:	/* stop */
> +			return false;
> +		case 402:	/* doze */
> +			return false;
> +		case 434:	/* nap */
> +			return false;
> +		case 466:	/* sleep */
> +			return false;
> +		case 498:	/* rvwinkle */
> +			return false;
> +		}
> +		break;
> +	case 31:
> +		switch ((inst >> 1) & 0x3ff) {
> +		case 4:		/* tw */
> +			return false;
> +		case 68:	/* td */
> +			return false;
> +		case 146:	/* mtmsr */
> +			return false;
> +		case 178:	/* mtmsrd */
> +			return false;
> +		}
> +		break;
> +	}
> +	return true;
> +}
> +

Can't OP_* definitions from ppc-opcode.h be used for all of these switch-case statements?

>   /* Enable single stepping for the current task */
>   static inline void enable_single_step(struct pt_regs *regs)
>   {
> diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
> index 9a492fdec1dfbe..0936a6c8c256b9 100644
> --- a/arch/powerpc/kernel/kprobes.c
> +++ b/arch/powerpc/kernel/kprobes.c
> @@ -129,8 +129,8 @@ int arch_prepare_kprobe(struct kprobe *p)
>   	if ((unsigned long)p->addr & 0x03) {
>   		printk("Attempt to register kprobe at an unaligned address\n");
>   		ret = -EINVAL;
> -	} else if (IS_MTMSRD(insn) || IS_RFID(insn)) {
> -		printk("Cannot register a kprobe on mtmsr[d]/rfi[d]\n");
> +	} else if (!can_single_step(ppc_inst_val(insn))) {
> +		printk("Cannot register a kprobe on instructions that can't be single stepped\n");
>   		ret = -EINVAL;
>   	} else if ((unsigned long)p->addr & ~PAGE_MASK &&
>   		   ppc_inst_prefixed(ppc_inst_read(p->addr - 1))) {
> diff --git a/arch/powerpc/kernel/uprobes.c b/arch/powerpc/kernel/uprobes.c
> index c6975467d9ffdc..95a41ae9dfa755 100644
> --- a/arch/powerpc/kernel/uprobes.c
> +++ b/arch/powerpc/kernel/uprobes.c
> @@ -48,6 +48,11 @@ int arch_uprobe_analyze_insn(struct arch_uprobe *auprobe,
>   		return -EINVAL;
>   	}
>   
> +	if (!can_single_step(ppc_inst_val(ppc_inst_read(auprobe->insn)))) {
> +		pr_info_ratelimited("Cannot register a uprobe on instructions that can't be single stepped\n");
> +		return -ENOTSUPP;
> +	}
> +
>   	return 0;
>   }
>   
> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> index fd72753e8ad502..a92c5739d954e2 100644
> --- a/arch/powerpc/xmon/xmon.c
> +++ b/arch/powerpc/xmon/xmon.c
> @@ -921,9 +921,9 @@ static void insert_bpts(void)
>   			bp->enabled = 0;
>   			continue;
>   		}
> -		if (IS_MTMSRD(instr) || IS_RFID(instr)) {
> -			printf("Breakpoint at %lx is on an mtmsrd or rfid "
> -			       "instruction, disabling it\n", bp->address);
> +		if (!can_single_step(ppc_inst_val(instr))) {
> +			printf("Breakpoint at %lx is on an instruction that can't be single stepped, disabling it\n",
> +					bp->address);
>   			bp->enabled = 0;
>   			continue;
>   		}
> @@ -1470,9 +1470,8 @@ static long check_bp_loc(unsigned long addr)
>   		printf("Can't read instruction at address %lx\n", addr);
>   		return 0;
>   	}
> -	if (IS_MTMSRD(instr) || IS_RFID(instr)) {
> -		printf("Breakpoints may not be placed on mtmsrd or rfid "
> -		       "instructions\n");
> +	if (!can_single_step(ppc_inst_val(instr))) {
> +		printf("Breakpoints may not be placed on instructions that can't be single stepped\n");
>   		return 0;
>   	}
>   	return 1;

Cheers!

-- 
Murilo
