Return-Path: <linuxppc-dev+bounces-15823-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2ACDD244CA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 12:49:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsLqP4TY9z309H;
	Thu, 15 Jan 2026 22:49:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768477745;
	cv=none; b=JdX7qZuIa+km2new+B0O/DlJh0BqfWGaSPuR4vDX40mX7m7zGaimqqSH7dyd7QD6ivXU5M1awhs1z4LwlipMwurHeZV/c/Vgx76fKP6cCWxtZDCKIBppgGOt79opvgD0n8fG5sKjBKLr4lrJQPXgAO2TuwUG3MiZ2z9xyuHfYo6oQzlcBDYnmqHq20jftDdy32kbPpDph7+dr7jP2dBGaGtvCsg71ZWL9AxGNBNe61EfCOXS923GS/dF851zrk9abaFl+Ybe4dw8gwDh+HgqwrMzcw7tAeGDSq7Khg2gfbud0dfyZpvyXqS3Tb6SF3wC8911uVqzy0TF4ByNCDqo4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768477745; c=relaxed/relaxed;
	bh=zw3RNzTf8ZEZ4GK4PnAvN6VD64jHR2draWK89mhqRjo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h48ZhVcffDVIA9GVY7rvbk5MuZEENBBY2SmvMk1GMc+Wk/5IjllEUqop04Xfu1M+l6grWvFaKD+Ph6989hHA4QCV0p89yyp3Q0L6tSs55lXjGFONvsCswO79WjCaGxCH0hLcRrNNtDgOuD/QQJ9R9lbCpHZW7Jj0GZihQ12XMWuG/pp0gPmx+h/VTgn+T0g6mIK8hxFPiylHL5TKXWKmT2uwUS3FMttkQ5MLt5arf7Y1yMCsQ9CJo9hQ0tDX8PBeUI+76m7pQIxM+13HoGvJQ1FEzAHH/4mwTHmocbgn5vUR2ZlGAQf7QovjWkMVM7isUS4mQWvLcEGOwhI+5E80/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sGM43jFs; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sGM43jFs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsLqN4p9Qz2xNg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 22:49:04 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60EKZ2Yj026447;
	Thu, 15 Jan 2026 10:05:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=zw3RNzTf8ZEZ4GK4PnAvN6VD64jHR2draWK89mhqR
	jo=; b=sGM43jFs0t+HkZ++dy3ev/Mhol985NR3SmmQi3g37fTaM0HBzvR/yHAyA
	hA8cvNmWP3U8SrAplHoJ9wDSDFvi8XJV/rbeyAi9u/kVu09uHlmEzlXtv19Tac1m
	4rsK/L9F+WwEbI2yBmJqb9xkm49aj5DyuXYCH2haYpNK9dZiN5DSNKrHp+CnvrFO
	cZL/NjUeQmmj4WHz4CTIztJqDIvFeSrMBWFVl/nEGshuXTM22CL1kxD+MirJvRy4
	0+DmYbiUuIKp1VfFSwcPrnLfHiyZ6kzFncC4pJVABt5kkvBaxgFRaQTDFk0DL7qp
	afk8fLg87TDidQGhwb5bVh7TdktbQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bpja4jgue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 10:05:14 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60FA5DRI029258;
	Thu, 15 Jan 2026 10:05:13 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bpja4jgu9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 10:05:13 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60F70Yup014278;
	Thu, 15 Jan 2026 10:05:12 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4bm1fyfdw9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 10:05:12 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60FA58bN49742248
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jan 2026 10:05:08 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6E8932005A;
	Thu, 15 Jan 2026 10:05:08 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 68AA12004F;
	Thu, 15 Jan 2026 10:05:05 +0000 (GMT)
Received: from li-fc74f8cc-3279-11b2-a85c-ef5828687581.ibm.com.com (unknown [9.39.20.65])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Jan 2026 10:05:05 +0000 (GMT)
From: Srish Srinivasan <ssrish@linux.ibm.com>
To: linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, James.Bottomley@HansenPartnership.com,
        jarkko@kernel.org, zohar@linux.ibm.com, nayna@linux.ibm.com,
        rnsastry@linux.ibm.com, linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org, ssrish@linux.ibm.com
Subject: [PATCH v4 0/6] Extend "trusted" keys to support a new trust source named the PowerVM Key Wrapping Module (PKWM)
Date: Thu, 15 Jan 2026 15:34:58 +0530
Message-ID: <20260115100504.488665-1-ssrish@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2OSBTYWx0ZWRfX0RYfisU5zVQa
 9L/h45kd3Ge6OlMYkOG2pmWAXuDTz26xGRiBnqXoPPcrw9SutrwfG9q6VpXRREI9xi+GYXhdlq1
 ZEttYIiZofUGxnFb4SC2gbsX8y0DjWkGR7hpFaa4/a4IjGv0ptipbfeyPpxt3oYSwXcQxa/XVuj
 sES0zNiflDc2pc/vdRFCJ+AJDv6o/LVYWMr82p5vVNJPf8eRJX8CWMMOdJj9NKreh3YMohACWuV
 iN62e7IOfgYvC5cmWVzzkLhVjtGP8ANHLo7NY2xJBOa+TB7qHJk0Y0SvulNeeErIoJnyGvRe8G5
 6xIR3eWwYTynmHlCK1gCsQOnWHARjvV1jRgnEeqOSMiAYZ0pToM01G36PGMcNzvP8ETPkjYfhN3
 FiZMM9I7SyfrivcoUGsct26wGYed5CKZybiA8UaQKe12tR4ZPgjfkFqDhDa9ahggowk2niwNAZs
 sZdCD7E6hER73qM2RIA==
X-Proofpoint-ORIG-GUID: TLld1wJ-8Kll4ddUEhnKxX9C8zZoy-W_
X-Proofpoint-GUID: t8YVpfRAYQd8Xq7X95_E-UhA9n24MeMt
X-Authority-Analysis: v=2.4 cv=U4afzOru c=1 sm=1 tr=0 ts=6968bbda cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=OZ_REq_LgKhKeL2JI8IA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601150069
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

v4:

* Patch 5:
  - Add a per-backend private data pointer in trusted_key_options
    to store a pointer to the backend-specific options structure
  - Minor clean-up

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
 include/keys/trusted_pkwm.h                   |  33 +
 security/keys/trusted-keys/Kconfig            |   8 +
 security/keys/trusted-keys/Makefile           |   2 +
 security/keys/trusted-keys/trusted_core.c     |   6 +-
 security/keys/trusted-keys/trusted_pkwm.c     | 190 +++++
 20 files changed, 1205 insertions(+), 201 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-firmware-plpks
 create mode 100644 arch/powerpc/platforms/pseries/plpks-sysfs.c
 create mode 100644 include/keys/trusted_pkwm.h
 create mode 100644 security/keys/trusted-keys/trusted_pkwm.c

-- 
2.47.3


