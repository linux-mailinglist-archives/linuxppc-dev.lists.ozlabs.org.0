Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1098825E68F
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Sep 2020 10:39:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bk7JV5hbbzDqs2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Sep 2020 18:39:38 +1000 (AEST)
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
 header.s=pp1 header.b=IhR8YDv4; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bjj992NgQzDqsZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Sep 2020 02:01:48 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 084FO61F002913; Fri, 4 Sep 2020 12:01:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=MnLFyDDhT9sKXs8tM6T4zYqYpZizs/gnumhRRgoYVaA=;
 b=IhR8YDv4lKuNBwroWjkKSAJy0ZLA20PZjs6YQK0zXWryjY1Hg2lGe1iUWpYvvKuDIhzp
 k4MmUHhPj5KPhZE+cpRIdOoqoIYh8azSaAa60y1mf7lE7+RBYAYoRSOI9fGhlFMOI/mv
 QpRkTY9k9nKakAzWucGAvNuHZu52NZ6V8BB7PLzWAlCusmN0iYrCRaTjOnw9E77lddJs
 TZAXlFwHOFJbhbpDFcEN+gWWWm8SKNJAj3iRU+gZiaYusbcQ6lnJ7DRK9kcdlxIYAqJY
 tWuD6m39oeMa1dfzkzn1xLwHBJ5BaeJGbxEFrloh0qg/1+eFBI4npgHJMhudK8puKDzI dA== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33br6m9072-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Sep 2020 12:01:22 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 084G00YE032009;
 Fri, 4 Sep 2020 16:01:19 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma02fra.de.ibm.com with ESMTP id 337en7manm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Sep 2020 16:01:19 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 084G1GHe15008064
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Sep 2020 16:01:16 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CEA3C4C058;
 Fri,  4 Sep 2020 16:01:16 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 57B824C040;
 Fri,  4 Sep 2020 16:01:16 +0000 (GMT)
Received: from thinkpad (unknown [9.171.24.200])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri,  4 Sep 2020 16:01:16 +0000 (GMT)
Date: Fri, 4 Sep 2020 18:01:15 +0200
From: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v4 00/13] mm/debug_vm_pgtable fixes
Message-ID: <20200904180115.07ee5f00@thinkpad>
In-Reply-To: <20200904172647.002113d3@thinkpad>
References: <20200902114222.181353-1-aneesh.kumar@linux.ibm.com>
 <bb0f3427-e2bd-f713-3ea8-d264be0e690b@arm.com>
 <20200904172647.002113d3@thinkpad>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-04_08:2020-09-04,
 2020-09-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 mlxscore=0 impostorscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=911 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009040133
X-Mailman-Approved-At: Sat, 05 Sep 2020 18:36:43 +1000
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

On Fri, 4 Sep 2020 17:26:47 +0200
Gerald Schaefer <gerald.schaefer@linux.ibm.com> wrote:

> On Fri, 4 Sep 2020 12:18:05 +0530
> Anshuman Khandual <anshuman.khandual@arm.com> wrote:
> 
> > 
> > 
> > On 09/02/2020 05:12 PM, Aneesh Kumar K.V wrote:
> > > This patch series includes fixes for debug_vm_pgtable test code so that
> > > they follow page table updates rules correctly. The first two patches introduce
> > > changes w.r.t ppc64. The patches are included in this series for completeness. We can
> > > merge them via ppc64 tree if required.
> > > 
> > > Hugetlb test is disabled on ppc64 because that needs larger change to satisfy
> > > page table update rules.
> > > 
> > > These tests are broken w.r.t page table update rules and results in kernel
> > > crash as below. 
> > > 
> > > [   21.083519] kernel BUG at arch/powerpc/mm/pgtable.c:304!
> > > cpu 0x0: Vector: 700 (Program Check) at [c000000c6d1e76c0]
> > >     pc: c00000000009a5ec: assert_pte_locked+0x14c/0x380
> > >     lr: c0000000005eeeec: pte_update+0x11c/0x190
> > >     sp: c000000c6d1e7950
> > >    msr: 8000000002029033
> > >   current = 0xc000000c6d172c80
> > >   paca    = 0xc000000003ba0000   irqmask: 0x03   irq_happened: 0x01
> > >     pid   = 1, comm = swapper/0
> > > kernel BUG at arch/powerpc/mm/pgtable.c:304!
> > > [link register   ] c0000000005eeeec pte_update+0x11c/0x190
> > > [c000000c6d1e7950] 0000000000000001 (unreliable)
> > > [c000000c6d1e79b0] c0000000005eee14 pte_update+0x44/0x190
> > > [c000000c6d1e7a10] c000000001a2ca9c pte_advanced_tests+0x160/0x3d8
> > > [c000000c6d1e7ab0] c000000001a2d4fc debug_vm_pgtable+0x7e8/0x1338
> > > [c000000c6d1e7ba0] c0000000000116ec do_one_initcall+0xac/0x5f0
> > > [c000000c6d1e7c80] c0000000019e4fac kernel_init_freeable+0x4dc/0x5a4
> > > [c000000c6d1e7db0] c000000000012474 kernel_init+0x24/0x160
> > > [c000000c6d1e7e20] c00000000000cbd0 ret_from_kernel_thread+0x5c/0x6c
> > > 
> > > With DEBUG_VM disabled
> > > 
> > > [   20.530152] BUG: Kernel NULL pointer dereference on read at 0x00000000
> > > [   20.530183] Faulting instruction address: 0xc0000000000df330
> > > cpu 0x33: Vector: 380 (Data SLB Access) at [c000000c6d19f700]
> > >     pc: c0000000000df330: memset+0x68/0x104
> > >     lr: c00000000009f6d8: hash__pmdp_huge_get_and_clear+0xe8/0x1b0
> > >     sp: c000000c6d19f990
> > >    msr: 8000000002009033
> > >    dar: 0
> > >   current = 0xc000000c6d177480
> > >   paca    = 0xc00000001ec4f400   irqmask: 0x03   irq_happened: 0x01
> > >     pid   = 1, comm = swapper/0
> > > [link register   ] c00000000009f6d8 hash__pmdp_huge_get_and_clear+0xe8/0x1b0
> > > [c000000c6d19f990] c00000000009f748 hash__pmdp_huge_get_and_clear+0x158/0x1b0 (unreliable)
> > > [c000000c6d19fa10] c0000000019ebf30 pmd_advanced_tests+0x1f0/0x378
> > > [c000000c6d19fab0] c0000000019ed088 debug_vm_pgtable+0x79c/0x1244
> > > [c000000c6d19fba0] c0000000000116ec do_one_initcall+0xac/0x5f0
> > > [c000000c6d19fc80] c0000000019a4fac kernel_init_freeable+0x4dc/0x5a4
> > > [c000000c6d19fdb0] c000000000012474 kernel_init+0x24/0x160
> > > [c000000c6d19fe20] c00000000000cbd0 ret_from_kernel_thread+0x5c/0x6c
> > > 
> > > Changes from v3:
> > > * Address review feedback
> > > * Move page table depost and withdraw patch after adding pmdlock to avoid bisect failure.
> > 
> > This version
> > 
> > - Builds on x86, arm64, s390, arc, powerpc and riscv (defconfig with DEBUG_VM_PGTABLE)
> > - Runs on arm64 and x86 without any regression, atleast nothing that I have noticed
> > - Will be great if this could get tested on s390, arc, riscv, ppc32 platforms as well
> 
> When I quickly tested v3, it worked fine, but now it turned out to
> only work fine "sometimes", both v3 and v4. I need to look into it
> further, but so far it seems related to the hugetlb_advanced_tests().
> 
> I guess there was already some discussion on this test, but we did
> not receive all of the thread(s). Please always add at least
> linux-s390@vger.kernel.org and maybe myself and Vasily Gorbik <gor@linux.ibm.com>
> for further discussions.

BTW, with myself I mean the new address gerald.schaefer@linux.ibm.com.
The old gerald.schaefer@de.ibm.com seems to work (again), but is not
very reliable.

BTW2, a quick test with this change (so far) made the issues on s390
go away:

@@ -1069,7 +1074,7 @@ static int __init debug_vm_pgtable(void)
        spin_unlock(ptl);
 
 #ifndef CONFIG_PPC_BOOK3S_64
-       hugetlb_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
+       hugetlb_advanced_tests(mm, vma, (pte_t *) pmdp, pmd_aligned, vaddr, prot);
 #endif
 
        spin_lock(&mm->page_table_lock);

That would more match the "pte_t pointer" usage for hugetlb code,
i.e. just cast a pmd_t pointer to it. Also changed to pmd_aligned,
but I think the root cause is the pte_t pointer.

Not entirely sure though if that would really be the correct fix.
I somehow lost whatever little track I had about what these tests
really want to check, and if that would still be valid with that
change.
