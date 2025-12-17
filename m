Return-Path: <linuxppc-dev+bounces-14844-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF94CCC90A1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Dec 2025 18:25:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWgfy0yDCz308P;
	Thu, 18 Dec 2025 04:25:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765992330;
	cv=none; b=YGYquDrcZDItGHKu0HBq5yb4/yExsCXmbFSyGV3Qbk3JBH9zkS9e061Crsg4Tahn5M/mkW+LUVXb9BdwrAwL35mL75DAYz6YtWZTgP+8B85QDsFmJK9zHZHh4xIHCVJ/M44hf9UQZtzwoU9KhWxYwIZXVObJGOtcOr/jAoKSwu5Sv7frDAFM/Oyb4/IQXylpDNS8SHT0N4jdAjebDtmFvqNn0WNqBI6Rw71JlY0nnFoX7eW8gbUmWA2exYOVs+tVVAvWCQbZIJZbChdK1Pn9adhR1LSehrb/ZhajtnI+r/PRzOuKJy1A/Ic8jh3P+g7K4JEmcPaEFKKnRHvpgoKGUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765992330; c=relaxed/relaxed;
	bh=zbrErzyD8vgY33IzcsfRDYNsS9W7T81XI3oOqRxzZN8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X+AXoo4sJyDoJaMqrmV6zWmkV0PE8cKuG1SlbHytNJZkpUpMk0OiXky9RSKs6iEry0ntt3vABm8GLNjYR3wPy+C6p8CQMOnRrAu0Asufk3kEjzAgg8pRfv4tsNykriOwlP9VgSjtliPH+O4u57wN+G/mmmW+xTNF08pIvUfErm6QaZ9k1jGMA7ASiyK+F7oEq/bTORVj3UQKTgNzDU+QrJkRLD6f574xMfGc6NluyOafc907K3Y2roW22JUSLYqH0Np1hiFsq5D1DHnJzjLsAPH1nHbQuLYDtY1mNtS4RbkawcXCjSxtAD5RJcd01cVb0xd+Sdiho4cMfu6liC9XjA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=s7U0OgFZ; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=s7U0OgFZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dWgfx1MWNz304l
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Dec 2025 04:25:28 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BH81FSo006963;
	Wed, 17 Dec 2025 17:25:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=zbrErzyD8vgY33IzcsfRDYNsS9W7T81XI3oOqRxzZ
	N8=; b=s7U0OgFZ0pHOh23yRYQfyFq4tZG2gsKYwQOh1mFnWVx9vLWfmslyJyzjT
	8XzRkwrn73RduKq/XFPrYwyPdw+YEtf2Zg3ficsWE4V/ybOGu3iVmhpLKESAV2K+
	YpofCxfTZGzicmhTXZujLj4ioXb+6I4XAupJtguHsIZZSDa/esbSHsXa6Klq7p87
	XRZuT0IAgyK3GWwg7FdPLx6INCGuGNgKtKdTafqpEhq6mWc/K3at0b6U3UKC0yS2
	Z9STz6zSQlmDe0DRNOLpEYxLbJw9+S38PpYO+U2V7ImbiHAAyqh7c0fZUiTbNrHr
	F5yw8yZ0Um70PaOVvr5TLFW54kZFg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0xjm5ggu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 17:25:14 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BHHOIMA001198;
	Wed, 17 Dec 2025 17:25:14 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0xjm5ggp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 17:25:14 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BHGvVkP002755;
	Wed, 17 Dec 2025 17:25:13 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4b1kfnbjwu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 17:25:13 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BHHP9ck15466814
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Dec 2025 17:25:09 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7F87B20043;
	Wed, 17 Dec 2025 17:25:09 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 86AED20040;
	Wed, 17 Dec 2025 17:25:06 +0000 (GMT)
Received: from li-fc74f8cc-3279-11b2-a85c-ef5828687581.ibm.com.com (unknown [9.124.211.226])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 17 Dec 2025 17:25:06 +0000 (GMT)
From: Srish Srinivasan <ssrish@linux.ibm.com>
To: linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, James.Bottomley@HansenPartnership.com,
        jarkko@kernel.org, zohar@linux.ibm.com, nayna@linux.ibm.com,
        rnsastry@linux.ibm.com, linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org, ssrish@linux.ibm.com
Subject: [PATCH v2 0/6] Extend "trusted" keys to support a new trust source named the PowerVM Key Wrapping Module (PKWM)
Date: Wed, 17 Dec 2025 22:54:59 +0530
Message-ID: <20251217172505.112398-1-ssrish@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: VSTkWLS8TsGeIEBy3UFTYnViii_McLn3
X-Authority-Analysis: v=2.4 cv=CLgnnBrD c=1 sm=1 tr=0 ts=6942e77b cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=OZ_REq_LgKhKeL2JI8IA:9
X-Proofpoint-GUID: GTwg7vnZ0mqCuwG581jvbKGKT43tt6L2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAwOSBTYWx0ZWRfXzqRhp8kl6o0K
 +yddQmY6uwNiq/5yIsQCGWoB40ycFrJPNJ3u/bxIUcWUETTTGF3150TSGfOLm1VqWmLk1teVcPi
 fTLG+xrp8eAsm+4lhyVKjtiHnL+qmS8U/xe5ufj8DjjEza8Q+g8lOjYAipIc6gPAbx/MApq8y7Q
 M+9y4AhqZ4FXJ90KZNfd1pKGeOYQHBI51/3CMDJzzRN+6YXxvh6IwLh1lLrb1Rz9naJIaUtlVRm
 ZjV4iMj453AlQK6LnVAMEiCGv2zYDLE78/jixvtXBqXMv/lkS70CSIcQUeDZAbW41flyMNssOu9
 p0+ouaeGQLL1J/Mwx2yQQPJqBDCC757S1D8GAcg1STYfIAOSzyC8SGsIH1F8fvoX3RdoVYiguXL
 //RN/yX++Jc99iUVPOt1VIBkVnn54Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512130009
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

Changelog:

v2:

* Patch 2:
  - Fix build warning detected by the kernel test bot

* Patch 5:
  - Use pr_debug inside dump_options
  - Replace policyhande with wrap_flags inside dump_options
  - Provide meaningful error messages with error codes

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
 arch/powerpc/include/asm/plpks.h              |  95 +--
 arch/powerpc/include/asm/secvar.h             |   1 -
 arch/powerpc/kernel/secvar-sysfs.c            |  21 +-
 arch/powerpc/platforms/pseries/Makefile       |   2 +-
 arch/powerpc/platforms/pseries/plpks-secvar.c |  29 -
 arch/powerpc/platforms/pseries/plpks-sysfs.c  |  96 +++
 arch/powerpc/platforms/pseries/plpks.c        | 689 +++++++++++++++++-
 include/keys/trusted-type.h                   |   7 +-
 include/keys/trusted_pkwm.h                   |  22 +
 security/keys/trusted-keys/Kconfig            |   8 +
 security/keys/trusted-keys/Makefile           |   2 +
 security/keys/trusted-keys/trusted_core.c     |   6 +-
 security/keys/trusted-keys/trusted_pkwm.c     | 168 +++++
 20 files changed, 1175 insertions(+), 201 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-firmware-plpks
 create mode 100644 arch/powerpc/platforms/pseries/plpks-sysfs.c
 create mode 100644 include/keys/trusted_pkwm.h
 create mode 100644 security/keys/trusted-keys/trusted_pkwm.c

-- 
2.47.3


