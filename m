Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B57AB4B281F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 15:41:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JwGXc2XGMz3cPP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Feb 2022 01:41:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mjY/vsvS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=mjY/vsvS; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JwGWp6hC6z3bbC
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Feb 2022 01:41:10 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21BDqZKs022372; 
 Fri, 11 Feb 2022 14:41:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=JATZNJqZJS/wZvYHSnvOH8jVCuRr6CNr/sRNhLdJ4ak=;
 b=mjY/vsvSR19zgTuoGusKCtsW9TeV98X8ackJJQV/vX7MZLhcOhzXWw2lHAoVAcG2VvNl
 EV8UbvTCCGyMFR+gJjiX/Cj75rETN+6J3Mmpk7pNboSaJmABbensXPbWAt3d0n/Jkr0n
 ir/dSeqCtZzk+OmgmPW0i43oTxnw7JsCbi4AUGfBYM2J26hLE4LmRrs4Th3LE76Aug7v
 DpKjWalkZzBtfwq8sQ1uctRj2KvURIDx7o04NvEohjxRGWYFAbMn0X2lswHWQtws0l41
 09R3vOKWDi4xBdxd6AM+CjBlzOFnuHjx5Zm5Td65LCmyFwmjOq/AGqkUJtBHzAreerZa yA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e5gbvu9rc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Feb 2022 14:41:00 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21BEY503008097;
 Fri, 11 Feb 2022 14:41:00 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e5gbvu9r5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Feb 2022 14:41:00 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21BEXQml028101;
 Fri, 11 Feb 2022 14:40:59 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02dal.us.ibm.com with ESMTP id 3e3gq1wqd8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Feb 2022 14:40:59 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21BEew3s27918688
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Feb 2022 14:40:58 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E08DCB2068;
 Fri, 11 Feb 2022 14:40:57 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 131A5B2064;
 Fri, 11 Feb 2022 14:40:55 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.43.15.152])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 11 Feb 2022 14:40:54 +0000 (GMT)
X-Mailer: emacs 29.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au, Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2] powerpc/mm: Update default hugetlb size early
In-Reply-To: <87tud5a8x5.fsf@linux.ibm.com>
References: <20220211065215.101767-1-aneesh.kumar@linux.ibm.com>
 <831ee5f6-8605-02d2-b7e5-543aec4857c3@redhat.com>
 <05d6615a-50c7-1b23-1bab-0e0b64dd4e81@linux.ibm.com>
 <b77816ef-80fd-40b7-cf6e-6de2a3125eb1@redhat.com>
 <87tud5a8x5.fsf@linux.ibm.com>
Date: Fri, 11 Feb 2022 20:10:51 +0530
Message-ID: <87r189a2ks.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _gui-2i-9z0ym3Kf6yOaLq8ZIkvW11ka
X-Proofpoint-GUID: uhvW8ZloxLwm2bz_0p9lHB6N-kQBwEC_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-11_04,2022-02-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202110080
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

Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com> writes:

> David Hildenbrand <david@redhat.com> writes:
>
>> On 11.02.22 10:16, Aneesh Kumar K V wrote:
>>> On 2/11/22 14:00, David Hildenbrand wrote:
>>>> On 11.02.22 07:52, Aneesh Kumar K.V wrote:
>>>>> commit: d9c234005227 ("Do not depend on MAX_ORDER when grouping pages by mobility")
....
....

> I could build a kernel with FORCE_MAX_ZONEORDER=8 and pageblock_order =
> 8. We need to disable THP for such a kernel to boot, because THP do
> check for PMD_ORDER < MAX_ORDER. I was able to boot that kernel on a
> virtualized platform, but then gigantic_page_runtime_supported is not
> supported on such config with hash translation.
>
> On non virtualized platform I am hitting crashes like below during boot.
>
> [   47.637865][   C42] =============================================================================                                                                                                                                                                                                              
> [   47.637907][   C42] BUG pgtable-2^11 (Not tainted): Object already free                                                                                     
> [   47.637925][   C42] -----------------------------------------------------------------------------                                                           
> [   47.637925][   C42]                                                                                                                                         
> [   47.637945][   C42] Allocated in __pud_alloc+0x84/0x2a0 age=278 cpu=40 pid=1409                                                                             
> [   47.637974][   C42]  __slab_alloc.isra.0+0x40/0x60                                                                                                          
> [   47.637995][   C42]  kmem_cache_alloc+0x1a8/0x510                                                                                                           
> [   47.638010][   C42]  __pud_alloc+0x84/0x2a0                                                                                                                 
> [   47.638024][   C42]  copy_page_range+0x38c/0x1b90                                                                                                           
> [   47.638040][   C42]  dup_mm+0x548/0x880                                                                                                                     
> [   47.638058][   C42]  copy_process+0xdc0/0x1e90                                                                                                              
> [   47.638076][   C42]  kernel_clone+0xd4/0x9d0                                                                                                                
> [   47.638094][   C42]  __do_sys_clone+0x88/0xe0                                                                                                               
> [   47.638112][   C42]  system_call_exception+0x368/0x3a0                                                                                                      
> [   47.638128][   C42]  system_call_common+0xec/0x250                                                                                                          
> [   47.638147][   C42] Freed in __tlb_remove_table+0x1d4/0x200 age=263 cpu=57 pid=326                                                                          
> [   47.638172][   C42]  kmem_cache_free+0x44c/0x680                                                                                                            
> [   47.638187][   C42]  __tlb_remove_table+0x1d4/0x200                                                                                                         
> [   47.638204][   C42]  tlb_remove_table_rcu+0x54/0xa0                                                                                                         
> [   47.638222][   C42]  rcu_core+0xdd4/0x15d0                                                                                                                  
> [   47.638239][   C42]  __do_softirq+0x360/0x69c                                                                                                               
> [   47.638257][   C42]  run_ksoftirqd+0x54/0xc0                                                                                                                
> [   47.638273][   C42]  smpboot_thread_fn+0x28c/0x2f0                                                                                                          
> [   47.638290][   C42]  kthread+0x1a4/0x1b0                                                                                                                    
> [   47.638305][   C42]  ret_from_kernel_thread+0x5c/0x64                                                                                                       
> [   47.638320][   C42] Slab 0xc00c00000000d600 objects=10 used=9 fp=0xc0000000035a8000 flags=0x7ffff000010201(locked|slab|head|node=0|zone=0|lastcpupid=0x7ffff)                                                                                                                                                              
> [   47.638352][   C42] Object 0xc0000000035a8000 @offset=163840 fp=0x0000000000000000                                                                          
> [   47.638352][   C42]                                                                                                                                         
> [   47.638373][   C42] Redzone  c0000000035a4000: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................                                            
> [   47.638394][   C42] Redzone  c0000000035a4010: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................                                            
> [   47.638414][   C42] Redzone  c0000000035a4020: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................                                            
> [   47.638435][   C42] Redzone  c0000000035a4030: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................                                            
> [   47.638455][   C42] Redzone  c0000000035a4040: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................                                            
> [   47.638474][   C42] Redzone  c0000000035a4050: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................                                            
> [   47.638494][   C42] Redzone  c0000000035a4060: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................                                            
> [   47.638514][   C42] Redzone  c0000000035a4070: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................                                            
> [   47.638534][   C42] Redzone  c0000000035a4080: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................                                            

Ok that turned out to be unrelated. I was using a wrong kernel. I can
boot kernel with pageblock_order > MAX_ORDER and run hugetlb related
test fine. I do get the below warning which you had already called out
in your patch.

[    3.952124] WARNING: CPU: 16 PID: 719 at mm/vmstat.c:1103 __fragmentation_index+0x14/0x70                                                                   
[    3.952136] Modules linked in:                                                                                                                              
[    3.952141] CPU: 16 PID: 719 Comm: kswapd0 Tainted: G    B             5.17.0-rc3-00044-g69052ffa0e08 #68                                                   
[    3.952149] NIP:  c000000000465264 LR: c000000000468544 CTR: 0000000000000000                                                                               
[    3.952154] REGS: c000000014a4f7e0 TRAP: 0700   Tainted: G    B              (5.17.0-rc3-00044-g69052ffa0e08)
[    3.952161] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 44042422  XER: 20000000
[    3.952174] CFAR: c000000000468540 IRQMASK: 0                  
               GPR00: c000000000468544 c000000014a4fa80 c000000001ea9500 0000000000000008 
               GPR04: c000000014a4faa0 00000000001fd700 0000000000004003 00000000001fd92d 
               GPR08: c000001fffd1c7a0 0000000000000008 0000000000000008 0000000000000000 
               GPR12: 0000000000002200 c000001fffff2880 0000000000000000 c000000013cfd240                                                                      
               GPR16: c000000011940600 c000001fffd21058 0000000000000d00 c000000001407d30                                                                      
               GPR20: ffffffffffffffaf c000001fffd21098 0000000000000000 c000000002ab7328                                                                      
               GPR24: c000000011940600 c000001fffd21300 0000000000000000 0000000000000008 
               GPR28: c000001fffd1c280 0000000000000008 0000000000000000 0000000000000004                                                                      
[    3.952231] NIP [c000000000465264] __fragmentation_index+0x14/0x70                                                                                          
[    3.952237] LR [c000000000468544] fragmentation_index+0xb4/0xe0                                                                                             
[    3.952244] Call Trace:                                        
[    3.952247] [c000000014a4fa80] [c00000000023e248] lock_release+0x138/0x470 (unreliable)
[    3.952256] [c000000014a4fac0] [c00000000047cd84] compaction_suitable+0x94/0x270
[    3.952263] [c000000014a4fb10] [c0000000004802b8] wakeup_kcompactd+0xc8/0x2a0
[    3.952270] [c000000014a4fb60] [c000000000457568] balance_pgdat+0x798/0x8d0
[    3.952277] [c000000014a4fca0] [c000000000457d14] kswapd+0x674/0x7b0                                                                                        
[    3.952283] [c000000014a4fdc0] [c0000000001d7e84] kthread+0x144/0x150                                                                                       
[    3.952290] [c000000014a4fe10] [c00000000000cd74] ret_from_kernel_thread+0x5c/0x64
[    3.952297] Instruction dump:                                      
[    3.952301] 7d2021ad 40c2fff4 e8ed0030 38a00000 7caa39ae 4e800020 60000000 7c0802a6 
[    3.952311] 60000000 28030007 7c6a1b78 40810010 <0fe00000> 60000000 60000000 e9040008 
[    3.952322] irq event stamp: 0                                        
[    3.952325] hardirqs last  enabled at (0): [<0000000000000000>] 0x0                                                                                         
[    3.952331] hardirqs last disabled at (0): [<c000000000196030>] copy_process+0x970/0x1de0                                                                   
[    3.952339] softirqs last  enabled at (0): [<c000000000196030>] copy_process+0x970/0x1de0                                                                   
[    3.952345] softirqs last disabled at (0): [<0000000000000000>] 0x0                                                                                         

I am not sure whether there is any value in selecting MAX_ORDER = 8 on
ppc64. If not we could do a patch as below for ppc64.

commit 09ed79c4fda92418914546f36c2750670503d7a0
Author: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Date:   Fri Feb 11 17:15:10 2022 +0530

    powerpc/mm: Disable MAX_ORDER value 8 on book3s64 with 64K pagesize
    
    With transparent hugepage support we expect HPAGE_PMD_ORDER < MAX_ORDER.
    Without this we BUG() during boot as below
    
    cpu 0x6: Vector: 700 (Program Check) at [c000000012143880]
        pc: c000000001b4ddbc: hugepage_init+0x108/0x2c4
        lr: c000000001b4dd98: hugepage_init+0xe4/0x2c4
        sp: c000000012143b20
       msr: 8000000002029033
      current = 0xc0000000120d0f80
      paca    = 0xc00000001ec7e900   irqmask: 0x03   irq_happened: 0x01
        pid   = 1, comm = swapper/0
    kernel BUG at mm/huge_memory.c:413!
    [c000000012143b20] c0000000022c0468 blacklisted_initcalls+0x120/0x1c8 (unreliable)
    [c000000012143bb0] c000000000012104 do_one_initcall+0x94/0x520
    [c000000012143c90] c000000001b04da0 kernel_init_freeable+0x444/0x508
    [c000000012143da0] c000000000012d8c kernel_init+0x44/0x188
    [c000000012143e10] c00000000000cbf4 ret_from_kernel_thread+0x5c/0x64
    
    Hence a FORCE_MAX_ZONEORDER of value < 9 doesn't make sense with THP
    enabled. We also cannot have value > 9 because we are limitted by
    SECTION_SIZE_BITS
    
     #if (MAX_ORDER - 1 + PAGE_SHIFT) > SECTION_SIZE_BITS
     #error Allocator MAX_ORDER exceeds SECTION_SIZE
     #endif
    
    We can select MAX_ORDER value 8 by disabling THP support but then that
    results in pageblock_order > MAX_ORDER - 1 which is not fully tested/supported.
    
    Cc: David Hildenbrand <david@redhat.com>
    Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index b779603978e1..a050f5f46df3 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -807,7 +807,7 @@ config DATA_SHIFT
 
 config FORCE_MAX_ZONEORDER
 	int "Maximum zone order"
-	range 8 9 if PPC64 && PPC_64K_PAGES
+	range 9 9 if PPC64 && PPC_64K_PAGES
 	default "9" if PPC64 && PPC_64K_PAGES
 	range 13 13 if PPC64 && !PPC_64K_PAGES
 	default "13" if PPC64 && !PPC_64K_PAGES

