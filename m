Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4795B396B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 15:44:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPHKc5DMNz3c4Y
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 23:44:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Kto3IJwk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Kto3IJwk;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPHJv4Qpjz30KY
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 23:43:59 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 289DAbM3010670;
	Fri, 9 Sep 2022 13:43:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Y0mVTz1Lf0bysAreM92v0+W21ZGEaC6PTpYbiBGl9so=;
 b=Kto3IJwkg5cHnydbnh1y6sqRW67TkTzQLFX8SrzCrpvVJWlPMUNPP6XOJHTX4yMQ04RD
 lqdVCN7TRvBch6Ei9V/rsOlOPKz5ZwKsS4oT/TRcCq3y2+uufO/LOxGYQLf1PBFspl3k
 9F6fkjY4M9rhqW4K50cSdlVw0O6XWkeNudqu8Ssq4VV1WXriiHybbG0rOV77GV/DIsZO
 A20a0bpVLimU41sYFuYrSpYFRmlmo5LfmwXfbL4r7NJW9C+T1+KaL0Cw8R1vNa6DgLgV
 yVxwITZ2D39ibCplr/ESymHiBSS0D9uKx9G46AvZu0e5Bolx//7AlM/Ri9uS12AbzHK7 pA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jg5w69fmq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Sep 2022 13:43:36 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 289DBHN4015324;
	Fri, 9 Sep 2022 13:43:35 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jg5w69fkp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Sep 2022 13:43:35 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 289DKUsZ027049;
	Fri, 9 Sep 2022 13:43:32 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma04fra.de.ibm.com with ESMTP id 3jbxj8nymy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Sep 2022 13:43:32 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 289DhTEK38011256
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 Sep 2022 13:43:29 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A7FDE42047;
	Fri,  9 Sep 2022 13:43:29 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9374A4203F;
	Fri,  9 Sep 2022 13:43:28 +0000 (GMT)
Received: from [9.145.83.17] (unknown [9.145.83.17])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri,  9 Sep 2022 13:43:28 +0000 (GMT)
Message-ID: <83a36761-2045-3f46-3088-a751c5263b81@linux.ibm.com>
Date: Fri, 9 Sep 2022 15:43:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [RFC PATCH RESEND 15/28] mm/mmap: mark adjacent VMAs as locked if
 they can grow into unmapped area
Content-Language: fr
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
References: <20220901173516.702122-1-surenb@google.com>
 <20220901173516.702122-16-surenb@google.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20220901173516.702122-16-surenb@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vsmxLApnSa4kFm4DsE4c9nzLp7_dueVe
X-Proofpoint-ORIG-GUID: _47dY4KcG9Nanbo62JUX-I9vUetE4UJD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-09_08,2022-09-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 malwarescore=0 mlxlogscore=894 phishscore=0
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
> While unmapping VMAs, adjacent VMAs might be able to grow into the area
> being unmapped. In such cases mark adjacent VMAs as locked to prevent
> this growth.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> ---
>  mm/mmap.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/mmap.c b/mm/mmap.c
> index b0d78bdc0de0..b31cc97c2803 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -2680,10 +2680,14 @@ detach_vmas_to_be_unmapped(struct mm_struct *mm, struct vm_area_struct *vma,
>  	 * VM_GROWSUP VMA. Such VMAs can change their size under
>  	 * down_read(mmap_lock) and collide with the VMA we are about to unmap.
>  	 */
> -	if (vma && (vma->vm_flags & VM_GROWSDOWN))
> +	if (vma && (vma->vm_flags & VM_GROWSDOWN)) {
> +		vma_mark_locked(vma);
>  		return false;
> -	if (prev && (prev->vm_flags & VM_GROWSUP))
> +	}
> +	if (prev && (prev->vm_flags & VM_GROWSUP)) {
> +		vma_mark_locked(prev);
>  		return false;
> +	}
>  	return true;
>  }
>

That looks right to be.

But, in addition to that, like the previous patch, all the VMAs to be
detached from the tree in the loop above, should be marked locked just
before calling vm_rb_erase().
