Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8273F58C7DA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 13:50:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1ZJZ327sz3c1N
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Aug 2022 21:50:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NM2PVCnP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NM2PVCnP;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1ZHx1JqDz2xGY
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Aug 2022 21:49:48 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 278BY1Ak011491;
	Mon, 8 Aug 2022 11:49:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=TUk20v686jjVDbNCF1C6cMxuvG5lTGNKhANJW0otYCY=;
 b=NM2PVCnPmYJkCRdV/MKQ7dmGWMRO23MHpXlygQWcbAorT/rGvS16vivPvXS/dc7Wy00c
 P3yOX5thoJn87pWNDmcUlL8ZlQLSPidZPmK3sXWF0wU7O6jINGUqE7bQ/scDNqCBD5pb
 W8v5hcor6bUwzFD/wnb5Q60YpfrJclMM2P6hejEL9OYBrld4w2Sk5TTdARiYDZJmxWcl
 qkvjoS2Hmd7LROf3/F9+NTXNjfyffgJIOMs7zPnxhwZU0ZWXpmjofzjVySR45Gx3TcOD
 MLOwSdTXrWxqOHBaDmM2q9gyFPJEyap8gCrHn5bkpRw6OQoQpKi/D1deIwHqx9cq/vg6 CQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hu1qrgcsg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Aug 2022 11:49:23 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 278BYn0j018598;
	Mon, 8 Aug 2022 11:49:23 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hu1qrgcs4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Aug 2022 11:49:23 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 278BcwCc023040;
	Mon, 8 Aug 2022 11:49:21 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma04fra.de.ibm.com with ESMTP id 3hsfx8sk2k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Aug 2022 11:49:21 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 278BnIRw25952636
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Aug 2022 11:49:19 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DFB0011C054;
	Mon,  8 Aug 2022 11:49:18 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AF52311C04C;
	Mon,  8 Aug 2022 11:49:14 +0000 (GMT)
Received: from li-c3569c4c-1ef8-11b2-a85c-ee139cda3133.ibm.com.com (unknown [9.43.59.85])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon,  8 Aug 2022 11:49:14 +0000 (GMT)
From: Sathvika Vasireddy <sv@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 00/16] objtool: Enable and implement --mcount option on powerpc
Date: Mon,  8 Aug 2022 17:18:52 +0530
Message-Id: <20220808114908.240813-1-sv@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: PEwyEVFKuEEdmaqyfM3rlav85oiEHxEf
X-Proofpoint-GUID: 9ZS9fp7TodVg2Gebqr5x_xMGlE71wh4Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-08_08,2022-08-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 adultscore=0 mlxscore=0 clxscore=1011 lowpriorityscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=923 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208080057
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
Cc: peterz@infradead.org, npiggin@gmail.com, linux-kernel@vger.kernel.org, aik@ozlabs.ru, mingo@redhat.com, sv@linux.ibm.com, rostedt@goodmis.org, jpoimboe@redhat.com, naveen.n.rao@linux.vnet.ibm.com, mbenes@suse.cz, chenzhongjin@huawei.com, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patchset enables and implements objtool --mcount
option on powerpc. This applies atop powerpc/merge branch.


Christophe Leroy (4):
  objtool: Fix SEGFAULT
  objtool: Use target file endianness instead of a compiled constant
  objtool: Use target file class size instead of a compiled constant
  powerpc: Fix objtool unannotated intra-function call warnings on PPC32

Sathvika Vasireddy (12):
  powerpc: Replace unreachable() with it's builtin variant in WARN_ON()
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
 arch/powerpc/include/asm/bug.h                |  2 +-
 arch/powerpc/include/asm/linkage.h            |  4 +
 arch/powerpc/kernel/cpu_setup_6xx.S           | 26 +++--
 arch/powerpc/kernel/cpu_setup_fsl_booke.S     |  8 +-
 arch/powerpc/kernel/entry_32.S                |  8 +-
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
 45 files changed, 408 insertions(+), 105 deletions(-)
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

