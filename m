Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F89A5AEFFB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 18:10:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMVjc0wpYz3bVB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 02:10:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J6ORDL5a;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J6ORDL5a;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMVhr6WK3z2yp5
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Sep 2022 02:10:04 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 286G1ULN030020;
	Tue, 6 Sep 2022 16:09:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=x38S2qQ4OwHVoHKSoYPnjgP27uumdmjd+TeYzCUlyRA=;
 b=J6ORDL5aCGIvEfcLxDfhTr7/+RF+0/LvREsL2V3CZkcCLtE/+mWalEpUqOC94iUOauQi
 Ys1/EZ7bq95YbsPik+EnE431aEf2UqSdDESpnQk1ZvCz6UGoQner634/J6Se2XbFnJdY
 CP0dUn0NNrJjSKVeC6tsg2PmkxCB87MTyDXzP3XD2YfrmcUlLGzUiQgPyRD4ByjwetEe
 umvc3onc8yB20pXsZ9Xr+jaWEyBCnziRa3HTlL8RTCeQDOhhIW0rbjIb4dCY23XuMfo/
 S9SdOC8N9MWb8SPa1J8pGPAi7PnwuU2yqevhLpqgnkcQFj8TFzYiiOpgHGIac+hNG9jn 3Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3je9c5gbx1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Sep 2022 16:09:42 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 286G2L7R002212;
	Tue, 6 Sep 2022 16:09:41 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3je9c5gbv1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Sep 2022 16:09:41 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 286Fq3eq001998;
	Tue, 6 Sep 2022 16:09:38 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma06ams.nl.ibm.com with ESMTP id 3jbx6hm0mb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Sep 2022 16:09:38 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 286G9x2A46072286
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 Sep 2022 16:09:59 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E2DCCA405C;
	Tue,  6 Sep 2022 16:09:35 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 81C3AA4054;
	Tue,  6 Sep 2022 16:09:34 +0000 (GMT)
Received: from [9.101.4.33] (unknown [9.101.4.33])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue,  6 Sep 2022 16:09:34 +0000 (GMT)
Message-ID: <68e2fb35-141d-5505-766f-29afe0d61435@linux.ibm.com>
Date: Tue, 6 Sep 2022 18:09:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.0
Subject: Re: [RFC PATCH RESEND 12/28] mm/mremap: mark VMA as locked while
 remapping it to a new address range
Content-Language: fr
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
References: <20220901173516.702122-1-surenb@google.com>
 <20220901173516.702122-13-surenb@google.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20220901173516.702122-13-surenb@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: u6aNfVLDHk7RSiY37OWL7z-spns9hXvc
X-Proofpoint-ORIG-GUID: FacK01iKrdQFaKH9Z6N8UXyqjBDgIbFI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-06_07,2022-09-06_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209060075
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
> Mark VMA as locked before copying it and when copy_vma produces a new VMA.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> ---
>  mm/mmap.c   | 1 +
>  mm/mremap.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/mm/mmap.c b/mm/mmap.c
> index ade3909c89b4..121544fd90de 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -3248,6 +3248,7 @@ struct vm_area_struct *copy_vma(struct vm_area_struct **vmap,
>  			get_file(new_vma->vm_file);
>  		if (new_vma->vm_ops && new_vma->vm_ops->open)
>  			new_vma->vm_ops->open(new_vma);
> +		vma_mark_locked(new_vma);
>  		vma_link(mm, new_vma, prev, rb_link, rb_parent);
>  		*need_rmap_locks = false;
>  	}

Sounds good in the both case the returned new_vma is locked, either in
copy_vma() or in vma_merge().

> diff --git a/mm/mremap.c b/mm/mremap.c
> index b522cd0259a0..bdbf96254e43 100644
> --- a/mm/mremap.c
> +++ b/mm/mremap.c
> @@ -620,6 +620,7 @@ static unsigned long move_vma(struct vm_area_struct *vma,
>  			return -ENOMEM;
>  	}
>  
> +	vma_mark_locked(vma);
>  	new_pgoff = vma->vm_pgoff + ((old_addr - vma->vm_start) >> PAGE_SHIFT);
>  	new_vma = copy_vma(&vma, new_addr, new_len, new_pgoff,
>  			   &need_rmap_locks);

Reviewed-by: Laurent Dufour <laurent.dufour@fr.ibm.com>
