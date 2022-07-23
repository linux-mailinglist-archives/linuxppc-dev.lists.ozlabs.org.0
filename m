Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F2857EF08
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Jul 2022 13:31:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lqkff2GGwz3c17
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Jul 2022 21:31:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iXrzZGUI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nayna@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iXrzZGUI;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lqkdy1jryz2ywJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Jul 2022 21:31:17 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26NAG8fH022887;
	Sat, 23 Jul 2022 11:31:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=IU+Yn9sf0V/QTj8ifD1XRXKzZ4qKTD7klpY1I/anXGw=;
 b=iXrzZGUIPIy0wxdRxe+chzMdgexTFk09TSUcTUC7arMPBKYPq+RqNUX9fKzapOtwYvBs
 0wpabaLXU59i2CZct9LsfE2Rk8n/60x3wIYERr+4q/VBRJ5kXuSKPe+MOrV+wEQ+9ulN
 TM2S7UF0cAcgHgefNswGwvn3RenQ/H+xGiiTj0X1qyUNp78slBtB2Ps+QaBSgOnlwsWq
 OoIaWKQ6wBfrkGiCeFG981stIbzCqM1oLQCLXrL5cu93hrGvRtosFI11JnN3cGz1tawX
 8EwEkFxPWTtt8Z6poxGO3mS7HNS1DxVJbnLxT4DE5ynPy5alnrf9g9rWm1gaeZd/r4RS sA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hgf30s30g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 23 Jul 2022 11:31:07 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26NBU9rl024129;
	Sat, 23 Jul 2022 11:31:06 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hgf30s2yu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 23 Jul 2022 11:31:06 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26NBTtqC016555;
	Sat, 23 Jul 2022 11:31:04 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma06fra.de.ibm.com with ESMTP id 3hg98fg4sk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 23 Jul 2022 11:31:04 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26NBV0a620906470
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 23 Jul 2022 11:31:00 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C3657A4053;
	Sat, 23 Jul 2022 11:31:00 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 38920A404D;
	Sat, 23 Jul 2022 11:30:58 +0000 (GMT)
Received: from li-4b5937cc-25c4-11b2-a85c-cea3a66903e4.ibm.com.com (unknown [9.163.18.137])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Sat, 23 Jul 2022 11:30:57 +0000 (GMT)
From: Nayna Jain <nayna@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/3] Provide PowerVM LPAR Platform KeyStore driver for Self Encrypting Drives
Date: Sat, 23 Jul 2022 07:30:45 -0400
Message-Id: <20220723113048.521744-1-nayna@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: z-7mmaOSjdo319xJrhCZR5aAdV9hToMp
X-Proofpoint-ORIG-GUID: W8F0_NjaJErfekcedJugpcnIob17GvL-
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-22_06,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 clxscore=1011 lowpriorityscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207230050
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
Cc: gjoyce@linux.vnet.ibm.com, erichte@linux.ibm.com, Nayna Jain <nayna@linux.ibm.com>, npiggin@gmail.com, muriloo@linux.ibm.com, George Wilson <gcwilson@linux.ibm.com>, bjking1@us.ibmcom
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PowerVM provides an isolated Platform KeyStore(PKS)[1] storage allocation
for each partition(LPAR) with individually managed access controls to store
sensitive information securely. The Linux Kernel can access this storage by
interfacing with the hypervisor using a new set of hypervisor calls. 

This storage can be used for multiple purposes. The current two usecases
are:

1. Guest Secure Boot on PowerVM[2]
2. Self Encrypting Drives(SED) on PowerVM[3]

Initially, the PowerVM LPAR Platform KeyStore(PLPKS) driver was defined
as part of RFC patches which included the user interface design for guest
secure boot[2]. While this interface is still in progress, the same driver
is also required for Self Encrypting Drives(SED) support. For this reason,
the driver is being split from the patchset[1] and is now separately posted
with SED arch-specific code.

This patchset provides driver for PowerVM LPAR Platform KeyStore and also
arch-specific code for SED to make use of it.

The dependency patch from patch series[3] is moved to this patchset. This
patchset now builds completely of its own.

[1]https://community.ibm.com/community/user/power/blogs/chris-engel1/2020/11/20/powervm-introduces-the-platform-keystore
[2]https://lore.kernel.org/linuxppc-dev/20220622215648.96723-1-nayna@linux.ibm.com/
[3]https://lore.kernel.org/keyrings/20220718210156.1535955-1-gjoyce@linux.vnet.ibm.com/T/#m8e7b2cbbd26ee1de711bd70967fd0124c85c479f

Changelog:

v2:

* Include feedback from Gregory Joyce, Eric Richter and Murilo Opsfelder Araújo.
* Include suggestions from Michael Ellerman.
* Moved a dependency from generic SED code to this patchset. This patchset now
builds of its own.

Greg Joyce (2):
  lib: define generic accessor functions for arch specific keystore
  powerpc/pseries: Override lib/arch_vars.c with PowerPC architecture
    specific version

Nayna Jain (1):
  powerpc/pseries: define driver for Platform KeyStore

 arch/powerpc/include/asm/hvcall.h             |  11 +
 arch/powerpc/platforms/pseries/Kconfig        |  13 +
 arch/powerpc/platforms/pseries/Makefile       |   2 +
 arch/powerpc/platforms/pseries/plpks.c        | 460 ++++++++++++++++++
 arch/powerpc/platforms/pseries/plpks.h        |  71 +++
 .../platforms/pseries/plpks_arch_ops.c        | 166 +++++++
 include/linux/arch_vars.h                     |  23 +
 lib/Makefile                                  |   2 +-
 lib/arch_vars.c                               |  25 +
 9 files changed, 772 insertions(+), 1 deletion(-)
 create mode 100644 arch/powerpc/platforms/pseries/plpks.c
 create mode 100644 arch/powerpc/platforms/pseries/plpks.h
 create mode 100644 arch/powerpc/platforms/pseries/plpks_arch_ops.c
 create mode 100644 include/linux/arch_vars.h
 create mode 100644 lib/arch_vars.c

-- 
2.27.0
