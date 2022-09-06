Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A505AEC7F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 16:28:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMSRW5BpLz3bhQ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 00:28:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mqr+CLhL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mqr+CLhL;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMSQp01Zpz2xKN
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Sep 2022 00:27:45 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 286EKQs8031075;
	Tue, 6 Sep 2022 14:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=mOKMGbj0h+IoItTPXGITUaX6+BxdUTBobKe1JTaSnpU=;
 b=mqr+CLhLxBtoZkbFNOpyD8ZfgMACYYYIcPHk3oR2WScnQYOkTbNYapKbWcGuuUvx7EDj
 aAjPwgveYuPGTyLUM69DOMiw0aPCptXxxKvnxiOJpH1wjDn1ZOscujgLjqZL0tKBK3ik
 AEiYGOdr0lBFLFDdWA7lIOxd4rqW7Lenv6ufz5lSHv3o+Db1TxPJJ7jsCTIemuEUE0w4
 +XvA0zYXi+lj+DI7b0NpoWAnNQKVlghvUdZcvZlWQaq5ObT1JiijmA/Ew73KZQwL/NVB
 AMwRZpj7b+r2asLhGxmKybbIZ5MVnvkGxuziCjbzoZSbp+KkRjuIwiS4FasIvHqzVF0M Bg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3je7vs86w3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Sep 2022 14:27:01 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 286ELGRq001209;
	Tue, 6 Sep 2022 14:27:00 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3je7vs86ur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Sep 2022 14:27:00 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 286EM2l5032470;
	Tue, 6 Sep 2022 14:26:58 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma04ams.nl.ibm.com with ESMTP id 3jbxj8uven-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Sep 2022 14:26:58 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 286ENRMu38011302
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 Sep 2022 14:23:27 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 236A5A405F;
	Tue,  6 Sep 2022 14:26:56 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F2BF6A4054;
	Tue,  6 Sep 2022 14:26:54 +0000 (GMT)
Received: from [9.101.4.33] (unknown [9.101.4.33])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue,  6 Sep 2022 14:26:54 +0000 (GMT)
Message-ID: <1624be86-4c17-46e5-fafc-eb8afb7b9b4a@linux.ibm.com>
Date: Tue, 6 Sep 2022 16:26:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.0
Subject: Re: [RFC PATCH RESEND 06/28] mm: mark VMA as locked whenever
 vma->vm_flags are modified
Content-Language: fr
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
References: <20220901173516.702122-1-surenb@google.com>
 <20220901173516.702122-7-surenb@google.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20220901173516.702122-7-surenb@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6dJbI8DKo_nJ9KArZv3m8trGfj4Z_S3o
X-Proofpoint-ORIG-GUID: NqUqfyaWz9LmhuH8uw3FRePI3DXiS3ka
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-06_07,2022-09-06_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 impostorscore=0 bulkscore=0
 spamscore=0 mlxlogscore=994 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209060067
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, jglisse@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, laurent.dufour@fr.ibm.com, mgorman@suse.de, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, paulmck@kernel.org, liam.howlett@oracle.com, luto@kernel.org, vbabka@suse.cz, linux-arm-kernel@lists.infradead.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 01/09/2022 à 19:34, Suren Baghdasaryan a écrit :
> VMA flag modifications should be done under VMA lock to prevent concurrent
> page fault handling in that area.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> ---
>  fs/proc/task_mmu.c | 1 +
>  fs/userfaultfd.c   | 6 ++++++
>  mm/madvise.c       | 1 +
>  mm/mlock.c         | 2 ++
>  mm/mmap.c          | 1 +
>  mm/mprotect.c      | 1 +
>  6 files changed, 12 insertions(+)

There are few changes also done in the driver's space, for instance:

*** arch/x86/kernel/cpu/sgx/driver.c:
sgx_mmap[98]                   vma->vm_flags |= VM_PFNMAP | VM_DONTEXPAND |
VM_DONTDUMP | VM_IO;
*** arch/x86/kernel/cpu/sgx/virt.c:
sgx_vepc_mmap[108]             vma->vm_flags |= VM_PFNMAP | VM_IO |
VM_DONTDUMP | VM_DONTCOPY;
*** drivers/dax/device.c:
dax_mmap[311]                  vma->vm_flags |= VM_HUGEPAGE;

I guess these changes to vm_flags should be protected as well, or to be
checked one by one.

> 
> diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> index 4e0023643f8b..ceffa5c2c650 100644
> --- a/fs/proc/task_mmu.c
> +++ b/fs/proc/task_mmu.c
> @@ -1285,6 +1285,7 @@ static ssize_t clear_refs_write(struct file *file, const char __user *buf,
>  			for (vma = mm->mmap; vma; vma = vma->vm_next) {
>  				if (!(vma->vm_flags & VM_SOFTDIRTY))
>  					continue;
> +				vma_mark_locked(vma);
>  				vma->vm_flags &= ~VM_SOFTDIRTY;
>  				vma_set_page_prot(vma);
>  			}
> diff --git a/fs/userfaultfd.c b/fs/userfaultfd.c
> index 175de70e3adf..fe557b3d1c07 100644
> --- a/fs/userfaultfd.c
> +++ b/fs/userfaultfd.c
> @@ -620,6 +620,7 @@ static void userfaultfd_event_wait_completion(struct userfaultfd_ctx *ctx,
>  		mmap_write_lock(mm);
>  		for (vma = mm->mmap; vma; vma = vma->vm_next)
>  			if (vma->vm_userfaultfd_ctx.ctx == release_new_ctx) {
> +				vma_mark_locked(vma);
>  				vma->vm_userfaultfd_ctx = NULL_VM_UFFD_CTX;
>  				vma->vm_flags &= ~__VM_UFFD_FLAGS;
>  			}
> @@ -653,6 +654,7 @@ int dup_userfaultfd(struct vm_area_struct *vma, struct list_head *fcs)
>  
>  	octx = vma->vm_userfaultfd_ctx.ctx;
>  	if (!octx || !(octx->features & UFFD_FEATURE_EVENT_FORK)) {
> +		vma_mark_locked(vma);
>  		vma->vm_userfaultfd_ctx = NULL_VM_UFFD_CTX;
>  		vma->vm_flags &= ~__VM_UFFD_FLAGS;
>  		return 0;
> @@ -734,6 +736,7 @@ void mremap_userfaultfd_prep(struct vm_area_struct *vma,
>  		atomic_inc(&ctx->mmap_changing);
>  	} else {
>  		/* Drop uffd context if remap feature not enabled */
> +		vma_mark_locked(vma);
>  		vma->vm_userfaultfd_ctx = NULL_VM_UFFD_CTX;
>  		vma->vm_flags &= ~__VM_UFFD_FLAGS;
>  	}
> @@ -891,6 +894,7 @@ static int userfaultfd_release(struct inode *inode, struct file *file)
>  			vma = prev;
>  		else
>  			prev = vma;
> +		vma_mark_locked(vma);
>  		vma->vm_flags = new_flags;
>  		vma->vm_userfaultfd_ctx = NULL_VM_UFFD_CTX;
>  	}
> @@ -1449,6 +1453,7 @@ static int userfaultfd_register(struct userfaultfd_ctx *ctx,
>  		 * the next vma was merged into the current one and
>  		 * the current one has not been updated yet.
>  		 */
> +		vma_mark_locked(vma);
>  		vma->vm_flags = new_flags;
>  		vma->vm_userfaultfd_ctx.ctx = ctx;
>  
> @@ -1630,6 +1635,7 @@ static int userfaultfd_unregister(struct userfaultfd_ctx *ctx,
>  		 * the next vma was merged into the current one and
>  		 * the current one has not been updated yet.
>  		 */
> +		vma_mark_locked(vma);
>  		vma->vm_flags = new_flags;
>  		vma->vm_userfaultfd_ctx = NULL_VM_UFFD_CTX;
>  
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 5f0f0948a50e..a173f0025abd 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -181,6 +181,7 @@ static int madvise_update_vma(struct vm_area_struct *vma,
>  	/*
>  	 * vm_flags is protected by the mmap_lock held in write mode.
>  	 */
> +	vma_mark_locked(vma);
>  	vma->vm_flags = new_flags;
>  	if (!vma->vm_file) {
>  		error = replace_anon_vma_name(vma, anon_name);
> diff --git a/mm/mlock.c b/mm/mlock.c
> index b14e929084cc..f62e1a4d05f2 100644
> --- a/mm/mlock.c
> +++ b/mm/mlock.c
> @@ -380,6 +380,7 @@ static void mlock_vma_pages_range(struct vm_area_struct *vma,
>  	 */
>  	if (newflags & VM_LOCKED)
>  		newflags |= VM_IO;
> +	vma_mark_locked(vma);
>  	WRITE_ONCE(vma->vm_flags, newflags);
>  
>  	lru_add_drain();
> @@ -456,6 +457,7 @@ static int mlock_fixup(struct vm_area_struct *vma, struct vm_area_struct **prev,
>  
>  	if ((newflags & VM_LOCKED) && (oldflags & VM_LOCKED)) {
>  		/* No work to do, and mlocking twice would be wrong */
> +		vma_mark_locked(vma);
>  		vma->vm_flags = newflags;
>  	} else {
>  		mlock_vma_pages_range(vma, start, end, newflags);
> diff --git a/mm/mmap.c b/mm/mmap.c
> index 693e6776be39..f89c9b058105 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -1818,6 +1818,7 @@ unsigned long mmap_region(struct file *file, unsigned long addr,
>  out:
>  	perf_event_mmap(vma);
>  
> +	vma_mark_locked(vma);
>  	vm_stat_account(mm, vm_flags, len >> PAGE_SHIFT);
>  	if (vm_flags & VM_LOCKED) {
>  		if ((vm_flags & VM_SPECIAL) || vma_is_dax(vma) ||

I guess, this doesn't really impact, but the call to vma_mark_locked(vma)
may be done only in the case the vm_flags field is touched.
Something like this:

	vm_stat_account(mm, vm_flags, len >> PAGE_SHIFT);
	if (vm_flags & VM_LOCKED) {
		if ((vm_flags & VM_SPECIAL) || vma_is_dax(vma) ||
					is_vm_hugetlb_page(vma) ||
-					vma == get_gate_vma(current->mm))
+					vma == get_gate_vma(current->mm)) {
+			vma_mark_locked(vma);
			vma->vm_flags &= VM_LOCKED_CLEAR_MASK;
-		else
+		} else
			mm->locked_vm += (len >> PAGE_SHIFT);
	}


> diff --git a/mm/mprotect.c b/mm/mprotect.c
> index bc6bddd156ca..df47fc21b0e4 100644
> --- a/mm/mprotect.c
> +++ b/mm/mprotect.c
> @@ -621,6 +621,7 @@ mprotect_fixup(struct mmu_gather *tlb, struct vm_area_struct *vma,
>  	 * vm_flags and vm_page_prot are protected by the mmap_lock
>  	 * held in write mode.
>  	 */
> +	vma_mark_locked(vma);
>  	vma->vm_flags = newflags;
>  	/*
>  	 * We want to check manually if we can change individual PTEs writable

