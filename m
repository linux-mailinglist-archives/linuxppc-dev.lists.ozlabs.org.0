Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FC05B3916
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 15:36:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPH8N2ky1z3c4x
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 23:36:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MIZOHfGk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MIZOHfGk;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPH7h2f5bz30D0
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 23:36:00 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 289CbeEW003994;
	Fri, 9 Sep 2022 13:35:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=xzhKYU684b2dfu1qPjE8Sin6GXCrrR5aDRD7oDV2Xis=;
 b=MIZOHfGkG81ENiTzgtzdNTkOxu7gtMcXp5ItRULSjhQYA1A1wHQmvJArKj6CTc4YM/ZF
 p8VMM8QHQ71mTwcOx63AXAV6sQWHiE0ycCDFxh/tI2JdLtLcYBkCMyCObhDjYmrYycob
 dX8Afx3eYOj46LHUxk9xv9TOowINu30uYi2Ky8NyeKe087ZbMV9gEIViDEdWE1i4ixlQ
 kKJljtLjmcDMu+DrQPb+x8deALtgnLzwuVaYFBqBrwvvR/il5KqsCa1J/0fVN/+bx0xm
 LeHODLSv1tRdPXp4SzLDa/jKkpAxl7CaJpH6t4p59APgarqxjXHXYIvTe4/POlXX/IEX /g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jg4d5vvay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Sep 2022 13:35:39 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 289CkGBh023200;
	Fri, 9 Sep 2022 13:35:35 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jg4d5vv8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Sep 2022 13:35:35 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 289DKtaB027527;
	Fri, 9 Sep 2022 13:35:32 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma04fra.de.ibm.com with ESMTP id 3jbxj8nyb2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Sep 2022 13:35:31 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 289DZrGm41615782
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 Sep 2022 13:35:53 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7093642047;
	Fri,  9 Sep 2022 13:35:29 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EEFF14203F;
	Fri,  9 Sep 2022 13:35:27 +0000 (GMT)
Received: from [9.145.83.17] (unknown [9.145.83.17])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri,  9 Sep 2022 13:35:27 +0000 (GMT)
Message-ID: <7fcc871c-fcc2-e993-fe88-f0da49ff227a@linux.ibm.com>
Date: Fri, 9 Sep 2022 15:35:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [RFC PATCH RESEND 14/28] mm: mark VMAs as locked before isolating
 them
Content-Language: fr
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
References: <20220901173516.702122-1-surenb@google.com>
 <20220901173516.702122-15-surenb@google.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20220901173516.702122-15-surenb@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0KecVJz831Cuz_-X5Ig4InH-HLRsZ-Pd
X-Proofpoint-ORIG-GUID: 9jojeoe4RfU5Q7JxugN35FnBK9tZpSK6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-09_08,2022-09-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=943
 spamscore=0 mlxscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
> Mark VMAs as locked before isolating them and clear their tree node so
> that isolated VMAs are easily identifiable. In the later patches page
> fault handlers will try locking the found VMA and will check whether
> the VMA was isolated. Locking VMAs before isolating them ensures that
> page fault handlers don't operate on isolated VMAs.

Found another place where the VMA should probably mark locked:
*** drivers/gpu/drm/drm_vma_manager.c:
drm_vma_node_revoke[338]       rb_erase(&entry->vm_rb, &node->vm_files);

There are 2 others entries in nommu.c but I guess this is not supported,
isn't it?


> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> ---
>  mm/mmap.c  | 2 ++
>  mm/nommu.c | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/mm/mmap.c b/mm/mmap.c
> index 094678b4434b..b0d78bdc0de0 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -421,12 +421,14 @@ static inline void vma_rb_insert(struct vm_area_struct *vma,
>  
>  static void __vma_rb_erase(struct vm_area_struct *vma, struct rb_root *root)
>  {
> +	vma_mark_locked(vma);
>  	/*
>  	 * Note rb_erase_augmented is a fairly large inline function,
>  	 * so make sure we instantiate it only once with our desired
>  	 * augmented rbtree callbacks.
>  	 */
>  	rb_erase_augmented(&vma->vm_rb, root, &vma_gap_callbacks);
> +	RB_CLEAR_NODE(&vma->vm_rb);
>  }
>  
>  static __always_inline void vma_rb_erase_ignore(struct vm_area_struct *vma,
> diff --git a/mm/nommu.c b/mm/nommu.c
> index e819cbc21b39..ff9933e57501 100644
> --- a/mm/nommu.c
> +++ b/mm/nommu.c
> @@ -622,6 +622,7 @@ static void delete_vma_from_mm(struct vm_area_struct *vma)
>  	struct mm_struct *mm = vma->vm_mm;
>  	struct task_struct *curr = current;
>  
> +	vma_mark_locked(vma);
>  	mm->map_count--;
>  	for (i = 0; i < VMACACHE_SIZE; i++) {
>  		/* if the vma is cached, invalidate the entire cache */
> @@ -644,6 +645,7 @@ static void delete_vma_from_mm(struct vm_area_struct *vma)
>  
>  	/* remove from the MM's tree and list */
>  	rb_erase(&vma->vm_rb, &mm->mm_rb);
> +	RB_CLEAR_NODE(&vma->vm_rb);
>  
>  	__vma_unlink_list(mm, vma);
>  }

