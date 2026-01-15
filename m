Return-Path: <linuxppc-dev+bounces-15809-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6568FD23CD4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 11:05:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsJXG29Ncz3blr;
	Thu, 15 Jan 2026 21:05:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768471550;
	cv=none; b=GoTqryLDJl7cRHPMO5JUEBdX0K6N1CDMWXC9a4LGxTPGQnI26kNPzEbOAu72KzgYq98BSaZnKNpnbSf5cLVkpiSCB52Ia8CwGZIpaf+gBGFU4YiVbKLWXvVZXNr+8igyC8+yDotcBBS26/nWJOcxOcMYZEL15ULWRFln5jaPiIrZwQBQnLoLEvtt9mqesL4lr3rQR9o9Y8tYUA5FA75GDpbyqjhOkt7lYkHlo2WgAW155xwYTYIy98PyyuY+PkbSMoVcaWK+fvrbXmmahu4kYViTdVyrPi6rxlXhv3Cd39l0XcWYbWT8Wg83cux8D+IJSdot/Daj2J2jzYw3DAaDvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768471550; c=relaxed/relaxed;
	bh=56BhBO+/eHWjmoR1c5fXFEtI4KtKouXiVgC1S4fhn/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VdN+KNuJXv+rVC7nP2+9zdnUy5hZUIBgNcEysGT+3ZkE4Rf4UAbAtudq/ehv6rIuyxIt4ss4jhhzcgTjcc1wum5ShEQfjIBEvbZNIcpKVy7Kd6lLEsr+uT8FNM/p+EEcuAf+pBz23xPNja4vZBP5TxY8a2pTJvOiSuSw+Vq8IxoFQFlgHBMkJ08QFiq9Sd7PARhfpJAqDi5Lx8Fpn2ZIaPrbe6h9YVtvCuvuT73sV9I8hBoFwchCc/OaictK3n1MZSa9SmbFnGnwXuzrj0k1Q8MwVF1TLfDKvxKYa8TFIEeKuoWy2ooj/8r+xN7zZ/GMl221tr9WYQKauQ28AvUIQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KtwXDZCw; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KtwXDZCw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsJXF2bNPz309H
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 21:05:49 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60EJVYA4021117;
	Thu, 15 Jan 2026 10:05:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=56BhBO+/eHWjmoR1c
	5fXFEtI4KtKouXiVgC1S4fhn/U=; b=KtwXDZCwHY2uLltHX3I9FZtQ13bF0cNBr
	XEeWb9/JrN8p1Q3GXwy9EpBBGXww29F7q1+hC71p2gZx4JQWOBigCF73ifCd+BhX
	91WkCD9qalFgGHnwBg+nrO9SH/kRoIYi4mes6Ebm49g8jaW6zsV9Y9IMSJV11o31
	Vwt0ctoBaTERzjpdAfuoYpK5jS7oKuo3fa8iST6yHdzuTNx8gKYxOfNmr02o9Gxw
	4LHAlAIVbV3QOG3jwJhufszHGpNj90Gr+PfRdzmEK8+rbtCtPjZm+mAPWwv/aNWg
	iHkqCvJ6weUF9FL+GH46rkDmeEuuyUwhaMZVoTOL0iYiU9z6Fdxlg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bkc6hdmyp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 10:05:36 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60FA02Dv032568;
	Thu, 15 Jan 2026 10:05:35 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bkc6hdmym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 10:05:35 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60F9UrZC031294;
	Thu, 15 Jan 2026 10:05:34 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bm3t1y13d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 10:05:34 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60FA5Uow52232584
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jan 2026 10:05:31 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D64FE20065;
	Thu, 15 Jan 2026 10:05:30 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5311B2004E;
	Thu, 15 Jan 2026 10:05:27 +0000 (GMT)
Received: from li-fc74f8cc-3279-11b2-a85c-ef5828687581.ibm.com.com (unknown [9.39.20.65])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Jan 2026 10:05:27 +0000 (GMT)
From: Srish Srinivasan <ssrish@linux.ibm.com>
To: linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, James.Bottomley@HansenPartnership.com,
        jarkko@kernel.org, zohar@linux.ibm.com, nayna@linux.ibm.com,
        rnsastry@linux.ibm.com, linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org, ssrish@linux.ibm.com
Subject: [PATCH v4 6/6] docs: trusted-encryped: add PKWM as a new trust source
Date: Thu, 15 Jan 2026 15:35:04 +0530
Message-ID: <20260115100504.488665-7-ssrish@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115100504.488665-1-ssrish@linux.ibm.com>
References: <20260115100504.488665-1-ssrish@linux.ibm.com>
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
X-Proofpoint-GUID: ZZTzovOmBRFF-Skx-OJQ3W6LCbNzmlt9
X-Proofpoint-ORIG-GUID: cPQT5v8ryDtZQNLmHA9AtQzwWRPHZoHk
X-Authority-Analysis: v=2.4 cv=TaibdBQh c=1 sm=1 tr=0 ts=6968bbf0 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=ULK339cd-4IVAxCgyX4A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2OSBTYWx0ZWRfX53EA6qxhzXln
 KM+ff8pNI6BelJLMdYu5YRGIwA8jibvCk1zuYtp/mvHMqwr3gxdRaPutETFqv+C6o7j1yNGlNkI
 OgHNbZRPCBnkiUl3anY26p5N3VsAgEvwEIcbsi9+MGqNPhzYc11+eVkDnJoWG10W4dsMVdAPxvs
 cL9+8w2U5kXpFhX6XhGTcPQdqYooNJ+eySCuQKPpkY9NzjEJ/nIuxnV3MmA3lzgqiy8Kfo96NO0
 G3fXCWjjEnLpt8uvuk2G95r1EIHnBFzzXTK9kNyGJvsdvfSnN3jv2GR6BBGDFQMB1F3rLg54zLq
 uKc/0gOdUhBacfPOPr5XEcKL8aPyxqP3dSn4yubO6V7OM3bO6ER5PHsatSnTr/pu2Cut69ZCfkM
 YHpnGjJ2dTu41Vl3V7641SKOFILfB5wCeicK1bDQiGAcyDnvvHgWK56jlP08Pspk/gpfsYTm78K
 DK7tDBCOTo9Au8TNvbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2512120000
 definitions=main-2601150069
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
Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
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


