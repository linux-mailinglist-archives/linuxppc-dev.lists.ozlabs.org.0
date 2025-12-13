Return-Path: <linuxppc-dev+bounces-14735-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B171DCBA520
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Dec 2025 06:27:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dSvvd0K4Bz2yFq;
	Sat, 13 Dec 2025 16:26:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765603612;
	cv=none; b=CSFLi4XoCnGZ2iiQrlyFOpHySwryl7vI/06HSL6XGPJH1eqe6frvDQUE7d6lidjtV9qu8MRaWfOex+2GkvbUc8yLeANhkfSYQ3ooZKD3xiWoawpTfLDaDYCRTg7wuaDdIPvK1RfNFieZlDuNw1s/gj7r5NZzomqdsg4mBMiIpde+YzPKmncrzQFkeUNp8Gx1cygRBsNj7j21QMwIB6FoBGh+PA7gPW1D3Iqe+OD19VzEarxcUZ1MZqDjPbymGN6Xz5xwdyL71OvCP+YfBfepIuOMo1BjoEYp8s5ZvujLxJNRhkd/WuE3KX3iOn0uw/SKA7wpUKsGpVZrJ+HuF1uFYw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765603612; c=relaxed/relaxed;
	bh=dcro2zmv4ElHTk4YaCMsyTiAWgxeQRRmptAV+m6V66w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OBJcGHH5puXOMGzHIvc61VtXgqRuk4lr49+0EWhfqndYsRneH9Fe7hEt4QYZdIBS9Vxc6904O5iV25DQx6o/0n5/i/nxh3pLL8HZwGRRqlp2W7F8wXSwEq2UAJ9v7zacQq++cHzicL2jb61UbrQUCssNvo/M0B4Kno1kGDAE+7mS1z3YBeO3XA/5lRnJrQ49kaNijswkW8BH4WW2RSNsZKmtqXf+sQRouG3rH1BsRfzCAva3Wu2/jU1vXc4JW2SXXMrB764pXLQorTRB0HJvIGAYbfi5HCim9ADWyvnR8NCGDxZXe91F/5pJrjLhHuhvCjXTilUFk3WIKXutMzjtZg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XU1pl73R; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XU1pl73R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dSvvb6Y3kz2yFj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Dec 2025 16:26:51 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BD1WHrd030989;
	Sat, 13 Dec 2025 05:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=dcro2zmv4ElHTk4Ya
	CMsyTiAWgxeQRRmptAV+m6V66w=; b=XU1pl73Rq8MVF+TL+32FM3dNio06Rb1ZA
	94BGgw8moK5//a8lLQYnAVDDzqEHdYCzQa3B9U+ZRYQ7yYZIIOYeRdES0XfxuI26
	w2ByLveNVTb9COZYQzvfjNzXExE2P/RFf+AaFCq+ebwsVub1yWKrsDbE9kKy01mx
	doRlbniPRMQmLsM08gsMxy73NNmRYx+zKMuVpDVUK6X33yKjv60RUv8rB4jCcI3L
	Dr/H0pO+EisdDPn9VbOAAdn6G0h5V4jfZGelx9QGZ3ygxpP+ijX37ZirQzTfbIqV
	vRJcuiMCChEGk/OGIKqwsgu+PxsOYmKirplElV0JXpLZM8Z5aJM7g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0xjkgg66-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Dec 2025 05:26:39 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BD5QcCE016550;
	Sat, 13 Dec 2025 05:26:38 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0xjkgg64-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Dec 2025 05:26:38 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BD1Fmxm012807;
	Sat, 13 Dec 2025 05:26:38 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4aw0akfmb8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 13 Dec 2025 05:26:37 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BD5QY6j44499234
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 13 Dec 2025 05:26:34 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EDF6120040;
	Sat, 13 Dec 2025 05:26:33 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 13E272004B;
	Sat, 13 Dec 2025 05:26:30 +0000 (GMT)
Received: from li-fc74f8cc-3279-11b2-a85c-ef5828687581.ibm.com.com (unknown [9.124.210.103])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 13 Dec 2025 05:26:29 +0000 (GMT)
From: Srish Srinivasan <ssrish@linux.ibm.com>
To: linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, James.Bottomley@HansenPartnership.com,
        jarkko@kernel.org, zohar@linux.ibm.com, nayna@linux.ibm.com,
        rnsastry@linux.ibm.com, linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org, ssrish@linux.ibm.com
Subject: [PATCH 3/6] pseries/plpks: expose PowerVM wrapping features via the sysfs
Date: Sat, 13 Dec 2025 10:56:15 +0530
Message-ID: <20251213052618.190691-4-ssrish@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: AfmIliAaGTJ1kZwbtTFMIM9OFaGhE807
X-Authority-Analysis: v=2.4 cv=CLgnnBrD c=1 sm=1 tr=0 ts=693cf90f cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=j9TXtqAz_DeUw5ZPHg4A:9
X-Proofpoint-GUID: NINNeMLodoVySRPQFeUfU_doUOq6Q5G4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAwOSBTYWx0ZWRfX3MN19pQbCc0D
 ayW4HWFOoxp2xCSv+5KEIp4ivEHKLhufff94ZD0QrzFT/+rw+X3aEq62VIE8az7YMGOdNDhsMpj
 XeuMcrT7WFgaxD/D/vQSjySJMIVY7PHEC8oZ07gt62Xln7INtXTGUpfVaS5ZrFFNdumcrlneOOb
 gzX8spco/Y9bvIEO3SQwyye7N3Cy/fDjo/vR9739wK9/Y9CkOUsps95pzJk6L6xdcVvn6CU2L3T
 UQvR+iXMqEmDZ2Q5IUe+GT0ey9e15+K+lOvHqvpM0XRcgAO0Fa7tMUTWLoMVgrgzaVVuH4/Nz7A
 AnOL7/7fpSb5KzE+YwdJNH+saNPi/wKmrtUJ36AURHVQg8VwPaHK0AREHR6kN6criNePFU2Tcwv
 6WDO8GJRrNJgYLtzOJ4oiL3lyXm12w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-12_07,2025-12-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011 lowpriorityscore=0 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512130009
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
index 53e5839b0cbe..8c20fd5a8fd4 100644
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


