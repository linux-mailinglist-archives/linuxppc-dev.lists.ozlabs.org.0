Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 775B2242AB0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 15:55:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRWSL1mkqzDqQZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 23:55:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=WbIaItY9; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRWPL0PQszDqfF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Aug 2020 23:53:09 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07CDoDW7003112; Wed, 12 Aug 2020 09:53:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=mbKPENaagQmcQKyWye+84+hFtC0+dYiCzSCHlpzsLCs=;
 b=WbIaItY9I9FUfYAWYVCuED3T2URI0Q+nte/N+EzHcJ/WOh32n8VlkLYewXvSaUdPLU5F
 Eu2B3wWVluvwuLWAAAMJwtzZnt0YozKVnD1BJjUJAQBeYbpzEURQIn7WEb/0u0efGbY0
 BOU2EZCX/Alpcvrb83Wgv6SbRRrbT3+j0fktsr+OQo+5pwyvCwvmCjDifU4ernGSTg+e
 Dokd+NEkZ8IWd5LGIiOWSFirLuVqC5EL6XX6EBv+VvykCvHEfQ4Lgi2unlggOwO8LHeG
 ZC1IMIyx6kyXYnhMzVBHmxEEwuY9Ka5b1wPQMasqs3/bEUXgPnZYIRqjKg7/XEkJtSEi Ng== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32t93sa6ym-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Aug 2020 09:52:59 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07CDoaf0012346;
 Wed, 12 Aug 2020 13:52:55 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma05fra.de.ibm.com with ESMTP id 32skp82s77-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Aug 2020 13:52:54 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 07CDqqpa59638178
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Aug 2020 13:52:52 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A8CFF4C04A;
 Wed, 12 Aug 2020 13:52:52 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 618594C040;
 Wed, 12 Aug 2020 13:52:51 +0000 (GMT)
Received: from [9.85.71.17] (unknown [9.85.71.17])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 12 Aug 2020 13:52:51 +0000 (GMT)
Subject: Re: [PATCH 14/16] debug_vm_pgtable/hugetlb: Disable hugetlb test on
 ppc64
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200812063358.369514-1-aneesh.kumar@linux.ibm.com>
 <20200812063358.369514-14-aneesh.kumar@linux.ibm.com>
 <d067c278-6391-72f1-75c2-ccbd52909233@arm.com>
 <efc8f8c8-c16d-0826-9401-a45005ecaf62@linux.ibm.com>
 <83766a01-6ffb-798c-c5b9-46b2d672f618@arm.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <535169b9-f4f0-57ce-0c2b-30afc237d4bd@linux.ibm.com>
Date: Wed, 12 Aug 2020 19:22:50 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <83766a01-6ffb-798c-c5b9-46b2d672f618@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-12_06:2020-08-11,
 2020-08-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 mlxscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008120096
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/12/20 7:04 PM, Anshuman Khandual wrote:
> 
> 
> On 08/12/2020 06:46 PM, Aneesh Kumar K.V wrote:
>> On 8/12/20 6:33 PM, Anshuman Khandual wrote:
>>>
>>>
>>> On 08/12/2020 12:03 PM, Aneesh Kumar K.V wrote:
>>>> The seems to be missing quite a lot of details w.r.t allocating
>>>> the correct pgtable_t page (huge_pte_alloc()), holding the right
>>>> lock (huge_pte_lock()) etc. The vma used is also not a hugetlb VMA.
>>>>
>>>> ppc64 do have runtime checks within CONFIG_DEBUG_VM for most of these.
>>>> Hence disable the test on ppc64.
>>>
>>> This test is free from any platform specific #ifdefs which should
>>> never be broken. If hugetlb_advanced_tests() does not work or is
>>> not detailed enough for ppc64, then it would be great if you could
>>> suggest some improvements so that it works for all enabled platforms.
>>>
>>>
>>
>> As mentioned the test is broken. For hugetlb, the pgtable_t pages should be allocated by huge_pte_alloc(). We need to hold huget_pte_lock() before  updating huge tlb pte. That takes hugepage size, which is mostly derived out of vma. Hence vma need to be a hugetlb vma. Some of the functions also depend on hstate. Also we should use set_huge_pte_at() when setting up hugetlb pte entries. I was tempted to remove that test completely marking it broken. But avoided that by marking it broken on only PPC64.
> 
> The test is not broken, hugetlb helpers on multiple platforms dont complain about
> this at all. The tests here emulate 'enough' MM objects required for the helpers
> on enabled platforms, to perform the primary task i.e page table transformation it
> is expected to do. The test does not claim to emulate a perfect MM environment for
> a given subsystem's (like HugeTLB) arch helpers. Now in this case, the MM objects
> being emulated for the HugeTLB advanced tests does not seem to be sufficient for
> ppc64 but it can be improved. But that does not mean it is broken in it's current
> form for other platforms.
> 

There is nothing ppc64 specific here. It is just that we have 
CONFIG_DEBUG_VM based checks for different possibly wrong usages of 
these functions. This was done because we have different page sizes, two 
different translations to support and we want to avoid any wrong usage. 
IMHO expecting hugetlb page table helpers to work with a non hugetlb VMA 
and  without holding hugeTLB pte lock is a clear violation of hugetlb 
interface.

-aneesh
