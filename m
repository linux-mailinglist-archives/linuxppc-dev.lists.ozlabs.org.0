Return-Path: <linuxppc-dev+bounces-7048-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7FDA60D3E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Mar 2025 10:27:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDfCp6ywnz3cVb;
	Fri, 14 Mar 2025 20:27:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741944454;
	cv=none; b=RffA8/mZjwveJ3o7fqQ/j0nY4lHBCTATRW8RPI/mOxill7L2ALLPl+2vGDtwMLks0vCxByxpJlLGn3OHPhXaHAS/nR+IZ68rVtHGGrIKPotmvDeAR0XUzfDdZ8jFJm4ZvvWFUNVVJmJnjgo0Za1jkoR9nU7vWIMASWuho7QHBh/m+SnoPbTli3DPFMk/iBQj0LmgCPFefQRDR8ZkhTc1HAwcZl6W0IEUHo1jZqrjfMD/LqE1254r8TyPGQf9Dn0TVh9vF0TyYzHy8Wxp1P5nno1ZHofNHcG/pqq8ZudMupDzqic2nKBvCFH+NAwW/MLQl6fTnByRB/0RmBpY4dLoDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741944454; c=relaxed/relaxed;
	bh=zaxcah9quOMJZnravjPwqR6x4fcDjYrPpq1b73P4XP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CNs4/nD2zZNAC73nESvBjOCFFKQb7XpKN54VpSolC5X46l3ncb2caS/kHJOtwXkZpvFPveqYruYKWZd6x3jBLSqapb4DOvTpr/V987Q29SDCdgNu3POEGw8/TlHO+POhsNrFG6jPvRGqmqv8FpIOcUZ79BLrAcik4gi3RLH4yuwWuMdkrSnWOgPY3zNrEBoFTfe339cRvNf+lFzPX9L7NBdcmONarHU15Bu0DwaVabF8k6i18CteuvpHiKEBqyLusUrJiC6n8TrxBEPJ7RAHFcMN9y66erWTUI4/r0Z6p8eYSq5bIkUR4vKO91ukCYIBAhTrSDyOKLgcXwzfPTpMNQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SnWVPt2a; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SnWVPt2a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDfCp1NTbz30WF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 20:27:33 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DNPn0w031989;
	Fri, 14 Mar 2025 09:27:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=zaxcah
	9quOMJZnravjPwqR6x4fcDjYrPpq1b73P4XP4=; b=SnWVPt2a+xZd9eS8IiCLy3
	CEsjfIgPxBCVrdag18O2vvXXTU64VgKWBKBzl7PZYdPQboQd91Id8CKThpKYIpRU
	X/fymQS3sPiZM7UeGMpqgJ2LlZD8sO4VvTg91bDfm/LreW2IudzYYKakDXztEb7O
	AEIyxs91mPHPCZ/BRPiC4xeEpscPPhRFCtAiizAubjWY19orkPlQTAEY59IKQ45G
	2D93vCDvg53sznKMwq2vkAQ0ilNXQ871yqGjJJ3e4bfuj1ti38O7HPEZXWh14mao
	2eEXxnaioJ9cbrzgvR70e3Hut0HcTsIOgSMKszmWb2orSaskPVVD+VqIvDdoLeRg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45byd8wes1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 09:27:22 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52E9RLr6027634;
	Fri, 14 Mar 2025 09:27:21 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45byd8werx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 09:27:21 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52E8F9aD026047;
	Fri, 14 Mar 2025 09:27:20 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 45atspp96d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 09:27:20 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52E9RGKA17301806
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Mar 2025 09:27:17 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E033C20040;
	Fri, 14 Mar 2025 09:27:16 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 239AE2004E;
	Fri, 14 Mar 2025 09:27:14 +0000 (GMT)
Received: from [9.39.22.126] (unknown [9.39.22.126])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Mar 2025 09:27:13 +0000 (GMT)
Message-ID: <333198fd-e028-42cb-8847-bd5ddd2a623b@linux.ibm.com>
Date: Fri, 14 Mar 2025 14:57:13 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] powerpc: book3s: vas: use lock guard for mutex
To: Peter Zijlstra <peterz@infradead.org>
Cc: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, mpe@ellerman.id.au, fbarrat@linux.ibm.com,
        ajd@linux.ibm.com, mahesh@linux.ibm.com, oohall@gmail.com,
        hbathini@linux.ibm.com, dhowells@redhat.com, haren@linux.ibm.com,
        linux-kernel@vger.kernel.org
References: <20250314054544.1998928-1-sshegde@linux.ibm.com>
 <20250314054544.1998928-5-sshegde@linux.ibm.com>
 <20250314082527.GU5880@noisy.programming.kicks-ass.net>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20250314082527.GU5880@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bhqGI1arLrSR6zhLyvrGoDlQ2tlLnGbB
X-Proofpoint-ORIG-GUID: Pq9BzbBph-GplGKCkLgSvvH7E4Ys25bm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_03,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=896 clxscore=1015 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140075
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 3/14/25 13:55, Peter Zijlstra wrote:
> On Fri, Mar 14, 2025 at 11:15:42AM +0530, Shrikanth Hegde wrote:
>> use guard(mutex) for scope based resource management of mutex.
>> This would make the code simpler and easier to maintain.
>>
>> More details on lock guards can be found at
>> https://lore.kernel.org/all/20230612093537.614161713@infradead.org/T/#u
>>
>> There is also an example of using scoped_guard.
>>
>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>> ---
>>   arch/powerpc/platforms/book3s/vas-api.c | 19 ++++++-------------
>>   1 file changed, 6 insertions(+), 13 deletions(-)
>>
>> diff --git a/arch/powerpc/platforms/book3s/vas-api.c b/arch/powerpc/platforms/book3s/vas-api.c
>> index 0b6365d85d11..eb1a97271afb 100644
>> --- a/arch/powerpc/platforms/book3s/vas-api.c
>> +++ b/arch/powerpc/platforms/book3s/vas-api.c
>> @@ -425,7 +425,7 @@ static vm_fault_t vas_mmap_fault(struct vm_fault *vmf)
>>   		return VM_FAULT_SIGBUS;
>>   	}
>>   
>> -	mutex_lock(&txwin->task_ref.mmap_mutex);
>> +	guard(mutex)(&txwin->task_ref.mmap_mutex);
>>   	/*
>>   	 * The window may be inactive due to lost credit (Ex: core
>>   	 * removal with DLPAR). If the window is active again when
>> @@ -437,11 +437,9 @@ static vm_fault_t vas_mmap_fault(struct vm_fault *vmf)
>>   		if (paste_addr) {
>>   			fault = vmf_insert_pfn(vma, vma->vm_start,
>>   					(paste_addr >> PAGE_SHIFT));
>> -			mutex_unlock(&txwin->task_ref.mmap_mutex);
>>   			return fault;
>>   		}
>>   	}
>> -	mutex_unlock(&txwin->task_ref.mmap_mutex);
> 
> I had to open up this file to check, but this seems incorrect since you
> now also run do_fail_paste() with the lock held, where previously you
> did not.
> 

Yes. Got it. let me use scoped_guard for it as well. There is get_user 
and other things in the fail parse and having it with mutex will not be 
good.

I went through the rest of the patches too. It is mostly return after 
mutex.

Only in Patch 5/6 there is additional debug statement. Let me put a 
comment there.

> 
>>   	/*
>>   	 * Received this fault due to closing the actual window.


