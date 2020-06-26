Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 144B720B90C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 21:07:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tmbt3hTQzDqnx
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 05:07:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tmXk1ZsgzDqvN
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 05:04:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 49tmXk167bz8t5m
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 05:04:54 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 49tmXj6C9yz9sRR; Sat, 27 Jun 2020 05:04:53 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 49tmXh6JSWz9sQt
 for <linuxppc-dev@ozlabs.org>; Sat, 27 Jun 2020 05:04:52 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05QJ3LYT042837; Fri, 26 Jun 2020 15:04:43 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31wjekr456-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jun 2020 15:04:43 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05QJ3Q82043212;
 Fri, 26 Jun 2020 15:04:43 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31wjekr442-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jun 2020 15:04:42 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05QJ0iJp013024;
 Fri, 26 Jun 2020 19:04:40 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 31uus53cgt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jun 2020 19:04:40 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 05QJ3Ib565339788
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Jun 2020 19:03:18 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD17BA405C;
 Fri, 26 Jun 2020 19:04:37 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A91AAA4054;
 Fri, 26 Jun 2020 19:04:34 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.0.159])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 26 Jun 2020 19:04:34 +0000 (GMT)
Subject: [PATCH 00/11] ppc64: enable kdump support for kexec_file_load syscall
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>
Date: Sat, 27 Jun 2020 00:34:33 +0530
Message-ID: <159319825403.16351.7253978047621755765.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-26_10:2020-06-26,
 2020-06-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0
 cotscore=-2147483648 mlxscore=0 clxscore=1011 lowpriorityscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006260134
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
 Petr Tesarik <ptesarik@suse.cz>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, lkml <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch series enables kdump support for kexec_file_load system
call (kexec -s -p) on PPC64. The changes are inspired from kexec-tools
code but heavily modified for kernel consumption. There is scope to
expand purgatory to verify sha digest but tried to keep purgatory
changes minimal in the interest of this series.

The first patch adds a weak arch_kexec_add_buffer function to override
locate memory hole logic suiting arch needs. There are some special
regions in ppc64 which should be avoided while loading buffer & there
are multiple callers to kexec_add_buffer making it too complicated to
maintain range sanity and using generic lookup at the same time.

The second patch marks ppc64 specific code within arch/powerpc/kexec
and arch/powerpc/purgatory to make the subsequent code changes easy
to understand.

The next patch adds helper function to setup different memory ranges
needed for loading kdump kernel, booting into it and exporting the
crashing kernel's elfcore.

The fourth patch overrides arch_kexec_add_buffer to locate memory
hole for kdump segments by accounting for the special memory regions,
referred to as excluded memory ranges, and calls __kexec_add_buffer
with kbuf->mem set to skip the generic locate memory hole lookup.

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
/proc/vmcore file. The last patch sets up the memory reserve map
for the kexec kernel and also claims kdump support as all the
necessary changes are added.

Tested the changes successfully on P8, P9 lpars & an OpenPOWER box.

---

Hari Bathini (11):
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


 arch/powerpc/include/asm/crashdump-ppc64.h |   15 
 arch/powerpc/include/asm/drmem.h           |    9 
 arch/powerpc/include/asm/kexec.h           |   35 +
 arch/powerpc/include/asm/kexec_ranges.h    |   18 
 arch/powerpc/kernel/prom.c                 |   13 
 arch/powerpc/kexec/Makefile                |    2 
 arch/powerpc/kexec/elf_64.c                |   35 +
 arch/powerpc/kexec/file_load.c             |   78 +
 arch/powerpc/kexec/file_load_64.c          | 1461 ++++++++++++++++++++++++++++
 arch/powerpc/kexec/ranges.c                |  387 +++++++
 arch/powerpc/mm/drmem.c                    |   87 +-
 arch/powerpc/mm/numa.c                     |   13 
 arch/powerpc/purgatory/Makefile            |   28 -
 arch/powerpc/purgatory/purgatory_64.c      |   35 +
 arch/powerpc/purgatory/trampoline.S        |  117 --
 arch/powerpc/purgatory/trampoline_64.S     |  153 +++
 include/linux/kexec.h                      |    5 
 kernel/kexec_file.c                        |   37 +
 18 files changed, 2327 insertions(+), 201 deletions(-)
 create mode 100644 arch/powerpc/include/asm/crashdump-ppc64.h
 create mode 100644 arch/powerpc/include/asm/kexec_ranges.h
 create mode 100644 arch/powerpc/kexec/file_load_64.c
 create mode 100644 arch/powerpc/kexec/ranges.c
 create mode 100644 arch/powerpc/purgatory/purgatory_64.c
 delete mode 100644 arch/powerpc/purgatory/trampoline.S
 create mode 100644 arch/powerpc/purgatory/trampoline_64.S

