Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AA077A4B1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Aug 2023 04:16:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ESS4vxLJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RNh3t3pvHz3bpd
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Aug 2023 12:16:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ESS4vxLJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nayna@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RNh3138Vjz2yGn
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Aug 2023 12:15:56 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37D1vZfq031029;
	Sun, 13 Aug 2023 02:15:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=vGVIqJM22fgvkmIvySR2/oFIP39UZOusBgcxTw+M/Z4=;
 b=ESS4vxLJryZCCp2AG1R5AEQAq8JeEBGozIuDnDMPtfYsZOV98e++/jihy/uJk0K3YFZp
 yIGMPpc3HLjikFXvVe1DbDynGkoIx+YMqD/260YeG0pRHtFZSeJRyN1LN6FDZ3+29Ozw
 FR+a6KcxKPdwFmT/p0QKo3qxtYKML/4VGjnKNECxHYuJt7WaZjeLOOHl1DFY2g/O36ft
 BEd7uMIlYN5uw34VgpErMZWXHhiQGIuErlyS3VmydmdBJWdZrPeMsDzSq9ph9NbHz26q
 oqTi48JZ+JcJm9j8jBFIxeBSimxkAlRNbhMWMY5sIrJUA0cGb77Jl/PGTdFswD0yeB4I Fw== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3senyjgamp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 13 Aug 2023 02:15:44 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37D0bHCp001082;
	Sun, 13 Aug 2023 02:15:43 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3semsxgky9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 13 Aug 2023 02:15:43 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37D2FdGW26870110
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 13 Aug 2023 02:15:39 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B9ECC20043;
	Sun, 13 Aug 2023 02:15:39 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7B5F820040;
	Sun, 13 Aug 2023 02:15:37 +0000 (GMT)
Received: from li-4b5937cc-25c4-11b2-a85c-cea3a66903e4.ibm.com (unknown [9.61.3.84])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 13 Aug 2023 02:15:37 +0000 (GMT)
From: Nayna Jain <nayna@linux.ibm.com>
To: linux-integrity@vger.kernel.org
Subject: [PATCH v3 0/6] Enable loading local and third party keys on PowerVM guest
Date: Sat, 12 Aug 2023 22:15:25 -0400
Message-Id: <20230813021531.1382815-1-nayna@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9sXxDEi_VotCrd52556Z25iwvixh-G1f
X-Proofpoint-GUID: 9sXxDEi_VotCrd52556Z25iwvixh-G1f
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-12_27,2023-08-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 malwarescore=0 mlxlogscore=886 spamscore=0 lowpriorityscore=0
 mlxscore=0 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308130016
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

Changelog:

v3:

* Included Jarkko's feedback for Patch 6/6.

v2:

* Patch 5/6: Update CA restriction to allow only key signing CA's.
* Rebase on Jarkko's master tree - https://kernel.googlesource.com/pub/scm/linux/kernel/git/jarkko/linux-tpmdd
* Tested after reverting cfa7522f280aa95 because of build failure due to
this commit.

Nayna Jain (6):
  integrity: PowerVM support for loading CA keys on machine keyring
  integrity: ignore keys failing CA restrictions on non-UEFI platform
  integrity: remove global variable from machine_keyring.c
  integrity: check whether imputed trust is enabled
  integrity: PowerVM machine keyring enablement
  integrity: PowerVM support for loading third party code signing keys

 certs/system_keyring.c                        | 30 +++++++++++++++++
 include/keys/system_keyring.h                 |  7 ++++
 security/integrity/Kconfig                    |  4 ++-
 security/integrity/digsig.c                   |  2 +-
 security/integrity/integrity.h                |  6 ++--
 .../platform_certs/keyring_handler.c          | 19 ++++++++++-
 .../platform_certs/keyring_handler.h          | 10 ++++++
 .../integrity/platform_certs/load_powerpc.c   | 33 +++++++++++++++++++
 .../platform_certs/machine_keyring.c          | 22 ++++++++++---
 9 files changed, 124 insertions(+), 9 deletions(-)

-- 
2.31.1
