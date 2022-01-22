Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A10374968F7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jan 2022 01:57:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgdBt4VkTz30Mn
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jan 2022 11:57:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KUPHG5TL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nayna@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KUPHG5TL; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgdB55J1dz2ymt
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jan 2022 11:57:01 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20LL5gAE013827; 
 Sat, 22 Jan 2022 00:56:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=s/JXOWKByKkIT9+XKOfqX5/U2DNopOrY8Pl+/w9acnA=;
 b=KUPHG5TL/P9dlZ1TRPoBYtDoPZpnf8TVt+j0SQ3JpYtX2GlVopYPHHhshYAOnjiEDvsp
 49wDzYfqGja+YBK2dt9Aeullo89N+NuWb9qsdqaCX5KP0+b3u5b73ddTTvnT0NuLTL9U
 K4/0PnESP5aFDFGhEFXiUUkAcGP0Mi7cc3H8CGrHvjJ1mo0cwlM9RhbUGLrfpocPWOel
 +fA/idSF6rwBkTrYHE3XJGMRXudDx5isQkSFYJrC01ghwni1/xlewpLEp4Arw017N4bT
 kIK7LJaXQggMsUe4QZhs+DnLLqXvl6v6CV7073j6RSS40ZewMCgLnxcVBhExquwzfJ8A GQ== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dr1w3xm5u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 22 Jan 2022 00:56:52 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20M0WW35002286;
 Sat, 22 Jan 2022 00:56:49 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04fra.de.ibm.com with ESMTP id 3dqj1k89mb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 22 Jan 2022 00:56:49 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 20M0lLlM38797646
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 22 Jan 2022 00:47:21 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6236BA4055;
 Sat, 22 Jan 2022 00:56:46 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 25083A4053;
 Sat, 22 Jan 2022 00:56:44 +0000 (GMT)
Received: from li-4b5937cc-25c4-11b2-a85c-cea3a66903e4.ibm.com.com (unknown
 [9.211.59.92]) by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat, 22 Jan 2022 00:56:43 +0000 (GMT)
From: Nayna Jain <nayna@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 0/2] powerpc/pseries: add support for local secure storage
 called Platform Keystore(PKS) 
Date: Fri, 21 Jan 2022 19:56:35 -0500
Message-Id: <20220122005637.28199-1-nayna@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: O4D5XP9l9J-q0IX33lPXhlnkhDgUmuJS
X-Proofpoint-ORIG-GUID: O4D5XP9l9J-q0IX33lPXhlnkhDgUmuJS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-21_10,2022-01-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 mlxscore=0 clxscore=1011 priorityscore=1501 malwarescore=0 mlxlogscore=770
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201220001
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
Cc: Nayna Jain <nayna@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Douglas Miller <dougmill@linux.vnet.ibm.com>,
 Greg KH <gregkh@linuxfoundation.org>, George Wilson <gcwilson@linux.ibm.com>,
 gjoyce@ibm.com, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PowerVM provides an isolated Platform Keystore(PKS) storage allocation
for each partition with individually managed access controls to store
sensitive information securely. Linux Kernel can access this storage by
interfacing with hypervisor using a new set of hypervisor calls. 

PowerVM guest secure boot intend to use Platform Keystore for the
purpose of storing public keys. Secure boot requires public keys to
be able to verify the grub and boot kernel. To allow authenticated
 manipulation of keys, it supports variables to store key authorities
- PK/KEK and code signing keys - db. It also supports denied list to
disallow booting even if signed with valid key. This is done via
denied list database - dbx or sbat. These variables would be stored in
PKS, and are managed and controlled by firmware.

The purpose of this patchset is to add support for users to
read/write/add/delete variables required for secure boot on PowerVM.

Nayna Jain (2):
  pseries: define driver for Platform Keystore
  pseries: define sysfs interface to expose PKS variables

 Documentation/ABI/testing/sysfs-pksvar        |  77 +++
 arch/powerpc/include/asm/hvcall.h             |  13 +-
 arch/powerpc/include/asm/pks.h                |  84 +++
 arch/powerpc/platforms/pseries/Kconfig        |  17 +
 arch/powerpc/platforms/pseries/Makefile       |   2 +
 arch/powerpc/platforms/pseries/pks.c          | 494 ++++++++++++++++++
 arch/powerpc/platforms/pseries/pksvar-sysfs.c | 356 +++++++++++++
 7 files changed, 1042 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-pksvar
 create mode 100644 arch/powerpc/include/asm/pks.h
 create mode 100644 arch/powerpc/platforms/pseries/pks.c
 create mode 100644 arch/powerpc/platforms/pseries/pksvar-sysfs.c

-- 
2.27.0
