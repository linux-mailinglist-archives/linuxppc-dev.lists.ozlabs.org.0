Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FCD0262DFD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 13:39:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bmg5q4WxRzDqP4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 21:39:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=gerald.schaefer@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=QMXqKyg/; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bmg3J0W1szDqN7
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 21:36:59 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 089BYhc1038006; Wed, 9 Sep 2020 07:36:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=c4L6ZNRPoTjg1qXq4VZtlkTdO4J9xRNAVquREtElwzg=;
 b=QMXqKyg/CNoYygrl6s+3C9LqjqJMysrKjcIf1rQLqQEDsMFiTwevOEmew7wSGUtLHAkB
 z+dMktzKoqnUi127L2nwREGBQ5dT/uiJ3nUDxsB0v9qnBQN7U3ynf6cHHPbmU3xwWbbW
 YQ7Iv98ZoZmoTm49pRGidUoOonhO5v2rQoorn97UEnKP8NiW2Vse7H/oAUwRE9pUGTyN
 SYWsJm+kYKiQvjLe6eZ+uMP8/Z4BNmX8EsdxHNYbhSkg4UnYz2hA/lQ25/5vO4/19Dbu
 /f+o8dTJXo14pjGMRc8nw2fkK7+ifBuZ0c6ymZ3GlfFYD4b26q0TeOE27pAJsrdTl1et 3A== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33ex5nr7bg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Sep 2020 07:36:45 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 089BW1fV004084;
 Wed, 9 Sep 2020 11:36:29 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06fra.de.ibm.com with ESMTP id 33e5gmrq5q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Sep 2020 11:36:29 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 089BaQBa27394440
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Sep 2020 11:36:26 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 27DD5A4060;
 Wed,  9 Sep 2020 11:36:26 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A0498A4067;
 Wed,  9 Sep 2020 11:36:25 +0000 (GMT)
Received: from thinkpad (unknown [9.171.79.102])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  9 Sep 2020 11:36:25 +0000 (GMT)
Date: Wed, 9 Sep 2020 13:36:24 +0200
From: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v4 00/13] mm/debug_vm_pgtable fixes
Message-ID: <20200909133624.2773816f@thinkpad>
In-Reply-To: <d4199cd4-e042-7a05-8a78-703eae958589@arm.com>
References: <20200902114222.181353-1-aneesh.kumar@linux.ibm.com>
 <bb0f3427-e2bd-f713-3ea8-d264be0e690b@arm.com>
 <20200904172647.002113d3@thinkpad>
 <d4199cd4-e042-7a05-8a78-703eae958589@arm.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-09_06:2020-09-09,
 2020-09-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009090103
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 Vineet Gupta <vgupta@synopsys.com>, akpm@linux-foundation.org,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 linuxppc-dev@lists.ozlabs.org, linux-riscv <linux-riscv@lists.infradead.org>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 9 Sep 2020 13:38:25 +0530
Anshuman Khandual <anshuman.khandual@arm.com> wrote:

> 
> 
> On 09/04/2020 08:56 PM, Gerald Schaefer wrote:
> > On Fri, 4 Sep 2020 12:18:05 +0530
> > Anshuman Khandual <anshuman.khandual@arm.com> wrote:
> > 
> >>
> >>
> >> On 09/02/2020 05:12 PM, Aneesh Kumar K.V wrote:
> >>> This patch series includes fixes for debug_vm_pgtable test code so that
> >>> they follow page table updates rules correctly. The first two patches introduce
> >>> changes w.r.t ppc64. The patches are included in this series for completeness. We can
> >>> merge them via ppc64 tree if required.
> >>>
> >>> Hugetlb test is disabled on ppc64 because that needs larger change to satisfy
> >>> page table update rules.
> >>>
> >>> These tests are broken w.r.t page table update rules and results in kernel
> >>> crash as below. 
> >>>
> >>> [   21.083519] kernel BUG at arch/powerpc/mm/pgtable.c:304!
> >>> cpu 0x0: Vector: 700 (Program Check) at [c000000c6d1e76c0]
> >>>     pc: c00000000009a5ec: assert_pte_locked+0x14c/0x380
> >>>     lr: c0000000005eeeec: pte_update+0x11c/0x190
> >>>     sp: c000000c6d1e7950
> >>>    msr: 8000000002029033
> >>>   current = 0xc000000c6d172c80
> >>>   paca    = 0xc000000003ba0000   irqmask: 0x03   irq_happened: 0x01
> >>>     pid   = 1, comm = swapper/0
> >>> kernel BUG at arch/powerpc/mm/pgtable.c:304!
> >>> [link register   ] c0000000005eeeec pte_update+0x11c/0x190
> >>> [c000000c6d1e7950] 0000000000000001 (unreliable)
> >>> [c000000c6d1e79b0] c0000000005eee14 pte_update+0x44/0x190
> >>> [c000000c6d1e7a10] c000000001a2ca9c pte_advanced_tests+0x160/0x3d8
> >>> [c000000c6d1e7ab0] c000000001a2d4fc debug_vm_pgtable+0x7e8/0x1338
> >>> [c000000c6d1e7ba0] c0000000000116ec do_one_initcall+0xac/0x5f0
> >>> [c000000c6d1e7c80] c0000000019e4fac kernel_init_freeable+0x4dc/0x5a4
> >>> [c000000c6d1e7db0] c000000000012474 kernel_init+0x24/0x160
> >>> [c000000c6d1e7e20] c00000000000cbd0 ret_from_kernel_thread+0x5c/0x6c
> >>>
> >>> With DEBUG_VM disabled
> >>>
> >>> [   20.530152] BUG: Kernel NULL pointer dereference on read at 0x00000000
> >>> [   20.530183] Faulting instruction address: 0xc0000000000df330
> >>> cpu 0x33: Vector: 380 (Data SLB Access) at [c000000c6d19f700]
> >>>     pc: c0000000000df330: memset+0x68/0x104
> >>>     lr: c00000000009f6d8: hash__pmdp_huge_get_and_clear+0xe8/0x1b0
> >>>     sp: c000000c6d19f990
> >>>    msr: 8000000002009033
> >>>    dar: 0
> >>>   current = 0xc000000c6d177480
> >>>   paca    = 0xc00000001ec4f400   irqmask: 0x03   irq_happened: 0x01
> >>>     pid   = 1, comm = swapper/0
> >>> [link register   ] c00000000009f6d8 hash__pmdp_huge_get_and_clear+0xe8/0x1b0
> >>> [c000000c6d19f990] c00000000009f748 hash__pmdp_huge_get_and_clear+0x158/0x1b0 (unreliable)
> >>> [c000000c6d19fa10] c0000000019ebf30 pmd_advanced_tests+0x1f0/0x378
> >>> [c000000c6d19fab0] c0000000019ed088 debug_vm_pgtable+0x79c/0x1244
> >>> [c000000c6d19fba0] c0000000000116ec do_one_initcall+0xac/0x5f0
> >>> [c000000c6d19fc80] c0000000019a4fac kernel_init_freeable+0x4dc/0x5a4
> >>> [c000000c6d19fdb0] c000000000012474 kernel_init+0x24/0x160
> >>> [c000000c6d19fe20] c00000000000cbd0 ret_from_kernel_thread+0x5c/0x6c
> >>>
> >>> Changes from v3:
> >>> * Address review feedback
> >>> * Move page table depost and withdraw patch after adding pmdlock to avoid bisect failure.
> >>
> >> This version
> >>
> >> - Builds on x86, arm64, s390, arc, powerpc and riscv (defconfig with DEBUG_VM_PGTABLE)
> >> - Runs on arm64 and x86 without any regression, atleast nothing that I have noticed
> >> - Will be great if this could get tested on s390, arc, riscv, ppc32 platforms as well
> > 
> > When I quickly tested v3, it worked fine, but now it turned out to
> > only work fine "sometimes", both v3 and v4. I need to look into it
> > further, but so far it seems related to the hugetlb_advanced_tests().
> > 
> > I guess there was already some discussion on this test, but we did
> > not receive all of the thread(s). Please always add at least
> > linux-s390@vger.kernel.org and maybe myself and Vasily Gorbik <gor@linux.ibm.com>
> > for further discussions.
> 
> IIRC, the V3 series previously had all these addresses copied properly
> but this version once again missed copying all required addresses.

I also had issues with the de.ibm.com address, which might also have
made some mails disappear, and others might simply have been overlooked
be me. Don't bother, my bad.

> 
> > 
> > That being said, sorry for duplications, this might already have been
> > discussed. Preliminary analysis showed that it only seems to go wrong
> > for certain random vaddr values. I cannot make any sense of that yet,
> > but what seems strange to me is that the hugetlb_advanced_tests()
> > take a (real) pte_t pointer as input, and also use that for all
> > kinds of operations (set_huge_pte_at, huge_ptep_get_and_clear, etc.).
> > 
> > Although all the hugetlb code in the kernel is (mis)using pte_t
> > pointers instead of the correct pmd/pud_t pointers like THP, that
> > is just for historic reasons. The pointers will actually never point
> > to a real pte_t (i.e. page table entry), but of course to a pmd
> > or pud entry, depending on hugepage size.
> 
> HugeTLB logically operates on a PTE entry irrespective of it's real
> page table level position. Nonetheless, IIUC, vaddr here should have
> been aligned to real page table level in which the entry is being
> mapped currently.

That goes back to the time where only x86 had hugepages, and they
have the same layout for pte/pmd/etc entries, so it simply didn't
matter that the code (mis)used pte pointers / entries. But even for
x86, the hugetlb pte pointers would never have pointed to real ptes,
but pmds instead. That's why I call it misuse.

s390 is very sensitive to page table level, and we can also determine
the level from the entry value, which is used for some primitives.
Others have implicit assumptions and calculations, which go wrong
if a wrong level is passed in, like in this case for
huge_ptep_get_and_clear(). Simply aligning vaddr / pfn will not
be enough to fix this for s390, it has to be a pmd/pud pointer.
Or, as you already mentioned, the result of huge_pte_alloc().

Furthermore, the pmd and pte layout are different, so we simply cannot
use any pte_xxx primitives for hugepages. That was the reason for
introducing huge_ptep_get(), which will do an implicit conversion
from the real pmd/pud entry to a "fake" pte entry, which can then
be used with such pte_xxx primitives. Before writing it back in
set_huge_pte_at() we then do the reverse conversion to a proper
pmd/pud again.
