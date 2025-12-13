Return-Path: <linuxppc-dev+bounces-14733-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A14CBA514
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Dec 2025 06:26:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dSvvY56W1z2xg9;
	Sat, 13 Dec 2025 16:26:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765603609;
	cv=none; b=m6kMjSAP+s4bEOhNK8H3wYrlhZUo36fAi/G5HFnfkyTSXaB3EKOTCJ+k7Fd8jknEr5KwPLT6y1Wlsw7n3cvGSpnch14b9zNivm9FlVQk1cbZRJllB7OkalcT1oLfV7ajnQPPfYNyawfTX5D2rNz//0TBaMpgKpDdvKliSdhI4zMIXZea9ajPtOu+fjwK8lIPbO7WFStwajXz+mgZtkeYEeiKBDatz75IlK34XlCg0nFtac06XTQf4WBHM8kShJVUM5logoAD24gxnQypZ9++qOHz4W/m0ROJI0cjBuG35izpK6bnsqgIDz+QgCzpjOczoMA2nIO07tmvn4vXihB7fg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765603609; c=relaxed/relaxed;
	bh=hC+xmJPIWb8X/HMtQf21luCV8wFrtta7B2S0Hvx4xIk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dCQaxB6xertDgk6Y2MESLTN+KPmmRxbg/rIZSS0k42IX3acPgqcWGvssDyOqA6bf4qxJXc0qcLcVxWBCptMg9TAK4pY29gU4Q9ylZNnR9iyINkcpG+VmllpxUnZo6qWNliB+GtO9AjNFxaqnBGFqhQx0m3rqWVFfrWtHHp9LDc371yvlcBkvZ50Cwh7p4P9x8aTybnCyBHMwiS/c2JcUGgLaqQLQt+9utgE4+Zb3oAorkmxbXkUE7oc4w0ckYXjVUpb/KqMzMC55WhqAoGq0NQgRyIBlKjzvRhL3k/EVViqZe/Z5jPRaiQ5WA8s7VaE9kPYYPowJLcCk4NArWrb8MQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a/qTinQ0; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a/qTinQ0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dSvvX1zXCz2xKh
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Dec 2025 16:26:47 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BD2ubxp030817;
	Sat, 13 Dec 2025 05:26:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=hC+xmJPIWb8X/HMtQf21luCV8wFrtta7B2S0Hvx4x
	Ik=; b=a/qTinQ07aEfbHS3WyTECIVV3sh8lMgBTdmjEjoqTZHCMjFfc+RqYhCHh
	oUlPzD/+ySEVBXm6j2np5pA8/496W0aGEXzwIadpW7lGx5WklrkWbCM8q2B/al1Y
	EjejuwW4cQWcsbdgbgUKSua2ApLavuSL9XWvVZ+jG4HgYJTLioeqHGTgzfXmitiK
	R0r1Wy1Rj/JN52K04G0NBACYZ6LzuxDCf3UJS+oCueg3Kui19oocw4gOwJnQTvze
	YZTHSRQX68UHDgkndr+PZhbux4FuqVoFDEEDDnPO6o5Ce6To8wte+7wyrtjuonoC
	X2yww9tOGfr/lRV7+PojZa2L9m8Mg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yt10a72-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Dec 2025 05:26:27 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BD5QR9W031668;
	Sat, 13 Dec 2025 05:26:27 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yt10a6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Dec 2025 05:26:27 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BD5A3X1028099;
	Sat, 13 Dec 2025 05:26:26 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4avy6yfrw9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Dec 2025 05:26:26 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BD5QM6331326478
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 13 Dec 2025 05:26:22 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4835620043;
	Sat, 13 Dec 2025 05:26:22 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5155220040;
	Sat, 13 Dec 2025 05:26:19 +0000 (GMT)
Received: from li-fc74f8cc-3279-11b2-a85c-ef5828687581.ibm.com.com (unknown [9.124.210.103])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 13 Dec 2025 05:26:19 +0000 (GMT)
From: Srish Srinivasan <ssrish@linux.ibm.com>
To: linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, James.Bottomley@HansenPartnership.com,
        jarkko@kernel.org, zohar@linux.ibm.com, nayna@linux.ibm.com,
        rnsastry@linux.ibm.com, linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org, ssrish@linux.ibm.com
Subject: [PATCH 0/6] Extend "trusted" keys to support a new trust source named the PowerVM Key Wrapping Module (PKWM)
Date: Sat, 13 Dec 2025 10:56:12 +0530
Message-ID: <20251213052618.190691-1-ssrish@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Lr0wqaDc8ngCyOE6es5bTd-_ETW5MLI7
X-Proofpoint-ORIG-GUID: FdINwmkDj81hgEySl_98ke3Y3jaR-MGR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAyMyBTYWx0ZWRfXxpzT2CfuAhlf
 t9+i5GCwynZzCUyeuxgXh9+fiTyC0sot9SJdaGPtBttwUUt5BbZQcrTllU2WX5cd4VOxIu9g0G4
 GbKK3oSwl2WUu8P3OXfwhP2uUTUltk6cWkTqWrmQZ+Q5nwvBgL6FToJnqmiIe7hat2OKbryr7gs
 miValsvT1BcZLt+27fT1ZkOOam5m/21jqKYZ8aU4vS14loeeSD6Szi5Iy1MWeKOnb8ntR4djSe4
 GSz+O/qMtjYJhoyhUoazDJBhtq4hMK0vQEH6xFM9EhDDHlUym1mMeKXkGc2T0QqJYCZas4jfuSR
 fiJwlesglK34Vy2lOIKVw7CnQPyiDWDRonGJgh9tEV4FUNJXnGdFsMdqgMqHbhYAEsxZONJyJr5
 EABh8ixgmMljdcPTM/EZVICcd1otcQ==
X-Authority-Analysis: v=2.4 cv=L/MQguT8 c=1 sm=1 tr=0 ts=693cf903 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=OZ_REq_LgKhKeL2JI8IA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_07,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1011 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512130023
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Power11 has introduced a feature called the PowerVM Key Wrapping Module
(PKWM), where PowerVM in combination with Power LPAR Platform KeyStore
(PLPKS) [1] supports a new feature called "Key Wrapping" [2] to protect
user secrets by wrapping them using a hypervisor generated wrapping key.
This wrapping key is an AES-GCM-256 symmetric key that is stored as an
object in the PLPKS. It has policy based protections that prevents it from
being read out or exposed to the user. This wrapping key can then be used
by the OS to wrap or unwrap secrets via hypervisor calls.

This patchset intends to add the PKWM, which is a combination of IBM
PowerVM and PLPKS, as a new trust source for trusted keys. The wrapping key
does not exist by default and its generation is requested by the kernel at
the time of PKWM initialization. This key is then persisted by the PKWM and
is used for wrapping any kernel provided key, and is never exposed to the
user. The kernel is aware of only the label to this wrapping key.

Along with the PKWM implementation, this patchset includes two preparatory
patches: one fixing the kernel-doc incosistencies in the PLPKS code and
another reorganizing PLPKS config variables in the sysfs.

Nayna Jain (1):
  docs: trusted-encryped: add PKWM as a new trust source

Srish Srinivasan (5):
  pseries/plpks: fix kernel-doc comment inconsistencies
  powerpc/pseries: move the PLPKS config inside its own sysfs directory
  pseries/plpks: expose PowerVM wrapping features via the sysfs
  pseries/plpks: add HCALLs for PowerVM Key Wrapping Module
  keys/trusted_keys: establish PKWM as a trusted source

 .../ABI/testing/sysfs-firmware-plpks          |  58 ++
 Documentation/ABI/testing/sysfs-secvar        |  65 --
 .../admin-guide/kernel-parameters.txt         |   1 +
 Documentation/arch/powerpc/papr_hcalls.rst    |  43 ++
 .../security/keys/trusted-encrypted.rst       |  50 ++
 MAINTAINERS                                   |   9 +
 arch/powerpc/include/asm/hvcall.h             |   4 +-
 arch/powerpc/include/asm/plpks.h              |  94 +--
 arch/powerpc/include/asm/secvar.h             |   1 -
 arch/powerpc/kernel/secvar-sysfs.c            |  21 +-
 arch/powerpc/platforms/pseries/Makefile       |   2 +-
 arch/powerpc/platforms/pseries/plpks-secvar.c |  29 -
 arch/powerpc/platforms/pseries/plpks-sysfs.c  |  96 +++
 arch/powerpc/platforms/pseries/plpks.c        | 689 +++++++++++++++++-
 include/keys/trusted-type.h                   |   7 +-
 include/keys/trusted_pkwm.h                   |  30 +
 security/keys/trusted-keys/Kconfig            |   8 +
 security/keys/trusted-keys/Makefile           |   2 +
 security/keys/trusted-keys/trusted_core.c     |   6 +-
 security/keys/trusted-keys/trusted_pkwm.c     | 168 +++++
 20 files changed, 1182 insertions(+), 201 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-firmware-plpks
 create mode 100644 arch/powerpc/platforms/pseries/plpks-sysfs.c
 create mode 100644 include/keys/trusted_pkwm.h
 create mode 100644 security/keys/trusted-keys/trusted_pkwm.c

-- 
2.47.3


