Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 713D3260450
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Sep 2020 20:12:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BlbwX6dDQzDqQH
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 04:12:28 +1000 (AEST)
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
 header.s=pp1 header.b=oNHElOGv; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BlblJ02VQzDqPf
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Sep 2020 04:04:27 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 087I2giF154827; Mon, 7 Sep 2020 14:03:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=8rnGmMRkvkgX5N8u5JthtpfXJszyHTkxMnCJPQcMOTk=;
 b=oNHElOGvXv7QXaLspNhgBWGRiX738kpCkhlwlGjGhW6WQSn4ILECsFVDKMAVhX3jycTY
 38iL6cj6qt5KHOA5IKdtBFd56Jm5DiojDCi8u4JNsJ+HFhE+hC5bhGO63+ArV7j3jjMB
 KteVXwVtQZJeib4KCJ6hc5VnJQKdQAat7P3f72FdC1i36tpErUh8TqRfKmZRP2QuGoGY
 Pdy7bDmtvf4/HMsucF8Kje/WAlqFgobYWiWEi2jGt+lFsg/ZnhW1xFMmUJcOHEMHPa6V
 8pQIR5nOC70xYKb0WzbXHw2pq5dWHFQN75UtWq9ix/i7BtYF2GrVUkK8+Ie/tMW96IYy wQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33dspe85a1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Sep 2020 14:03:10 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 087I39BQ157737;
 Mon, 7 Sep 2020 14:03:09 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33dspe858x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Sep 2020 14:03:09 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 087I2pTg014263;
 Mon, 7 Sep 2020 18:03:07 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 33c2a89kw2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Sep 2020 18:03:06 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 087I33R861538636
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Sep 2020 18:03:03 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C035B42045;
 Mon,  7 Sep 2020 18:03:03 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A4C4C4203F;
 Mon,  7 Sep 2020 18:03:02 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  7 Sep 2020 18:03:02 +0000 (GMT)
From: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>
Subject: [RFC PATCH v2 0/3] mm/gup: fix gup_fast with dynamic page table
 folding
Date: Mon,  7 Sep 2020 20:00:55 +0200
Message-Id: <20200907180058.64880-1-gerald.schaefer@linux.ibm.com>
X-Mailer: git-send-email 2.17.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-07_11:2020-09-07,
 2020-09-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxlogscore=914
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009070173
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, linux-sparc <sparclinux@vger.kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Richard Weinberger <richard@nod.at>, linux-x86 <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, Heiko Carstens <hca@linux.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>, Jeff Dike <jdike@addtoit.com>,
 linux-um <linux-um@lists.infradead.org>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm <linux-arm-kernel@lists.infradead.org>,
 linux-power <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is v2 of an RFC previously discussed here:
https://lore.kernel.org/lkml/20200828140314.8556-1-gerald.schaefer@linux.ibm.com/

Patch 1 is a fix for a regression in gup_fast on s390, after our conversion
to common gup_fast code. It will introduce special helper functions
pXd_addr_end_folded(), which have to be used in places where pagetable walk
is done w/o lock and with READ_ONCE, so currently only in gup_fast.

Patch 2 is an attempt to make that more generic, i.e. change pXd_addr_end()
themselves by adding an extra pXd value parameter. That was suggested by
Jason during v1 discussion, because he is already thinking of some other
places where he might want to switch to the READ_ONCE logic for pagetable
walks. In general, that would be the cleanest / safest solution, but there
is some impact on other architectures and common code, hence the new and
greatly enlarged recipient list.

Patch 3 is a "nice to have" add-on, which makes pXd_addr_end() inline
functions instead of #defines, so that we get some type checking for the
new pXd value parameter.

Not sure about Fixes/stable tags for the generic solution. Only patch 1
fixes a real bug on s390, and has Fixes/stable tags. Patches 2 + 3 might
still be nice to have in stable, to ease future backports, but I guess
"nice to have" does not really qualify for stable backports.

Changes in v2:
- Pick option 2 from v1 discussion (pXd_addr_end_folded helpers)
- Add patch 2 + 3 for more generic approach

Alexander Gordeev (3):
  mm/gup: fix gup_fast with dynamic page table folding
  mm: make pXd_addr_end() functions page-table entry aware
  mm: make generic pXd_addr_end() macros inline functions

 arch/arm/include/asm/pgtable-2level.h    |  2 +-
 arch/arm/mm/idmap.c                      |  6 ++--
 arch/arm/mm/mmu.c                        |  8 ++---
 arch/arm64/kernel/hibernate.c            | 16 +++++----
 arch/arm64/kvm/mmu.c                     | 16 ++++-----
 arch/arm64/mm/kasan_init.c               |  8 ++---
 arch/arm64/mm/mmu.c                      | 25 +++++++-------
 arch/powerpc/mm/book3s64/radix_pgtable.c |  7 ++--
 arch/powerpc/mm/hugetlbpage.c            |  6 ++--
 arch/s390/include/asm/pgtable.h          | 42 ++++++++++++++++++++++++
 arch/s390/mm/page-states.c               |  8 ++---
 arch/s390/mm/pageattr.c                  |  8 ++---
 arch/s390/mm/vmem.c                      |  8 ++---
 arch/sparc/mm/hugetlbpage.c              |  6 ++--
 arch/um/kernel/tlb.c                     |  8 ++---
 arch/x86/mm/init_64.c                    | 15 ++++-----
 arch/x86/mm/kasan_init_64.c              | 16 ++++-----
 include/asm-generic/pgtable-nop4d.h      |  2 +-
 include/asm-generic/pgtable-nopmd.h      |  2 +-
 include/asm-generic/pgtable-nopud.h      |  2 +-
 include/linux/pgtable.h                  | 38 ++++++++++++---------
 mm/gup.c                                 |  8 ++---
 mm/ioremap.c                             |  8 ++---
 mm/kasan/init.c                          | 17 +++++-----
 mm/madvise.c                             |  4 +--
 mm/memory.c                              | 40 +++++++++++-----------
 mm/mlock.c                               | 18 +++++++---
 mm/mprotect.c                            |  8 ++---
 mm/pagewalk.c                            |  8 ++---
 mm/swapfile.c                            |  8 ++---
 mm/vmalloc.c                             | 16 ++++-----
 31 files changed, 219 insertions(+), 165 deletions(-)

-- 
2.17.1

