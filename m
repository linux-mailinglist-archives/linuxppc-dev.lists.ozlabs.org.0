Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E454A11D41
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 17:32:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vzlj1PrqzDqLy
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 01:32:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=rppt@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vzh13yqmzDqLw
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 01:29:05 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x42FS83i127775
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 2 May 2019 11:29:01 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2s82sxsbpj-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 May 2019 11:29:00 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <rppt@linux.ibm.com>;
 Thu, 2 May 2019 16:28:58 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 2 May 2019 16:28:50 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x42FSnXd45023486
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 May 2019 15:28:49 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 830D5A4051;
 Thu,  2 May 2019 15:28:49 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 12855A404D;
 Thu,  2 May 2019 15:28:45 +0000 (GMT)
Received: from rapoport-lnx (unknown [9.148.205.209])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu,  2 May 2019 15:28:44 +0000 (GMT)
Received: by rapoport-lnx (sSMTP sendmail emulation);
 Thu, 02 May 2019 18:28:43 +0300
From: Mike Rapoport <rppt@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 00/15] introduce generic pte_{alloc,free}_one[_kernel]
Date: Thu,  2 May 2019 18:28:27 +0300
X-Mailer: git-send-email 2.7.4
X-TM-AS-GCONF: 00
x-cbid: 19050215-0008-0000-0000-000002E29914
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050215-0009-0000-0000-0000224F082B
Message-Id: <1556810922-20248-1-git-send-email-rppt@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-02_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=1
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=1
 clxscore=1015 lowpriorityscore=0 mlxscore=1 impostorscore=0
 mlxlogscore=211 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905020103
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
Cc: Michal Hocko <mhocko@suse.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Palmer Dabbelt <palmer@sifive.com>, linux-mips@vger.kernel.org,
 Guo Ren <guoren@kernel.org>, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Matt Turner <mattst88@gmail.com>, Sam Creasey <sammy@sammy.net>,
 Arnd Bergmann <arnd@arndb.de>, linux-um@lists.infradead.org,
 Richard Weinberger <richard@nod.at>, linux-m68k@lists.linux-m68k.org,
 Greentime Hu <green.hu@gmail.com>, nios2-dev@lists.rocketboards.org,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Richard Kuo <rkuo@codeaurora.org>, Paul Burton <paul.burton@mips.com>,
 linux-alpha@vger.kernel.org, Ley Foon Tan <lftan@altera.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

I've tried to trim down the recipients list, but it's still quite long, so
sorry for the spam.

Many architectures have similar, if not identical implementation of
pte_alloc_one_kernel(), pte_alloc_one(), pte_free_kernel() and pte_free().

A while ago Anshuman suggested to introduce a common definition of
GFP_PGTABLE and during the discussion it was suggested to rather
consolidate the allocators.

These patches introduce generic version of PTE allocation and free and
enable their use on several architectures.

The conversion introduces some changes for some of the architectures.
Here's the executive summary and the details are described at each patch.

* Most architectures do not set __GFP_ACCOUNT for the user page tables.
Switch to the generic functions is "spreading that goodness to all other
architectures"
* arm, arm64 and unicore32 used to check if the pte is not NULL before
freeing its memory in pte_free_kernel(). It's dropped during the
conversion as it seems superfluous.
* x86 used to BUG_ON() is pte was not page aligned duirng
pte_free_kernel(), the generic version simply frees the memory without any
checks.

This set only performs the straightforward conversion, the architectures
with different logic in pte_alloc_one() and pte_alloc_one_kernel() are not
touched, as well as architectures that have custom page table allocators.

[1] https://lore.kernel.org/lkml/1547619692-7946-1-git-send-email-anshuman.khandual@arm.com

 asm-generic, x86: introduce generic pte_{alloc,free}_one[_kernel]

Mike Rapoport (15):
  asm-generic, x86: introduce generic pte_{alloc,free}_one[_kernel]
  alpha: switch to generic version of pte allocation
  arm: switch to generic version of pte allocation
  arm64: switch to generic version of pte allocation
  csky: switch to generic version of pte allocation
  hexagon: switch to generic version of pte allocation
  m68k: sun3: switch to generic version of pte allocation
  mips: switch to generic version of pte allocation
  nds32: switch to generic version of pte allocation
  nios2: switch to generic version of pte allocation
  parisc: switch to generic version of pte allocation
  powerpc/nohash/64: switch to generic version of pte allocation
  riscv: switch to generic version of pte allocation
  um: switch to generic version of pte allocation
  unicore32: switch to generic version of pte allocation

 arch/alpha/include/asm/pgalloc.h             |  40 +---------
 arch/arm/include/asm/pgalloc.h               |  41 ++++------
 arch/arm/mm/mmu.c                            |   2 +-
 arch/arm64/include/asm/pgalloc.h             |  43 +----------
 arch/arm64/mm/mmu.c                          |   2 +-
 arch/arm64/mm/pgd.c                          |   4 +-
 arch/csky/include/asm/pgalloc.h              |  30 +-------
 arch/hexagon/include/asm/pgalloc.h           |  34 +--------
 arch/m68k/include/asm/sun3_pgalloc.h         |  41 +---------
 arch/mips/include/asm/pgalloc.h              |  33 +--------
 arch/nds32/include/asm/pgalloc.h             |  31 +-------
 arch/nios2/include/asm/pgalloc.h             |  37 +--------
 arch/parisc/include/asm/pgalloc.h            |  33 +--------
 arch/powerpc/include/asm/nohash/64/pgalloc.h |  35 +--------
 arch/riscv/include/asm/pgalloc.h             |  29 +-------
 arch/um/include/asm/pgalloc.h                |  16 +---
 arch/um/kernel/mem.c                         |  22 ------
 arch/unicore32/include/asm/pgalloc.h         |  36 ++-------
 arch/x86/include/asm/pgalloc.h               |  19 +----
 arch/x86/mm/pgtable.c                        |  33 +++------
 include/asm-generic/pgalloc.h                | 107 ++++++++++++++++++++++++++-
 virt/kvm/arm/mmu.c                           |   2 +-
 22 files changed, 171 insertions(+), 499 deletions(-)

-- 
2.7.4

