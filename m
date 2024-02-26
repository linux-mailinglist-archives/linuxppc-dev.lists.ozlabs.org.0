Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AAF86715E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 11:38:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SzwyDB/r;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tjxsx036gz86kw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 21:38:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SzwyDB/r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tjxjz54zZz3wWj
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 21:31:35 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41Q9JLf3018413;
	Mon, 26 Feb 2024 10:31:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=le4LCgrgl0rQAQk2X8xwPeGpze2aZA5cLCkLShXKXyo=;
 b=SzwyDB/rjwukVAMs8+qo23oDKO17zsG+Aj96YibLhgzof29rVjCRBwt6wt/RisC44t4A
 e3igHRR12L1uEzq3/yrlNMUoAmVmvOssZGsQR+39SyVZ+DsNcOxJGuLhppZ0OCjdAtoR
 VGkyo6LDfrCfM0CPg8sekNqE6O6mR5/63G4suv8s7BarF0p0r/T0SE6iwvBrlkGF0oHq
 IWv8+HmYnHJKOUfivo5cjxnu8FbsFLJG/2Q8EHiGz+qD5UsafSAmKKGbgZbDVrlD8VNz
 zDC1lrBQsok6scnj3nLW+zEowvVhYhaB626ik4SmDJD7cU11pPGvJ2Gr89DaWEXlD8Ld Jw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wg0bh5atn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 10:31:24 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41QAVEJZ006271;
	Mon, 26 Feb 2024 10:31:20 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wg0bh5adx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 10:31:20 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41Q95gUl008147;
	Mon, 26 Feb 2024 10:30:20 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3wfv9m08q1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Feb 2024 10:30:20 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41QAUEUr13435474
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Feb 2024 10:30:16 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7746D20063;
	Mon, 26 Feb 2024 10:30:14 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 061DD20040;
	Mon, 26 Feb 2024 10:30:12 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.in.ibm.com (unknown [9.203.115.195])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 26 Feb 2024 10:30:11 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Kexec-ml <kexec@lists.infradead.org>
Subject: [PATCH linux-next v2 0/3] powerpc/kexec: split CONFIG_CRASH_DUMP out from CONFIG_KEXEC_CORE
Date: Mon, 26 Feb 2024 16:00:07 +0530
Message-ID: <20240226103010.589537-1-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.43.2
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: nTwYa3cQ1v0eiyh8TCyR0naNdMplF2k2
X-Proofpoint-GUID: edVtaD2Y3it8A-0l1Pshl5wXE-nEVdPN
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_07,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311290000 definitions=main-2402260079
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
Cc: Baoquan He <bhe@redhat.com>, lkml <linux-kernel@vger.kernel.org>, Sourabh Jain <sourabhjain@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Dave Young <dyoung@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch series is a follow-up to [1] based on discussions at [2]
about additional work needed to get it working on powerpc.

The first patch in the series makes struct crash_mem available with or
without CONFIG_CRASH_DUMP enabled. The next patch moves kdump specific
code for kexec_file_load syscall under CONFIG_CRASH_DUMP and the last
patch splits other kdump specific code under CONFIG_CRASH_DUMP and
removes dependency with CONFIG_CRASH_DUMP for CONFIG_KEXEC_CORE.

[1] https://lore.kernel.org/all/20240124051254.67105-1-bhe@redhat.com/
[2] https://lore.kernel.org/all/9101bb07-70f1-476c-bec9-ec67e9899744@linux.ibm.com/

Changes in v2:
* Fixed a compile error for POWERNV build reported by Sourabh.

Hari Bathini (3):
  kexec/kdump: make struct crash_mem available without CONFIG_CRASH_DUMP
  powerpc/kexec: split CONFIG_KEXEC_FILE and CONFIG_CRASH_DUMP
  powerpc/kdump: Split KEXEC_CORE and CRASH_DUMP dependency

 arch/powerpc/Kconfig                 |   9 +-
 arch/powerpc/include/asm/kexec.h     |  98 +++++-----
 arch/powerpc/kernel/prom.c           |   2 +-
 arch/powerpc/kernel/setup-common.c   |   2 +-
 arch/powerpc/kernel/smp.c            |   4 +-
 arch/powerpc/kexec/Makefile          |   3 +-
 arch/powerpc/kexec/core.c            |   4 +
 arch/powerpc/kexec/elf_64.c          |   4 +-
 arch/powerpc/kexec/file_load_64.c    | 269 ++++++++++++++-------------
 arch/powerpc/platforms/powernv/smp.c |   2 +-
 include/linux/crash_core.h           |  12 +-
 11 files changed, 209 insertions(+), 200 deletions(-)

-- 
2.43.2

