Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A376E753F09
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jul 2023 17:35:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VFDVUSV3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R2bCc48dpz3cDy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jul 2023 01:35:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VFDVUSV3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nayna@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R2bBk4TBxz3c4F
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jul 2023 01:34:54 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36EFMslC019583;
	Fri, 14 Jul 2023 15:34:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=I58DtO1jDAs3385q9kf+6TLixmeR40qzFKVz2joocio=;
 b=VFDVUSV3sRbheIlipEcdse5i4QwBNu0viWOase0+OZE/EPI13j4JXoS4be/rtU5/otHu
 5tKJf/Wjw9wZLlInDVSiX5K9svuehnMLuXrrTp4YaphiTg6S1zuZqnrT5aTa43AagGzx
 2aDTPl60h/KAdTca8zOOOYHOq/JCO+SE4JlsF09ArhTNyX5pw2Nplvwr82cT+nQkC79L
 pyRNtwh1+s9LjF2sHNPcN1l1jcCy62DvY/l65l+uRmE7PmF3hwCHk5d2qnlQs7ioPrYr
 eXUAAgNdO2KFuITF3KTJ+zrWG2xMgYChLR5qGFlETvrWtB9dCxsI9Q1jhXREIb1FlcH9 Dg== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ru8y1r8ap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jul 2023 15:34:47 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36ECkIJ4009989;
	Fri, 14 Jul 2023 15:34:45 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3rtpxb8bhy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jul 2023 15:34:44 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36EFYfdS43778410
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Jul 2023 15:34:41 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 556F420043;
	Fri, 14 Jul 2023 15:34:41 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 02FB920040;
	Fri, 14 Jul 2023 15:34:39 +0000 (GMT)
Received: from li-4b5937cc-25c4-11b2-a85c-cea3a66903e4.ibm.com (unknown [9.61.52.39])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Jul 2023 15:34:38 +0000 (GMT)
From: Nayna Jain <nayna@linux.ibm.com>
To: linux-integrity@vger.kernel.org
Subject: [PATCH 0/6] Enable loading local and third party keys on PowerVM guest
Date: Fri, 14 Jul 2023 11:34:29 -0400
Message-Id: <20230714153435.28155-1-nayna@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PLp-AzxDzBEvofFsHrcs_Pp1hOMLig2q
X-Proofpoint-ORIG-GUID: PLp-AzxDzBEvofFsHrcs_Pp1hOMLig2q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-14_06,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 clxscore=1011 lowpriorityscore=0 suspectscore=0
 mlxlogscore=747 phishscore=0 mlxscore=0 spamscore=0 impostorscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2307140141
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
Cc: Eric Snowberg <eric.snowberg@oracle.com>, Paul Moore <paul@paul-moore.com>, Nayna Jain <nayna@linux.ibm.com>, linux-security-module@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>, linux-kernel@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On a secure boot enabled PowerVM guest, local and third party code signing
keys are needed to verify signed applications, configuration files, and
kernel modules.

Loading these keys onto either the .secondary_trusted_keys or .ima
keyrings requires the certificates be signed by keys on the
.builtin_trusted_keys, .machine or .secondary_trusted_keys keyrings.

Keys on the .builtin_trusted_keys keyring are trusted because of the chain
of trust from secure boot up to and including the linux kernel.  Keys on
the .machine keyring that derive their trust from an entity such as a
security officer, administrator, system owner, or machine owner are said
to have "imputed trust." The type of certificates and the mechanism for
loading them onto the .machine keyring is platform dependent.

Userspace may load certificates onto the .secondary_trusted_keys or .ima
keyrings. However, keys may also need to be loaded by the kernel if they
are needed for verification in early boot time. On PowerVM guest, third
party code signing keys are loaded from the moduledb variable in the
Platform KeyStore(PKS) onto the .secondary_trusted_keys.

The purpose of this patch set is to allow loading of local and third party
code signing keys on PowerVM.

Nayna Jain (6):
  integrity: PowerVM support for loading CA keys on machine keyring
  integrity: ignore keys failing CA restrictions on non-UEFI platform
  integrity: remove global variable from machine_keyring.c
  integrity: check whether imputed trust is enabled
  integrity: PowerVM machine keyring enablement.
  integrity: PowerVM support for loading third party code signing keys

 certs/system_keyring.c                        | 22 +++++++++++++
 include/keys/system_keyring.h                 |  8 +++++
 security/integrity/Kconfig                    |  3 +-
 security/integrity/digsig.c                   |  2 +-
 security/integrity/integrity.h                |  6 ++--
 .../platform_certs/keyring_handler.c          | 18 +++++++++-
 .../platform_certs/keyring_handler.h          | 10 ++++++
 .../integrity/platform_certs/load_powerpc.c   | 33 +++++++++++++++++++
 .../platform_certs/machine_keyring.c          | 21 +++++++++---
 9 files changed, 114 insertions(+), 9 deletions(-)


base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
-- 
2.31.1
