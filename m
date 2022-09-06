Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8C75AEF34
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 17:45:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMV8z2KzZz3bxL
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 01:45:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Fm+iNgkU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Fm+iNgkU;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMV8H1n4Dz2yp5
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Sep 2022 01:45:18 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 286FcHE0023464;
	Tue, 6 Sep 2022 15:44:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=4MkljBVDokyvV6hOWPaWLbtYatl+ONZEu/cDpFdhfog=;
 b=Fm+iNgkU5d4uKCI7Y1xRCitnpbuo/A24XIoPyCtfFTdo9mA03DlEDw03VU0vzA4hFfAc
 kQDEZphbp3WIsa/oiG9V2mArj+hG/lNOjmK0hdHk8I+0wR04Wzp4ep+J43OLvE+H1Yz1
 2MOw0MK65npWrjR5L90MbVti0PXZzRqxTTW5bT9hPk9HYuKHgypTy70KjirGFWWxGYiu
 GsGpr89SmwoGpsvjMQ/lF/3Yw0lHZ6301qLgnVKnxUKdSBuw4XJ49AZACAY+QRe6SD7h
 dR31b8ygFBKNNQ9b8QhGdaQigvB05g10ZTni8oZjhV8GRActoQ6uT6kxXJgnDqZG5Wy+ DQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3je8su90qt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Sep 2022 15:44:57 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 286FcLWh023984;
	Tue, 6 Sep 2022 15:44:56 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3je8su90nq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Sep 2022 15:44:56 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 286FfwEK029294;
	Tue, 6 Sep 2022 15:44:52 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma03fra.de.ibm.com with ESMTP id 3jbxj8tx7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Sep 2022 15:44:52 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 286FiodI41025964
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 Sep 2022 15:44:50 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3A287A405B;
	Tue,  6 Sep 2022 15:44:50 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 15515A4054;
	Tue,  6 Sep 2022 15:44:49 +0000 (GMT)
Received: from [9.101.4.33] (unknown [9.101.4.33])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue,  6 Sep 2022 15:44:49 +0000 (GMT)
Message-ID: <70d59f18-472b-489c-ca4e-50e7d992b93e@linux.ibm.com>
Date: Tue, 6 Sep 2022 17:44:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.0
Subject: Re: [RFC PATCH RESEND 11/28] mm/mmap: mark VMAs as locked before
 merging or splitting them
Content-Language: fr
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
References: <20220901173516.702122-1-surenb@google.com>
 <20220901173516.702122-12-surenb@google.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20220901173516.702122-12-surenb@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 825aBYYK_9T5U_u_iVzb9oKQMAjxZkqg
X-Proofpoint-ORIG-GUID: BKjiziNjdxx17PCzm6Fd6iufU577aiSy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-06_07,2022-09-06_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=729 clxscore=1015 mlxscore=0 adultscore=0 bulkscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209060073
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
> Decisions about whether VMAs can be merged or split must be made while
> VMAs are protected from the changes which can affect that decision.
> For example, merge_vma uses vma->anon_vma in its decision whether the
> VMA can be merged. Meanwhile, page fault handler changes vma->anon_vma
> during COW operation.
> Mark all VMAs which might be affected by a merge or split operation as
> locked before making decision how such operations should be performed.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> ---
>  mm/mmap.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/mmap.c b/mm/mmap.c
> index ed58cf0689b2..ade3909c89b4 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -1147,10 +1147,17 @@ struct vm_area_struct *vma_merge(struct mm_struct *mm,
>  	if (vm_flags & VM_SPECIAL)
>  		return NULL;
>  
> +	if (prev)
> +		vma_mark_locked(prev);
>  	next = vma_next(mm, prev);
>  	area = next;
> -	if (area && area->vm_end == end)		/* cases 6, 7, 8 */
> +	if (area)
> +		vma_mark_locked(area);
> +	if (area && area->vm_end == end) {		/* cases 6, 7, 8 */
>  		next = next->vm_next;
> +		if (next)
> +			vma_mark_locked(next);
> +	}
>  
>  	/* verify some invariant that must be enforced by the caller */
>  	VM_WARN_ON(prev && addr <= prev->vm_start);
> @@ -2687,6 +2694,7 @@ int __split_vma(struct mm_struct *mm, struct vm_area_struct *vma,
>  	struct vm_area_struct *new;
>  	int err;
>  
> +	vma_mark_locked(vma);
>  	if (vma->vm_ops && vma->vm_ops->may_split) {
>  		err = vma->vm_ops->may_split(vma, addr);
>  		if (err)

That looks good to me, the new VMA allocated by vm_area_dup(vma) is
inheriting the locked state from vma.

Reviewed-by: Laurent Dufour <laurent.dufour@fr.ibm.com>
