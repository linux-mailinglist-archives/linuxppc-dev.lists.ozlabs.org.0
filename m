Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C13445AEEF9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 17:36:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMTy673bvz3c25
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 01:36:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g9MNvbWk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g9MNvbWk;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMTxN6XxGz2yZ4
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Sep 2022 01:35:52 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 286FBeIG026050;
	Tue, 6 Sep 2022 15:35:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=CCB/9B/VGZcYjAW4bol02QJau+ML8Cq+ut7fJ+/BiSM=;
 b=g9MNvbWktlc31b831uGmdlHB6E3iLzyOpXNM0yDWQowDNDvDQ1TxNlvUcMO2qOzIATQ8
 sdISgiuBZdHWGLf/siyQlkB2M9Cd6JW8olL1S7B7f9wxI8EhNoE8Td1YdVTxsb4QC5F9
 HPNBHbx+5V841eWqM4nrztaSR2HtDRCAz2bcenhK6vGoKsmjvaC0+E4nMazPR4U59vSs
 aL1EYv77NKxmF0KGbHC53igSHvIKSw0/KpvdfzjbQAFFjZmDIkz0Y+tdtZDl3LNFOUzA
 y3SoKLecxAZgGri64LSrKoBHUZ94iZd6HhtycS1Sfb/CaLn3sVTnttNn014UrZOJeNsk XA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3je8ms0xg1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Sep 2022 15:35:29 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 286FCEZj030062;
	Tue, 6 Sep 2022 15:35:29 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3je8ms0xeg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Sep 2022 15:35:29 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 286FM3T7015755;
	Tue, 6 Sep 2022 15:35:26 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma04ams.nl.ibm.com with ESMTP id 3jbxj8uxxf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Sep 2022 15:35:26 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 286FZmpk41943462
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 Sep 2022 15:35:48 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7149CA405B;
	Tue,  6 Sep 2022 15:35:24 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4DAD3A4054;
	Tue,  6 Sep 2022 15:35:23 +0000 (GMT)
Received: from [9.101.4.33] (unknown [9.101.4.33])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue,  6 Sep 2022 15:35:23 +0000 (GMT)
Message-ID: <bb5e3ab8-9c47-7d01-cdaa-1b4231312f67@linux.ibm.com>
Date: Tue, 6 Sep 2022 17:35:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.0
Subject: Re: [RFC PATCH RESEND 10/28] mm/mmap: mark VMAs as locked in
 vma_adjust
Content-Language: fr
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
References: <20220901173516.702122-1-surenb@google.com>
 <20220901173516.702122-11-surenb@google.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20220901173516.702122-11-surenb@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: RPviPaQg9ufmkDmm23mjHAa54D3aXI3j
X-Proofpoint-GUID: ims9kwP10imrbQrjpniggmamS9Hw3mcB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-06_07,2022-09-06_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
> vma_adjust modifies a VMA and possibly its neighbors. Mark them as locked
> before making the modifications.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> ---
>  mm/mmap.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/mmap.c b/mm/mmap.c
> index f89c9b058105..ed58cf0689b2 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -710,6 +710,10 @@ int __vma_adjust(struct vm_area_struct *vma, unsigned long start,
>  	long adjust_next = 0;
>  	int remove_next = 0;
>  
> +	vma_mark_locked(vma);
> +	if (next)
> +		vma_mark_locked(next);
> +

I was wondering if the VMAs insert and expand should be locked too.

For expand, I can't see any valid reason, but for insert, I'm puzzled.
I would think that it is better to lock the VMA to be inserted but I can't
really justify that.

It may be nice to detail why this is not need to lock insert and expand here.

>  	if (next && !insert) {
>  		struct vm_area_struct *exporter = NULL, *importer = NULL;
>  
> @@ -754,8 +758,11 @@ int __vma_adjust(struct vm_area_struct *vma, unsigned long start,
>  			 * If next doesn't have anon_vma, import from vma after
>  			 * next, if the vma overlaps with it.
>  			 */
> -			if (remove_next == 2 && !next->anon_vma)
> +			if (remove_next == 2 && !next->anon_vma) {
>  				exporter = next->vm_next;
> +				if (exporter)
> +					vma_mark_locked(exporter);
> +			}
>  
>  		} else if (end > next->vm_start) {
>  			/*
> @@ -931,6 +938,8 @@ int __vma_adjust(struct vm_area_struct *vma, unsigned long start,
>  			 * "vma->vm_next" gap must be updated.
>  			 */
>  			next = vma->vm_next;
> +			if (next)
> +				vma_mark_locked(next);
>  		} else {
>  			/*
>  			 * For the scope of the comment "next" and

