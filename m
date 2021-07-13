Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E903C69BC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jul 2021 07:32:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GP8RP4N70z3bwZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jul 2021 15:32:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PPS/JH2w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=cmr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PPS/JH2w; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GP8Py3cVVz2yNr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jul 2021 15:31:34 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16D53Xcs119592; Tue, 13 Jul 2021 01:31:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=Lf9D+3VqKK3yQhoMeH46CzO12HlEy2F6BDlCX9G5ZlA=;
 b=PPS/JH2wCw7ahqe1Nz8RStHYv2jPF4bAdF68DV3RsijwU+XKc8br8eNsHMH5e501askG
 g/A7d6qUwFPJSq166Lfy4pgwXyxSJnJo75lk9Lqmq6QpKNzW+nz6v96GNsfmdEqgZG7n
 4bvLTP3j8Ped/CJfOSgX6n15vD7YyiGAf/S7waFaMU66h25nhM5/zqqyea5GNxzAINat
 MrcAzq2uu3ngbmf167lgwxuTOB4/vlljin3eae+JyRtCgvGRIvW1AhwzSMPl12WMANIl
 AhEMS7QYMPVZ2IQXlvnMSSOCyJlKlFrneZBs2sVPMmCWyurjlmvG3HdOzX6EcQN2Gdml EQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qrud7rvc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jul 2021 01:31:19 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16D54TZ8122661;
 Tue, 13 Jul 2021 01:31:19 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39qrud7rv3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jul 2021 01:31:19 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16D5SQhB018314;
 Tue, 13 Jul 2021 05:31:18 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma04wdc.us.ibm.com with ESMTP id 39q36aythj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jul 2021 05:31:18 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16D5VH8e17105288
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Jul 2021 05:31:17 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C57F6A05A;
 Tue, 13 Jul 2021 05:31:17 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 452BB6A05D;
 Tue, 13 Jul 2021 05:31:17 +0000 (GMT)
Received: from oc8246131445.ibm.com (unknown [9.163.19.100])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with SMTP;
 Tue, 13 Jul 2021 05:31:17 +0000 (GMT)
Received: from oc8246131445.ibm.com (localhost.localdomain [127.0.0.1])
 by oc8246131445.ibm.com (Postfix) with ESMTP id D328EBC01E8;
 Tue, 13 Jul 2021 00:31:14 -0500 (CDT)
From: "Christopher M. Riedl" <cmr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 0/8] Use per-CPU temporary mappings for patching on Radix
 MMU
Date: Tue, 13 Jul 2021 00:31:05 -0500
Message-Id: <20210713053113.4632-1-cmr@linux.ibm.com>
X-Mailer: git-send-email 2.26.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BH6e7bgZnFUeI6o9A10KastAAs-J5xjd
X-Proofpoint-ORIG-GUID: QoiMYoLjfRd8kw1j4S0zW1nZeym6GneZ
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-13_03:2021-07-13,
 2021-07-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 impostorscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107130022
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
Cc: keescook@chromium.org, peterz@infradead.org, x86@kernel.org,
 npiggin@gmail.com, linux-hardening@vger.kernel.org, tglx@linutronix.de,
 dja@axtens.net
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

x86 introduced "temporary mm" structs which allow the creation of mappings
local to a particular CPU [1]. This series intends to bring the notion of a
temporary mm to powerpc's Book3s64 Radix MMU and harden it by using such a
mapping for patching a kernel with strict RWX permissions.

The first four patches implement an LKDTM test "proof-of-concept" which
exploits the potential vulnerability (ie. the temporary mapping during patc=
hing
is exposed in the kernel page tables and accessible by other CPUs) using a
simple brute-force approach. This test is implemented for both powerpc and
x86_64. The test passes on powerpc Radix with this new series, fails on
upstream powerpc, passes on upstream x86_64, and fails on an older (ancient)
x86_64 tree without the x86_64 temporary mm patches. The remaining patches =
add
support for and use a temporary mm for code patching on powerpc with the Ra=
dix
MMU.

Tested boot, ftrace, and repeated LKDTM "hijack":
	- QEMU+KVM (host: POWER9 Blackbird): Radix MMU w/ KUAP
	- QEMU+KVM (host: POWER9 Blackbird): Hash MMU

Tested repeated LKDTM "hijack":
	- QEMU+KVM (host: AMD desktop): x86_64 upstream
	- QEMU+KVM (host: AMD desktop): x86_64 w/o percpu temp mm to
	  verify the LKDTM "hijack" test fails

Tested boot and ftrace:
	- QEMU+TCG: ppc44x (bamboo)
	- QEMU+TCG: g5 (mac99)

I also tested with various extra config options enabled as suggested in
section 12) in Documentation/process/submit-checklist.rst.

v5:	* Only support Book3s64 Radix MMU for now. There are some issues with
	  the previous implementation on the Hash MMU as pointed out by Nick
	  Piggin. Fixing these is not trivial so we only support the Radix MMU
	  for now. I tried using realmode (no data translation) to patch with
	  Hash to at least avoid exposing the patch mapping to other CPUs but
	  this doesn't reliably work either since we cannot access vmalloc'd
	  space in realmode.
	* Use percpu variables for the patching_mm and patching_addr. This
	  avoids the need for synchronization mechanisms entirely. Thanks to
	  Peter Zijlstra for pointing out text_mutex which unfortunately didn't
	  work out without larger code changes in powerpc. Also thanks to Daniel
	  Axtens for comments about using percpu variables for the *percpu* temp
	  mm things off list.

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

Christopher M. Riedl (8):
  powerpc: Add LKDTM accessor for patching addr
  lkdtm/powerpc: Add test to hijack a patch mapping
  x86_64: Add LKDTM accessor for patching addr
  lkdtm/x86_64: Add test to hijack a patch mapping
  powerpc/64s: Introduce temporary mm for Radix MMU
  powerpc: Rework and improve STRICT_KERNEL_RWX patching
  powerpc/64s: Initialize and use a temporary mm for patching on Radix
  lkdtm/powerpc: Fix code patching hijack test

 arch/powerpc/include/asm/code-patching.h |   4 +
 arch/powerpc/include/asm/debug.h         |   1 +
 arch/powerpc/kernel/process.c            |   5 +
 arch/powerpc/lib/code-patching.c         | 240 ++++++++++++++++++++---
 arch/x86/include/asm/text-patching.h     |   4 +
 arch/x86/kernel/alternative.c            |   7 +
 drivers/misc/lkdtm/core.c                |   1 +
 drivers/misc/lkdtm/lkdtm.h               |   1 +
 drivers/misc/lkdtm/perms.c               | 143 ++++++++++++++
 9 files changed, 378 insertions(+), 28 deletions(-)

--=20
2.26.1

