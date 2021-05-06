Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4D3374EA5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 06:41:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbLWY66nkz3dDK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 14:41:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ae/U2dyG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=cmr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Ae/U2dyG; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbLTy54Vbz3cbG
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 May 2021 14:40:06 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1464XWt2080391; Thu, 6 May 2021 00:40:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=cmRt8SjQt3QiWz4AHEfctbcrW7tJKjSSMea/ZF9W3NM=;
 b=Ae/U2dyGrAIyzzo8xFOful/Pu8pcmI9FEi7wMqIoq+focyrLp4y0XsQsIem104vIFrtl
 EkqIMHDYMxOS/FgNQP53YkxndszLuAX8X7XmRIJ5xPAmzZVbtV0VvzWmnZDI8QKH7DVp
 jiijbMn4xM4AKU5mZRp6tGKRM/hZ8n09yoCNJaFl800c90qkHm0TnplhGJNNF9vU/6ib
 /ndy6EyaoK8isXGsQar3IzSF5Hsz4eV2+3LtiTOLDTjZdeLoQSh5GmQDFHVah70d2tpD
 QjdfAIL39UgYVtXKY/bs7ZcYcpqeoasZxGKULzZ6fwNPd8J1pM0xmsMM5jrCyEbMPdoE qg== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38c9f2r5uy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 May 2021 00:40:00 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1464W3Ye006541;
 Thu, 6 May 2021 04:35:00 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma02dal.us.ibm.com with ESMTP id 38c1mxu822-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 May 2021 04:35:00 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1464Yw6932899336
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 May 2021 04:34:58 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B51766A04D;
 Thu,  6 May 2021 04:34:58 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 935886A047;
 Thu,  6 May 2021 04:34:57 +0000 (GMT)
Received: from oc8246131445.ibm.com (unknown [9.160.168.222])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with SMTP;
 Thu,  6 May 2021 04:34:57 +0000 (GMT)
Received: from oc8246131445.ibm.com (localhost.localdomain [127.0.0.1])
 by oc8246131445.ibm.com (Postfix) with ESMTP id 60E6CBC0A1D;
 Wed,  5 May 2021 23:34:53 -0500 (CDT)
From: "Christopher M. Riedl" <cmr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RESEND PATCH v4 00/11] Use per-CPU temporary mappings for patching
Date: Wed,  5 May 2021 23:34:41 -0500
Message-Id: <20210506043452.9674-1-cmr@linux.ibm.com>
X-Mailer: git-send-email 2.26.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8vouhhUlhpGnbPtJrpwOYUG8c-hGufEK
X-Proofpoint-ORIG-GUID: 8vouhhUlhpGnbPtJrpwOYUG8c-hGufEK
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-06_03:2021-05-05,
 2021-05-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=999 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105060029
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
Cc: tglx@linutronix.de, x86@kernel.org, linux-hardening@vger.kernel.org,
 keescook@chromium.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When compiled with CONFIG_STRICT_KERNEL_RWX, the kernel must create
temporary mappings when patching itself. These mappings temporarily
override the strict RWX text protections to permit a write. Currently,
powerpc allocates a per-CPU VM area for patching. Patching occurs as
follows:

	1. Map page in per-CPU VM area w/ PAGE_KERNEL protection
	2. Patch text
	3. Remove the temporary mapping

While the VM area is per-CPU, the mapping is actually inserted into the
kernel page tables. Presumably, this could allow another CPU to access
the normally write-protected text - either malicously or accidentally -
via this same mapping if the address of the VM area is known. Ideally,
the mapping should be kept local to the CPU doing the patching [0].

x86 introduced "temporary mm" structs which allow the creation of
mappings local to a particular CPU [1]. This series intends to bring the
notion of a temporary mm to powerpc and harden powerpc by using such a
mapping for patching a kernel with strict RWX permissions.

The first four patches implement an LKDTM test "proof-of-concept" which
exploits the potential vulnerability (ie. the temporary mapping during
patching is exposed in the kernel page tables and accessible by other
CPUs) using a simple brute-force approach. This test is implemented for
both powerpc and x86_64. The test passes on powerpc with this new
series, fails on upstream powerpc, passes on upstream x86_64, and fails
on an older (ancient) x86_64 tree without the x86_64 temporary mm
patches. The remaining patches add support for and use a temporary mm
for code patching on powerpc.

Tested boot, ftrace, and repeated LKDTM "hijack":
	- QEMU+KVM (host: POWER9 Blackbird): Radix MMU w/ KUAP
	- QEMU+KVM (host: POWER9 Blackbird): Hash MMU w/o KUAP
	- QEMU+KVM (host: POWER9 Blackbird): Hash MMU w/ KUAP

Tested repeated LKDTM "hijack":
	- QEMU+KVM (host: AMD desktop): x86_64 upstream
	- QEMU+KVM (host: AMD desktop): x86_64 w/o percpu temp mm to
	  verify the LKDTM "hijack" fails

Tested boot and ftrace:
	- QEMU+TCG: ppc44x (bamboo)
	- QEMU+TCG: g5 (mac99)

I also tested with various extra config options enabled as suggested in
section 12) in Documentation/process/submit-checklist.rst.

	[ Apologies about the resend - some of the patches were dropped by
          the CC'd linux-hardening list due to tls problems between mailbox=
.org
          and vger.kernel.org. I re-signed my patches w/ my IBM email; no o=
ther
          changes. ]

v4:	* It's time to revisit this series again since @jpn and @mpe fixed
	  our known STRICT_*_RWX bugs on powerpc/64s.
	* Rebase on linuxppc/next:
          commit ee1bc694fbaec ("powerpc/kvm: Fix build error when PPC_MEM_=
KEYS/PPC_PSERIES=3Dn")
	* Completely rework how map_patch() works on book3s64 Hash MMU
	* Split the LKDTM x86_64 and powerpc bits into separate patches
	* Annotate commit messages with changes from v3 instead of
	  listing them here completely out-of context...

v3:	* Rebase on linuxppc/next: commit 9123e3a74ec7 ("Linux 5.9-rc1")
	* Move temporary mm implementation into code-patching.c where it
	  belongs
	* Implement LKDTM hijacker test on x86_64 (on IBM time oof) Do
	* not use address zero for the patching address in the
	  temporary mm (thanks @dja for pointing this out!)
	* Wrap the LKDTM test w/ CONFIG_SMP as suggested by Christophe
	  Leroy
	* Comments to clarify PTE pre-allocation and patching addr
	  selection

v2:	* Rebase on linuxppc/next:
	  commit 105fb38124a4 ("powerpc/8xx: Modify ptep_get()")
	* Always dirty pte when mapping patch
	* Use `ppc_inst_len` instead of `sizeof` on instructions
	* Declare LKDTM patching addr accessor in header where it belongs=09

v1:	* Rebase on linuxppc/next (4336b9337824)
	* Save and restore second hw watchpoint
	* Use new ppc_inst_* functions for patching check and in LKDTM test

rfc-v2:	* Many fixes and improvements mostly based on extensive feedback
          and testing by Christophe Leroy (thanks!).
	* Make patching_mm and patching_addr static and move
	  '__ro_after_init' to after the variable name (more common in
	  other parts of the kernel)
	* Use 'asm/debug.h' header instead of 'asm/hw_breakpoint.h' to
	  fix PPC64e compile
	* Add comment explaining why we use BUG_ON() during the init
	  call to setup for patching later
	* Move ptep into patch_mapping to avoid walking page tables a
	  second time when unmapping the temporary mapping
	* Use KUAP under non-radix, also manually dirty the PTE for patch
	  mapping on non-BOOK3S_64 platforms
	* Properly return any error from __patch_instruction
        * Do not use 'memcmp' where a simple comparison is appropriate
	* Simplify expression for patch address by removing pointer maths
	* Add LKDTM test

[0]: https://github.com/linuxppc/issues/issues/224
[1]: https://lore.kernel.org/kernel-hardening/20190426232303.28381-1-nadav.=
amit@gmail.com/

Christopher M. Riedl (11):
  powerpc: Add LKDTM accessor for patching addr
  lkdtm/powerpc: Add test to hijack a patch mapping
  x86_64: Add LKDTM accessor for patching addr
  lkdtm/x86_64: Add test to hijack a patch mapping
  powerpc/64s: Add ability to skip SLB preload
  powerpc: Introduce temporary mm
  powerpc/64s: Make slb_allocate_user() non-static
  powerpc: Initialize and use a temporary mm for patching
  lkdtm/powerpc: Fix code patching hijack test
  powerpc: Protect patching_mm with a lock
  powerpc: Use patch_instruction_unlocked() in loops

 arch/powerpc/include/asm/book3s/64/mmu-hash.h |   1 +
 arch/powerpc/include/asm/book3s/64/mmu.h      |   3 +
 arch/powerpc/include/asm/code-patching.h      |   8 +
 arch/powerpc/include/asm/debug.h              |   1 +
 arch/powerpc/include/asm/mmu_context.h        |  13 +
 arch/powerpc/kernel/epapr_paravirt.c          |   9 +-
 arch/powerpc/kernel/optprobes.c               |  22 +-
 arch/powerpc/kernel/process.c                 |   5 +
 arch/powerpc/lib/code-patching.c              | 348 +++++++++++++-----
 arch/powerpc/lib/feature-fixups.c             | 114 ++++--
 arch/powerpc/mm/book3s64/mmu_context.c        |   2 +
 arch/powerpc/mm/book3s64/slb.c                |  60 +--
 arch/powerpc/xmon/xmon.c                      |  22 +-
 arch/x86/include/asm/text-patching.h          |   4 +
 arch/x86/kernel/alternative.c                 |   7 +
 drivers/misc/lkdtm/core.c                     |   1 +
 drivers/misc/lkdtm/lkdtm.h                    |   1 +
 drivers/misc/lkdtm/perms.c                    | 149 ++++++++
 18 files changed, 608 insertions(+), 162 deletions(-)

--=20
2.26.1

