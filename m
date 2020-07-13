Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EE81221DE9B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 19:23:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B59V21jfYzDqM4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 03:23:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B59Qj0M2yzDqRy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 03:20:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B59Qg6QCFz8tVZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 03:20:43 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B59Qg3hZsz9sRN; Tue, 14 Jul 2020 03:20:43 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4B59Qc2B4Rz9sR4
 for <linuxppc-dev@ozlabs.org>; Tue, 14 Jul 2020 03:20:40 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06DH2GjJ038119; Mon, 13 Jul 2020 13:20:34 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 327tn9hgtu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jul 2020 13:20:34 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06DHCAus071917;
 Mon, 13 Jul 2020 13:20:34 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 327tn9hgsu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jul 2020 13:20:34 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06DH9Cvg009168;
 Mon, 13 Jul 2020 17:20:32 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma02fra.de.ibm.com with ESMTP id 327527tfaw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jul 2020 17:20:32 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 06DHJ7er55705994
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jul 2020 17:19:07 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 57DEB42047;
 Mon, 13 Jul 2020 17:20:29 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BC7BF42045;
 Mon, 13 Jul 2020 17:20:25 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.3.11])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 13 Jul 2020 17:20:25 +0000 (GMT)
Subject: [PATCH v3 00/12] ppc64: enable kdump support for kexec_file_load
 syscall
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 13 Jul 2020 22:50:24 +0530
Message-ID: <159466074408.24747.10036072269371204890.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-13_15:2020-07-13,
 2020-07-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007130120
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
Cc: Pingfan Liu <piliu@redhat.com>, Kexec-ml <kexec@lists.infradead.org>,
 Nayna Jain <nayna@linux.ibm.com>, Petr Tesarik <ptesarik@suse.cz>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
 lkml <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, Vivek Goyal <vgoyal@redhat.com>,
 Dave Young <dyoung@redhat.com>, Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch series enables kdump support for kexec_file_load system
call (kexec -s -p) on PPC64. The changes are inspired from kexec-tools
code but heavily modified for kernel consumption. There is scope to
expand purgatory to verify sha256 digest along with other improvements
in purgatory code. Will deal with those changes in a separate patch
series later.

The first patch adds a weak arch_kexec_locate_mem_hole() function to
override locate memory hole logic suiting arch needs. There are some
special regions in ppc64 which should be avoided while loading buffer
& there are multiple callers to kexec_add_buffer making it complicated
to maintain range sanity and using generic lookup at the same time.

The second patch marks ppc64 specific code within arch/powerpc/kexec
and arch/powerpc/purgatory to make the subsequent code changes easy
to understand.

The next patch adds helper function to setup different memory ranges
needed for loading kdump kernel, booting into it and exporting the
crashing kernel's elfcore.

The fourth patch overrides arch_kexec_locate_mem_hole() function to
locate memory hole for kdump segments by accounting for the special
memory regions, referred to as excluded memory ranges, and sets
kbuf->mem when a suitable memory region is found.

The fifth patch moves walk_drmem_lmbs() out of .init section with
a few changes to reuse it for setting up kdump kernel's usable memory
ranges. The next patch uses walk_drmem_lmbs() to look up the LMBs
and set linux,drconf-usable-memory & linux,usable-memory properties
in order to restrict kdump kernel's memory usage.

The seventh patch adds relocation support for the purgatory. Patch 8
helps setup the stack for the purgatory. The next patch setups up
backup region as a segment while loading kdump kernel and teaches
purgatory to copy it from source to destination.

Patch 10 builds the elfcore header for the running kernel & passes
the info to kdump kernel via "elfcorehdr=" parameter to export as
/proc/vmcore file. The next patch sets up the memory reserve map
for the kexec kernel and also claims kdump support for kdump as
all the necessary changes are added.

The last patch fixes a lookup issue for `kexec -l -s` case when
memory is reserved for crashkernel.

Tested the changes successfully on P8, P9 lpars, couple of OpenPOWER
boxes, one with secureboot enabled and a simulator.

v2 -> v3:
* Fixed TOC pointer calculation for purgatory by using section info
  that has relocations applied.
* Fixed arch_kexec_locate_mem_hole() function to fallback to generic
  kexec_locate_mem_hole() lookup if exclude ranges list is empty.
* Dropped check for backup_start in trampoline_64.S as purgatory()
  function takes care of it anyway.

v1 -> v2:
* Introduced arch_kexec_locate_mem_hole() for override and dropped
  weak arch_kexec_add_buffer().
* Addressed warnings reported by lkp.
* Added patch to address kexec load issue when memory is reserved
  for crashkernel.
* Used the appropriate license header for the new files added.
* Added an option to merge ranges to minimize reallocations while
  adding memory ranges.
* Dropped within_crashkernel parameter for add_opal_mem_range() &
  add_rtas_mem_range() functions as it is not really needed.

---

Hari Bathini (12):
      kexec_file: allow archs to handle special regions while locating memory hole
      powerpc/kexec_file: mark PPC64 specific code
      powerpc/kexec_file: add helper functions for getting memory ranges
      ppc64/kexec_file: avoid stomping memory used by special regions
      powerpc/drmem: make lmb walk a bit more flexible
      ppc64/kexec_file: restrict memory usage of kdump kernel
      ppc64/kexec_file: add support to relocate purgatory
      ppc64/kexec_file: setup the stack for purgatory
      ppc64/kexec_file: setup backup region for kdump kernel
      ppc64/kexec_file: prepare elfcore header for crashing kernel
      ppc64/kexec_file: add appropriate regions for memory reserve map
      ppc64/kexec_file: fix kexec load failure with lack of memory hole


 arch/powerpc/include/asm/crashdump-ppc64.h |   15 
 arch/powerpc/include/asm/drmem.h           |    9 
 arch/powerpc/include/asm/kexec.h           |   35 +
 arch/powerpc/include/asm/kexec_ranges.h    |   18 
 arch/powerpc/include/asm/purgatory.h       |   11 
 arch/powerpc/kernel/prom.c                 |   13 
 arch/powerpc/kexec/Makefile                |    2 
 arch/powerpc/kexec/elf_64.c                |   35 +
 arch/powerpc/kexec/file_load.c             |   78 +
 arch/powerpc/kexec/file_load_64.c          | 1508 ++++++++++++++++++++++++++++
 arch/powerpc/kexec/ranges.c                |  397 +++++++
 arch/powerpc/mm/drmem.c                    |   87 +-
 arch/powerpc/mm/numa.c                     |   13 
 arch/powerpc/purgatory/Makefile            |   28 -
 arch/powerpc/purgatory/purgatory_64.c      |   36 +
 arch/powerpc/purgatory/trampoline.S        |  117 --
 arch/powerpc/purgatory/trampoline_64.S     |  170 +++
 include/linux/kexec.h                      |   29 -
 kernel/kexec_file.c                        |   16 
 19 files changed, 2407 insertions(+), 210 deletions(-)
 create mode 100644 arch/powerpc/include/asm/crashdump-ppc64.h
 create mode 100644 arch/powerpc/include/asm/kexec_ranges.h
 create mode 100644 arch/powerpc/include/asm/purgatory.h
 create mode 100644 arch/powerpc/kexec/file_load_64.c
 create mode 100644 arch/powerpc/kexec/ranges.c
 create mode 100644 arch/powerpc/purgatory/purgatory_64.c
 delete mode 100644 arch/powerpc/purgatory/trampoline.S
 create mode 100644 arch/powerpc/purgatory/trampoline_64.S

