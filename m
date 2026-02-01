Return-Path: <linuxppc-dev+bounces-16494-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMPiMpdcf2m0owIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16494-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sun, 01 Feb 2026 15:00:55 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F58CC60E6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 01 Feb 2026 15:00:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f3rwt63yKz3cDV;
	Mon, 02 Feb 2026 01:00:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769954414;
	cv=none; b=nk9f2QH8qoKkj6m3Z5p7gv25zkDL7HCyh/MH7T8pMoufWO6ywmlS4DsGLqY8Z3nV7KNZLPYSmFD8Cm/7ZT1FTcdYNWqOjzM78k9o3j5/N7os5pRC5n7EgAFy8YTPmVwRthhOZRcuSygDL8zKlJkEwUrMpbANn2IdK0h/mpFrP3gEv6oAGFgxKPzdHQZR5AAXhLrX11J54kieG6OCAKMHBQig79AStBMicLcIAJ+R4FkmPSAhpUqwHAjNY6cZABR7CW0s2Zol1uZuz+WHnKU1qJRW26btQlH6bxkdfPADse3mDApC4qSwDDn5P9mPSM1qjr+26ZBQqfN6TM4xW6sc9A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769954414; c=relaxed/relaxed;
	bh=3AlJIuHueyJfodCUqPQr+cGMD8wjDvVNfPBSHGCosjo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j+TaYhJg+SjtlIqnJI3PFmoNGYNNoqU39edhR1s7twGkyKHy4uOOBnXaSSrrnWEFW9qkpO1TYeOTLkXRXpmrmUe6VSbYNhkg86y8R3cm3VwMWig5YEcbY80whu3twgl9bXLn6MIcASCdZ6aLPuvNna18buJnakl2bKaSl/V79ZnzxMpSwD609V9EV8A3Q7nJycFtYezpF5YQeTTIB1LhE3d6YhFdzbrsDte+AxjZAK7SrlZjIAntMVgUAxSuxlRmOw5dAQN3Kcr1OEMrHC/X44AiiQtEpPuhaGMQBz6E0dM9UsPsN0vgCRE0GCNJ7h/opmc7H3PKaa63gFpBftT2UQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DgTYn2aq; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DgTYn2aq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f3rwt13rcz2yGx
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Feb 2026 01:00:13 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 611AvakW006015;
	Sun, 1 Feb 2026 14:00:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=3AlJIuHueyJfodCUq
	PQr+cGMD8wjDvVNfPBSHGCosjo=; b=DgTYn2aqvWNFxtbgbqf/eul0lpRzK4kWi
	LomWABHSwpnLhQqk9QS0ntqJttnEUbn3LtCP86wSr4/AoOiStQ3B6NObiZ73S60s
	ANiD64cv+CUJSKyT8bR0NhcdbJr2ncaltt6hZeujFwVI8d0teIV5uX3I2J4WqUUT
	EzFzRHNeAKaBEPu+8GCcRphR98W4rSaiMY0b9XMaIVCxFFnEEr2AwPpJQlqAiqXv
	rhBB3S0l5+Xy0SpdXrwnv0b1yKXfEpXH10gJ3kdDpLOaWMnQ9Xmiy8OftF+YBMqu
	MYz1d4kkAmji8o7pPT1VR8xAoVrXaXyTHL6hNY1gxuvVXrr1zxsNg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4c175mkx5y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 01 Feb 2026 14:00:01 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 611E01oY021627;
	Sun, 1 Feb 2026 14:00:01 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4c175mkx5u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 01 Feb 2026 14:00:01 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61170cbT029108;
	Sun, 1 Feb 2026 14:00:00 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4c1v2s1rd3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 01 Feb 2026 14:00:00 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 611DxuLV19530040
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 1 Feb 2026 13:59:56 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8306A20043;
	Sun,  1 Feb 2026 13:59:56 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 728B120040;
	Sun,  1 Feb 2026 13:59:53 +0000 (GMT)
Received: from li-fc74f8cc-3279-11b2-a85c-ef5828687581.ibm.com.com (unknown [9.39.20.39])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  1 Feb 2026 13:59:53 +0000 (GMT)
From: Srish Srinivasan <ssrish@linux.ibm.com>
To: linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, James.Bottomley@HansenPartnership.com,
        jarkko@kernel.org, zohar@linux.ibm.com, nayna@linux.ibm.com,
        rnsastry@linux.ibm.com, linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org, ssrish@linux.ibm.com
Subject: [PATCH v6 6/6] docs: trusted-encryped: add PKWM as a new trust source
Date: Sun,  1 Feb 2026 19:29:30 +0530
Message-ID: <20260201135930.898721-7-ssrish@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260201135930.898721-1-ssrish@linux.ibm.com>
References: <20260201135930.898721-1-ssrish@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: Evg04QKxuVsarJqa7i2QNI9Y4fRtEMkb
X-Authority-Analysis: v=2.4 cv=VcX6/Vp9 c=1 sm=1 tr=0 ts=697f5c61 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=ULK339cd-4IVAxCgyX4A:9
X-Proofpoint-GUID: d_3W2q5XZ5y6p6-HFy-5oJprXxLmYsF1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAxMDEyMCBTYWx0ZWRfX0J06/X323CG0
 b+VW8LTBlJTEm4h6KBf1GeFq9oqzj13DG1zswjhuipqApsdx0hhWty+CMP5o8iTRXbGu0IKkzS1
 gNL+g9Q8bWvu1dCeUzT9pdyuH7uMjAnA/Hi+HiqaMd+bHZCNQA9wI7JFsgblbmmnoFdlGDzSG4J
 reNdhTRM5JYspysBMgcxc94JxLWfinSGdtcRD+A0Z8JYTY5aDM2tV0/LGuoXa4GIKx+2lnu6jkI
 Uryln5s32N0j3UZKs8scYDE+AgmhvedDmR18FNZmh3sOsHQlL0M1iwspHmG/MVY8AVrSQj5t7Y6
 dKDVuyhNeKI+B9ONhoj+JF8ItMlp2SR92DF056QSPFt/a7Gpc1OdX4ru/RORvq/L/hUCWVsTESe
 lyJaQPm9hJZBIPgalR6QX9YV49/9Q0deyXuofZ8SG5oSxBrA0b3fU0B1XlvTJPrUncbyITyBN+r
 R6RScvPIu6rPL91vMJg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-01_05,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2601150000 definitions=main-2602010120
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-integrity@vger.kernel.org,m:keyrings@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:christophe.leroy@csgroup.eu,m:James.Bottomley@HansenPartnership.com,m:jarkko@kernel.org,m:zohar@linux.ibm.com,m:nayna@linux.ibm.com,m:rnsastry@linux.ibm.com,m:linux-kernel@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:ssrish@linux.ibm.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,csgroup.eu,HansenPartnership.com,kernel.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16494-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[ssrish@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ssrish@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid]
X-Rspamd-Queue-Id: 2F58CC60E6
X-Rspamd-Action: no action

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
index 1058f2a6d6a8..aac15079b33d 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -7790,6 +7790,7 @@ Kernel parameters
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


