Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAEF74B2596
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 13:24:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JwCVV29MLz3cGn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 23:24:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KIq6oZEW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KIq6oZEW; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JwCTh56PRz3bT5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Feb 2022 23:24:07 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21BBWqss026000; 
 Fri, 11 Feb 2022 12:23:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=e15drUPImx/yyrX5sRUQgHZG1S7WgHBKASPfUMKW7MU=;
 b=KIq6oZEW0+S39ar9Frr8zVvUGIOotEXCvGm+bOq4VrxFB5/xkMPDpEpsUunk+oisVJ0l
 uEBAYOcmeSuE6dIQSLh7ZLthbV4ZRVLk6iGfZ95BzBTk61XJFUwGP5pGk1b8qcMpWaEb
 8TrRPetiPykqk6MaYyKa8uvjq/wG6vhB5cqzANJBmAE2zsMRNuji7qraDiKOky0jNvYz
 +G7r9Gl8r7i5ZrBP0ttPdPZaMzhFz4HD6xfnqEeormEfH+xbblpdK+Xi1ONbZvSlVdPD
 W4haHIh90rT0Hg56ZokH0bH6gKHS0BCTdWsIFduUHo//Sj9Ayc7OIL76qxespyXkFz8F VQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e5gbvre64-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Feb 2022 12:23:59 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21BCIBXU012099;
 Fri, 11 Feb 2022 12:23:58 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e5gbvre5q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Feb 2022 12:23:58 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21BCHsrF028724;
 Fri, 11 Feb 2022 12:23:58 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03wdc.us.ibm.com with ESMTP id 3e1gvcw8sy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Feb 2022 12:23:57 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21BCNuUF27591060
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Feb 2022 12:23:56 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF9F2B2075;
 Fri, 11 Feb 2022 12:23:56 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 04004B2068;
 Fri, 11 Feb 2022 12:23:53 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.43.112.9])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 11 Feb 2022 12:23:53 +0000 (GMT)
X-Mailer: emacs 29.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au, Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2] powerpc/mm: Update default hugetlb size early
In-Reply-To: <b77816ef-80fd-40b7-cf6e-6de2a3125eb1@redhat.com>
References: <20220211065215.101767-1-aneesh.kumar@linux.ibm.com>
 <831ee5f6-8605-02d2-b7e5-543aec4857c3@redhat.com>
 <05d6615a-50c7-1b23-1bab-0e0b64dd4e81@linux.ibm.com>
 <b77816ef-80fd-40b7-cf6e-6de2a3125eb1@redhat.com>
Date: Fri, 11 Feb 2022 17:53:50 +0530
Message-ID: <87tud5a8x5.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QBCEAJdJkIfIKSNgKANnVnBc1Hk1ksMc
X-Proofpoint-GUID: AEyk6aiaT1kf7L6xyrzjwk6LsA7jg11l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-11_04,2022-02-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 phishscore=0 impostorscore=0 clxscore=1011 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202110069
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
Cc: linux-mm@kvack.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

David Hildenbrand <david@redhat.com> writes:

> On 11.02.22 10:16, Aneesh Kumar K V wrote:
>> On 2/11/22 14:00, David Hildenbrand wrote:
>>> On 11.02.22 07:52, Aneesh Kumar K.V wrote:
>>>> commit: d9c234005227 ("Do not depend on MAX_ORDER when grouping pages by mobility")
>>>> introduced pageblock_order which will be used to group pages better.
>>>> The kernel now groups pages based on the value of HPAGE_SHIFT. Hence HPAGE_SHIFT
>>>> should be set before we call set_pageblock_order.
>>>>
>>>> set_pageblock_order happens early in the boot and default hugetlb page size
>>>> should be initialized before that to compute the right pageblock_order value.
>>>>
>>>> Currently, default hugetlbe page size is set via arch_initcalls which happens
>>>> late in the boot as shown via the below callstack:
>>>>
>>>> [c000000007383b10] [c000000001289328] hugetlbpage_init+0x2b8/0x2f8
>>>> [c000000007383bc0] [c0000000012749e4] do_one_initcall+0x14c/0x320
>>>> [c000000007383c90] [c00000000127505c] kernel_init_freeable+0x410/0x4e8
>>>> [c000000007383da0] [c000000000012664] kernel_init+0x30/0x15c
>>>> [c000000007383e10] [c00000000000cf14] ret_from_kernel_thread+0x5c/0x64
>>>>
>>>> and the pageblock_order initialization is done early during the boot.
>>>>
>>>> [c0000000018bfc80] [c0000000012ae120] set_pageblock_order+0x50/0x64
>>>> [c0000000018bfca0] [c0000000012b3d94] sparse_init+0x188/0x268
>>>> [c0000000018bfd60] [c000000001288bfc] initmem_init+0x28c/0x328
>>>> [c0000000018bfe50] [c00000000127b370] setup_arch+0x410/0x480
>>>> [c0000000018bfed0] [c00000000127401c] start_kernel+0xb8/0x934
>>>> [c0000000018bff90] [c00000000000d984] start_here_common+0x1c/0x98
>>>>
>>>> delaying default hugetlb page size initialization implies the kernel will
>>>> initialize pageblock_order to (MAX_ORDER - 1) which is not an optimal
>>>> value for mobility grouping. IIUC we always had this issue. But it was not
>>>> a problem for hash translation mode because (MAX_ORDER - 1) is the same as
>>>> HUGETLB_PAGE_ORDER (8) in the case of hash (16MB). With radix,
>>>> HUGETLB_PAGE_ORDER will be 5 (2M size) and hence pageblock_order should be
>>>> 5 instead of 8.
>>>
>>>
>>> A related question: Can we on ppc still have pageblock_order > MAX_ORDER
>>> - 1? We have some code for that and I am not so sure if we really need that.
>>>
>> 
>> I also have been wondering about the same. On book3s64 I don't think we 
>> need that support for both 64K and 4K page size because with hash 
>> hugetlb size is MAX_ORDER -1. (16MB hugepage size)
>> 
>> I am not sure about the 256K page support. Christophe may be able to 
>> answer that.
>> 
>> For the gigantic hugepage support we depend on cma based allocation or
>> firmware reservation. So I am not sure why we ever considered pageblock 
>>  > MAX_ORDER -1 scenario. If you have pointers w.r.t why that was ever 
>> needed, I could double-check whether ppc64 is still dependent on that.
>
> commit dc78327c0ea7da5186d8cbc1647bd6088c5c9fa5
> Author: Michal Nazarewicz <mina86@mina86.com>
> Date:   Wed Jul 2 15:22:35 2014 -0700
>
>     mm: page_alloc: fix CMA area initialisation when pageblock > MAX_ORDER
>
> indicates that at least arm64 used to have cases for that as well.
>
> However, nowadays with ARM64_64K_PAGES we have FORCE_MAX_ZONEORDER=14 as
> default, corresponding to 512MiB.
>
> So I'm not sure if this is something worth supporting. If you want
> somewhat reliable gigantic pages, use CMA or preallocate them during boot.
>
> -- 
> Thanks,
>
> David / dhildenb

I could build a kernel with FORCE_MAX_ZONEORDER=8 and pageblock_order =
8. We need to disable THP for such a kernel to boot, because THP do
check for PMD_ORDER < MAX_ORDER. I was able to boot that kernel on a
virtualized platform, but then gigantic_page_runtime_supported is not
supported on such config with hash translation.

On non virtualized platform I am hitting crashes like below during boot.

[   47.637865][   C42] =============================================================================                                                                                                                                                                                                              
[   47.637907][   C42] BUG pgtable-2^11 (Not tainted): Object already free                                                                                     
[   47.637925][   C42] -----------------------------------------------------------------------------                                                           
[   47.637925][   C42]                                                                                                                                         
[   47.637945][   C42] Allocated in __pud_alloc+0x84/0x2a0 age=278 cpu=40 pid=1409                                                                             
[   47.637974][   C42]  __slab_alloc.isra.0+0x40/0x60                                                                                                          
[   47.637995][   C42]  kmem_cache_alloc+0x1a8/0x510                                                                                                           
[   47.638010][   C42]  __pud_alloc+0x84/0x2a0                                                                                                                 
[   47.638024][   C42]  copy_page_range+0x38c/0x1b90                                                                                                           
[   47.638040][   C42]  dup_mm+0x548/0x880                                                                                                                     
[   47.638058][   C42]  copy_process+0xdc0/0x1e90                                                                                                              
[   47.638076][   C42]  kernel_clone+0xd4/0x9d0                                                                                                                
[   47.638094][   C42]  __do_sys_clone+0x88/0xe0                                                                                                               
[   47.638112][   C42]  system_call_exception+0x368/0x3a0                                                                                                      
[   47.638128][   C42]  system_call_common+0xec/0x250                                                                                                          
[   47.638147][   C42] Freed in __tlb_remove_table+0x1d4/0x200 age=263 cpu=57 pid=326                                                                          
[   47.638172][   C42]  kmem_cache_free+0x44c/0x680                                                                                                            
[   47.638187][   C42]  __tlb_remove_table+0x1d4/0x200                                                                                                         
[   47.638204][   C42]  tlb_remove_table_rcu+0x54/0xa0                                                                                                         
[   47.638222][   C42]  rcu_core+0xdd4/0x15d0                                                                                                                  
[   47.638239][   C42]  __do_softirq+0x360/0x69c                                                                                                               
[   47.638257][   C42]  run_ksoftirqd+0x54/0xc0                                                                                                                
[   47.638273][   C42]  smpboot_thread_fn+0x28c/0x2f0                                                                                                          
[   47.638290][   C42]  kthread+0x1a4/0x1b0                                                                                                                    
[   47.638305][   C42]  ret_from_kernel_thread+0x5c/0x64                                                                                                       
[   47.638320][   C42] Slab 0xc00c00000000d600 objects=10 used=9 fp=0xc0000000035a8000 flags=0x7ffff000010201(locked|slab|head|node=0|zone=0|lastcpupid=0x7ffff)                                                                                                                                                              
[   47.638352][   C42] Object 0xc0000000035a8000 @offset=163840 fp=0x0000000000000000                                                                          
[   47.638352][   C42]                                                                                                                                         
[   47.638373][   C42] Redzone  c0000000035a4000: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................                                            
[   47.638394][   C42] Redzone  c0000000035a4010: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................                                            
[   47.638414][   C42] Redzone  c0000000035a4020: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................                                            
[   47.638435][   C42] Redzone  c0000000035a4030: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................                                            
[   47.638455][   C42] Redzone  c0000000035a4040: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................                                            
[   47.638474][   C42] Redzone  c0000000035a4050: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................                                            
[   47.638494][   C42] Redzone  c0000000035a4060: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................                                            
[   47.638514][   C42] Redzone  c0000000035a4070: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................                                            
[   47.638534][   C42] Redzone  c0000000035a4080: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................                                            
