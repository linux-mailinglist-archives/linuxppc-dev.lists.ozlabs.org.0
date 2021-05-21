Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9456038CA90
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 18:04:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmryQ42qFz30CX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 May 2021 02:04:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=l7BwaU8K;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=l7BwaU8K; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fmrxt2FK7z303h
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 May 2021 02:03:45 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14LG3HNM188806; Fri, 21 May 2021 12:03:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=N1rbqK/XMCL7am60a7O6VUqDvZ7qe5oADvnVrd9S6aQ=;
 b=l7BwaU8Kv/8TLY64Ngb9DnkEA7UmjkC+la+NcEFRRCOa6Ru8pcoUyNtxgWn5FxrIGszR
 48A/DryYJujqbgpkSC/zr9HikL1KJKaUwKIjSJx6emIDFsd79kLoTfb9t+LhpkaTeWVu
 Xn6wYxh8n8W/aNIc3iXh/8CfzI0fNaxrxLDlNKnSQ7t8NNFkxgYDBVuj3/WlQ8ahSaF4
 DmWaIE4k2dwFiTi84iO974wG1Phew0QEnWigHDcae00m3joruc1N7Os9IKieIZSJY3lN
 odjzCkqx982SoBgYd8uAhYNhClEZ07vECucejQrm8TNjZW1UOAJjqShVOJJvysRX9fUE lQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38pfgqgxy1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 12:03:23 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14LG3NRn189597;
 Fri, 21 May 2021 12:03:23 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38pfgqgxph-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 12:03:23 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14LFsZ1L009905;
 Fri, 21 May 2021 16:02:56 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03fra.de.ibm.com with ESMTP id 38j5x89t86-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 16:02:56 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14LG2rcf32244156
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 16:02:53 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB9BCA4053;
 Fri, 21 May 2021 16:02:53 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 36868A404D;
 Fri, 21 May 2021 16:02:52 +0000 (GMT)
Received: from [9.199.42.28] (unknown [9.199.42.28])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 21 May 2021 16:02:52 +0000 (GMT)
Subject: Re: [PATCH v5 7/9] mm/mremap: Move TLB flush outside page table lock
To: Liam Howlett <liam.howlett@oracle.com>
References: <20210422054323.150993-1-aneesh.kumar@linux.ibm.com>
 <20210422054323.150993-8-aneesh.kumar@linux.ibm.com>
 <b3047082-fc82-b326-dbdb-835b88df78d0@linux.ibm.com>
 <2eafd7df-65fd-1e2c-90b6-d143557a1fdc@linux.ibm.com>
 <CAHk-=wjq8thag3uNv-2MMu75OgX5ybMon7gZDUHYwzeTwcZHoA@mail.gmail.com>
 <f676b053-bda4-a1f5-321e-f00fb3de8a40@linux.ibm.com>
 <CAHk-=wgXVR04eBNtxQfevontWnP6FDm+oj5vauQXP3S-huwbPw@mail.gmail.com>
 <5ea8fa4f-a5a2-7dc4-7958-23df6a2c1f3a@linux.ibm.com>
 <20210521152438.jczhe6nxnz5woxpl@revolver>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <d7610239-a6b2-3375-1226-695abbfb3a05@linux.ibm.com>
Date: Fri, 21 May 2021 21:32:51 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210521152438.jczhe6nxnz5woxpl@revolver>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dS9CiiAx1ICwpEynYFxwLGusDx5KvyJh
X-Proofpoint-ORIG-GUID: bz6Dxajh1H0-JeVay67N7oWI0Ej-yXim
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-21_07:2021-05-20,
 2021-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 clxscore=1011 lowpriorityscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 mlxscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105210085
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nick Piggin <npiggin@gmail.com>, Linux-MM <linux-mm@kvack.org>,
 Kalesh Singh <kaleshsingh@google.com>, Joel Fernandes <joel@joelfernandes.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/21/21 8:54 PM, Liam Howlett wrote:
> * Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com> [210521 08:51]:
>> On 5/21/21 11:43 AM, Linus Torvalds wrote:
>>> On Thu, May 20, 2021 at 5:03 PM Aneesh Kumar K.V
>>> <aneesh.kumar@linux.ibm.com> wrote:
>>>>
>>>> On 5/21/21 8:10 AM, Linus Torvalds wrote:
>>>>>
>>>>> So mremap does need to flush the TLB before releasing the page table
>>>>> lock, because that's the lifetime boundary for the page that got
>>>>> moved.
>>>>
>>>> How will we avoid that happening with
>>>> c49dd340180260c6239e453263a9a244da9a7c85 /
>>>> 2c91bd4a4e2e530582d6fd643ea7b86b27907151 . The commit improves mremap
>>>> performance by moving level3/level2 page table entries. When doing so we
>>>> are not holding level 4 ptl lock (pte_lock()). But rather we are holding
>>>> pmd_lock or pud_lock(). So if we move pages around without holding the
>>>> pte lock, won't the above issue happen even if we do a tlb flush with
>>>> holding pmd lock/pud lock?
>>>
>>> Hmm. Interesting.
>>>
>>> Your patch (to flush the TLB after clearing the old location, and
>>> before inserting it into the new one) looks like an "obvious" fix.
>>>
>>> But I'm putting that "obvious" in quotes, because I'm now wondering if
>>> it actually fixes anything.
>>>
>>> Lookie here:
>>>
>>>    - CPU1 does a mremap of a pmd or pud.
>>>
>>>       It clears the old pmd/pud, flushes the old TLB range, and then
>>> inserts the pmd/pud at the new location.
>>>
>>>    - CPU2 does a page shrinker, which calls try_to_unmap, which calls
>>> try_to_unmap_one.
>>>
>>> These are entirely asynchronous, because they have no shared lock. The
>>> mremap uses the pmd lock, the try_to_unmap_one() does the rmap walk,
>>> which does the pte lock.
>>>
>>> Now, imagine that the following ordering happens with the two
>>> operations above, and a CPU3 that does accesses:
>>>
>>>    - CPU2 follows (and sees) the old page tables in the old location and
>>> the took the pte lock
>>>
>>>    - the mremap on CPU1 starts - cleared the old pmd, flushed the tlb,
>>> *and* inserts in the new place.
>>>
>>>    - a user thread on CPU3 accesses the new location and fills the TLB
>>> of the *new* address
> 
> mremap holds the mmap_sem in write mode as well, doesn't it?  How is the user thread
> getting the new location?
> 

Immediately after CPU1 insert new addr translation as part of mremap, 
CPU3 can access that translation by dereferencing the new address.

-aneesh
