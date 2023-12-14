Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF2181276A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 06:59:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YmKLz6IQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrMBR3ptCz3dV9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 16:59:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YmKLz6IQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nicholas@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrM6v5bCsz3c3n
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Dec 2023 16:56:39 +1100 (AEDT)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BE5oGtB019316;
	Thu, 14 Dec 2023 05:56:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=p9tiV4nTklswyY7I8vqjXvodsbwP2/R00p0R5CSoBKo=;
 b=YmKLz6IQyBn2CD2zXKVy0B6w3wSWN4lsaIRjwLXhhtueTwFmjJiE7yKp6GJQQ68IIpT7
 gSG6DXqU/lC3p/lPG8e4AYjKZLItvMYGcAIPw5O6OKSCeNipmR38puvJC34b20ZL+1Th
 Axhfz0ybOgpkE7RUjr7qYIjkGMAsQ++hvqznzZz4PRauugxyok1QEc9ze2N0MdYRXBOs
 0E2jR3hg71ZaHl2izZxmdc46VlyBi/y+QEaql/gi2bLOT9tUqbGuNYiB1PVNj7Siji2i
 H/L3mADXINODDDdKqKgp2a71g5z8WRIyJZqmStrVdilbZmnh01o6dc1LH5U66vIUaGTl fQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uypke6eth-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 05:56:25 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3BE5tbS8001481;
	Thu, 14 Dec 2023 05:56:25 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uypke6et6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 05:56:25 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3BE5dhOG013874;
	Thu, 14 Dec 2023 05:56:24 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3uw592dwew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 05:56:23 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3BE5uMC723593570
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Dec 2023 05:56:22 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4C99A2004B;
	Thu, 14 Dec 2023 05:56:22 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7601220043;
	Thu, 14 Dec 2023 05:56:21 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 14 Dec 2023 05:56:21 +0000 (GMT)
Received: from nicholasmvm.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 43CFD602FD;
	Thu, 14 Dec 2023 16:56:19 +1100 (AEDT)
From: Nicholas Miehlbradt <nicholas@linux.ibm.com>
To: glider@google.com, elver@google.com, dvyukov@google.com,
        akpm@linux-foundation.org, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH 00/13] kmsan: Enable on powerpc
Date: Thu, 14 Dec 2023 05:55:26 +0000
Message-Id: <20231214055539.9420-1-nicholas@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yQupUEE0NnA-p1u8dDPUOZxgnN7Q8ytt
X-Proofpoint-ORIG-GUID: Hrlr57hH7l5Uyw8vyCdTKsVIagZWLZcD
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-14_02,2023-12-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 mlxlogscore=838
 priorityscore=1501 suspectscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311290000 definitions=main-2312140035
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
Cc: iii@linux.ibm.com, linux-kernel@vger.kernel.org, Nicholas Miehlbradt <nicholas@linux.ibm.com>, linux-mm@kvack.org, kasan-dev@googlegroups.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series provides the minimal support for Kernal Memory Sanitizer on 
powerpc pseries le guests. Kernal Memory Sanitizer is a tool which detects
uses of uninitialized memory. Currently KMSAN is clang only.

The clang support for powerpc has not yet been merged, the pull request can
be found here [1].

In addition to this series, there are a number of changes required in
generic kmsan code. These changes are already on mailing lists as part of
the series implementing KMSAN for s390 [2]. This series is intended to be
rebased on top of the s390 series.

In addition, I found a bug in the rtc driver used on powerpc. I have sent
a fix to this in a seperate series [3].

With this series and the two series mentioned above, I can successfully
boot pseries le defconfig without KMSAN warnings. I have not tested other
powerpc platforms.

[1] https://github.com/llvm/llvm-project/pull/73611
[2] https://lore.kernel.org/linux-mm/20231121220155.1217090-1-iii@linux.ibm.com/
[3] https://lore.kernel.org/linux-rtc/20231129073647.2624497-1-nicholas@linux.ibm.com/

Nicholas Miehlbradt (13):
  kmsan: Export kmsan_handle_dma
  hvc: Fix use of uninitialized array in udbg_hvc_putc
  powerpc: Disable KMSAN santitization for prom_init, vdso and purgatory
  powerpc: Disable CONFIG_DCACHE_WORD_ACCESS when KMSAN is enabled
  powerpc: Unpoison buffers populated by hcalls
  powerpc/pseries/nvram: Unpoison buffer populated by rtas_call
  powerpc/kprobes: Unpoison instruction in kprobe struct
  powerpc: Unpoison pt_regs
  powerpc: Disable KMSAN checks on functions which walk the stack
  powerpc: Define KMSAN metadata address ranges for vmalloc and ioremap
  powerpc: Implement architecture specific KMSAN interface
  powerpc/string: Add KMSAN support
  powerpc: Enable KMSAN on powerpc

 arch/powerpc/Kconfig                          |  3 +-
 arch/powerpc/include/asm/book3s/64/pgtable.h  | 42 +++++++++++++++
 arch/powerpc/include/asm/interrupt.h          |  2 +
 arch/powerpc/include/asm/kmsan.h              | 51 +++++++++++++++++++
 arch/powerpc/include/asm/string.h             | 18 ++++++-
 arch/powerpc/kernel/Makefile                  |  2 +
 arch/powerpc/kernel/irq_64.c                  |  2 +
 arch/powerpc/kernel/kprobes.c                 |  2 +
 arch/powerpc/kernel/module.c                  |  2 +-
 arch/powerpc/kernel/process.c                 |  6 +--
 arch/powerpc/kernel/stacktrace.c              | 10 ++--
 arch/powerpc/kernel/vdso/Makefile             |  1 +
 arch/powerpc/lib/Makefile                     |  2 +
 arch/powerpc/lib/mem_64.S                     |  5 +-
 arch/powerpc/lib/memcpy_64.S                  |  2 +
 arch/powerpc/perf/callchain.c                 |  2 +-
 arch/powerpc/platforms/pseries/hvconsole.c    |  2 +
 arch/powerpc/platforms/pseries/nvram.c        |  4 ++
 arch/powerpc/purgatory/Makefile               |  1 +
 arch/powerpc/sysdev/xive/spapr.c              |  3 ++
 drivers/tty/hvc/hvc_vio.c                     |  2 +-
 mm/kmsan/hooks.c                              |  1 +
 .../selftests/powerpc/copyloops/asm/kmsan.h   |  0
 .../powerpc/copyloops/linux/export.h          |  1 +
 24 files changed, 152 insertions(+), 14 deletions(-)
 create mode 100644 arch/powerpc/include/asm/kmsan.h
 create mode 100644 tools/testing/selftests/powerpc/copyloops/asm/kmsan.h

-- 
2.40.1

