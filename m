Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 792F8B21E3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2019 16:25:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46VHwt2QWWzF40r
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Sep 2019 00:25:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46VHrm1Q0xzF5gn
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2019 00:21:59 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8DELZe0090323; Fri, 13 Sep 2019 10:21:54 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v0ct7g03v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Sep 2019 10:21:54 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8DEE8tP019313;
 Fri, 13 Sep 2019 14:21:53 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01dal.us.ibm.com with ESMTP id 2uyw58qmpt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Sep 2019 14:21:53 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8DELqRd45810154
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Sep 2019 14:21:52 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F180E136051;
 Fri, 13 Sep 2019 14:21:51 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 388E413604F;
 Fri, 13 Sep 2019 14:21:50 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.199.44.61])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 13 Sep 2019 14:21:49 +0000 (GMT)
X-Mailer: emacs 26.2 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>, cam@neo-zeon.de
Subject: Re: [Bug 204789] New: Boot failure with more than 256G of memory
In-Reply-To: <875zlw7q5s.fsf@linux.ibm.com>
References: <bug-204789-27@https.bugzilla.kernel.org/>
 <20190911073153.9df4d4618d7f99752cd18edd@linux-foundation.org>
 <875zlw7q5s.fsf@linux.ibm.com>
Date: Fri, 13 Sep 2019 19:51:47 +0530
Message-ID: <87zhj85lac.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-13_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909130142
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
Cc: bugzilla-daemon@bugzilla.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com> writes:

> Andrew Morton <akpm@linux-foundation.org> writes:
>
>> (switched to email.  Please respond via emailed reply-to-all, not via the
>> bugzilla web interface).
>>
>> On Sun, 08 Sep 2019 00:04:26 +0000 bugzilla-daemon@bugzilla.kernel.org wrote:
>>
>>> https://bugzilla.kernel.org/show_bug.cgi?id=204789
>>> 
>>>             Bug ID: 204789
>>>            Summary: Boot failure with more than 256G of memory
>>>            Product: Memory Management
>>>            Version: 2.5
>>>     Kernel Version: 5.2.x
>>>           Hardware: PPC-64
>>>                 OS: Linux
>>>               Tree: Mainline
>>>             Status: NEW
>>>           Severity: high
>>>           Priority: P1
>>>          Component: Other
>>>           Assignee: akpm@linux-foundation.org
>>>           Reporter: cam@neo-zeon.de
>>>         Regression: No
>>
>> "Yes" :)
>>
>>> Kernel series 5.2.x will not boot on my Talos II workstation with dual POWER9
>>> 18 core processors and 512G of physical memory with disable_radix=yes and 4k
>>> pages.
>>> 
>>> 5.3-rc6 did not work either.
>>> 
>>> 5.1 and earlier boot fine. 
>>
>> Thanks.  It's probably best to report this on the powerpc list, cc'ed here.
>>
>>> I can get the system to boot IF I leave the Radix MMU enabled or if I boot a
>>> kernel with 64k pages. I haven't yet tested enabling the Radix MMU with 64k
>>> pages at the same time, but I suspect this would work. This is a system I
>>> cannot take down TOO frequently.
>>> 
>>> The system will also boot with the Radix MMU disabled and 4k pages with 256G or
>>> less memory. Setting mem on the kernel CLI to 256G or less results in a
>>> successful boot. Setting mem=257G or higher no Radix MMU and 4k pages and the
>>> kernel will not boot.
>>> 
>>> Petitboot comes up, but the system fails VERY early in boot in the serial
>>> console with:
>>> SIGTERM received, booting...
>>> [   23.838858] kexec_core: Starting new kernel
>>> 
>>> Early printk is enabled, and it never progresses any further.
>>> 
>>> 5.1 boots just fine with the Radix MMU disabled and 4k pages.
>>> 
>>> Unfortunately, I currently need 4k pages for bcache to work, and Radix MMU
>>> disabled in order for FreeBSD 12.x to work under KVM so I'm sticking with
>>> 5.1.21 for now.
>>> 
>>> I have been unable to reproduce this issue in KVM.
>>> 
>>> Here are my PCIe peripherals:
>>> 1. Microsemi/Adaptec HBA 1100-4i SAS controller
>>> 2. Megaraid 9316-16i SAS RAID controller.
>>> 
>>> I've only tried little endian as this is a little endian install.
>
> Will you be able to bisect this? I tried 4K PAGESIZE on P8 with upstream
> kernel and I can't recreate the issuue.
>
> [root@ltc ~]# free -g
>               total        used        free      shared  buff/cache   available
> Mem:            495           0         494           0           0         493
> Swap:             0           0           0
> [root@ltc ~]# getconf PAGESIZE
> 4096
> [root@ltc ~]# grep Hash /proc/cpuinfo 
> MMU             : Hash
>
> I will see if I can get a P9 system with largemem
>

I was able to recreate this on a system that got memory above 16TB
address. I guess your P9 system memory layout is also like that.

Can you try this patch? It doesn't really fix the isssue, as in map the
full 512GB of memory. But it do prevent the kernel crash.

commit ebd05100344765fc3c030f0c257c2f9236fcd1ec
Author: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Date:   Fri Sep 13 19:26:25 2019 +0530

    powerpc/book3s64/hash/4k: 4k supports only 16TB linear mapping
    
    With commit: 0034d395f89d ("powerpc/mm/hash64: Map all the kernel regions in the
    same 0xc range"), we now split the 64TB address range into 4 contexts each of
    16TB. That implies we can do only 16TB linear mapping. Make sure we don't
    add physical memory above 16TB if that is present in the system.
    
    Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
index bb3deb76c951..86cce8189240 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu.h
@@ -35,12 +35,16 @@ extern struct mmu_psize_def mmu_psize_defs[MMU_PAGE_COUNT];
  * memory requirements with large number of sections.
  * 51 bits is the max physical real address on POWER9
  */
-#if defined(CONFIG_SPARSEMEM_VMEMMAP) && defined(CONFIG_SPARSEMEM_EXTREME) &&  \
-	defined(CONFIG_PPC_64K_PAGES)
+
+#if defined(CONFIG_PPC_64K_PAGES)
+#if defined(CONFIG_SPARSEMEM_VMEMMAP) && defined(CONFIG_SPARSEMEM_EXTREME)
 #define MAX_PHYSMEM_BITS 51
 #else
 #define MAX_PHYSMEM_BITS 46
 #endif
+#else /* CONFIG_PPC_64K_PAGES */
+#define MAX_PHYSMEM_BITS 44
+#endif
 
 /* 64-bit classic hash table MMU */
 #include <asm/book3s/64/mmu-hash.h>

