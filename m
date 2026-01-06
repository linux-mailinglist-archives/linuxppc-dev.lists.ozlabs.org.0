Return-Path: <linuxppc-dev+bounces-15331-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36008CF8F5E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 06 Jan 2026 16:06:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlvcy4rVHz2y7c;
	Wed, 07 Jan 2026 02:06:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767711970;
	cv=none; b=LBTZuBVqi+7DrzJnRd4ZycGGqPHufGRP4sQ7A12A+aa+IArdOId3sstLO9jSLNASF4BCWWgP9RNdBNZuhTAHGb8+g/1VYQ1XyPIEnJ5hCImcuVp3diJgOBFtjVD8GN6Ac4ncaQsok4NcL5Nb3yz8+7T1a0hVurfDh7EgiaSgP8MOaGvKRY4Qv3/05K1V4oYInezSyiC5jYq3Ue7oiE7y3/oHZq7CVfW1l4jY5g0K4nLsFJoPDTlXbAzKVOoloviSFv5QzDJgVK4oNEoBaDDeRQ5UnEOs/lwbxW/0Icb0Ag3/lyUmeXvN5lXqhuwiAN3oao4f+toBe5PnilRFQKguUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767711970; c=relaxed/relaxed;
	bh=vvQxvzdALaNoTcRXA43iBSBkEvL8WBfIjYgZg3+HCqY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lvLh9NgrRaShWRAuFQztd/G+bThZbOwxt0AYC/GsSun/VEpXaMrrMFKnnSvaOZFayL7ql0SoLPsZBDbCSw+Ic85I6vrkEi2/HdfrSbWcQFcoPu5yz/y0/25vOpjaCsCnk3COGS+6f4EsEoll5zS0fuR2uDhHj7IPtiIgRFxyCpm4cDiVcxKwsmY39YOzT6CtFwgni+tjVVM5qqeQst/bqyXgI1cYmql5ON5x6uQr2gEN6to8hCLwVkgAs6meZo4DBN8JusWRJN7qu6rm9AwFRGD4HmTcGMzrYMYaDdThjHxWDGnd9EyslyfHTqvOg4mXVOkwAhum6o0iV5rbAkEUYw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T3P8c5+p; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T3P8c5+p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlvcw6m7Mz2xHt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 02:06:08 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 6062o3nw008176;
	Tue, 6 Jan 2026 15:05:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=vvQxvzdALaNoTcRXA43iBSBkEvL8WBfIjYgZg3+HC
	qY=; b=T3P8c5+ptXMXjj17T584OtfNqWUCIxhG2qFqpxWjpO55q1smUTum+vf+R
	XIG4IkOO0tyre8BafQ+3t+nA2V6VQ9pWypUxUDQi9aQsRjvGYT591oegRsQS8+SG
	1dmeMvwpX1aSYMfk37C2RUP+1lMV+pnwcK3kiBOiwf6sgfo5tciVXNOpblx08Vfo
	WGGB+pmU/Qg/4WWClQqTT6+vVxFri3eiI7N/t3eRDIYZNQ9ubBHOqPGJD05h356/
	hb+lBkb9YXNFEnir34hVfYzVYg7nb9WIe1tZgnI/NnT8qW18gpY3VJ36o6bZkTi9
	cs5BuMfMxFCzSMXQN0TbPNgFjlOaw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4betu64egh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 15:05:50 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 606EktWG005577;
	Tue, 6 Jan 2026 15:05:49 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4betu64egb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 15:05:49 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 606E2eKX012568;
	Tue, 6 Jan 2026 15:05:48 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bffnjbsdn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 15:05:48 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 606F5iqq29557290
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 Jan 2026 15:05:44 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8F4982004B;
	Tue,  6 Jan 2026 15:05:44 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EF54920043;
	Tue,  6 Jan 2026 15:05:38 +0000 (GMT)
Received: from li-fc74f8cc-3279-11b2-a85c-ef5828687581.ibm.com.com (unknown [9.124.214.6])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  6 Jan 2026 15:05:38 +0000 (GMT)
From: Srish Srinivasan <ssrish@linux.ibm.com>
To: linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, James.Bottomley@HansenPartnership.com,
        jarkko@kernel.org, zohar@linux.ibm.com, nayna@linux.ibm.com,
        rnsastry@linux.ibm.com, linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org, ssrish@linux.ibm.com
Subject: [PATCH v3 0/6] Extend "trusted" keys to support a new trust source named the PowerVM Key Wrapping Module (PKWM)
Date: Tue,  6 Jan 2026 20:35:21 +0530
Message-ID: <20260106150527.446525-1-ssrish@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=QbNrf8bv c=1 sm=1 tr=0 ts=695d24ce cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=OZ_REq_LgKhKeL2JI8IA:9
X-Proofpoint-ORIG-GUID: LyoG4O0jbdFpX98YisciC3xY3c1zqgcc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDEyOSBTYWx0ZWRfX3Adgp+0ZTHtk
 XOlH0BNjBRhaGpYaCP8fslkRT6a8Vy5T29SlHr1yvwheviswkxGpGwVQGQ9huD/z2jnxqjnFLtu
 +ApOtJQxn7hxXHAgyLAkOg9ScmrFMtkp9iRdxA6QysMV/4MGnbJ08rAPvyQNqR3VAyYdZLfk+wo
 hlrc7mMb0ILX2cV+SufqVdsM7A3gouctJ+200RF03bp3KjZL2tcA9PkzrKCBmJ9gIWZ3VRDbsOk
 xcqz8Mo1oZ87GOxfX2oHZxOEHvuGRInBLrjFl5zNJ9hXdKFMZYE2LRNs579hKJrY8hrOND3e9Tj
 e97IT0F6bZP8/wsn0/VhEhMMT+eBbY48UBEalP3mOk1QVawhXOzPhTJa2NAshYmMfeBjSl31nN9
 NPhrokfwDhhdEVuebaG/+xHAuTU8uFHAIIh4UXnyu1w32Hh1KjcR14b4Ky4+RHLilcqculPVoGV
 IJ1oP8cD9OauiIBN3DA==
X-Proofpoint-GUID: m0jYxwn5KFnRnvN0OBJex72hGD80EMTQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601060129
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
patches: one fixing the kernel-doc inconsistencies in the PLPKS code and
another reorganizing PLPKS config variables in the sysfs.

Changelog:

v3:

* Patch 2:
  - Add Mimi's Reviewed-by tag

* Patch 4:
  - Minor tweaks to some print statements
  - Fix typos

* Patch 5:
  - Fix typos
  - Add Mimi's Reviewed-by tag

* Patch 6:
  - Add Mimi's Reviewed-by tag


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
 arch/powerpc/platforms/pseries/plpks.c        | 686 +++++++++++++++++-
 include/keys/trusted-type.h                   |   7 +-
 include/keys/trusted_pkwm.h                   |  22 +
 security/keys/trusted-keys/Kconfig            |   8 +
 security/keys/trusted-keys/Makefile           |   2 +
 security/keys/trusted-keys/trusted_core.c     |   6 +-
 security/keys/trusted-keys/trusted_pkwm.c     | 168 +++++
 20 files changed, 1172 insertions(+), 201 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-firmware-plpks
 create mode 100644 arch/powerpc/platforms/pseries/plpks-sysfs.c
 create mode 100644 include/keys/trusted_pkwm.h
 create mode 100644 security/keys/trusted-keys/trusted_pkwm.c

-- 
2.47.3


