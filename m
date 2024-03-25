Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 840A5888F97
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 06:55:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jewSYilH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V32GW27kMz3vZr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 16:55:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jewSYilH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V32DB6RbYz3bmy
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 16:53:30 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42P4n78N030583;
	Mon, 25 Mar 2024 05:53:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=lvO36qrqT/VmUMDroJ7DEWVM9olAPhNKuh9EW4AxxzA=;
 b=jewSYilHfybD3bJsNxwiKJ6UP0tghXVM3SKfHViaXgpJIcl31RS7p7pU+usIDFsLUZzo
 JtZBJM7TAVUnHNVROTTpkoe0cub8OExpN+q+yhVxH0pMW3qPLN2ktffdp41dDoamhNzg
 GCoQwmby3WTvMAABPzC+UGnKHzgpMhyhxv2Lk0WDG1hh9QZA1u1Q5W117I83cgRSxR7W
 tpLAbSOlCMyYvtaRzCmIk2vNMJOqXO9RIBfOt1ODHHqUdhVwmSgag+tg4j7FWMUH6Bn0
 Y/EmcSn0xiQ9cNeTfd/jMc2FPisguJ2bGjVo47eKBpu+M5aFFbtFSv9nxUVsnoBIQ2uR nQ== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x2hh69h34-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 05:53:20 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42P3giYF011233;
	Mon, 25 Mar 2024 05:53:19 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3x2bmkpq1m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 05:53:19 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42P5rFUR45154774
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Mar 2024 05:53:17 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 79B8D2004F;
	Mon, 25 Mar 2024 05:53:15 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0DCF120040;
	Mon, 25 Mar 2024 05:53:15 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 25 Mar 2024 05:53:15 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id BFB15600B1;
	Mon, 25 Mar 2024 16:53:12 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 0/5] Add generic data patching functions
Date: Mon, 25 Mar 2024 16:52:57 +1100
Message-ID: <20240325055302.876434-1-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3INOg9850mC_cKAhzb3tnqpNanjrKWoL
X-Proofpoint-GUID: 3INOg9850mC_cKAhzb3tnqpNanjrKWoL
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-25_03,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=726 spamscore=0
 phishscore=0 clxscore=1011 impostorscore=0 suspectscore=0 malwarescore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2403210000 definitions=main-2403250030
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

Changes from v2:
  * Various changes noted on each patch
  * Data patching now enforced to be aligned
  * Restore page aligned flushing optimisation

Changes from v1:
  * Addressed the v1 review actions
  * Removed noinline (for now)

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
 arch/powerpc/lib/test-code-patching.c    | 36 ++++++++++++
 arch/powerpc/platforms/powermac/smp.c    |  2 +-
 6 files changed, 132 insertions(+), 20 deletions(-)

--
2.44.0

