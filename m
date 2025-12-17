Return-Path: <linuxppc-dev+bounces-14850-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5E9CC90B8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Dec 2025 18:26:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWggH44Bvz3bfF;
	Thu, 18 Dec 2025 04:25:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765992347;
	cv=none; b=KyiFJnl3gUVq84rLYqZfqXJvXvLjL+pjHsuGaPqjfFs5FA4QH3EQ4zh6MuCN/fvRaqu03BQOvUEYBXIPhHEmRDlKdtROWkzFTLMYt11Vfml7vJUqycYk/zahLCZSQ++CihBol62CWMNtsc0KS5zavfrFVzqGlzHPu4bqSwaBbk2N8otFIUIEP++jiAi3V0/38/PuUm4J00ycyg7dg2FS8v3GyFiDDw1Mjw8MXn3g+YMg9LWqMzqCNAIm9Hvat61BGojNnw/wPkAtnb0CNrFoF6wmx6yR9mWJN54dCK/C6H+WNLmHZNWudbuZaqnUeEvMgT/5kUP/0N7c95O1mwPHXw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765992347; c=relaxed/relaxed;
	bh=Bkv9uUW89YkDzEWaHv1ObgoIXGJD2YqlGrw2O8ISsIM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jKqq53524saB9ZAvXRBPG1Toz/vVdCsQ8W/EIeraobJuANrRZ4AXv7lEDr+DCxiugXnGOJ1e+3U5pAqmWuAHi17/m9jostvW2aLak637mthW/AlUAfBzaxjUjKLXeRA7+bZn5sBqewZhycAs3qD4odXR45JtVdQKbsQcwEUmxLsIbRaoBzBu9DCzIAb/RQgust17J17RP6T0fFyQQAbAcbIUqYjKxYVs14/Zo0R919+KHZXQMZZH4Tr6OwptY/tO0aSwuaLzCecx0NmOCy/nUTvtQZaCthMoR/XrYbM4wuqlkxPSlL7RHqc3ep7YlU5tlluRyknlnxmSLVUsQqvsyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Rwm9Aewd; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Rwm9Aewd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dWggG5r5Cz30TL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Dec 2025 04:25:46 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BHAksvY006284;
	Wed, 17 Dec 2025 17:25:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=Bkv9uUW89YkDzEWaH
	v1ObgoIXGJD2YqlGrw2O8ISsIM=; b=Rwm9AewdjgZ6PVtdnfehaWoypjOkFlRTq
	KkPumMFBEQH3TXVwFkA7pOdfrHqPQYtiXEnOwJZHfYvEtDAdNfgi8r20+aJdUv6B
	KeXyl4qJise6kXn4QvlYFbXj94JIGmuowXfYxM4Jlv+83lDhD3q4sxOFlh8btkOl
	D+yl7mbpbuX+pzxke7tqLnFOR+IPRQCGUUKO3+gjP1rqY/WyEEzc7tdxrlO0R9NN
	ul6bkV1FdAgCXeat+M5dD1fK4EB3Sn5r+kvv3TFob4jBWJD5LQsok6EQq53ixvxK
	pnSvZeHUf7qmSX4k+hub1SRyg/cK22SqBjTlpfbrAt0BsSfKg9dTA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0xjm5gm4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 17:25:35 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BHHKHj5026044;
	Wed, 17 Dec 2025 17:25:35 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0xjm5gkx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 17:25:34 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BHH9ZqO002960;
	Wed, 17 Dec 2025 17:25:34 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4b1kykuf9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 17:25:34 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BHHPUL529622806
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Dec 2025 17:25:30 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0F34320043;
	Wed, 17 Dec 2025 17:25:30 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F01C820040;
	Wed, 17 Dec 2025 17:25:26 +0000 (GMT)
Received: from li-fc74f8cc-3279-11b2-a85c-ef5828687581.ibm.com.com (unknown [9.124.211.226])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 17 Dec 2025 17:25:26 +0000 (GMT)
From: Srish Srinivasan <ssrish@linux.ibm.com>
To: linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, James.Bottomley@HansenPartnership.com,
        jarkko@kernel.org, zohar@linux.ibm.com, nayna@linux.ibm.com,
        rnsastry@linux.ibm.com, linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org, ssrish@linux.ibm.com
Subject: [PATCH v2 6/6] docs: trusted-encryped: add PKWM as a new trust source
Date: Wed, 17 Dec 2025 22:55:05 +0530
Message-ID: <20251217172505.112398-7-ssrish@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251217172505.112398-1-ssrish@linux.ibm.com>
References: <20251217172505.112398-1-ssrish@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: ceeOyiP6uF2BvNLHd10ohXNW5vn1otzm
X-Authority-Analysis: v=2.4 cv=CLgnnBrD c=1 sm=1 tr=0 ts=6942e78f cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=T8Lk_pw-g3mOOJD1yd4A:9
X-Proofpoint-GUID: vOmHre_G-yGWxqiKVb5Ic0lRl4uaAeUZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAwOSBTYWx0ZWRfX+yNIHZ5fBBmo
 DmuJLc+Fr+H4Xxc07KwI4ji8pJzhohjS3GVMuqPh/MRk2QBZ7mWVgk1vvcUmNV4guytylTcluW4
 G5WJVi8pthzWmd8EvLI+XOVHFp8zj46CuFznMz1bSfNc+XP3bVi0M7D5GJ/WLrHyLiNXZMD551y
 Mk9eY3K3D3n2WKCUDdv3juvy0mZGrEDEGxvXCgtufl3T5rWJ7rYvDPr1ho+PJnY482ZoURA+z14
 nv6kWo00MdtKX2aRKn007yd4Nk1I9xY5CGGbCUD2L6wWMGFcPrRJNPrqoZSaUuYHK6XdCmr0LSH
 EgVMRDhDi5pyQyDXwd8qe2DJq0FE0os0/K1ooa9Y4sJA9Ret5SL+9JE7GAFPckTyqkqHCe+HnAC
 NAPI5niPw0eu1Mf/UuRFL/W/3l6Veg==
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


