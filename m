Return-Path: <linuxppc-dev+bounces-14739-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CB9CBA559
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Dec 2025 06:27:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dSvvp3bDLz2yQH;
	Sat, 13 Dec 2025 16:27:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765603622;
	cv=none; b=fa2JfCyXE1CnUh6GvX16SIzhuJnJFxcygkABVA9phUllyg7AGYr0ejZFjeFucgy6GgCAbZDr1N0twlym+sRZV6mocLghD47mHrEbodbz8W2iSoZ3tLFvl7ghf8T7CVC0lZzVeU6GU6SrNd+DA8DQmS6skSa1k2wBBlwtBeLXvAClmjdyTI33AX4ckHjH0ey4n8wj0uzZ/u+/pRDwIfi+1Tmra7mpPKwS+0gde3fe5B/a3ld+MU9azmnT7HSy9lwRYlmGy6pC1VU+qWy/0sbGn7KLyaHGT7QCuTKyoQ4E20k0KLPbQ4dibmA5SFNGJXMbGV6hFyCQRRM0ElG7R/PGXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765603622; c=relaxed/relaxed;
	bh=Bkv9uUW89YkDzEWaHv1ObgoIXGJD2YqlGrw2O8ISsIM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c+4rk6sTUJa6C/C4ngXpYgLhILp1u/Qt1Q3clgqfyjDwAOxYZ9lnkvoCEzhVcOmAqolr3vDS1H9K6luqjXke6aq9NRxLCdwVfzONxCU88D22yDYRwUiQmWZGGZsXxeCTnu96ub9AOx+bT16liqzv/azg8m/Vm+2I8/SQXeW6MB3uiiapeTOWFJCIVZFPDT2yuu0Qr7z3mPSgnMq9eKiIZHD+x0CkewflMyUmBp0jr0UhWm+xbDt/aYYym3RT/ngMv399ie0Lv0NVDqxEZ1WnHFNIRwEmOB0NgsFGtqPTFs21Ywk2HeqSEpdAr/ax8Z+bu89zXspPkmop/ICGSa+M5g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Fo4mbAu6; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Fo4mbAu6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dSvvn3bQ0z2yFk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Dec 2025 16:27:01 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BD2xxSC002057;
	Sat, 13 Dec 2025 05:26:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=Bkv9uUW89YkDzEWaH
	v1ObgoIXGJD2YqlGrw2O8ISsIM=; b=Fo4mbAu6jbdpK1UzhDHBocO6XGEuc373b
	Nt3YqIFcT5gaxIZwwOcMtcPfoAp6UuQLmAp8lVe/10RY5BW7Er86xokZ+iSz29WY
	1R9GqfgCntnJR2yGx1UhZflmZZrB4CFa9x/nAXlidkuxczMFwtK1greddR7FNxMv
	J54vIPJH9/0AK9l5UcnIVLfHQJMXaqUTukOgJoHhvNgEljwh/56sFF2n1EN3hDyH
	v1BrKMYNIzcq34T+9LrX3sv7FW0kWQE9ZPmBT3ZLwy1NTHMcqsIhUBMap+aS1jId
	TkHHTH3o2baOWjwr+oqFMlcHk8yATihU8dDXTbhV/Xpf7561vcZYA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yturapp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Dec 2025 05:26:49 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BD5Qm3T030096;
	Sat, 13 Dec 2025 05:26:48 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yturapj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Dec 2025 05:26:48 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BD0lilI028147;
	Sat, 13 Dec 2025 05:26:47 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4avy6yfrxp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Dec 2025 05:26:47 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BD5Qhtr30802198
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 13 Dec 2025 05:26:43 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 92E4520043;
	Sat, 13 Dec 2025 05:26:43 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CAEA720040;
	Sat, 13 Dec 2025 05:26:40 +0000 (GMT)
Received: from li-fc74f8cc-3279-11b2-a85c-ef5828687581.ibm.com.com (unknown [9.124.210.103])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 13 Dec 2025 05:26:40 +0000 (GMT)
From: Srish Srinivasan <ssrish@linux.ibm.com>
To: linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, James.Bottomley@HansenPartnership.com,
        jarkko@kernel.org, zohar@linux.ibm.com, nayna@linux.ibm.com,
        rnsastry@linux.ibm.com, linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org, ssrish@linux.ibm.com
Subject: [PATCH 6/6] docs: trusted-encryped: add PKWM as a new trust source
Date: Sat, 13 Dec 2025 10:56:18 +0530
Message-ID: <20251213052618.190691-7-ssrish@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251213052618.190691-1-ssrish@linux.ibm.com>
References: <20251213052618.190691-1-ssrish@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAyMyBTYWx0ZWRfXz3gVTOp2Xgp3
 MqEngtouiyzqWvDnyJOzGTcw9dRvb1dXushEVycN+7qgaVjVj3S39g2wUBXOZpOUjpCIP6WkxEL
 A+Lpl7CbE4GF3s2/2eFu5ZeDYuOD5sOArVygmeop/qCOw0WQ5Mr68ZQ8FKGMe/3ELwC0Z3u56+G
 05yV7293z9qmpSdD+iRL8PgAsWOiHNesBTKEpqMwMc058cA9YXWB4sKbmQDeQBpEnlNZ57EGBD7
 yeIzTtsL5LzgOUlH+AtkIITqWmp7JAOZxbt5kmUKmb1igE1LE1QluYMAZ/+ed/Wc0vkT66xuVgH
 ABhWjuInebqcrM+scmM0GeXLRUIdwlZjxI63tWZuOePkYd7dP3oL7U0dRybZLj/n4cFv/c4JuqW
 V7PlqKxAto9Wrj3vNWnh5Q/C2NxW9w==
X-Proofpoint-ORIG-GUID: nnZXN-5cfdxRy-FnuXypmImRBczetJ9r
X-Authority-Analysis: v=2.4 cv=QtRTHFyd c=1 sm=1 tr=0 ts=693cf919 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=T8Lk_pw-g3mOOJD1yd4A:9
X-Proofpoint-GUID: mPT9R_p7MeW2KA2xWsWCsu3rHtab1NNR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_07,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512130023
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Nayna Jain <nayna@linux.ibm.com>

Update Documentation/security/keys/trusted-encrypted.rst and Documentation/
admin-guide/kernel-parameters.txt with PowerVM Key Wrapping Module (PKWM)
as a new trust source

Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
Signed-off-by: Srish Srinivasan <ssrish@linux.ibm.com>
---
 .../admin-guide/kernel-parameters.txt         |  1 +
 .../security/keys/trusted-encrypted.rst       | 50 +++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index a8d0afde7f85..ccb9c2f502fb 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -7755,6 +7755,7 @@ Kernel parameters
 			- "tee"
 			- "caam"
 			- "dcp"
+			- "pkwm"
 			If not specified then it defaults to iterating through
 			the trust source list starting with TPM and assigns the
 			first trust source as a backend which is initialized
diff --git a/Documentation/security/keys/trusted-encrypted.rst b/Documentation/security/keys/trusted-encrypted.rst
index eae6a36b1c9a..ddff7c7c2582 100644
--- a/Documentation/security/keys/trusted-encrypted.rst
+++ b/Documentation/security/keys/trusted-encrypted.rst
@@ -81,6 +81,14 @@ safe.
          and the UNIQUE key. Default is to use the UNIQUE key, but selecting
          the OTP key can be done via a module parameter (dcp_use_otp_key).
 
+     (5) PKWM (PowerVM Key Wrapping Module: IBM PowerVM + Platform KeyStore)
+
+         Rooted to a unique, per-LPAR key, which is derived from a system-wide,
+         randomly generated LPAR root key. Both the per-LPAR keys and the LPAR
+         root key are stored in hypervisor-owned secure memory at runtime,
+         and the LPAR root key is additionally persisted in secure locations
+         such as the processor SEEPROMs and encrypted NVRAM.
+
   *  Execution isolation
 
      (1) TPM
@@ -102,6 +110,14 @@ safe.
          environment. Only basic blob key encryption is executed there.
          The actual key sealing/unsealing is done on main processor/kernel space.
 
+     (5) PKWM (PowerVM Key Wrapping Module: IBM PowerVM + Platform KeyStore)
+
+         Fixed set of cryptographic operations done on on-chip hardware
+         cryptographic acceleration unit NX. Keys for wrapping and unwrapping
+         are managed by PowerVM Platform KeyStore, which stores keys in an
+         isolated in-memory copy in secure hypervisor memory, as well as in a
+         persistent copy in hypervisor-encrypted NVRAM.
+
   * Optional binding to platform integrity state
 
      (1) TPM
@@ -129,6 +145,11 @@ safe.
          Relies on Secure/Trusted boot process (called HAB by vendor) for
          platform integrity.
 
+     (5) PKWM (PowerVM Key Wrapping Module: IBM PowerVM + Platform KeyStore)
+
+         Relies on secure and trusted boot process of IBM Power systems for
+         platform integrity.
+
   *  Interfaces and APIs
 
      (1) TPM
@@ -149,6 +170,11 @@ safe.
          Vendor-specific API that is implemented as part of the DCP crypto driver in
          ``drivers/crypto/mxs-dcp.c``.
 
+     (5) PKWM (PowerVM Key Wrapping Module: IBM PowerVM + Platform KeyStore)
+
+         Platform Keystore has well documented interfaces in PAPR document.
+         Refer to ``Documentation/arch/powerpc/papr_hcalls.rst``
+
   *  Threat model
 
      The strength and appropriateness of a particular trust source for a given
@@ -191,6 +217,10 @@ selected trust source:
      a dedicated hardware RNG that is independent from DCP which can be enabled
      to back the kernel RNG.
 
+   * PKWM (PowerVM Key Wrapping Module: IBM PowerVM + Platform KeyStore)
+
+     The normal kernel random number generator is used to generate keys.
+
 Users may override this by specifying ``trusted.rng=kernel`` on the kernel
 command-line to override the used RNG with the kernel's random number pool.
 
@@ -321,6 +351,26 @@ Usage::
 specific to this DCP key-blob implementation.  The key length for new keys is
 always in bytes. Trusted Keys can be 32 - 128 bytes (256 - 1024 bits).
 
+Trusted Keys usage: PKWM
+------------------------
+
+Usage::
+
+    keyctl add trusted name "new keylen [options]" ring
+    keyctl add trusted name "load hex_blob" ring
+    keyctl print keyid
+
+    options:
+       wrap_flags=   ascii hex value of security policy requirement
+                       0x00: no secure boot requirement (default)
+                       0x01: require secure boot to be in either audit or
+                             enforced mode
+                       0x02: require secure boot to be in enforced mode
+
+"keyctl print" returns an ASCII hex copy of the sealed key, which is in format
+specific to PKWM key-blob implementation.  The key length for new keys is
+always in bytes. Trusted Keys can be 32 - 128 bytes (256 - 1024 bits).
+
 Encrypted Keys usage
 --------------------
 
-- 
2.47.3


