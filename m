Return-Path: <linuxppc-dev+bounces-15334-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37177CF8F6E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 06 Jan 2026 16:06:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlvdH64Cwz2yTK;
	Wed, 07 Jan 2026 02:06:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767711987;
	cv=none; b=gJ2RBGN3G06utsmgmLlSs0dfx0egReGQMJnmYqht5bV1joeBZS1OIz68hUQtJ80N6HwjFC11+juimdnlgSjqrCBlBnoiUDgnFRzcbU0Sj44MaT8qA3jxUB4pgeSPMHMcYePMU9uSBN7RCUH1reGQsUBYrRBNg8mpHaXLGchpJ6YTUoYnvp+cIfc49rJyoB6dSq4SVa+1xwXCV0ZE2xtrtZieL5m7cJW9a0T6/aInz2MYFmmeDy7W30nARAcu2/Rh/ACqnyZTN8NG93vH9apnjzdprQU+c7+RuEq/nCirEhOfpImKcUgcImQksCUjOi1pveFZVce90rPNAVRQUgJT/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767711987; c=relaxed/relaxed;
	bh=E9q9MwLx+QxB8gPZoWTVfIF6m08d+i7ReyBrKfC6Vc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J8FD4/qyIXOY+H32zXt+irGMTC2ErQXudjOz4LwkPYNVmfkbHvk7BH2xkSw0hgNb/xD0oRDsL9EspXX75KHKgPBVk2s+gQLQj3as0duEvUl3VUi39BkPieruwWWHpCtkTQ5E00QZ9pgCPXj3NShc/piHCPFcIL1Lt9Azc2i8o3TIgy8aT5/KAjTHc8H7v6FeesXpmCVAB53RyCGp9PtW4koqZ0cLD5SyDKMXV9z10UEX0F7Uwcf63B+tzb6vIiUoqiKR3N/gKJN4CBwA887tbcIyPMCWH/OwNHrb0+A3N/mdDgX7lrWlrtXoZjXYNFcicXGDWqZNM96Z/5jKYSiR3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NZoFSFXA; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NZoFSFXA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlvdH0CPXz2yMJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 02:06:26 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 6062S8YI002998;
	Tue, 6 Jan 2026 15:06:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=E9q9MwLx+QxB8gPZo
	WTVfIF6m08d+i7ReyBrKfC6Vc8=; b=NZoFSFXAuKp8hdEUbjjyasmHZ4eEnPyeS
	cG8gPb+M3XttjTACaVvttpAdWO0O50ecqTayPhOp1sbrUcEc/zQRTW7Outg1XQPm
	EZ5Fp1a9e82upQqqvgk9sh6yWQLzsKI6sz48hUdDSA0+7/vmoNW4ao6UoQEoeeRH
	TW3XFAW5Tj1Ior0V39/NOiszByM227Ps1F09cq8rt8A2StTkrTKVX6Q0jP04YcQd
	xhj34OSU4kqlRk96Idtj+lAHhP23oxe6PevTQkNSIE6UOiXxbNdB07Z7deqw9+dZ
	0I8qZISRpXGHGKPZHadIYc9wgGFD0zchSupmo0sWrsQNK35HNA6NQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4besheup8b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 15:06:13 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 606F6DkF000791;
	Tue, 6 Jan 2026 15:06:13 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4besheup89-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 15:06:13 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 606Ctxlu014595;
	Tue, 6 Jan 2026 15:06:12 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4bfeemuyw5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 15:06:12 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 606F68B931785238
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 Jan 2026 15:06:08 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 30CE02004B;
	Tue,  6 Jan 2026 15:06:08 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0CBDC20040;
	Tue,  6 Jan 2026 15:05:58 +0000 (GMT)
Received: from li-fc74f8cc-3279-11b2-a85c-ef5828687581.ibm.com.com (unknown [9.124.214.6])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  6 Jan 2026 15:05:57 +0000 (GMT)
From: Srish Srinivasan <ssrish@linux.ibm.com>
To: linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, James.Bottomley@HansenPartnership.com,
        jarkko@kernel.org, zohar@linux.ibm.com, nayna@linux.ibm.com,
        rnsastry@linux.ibm.com, linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org, ssrish@linux.ibm.com
Subject: [PATCH v3 3/6] pseries/plpks: expose PowerVM wrapping features via the sysfs
Date: Tue,  6 Jan 2026 20:35:24 +0530
Message-ID: <20260106150527.446525-4-ssrish@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260106150527.446525-1-ssrish@linux.ibm.com>
References: <20260106150527.446525-1-ssrish@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDEyOSBTYWx0ZWRfX1gzHik3CYd2j
 kx7Ssf6x+B2Bsj708jSSNaw6LCyM2He8McELdiptPgo7mPqZKmxgm4lplTG6rRNMQ011mxzY2+l
 486sZ8AsWv6Jx8w2A24tsVhbkQjX4EYtU2hVBILdo/3WG0Ns1We0F0Puv4SdVOrwXGpXeVP3346
 HR5PQQ7BAkhVfO2Or/DEpIOBygqfV+s7tzQM07VgS7f229GRNnLApA+DkfKKY/C6hzAlJp/w2TG
 vSOCGm1rjs3OI6ZDhj8IHx+bZjJU+1wExtxWQliyNi0LuJJ3u8+oqsy8xWFZR5sJAaR44Fc8Ni8
 YUYta3JZhPRAZLBa9Z8RS6Y3k/2A53glYR59+V33PEZFdKRX/nVzo1LyLcUaGE0pl5O2xKZ7u7G
 oKYZZ+iA5yLg1+kWIU/GqLoTtE3Krc/qoKmEfhVCZOaHMkOOedgScDP6mw134W2KIGkN88jfvJI
 G+0+AneayeRCLfuIEeQ==
X-Proofpoint-GUID: eJM8s1mKxJO8ih6RT1pvelLIx_3zjr72
X-Proofpoint-ORIG-GUID: 0llFYB6QUSqf6cItBX7ySUJfxzKMl9nM
X-Authority-Analysis: v=2.4 cv=AOkvhdoa c=1 sm=1 tr=0 ts=695d24e5 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=z7cUUKlKUSfJ7xv5IYMA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601060129
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


