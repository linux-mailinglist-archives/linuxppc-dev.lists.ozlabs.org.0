Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B598C5F45
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 04:49:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BSMIwB9t;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VfHkK2vQZz3dX1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 12:49:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BSMIwB9t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VfHdj0Mcgz30V5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2024 12:45:28 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44F2V2Lb030769;
	Wed, 15 May 2024 02:45:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=Isc8/ZHMSjFWRbtYxvoJ0Vuko1sRvwwZIgbBtZbhMs8=;
 b=BSMIwB9tDU3EiATItQjMu20q6P6NNHI9RB+Qj/3rCMBKOj5XpJ6LU3IE9PH/8o3/vxOS
 +l4Juy8j5H+C1pf2rYiVH6GAYPvC7DTzhF9YtrHt4Xo4aaBKB891TvoW8RLRwdDClqhT
 +t4lVmxIjOqcgrOilFwx4p4NGZbIlxasiinj7VlCIHiVFiHM+FsLt1TGEI0C5Po4iash
 K3d/qYB13WQdI5WAFgNK4rOvO/l4fZQd5UavitAsSxwkyWgiemLahoRKI3BNKQPOk0uo
 LFt+/vsDKZ8VGXyN6j0aKPIepggN/Dl5JnjMyg9Xu50q8RN9fpLUP+bbZbex+TIZp3/O kA== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y4kus82ey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 02:45:16 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44F0YtpP018819;
	Wed, 15 May 2024 02:45:15 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3y2k0th8pa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 02:45:15 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44F2jC5c50397668
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 May 2024 02:45:14 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EFE2620043;
	Wed, 15 May 2024 02:45:11 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7B74A2004D;
	Wed, 15 May 2024 02:45:11 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 15 May 2024 02:45:11 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 24350600AF;
	Wed, 15 May 2024 12:45:08 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 0/5] Add generic data patching functions
Date: Wed, 15 May 2024 12:44:40 +1000
Message-ID: <20240515024445.236364-1-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.45.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: DbuqpVLKaYXZ4kUZGMnv6OLothjdLPGa
X-Proofpoint-GUID: DbuqpVLKaYXZ4kUZGMnv6OLothjdLPGa
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-14_16,2024-05-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=745 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405150017
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
Cc: Naveen N Rao <naveen@kernel.org>, Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently patch_instruction() bases the write length on the value being
written. If the value looks like a prefixed instruction it writes 8 bytes,
otherwise it writes 4 bytes. This makes it potentially buggy to use for
writing arbitrary data, as if you want to write 4 bytes but it decides to
write 8 bytes it may clobber the following memory or be unaligned and
trigger an oops if it tries to cross a page boundary.

To solve this, this series pulls out the size parameter to the 'top' of
the memory patching logic, and propagates it through the various functions.

The two sizes supported are int and long; this allows for patching
instructions and pointers on both ppc32 and ppc64. On ppc32 these are the
same size, so care is taken to only use the size parameter on static
functions, so the compiler can optimise it out entirely. Unfortunately
GCC trips over its own feet here and won't optimise in a way that is
optimal for strict RWX (mpc85xx_smp_defconfig) and no RWX
(pmac32_defconfig). More details in the v2 cover letter.

Changes from v3:
  * Improved the boot test. Now that alignment is enforced,
    it checks the word (but not doubleword) aligned patch_ulong().

Changes from v2:
  * Various changes noted on each patch
  * Data patching now enforced to be aligned
  * Restore page aligned flushing optimisation

Changes from v1:
  * Addressed the v1 review actions
  * Removed noinline (for now)

v3: https://patchwork.ozlabs.org/project/linuxppc-dev/cover/20240325055302.876434-1-bgray@linux.ibm.com/
v2: https://patchwork.ozlabs.org/project/linuxppc-dev/cover/20231016050147.115686-1-bgray@linux.ibm.com/
v1: https://patchwork.ozlabs.org/project/linuxppc-dev/cover/20230207015643.590684-1-bgray@linux.ibm.com/

Benjamin Gray (5):
  powerpc/code-patching: Add generic memory patching
  powerpc/code-patching: Add data patch alignment check
  powerpc/64: Convert patch_instruction() to patch_u32()
  powerpc/32: Convert patch_instruction() to patch_uint()
  powerpc/code-patching: Add boot selftest for data patching

 arch/powerpc/include/asm/code-patching.h | 37 +++++++++++++
 arch/powerpc/kernel/module_64.c          |  5 +-
 arch/powerpc/kernel/static_call.c        |  2 +-
 arch/powerpc/lib/code-patching.c         | 70 +++++++++++++++++++-----
 arch/powerpc/lib/test-code-patching.c    | 41 ++++++++++++++
 arch/powerpc/platforms/powermac/smp.c    |  2 +-
 6 files changed, 137 insertions(+), 20 deletions(-)

--
2.45.0

