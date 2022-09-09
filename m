Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3CC5B39F3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 15:57:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPHcK4Rzlz3c3V
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 23:57:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LsdSx0dc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LsdSx0dc;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPHbY3xKZz30Ll
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 23:56:41 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 289CZ39i012429;
	Fri, 9 Sep 2022 13:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=S3L2vJGHO5rbuW9kkUhyGqBvvOSrckUmxn+MkWNfyn8=;
 b=LsdSx0dcMsPl+uJqdc/B7hcqEommI2TH2xqBGYynXahAI4qFga7oFmQPL56yEuKNiUDT
 8oClDiCmtZW7FlT3xdbgPK88eZsMAs23CBh1Uxe0JQy4Vmtz/U9InrJlcSSISSWoAFyl
 pO3GDCbzj/BxBmtgy887Uee+XMa1m0gLNdST5IdozuR7DHtErUdyLOXdOT8WCISeLTQU
 FiR3APPTnS7Fdo5YQ9qLnUliT+5T6fGewOgd0Qe0gCLelt0ie+D3P8GSyyaP+ZhqYJPY
 vEuflLnIlJ9ofszMpeYPHqu8/psUCq9Po+YuEiLXCM1cCeZqk+PnQgVMHxIwRykgPwQO Mg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jg4jqvk33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Sep 2022 13:56:13 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 289CZIRK014162;
	Fri, 9 Sep 2022 13:56:13 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jg4jqvk1v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Sep 2022 13:56:12 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 289DoCnC001978;
	Fri, 9 Sep 2022 13:56:10 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma04ams.nl.ibm.com with ESMTP id 3jbxj90365-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Sep 2022 13:56:10 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 289DuWmi14746100
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 Sep 2022 13:56:32 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 171C242041;
	Fri,  9 Sep 2022 13:56:08 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 039F44203F;
	Fri,  9 Sep 2022 13:56:07 +0000 (GMT)
Received: from [9.145.83.17] (unknown [9.145.83.17])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri,  9 Sep 2022 13:56:06 +0000 (GMT)
Message-ID: <acf01185-0b34-0e92-770e-8417f4cc3cf3@linux.ibm.com>
Date: Fri, 9 Sep 2022 15:56:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [RFC PATCH RESEND 16/28] kernel/fork: assert no VMA readers
 during its destruction
Content-Language: fr
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
References: <20220901173516.702122-1-surenb@google.com>
 <20220901173516.702122-17-surenb@google.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20220901173516.702122-17-surenb@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: P-SppGO3iL1jinbWZiGS1-PZPCNK-_NX
X-Proofpoint-GUID: t2fl4Ou9Hhb7jrL_XI7bfB-mBOC0S110
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-09_08,2022-09-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 mlxscore=0 adultscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209090047
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
> Assert there are no holders of VMA lock for reading when it is about to be
> destroyed.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> ---
>  include/linux/mm.h | 8 ++++++++
>  kernel/fork.c      | 2 ++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index dc72be923e5b..0d9c1563c354 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -676,6 +676,13 @@ static inline void vma_assert_write_locked(struct vm_area_struct *vma, int pos)
>  	VM_BUG_ON_VMA(vma->vm_lock_seq != READ_ONCE(vma->vm_mm->mm_lock_seq), vma);
>  }
>  
> +static inline void vma_assert_no_reader(struct vm_area_struct *vma)
> +{
> +	VM_BUG_ON_VMA(rwsem_is_locked(&vma->lock) &&
> +		      vma->vm_lock_seq != READ_ONCE(vma->vm_mm->mm_lock_seq),
> +		      vma);
> +}
> +
>  #else /* CONFIG_PER_VMA_LOCK */
>  
>  static inline void vma_init_lock(struct vm_area_struct *vma) {}
> @@ -685,6 +692,7 @@ static inline bool vma_read_trylock(struct vm_area_struct *vma)
>  static inline void vma_read_unlock(struct vm_area_struct *vma) {}
>  static inline void vma_assert_locked(struct vm_area_struct *vma) {}
>  static inline void vma_assert_write_locked(struct vm_area_struct *vma, int pos) {}
> +static inline void vma_assert_no_reader(struct vm_area_struct *vma) {}
>  
>  #endif /* CONFIG_PER_VMA_LOCK */
>  
> diff --git a/kernel/fork.c b/kernel/fork.c
> index 1872ad549fed..b443ba3a247a 100644
> --- a/kernel/fork.c
> +++ b/kernel/fork.c
> @@ -487,6 +487,8 @@ static void __vm_area_free(struct rcu_head *head)
>  {
>  	struct vm_area_struct *vma = container_of(head, struct vm_area_struct,
>  						  vm_rcu);
> +	/* The vma should either have no lock holders or be write-locked. */
> +	vma_assert_no_reader(vma);

I'm wondering if this can be hit in the case the thread freeing a VMA is
preempted before incrementing the mm ref count, like this:

VMA is about to be freed
write lock VMA
free vma -> call_rcu
..
<--- thread preempted
	rcu handler runs
	rcu calls __vm_area_free() <<<<<<
unlock mmap_lock and increase the mm seq count


>  	kmem_cache_free(vm_area_cachep, vma);
>  }
>  #endif

