Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E27C5B3BB8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 17:20:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPKRx02VHz3bpn
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Sep 2022 01:20:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ok64RkD3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ok64RkD3;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPKRF3Tq5z30D0
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Sep 2022 01:19:36 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 289DsLqD026660;
	Fri, 9 Sep 2022 15:19:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ttctqxZ0ZY/rJHUuDbVK07IZdzit0pAccu3G4s2cVJ8=;
 b=Ok64RkD3CgDW67evKfnlroyNSPr8TT9CJzaSb7fudEL7IfAsos6cO9wKF5lI4DFR27TP
 mGEN0JwOipcy4FcMnlYy2zKp8A3+ZgIRYrEOBqKs9N6/kjsijQJAL3c8EbbQj+jt4jgJ
 3icygvUncFiLz4uZpNoSr2/OkIQWH8LfVINBNv2lMvugeKdxVrsKL06+FvhnY0Tn62E7
 lSTUgt8GVRkhH7OfgJB6CV1kFWLWxR3M+36rEDEWUsqfNTxQsMbJbxxo+mMCfmOKgu1q
 rqtFDzliHMGG46POXcF5msQgqqAALQUbhd78qwx9qoQ+EmvzO3sVaB0WBnEvRO8btVoh KQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jg6sj2mkh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Sep 2022 15:19:16 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 289Dspjp030110;
	Fri, 9 Sep 2022 15:19:15 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jg6sj2mja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Sep 2022 15:19:15 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 289F6CVf030344;
	Fri, 9 Sep 2022 15:19:13 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma04ams.nl.ibm.com with ESMTP id 3jbxj9062d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Sep 2022 15:19:13 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 289FJAUM41288084
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 Sep 2022 15:19:10 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CD3644203F;
	Fri,  9 Sep 2022 15:19:10 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B500042042;
	Fri,  9 Sep 2022 15:19:09 +0000 (GMT)
Received: from [9.145.83.17] (unknown [9.145.83.17])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri,  9 Sep 2022 15:19:09 +0000 (GMT)
Message-ID: <34dd5656-dc3c-6a20-5390-04d05c619fdc@linux.ibm.com>
Date: Fri, 9 Sep 2022 17:19:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [RFC PATCH RESEND 28/28] kernel/fork: throttle call_rcu() calls
 in vm_area_free
Content-Language: fr
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
References: <20220901173516.702122-1-surenb@google.com>
 <20220901173516.702122-29-surenb@google.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20220901173516.702122-29-surenb@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DLF3PZSNYlExqmHFx69sRRfT1RFeNe9o
X-Proofpoint-ORIG-GUID: lJIRhPVW-Ckhp09e42bIVmXfokdWfKRJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-09_08,2022-09-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 spamscore=0 clxscore=1015 mlxscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209090053
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

Le 01/09/2022 à 19:35, Suren Baghdasaryan a écrit :
> call_rcu() can take a long time when callback offloading is enabled.
> Its use in the vm_area_free can cause regressions in the exit path when
> multiple VMAs are being freed. To minimize that impact, place VMAs into
> a list and free them in groups using one call_rcu() call per group.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> ---
>  include/linux/mm.h       |  1 +
>  include/linux/mm_types.h | 11 ++++++-
>  kernel/fork.c            | 68 +++++++++++++++++++++++++++++++++++-----
>  mm/init-mm.c             |  3 ++
>  mm/mmap.c                |  1 +
>  5 files changed, 75 insertions(+), 9 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index a3cbaa7b9119..81dff694ac14 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -249,6 +249,7 @@ void setup_initial_init_mm(void *start_code, void *end_code,
>  struct vm_area_struct *vm_area_alloc(struct mm_struct *);
>  struct vm_area_struct *vm_area_dup(struct vm_area_struct *);
>  void vm_area_free(struct vm_area_struct *);
> +void drain_free_vmas(struct mm_struct *mm);
>  
>  #ifndef CONFIG_MMU
>  extern struct rb_root nommu_region_tree;
> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
> index 36562e702baf..6f3effc493b1 100644
> --- a/include/linux/mm_types.h
> +++ b/include/linux/mm_types.h
> @@ -412,7 +412,11 @@ struct vm_area_struct {
>  			struct vm_area_struct *vm_next, *vm_prev;
>  		};
>  #ifdef CONFIG_PER_VMA_LOCK
> -		struct rcu_head vm_rcu;	/* Used for deferred freeing. */
> +		struct {
> +			struct list_head vm_free_list;
> +			/* Used for deferred freeing. */
> +			struct rcu_head vm_rcu;
> +		};
>  #endif
>  	};
>  
> @@ -573,6 +577,11 @@ struct mm_struct {
>  					  */
>  #ifdef CONFIG_PER_VMA_LOCK
>  		int mm_lock_seq;
> +		struct {
> +			struct list_head head;
> +			spinlock_t lock;
> +			int size;
> +		} vma_free_list;
>  #endif
>  
>  
> diff --git a/kernel/fork.c b/kernel/fork.c
> index b443ba3a247a..7c88710aed72 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -483,26 +483,75 @@ struct vm_area_struct *vm_area_dup(struct vm_area_struct *orig)
>  }
>  
>  #ifdef CONFIG_PER_VMA_LOCK
> -static void __vm_area_free(struct rcu_head *head)
> +static inline void __vm_area_free(struct vm_area_struct *vma)
>  {
> -	struct vm_area_struct *vma = container_of(head, struct vm_area_struct,
> -						  vm_rcu);
>  	/* The vma should either have no lock holders or be write-locked. */
>  	vma_assert_no_reader(vma);
>  	kmem_cache_free(vm_area_cachep, vma);
>  }
> -#endif
> +
> +static void vma_free_rcu_callback(struct rcu_head *head)
> +{
> +	struct vm_area_struct *first_vma;
> +	struct vm_area_struct *vma, *vma2;
> +
> +	first_vma = container_of(head, struct vm_area_struct, vm_rcu);
> +	list_for_each_entry_safe(vma, vma2, &first_vma->vm_free_list, vm_free_list)

Is that safe to walk the list against concurrent calls to
list_splice_init(), or list_add()?

> +		__vm_area_free(vma);
> +	__vm_area_free(first_vma);
> +}
> +
> +void drain_free_vmas(struct mm_struct *mm)
> +{
> +	struct vm_area_struct *first_vma;
> +	LIST_HEAD(to_destroy);
> +
> +	spin_lock(&mm->vma_free_list.lock);
> +	list_splice_init(&mm->vma_free_list.head, &to_destroy);
> +	mm->vma_free_list.size = 0;
> +	spin_unlock(&mm->vma_free_list.lock);
> +
> +	if (list_empty(&to_destroy))
> +		return;
> +
> +	first_vma = list_first_entry(&to_destroy, struct vm_area_struct, vm_free_list);
> +	/* Remove the head which is allocated on the stack */
> +	list_del(&to_destroy);
> +
> +	call_rcu(&first_vma->vm_rcu, vma_free_rcu_callback);
> +}
> +
> +#define VM_AREA_FREE_LIST_MAX	32
> +
> +void vm_area_free(struct vm_area_struct *vma)
> +{
> +	struct mm_struct *mm = vma->vm_mm;
> +	bool drain;
> +
> +	free_anon_vma_name(vma);
> +
> +	spin_lock(&mm->vma_free_list.lock);
> +	list_add(&vma->vm_free_list, &mm->vma_free_list.head);
> +	mm->vma_free_list.size++;
> +	drain = mm->vma_free_list.size > VM_AREA_FREE_LIST_MAX;
> +	spin_unlock(&mm->vma_free_list.lock);
> +
> +	if (drain)
> +		drain_free_vmas(mm);
> +}
> +
> +#else /* CONFIG_PER_VMA_LOCK */
> +
> +void drain_free_vmas(struct mm_struct *mm) {}
>  
>  void vm_area_free(struct vm_area_struct *vma)
>  {
>  	free_anon_vma_name(vma);
> -#ifdef CONFIG_PER_VMA_LOCK
> -	call_rcu(&vma->vm_rcu, __vm_area_free);
> -#else
>  	kmem_cache_free(vm_area_cachep, vma);
> -#endif
>  }
>  
> +#endif /* CONFIG_PER_VMA_LOCK */
> +
>  static void account_kernel_stack(struct task_struct *tsk, int account)
>  {
>  	if (IS_ENABLED(CONFIG_VMAP_STACK)) {
> @@ -1137,6 +1186,9 @@ static struct mm_struct *mm_init(struct mm_struct *mm, struct task_struct *p,
>  	INIT_LIST_HEAD(&mm->mmlist);
>  #ifdef CONFIG_PER_VMA_LOCK
>  	WRITE_ONCE(mm->mm_lock_seq, 0);
> +	INIT_LIST_HEAD(&mm->vma_free_list.head);
> +	spin_lock_init(&mm->vma_free_list.lock);
> +	mm->vma_free_list.size = 0;
>  #endif
>  	mm_pgtables_bytes_init(mm);
>  	mm->map_count = 0;
> diff --git a/mm/init-mm.c b/mm/init-mm.c
> index 8399f90d631c..7b6d2460545f 100644
> --- a/mm/init-mm.c
> +++ b/mm/init-mm.c
> @@ -39,6 +39,9 @@ struct mm_struct init_mm = {
>  	.mmlist		= LIST_HEAD_INIT(init_mm.mmlist),
>  #ifdef CONFIG_PER_VMA_LOCK
>  	.mm_lock_seq	= 0,
> +	.vma_free_list.head = LIST_HEAD_INIT(init_mm.vma_free_list.head),
> +	.vma_free_list.lock =  __SPIN_LOCK_UNLOCKED(init_mm.vma_free_list.lock),
> +	.vma_free_list.size = 0,
>  #endif
>  	.user_ns	= &init_user_ns,
>  	.cpu_bitmap	= CPU_BITS_NONE,
> diff --git a/mm/mmap.c b/mm/mmap.c
> index 1edfcd384f5e..d61b7ef84ba6 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -3149,6 +3149,7 @@ void exit_mmap(struct mm_struct *mm)
>  	}
>  	mm->mmap = NULL;
>  	mmap_write_unlock(mm);
> +	drain_free_vmas(mm);
>  	vm_unacct_memory(nr_accounted);
>  }
>  

