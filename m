Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DAAC05AED8D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 16:49:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMSvN5n91z3bNj
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 00:49:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nCcilSm8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nCcilSm8;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMStg5726z2yxQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Sep 2022 00:48:27 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 286EaRfD002774;
	Tue, 6 Sep 2022 14:48:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=iD2882N/HlldKSEr9X6ZoBibI3jeqzaIEUnBgAl5tZU=;
 b=nCcilSm8md6OE2sLtootXm+XF8tFvTEcTQ8Z0Mkv85PmeO/AGtlTFGdjSSREbOJt8I3z
 N2lSHUcS/oq1VKIafJaN5ySuuJeWgGbl1EyYDKh+wNS1D0BiMjsp8+qRDY151LrZ8Fzo
 c0+j3TQZVIWDu/noBvk9j1VBilzA9T90Salr/P1n18wQ3/Uk0pHenqhnD45Gg5kkq7GO
 SeJ1cnqOaEnrzt/zILQimERc+AuzH5aE1ocHnwu61J8LtOHX7ShPT4zp3HExg5kNH1EP
 +xQJXYmITgme9ZGJXcPEQjT8o4Y0j7GWG+MSQyQaW9/akcr6wIudy05DmFj645nFssd1 2A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3je7rn1ycw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Sep 2022 14:48:04 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 286EaXRs003410;
	Tue, 6 Sep 2022 14:48:04 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3je7rn1yb5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Sep 2022 14:48:03 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 286Ea5OM006187;
	Tue, 6 Sep 2022 14:48:01 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma06ams.nl.ibm.com with ESMTP id 3jbx6hkwvu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Sep 2022 14:48:00 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 286Elwjj39780718
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 Sep 2022 14:47:58 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8C6A4A405C;
	Tue,  6 Sep 2022 14:47:58 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 69530A4054;
	Tue,  6 Sep 2022 14:47:57 +0000 (GMT)
Received: from [9.101.4.33] (unknown [9.101.4.33])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue,  6 Sep 2022 14:47:57 +0000 (GMT)
Message-ID: <98d5f462-c4dc-a967-0ab0-f24dd3e37dff@linux.ibm.com>
Date: Tue, 6 Sep 2022 16:47:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.0
Subject: Re: [RFC PATCH RESEND 09/28] mm/mempolicy: mark VMA as locked when
 changing protection policy
Content-Language: fr
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
References: <20220901173516.702122-1-surenb@google.com>
 <20220901173516.702122-10-surenb@google.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20220901173516.702122-10-surenb@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7I7HaW_zSPCUESol8JKQ6keMsvh5MEMI
X-Proofpoint-ORIG-GUID: n0vpG0zoQiPRwb2hnQ9A_0zBzLzp1LaC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-06_07,2022-09-06_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 spamscore=0 bulkscore=0
 phishscore=0 mlxlogscore=959 malwarescore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209060070
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
> Protect VMA from concurrent page fault handler while performing VMA
> protection policy changes.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> ---
>  mm/mempolicy.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> index b73d3248d976..6be1e5c75556 100644
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
> @@ -383,8 +383,10 @@ void mpol_rebind_mm(struct mm_struct *mm, nodemask_t *new)
>  	struct vm_area_struct *vma;
>  
>  	mmap_write_lock(mm);
> -	for (vma = mm->mmap; vma; vma = vma->vm_next)
> +	for (vma = mm->mmap; vma; vma = vma->vm_next) {
> +		vma_mark_locked(vma);
>  		mpol_rebind_policy(vma->vm_policy, new);
> +	}
>  	mmap_write_unlock(mm);
>  }
>  
> @@ -632,6 +634,7 @@ unsigned long change_prot_numa(struct vm_area_struct *vma,
>  	struct mmu_gather tlb;
>  	int nr_updated;
>  
> +	vma_mark_locked(vma);

If I understand that corretly, the VMA itself is not impacted, only the
PMDs/PTEs, and they are protected using the page table locks.

Am I missing something?

>  	tlb_gather_mmu(&tlb, vma->vm_mm);
>  
>  	nr_updated = change_protection(&tlb, vma, addr, end, PAGE_NONE,
> @@ -765,6 +768,7 @@ static int vma_replace_policy(struct vm_area_struct *vma,
>  	if (IS_ERR(new))
>  		return PTR_ERR(new);
>  
> +	vma_mark_locked(vma);
>  	if (vma->vm_ops && vma->vm_ops->set_policy) {
>  		err = vma->vm_ops->set_policy(vma, new);
>  		if (err)

