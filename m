Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B2D8E1C7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 02:17:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4686V143k4zDqrT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 10:17:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="TRB8dion"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4686Rz1ZcHzDqxX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 10:15:58 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id n190so461905pgn.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 17:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=5yB17XHR86lGuQrA/ZJaDNbY9uqpWZZpGdjQUMhPl8I=;
 b=TRB8dionSp8agS6/1gjAi6vYXCUgJPza2c96eNmgG2fBKmd9iUkGNV6D/0V/wVrEea
 fKCAtE57dxKVZtLnsWxmHdfhiEmBlWGIPD9WY9qdmgR2cediJCI9izhP9wG7QlMUCFYv
 l7nlqJtb7H9wGbWHOcetXfITTZJJ0xoyCj1UP52UbBoQQu+lw4GGWpDFGt3ljf18ZD4G
 jEMiwIhz3KNIsyo4mVkZnneqd87HTYu3lWuOhl3JpNqEG0bmEbxOtMrRJxf+HpSLCPt7
 8KFupI7XWBlyWYQ/ntwtIkzJDMe2OYtqc7noUG7XlNuNpHD51s+uTbSuQU/4BcF7XASg
 Qn+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=5yB17XHR86lGuQrA/ZJaDNbY9uqpWZZpGdjQUMhPl8I=;
 b=fJeRmjLeV6IJO4f0oeDbmdU2tCDMA//42r8TjQ7Bong4RZlB0IeCWfl8Pz29OT+YQ5
 ML53D/iTEMgNOdQkTQgi5/k6nSLSaq+PJSMqkYBLJV2EbfJeds5dhxTPQJ40SspKyU9K
 fb1ggdZn/dm+SDJPUfEU/OI0JrisHewUh0tbqsKXSTdQbk3gtJ+QHIhNekXb6fZ+zC3l
 MaDroZMA6BJoDZj1/+P60RMr27he8eLGOzkoo1dJLfwT4qoNb8tAPNDx8eK8SQAcjHF8
 kwZDdWcDj5vmJNLnk6p46Bd59CUz61/L2WaSoo7t9eyc/3OUTmmfII7cAMkYo8RFW7k5
 FYRA==
X-Gm-Message-State: APjAAAVyBz/jBb54FdSBlFE/xXE6Ey4ZqQJPCtunAxZwFRJVrB91fNBA
 yU0W6KOm9SsQRUdBDdIrYUcsNw==
X-Google-Smtp-Source: APXvYqwY+MmchG4n1pzWS/tBJvwjaL+qhcuI9olBVHCi0C/mMYkF0jOKZnWPZFf1ahWh2DGW/6XTKQ==
X-Received: by 2002:a63:d84e:: with SMTP id k14mr1439400pgj.234.1565828155080; 
 Wed, 14 Aug 2019 17:15:55 -0700 (PDT)
Received: from localhost ([49.205.218.176])
 by smtp.gmail.com with ESMTPSA id q13sm1055061pfl.124.2019.08.14.17.15.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 17:15:54 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: Balbir Singh <bsingharora@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 6/7] powerpc/mce: Handle UE event for memcpy_mcsafe
In-Reply-To: <d30efc87-69cb-60fe-0def-a8e2f489c320@gmail.com>
References: <20190812092236.16648-1-santosh@fossix.org>
 <20190812092236.16648-7-santosh@fossix.org>
 <d30efc87-69cb-60fe-0def-a8e2f489c320@gmail.com>
Date: Thu, 15 Aug 2019 05:45:51 +0530
Message-ID: <87zhkbp9l4.fsf@santosiv.in.ibm.com>
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

Hi Balbir,

Balbir Singh <bsingharora@gmail.com> writes:

> On 12/8/19 7:22 pm, Santosh Sivaraj wrote:
>> If we take a UE on one of the instructions with a fixup entry, set nip
>> to continue execution at the fixup entry. Stop processing the event
>> further or print it.
>> 
>> Co-developed-by: Reza Arbab <arbab@linux.ibm.com>
>> Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
>> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>> Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
>> ---
>
> Isn't this based on https://patchwork.ozlabs.org/patch/895294/? If so it
> should still have my author tag and signed-off-by

Originally when I received the series for posting, I had Reza's authorship and
signed-off-by, since the patch changed significantly I added co-developed-by as
Reza. I will update in the next spin.

https://lore.kernel.org/linuxppc-dev/20190702051932.511-1-santosh@fossix.org/

Santosh
>
> Balbir Singh
>
>>  arch/powerpc/include/asm/mce.h  |  4 +++-
>>  arch/powerpc/kernel/mce.c       | 16 ++++++++++++++++
>>  arch/powerpc/kernel/mce_power.c | 15 +++++++++++++--
>>  3 files changed, 32 insertions(+), 3 deletions(-)
>> 
>> diff --git a/arch/powerpc/include/asm/mce.h b/arch/powerpc/include/asm/mce.h
>> index f3a6036b6bc0..e1931c8c2743 100644
>> --- a/arch/powerpc/include/asm/mce.h
>> +++ b/arch/powerpc/include/asm/mce.h
>> @@ -122,7 +122,8 @@ struct machine_check_event {
>>  			enum MCE_UeErrorType ue_error_type:8;
>>  			u8		effective_address_provided;
>>  			u8		physical_address_provided;
>> -			u8		reserved_1[5];
>> +			u8		ignore_event;
>> +			u8		reserved_1[4];
>>  			u64		effective_address;
>>  			u64		physical_address;
>>  			u8		reserved_2[8];
>> @@ -193,6 +194,7 @@ struct mce_error_info {
>>  	enum MCE_Initiator	initiator:8;
>>  	enum MCE_ErrorClass	error_class:8;
>>  	bool			sync_error;
>> +	bool			ignore_event;
>>  };
>>  
>>  #define MAX_MC_EVT	100
>> diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
>> index a3b122a685a5..ec4b3e1087be 100644
>> --- a/arch/powerpc/kernel/mce.c
>> +++ b/arch/powerpc/kernel/mce.c
>> @@ -149,6 +149,7 @@ void save_mce_event(struct pt_regs *regs, long handled,
>>  		if (phys_addr != ULONG_MAX) {
>>  			mce->u.ue_error.physical_address_provided = true;
>>  			mce->u.ue_error.physical_address = phys_addr;
>> +			mce->u.ue_error.ignore_event = mce_err->ignore_event;
>>  			machine_check_ue_event(mce);
>>  		}
>>  	}
>> @@ -266,8 +267,17 @@ static void machine_process_ue_event(struct work_struct *work)
>>  		/*
>>  		 * This should probably queued elsewhere, but
>>  		 * oh! well
>> +		 *
>> +		 * Don't report this machine check because the caller has a
>> +		 * asked us to ignore the event, it has a fixup handler which
>> +		 * will do the appropriate error handling and reporting.
>>  		 */
>>  		if (evt->error_type == MCE_ERROR_TYPE_UE) {
>> +			if (evt->u.ue_error.ignore_event) {
>> +				__this_cpu_dec(mce_ue_count);
>> +				continue;
>> +			}
>> +
>>  			if (evt->u.ue_error.physical_address_provided) {
>>  				unsigned long pfn;
>>  
>> @@ -301,6 +311,12 @@ static void machine_check_process_queued_event(struct irq_work *work)
>>  	while (__this_cpu_read(mce_queue_count) > 0) {
>>  		index = __this_cpu_read(mce_queue_count) - 1;
>>  		evt = this_cpu_ptr(&mce_event_queue[index]);
>> +
>> +		if (evt->error_type == MCE_ERROR_TYPE_UE &&
>> +		    evt->u.ue_error.ignore_event) {
>> +			__this_cpu_dec(mce_queue_count);
>> +			continue;
>> +		}
>>  		machine_check_print_event_info(evt, false, false);
>>  		__this_cpu_dec(mce_queue_count);
>>  	}
>> diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_power.c
>> index e74816f045f8..1dd87f6f5186 100644
>> --- a/arch/powerpc/kernel/mce_power.c
>> +++ b/arch/powerpc/kernel/mce_power.c
>> @@ -11,6 +11,7 @@
>>  
>>  #include <linux/types.h>
>>  #include <linux/ptrace.h>
>> +#include <linux/extable.h>
>>  #include <asm/mmu.h>
>>  #include <asm/mce.h>
>>  #include <asm/machdep.h>
>> @@ -18,6 +19,7 @@
>>  #include <asm/pte-walk.h>
>>  #include <asm/sstep.h>
>>  #include <asm/exception-64s.h>
>> +#include <asm/extable.h>
>>  
>>  /*
>>   * Convert an address related to an mm to a physical address.
>> @@ -559,9 +561,18 @@ static int mce_handle_derror(struct pt_regs *regs,
>>  	return 0;
>>  }
>>  
>> -static long mce_handle_ue_error(struct pt_regs *regs)
>> +static long mce_handle_ue_error(struct pt_regs *regs,
>> +				struct mce_error_info *mce_err)
>>  {
>>  	long handled = 0;
>> +	const struct exception_table_entry *entry;
>> +
>> +	entry = search_kernel_exception_table(regs->nip);
>> +	if (entry) {
>> +		mce_err->ignore_event = true;
>> +		regs->nip = extable_fixup(entry);
>> +		return 1;
>> +	}
>>  
>>  	/*
>>  	 * On specific SCOM read via MMIO we may get a machine check
>> @@ -594,7 +605,7 @@ static long mce_handle_error(struct pt_regs *regs,
>>  				&phys_addr);
>>  
>>  	if (!handled && mce_err.error_type == MCE_ERROR_TYPE_UE)
>> -		handled = mce_handle_ue_error(regs);
>> +		handled = mce_handle_ue_error(regs, &mce_err);
>>  
>>  	save_mce_event(regs, handled, &mce_err, regs->nip, addr, phys_addr);
>>  
>> 
