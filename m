Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF4A8CFD7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 11:40:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467l1l4CwQzDqkb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 19:40:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=bsingharora@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QIo/rJUu"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467kzw52wqzDqCY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 19:38:52 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id 196so6084085pfz.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 02:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WSQ8x3Kte6YBcS3BZS8foC9gRE9/UkfnKaeDUxU+eHY=;
 b=QIo/rJUuFDqHt+oiFtOQOTjviXEDmONNuz80zeXO0JMPFpycRGNgVJz+Lb/yBNCRK0
 +DBCLcoDbJ2m4YrJlnKfSN8ai1LI/TjLNBn8o7CuK5blsHmG2iv5hSNw7nt2S/Q3jDl+
 oeTJG3okbEll+vkcn8nC9mePVe4Dlyfxv/Qsv7CLhgNsnv5Qk21ZbF/opZvVL3P6NEDv
 QdeLP1ccRmDCdI8Nq48LjIaOLzCYlCPw7S9WS58oCymkYzWR++xj0EfqT+LEkTnN0HZJ
 NpnkEONIxp02WXwQx48jp+d2fZuSQShhuYb5j6CXT8vltAdoC8eT6IIBxiX21OFOpuu2
 i91g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WSQ8x3Kte6YBcS3BZS8foC9gRE9/UkfnKaeDUxU+eHY=;
 b=qVkMH0o7NclMFF473VcAzgTPW7ZYclFEMHkbK87QpGQKH2g6MQCihFbkPmzrpVK59Q
 25xMwfjnvkyTFpv12lEiTFgq7xT0MPi2FDS4dCjGvOKVn8VBeyZtuGr9uNZLiiYS+rXG
 /AR6LzwLfKjw5msOEtqUpb/PKuFG16uqKJkEPASE1xzcMG4rOd4PpPdmEaJuEal22pSM
 eixdF7+qFPtF9+LDqRn+6HHk9B1i3cyRKQG+CAzpW8LqW7ZoOPpKYlEH8+7gGDJtYu1H
 Emib8U5H9o2/VQFDzuw008e2nHo3Tkiqq3B0dD+jcey7tkk8p3aeOluBzGc6Bhj/WqU5
 S+ag==
X-Gm-Message-State: APjAAAUkKS+VOO/WGGNpLdld6evqVaBJdA6N0Z5UZe3DRTOg7+Eia5Q9
 gQ8BgGnw9CLt30e9Mc1WsNA=
X-Google-Smtp-Source: APXvYqyiyDadkE+jXau+W2rGx8eBCE9ekVdN1MRe4+I5lCQJYgQ1k56FF8qphx4XKd+fWL94RnRxbA==
X-Received: by 2002:a63:66c5:: with SMTP id
 a188mr38049168pgc.127.1565775530162; 
 Wed, 14 Aug 2019 02:38:50 -0700 (PDT)
Received: from [192.168.68.119] (203-219-253-117.static.tpgi.com.au.
 [203.219.253.117])
 by smtp.gmail.com with ESMTPSA id l31sm164137962pgm.63.2019.08.14.02.38.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 14 Aug 2019 02:38:48 -0700 (PDT)
Subject: Re: [PATCH v9 6/7] powerpc/mce: Handle UE event for memcpy_mcsafe
To: Santosh Sivaraj <santosh@fossix.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>
References: <20190812092236.16648-1-santosh@fossix.org>
 <20190812092236.16648-7-santosh@fossix.org>
From: Balbir Singh <bsingharora@gmail.com>
Message-ID: <d30efc87-69cb-60fe-0def-a8e2f489c320@gmail.com>
Date: Wed, 14 Aug 2019 19:38:43 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190812092236.16648-7-santosh@fossix.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Chandan Rajendra <chandan@linux.vnet.ibm.com>,
 Reza Arbab <arbab@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 12/8/19 7:22 pm, Santosh Sivaraj wrote:
> If we take a UE on one of the instructions with a fixup entry, set nip
> to continue execution at the fixup entry. Stop processing the event
> further or print it.
> 
> Co-developed-by: Reza Arbab <arbab@linux.ibm.com>
> Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
> ---

Isn't this based on https://patchwork.ozlabs.org/patch/895294/? If so it should still have my author tag and signed-off-by

Balbir Singh

>  arch/powerpc/include/asm/mce.h  |  4 +++-
>  arch/powerpc/kernel/mce.c       | 16 ++++++++++++++++
>  arch/powerpc/kernel/mce_power.c | 15 +++++++++++++--
>  3 files changed, 32 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/mce.h b/arch/powerpc/include/asm/mce.h
> index f3a6036b6bc0..e1931c8c2743 100644
> --- a/arch/powerpc/include/asm/mce.h
> +++ b/arch/powerpc/include/asm/mce.h
> @@ -122,7 +122,8 @@ struct machine_check_event {
>  			enum MCE_UeErrorType ue_error_type:8;
>  			u8		effective_address_provided;
>  			u8		physical_address_provided;
> -			u8		reserved_1[5];
> +			u8		ignore_event;
> +			u8		reserved_1[4];
>  			u64		effective_address;
>  			u64		physical_address;
>  			u8		reserved_2[8];
> @@ -193,6 +194,7 @@ struct mce_error_info {
>  	enum MCE_Initiator	initiator:8;
>  	enum MCE_ErrorClass	error_class:8;
>  	bool			sync_error;
> +	bool			ignore_event;
>  };
>  
>  #define MAX_MC_EVT	100
> diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
> index a3b122a685a5..ec4b3e1087be 100644
> --- a/arch/powerpc/kernel/mce.c
> +++ b/arch/powerpc/kernel/mce.c
> @@ -149,6 +149,7 @@ void save_mce_event(struct pt_regs *regs, long handled,
>  		if (phys_addr != ULONG_MAX) {
>  			mce->u.ue_error.physical_address_provided = true;
>  			mce->u.ue_error.physical_address = phys_addr;
> +			mce->u.ue_error.ignore_event = mce_err->ignore_event;
>  			machine_check_ue_event(mce);
>  		}
>  	}
> @@ -266,8 +267,17 @@ static void machine_process_ue_event(struct work_struct *work)
>  		/*
>  		 * This should probably queued elsewhere, but
>  		 * oh! well
> +		 *
> +		 * Don't report this machine check because the caller has a
> +		 * asked us to ignore the event, it has a fixup handler which
> +		 * will do the appropriate error handling and reporting.
>  		 */
>  		if (evt->error_type == MCE_ERROR_TYPE_UE) {
> +			if (evt->u.ue_error.ignore_event) {
> +				__this_cpu_dec(mce_ue_count);
> +				continue;
> +			}
> +
>  			if (evt->u.ue_error.physical_address_provided) {
>  				unsigned long pfn;
>  
> @@ -301,6 +311,12 @@ static void machine_check_process_queued_event(struct irq_work *work)
>  	while (__this_cpu_read(mce_queue_count) > 0) {
>  		index = __this_cpu_read(mce_queue_count) - 1;
>  		evt = this_cpu_ptr(&mce_event_queue[index]);
> +
> +		if (evt->error_type == MCE_ERROR_TYPE_UE &&
> +		    evt->u.ue_error.ignore_event) {
> +			__this_cpu_dec(mce_queue_count);
> +			continue;
> +		}
>  		machine_check_print_event_info(evt, false, false);
>  		__this_cpu_dec(mce_queue_count);
>  	}
> diff --git a/arch/powerpc/kernel/mce_power.c b/arch/powerpc/kernel/mce_power.c
> index e74816f045f8..1dd87f6f5186 100644
> --- a/arch/powerpc/kernel/mce_power.c
> +++ b/arch/powerpc/kernel/mce_power.c
> @@ -11,6 +11,7 @@
>  
>  #include <linux/types.h>
>  #include <linux/ptrace.h>
> +#include <linux/extable.h>
>  #include <asm/mmu.h>
>  #include <asm/mce.h>
>  #include <asm/machdep.h>
> @@ -18,6 +19,7 @@
>  #include <asm/pte-walk.h>
>  #include <asm/sstep.h>
>  #include <asm/exception-64s.h>
> +#include <asm/extable.h>
>  
>  /*
>   * Convert an address related to an mm to a physical address.
> @@ -559,9 +561,18 @@ static int mce_handle_derror(struct pt_regs *regs,
>  	return 0;
>  }
>  
> -static long mce_handle_ue_error(struct pt_regs *regs)
> +static long mce_handle_ue_error(struct pt_regs *regs,
> +				struct mce_error_info *mce_err)
>  {
>  	long handled = 0;
> +	const struct exception_table_entry *entry;
> +
> +	entry = search_kernel_exception_table(regs->nip);
> +	if (entry) {
> +		mce_err->ignore_event = true;
> +		regs->nip = extable_fixup(entry);
> +		return 1;
> +	}
>  
>  	/*
>  	 * On specific SCOM read via MMIO we may get a machine check
> @@ -594,7 +605,7 @@ static long mce_handle_error(struct pt_regs *regs,
>  				&phys_addr);
>  
>  	if (!handled && mce_err.error_type == MCE_ERROR_TYPE_UE)
> -		handled = mce_handle_ue_error(regs);
> +		handled = mce_handle_ue_error(regs, &mce_err);
>  
>  	save_mce_event(regs, handled, &mce_err, regs->nip, addr, phys_addr);
>  
> 
