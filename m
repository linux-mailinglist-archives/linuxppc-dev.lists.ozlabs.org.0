Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF5338C71A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 14:51:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fmmh907Kqz3bwS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 22:51:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=S+J252tH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=S+J252tH; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fmmgg05srz305p
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 22:51:10 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14LCXdTG072253; Fri, 21 May 2021 08:50:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=XeMK+YAjUgBPno/SAaPr79RdwbMyvMRZkG9gwDggO+0=;
 b=S+J252tHwpjNJRLl6jISM0YKtB5AGFVM1DJINFbO1fZWnNJ0T0I60fORkm7g6QnnUhp8
 rWwtNIoiQLUspYIFx6fBvkDpYqNsWNcwHCJUDeEsbA2Z4dXAYvovVt97RR/0t9X6RY+u
 s4XFAEfuNQW4VwbKqyNu4KS516DgZDURcX/nNVrrP4EONgmJUMfruuO27NrNDr0xNfWK
 Gfe9VI5yC0ZvW+gcVMGKxu9PvETY72dKihaJ4AuQNqxlsr7VGeCmAAjn1px1sdIkyUDd
 8m+VrfbYXhuSc+BOPO8qOfYn3b3bjQ3oWmknu+8tHhDLMUlqbXffTIPrGamq+LeQIa4x fg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38pbccb6me-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 08:50:54 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14LCY4XO073886;
 Fri, 21 May 2021 08:50:54 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38pbccb6kw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 08:50:54 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14LCmm7A021379;
 Fri, 21 May 2021 12:50:51 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 38j5x7u598-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 12:50:51 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 14LCoLll31129986
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 12:50:21 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8747BA4059;
 Fri, 21 May 2021 12:50:49 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 814F1A404D;
 Fri, 21 May 2021 12:50:46 +0000 (GMT)
Received: from [9.199.42.28] (unknown [9.199.42.28])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 21 May 2021 12:50:46 +0000 (GMT)
Subject: Re: [PATCH v5 7/9] mm/mremap: Move TLB flush outside page table lock
To: Linus Torvalds <torvalds@linux-foundation.org>
References: <20210422054323.150993-1-aneesh.kumar@linux.ibm.com>
 <20210422054323.150993-8-aneesh.kumar@linux.ibm.com>
 <b3047082-fc82-b326-dbdb-835b88df78d0@linux.ibm.com>
 <2eafd7df-65fd-1e2c-90b6-d143557a1fdc@linux.ibm.com>
 <CAHk-=wjq8thag3uNv-2MMu75OgX5ybMon7gZDUHYwzeTwcZHoA@mail.gmail.com>
 <f676b053-bda4-a1f5-321e-f00fb3de8a40@linux.ibm.com>
 <CAHk-=wgXVR04eBNtxQfevontWnP6FDm+oj5vauQXP3S-huwbPw@mail.gmail.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <5ea8fa4f-a5a2-7dc4-7958-23df6a2c1f3a@linux.ibm.com>
Date: Fri, 21 May 2021 18:20:45 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAHk-=wgXVR04eBNtxQfevontWnP6FDm+oj5vauQXP3S-huwbPw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: uGbeGidMYLvJPmnalTz5DFE8PKJpppgq
X-Proofpoint-GUID: LFJBB7IoO1LIDkwFwV77_L6SoUR6sqc4
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-21_04:2021-05-20,
 2021-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105210074
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
Cc: Nick Piggin <npiggin@gmail.com>, Linux-MM <linux-mm@kvack.org>,
 Kalesh Singh <kaleshsingh@google.com>, Joel Fernandes <joel@joelfernandes.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/21/21 11:43 AM, Linus Torvalds wrote:
> On Thu, May 20, 2021 at 5:03 PM Aneesh Kumar K.V
> <aneesh.kumar@linux.ibm.com> wrote:
>>
>> On 5/21/21 8:10 AM, Linus Torvalds wrote:
>>>
>>> So mremap does need to flush the TLB before releasing the page table
>>> lock, because that's the lifetime boundary for the page that got
>>> moved.
>>
>> How will we avoid that happening with
>> c49dd340180260c6239e453263a9a244da9a7c85 /
>> 2c91bd4a4e2e530582d6fd643ea7b86b27907151 . The commit improves mremap
>> performance by moving level3/level2 page table entries. When doing so we
>> are not holding level 4 ptl lock (pte_lock()). But rather we are holding
>> pmd_lock or pud_lock(). So if we move pages around without holding the
>> pte lock, won't the above issue happen even if we do a tlb flush with
>> holding pmd lock/pud lock?
> 
> Hmm. Interesting.
> 
> Your patch (to flush the TLB after clearing the old location, and
> before inserting it into the new one) looks like an "obvious" fix.
> 
> But I'm putting that "obvious" in quotes, because I'm now wondering if
> it actually fixes anything.
> 
> Lookie here:
> 
>   - CPU1 does a mremap of a pmd or pud.
> 
>      It clears the old pmd/pud, flushes the old TLB range, and then
> inserts the pmd/pud at the new location.
> 
>   - CPU2 does a page shrinker, which calls try_to_unmap, which calls
> try_to_unmap_one.
> 
> These are entirely asynchronous, because they have no shared lock. The
> mremap uses the pmd lock, the try_to_unmap_one() does the rmap walk,
> which does the pte lock.
> 
> Now, imagine that the following ordering happens with the two
> operations above, and a CPU3 that does accesses:
> 
>   - CPU2 follows (and sees) the old page tables in the old location and
> the took the pte lock
> 
>   - the mremap on CPU1 starts - cleared the old pmd, flushed the tlb,
> *and* inserts in the new place.
> 
>   - a user thread on CPU3 accesses the new location and fills the TLB
> of the *new* address
> 
>   - only now does CPU2 get to the "pte_get_and_clear()" to remove one page
> 
>   - CPU2 does a TLB flush and frees the page
> 
> End result:
> 
>   - both CPU1 _and_ CPU2 have flushed the TLB.
> 
>   - but both flushed the *OLD* address
> 
>   - the page is freed
> 
>   - CPU3 still has the stale TLB entry pointing to the page that is now
> free and might be reused for something else
> 
> Am I missing something?
> 

That is a problem. With that it looks like CONFIG_HAVE_MOVE_PMD/PUD is 
broken? I don't see an easy way to fix this?

-aneesh

