Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B953E55A0D3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 20:33:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LV5Nt53nSz3chk
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jun 2022 04:33:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SS2BCWIR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SS2BCWIR;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LV5NC4wMSz3c8C
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jun 2022 04:33:14 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25OISPOk021758;
	Fri, 24 Jun 2022 18:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=2wfk190q+ucGa1bxRl14HbuInEjbHi8Z7qWK+amEbW8=;
 b=SS2BCWIR1SdWo/Y3SOFIMqEZe2aT8y0gMK97P5nMpQYOhtl2/ZmTxnlDU12fdmiodNED
 Us5d/rhHunpO8PCI0cvfwjzZLRZrtUFu3238KAEl80kvIz59yaPXpnLlheqTsWnSnZET
 QrfShQo778R/Dvl4uBFwXHu+LaAv4sZZj8plRGnV6ZaZT2ba4KYDI3BeEdDArV1HkBer
 UhlKdbb9DU37muURsMs15f01vpGA09kvTR0AuDEeL6KNMmEluWsiBhW17korMYwNO/BH
 +8dwP1hyzQtiSIHLeQ5pK+TmAeiPg8yc/46IT1cVxNXQiM/NdcF2eCY3zkcSMAz0OExh pA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gwjjyg3sg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jun 2022 18:32:52 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25OIT8n1023347;
	Fri, 24 Jun 2022 18:32:52 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gwjjyg3rf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jun 2022 18:32:51 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25OIK9Su028808;
	Fri, 24 Jun 2022 18:32:49 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma04ams.nl.ibm.com with ESMTP id 3gs6b99em9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jun 2022 18:32:49 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25OIWlsW24445238
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Jun 2022 18:32:47 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4F7BA5205A;
	Fri, 24 Jun 2022 18:32:47 +0000 (GMT)
Received: from li-c3569c4c-1ef8-11b2-a85c-ee139cda3133.ibm.com.com (unknown [9.43.0.85])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 93E215204F;
	Fri, 24 Jun 2022 18:32:43 +0000 (GMT)
From: Sathvika Vasireddy <sv@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH v3 00/12] objtool: Enable and implement --mcount option on powerpc
Date: Sat, 25 Jun 2022 00:02:26 +0530
Message-Id: <20220624183238.388144-1-sv@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: n5KLxoTJPPjbqK9T3h3xuF9Q7auLKtWg
X-Proofpoint-GUID: gv8p70PRW3JKTiB3TSG9XKeyBmzbjB3Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-24_08,2022-06-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=735 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0
 mlxscore=0 impostorscore=0 adultscore=0 clxscore=1011 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206240070
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
Cc: peterz@infradead.org, linux-kernel@vger.kernel.org, aik@ozlabs.ru, mingo@redhat.com, sv@linux.ibm.com, rostedt@goodmis.org, jpoimboe@redhat.com, paulus@samba.org, naveen.n.rao@linux.vnet.ibm.com, mbenes@suse.cz
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These patches are rebased on top of objtool/core
branch of the tip tree, and are tested on
ppc64le with ppc64le_defconfig.

Christophe Leroy (3):
  objtool: Fix SEGFAULT
  objtool: Use target file endianness instead of a compiled constant
  objtool: Use target file class size instead of a compiled constant

Sathvika Vasireddy(9):
  objtool: Add --mnop as an option to --mcount
  powerpc: Skip objtool from running on VDSO files
  objtool: Read special sections with alts only when specific options are selected
  objtool: Use macros to define arch specific reloc types
  objtool: Add arch specific function arch_ftrace_match()
  objtool/powerpc: Enable objtool to be built on ppc
  objtool/powerpc: Add --mcount specific implementation
  powerpc: Remove unreachable() from WARN_ON()
  objtool/powerpc: Fix unannotated intra-function call warnings

 Makefile                                      |  4 +-
 arch/powerpc/Kconfig                          |  2 +
 arch/powerpc/include/asm/bug.h                |  1 -
 arch/powerpc/kernel/entry_64.S                |  2 +
 arch/powerpc/kernel/exceptions-64s.S          |  7 +-
 arch/powerpc/kernel/head_64.S                 |  7 +-
 arch/powerpc/kernel/misc_64.S                 |  4 +-
 arch/powerpc/kernel/vdso/Makefile             |  2 +
 arch/powerpc/kernel/vector.S                  |  4 +-
 arch/powerpc/kvm/book3s_hv_interrupts.S       |  4 +-
 arch/powerpc/kvm/book3s_hv_rmhandlers.S       | 25 +++--
 arch/x86/Kconfig                              |  1 +
 scripts/Makefile.build                        |  1 +
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
 32 files changed, 305 insertions(+), 71 deletions(-)
 create mode 100644 tools/objtool/arch/powerpc/Build
 create mode 100644 tools/objtool/arch/powerpc/decode.c
 create mode 100644 tools/objtool/arch/powerpc/include/arch/cfi_regs.h
 create mode 100644 tools/objtool/arch/powerpc/include/arch/elf.h
 create mode 100644 tools/objtool/arch/powerpc/include/arch/special.h
 create mode 100644 tools/objtool/arch/powerpc/special.c
 delete mode 100644 tools/objtool/arch/x86/include/arch/endianness.h

-- 
2.25.1

