Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DE45B55DD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 10:21:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MR01x2b7kz3c2L
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 18:21:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VJQTfmJk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VJQTfmJk;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MR00n1WMYz30M8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 18:20:56 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28C7BG79037693;
	Mon, 12 Sep 2022 08:20:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=cb+UoFqw3wk74sENZx0JziB3/sfP2sFHoWZ65QxhDzA=;
 b=VJQTfmJkRcSuRD4i4Z87ircxIQy9OXMPBE1Ug2ZSEqDTtpSF0gUPr1iKctrGm5LSP5Rj
 uTaT6PykV6ZY0Lr4Z+h+icFCGfCJRCzXiqrVbMxT3KAmN2Mb6DgF92G9gEf5Yzdaqa3z
 m328l1fPrQXyIRNqYWVP2soyNTQVZPi9OJA8eBMmMY23Q0htvL+r9u8tY33dHua43EfB
 YxwJgwkCcHDDc3Rv5yeekNMjcCfbF0lJ64Ra7D6SXezSwjvr18g5UoSLucfly8oNaGV4
 a3sDk18/rmHeNjpl1xjSZqisoH0TqCoXvSM89C2CVsBo/NPijOOdeXc1aC9enLVjrUBY 0A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jhxdj55m5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Sep 2022 08:20:35 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28C5qkLn038555;
	Mon, 12 Sep 2022 08:20:34 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jhxdj55ju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Sep 2022 08:20:34 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28C86YHV002764;
	Mon, 12 Sep 2022 08:20:31 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma01fra.de.ibm.com with ESMTP id 3jgj78sh1v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Sep 2022 08:20:31 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28C8KTVx30147042
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Sep 2022 08:20:29 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 46E24A4040;
	Mon, 12 Sep 2022 08:20:29 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A63A0A4051;
	Mon, 12 Sep 2022 08:20:24 +0000 (GMT)
Received: from li-c3569c4c-1ef8-11b2-a85c-ee139cda3133.ibm.com.com (unknown [9.43.91.220])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 12 Sep 2022 08:20:24 +0000 (GMT)
From: Sathvika Vasireddy <sv@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 00/16] objtool: Enable and implement --mcount option on powerpc
Date: Mon, 12 Sep 2022 13:50:04 +0530
Message-Id: <20220912082020.226755-1-sv@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jAQErej-Crb9RxS6isTRf0dcNoodkm4w
X-Proofpoint-GUID: BvWwWq6yM0W5AGErR9G4e1Qwfbb9VmfU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-12_04,2022-09-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209120027
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
Cc: peterz@infradead.org, npiggin@gmail.com, linux-kernel@vger.kernel.org, aik@ozlabs.ru, mingo@redhat.com, sv@linux.ibm.com, rostedt@goodmis.org, jpoimboe@redhat.com, naveen.n.rao@linux.vnet.ibm.com, mbenes@suse.cz, chenzhongjin@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patchset enables and implements objtool --mcount
option on powerpc. This applies atop powerpc/merge branch.

Changelog:

v3:

* Patch 01/16 - Rework patch subject.
	      -	Rework changelog.
	      - Add Reviewed-by tag from Christophe Leroy.

* Patch 02/16 - Rework changelog to update details based on feedback
 		from Nicholas Piggin and Michael Ellerman.
	      - Use quotes instead of __stringify macro, based on
		suggestion from Christophe Leroy.

* Patch 03/16 - Add Reviewed-by tag from Christophe Leroy.
	      - Based on Christophe's suggestion, keep all <linux/...>
	        before <asm/...>.
	      - Rework changelog.

* Patch 04/16 - Add Reviewed-by tag from Christophe Leroy.

* Patch 05/16 - Add Reviewed-by tag from Christophe Leroy.

* Patch 06/16 - No change. 

* Patch 07/16 - Add Reviewed-by tag from Christophe Leroy.

* Patch 08/16 - Add Acked-by tag from Peter Zijlstra.

* Patch 09/16 - Add Acked-by tag from Peter Zijlstra.

* Patch 10/16 - Reorder local variable declarations to use reverse
		xmas tree format. 
	      - Add Signed-off-by tag from Sathvika Vasireddy indicating
	        changes done.
	      - Add Acked-by tag from Peter Zijlstra.

* Patch 11/16 - Update changelog to indicate that powerpc kernel does
		not support nop'ed out ftrace locations. 
	      - Add Acked-by tag from Peter Zijlstra.
	      - Add Reviewed-by tag from Christophe Leroy.

* Patch 12/16 - Per Christophe's comment, rework changelog. 

* Patch 13/16 - Add Acked-by tag from Peter Zijlstra.
              - Add Reviewed-by tag from Christophe Leroy.

* Patch 14/16 - Simplify arch_ftrace_match() function, based on
 		Christophe's suggestion. 
              - Add Reviewed-by tag from Christophe Leroy. 

* Patch 15/16 - Include code from Christophe Leroy to use local vars for
 		type and imm, and to adapt len for prefixed
		instructions.

* Patch 16/16 - Based on suggestion from Christophe Leroy, setup
                immediate value calculation outside the check for
                specific instruction under case 18. 
	      - Set instruction type to INSN_CALL for 'bla'
	        instruction as well.
		
v2:

* Change subject of patch 01/16
* As suggested by Christophe Leroy, add barrier_before_unreachable()
before __builtin_unreachable() to work around a gcc problem.
* Fix issues reported by Kernel Test Robot.
* Include suggestions from Christophe Leroy, and change commit 
messages for patches 01/16, 02/16, 03/16, 05/16.

Christophe Leroy (4):
  objtool: Fix SEGFAULT
  objtool: Use target file endianness instead of a compiled constant
  objtool: Use target file class size instead of a compiled constant
  powerpc: Fix objtool unannotated intra-function call warnings on PPC32

Sathvika Vasireddy (12):
  powerpc: Fix __WARN_FLAGS() for use with Objtool
  powerpc: Override __ALIGN and __ALIGN_STR macros
  powerpc: Fix objtool unannotated intra-function call warnings
  powerpc: Curb objtool unannotated intra-function warnings
  powerpc: Skip objtool from running on drivers/crypto/vmx/aesp8-ppc.o
  powerpc: Skip objtool from running on VDSO files
  objtool: Add --mnop as an option to --mcount
  objtool: Read special sections with alts only when specific options are selected
  objtool: Use macros to define arch specific reloc types
  objtool: Add arch specific function arch_ftrace_match()
  objtool/powerpc: Enable objtool to be built on ppc
  objtool/powerpc: Add --mcount specific implementation

 Makefile                                      |   4 +-
 arch/powerpc/Kconfig                          |   2 +
 arch/powerpc/include/asm/asm.h                |   7 ++
 arch/powerpc/include/asm/bug.h                |   3 +-
 arch/powerpc/include/asm/linkage.h            |   3 +
 arch/powerpc/kernel/cpu_setup_6xx.S           |  26 +++--
 arch/powerpc/kernel/cpu_setup_fsl_booke.S     |   8 +-
 arch/powerpc/kernel/entry_32.S                |   9 +-
 arch/powerpc/kernel/entry_64.S                |   2 +
 arch/powerpc/kernel/exceptions-64s.S          |   7 +-
 arch/powerpc/kernel/head_40x.S                |   5 +-
 arch/powerpc/kernel/head_64.S                 |   7 +-
 arch/powerpc/kernel/head_8xx.S                |   5 +-
 arch/powerpc/kernel/head_book3s_32.S          |  29 +++--
 arch/powerpc/kernel/head_fsl_booke.S          |   5 +-
 arch/powerpc/kernel/misc_64.S                 |   4 +-
 arch/powerpc/kernel/swsusp_32.S               |   5 +-
 arch/powerpc/kernel/vdso/Makefile             |   2 +
 arch/powerpc/kernel/vector.S                  |   4 +-
 arch/powerpc/kvm/book3s_hv_interrupts.S       |   4 +-
 arch/powerpc/kvm/book3s_hv_rmhandlers.S       |  25 +++--
 arch/powerpc/kvm/fpu.S                        |  17 ++-
 arch/powerpc/platforms/52xx/lite5200_sleep.S  |  15 ++-
 arch/x86/Kconfig                              |   1 +
 drivers/crypto/vmx/Makefile                   |   2 +
 scripts/Makefile.lib                          |   1 +
 tools/objtool/arch/powerpc/Build              |   2 +
 tools/objtool/arch/powerpc/decode.c           | 101 ++++++++++++++++++
 .../arch/powerpc/include/arch/cfi_regs.h      |  11 ++
 tools/objtool/arch/powerpc/include/arch/elf.h |  10 ++
 .../arch/powerpc/include/arch/special.h       |  21 ++++
 tools/objtool/arch/powerpc/special.c          |  19 ++++
 tools/objtool/arch/x86/decode.c               |   5 +
 tools/objtool/arch/x86/include/arch/elf.h     |   2 +
 .../arch/x86/include/arch/endianness.h        |   9 --
 tools/objtool/builtin-check.c                 |  14 +++
 tools/objtool/check.c                         |  53 ++++-----
 tools/objtool/elf.c                           |   8 +-
 tools/objtool/include/objtool/arch.h          |   2 +
 tools/objtool/include/objtool/builtin.h       |   1 +
 tools/objtool/include/objtool/elf.h           |   8 ++
 tools/objtool/include/objtool/endianness.h    |  32 +++---
 tools/objtool/orc_dump.c                      |  11 +-
 tools/objtool/orc_gen.c                       |   4 +-
 tools/objtool/special.c                       |   3 +-
 45 files changed, 411 insertions(+), 107 deletions(-)
 create mode 100644 arch/powerpc/include/asm/asm.h
 create mode 100644 tools/objtool/arch/powerpc/Build
 create mode 100644 tools/objtool/arch/powerpc/decode.c
 create mode 100644 tools/objtool/arch/powerpc/include/arch/cfi_regs.h
 create mode 100644 tools/objtool/arch/powerpc/include/arch/elf.h
 create mode 100644 tools/objtool/arch/powerpc/include/arch/special.h
 create mode 100644 tools/objtool/arch/powerpc/special.c
 delete mode 100644 tools/objtool/arch/x86/include/arch/endianness.h

-- 
2.31.1

