Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E138CE26
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 10:15:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467j7t5GFKzDqlL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 18:15:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mahesh@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467j6G5sp6zDqTq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 18:14:14 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7E8E52o061853
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 04:14:11 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uccsavd2a-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 04:14:07 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <mahesh@linux.vnet.ibm.com>;
 Wed, 14 Aug 2019 09:12:00 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 14 Aug 2019 09:11:57 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x7E8BtJB36634886
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Aug 2019 08:11:55 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 70C44A404D;
 Wed, 14 Aug 2019 08:11:55 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 78BC2A4057;
 Wed, 14 Aug 2019 08:11:51 +0000 (GMT)
Received: from [9.109.198.140] (unknown [9.109.198.140])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 14 Aug 2019 08:11:51 +0000 (GMT)
Subject: Re: [PATCH v9 6/7] powerpc/mce: Handle UE event for memcpy_mcsafe
To: Santosh Sivaraj <santosh@fossix.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>
References: <20190812092236.16648-1-santosh@fossix.org>
 <20190812092236.16648-7-santosh@fossix.org>
From: Mahesh Jagannath Salgaonkar <mahesh@linux.vnet.ibm.com>
Date: Wed, 14 Aug 2019 13:41:50 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190812092236.16648-7-santosh@fossix.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19081408-4275-0000-0000-0000035905CB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19081408-4276-0000-0000-0000386B17EF
Message-Id: <7228295c-c4c3-4aa1-1b1a-60b3844705db@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-14_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908140081
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

On 8/12/19 2:52 PM, Santosh Sivaraj wrote:
> If we take a UE on one of the instructions with a fixup entry, set nip
> to continue execution at the fixup entry. Stop processing the event
> further or print it.
> 
> Co-developed-by: Reza Arbab <arbab@linux.ibm.com>
> Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Signed-off-by: Santosh Sivaraj <santosh@fossix.org>

Looks good to me.

Reviewed-by: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>

Thanks,
-Mahesh.

> ---
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

