Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 909A45A42AC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 07:54:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGKPv3SNdz2xGf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 15:54:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DJiHn9+t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DJiHn9+t;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGKNd4wNsz30Bl
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 15:53:05 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27T5lDUX013184;
	Mon, 29 Aug 2022 05:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Uo8tbwp7ij90nFvjChZAfRVufnJKWWQeztKyXEiiz+U=;
 b=DJiHn9+tHEWVF65CclwnEQL5+dveFSoRsY3i336z42P6ZiUI5flMJzwhkM6QoY1ysAse
 8HFD+43dMkNvoY7VblBkirl1TUMLyc5UmsVdUkjoxrrLGJBuWkWjuPX4iMh+JdNvxUL3
 GAm5hhuQl1WuKkvHQJlZ9PWNP1IVBoACyN0ExAKHmWdlRulz7xHSOpzKuCjxaH4JgYku
 dxwCS9yMZtN0NThL4pzdYeIrjKCTvN5QPDlLCFrD13EShOCAMMXZiJ7hJHyQkW/tbPKa
 LENwXxuiouU3DmKol6ypPX6ZsxfpYeyR88v1kaGsO1cm91clEVBSPOQmV9BbE+e4qKdS bw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j8qm702aq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 05:52:36 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27T5leXc014448;
	Mon, 29 Aug 2022 05:52:36 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j8qm702a5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 05:52:35 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27T5puPM009536;
	Mon, 29 Aug 2022 05:52:34 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma01fra.de.ibm.com with ESMTP id 3j8hka86x8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 05:52:33 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27T5qV4k42271146
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Aug 2022 05:52:31 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 929E54C046;
	Mon, 29 Aug 2022 05:52:31 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AD0B84C040;
	Mon, 29 Aug 2022 05:52:27 +0000 (GMT)
Received: from li-c3569c4c-1ef8-11b2-a85c-ee139cda3133.ibm.com.com (unknown [9.43.67.34])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 29 Aug 2022 05:52:27 +0000 (GMT)
From: Sathvika Vasireddy <sv@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 00/16] objtool: Enable and implement --mcount option on powerpc
Date: Mon, 29 Aug 2022 11:22:07 +0530
Message-Id: <20220829055223.24767-1-sv@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: e4ZwkF20jI6M2zVyrPhE58K0VvzxXEfb
X-Proofpoint-GUID: nm5AHvrHtI9w8Si6VHMFK0pXKSbcEQuY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-29_02,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 clxscore=1011 adultscore=0
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208290026
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
  powerpc: Replace unreachable() with it's builtin variant in __WARN_FLAGS()
  powerpc: override __ALIGN() and __ALIGN_STR() macros
  powerpc: Fix objtool unannotated intra-function call warnings
  powerpc: curb objtool unannotated intra-function call warnings
  powerpc: Skip objtool from running on drivers/crypto/vmx/aesp8-ppc.o
  powerpc: Skip objtool from running on VDSO files
  objtool: Add --mnop as an option to --mcount
  objtool: Read special sections with alts only when specific options are selected
  objtool: Use macros to define arch specific reloc types
  objtool: Add arch specific function arch_ftrace_match()
  objtool/powerpc: Enable objtool to be built on ppc
  objtool/powerpc: Add --mcount specific implementation

 Makefile                                      |  4 +-
 arch/powerpc/Kconfig                          |  2 +
 arch/powerpc/include/asm/asm.h                |  7 ++
 arch/powerpc/include/asm/bug.h                |  3 +-
 arch/powerpc/include/asm/linkage.h            |  4 +
 arch/powerpc/kernel/cpu_setup_6xx.S           | 26 +++--
 arch/powerpc/kernel/cpu_setup_fsl_booke.S     |  8 +-
 arch/powerpc/kernel/entry_32.S                |  9 +-
 arch/powerpc/kernel/entry_64.S                |  2 +
 arch/powerpc/kernel/exceptions-64s.S          |  7 +-
 arch/powerpc/kernel/head_40x.S                |  5 +-
 arch/powerpc/kernel/head_64.S                 |  7 +-
 arch/powerpc/kernel/head_8xx.S                |  5 +-
 arch/powerpc/kernel/head_book3s_32.S          | 29 ++++--
 arch/powerpc/kernel/head_fsl_booke.S          |  5 +-
 arch/powerpc/kernel/misc_64.S                 |  4 +-
 arch/powerpc/kernel/swsusp_32.S               |  5 +-
 arch/powerpc/kernel/vdso/Makefile             |  2 +
 arch/powerpc/kernel/vector.S                  |  4 +-
 arch/powerpc/kvm/book3s_hv_interrupts.S       |  4 +-
 arch/powerpc/kvm/book3s_hv_rmhandlers.S       | 25 +++--
 arch/powerpc/kvm/fpu.S                        | 17 +++-
 arch/powerpc/platforms/52xx/lite5200_sleep.S  | 15 ++-
 arch/x86/Kconfig                              |  1 +
 drivers/crypto/vmx/Makefile                   |  2 +
 scripts/Makefile.lib                          |  1 +
 tools/objtool/arch/powerpc/Build              |  2 +
 tools/objtool/arch/powerpc/decode.c           | 96 +++++++++++++++++++
 .../arch/powerpc/include/arch/cfi_regs.h      | 11 +++
 tools/objtool/arch/powerpc/include/arch/elf.h | 10 ++
 .../arch/powerpc/include/arch/special.h       | 21 ++++
 tools/objtool/arch/powerpc/special.c          | 19 ++++
 tools/objtool/arch/x86/decode.c               |  8 ++
 tools/objtool/arch/x86/include/arch/elf.h     |  2 +
 .../arch/x86/include/arch/endianness.h        |  9 --
 tools/objtool/builtin-check.c                 | 14 +++
 tools/objtool/check.c                         | 51 +++++-----
 tools/objtool/elf.c                           |  8 +-
 tools/objtool/include/objtool/arch.h          |  2 +
 tools/objtool/include/objtool/builtin.h       |  1 +
 tools/objtool/include/objtool/elf.h           |  8 ++
 tools/objtool/include/objtool/endianness.h    | 32 +++----
 tools/objtool/orc_dump.c                      | 11 ++-
 tools/objtool/orc_gen.c                       |  4 +-
 tools/objtool/special.c                       |  3 +-
 45 files changed, 409 insertions(+), 106 deletions(-)
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

