Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7677869D9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 10:18:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TN7oM66x;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWbZN51Jvz3cnb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 18:18:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TN7oM66x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWbYV1h0qz2yVT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 18:17:50 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37O8CUu1006690;
	Thu, 24 Aug 2023 08:16:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=KEWHsQIN0ibIJmqlOe+5geBhFJYS7lkWUXsTA+1dW1s=;
 b=TN7oM66xZFKd9trAoNj/to+wrKk83acTpd3VRV5F9dH+fZ5Z8sBbl2AbNEsG9u4BT/rp
 hNvSoyMhKrFT5qqUPfCRnAkhAJ301+5YIHUV0Rg6lQKi4uSkTLe0mgBTcgmRidluxFBW
 O8kB7k0OE2SGBmAXrK2d8yL2biJwNwvIaOEBHrI2guhj4rH8g/rkXHq5HvHg1mT2IGy/
 eRqnGhLXCq5hKQ4Av/Le3UlaaPX5igLCT04KlszV1NRB6L58s/vOfo9nzDNSbi9O+55t
 ixanQzhrIZHC+lvbSJ4zTxl/+3WI32IQUVt8Ub1hE7MGlx5pkVibwEct+hn4ag0wCheH AA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sp3g705gu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Aug 2023 08:16:44 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37O8CiYj008191;
	Thu, 24 Aug 2023 08:16:43 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sp3g705ev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Aug 2023 08:16:43 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37O7E8Q7004093;
	Thu, 24 Aug 2023 08:16:40 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3sn21rneej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Aug 2023 08:16:40 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37O8GalW33030748
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Aug 2023 08:16:37 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CB4E320040;
	Thu, 24 Aug 2023 08:16:36 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B6B5020043;
	Thu, 24 Aug 2023 08:16:34 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.171.83.96])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 24 Aug 2023 08:16:34 +0000 (GMT)
Date: Thu, 24 Aug 2023 10:16:33 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH rfc v2 04/10] s390: mm: use try_vma_locked_page_fault()
Message-ID: <ZOcR4Z1WnCy1vl9T@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <20230821123056.2109942-1-wangkefeng.wang@huawei.com>
 <20230821123056.2109942-5-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230821123056.2109942-5-wangkefeng.wang@huawei.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Xe2qvpopgdAywnsIWTGsa_U7sum5c185
X-Proofpoint-ORIG-GUID: lweXzh7T5jsy5Cw_7-G4eq5m-9pnOzRv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-24_05,2023-08-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=549
 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2308240065
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
Cc: x86@kernel.org, loongarch@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, "H . Peter Anvin" <hpa@zytor.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, willy@infradead.org, Ingo Molnar <mingo@redhat.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, surenb@google.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Sven
  Schnelle <svens@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 21, 2023 at 08:30:50PM +0800, Kefeng Wang wrote:
> Use new try_vma_locked_page_fault() helper to simplify code.
> No functional change intended.
> 
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  arch/s390/mm/fault.c | 66 ++++++++++++++++++--------------------------
>  1 file changed, 27 insertions(+), 39 deletions(-)
> 
> diff --git a/arch/s390/mm/fault.c b/arch/s390/mm/fault.c
> index 099c4824dd8a..fbbdebde6ea7 100644
> --- a/arch/s390/mm/fault.c
> +++ b/arch/s390/mm/fault.c
> @@ -357,16 +357,18 @@ static noinline void do_fault_error(struct pt_regs *regs, vm_fault_t fault)
>  static inline vm_fault_t do_exception(struct pt_regs *regs, int access)
>  {
>  	struct gmap *gmap;
> -	struct task_struct *tsk;
> -	struct mm_struct *mm;
>  	struct vm_area_struct *vma;
>  	enum fault_type type;
> -	unsigned long address;
> -	unsigned int flags;
> +	struct mm_struct *mm = current->mm;
> +	unsigned long address = get_fault_address(regs);
>  	vm_fault_t fault;
>  	bool is_write;
> +	struct vm_fault vmf = {
> +		.real_address = address,
> +		.flags = FAULT_FLAG_DEFAULT,
> +		.vm_flags = access,
> +	};
>  
> -	tsk = current;
>  	/*
>  	 * The instruction that caused the program check has
>  	 * been nullified. Don't signal single step via SIGTRAP.
> @@ -376,8 +378,6 @@ static inline vm_fault_t do_exception(struct pt_regs *regs, int access)
>  	if (kprobe_page_fault(regs, 14))
>  		return 0;
>  
> -	mm = tsk->mm;
> -	address = get_fault_address(regs);
>  	is_write = fault_is_write(regs);
>  
>  	/*
> @@ -398,45 +398,33 @@ static inline vm_fault_t do_exception(struct pt_regs *regs, int access)
>  	}
>  
>  	perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS, 1, regs, address);
> -	flags = FAULT_FLAG_DEFAULT;
>  	if (user_mode(regs))
> -		flags |= FAULT_FLAG_USER;
> +		vmf.flags |= FAULT_FLAG_USER;
>  	if (is_write)
> -		access = VM_WRITE;
> -	if (access == VM_WRITE)
> -		flags |= FAULT_FLAG_WRITE;
> -	if (!(flags & FAULT_FLAG_USER))
> -		goto lock_mmap;
> -	vma = lock_vma_under_rcu(mm, address);
> -	if (!vma)
> -		goto lock_mmap;
> -	if (!(vma->vm_flags & access)) {
> -		vma_end_read(vma);
> -		goto lock_mmap;
> -	}
> -	fault = handle_mm_fault(vma, address, flags | FAULT_FLAG_VMA_LOCK, regs);
> -	if (!(fault & (VM_FAULT_RETRY | VM_FAULT_COMPLETED)))
> -		vma_end_read(vma);
> -	if (!(fault & VM_FAULT_RETRY)) {
> -		count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
> -		if (likely(!(fault & VM_FAULT_ERROR)))
> -			fault = 0;

This fault fixup is removed in the new version.

> +		vmf.vm_flags = VM_WRITE;
> +	if (vmf.vm_flags == VM_WRITE)
> +		vmf.flags |= FAULT_FLAG_WRITE;
> +
> +	fault = try_vma_locked_page_fault(&vmf);
> +	if (fault == VM_FAULT_NONE)
> +		goto lock_mm;

Because VM_FAULT_NONE is set to 0 it gets confused with
the success code of 0 returned by a fault handler. In the
former case we want to continue, while in the latter -
successfully return. I think it applies to all archs.

> +	if (!(fault & VM_FAULT_RETRY))
>  		goto out;
> -	}
> -	count_vm_vma_lock_event(VMA_LOCK_RETRY);
> +
>  	/* Quick path to respond to signals */
>  	if (fault_signal_pending(fault, regs)) {
>  		fault = VM_FAULT_SIGNAL;
>  		goto out;
>  	}
> -lock_mmap:
> +
> +lock_mm:
>  	mmap_read_lock(mm);
>  
>  	gmap = NULL;
>  	if (IS_ENABLED(CONFIG_PGSTE) && type == GMAP_FAULT) {
>  		gmap = (struct gmap *) S390_lowcore.gmap;
>  		current->thread.gmap_addr = address;
> -		current->thread.gmap_write_flag = !!(flags & FAULT_FLAG_WRITE);
> +		current->thread.gmap_write_flag = !!(vmf.flags & FAULT_FLAG_WRITE);
>  		current->thread.gmap_int_code = regs->int_code & 0xffff;
>  		address = __gmap_translate(gmap, address);
>  		if (address == -EFAULT) {
> @@ -444,7 +432,7 @@ static inline vm_fault_t do_exception(struct pt_regs *regs, int access)
>  			goto out_up;
>  		}
>  		if (gmap->pfault_enabled)
> -			flags |= FAULT_FLAG_RETRY_NOWAIT;
> +			vmf.flags |= FAULT_FLAG_RETRY_NOWAIT;
>  	}
>  
>  retry:
> @@ -466,7 +454,7 @@ static inline vm_fault_t do_exception(struct pt_regs *regs, int access)
>  	 * we can handle it..
>  	 */
>  	fault = VM_FAULT_BADACCESS;
> -	if (unlikely(!(vma->vm_flags & access)))
> +	if (unlikely(!(vma->vm_flags & vmf.vm_flags)))
>  		goto out_up;
>  
>  	/*
> @@ -474,10 +462,10 @@ static inline vm_fault_t do_exception(struct pt_regs *regs, int access)
>  	 * make sure we exit gracefully rather than endlessly redo
>  	 * the fault.
>  	 */
> -	fault = handle_mm_fault(vma, address, flags, regs);
> +	fault = handle_mm_fault(vma, address, vmf.flags, regs);
>  	if (fault_signal_pending(fault, regs)) {
>  		fault = VM_FAULT_SIGNAL;
> -		if (flags & FAULT_FLAG_RETRY_NOWAIT)
> +		if (vmf.flags & FAULT_FLAG_RETRY_NOWAIT)
>  			goto out_up;
>  		goto out;
>  	}
> @@ -497,7 +485,7 @@ static inline vm_fault_t do_exception(struct pt_regs *regs, int access)
>  
>  	if (fault & VM_FAULT_RETRY) {
>  		if (IS_ENABLED(CONFIG_PGSTE) && gmap &&
> -			(flags & FAULT_FLAG_RETRY_NOWAIT)) {
> +			(vmf.flags & FAULT_FLAG_RETRY_NOWAIT)) {
>  			/*
>  			 * FAULT_FLAG_RETRY_NOWAIT has been set, mmap_lock has
>  			 * not been released
> @@ -506,8 +494,8 @@ static inline vm_fault_t do_exception(struct pt_regs *regs, int access)
>  			fault = VM_FAULT_PFAULT;
>  			goto out_up;
>  		}
> -		flags &= ~FAULT_FLAG_RETRY_NOWAIT;
> -		flags |= FAULT_FLAG_TRIED;
> +		vmf.flags &= ~FAULT_FLAG_RETRY_NOWAIT;
> +		vmf.flags |= FAULT_FLAG_TRIED;
>  		mmap_read_lock(mm);
>  		goto retry;
>  	}

FWIW, this series ends up with kernel BUG at arch/s390/mm/fault.c:341!

Thanks!
