Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A4985A5E9E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 02:34:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Mnyv6Y3yzDqfr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 10:34:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=popple.id.au
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=alistair@popple.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Mnx60yZ3zDqTj
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 10:33:11 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x830W2fT141597
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 2 Sep 2019 20:33:07 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2us8327xhq-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Sep 2019 20:33:06 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alistair@popple.id.au>;
 Tue, 3 Sep 2019 01:33:05 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 3 Sep 2019 01:33:02 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x830X2VG45941084
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Sep 2019 00:33:02 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DE61511C05C;
 Tue,  3 Sep 2019 00:33:01 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 026E711C04C;
 Tue,  3 Sep 2019 00:33:01 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  3 Sep 2019 00:33:00 +0000 (GMT)
Received: from townsend.localnet (unknown [9.102.39.70])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8DD3DA00EC;
 Tue,  3 Sep 2019 10:32:57 +1000 (AEST)
From: Alistair Popple <alistair@popple.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 6/6] powerpc/64s/radix: introduce options to disable use
 of the tlbie instruction
Date: Tue, 03 Sep 2019 10:32:56 +1000
In-Reply-To: <20190902152931.17840-7-npiggin@gmail.com>
References: <20190902152931.17840-1-npiggin@gmail.com>
 <20190902152931.17840-7-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-TM-AS-GCONF: 00
x-cbid: 19090300-0028-0000-0000-00000396DB5B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19090300-0029-0000-0000-00002459269E
Message-Id: <2435845.pBas4ZpoTR@townsend>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-02_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=388 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909030002
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

Nick,

On Tuesday, 3 September 2019 1:29:31 AM AEST Nicholas Piggin wrote:
> Introduce two options to control the use of the tlbie instruction. A
> boot time option which completely disables the kernel using the
> instruction, this is currently incompatible with HASH MMU, KVM, and
> coherent accelerators.

Some accelerators (eg. cxl, ocxl, npu) call mm_context_add_copro() to force 
global TLB invalidations:

static inline void mm_context_add_copro(struct mm_struct *mm)
{
        /*
         * If any copro is in use, increment the active CPU count
         * in order to force TLB invalidations to be global as to
         * propagate to the Nest MMU.
         */
        if (atomic_inc_return(&mm->context.copros) == 1)
                inc_mm_active_cpus(mm);
}

Admittedly I haven't dug into all the details of this patch but it sounds like 
it might break the above if TLBIE is disabled. Do you think we should add a 
WARN_ON if mm_context_add_copro() is called with TLBIE disabled? Or perhaps 
even force TLBIE to be re-enabled if it is called with it disabled?

- Alistair

> And a debugfs option can be switched at runtime and avoids using tlbie
> for invalidating CPU TLBs for normal process and kernel address
> mappings. Coherent accelerators are still managed with tlbie, as will
> KVM partition scope translations.
> 
> Cross-CPU TLB flushing is implemented with IPIs and tlbiel. This is a
> basic implementation which does not attempt to make any optimisation
> beyond the tlbie implementation.
> 
> This is useful for performance testing among other things. For example
> in certain situations on large systems, using IPIs may be faster than
> tlbie as they can be directed rather than broadcast. Later we may also
> take advantage of the IPIs to do more interesting things such as trim
> the mm cpumask more aggressively.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  .../admin-guide/kernel-parameters.txt         |   4 +
>  arch/powerpc/include/asm/book3s/64/tlbflush.h |   9 +
>  arch/powerpc/kvm/book3s_hv.c                  |   6 +
>  arch/powerpc/mm/book3s64/pgtable.c            |  47 +++++
>  arch/powerpc/mm/book3s64/radix_tlb.c          | 190 ++++++++++++++++--
>  drivers/misc/cxl/main.c                       |   4 +
>  drivers/misc/ocxl/main.c                      |   4 +
>  7 files changed, 246 insertions(+), 18 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/
admin-guide/kernel-parameters.txt
> index d3cbb3ae62b6..65ae16549aa3 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -860,6 +860,10 @@
>  	disable_radix	[PPC]
>  			Disable RADIX MMU mode on POWER9
>  
> +	disable_tlbie	[PPC]
> +			Disable TLBIE instruction. Currently does not work
> +			with KVM, with HASH MMU, or with coherent accelerators.
> +
>  	disable_cpu_apicid= [X86,APIC,SMP]
>  			Format: <int>
>  			The number of initial APIC ID for the
> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush.h b/arch/powerpc/
include/asm/book3s/64/tlbflush.h
> index ebf572ea621e..7aa8195b6cff 100644
> --- a/arch/powerpc/include/asm/book3s/64/tlbflush.h
> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush.h
> @@ -162,4 +162,13 @@ static inline void flush_tlb_pgtable(struct mmu_gather 
*tlb, unsigned long addre
>  
>  	radix__flush_tlb_pwc(tlb, address);
>  }
> +
> +extern bool tlbie_capable;
> +extern bool tlbie_enabled;
> +
> +static inline bool cputlb_use_tlbie(void)
> +{
> +	return tlbie_enabled;
> +}
> +
>  #endif /*  _ASM_POWERPC_BOOK3S_64_TLBFLUSH_H */
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index cde3f5a4b3e4..3cdaa2a09a19 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -5462,6 +5462,12 @@ static int kvmppc_radix_possible(void)
>  static int kvmppc_book3s_init_hv(void)
>  {
>  	int r;
> +
> +	if (!tlbie_capable) {
> +		pr_err("KVM-HV: Host does not support TLBIE\n");
> +		return -ENODEV;
> +	}
> +
>  	/*
>  	 * FIXME!! Do we need to check on all cpus ?
>  	 */
> diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/
pgtable.c
> index 351eb78eed55..75483b40fcb1 100644
> --- a/arch/powerpc/mm/book3s64/pgtable.c
> +++ b/arch/powerpc/mm/book3s64/pgtable.c
> @@ -8,6 +8,7 @@
>  #include <linux/memblock.h>
>  #include <misc/cxl-base.h>
>  
> +#include <asm/debugfs.h>
>  #include <asm/pgalloc.h>
>  #include <asm/tlb.h>
>  #include <asm/trace.h>
> @@ -469,3 +470,49 @@ int pmd_move_must_withdraw(struct spinlock 
*new_pmd_ptl,
>  
>  	return true;
>  }
> +
> +/*
> + * Does the CPU support tlbie?
> + */
> +bool tlbie_capable __read_mostly = true;
> +EXPORT_SYMBOL(tlbie_capable);
> +
> +/*
> + * Should tlbie be used for management of CPU TLBs, for kernel and process
> + * address spaces? tlbie may still be used for nMMU accelerators, and for 
KVM
> + * guest address spaces.
> + */
> +bool tlbie_enabled __read_mostly = true;
> +
> +static int __init setup_disable_tlbie(char *str)
> +{
> +	if (!radix_enabled()) {
> +		pr_err("disable_tlbie: Unable to disable TLBIE with Hash MMU.\n");
> +		return 1;
> +	}
> +
> +	tlbie_capable = false;
> +	tlbie_enabled = false;
> +
> +        return 1;
> +}
> +__setup("disable_tlbie", setup_disable_tlbie);
> +
> +static int __init pgtable_debugfs_setup(void)
> +{
> +	if (!tlbie_capable)
> +		return 0;
> +
> +	/*
> +	 * There is no locking vs tlb flushing when changing this value.
> +	 * The tlb flushers will see one value or another, and use either
> +	 * tlbie or tlbiel with IPIs. In both cases the TLBs will be
> +	 * invalidated as expected.
> +	 */
> +	debugfs_create_bool("tlbie_enabled", 0600,
> +			powerpc_debugfs_root,
> +			&tlbie_enabled);
> +
> +	return 0;
> +}
> +arch_initcall(pgtable_debugfs_setup);
> diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/
radix_tlb.c
> index f9cf8ae59831..631be42abd33 100644
> --- a/arch/powerpc/mm/book3s64/radix_tlb.c
> +++ b/arch/powerpc/mm/book3s64/radix_tlb.c
> @@ -270,6 +270,39 @@ static inline void _tlbie_pid(unsigned long pid, 
unsigned long ric)
>  	asm volatile("eieio; tlbsync; ptesync": : :"memory");
>  }
>  
> +struct tlbiel_pid {
> +	unsigned long pid;
> +	unsigned long ric;
> +};
> +
> +static void do_tlbiel_pid(void *info)
> +{
> +	struct tlbiel_pid *t = info;
> +
> +	if (t->ric == RIC_FLUSH_TLB)
> +		_tlbiel_pid(t->pid, RIC_FLUSH_TLB);
> +	else if (t->ric == RIC_FLUSH_PWC)
> +		_tlbiel_pid(t->pid, RIC_FLUSH_PWC);
> +	else
> +		_tlbiel_pid(t->pid, RIC_FLUSH_ALL);
> +}
> +
> +static inline void _tlbiel_pid_multicast(struct mm_struct *mm,
> +				unsigned long pid, unsigned long ric)
> +{
> +	struct cpumask *cpus = mm_cpumask(mm);
> +	struct tlbiel_pid t = { .pid = pid, .ric = ric };
> +
> +	on_each_cpu_mask(cpus, do_tlbiel_pid, &t, 1);
> +	/*
> +	 * Always want the CPU translations to be invalidated with tlbiel in
> +	 * these paths, so while coprocessors must use tlbie, we can not
> +	 * optimise away the tlbiel component.
> +	 */
> +	if (atomic_read(&mm->context.copros) > 0)
> +		_tlbie_pid(pid, RIC_FLUSH_ALL);
> +}
> +
>  static inline void _tlbie_lpid(unsigned long lpid, unsigned long ric)
>  {
>  	asm volatile("ptesync": : :"memory");
> @@ -370,6 +403,53 @@ static __always_inline void _tlbie_va(unsigned long va, 
unsigned long pid,
>  	asm volatile("eieio; tlbsync; ptesync": : :"memory");
>  }
>  
> +struct tlbiel_va {
> +	unsigned long pid;
> +	unsigned long va;
> +	unsigned long psize;
> +	unsigned long ric;
> +};
> +
> +static void do_tlbiel_va(void *info)
> +{
> +	struct tlbiel_va *t = info;
> +
> +	if (t->ric == RIC_FLUSH_TLB)
> +		_tlbiel_va(t->va, t->pid, t->psize, RIC_FLUSH_TLB);
> +	else if (t->ric == RIC_FLUSH_PWC)
> +		_tlbiel_va(t->va, t->pid, t->psize, RIC_FLUSH_PWC);
> +	else
> +		_tlbiel_va(t->va, t->pid, t->psize, RIC_FLUSH_ALL);
> +}
> +
> +static inline void _tlbiel_va_multicast(struct mm_struct *mm,
> +				unsigned long va, unsigned long pid,
> +				unsigned long psize, unsigned long ric)
> +{
> +	struct cpumask *cpus = mm_cpumask(mm);
> +	struct tlbiel_va t = { .va = va, .pid = pid, .psize = psize, .ric = ric };
> +	on_each_cpu_mask(cpus, do_tlbiel_va, &t, 1);
> +	if (atomic_read(&mm->context.copros) > 0)
> +		_tlbie_va(va, pid, psize, RIC_FLUSH_TLB);
> +}
> +
> +struct tlbiel_va_range {
> +	unsigned long pid;
> +	unsigned long start;
> +	unsigned long end;
> +	unsigned long page_size;
> +	unsigned long psize;
> +	bool also_pwc;
> +};
> +
> +static void do_tlbiel_va_range(void *info)
> +{
> +	struct tlbiel_va_range *t = info;
> +
> +	_tlbiel_va_range(t->start, t->end, t->pid, t->page_size,
> +				    t->psize, t->also_pwc);
> +}
> +
>  static __always_inline void _tlbie_lpid_va(unsigned long va, unsigned long 
lpid,
>  			      unsigned long psize, unsigned long ric)
>  {
> @@ -393,6 +473,21 @@ static inline void _tlbie_va_range(unsigned long start, 
unsigned long end,
>  	asm volatile("eieio; tlbsync; ptesync": : :"memory");
>  }
>  
> +static inline void _tlbiel_va_range_multicast(struct mm_struct *mm,
> +				unsigned long start, unsigned long end,
> +				unsigned long pid, unsigned long page_size,
> +				unsigned long psize, bool also_pwc)
> +{
> +	struct cpumask *cpus = mm_cpumask(mm);
> +	struct tlbiel_va_range t = { .start = start, .end = end,
> +				.pid = pid, .page_size = page_size,
> +				.psize = psize, .also_pwc = also_pwc };
> +
> +	on_each_cpu_mask(cpus, do_tlbiel_va_range, &t, 1);
> +	if (atomic_read(&mm->context.copros) > 0)
> +		_tlbie_va_range(start, end, pid, page_size, psize, also_pwc);
> +}
> +
>  /*
>   * Base TLB flushing operations:
>   *
> @@ -530,10 +625,14 @@ void radix__flush_tlb_mm(struct mm_struct *mm)
>  			goto local;
>  		}
>  
> -		if (mm_needs_flush_escalation(mm))
> -			_tlbie_pid(pid, RIC_FLUSH_ALL);
> -		else
> -			_tlbie_pid(pid, RIC_FLUSH_TLB);
> +		if (cputlb_use_tlbie()) {
> +			if (mm_needs_flush_escalation(mm))
> +				_tlbie_pid(pid, RIC_FLUSH_ALL);
> +			else
> +				_tlbie_pid(pid, RIC_FLUSH_TLB);
> +		} else {
> +			_tlbiel_pid_multicast(mm, pid, RIC_FLUSH_TLB);
> +		}
>  	} else {
>  local:
>  		_tlbiel_pid(pid, RIC_FLUSH_TLB);
> @@ -559,7 +658,10 @@ static void __flush_all_mm(struct mm_struct *mm, bool 
fullmm)
>  				goto local;
>  			}
>  		}
> -		_tlbie_pid(pid, RIC_FLUSH_ALL);
> +		if (cputlb_use_tlbie())
> +			_tlbie_pid(pid, RIC_FLUSH_ALL);
> +		else
> +			_tlbiel_pid_multicast(mm, pid, RIC_FLUSH_ALL);
>  	} else {
>  local:
>  		_tlbiel_pid(pid, RIC_FLUSH_ALL);
> @@ -594,7 +696,10 @@ void radix__flush_tlb_page_psize(struct mm_struct *mm, 
unsigned long vmaddr,
>  			exit_flush_lazy_tlbs(mm);
>  			goto local;
>  		}
> -		_tlbie_va(vmaddr, pid, psize, RIC_FLUSH_TLB);
> +		if (cputlb_use_tlbie())
> +			_tlbie_va(vmaddr, pid, psize, RIC_FLUSH_TLB);
> +		else
> +			_tlbiel_va_multicast(mm, vmaddr, pid, psize, RIC_FLUSH_TLB);
>  	} else {
>  local:
>  		_tlbiel_va(vmaddr, pid, psize, RIC_FLUSH_TLB);
> @@ -616,6 +721,24 @@ EXPORT_SYMBOL(radix__flush_tlb_page);
>  #define radix__flush_all_mm radix__local_flush_all_mm
>  #endif /* CONFIG_SMP */
>  
> +static void do_tlbiel_kernel(void *info)
> +{
> +	_tlbiel_pid(0, RIC_FLUSH_ALL);
> +}
> +
> +static inline void _tlbiel_kernel_broadcast(void)
> +{
> +	on_each_cpu(do_tlbiel_kernel, NULL, 1);
> +	if (tlbie_capable) {
> +		/*
> +		 * Coherent accelerators don't refcount kernel memory mappings,
> +		 * so have to always issue a tlbie for them. This is quite a
> +		 * slow path anyway.
> +		 */
> +		_tlbie_pid(0, RIC_FLUSH_ALL);
> +	}
> +}
> +
>  /*
>   * If kernel TLBIs ever become local rather than global, then
>   * drivers/misc/ocxl/link.c:ocxl_link_add_pe will need some work, as it
> @@ -623,7 +746,10 @@ EXPORT_SYMBOL(radix__flush_tlb_page);
>   */
>  void radix__flush_tlb_kernel_range(unsigned long start, unsigned long end)
>  {
> -	_tlbie_pid(0, RIC_FLUSH_ALL);
> +	if (cputlb_use_tlbie())
> +		_tlbie_pid(0, RIC_FLUSH_ALL);
> +	else
> +		_tlbiel_kernel_broadcast();
>  }
>  EXPORT_SYMBOL(radix__flush_tlb_kernel_range);
>  
> @@ -679,10 +805,14 @@ static inline void __radix__flush_tlb_range(struct 
mm_struct *mm,
>  		if (local) {
>  			_tlbiel_pid(pid, RIC_FLUSH_TLB);
>  		} else {
> -			if (mm_needs_flush_escalation(mm))
> -				_tlbie_pid(pid, RIC_FLUSH_ALL);
> -			else
> -				_tlbie_pid(pid, RIC_FLUSH_TLB);
> +			if (cputlb_use_tlbie()) {
> +				if (mm_needs_flush_escalation(mm))
> +					_tlbie_pid(pid, RIC_FLUSH_ALL);
> +				else
> +					_tlbie_pid(pid, RIC_FLUSH_TLB);
> +			} else {
> +				_tlbiel_pid_multicast(mm, pid, RIC_FLUSH_TLB);
> +			}
>  		}
>  	} else {
>  		bool hflush = flush_all_sizes;
> @@ -707,8 +837,8 @@ static inline void __radix__flush_tlb_range(struct 
mm_struct *mm,
>  				gflush = false;
>  		}
>  
> -		asm volatile("ptesync": : :"memory");
>  		if (local) {
> +			asm volatile("ptesync": : :"memory");
>  			__tlbiel_va_range(start, end, pid, page_size, mmu_virtual_psize);
>  			if (hflush)
>  				__tlbiel_va_range(hstart, hend, pid,
> @@ -717,7 +847,8 @@ static inline void __radix__flush_tlb_range(struct 
mm_struct *mm,
>  				__tlbiel_va_range(gstart, gend, pid,
>  						PUD_SIZE, MMU_PAGE_1G);
>  			asm volatile("ptesync": : :"memory");
> -		} else {
> +		} else if (cputlb_use_tlbie()) {
> +			asm volatile("ptesync": : :"memory");
>  			__tlbie_va_range(start, end, pid, page_size, mmu_virtual_psize);
>  			if (hflush)
>  				__tlbie_va_range(hstart, hend, pid,
> @@ -727,6 +858,15 @@ static inline void __radix__flush_tlb_range(struct 
mm_struct *mm,
>  						PUD_SIZE, MMU_PAGE_1G);
>  			fixup_tlbie();
>  			asm volatile("eieio; tlbsync; ptesync": : :"memory");
> +		} else {
> +			_tlbiel_va_range_multicast(mm,
> +					start, end, pid, page_size, mmu_virtual_psize, false);
> +			if (hflush)
> +				_tlbiel_va_range_multicast(mm,
> +					hstart, hend, pid, PMD_SIZE, MMU_PAGE_2M, false);
> +			if (gflush)
> +				_tlbiel_va_range_multicast(mm,
> +					gstart, gend, pid, PUD_SIZE, MMU_PAGE_1G, false);
>  		}
>  	}
>  	preempt_enable();
> @@ -903,16 +1043,26 @@ static __always_inline void 
__radix__flush_tlb_range_psize(struct mm_struct *mm,
>  		if (local) {
>  			_tlbiel_pid(pid, also_pwc ? RIC_FLUSH_ALL : RIC_FLUSH_TLB);
>  		} else {
> -			if (mm_needs_flush_escalation(mm))
> -				also_pwc = true;
> +			if (cputlb_use_tlbie()) {
> +				if (mm_needs_flush_escalation(mm))
> +					also_pwc = true;
> +
> +				_tlbie_pid(pid,
> +					also_pwc ?  RIC_FLUSH_ALL : RIC_FLUSH_TLB);
> +			} else {
> +				_tlbiel_pid_multicast(mm, pid,
> +					also_pwc ?  RIC_FLUSH_ALL : RIC_FLUSH_TLB);
> +			}
>  
> -			_tlbie_pid(pid, also_pwc ? RIC_FLUSH_ALL : RIC_FLUSH_TLB);
>  		}
>  	} else {
>  		if (local)
>  			_tlbiel_va_range(start, end, pid, page_size, psize, also_pwc);
> -		else
> +		else if (cputlb_use_tlbie())
>  			_tlbie_va_range(start, end, pid, page_size, psize, also_pwc);
> +		else
> +			_tlbiel_va_range_multicast(mm,
> +					start, end, pid, page_size, psize, also_pwc);
>  	}
>  	preempt_enable();
>  }
> @@ -954,7 +1104,11 @@ void radix__flush_tlb_collapsed_pmd(struct mm_struct 
*mm, unsigned long addr)
>  			exit_flush_lazy_tlbs(mm);
>  			goto local;
>  		}
> -		_tlbie_va_range(addr, end, pid, PAGE_SIZE, mmu_virtual_psize, true);
> +		if (cputlb_use_tlbie())
> +			_tlbie_va_range(addr, end, pid, PAGE_SIZE, mmu_virtual_psize, 
true);
> +		else
> +			_tlbiel_va_range_multicast(mm,
> +					addr, end, pid, PAGE_SIZE, mmu_virtual_psize, true);
>  	} else {
>  local:
>  		_tlbiel_va_range(addr, end, pid, PAGE_SIZE, mmu_virtual_psize, true);
> diff --git a/drivers/misc/cxl/main.c b/drivers/misc/cxl/main.c
> index 482a2c1b340a..43b312d06e3e 100644
> --- a/drivers/misc/cxl/main.c
> +++ b/drivers/misc/cxl/main.c
> @@ -18,6 +18,7 @@
>  #include <linux/sched/task.h>
>  
>  #include <asm/cputable.h>
> +#include <asm/mmu.h>
>  #include <misc/cxl-base.h>
>  
>  #include "cxl.h"
> @@ -315,6 +316,9 @@ static int __init init_cxl(void)
>  {
>  	int rc = 0;
>  
> +	if (!tlbie_capable)
> +		return -EINVAL;
> +
>  	if ((rc = cxl_file_init()))
>  		return rc;
>  
> diff --git a/drivers/misc/ocxl/main.c b/drivers/misc/ocxl/main.c
> index 7210d9e059be..ef73cf35dda2 100644
> --- a/drivers/misc/ocxl/main.c
> +++ b/drivers/misc/ocxl/main.c
> @@ -2,12 +2,16 @@
>  // Copyright 2017 IBM Corp.
>  #include <linux/module.h>
>  #include <linux/pci.h>
> +#include <asm/mmu.h>
>  #include "ocxl_internal.h"
>  
>  static int __init init_ocxl(void)
>  {
>  	int rc = 0;
>  
> +	if (!tlbie_capable)
> +		return -EINVAL;
> +
>  	rc = ocxl_file_init();
>  	if (rc)
>  		return rc;
> 




