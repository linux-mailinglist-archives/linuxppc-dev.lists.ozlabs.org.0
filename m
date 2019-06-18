Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFAC49942
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 08:48:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Sdvn1HBvzDqfP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 16:48:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="qbPK4m4X"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Sds66cfqzDq5f
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 16:46:18 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45Sds34Z4Kz9v2hv;
 Tue, 18 Jun 2019 08:46:15 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=qbPK4m4X; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id lrq2fcRQ0upr; Tue, 18 Jun 2019 08:46:15 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45Sds33T5zz9v2ht;
 Tue, 18 Jun 2019 08:46:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1560840375; bh=f1TaXLuQztNdjCCTBUyiCnXlkmIVTgD1cfbIcwlhhpk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=qbPK4m4XxMeIIwjWs0X/G8f9rowtUTNP28d2Jf1CzgT8sRP9N6lEZ0PYrzuTd6383
 2TaHApDrVaiB84fu+5rJHYzG98NhI9O1cMPVN+or2FDfiGaoeJriZ8BEJsAhml6Ocp
 WQXKD6ts7zWJbWizCuO/MNp0PgAoBRRw/Y4yaLx8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 821368B894;
 Tue, 18 Jun 2019 08:46:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ghFB0ZVfi_lA; Tue, 18 Jun 2019 08:46:15 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8B1378B78B;
 Tue, 18 Jun 2019 08:46:14 +0200 (CEST)
Subject: Re: [PATCH 5/5] Powerpc/Watchpoint: Fix length calculation for
 unaligned target
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mpe@ellerman.id.au
References: <20190618042732.5582-1-ravi.bangoria@linux.ibm.com>
 <20190618042732.5582-6-ravi.bangoria@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <3390c3c2-8290-da55-a183-872c593c7b1e@c-s.fr>
Date: Tue, 18 Jun 2019 08:46:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190618042732.5582-6-ravi.bangoria@linux.ibm.com>
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
Cc: mikey@neuling.org, linux-kernel@vger.kernel.org, npiggin@gmail.com,
 paulus@samba.org, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 18/06/2019 à 06:27, Ravi Bangoria a écrit :
> Watchpoint match range is always doubleword(8 bytes) aligned on
> powerpc. If the given range is crossing doubleword boundary, we
> need to increase the length such that next doubleword also get
> covered. Ex,
> 
>            address   len = 6 bytes
>                  |=========.
>     |------------v--|------v--------|
>     | | | | | | | | | | | | | | | | |
>     |---------------|---------------|
>      <---8 bytes--->
> 
> In such case, current code configures hw as:
>    start_addr = address & ~HW_BREAKPOINT_ALIGN
>    len = 8 bytes
> 
> And thus read/write in last 4 bytes of the given range is ignored.
> Fix this by including next doubleword in the length. Watchpoint
> exception handler already ignores extraneous exceptions, so no
> changes required for that.
> 
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/hw_breakpoint.h |  7 ++--
>   arch/powerpc/kernel/hw_breakpoint.c      | 44 +++++++++++++-----------
>   arch/powerpc/kernel/process.c            | 34 ++++++++++++++++--
>   3 files changed, 60 insertions(+), 25 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/hw_breakpoint.h b/arch/powerpc/include/asm/hw_breakpoint.h
> index 8acbbdd4a2d5..749a357164d5 100644
> --- a/arch/powerpc/include/asm/hw_breakpoint.h
> +++ b/arch/powerpc/include/asm/hw_breakpoint.h
> @@ -34,6 +34,8 @@ struct arch_hw_breakpoint {
>   #define HW_BRK_TYPE_PRIV_ALL	(HW_BRK_TYPE_USER | HW_BRK_TYPE_KERNEL | \
>   				 HW_BRK_TYPE_HYP)
>   
> +#define HW_BREAKPOINT_ALIGN 0x7
> +
>   #ifdef CONFIG_HAVE_HW_BREAKPOINT
>   #include <linux/kdebug.h>
>   #include <asm/reg.h>
> @@ -45,8 +47,6 @@ struct pmu;
>   struct perf_sample_data;
>   struct task_struct;
>   
> -#define HW_BREAKPOINT_ALIGN 0x7
> -
>   extern int hw_breakpoint_slots(int type);
>   extern int arch_bp_generic_fields(int type, int *gen_bp_type);
>   extern int arch_check_bp_in_kernelspace(struct arch_hw_breakpoint *hw);
> @@ -76,7 +76,8 @@ static inline void hw_breakpoint_disable(void)
>   }
>   extern void thread_change_pc(struct task_struct *tsk, struct pt_regs *regs);
>   int hw_breakpoint_handler(struct die_args *args);
> -
> +extern u16 hw_breakpoint_get_final_len(struct arch_hw_breakpoint *brk,
> +		unsigned long *start_addr, unsigned long *end_addr);
>   extern int set_dawr(struct arch_hw_breakpoint *brk);
>   extern bool dawr_force_enable;
>   static inline bool dawr_enabled(void)
> diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
> index 36bcf705df65..c122fd55aa44 100644
> --- a/arch/powerpc/kernel/hw_breakpoint.c
> +++ b/arch/powerpc/kernel/hw_breakpoint.c
> @@ -126,6 +126,28 @@ int arch_bp_generic_fields(int type, int *gen_bp_type)
>   	return 0;
>   }
>   
> +/* Maximum len for DABR is 8 bytes and DAWR is 512 bytes */
> +static int hw_breakpoint_validate_len(struct arch_hw_breakpoint *hw)
> +{
> +	u16 length_max = 8;
> +	u16 final_len;

You should be more consistent in naming. If one is called final_len, the 
other one should be called max_len.

> +	unsigned long start_addr, end_addr;
> +
> +	final_len = hw_breakpoint_get_final_len(hw, &start_addr, &end_addr);
> +
> +	if (dawr_enabled()) {
> +		length_max = 512;
> +		/* DAWR region can't cross 512 bytes boundary */
> +		if ((start_addr >> 9) != (end_addr >> 9))
> +			return -EINVAL;
> +	}
> +
> +	if (final_len > length_max)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +

Is many places, we have those numeric 512 and 9 shift. Could we replace 
them by some symbol, for instance DAWR_SIZE and DAWR_SHIFT ?

>   /*
>    * Validate the arch-specific HW Breakpoint register settings
>    */
> @@ -133,12 +155,10 @@ int hw_breakpoint_arch_parse(struct perf_event *bp,
>   			     const struct perf_event_attr *attr,
>   			     struct arch_hw_breakpoint *hw)
>   {
> -	int length_max;
> -
>   	if (!ppc_breakpoint_available())
>   		return -ENODEV;
>   
> -	if (!bp)
> +	if (!bp || !attr->bp_len)
>   		return -EINVAL;
>   
>   	hw->type = HW_BRK_TYPE_TRANSLATE;
> @@ -160,23 +180,7 @@ int hw_breakpoint_arch_parse(struct perf_event *bp,
>   	hw->address = attr->bp_addr;
>   	hw->len = attr->bp_len;
>   
> -	length_max = 8; /* DABR */
> -	if (dawr_enabled()) {
> -		length_max = 512 ; /* 64 doublewords */
> -		/* DAWR region can't cross 512 bytes boundary */
> -		if ((hw->address >> 9) != ((hw->address + hw->len - 1) >> 9))
> -			return -EINVAL;
> -	}
> -
> -	/*
> -	 * Since breakpoint length can be a maximum of length_max and
> -	 * breakpoint addresses are aligned to nearest double-word
> -	 * HW_BREAKPOINT_ALIGN by rounding off to the lower address,
> -	 * the 'symbolsize' should satisfy the check below.
> -	 */
> -	if (hw->len > (length_max - (hw->address & HW_BREAKPOINT_ALIGN)))
> -		return -EINVAL;
> -	return 0;
> +	return hw_breakpoint_validate_len(hw);
>   }
>   
>   /*
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index 265fac9fb3a4..159aaa70de46 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -802,9 +802,39 @@ static int disable_dawr(void)
>   	return 0;
>   }
>   
> +/*
> + * Watchpoint match range is always doubleword(8 bytes) aligned on
> + * powerpc. If the given range is crossing doubleword boundary, we
> + * need to increase the length such that next doubleword also get
> + * covered. Ex,
> + *
> + *          address   len = 6 bytes
> + *                |=========.
> + *   |------------v--|------v--------|
> + *   | | | | | | | | | | | | | | | | |
> + *   |---------------|---------------|
> + *    <---8 bytes--->
> + *
> + * In this case, we should configure hw as:
> + *   start_addr = address & ~HW_BREAKPOINT_ALIGN
> + *   len = 16 bytes
> + *
> + * @start_addr and @end_addr are inclusive.
> + */
> +u16 hw_breakpoint_get_final_len(struct arch_hw_breakpoint *brk,
> +				unsigned long *start_addr,
> +				unsigned long *end_addr)
> +{
> +	*start_addr = brk->address & ~HW_BREAKPOINT_ALIGN;
> +	*end_addr = (brk->address + brk->len - 1) | HW_BREAKPOINT_ALIGN;
> +	return *end_addr - *start_addr + 1;
> +}

This function gives horrible code (a couple of unneeded store/re-read 
and read/re-read).

000006bc <hw_breakpoint_get_final_len>:
      6bc:	81 23 00 00 	lwz     r9,0(r3)
      6c0:	55 29 00 38 	rlwinm  r9,r9,0,0,28
      6c4:	91 24 00 00 	stw     r9,0(r4)
      6c8:	81 43 00 00 	lwz     r10,0(r3)
      6cc:	a1 23 00 06 	lhz     r9,6(r3)
      6d0:	38 6a ff ff 	addi    r3,r10,-1
      6d4:	7c 63 4a 14 	add     r3,r3,r9
      6d8:	60 63 00 07 	ori     r3,r3,7
      6dc:	90 65 00 00 	stw     r3,0(r5)
      6e0:	38 63 00 01 	addi    r3,r3,1
      6e4:	81 24 00 00 	lwz     r9,0(r4)
      6e8:	7c 69 18 50 	subf    r3,r9,r3
      6ec:	54 63 04 3e 	clrlwi  r3,r3,16
      6f0:	4e 80 00 20 	blr

Below code gives something better:

u16 hw_breakpoint_get_final_len(struct arch_hw_breakpoint *brk,
				unsigned long *start_addr,
				unsigned long *end_addr)
{
	unsigned long address = brk->address;
	unsigned long len = brk->len;
	unsigned long start = address & ~HW_BREAKPOINT_ALIGN;
	unsigned long end = (address + len - 1) | HW_BREAKPOINT_ALIGN;

	*start_addr = start;
	*end_addr = end;
	return end - start + 1;
}

000006bc <hw_breakpoint_get_final_len>:
      6bc:	81 43 00 00 	lwz     r10,0(r3)
      6c0:	a1 03 00 06 	lhz     r8,6(r3)
      6c4:	39 2a ff ff 	addi    r9,r10,-1
      6c8:	7d 28 4a 14 	add     r9,r8,r9
      6cc:	55 4a 00 38 	rlwinm  r10,r10,0,0,28
      6d0:	61 29 00 07 	ori     r9,r9,7
      6d4:	91 44 00 00 	stw     r10,0(r4)
      6d8:	20 6a 00 01 	subfic  r3,r10,1
      6dc:	91 25 00 00 	stw     r9,0(r5)
      6e0:	7c 63 4a 14 	add     r3,r3,r9
      6e4:	54 63 04 3e 	clrlwi  r3,r3,16
      6e8:	4e 80 00 20 	blr


And regardless, that's a pitty to have this function using pointers 
which are from local variables in the callers, as we loose the benefit 
of registers. Couldn't this function go in the .h as a static inline ? 
I'm sure the result would be worth it.

Christophe

> +
>   int set_dawr(struct arch_hw_breakpoint *brk)
>   {
>   	unsigned long dawr, dawrx, mrd;
> +	unsigned long start_addr, end_addr;
> +	u16 final_len;
>   
>   	if (brk->type == HW_BRK_TYPE_DISABLE)
>   		return disable_dawr();
> @@ -815,8 +845,8 @@ int set_dawr(struct arch_hw_breakpoint *brk)
>   	dawrx |= ((brk->type & HW_BRK_TYPE_TRANSLATE) >> 2) << (63 - 59);
>   	dawrx |= (brk->type & HW_BRK_TYPE_PRIV_ALL) >> 3;
>   
> -	/* brk->len is in bytes. */
> -	mrd = ((brk->len + 7) >> 3) - 1;
> +	final_len = hw_breakpoint_get_final_len(brk, &start_addr, &end_addr);
> +	mrd = ((final_len + 7) >> 3) - 1;
>   	dawrx |= (mrd & 0x3f) << (63 - 53);
>   
>   	if (ppc_md.set_dawr)
> 
