Return-Path: <linuxppc-dev+bounces-15825-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93999D24569
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 12:57:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsM166tl8z309H;
	Thu, 15 Jan 2026 22:57:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768478250;
	cv=none; b=RqjSDpUP8Uu7kqbSnb6fvJN1J3o/xtOuLQq8EIk0tANER2A1Dx8gZnWIpZFajCVqVEOXADfyCa35Zu6yjjQczHv4Um8mGzRKlTbJyeS6qobw1HWjfmhcodnxhTex7xwx702D05VR8geKqq9Ei5Fp8RY3tiLlYg05K1CZWcsjE8V0F5Nz8heZXlejF3VoarMx4rIe3XgkveqQVmKfBXX1+8Mf+APBZctREb5TCjbrh666f94Uto/DSFr8yGjCTROE7xHFtNjrIYeEgnkY9gWL9Zul4Mg+zq8qIRyxw2VUc4BLYaJ8VTcRrFj2dQRibhNiqv0i79SIh2fqezXHAjJugA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768478250; c=relaxed/relaxed;
	bh=E9q9MwLx+QxB8gPZoWTVfIF6m08d+i7ReyBrKfC6Vc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YTIc/5jl//1Zq19I1HpJLuoxVtS1poiijJRXVridLCXnQs4JKU8z/UDMoFk6k06iQSDncwyl6X773dRyJJVkS2+2aPDJb65fLjP5+sPyOJqtCqhKOfcskIr0K2rZansG2DLQ/mxk7Kv/6v1NbHyTMkZrccy7YbCmVCMzMgwSIp3+wJ/gXDuoUO93Hri0zsGoYgNyJFqtmBbwg9CounAz1A6GySSxvS45kcMoNv279k8zt825UdPj6LVmViMv/TEyFm8PV+C7FMYQNeQmAJzszmxerCMD+fKDBbGvor2GC17mBC+hCPQ3Ph8vfli1Uq4IbMXKi0jefS0Q0BV/L85gNw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kYTAEQBU; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kYTAEQBU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsM160qGlz2xNg
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 22:57:29 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60F9L1oc026309;
	Thu, 15 Jan 2026 10:05:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=E9q9MwLx+QxB8gPZo
	WTVfIF6m08d+i7ReyBrKfC6Vc8=; b=kYTAEQBUPxNFx8H43mN1u4tQene/B3Ya/
	VFVSd3mtymJlc2tMM/cAHdITXvH9wWW8vc5nfL9vuG3Jze0yy3/HTdc01PTUYnrt
	AYBz1w686hFA3XTHue9TmBFLdvVEgyVUTzeSFcqN2yTMwN03bWUgmOCMHRLFjvCj
	YecZB1V6KCAvvTC8AS7qaFLRSNyL/WvRmog+6Ols//UE7nDhpO1Nt56g6pYArkHP
	X6a7XXb8Sla1OPXE9Ouz8DpzPK0tAYC3FfB236YiK4Yujqp4yciOvtiCcxiwFmCw
	oJQu1n+h1RjjPYPrpcR8t7QXEg+zeoBk4+DfmPmTWwpMK+fVA6Vlw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bpja4jgvq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 10:05:24 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60FA5OKd029550;
	Thu, 15 Jan 2026 10:05:24 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bpja4jgvh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 10:05:24 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60F8aNSR030146;
	Thu, 15 Jan 2026 10:05:23 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bm3ajy4w6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jan 2026 10:05:23 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60FA5JJR31261138
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jan 2026 10:05:19 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 95D672004E;
	Thu, 15 Jan 2026 10:05:19 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5E43C2004F;
	Thu, 15 Jan 2026 10:05:16 +0000 (GMT)
Received: from li-fc74f8cc-3279-11b2-a85c-ef5828687581.ibm.com.com (unknown [9.39.20.65])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Jan 2026 10:05:16 +0000 (GMT)
From: Srish Srinivasan <ssrish@linux.ibm.com>
To: linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, James.Bottomley@HansenPartnership.com,
        jarkko@kernel.org, zohar@linux.ibm.com, nayna@linux.ibm.com,
        rnsastry@linux.ibm.com, linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org, ssrish@linux.ibm.com
Subject: [PATCH v4 3/6] pseries/plpks: expose PowerVM wrapping features via the sysfs
Date: Thu, 15 Jan 2026 15:35:01 +0530
Message-ID: <20260115100504.488665-4-ssrish@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2OSBTYWx0ZWRfXzsGInuXGaqNp
 vG6Gba+HBgaVn7fcYirKWgZ+aaLZxHO3zBImWxoxH+4DG56AS7qb9MA79vcgDug+4oLHI15XD9m
 nNCKbNKWPJFQ5RH2QpvzM+sABl+nzR6D2JLl93iS6FJxsb8e4jBsh0r8LGBP0xSu7yZiSOEmLEh
 cv1V9HsmTsZjbfO3dqbQmZi6Q4fB2tV1YtxRW6v7ki4MSzOxVbjUrjdIQoVaX8ptGCxZ/ED0K7v
 qYYhNaHGdsGnMhJamhOZx+e9uyvbLCqGbDXBx3qIkLtQTu8iYxeg20oVfkjAYicUxYG8cswMFDK
 L7LEQsvx/L2jfAmUVZGcU4qBEuKCmqVN+lEcXUVxRigBO1naSMHPMg1O9DbsARG5wzlEB/ki2gs
 UVjIVzmpq6XqYiFPvLA/RompRX0A787CV2pV6jLaao5yKP3chAtOVLQL1oLzF7verKSO7XTSzoc
 fHC0xpQKpsbJwb5X3fg==
X-Proofpoint-ORIG-GUID: DJdQ-6_JF7FB7ujIPcaqkoOnT1WmUzlJ
X-Proofpoint-GUID: 7__KPtyBQF2dw7reEONCjJG60qGMBn3_
X-Authority-Analysis: v=2.4 cv=U4afzOru c=1 sm=1 tr=0 ts=6968bbe4 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=z7cUUKlKUSfJ7xv5IYMA:9
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

Starting with Power11, PowerVM supports a new feature called "Key Wrapping"
that protects user secrets by wrapping them using a hypervisor generated
wrapping key. The status of this feature can be read by the
H_PKS_GET_CONFIG HCALL.

Expose the Power LPAR Platform KeyStore (PLPKS) wrapping features config
via the sysfs file /sys/firmware/plpks/config/wrapping_features.

Signed-off-by: Srish Srinivasan <ssrish@linux.ibm.com>
---
 .../ABI/testing/sysfs-firmware-plpks          |  8 ++++++++
 arch/powerpc/include/asm/hvcall.h             |  4 +++-
 arch/powerpc/include/asm/plpks.h              |  3 +++
 arch/powerpc/platforms/pseries/plpks-sysfs.c  |  2 ++
 arch/powerpc/platforms/pseries/plpks.c        | 20 +++++++++++++++++++
 5 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-firmware-plpks b/Documentation/ABI/testing/sysfs-firmware-plpks
index af0353f34115..cba061e4eee2 100644
--- a/Documentation/ABI/testing/sysfs-firmware-plpks
+++ b/Documentation/ABI/testing/sysfs-firmware-plpks
@@ -48,3 +48,11 @@ Description:	Bitmask of flags indicating which algorithms the hypervisor
 		supports for signed update of objects, represented as a 16 byte
 		hexadecimal ASCII string. Consult the hypervisor documentation
 		for what these flags mean.
+
+What:		/sys/firmware/plpks/config/wrapping_features
+Date:		November 2025
+Contact:	Srish Srinivasan <ssrish@linux.ibm.com>
+Description:	Bitmask of the wrapping features indicating the wrapping
+		algorithms that are supported for the H_PKS_WRAP_OBJECT requests
+		, represented as a 8 byte hexadecimal ASCII string. Consult the
+		hypervisor documentation for what these flags mean.
diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index 9aef16149d92..dff90a7d7f70 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -360,7 +360,9 @@
 #define H_GUEST_RUN_VCPU	0x480
 #define H_GUEST_COPY_MEMORY	0x484
 #define H_GUEST_DELETE		0x488
-#define MAX_HCALL_OPCODE	H_GUEST_DELETE
+#define H_PKS_WRAP_OBJECT	0x490
+#define H_PKS_UNWRAP_OBJECT	0x494
+#define MAX_HCALL_OPCODE	H_PKS_UNWRAP_OBJECT
 
 /* Scope args for H_SCM_UNBIND_ALL */
 #define H_UNBIND_SCOPE_ALL (0x1)
diff --git a/arch/powerpc/include/asm/plpks.h b/arch/powerpc/include/asm/plpks.h
index 8829a13bfda0..8f034588fdf7 100644
--- a/arch/powerpc/include/asm/plpks.h
+++ b/arch/powerpc/include/asm/plpks.h
@@ -23,6 +23,7 @@
 #define PLPKS_IMMUTABLE		PPC_BIT32(5) // Once written, object cannot be removed
 #define PLPKS_TRANSIENT		PPC_BIT32(6) // Object does not persist through reboot
 #define PLPKS_SIGNEDUPDATE	PPC_BIT32(7) // Object can only be modified by signed updates
+#define PLPKS_WRAPPINGKEY	PPC_BIT32(8) // Object contains a wrapping key
 #define PLPKS_HVPROVISIONED	PPC_BIT32(28) // Hypervisor has provisioned this object
 
 // Signature algorithm flags from signed_update_algorithms
@@ -103,6 +104,8 @@ u32 plpks_get_maxlargeobjectsize(void);
 
 u64 plpks_get_signedupdatealgorithms(void);
 
+u64 plpks_get_wrappingfeatures(void);
+
 u16 plpks_get_passwordlen(void);
 
 void plpks_early_init_devtree(void);
diff --git a/arch/powerpc/platforms/pseries/plpks-sysfs.c b/arch/powerpc/platforms/pseries/plpks-sysfs.c
index 01d526185783..c2ebcbb41ae3 100644
--- a/arch/powerpc/platforms/pseries/plpks-sysfs.c
+++ b/arch/powerpc/platforms/pseries/plpks-sysfs.c
@@ -30,6 +30,7 @@ PLPKS_CONFIG_ATTR(used_space, "%u\n", plpks_get_usedspace);
 PLPKS_CONFIG_ATTR(supported_policies, "%08x\n", plpks_get_supportedpolicies);
 PLPKS_CONFIG_ATTR(signed_update_algorithms, "%016llx\n",
 		  plpks_get_signedupdatealgorithms);
+PLPKS_CONFIG_ATTR(wrapping_features, "%016llx\n", plpks_get_wrappingfeatures);
 
 static const struct attribute *config_attrs[] = {
 	&attr_version.attr,
@@ -38,6 +39,7 @@ static const struct attribute *config_attrs[] = {
 	&attr_used_space.attr,
 	&attr_supported_policies.attr,
 	&attr_signed_update_algorithms.attr,
+	&attr_wrapping_features.attr,
 	NULL,
 };
 
diff --git a/arch/powerpc/platforms/pseries/plpks.c b/arch/powerpc/platforms/pseries/plpks.c
index 03722fabf9c3..4a08f51537c8 100644
--- a/arch/powerpc/platforms/pseries/plpks.c
+++ b/arch/powerpc/platforms/pseries/plpks.c
@@ -38,6 +38,7 @@ static u32 usedspace;
 static u32 supportedpolicies;
 static u32 maxlargeobjectsize;
 static u64 signedupdatealgorithms;
+static u64 wrappingfeatures;
 
 struct plpks_auth {
 	u8 version;
@@ -248,6 +249,7 @@ static int _plpks_get_config(void)
 		__be32 supportedpolicies;
 		__be32 maxlargeobjectsize;
 		__be64 signedupdatealgorithms;
+		__be64 wrappingfeatures;
 		u8 rsvd1[476];
 	} __packed * config;
 	size_t size;
@@ -280,6 +282,7 @@ static int _plpks_get_config(void)
 	supportedpolicies = be32_to_cpu(config->supportedpolicies);
 	maxlargeobjectsize = be32_to_cpu(config->maxlargeobjectsize);
 	signedupdatealgorithms = be64_to_cpu(config->signedupdatealgorithms);
+	wrappingfeatures = be64_to_cpu(config->wrappingfeatures);
 
 	// Validate that the numbers we get back match the requirements of the spec
 	if (maxpwsize < 32) {
@@ -472,6 +475,23 @@ u64 plpks_get_signedupdatealgorithms(void)
 	return signedupdatealgorithms;
 }
 
+/**
+ * plpks_get_wrappingfeatures() - Returns a bitmask of the wrapping features
+ * supported by the hypervisor.
+ *
+ * Successful execution of the H_PKS_GET_CONFIG HCALL during initialization
+ * reads a bitmask of the wrapping features supported by the hypervisor into the
+ * file local static wrappingfeatures variable. This is valid only when the
+ * PLPKS config structure version >= 3.
+ *
+ * Return:
+ *	bitmask of the wrapping features supported by the hypervisor
+ */
+u64 plpks_get_wrappingfeatures(void)
+{
+	return wrappingfeatures;
+}
+
 /**
  * plpks_get_passwordlen() - Get the length of the PLPKS password in bytes.
  *
-- 
2.47.3


