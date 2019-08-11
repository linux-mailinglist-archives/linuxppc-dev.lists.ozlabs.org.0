Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2931288EFE
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Aug 2019 03:34:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 465hNB4gjxzDrBg
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Aug 2019 11:34:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="qNSbQf4q"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 465hLN1v42zDr70
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Aug 2019 11:32:43 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id w24so46491298plp.2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Aug 2019 18:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=xDbdhPQ3QT7gF9yHOSPbJa8hYNyqWu2iQmr6Xb0YzUA=;
 b=qNSbQf4q28lHSOKSvi+eAA78dUYvFPX9rJCfEplQ4Z2aSSFGg3Nb9Rk1hLvpFiapB9
 LVTHjAPonjlFWPuwTolGzJhJLsNPucQEZ0LUNoDJaqec8qPKBwLZRu7Fj44fc4cFjOom
 IU6mWfxAX7aox+P7Qqm5RnLv70xxgPrVuF7QzL52X01r8h5M2EbF4DK7V45kjINdHSqf
 gZNx5aQ5bXmq8HjLY42FAYFG6DJ6OQYJbq1qmsnpykIj1MW71cj+iCMMBls8ww212b48
 A1Lgil3AiZK36Mo37rOAxeBn5bvfiE3kTN25iG560apIB/9rI8rNPMtzVy0LASeJQtjW
 kULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=xDbdhPQ3QT7gF9yHOSPbJa8hYNyqWu2iQmr6Xb0YzUA=;
 b=BcbMPuQENC3tQxnSGA3cEP9FCTT31/cpy50Gquig/VSIVEkfBOTCrilZk/4AcRk2d4
 xsQxCJi4v01Q0NYqM61B39N1HnPI4i8yWu16bHksQYHjp5Qc/EAGOyNlNbMFw8XN1+0O
 5eSsMAPbuMdbBxlKejScPyr5WiMb6tN6jY7pw6kb+U+I+Fa8RTdWFcZtYzQvGguk6CVh
 qCygpxOGFcNJxUqseMJFKdUGDETVVuPuBFzUxtutGyvK11XAyLBdmCEH1ckMcNJNruIr
 3/KwgZBAAZEJbNSJcFd9ZKEqL0s9PHyrZhRHsyZmgtkHltpkTgPNSWnCRyumSTmtHSDi
 mCOA==
X-Gm-Message-State: APjAAAVLo2PVD2I/seiCyr02QOzRtcyUGfKcf8hkecDsok+KilP8okCi
 irv2rR/GzXfaHBktmaP0kFKEwQ==
X-Google-Smtp-Source: APXvYqzaQlGlI3jqb5AY7EeLc6Mh9LKfAj2eQ8o/ZNlKoLUwacolB1HYd1iDASAP51gabqn4/ndXEw==
X-Received: by 2002:a17:902:9346:: with SMTP id
 g6mr26575152plp.61.1565487160141; 
 Sat, 10 Aug 2019 18:32:40 -0700 (PDT)
Received: from localhost ([183.82.18.139])
 by smtp.gmail.com with ESMTPSA id v27sm146159299pgn.76.2019.08.10.18.32.38
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 10 Aug 2019 18:32:39 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: Mahesh Jagannath Salgaonkar <mahesh@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 3/7] powerpc/mce: Fix MCE handling for huge pages
In-Reply-To: <9b3e144e-8f12-de24-ff6a-ea599dc6e021@linux.vnet.ibm.com>
References: <20190807145700.25599-1-santosh@fossix.org>
 <20190807145700.25599-4-santosh@fossix.org>
 <9b3e144e-8f12-de24-ff6a-ea599dc6e021@linux.vnet.ibm.com>
Date: Sun, 11 Aug 2019 07:02:36 +0530
Message-ID: <87pnlc8p1n.fsf@santosiv.in.ibm.com>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Chandan Rajendra <chandan@linux.vnet.ibm.com>,
 Reza Arbab <arbab@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mahesh Jagannath Salgaonkar <mahesh@linux.vnet.ibm.com> writes:

> On 8/7/19 8:26 PM, Santosh Sivaraj wrote:
>> From: Balbir Singh <bsingharora@gmail.com>
>> 
>> The current code would fail on huge pages addresses, since the shift would
>> be incorrect. Use the correct page shift value returned by
>> __find_linux_pte() to get the correct physical address. The code is more
>> generic and can handle both regular and compound pages.
>> 
>> Fixes: ba41e1e1ccb9 ("powerpc/mce: Hookup derror (load/store) UE errors")
>> Signed-off-by: Balbir Singh <bsingharora@gmail.com>
>> [arbab@linux.ibm.com: Fixup pseries_do_memory_failure()]
>> Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
>> Co-developed-by: Santosh Sivaraj <santosh@fossix.org>
>> Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
>> ---
>>  arch/powerpc/include/asm/mce.h       |  2 +-
>>  arch/powerpc/kernel/mce_power.c      | 50 ++++++++++++++--------------
>>  arch/powerpc/platforms/pseries/ras.c |  9 ++---
>>  3 files changed, 29 insertions(+), 32 deletions(-)
>> 
>> diff --git a/arch/powerpc/include/asm/mce.h b/arch/powerpc/include/asm/mce.h
>> index a4c6a74ad2fb..f3a6036b6bc0 100644
>> --- a/arch/powerpc/include/asm/mce.h
>> +++ b/arch/powerpc/include/asm/mce.h
>> @@ -209,7 +209,7 @@ extern void release_mce_event(void);
>>  extern void machine_check_queue_event(void);
>>  extern void machine_check_print_event_info(struct machine_check_event *evt,
>>  					   bool user_mode, bool in_guest);
>> -unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr);
>> +unsigned long addr_to_phys(struct pt_regs *regs, unsigned long addr);
>>  #ifdef CONFIG_PPC_BOOK3S_64
>>  void flush_and_reload_slb(void);
>>  #endif /* CONFIG_PPC_BOOK3S_64 */
>> diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_power.c
>> index a814d2dfb5b0..bed38a8e2e50 100644
>> --- a/arch/powerpc/kernel/mce_power.c
>> +++ b/arch/powerpc/kernel/mce_power.c
>> @@ -20,13 +20,14 @@
>>  #include <asm/exception-64s.h>
>>  
>>  /*
>> - * Convert an address related to an mm to a PFN. NOTE: we are in real
>> - * mode, we could potentially race with page table updates.
>> + * Convert an address related to an mm to a physical address.
>> + * NOTE: we are in real mode, we could potentially race with page table updates.
>>   */
>> -unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr)
>> +unsigned long addr_to_phys(struct pt_regs *regs, unsigned long addr)
>>  {
>> -	pte_t *ptep;
>> -	unsigned long flags;
>> +	pte_t *ptep, pte;
>> +	unsigned int shift;
>> +	unsigned long flags, phys_addr;
>>  	struct mm_struct *mm;
>>  
>>  	if (user_mode(regs))
>> @@ -35,14 +36,21 @@ unsigned long addr_to_pfn(struct pt_regs *regs, unsigned long addr)
>>  		mm = &init_mm;
>>  
>>  	local_irq_save(flags);
>> -	if (mm == current->mm)
>> -		ptep = find_current_mm_pte(mm->pgd, addr, NULL, NULL);
>> -	else
>> -		ptep = find_init_mm_pte(addr, NULL);
>> +	ptep = __find_linux_pte(mm->pgd, addr, NULL, &shift);
>>  	local_irq_restore(flags);
>> +
>>  	if (!ptep || pte_special(*ptep))
>>  		return ULONG_MAX;
>> -	return pte_pfn(*ptep);
>> +
>> +	pte = *ptep;
>> +	if (shift > PAGE_SHIFT) {
>> +		unsigned long rpnmask = (1ul << shift) - PAGE_SIZE;
>> +
>> +		pte = __pte(pte_val(pte) | (addr & rpnmask));
>> +	}
>> +	phys_addr = pte_pfn(pte) << PAGE_SHIFT;
>> +
>> +	return phys_addr;
>>  }
>>  
>>  /* flush SLBs and reload */
>> @@ -354,18 +362,16 @@ static int mce_find_instr_ea_and_pfn(struct pt_regs *regs, uint64_t *addr,
>
> Now that we have addr_to_phys() can we change this function name as well
> to mce_find_instr_ea_and_phys() ?

Makes sense, will avoid confusions.

>
> Tested-by: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
>
> This should go to stable tree. Can you move this patch to 2nd position ?

Thanks for testing. Sure. Will reorder and mark stable as well.

Thanks,
Santosh
>
> Thanks,
> -Mahesh.
>
