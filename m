Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD5E25E68D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Sep 2020 10:38:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bk7Gh1gKBzDqdc
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Sep 2020 18:38:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=gerald.schaefer@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=baV3A9YS; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BjhPN4ddJzDqWH
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Sep 2020 01:27:14 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 084FIRJu181425; Fri, 4 Sep 2020 11:26:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=dAG9aGDzQJyedjm8mAaWuolmm+H+9/Eluc5joaGGtqY=;
 b=baV3A9YSXyOL4Fd4toEVBtu/7me9DfKeOQCpJxC3nctcv/OpMpnvBsj6/aI8qexPVFNy
 1DXA4HCCWza7NZUW4C604ztYPE789TbUX4hW+OznAKJfiLqoZLFaJAXPgYdqplhPUCp1
 jDMW3b8vc8DEF4Z40bqyaFyt01R0oYpzYUOjMNck0YetNGWHlV/osqx/6Bxglt0jzD41
 EN8ps004n82KCO7/i1/Q0EeGRy1eum5bEywCrwwhUGdLvYQrR7/B0ny+Uj38ZKPi6Xhf
 K1irI1en/gLqHaqDd9G6vR3PobU3sPdV6ihdOSfIFUHqc9kXlZnC7rXByUiS60YZAwfs LQ== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33br40g7jm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Sep 2020 11:26:54 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 084FNQXQ031971;
 Fri, 4 Sep 2020 15:26:52 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04fra.de.ibm.com with ESMTP id 339ap7tmf6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Sep 2020 15:26:52 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 084FQnw717629672
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Sep 2020 15:26:49 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7CDB942045;
 Fri,  4 Sep 2020 15:26:49 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0A9DE4204F;
 Fri,  4 Sep 2020 15:26:49 +0000 (GMT)
Received: from thinkpad (unknown [9.171.24.200])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri,  4 Sep 2020 15:26:48 +0000 (GMT)
Date: Fri, 4 Sep 2020 17:26:47 +0200
From: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v4 00/13] mm/debug_vm_pgtable fixes
Message-ID: <20200904172647.002113d3@thinkpad>
In-Reply-To: <bb0f3427-e2bd-f713-3ea8-d264be0e690b@arm.com>
References: <20200902114222.181353-1-aneesh.kumar@linux.ibm.com>
 <bb0f3427-e2bd-f713-3ea8-d264be0e690b@arm.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-04_07:2020-09-04,
 2020-09-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 adultscore=0 clxscore=1011 spamscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 mlxlogscore=832
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009040130
X-Mailman-Approved-At: Sat, 05 Sep 2020 18:36:42 +1000
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

On Fri, 4 Sep 2020 12:18:05 +0530
Anshuman Khandual <anshuman.khandual@arm.com> wrote:

> 
> 
> On 09/02/2020 05:12 PM, Aneesh Kumar K.V wrote:
> > This patch series includes fixes for debug_vm_pgtable test code so that
> > they follow page table updates rules correctly. The first two patches introduce
> > changes w.r.t ppc64. The patches are included in this series for completeness. We can
> > merge them via ppc64 tree if required.
> > 
> > Hugetlb test is disabled on ppc64 because that needs larger change to satisfy
> > page table update rules.
> > 
> > These tests are broken w.r.t page table update rules and results in kernel
> > crash as below. 
> > 
> > [   21.083519] kernel BUG at arch/powerpc/mm/pgtable.c:304!
> > cpu 0x0: Vector: 700 (Program Check) at [c000000c6d1e76c0]
> >     pc: c00000000009a5ec: assert_pte_locked+0x14c/0x380
> >     lr: c0000000005eeeec: pte_update+0x11c/0x190
> >     sp: c000000c6d1e7950
> >    msr: 8000000002029033
> >   current = 0xc000000c6d172c80
> >   paca    = 0xc000000003ba0000   irqmask: 0x03   irq_happened: 0x01
> >     pid   = 1, comm = swapper/0
> > kernel BUG at arch/powerpc/mm/pgtable.c:304!
> > [link register   ] c0000000005eeeec pte_update+0x11c/0x190
> > [c000000c6d1e7950] 0000000000000001 (unreliable)
> > [c000000c6d1e79b0] c0000000005eee14 pte_update+0x44/0x190
> > [c000000c6d1e7a10] c000000001a2ca9c pte_advanced_tests+0x160/0x3d8
> > [c000000c6d1e7ab0] c000000001a2d4fc debug_vm_pgtable+0x7e8/0x1338
> > [c000000c6d1e7ba0] c0000000000116ec do_one_initcall+0xac/0x5f0
> > [c000000c6d1e7c80] c0000000019e4fac kernel_init_freeable+0x4dc/0x5a4
> > [c000000c6d1e7db0] c000000000012474 kernel_init+0x24/0x160
> > [c000000c6d1e7e20] c00000000000cbd0 ret_from_kernel_thread+0x5c/0x6c
> > 
> > With DEBUG_VM disabled
> > 
> > [   20.530152] BUG: Kernel NULL pointer dereference on read at 0x00000000
> > [   20.530183] Faulting instruction address: 0xc0000000000df330
> > cpu 0x33: Vector: 380 (Data SLB Access) at [c000000c6d19f700]
> >     pc: c0000000000df330: memset+0x68/0x104
> >     lr: c00000000009f6d8: hash__pmdp_huge_get_and_clear+0xe8/0x1b0
> >     sp: c000000c6d19f990
> >    msr: 8000000002009033
> >    dar: 0
> >   current = 0xc000000c6d177480
> >   paca    = 0xc00000001ec4f400   irqmask: 0x03   irq_happened: 0x01
> >     pid   = 1, comm = swapper/0
> > [link register   ] c00000000009f6d8 hash__pmdp_huge_get_and_clear+0xe8/0x1b0
> > [c000000c6d19f990] c00000000009f748 hash__pmdp_huge_get_and_clear+0x158/0x1b0 (unreliable)
> > [c000000c6d19fa10] c0000000019ebf30 pmd_advanced_tests+0x1f0/0x378
> > [c000000c6d19fab0] c0000000019ed088 debug_vm_pgtable+0x79c/0x1244
> > [c000000c6d19fba0] c0000000000116ec do_one_initcall+0xac/0x5f0
> > [c000000c6d19fc80] c0000000019a4fac kernel_init_freeable+0x4dc/0x5a4
> > [c000000c6d19fdb0] c000000000012474 kernel_init+0x24/0x160
> > [c000000c6d19fe20] c00000000000cbd0 ret_from_kernel_thread+0x5c/0x6c
> > 
> > Changes from v3:
> > * Address review feedback
> > * Move page table depost and withdraw patch after adding pmdlock to avoid bisect failure.
> 
> This version
> 
> - Builds on x86, arm64, s390, arc, powerpc and riscv (defconfig with DEBUG_VM_PGTABLE)
> - Runs on arm64 and x86 without any regression, atleast nothing that I have noticed
> - Will be great if this could get tested on s390, arc, riscv, ppc32 platforms as well

When I quickly tested v3, it worked fine, but now it turned out to
only work fine "sometimes", both v3 and v4. I need to look into it
further, but so far it seems related to the hugetlb_advanced_tests().

I guess there was already some discussion on this test, but we did
not receive all of the thread(s). Please always add at least
linux-s390@vger.kernel.org and maybe myself and Vasily Gorbik <gor@linux.ibm.com>
for further discussions.

That being said, sorry for duplications, this might already have been
discussed. Preliminary analysis showed that it only seems to go wrong
for certain random vaddr values. I cannot make any sense of that yet,
but what seems strange to me is that the hugetlb_advanced_tests()
take a (real) pte_t pointer as input, and also use that for all
kinds of operations (set_huge_pte_at, huge_ptep_get_and_clear, etc.).

Although all the hugetlb code in the kernel is (mis)using pte_t
pointers instead of the correct pmd/pud_t pointers like THP, that
is just for historic reasons. The pointers will actually never point
to a real pte_t (i.e. page table entry), but of course to a pmd
or pud entry, depending on hugepage size.

What is passed in as ptep to hugetlb_advanced_tests() seems to be
the result from the previous ptep = pte_alloc_map(mm, pmdp, vaddr),
so I would expect that it points to a real page table entry. Need
to investigate further, but IIUC, using such a pointer for adding
large pte entries (i.e. pmd/pud entries) at least feels very wrong
to me, and I assume it is related to the issues we see on s390.

We actually see different issues, e.g. once a panic directly in
hugetlb_advanced_tests() -> huge_ptep_get_and_clear(), but also
indirect symptoms after debug_vm_pgtable() completes, like this:

[   10.533901] BUG task_struct (Not tainted): Padding overwritten. 0x0000000019f798c7-0x0000000019f798c7 @offset=30087

Last but not least, what I said about the pte vs. pmd/pud of
course also should apply to the hugetlb_basic_tests(), although
they are not directly using a pte_t pointer, and especially
also not writing to it. Still, the pte_aligned pfn parameter
is not guaranteed to also be pmd/pud_aligned, which doesn't
feel right.

So, for now, until this is sorted out, I guess we also need
to exclude s390 at least from the hugetlb_advanced_tests().
The hugetlb_basic_tests() seem to work fine so far (probably
by chance :-))
