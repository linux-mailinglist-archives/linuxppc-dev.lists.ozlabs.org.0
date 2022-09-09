Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B57215B3A96
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 16:21:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPJ8H5xr0z3bd3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Sep 2022 00:21:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rNg5JB+a;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rNg5JB+a;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPJ7d2cqBz30Ll
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Sep 2022 00:21:00 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 289DsLIA026634;
	Fri, 9 Sep 2022 14:20:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=uj7loTBXXPW4i9iEflVbXmEipqlwGfY/xezsxvd46U4=;
 b=rNg5JB+aMVC/cAIGwErptJ2WtnqCDtIzpVbtqIsHHQ9NPSPiyqluEhSd4/eHcKPodj/P
 F1k4tI9uXLN0mTWghd6ByjPT/jW+5Lqno0NYuMjqR65HH5aTjK73yXQlyuh5uUuTTXhl
 8aj3ct306ErHtFid5PHT6SQlojYM3bohUNl8ts+YIL8hB7IG9QxhvEZWXya2qRZyZZsG
 E7Sn0ixycdEm7AjYM4RIMY8r1eREuolcSJmkT0jnj3YZih6RNaPg5ZUDcKGKmXleq884
 1j17lTOGcwweEk34/f4lbq2DbayaA8Ag6iwN4V+p5GC2p4layzdIITBA7X3RakXsuI05 qA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jg6sj0ru0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Sep 2022 14:20:43 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 289DsaeB027376;
	Fri, 9 Sep 2022 14:20:42 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jg6sj0rt3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Sep 2022 14:20:42 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 289EKNxG009351;
	Fri, 9 Sep 2022 14:20:40 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma04fra.de.ibm.com with ESMTP id 3jbxj8p0ku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Sep 2022 14:20:39 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 289EKbUq41025974
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 Sep 2022 14:20:37 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7B70542042;
	Fri,  9 Sep 2022 14:20:37 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6167E4203F;
	Fri,  9 Sep 2022 14:20:36 +0000 (GMT)
Received: from [9.145.83.17] (unknown [9.145.83.17])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri,  9 Sep 2022 14:20:36 +0000 (GMT)
Message-ID: <70a7d9cd-e64b-db49-e418-b4de7fcf8692@linux.ibm.com>
Date: Fri, 9 Sep 2022 16:20:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [RFC PATCH RESEND 17/28] mm/mmap: prevent pagefault handler from
 racing with mmu_notifier registration
Content-Language: fr
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
References: <20220901173516.702122-1-surenb@google.com>
 <20220901173516.702122-18-surenb@google.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20220901173516.702122-18-surenb@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: iGD1tmfWW3MB8GuX-XKLgDYuqetnM8iW
X-Proofpoint-ORIG-GUID: cHqg_70A5LQCVVOFQNQjRcOJVIq9uaqR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-09_08,2022-09-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 spamscore=0 clxscore=1015 mlxscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209090049
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
> Pagefault handlers might need to fire MMU notifications while a new
> notifier is being registered. Modify mm_take_all_locks to mark all VMAs
> as locked and prevent this race with fault handlers that would hold VMA
> locks.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> ---
>  mm/mmap.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/mm/mmap.c b/mm/mmap.c
> index b31cc97c2803..1edfcd384f5e 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -3538,6 +3538,7 @@ static void vm_lock_mapping(struct mm_struct *mm, struct address_space *mapping)
>   *     hugetlb mapping);
>   *   - all i_mmap_rwsem locks;
>   *   - all anon_vma->rwseml
> + *   - all vmas marked locked

IIRC, the anon_vma may be locked during the page fault handling, and this
happens after the VMA is read lock. I think the same applies to
i_mmap_rwsem lock.

Thus, the VMA should be marked locked first.

>   *
>   * We can take all locks within these types randomly because the VM code
>   * doesn't nest them and we protected from parallel mm_take_all_locks() by
> @@ -3579,6 +3580,7 @@ int mm_take_all_locks(struct mm_struct *mm)
>  		if (vma->anon_vma)
>  			list_for_each_entry(avc, &vma->anon_vma_chain, same_vma)
>  				vm_lock_anon_vma(mm, avc->anon_vma);
> +		vma_mark_locked(vma);
>  	}
>  
>  	return 0;
> @@ -3636,6 +3638,7 @@ void mm_drop_all_locks(struct mm_struct *mm)
>  	mmap_assert_write_locked(mm);
>  	BUG_ON(!mutex_is_locked(&mm_all_locks_mutex));
>  
> +	vma_mark_unlocked_all(mm);
>  	for (vma = mm->mmap; vma; vma = vma->vm_next) {
>  		if (vma->anon_vma)
>  			list_for_each_entry(avc, &vma->anon_vma_chain, same_vma)

