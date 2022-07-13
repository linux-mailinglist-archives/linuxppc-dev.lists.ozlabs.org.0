Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 542C4572A91
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jul 2022 03:00:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LjK711Xz5z3cFH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jul 2022 11:00:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PJ/orcLl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nayna@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PJ/orcLl;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LjK6K1xMhz2xn7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jul 2022 11:00:08 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26CMSJiu004304;
	Wed, 13 Jul 2022 00:59:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=IQAJVMuoMSfwgEqNXlpVnH75oYNxbUe/sEWVfNMmRww=;
 b=PJ/orcLlvZ9C8UQ8HQ4MYEtKxODg4apht6ic/Z/+lrel/kqokJMVEdMmD3R1onpIzxMK
 XipGVhU+JadW7GRKrCinn3HDKDqpaFHIqNaiLFcfKguScIrG+0HdW3dmfLXMHlNfMfny
 VfXCL2wD9LxZaDdH42GxELfIfK7gaosHvIGdqd0zRlfWNUgofFVB5Bb5Tz79kv3Wnejc
 47WVHB4FWZs+Zwn0pHLG8Woi/bD00oKc2tHBhIdXyR6V7XM31u8mMA91Y6xdTegqGWOT
 Sudv/+FFjzgwFVE5N024oy38DxCY9qhX3LDeAepVJJMEdko6pcE4MZbKSFUrj2Op2c+j +w== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h9b2fwe3m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Jul 2022 00:59:59 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26D0oAxP011412;
	Wed, 13 Jul 2022 00:59:57 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma06ams.nl.ibm.com with ESMTP id 3h70xhvvsu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Jul 2022 00:59:57 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26D0wOmO22413654
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 13 Jul 2022 00:58:24 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7C8CCA4040;
	Wed, 13 Jul 2022 00:59:54 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A1CC7A404D;
	Wed, 13 Jul 2022 00:59:52 +0000 (GMT)
Received: from li-4b5937cc-25c4-11b2-a85c-cea3a66903e4.ibm.com.com (unknown [9.211.72.27])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 13 Jul 2022 00:59:52 +0000 (GMT)
From: Nayna Jain <nayna@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/2] Provide PowerVM LPAR Platform KeyStore driver for Self Encrypting Drives
Date: Tue, 12 Jul 2022 20:59:45 -0400
Message-Id: <20220713005947.459967-1-nayna@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mnqskUK-vratPAtkS9WWzi81CYZcu6Mz
X-Proofpoint-GUID: mnqskUK-vratPAtkS9WWzi81CYZcu6Mz
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-12_14,2022-07-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 bulkscore=0 mlxscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207130000
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
Cc: Nayna Jain <nayna@linux.ibm.com>, Paul Mackerras <paulus@samba.org>, George Wilson <gcwilson@linux.ibm.com>, gjoyce@ibm.com
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

The patch series[3] is pre-requisite to build Patch 2/2. The PLPKS
driver can be built of its own.

[1]https://community.ibm.com/community/user/power/blogs/chris-engel1/2020/11/20/powervm-introduces-the-platform-keystore
[2]https://lore.kernel.org/linuxppc-dev/20220622215648.96723-1-nayna@linux.ibm.com/
[3]https://lore.kernel.org/keyrings/20220706023935.875994-1-gjoyce@linux.vnet.ibm.com/T/#mc32b51991bf825ec6f90af010998ec7cd2b9624a

Greg Joyce (1):
  powerpc/pseries: kernel interfaces to PLPKS platform driver

Nayna Jain (1):
  powerpc/pseries: define driver for Platform KeyStore

 arch/powerpc/include/asm/hvcall.h             |   9 +
 arch/powerpc/include/asm/plpks.h              |  90 ++++
 arch/powerpc/platforms/pseries/Kconfig        |  13 +
 arch/powerpc/platforms/pseries/Makefile       |   2 +
 arch/powerpc/platforms/pseries/plpks/Makefile |   8 +
 arch/powerpc/platforms/pseries/plpks/plpks.c  | 509 ++++++++++++++++++
 .../platforms/pseries/plpks/plpks_arch_ops.c  | 163 ++++++
 7 files changed, 794 insertions(+)
 create mode 100644 arch/powerpc/include/asm/plpks.h
 create mode 100644 arch/powerpc/platforms/pseries/plpks/Makefile
 create mode 100644 arch/powerpc/platforms/pseries/plpks/plpks.c
 create mode 100644 arch/powerpc/platforms/pseries/plpks/plpks_arch_ops.c

-- 
2.27.0
