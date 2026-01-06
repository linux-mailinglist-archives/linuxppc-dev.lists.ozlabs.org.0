Return-Path: <linuxppc-dev+bounces-15335-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E5BCF8F72
	for <lists+linuxppc-dev@lfdr.de>; Tue, 06 Jan 2026 16:06:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlvdP3qfcz2yNG;
	Wed, 07 Jan 2026 02:06:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767711993;
	cv=none; b=OQ5Bar5ilP2iYK3vZnNkcmNqllCer2xJdEODMN6McQADK5urd5HrcQNA8skeuCZLXXXyQnTFxDqWcQ2VBvw9uEAiUzhOwuCNkKpyPS4xlcumOtKNlB3ZkcKQD+Be0RsdAuGadxBf1kQie5gzKmWyO4xU7Wa9uNCDP0bP3dyC/t6IdVpasjSBaB+Sx0n4N7vDRYnTDvvEGlNc84Udi+vaeZfeiUzd65GnKrlcfC+C86f5W0sHYT9kEEzwPDla48gO0kxeOAHGLgJffEguxj8SZIlU32QLiEfrhIL9jjZJrL3gfFvgN4TcYvLhcisL4y4jby4b8YRNL3bF6x+Xly+rTA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767711993; c=relaxed/relaxed;
	bh=K+Od8GxrmnkejjBFN+JWdeN3Q1DWJCSa8u930e/Rdjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e1zGY/iBEDxSre+r8v5ihqFh99iaAvQvyfOlvR9+3dhvx4TTmeyy+8+uut5P5XNOtRx/gVWn3OD/NZ1weBPepPVRZ9fwGAMC6tVC1a30/CRr45Rr6K5Rl4CuebKRAHQa613sY+/sScjF2/TcHMVMrBGMcDFWabe/vpJ5iV81zOqdjdqvnVOg8SCdm7lcWAujRlPUlPKlvfLxPxIwAcNVcnVDun17hDfpAjw/LpKQ3wgMga7k5jChf7iFlbcb0q4NO9sKt/rMdUJOgNPSP00FT2HM6+NDhlWPH6xD4YfjA+VySJjjW0dVO1tK3T6DeZMMIZrANznCMEAIIJrxIXs31Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gIQPkNMh; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gIQPkNMh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlvdN4YL0z2yMJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 02:06:32 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 606F2xx2028393;
	Tue, 6 Jan 2026 15:06:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=K+Od8GxrmnkejjBFN
	+JWdeN3Q1DWJCSa8u930e/Rdjc=; b=gIQPkNMhAj9bvOSCi8rbH85Fizk+SDqmJ
	s2C4QTIyROO+J935xaDzDLAx6SsBL9sEV3dSDCvHtFKGIs88pm9ArxyMZpZ0CGTU
	BkRdrz5Z1OiS3zk5jfRNeXHyt//POrGKfbTnZbg3KJd1x9MYebKpMqNIrSCz90kz
	tzMhUpMDMdpJEdeUtqrZsv0QYaMyljdxgFi9g6FJ03gH41IA3g92i+AOYIBmmSlQ
	/2ZJRCZNPdRh2P9SWnVjPqb44cgBTs3W4iHyiRPEfH1Rh/thn6OoszEQZEPeIBps
	R6MVb4BHA61Yd/eIktEyj+PpLlHzMixwf/XWYXEfTJTHnEXEGG2mg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4betrtkjm2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 15:06:20 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 606F4UI6023157;
	Tue, 6 Jan 2026 15:06:20 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4betrtkjky-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 15:06:20 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 606DV8MT014503;
	Tue, 6 Jan 2026 15:06:19 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4bfeemuywj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 15:06:19 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 606F6EX258917288
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 Jan 2026 15:06:15 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DA79320043;
	Tue,  6 Jan 2026 15:06:14 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8A7FE20040;
	Tue,  6 Jan 2026 15:06:08 +0000 (GMT)
Received: from li-fc74f8cc-3279-11b2-a85c-ef5828687581.ibm.com.com (unknown [9.124.214.6])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  6 Jan 2026 15:06:08 +0000 (GMT)
From: Srish Srinivasan <ssrish@linux.ibm.com>
To: linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, James.Bottomley@HansenPartnership.com,
        jarkko@kernel.org, zohar@linux.ibm.com, nayna@linux.ibm.com,
        rnsastry@linux.ibm.com, linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org, ssrish@linux.ibm.com
Subject: [PATCH v3 4/6] pseries/plpks: add HCALLs for PowerVM Key Wrapping Module
Date: Tue,  6 Jan 2026 20:35:25 +0530
Message-ID: <20260106150527.446525-5-ssrish@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=aaJsXBot c=1 sm=1 tr=0 ts=695d24ec cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=nO4dFLMeAchwtJrxA4IA:9 a=POYjf8jjcDEwoKyR:21
X-Proofpoint-GUID: 3O9WBkDyT7f1i3ALqM4ynwnPYZmr6cN4
X-Proofpoint-ORIG-GUID: gO3Sz3Kwre_WJ086W51DTQakSMEsmfj6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDEyOSBTYWx0ZWRfX6r33HHiCpRQh
 4Y+QuSmEUgz7pozkUjXDqWcbe6UxzYWCX1m5jBQvvpT94j6oIgsy9WHGwJPFlN6dVgL9NMZ/2tb
 zcziPL6JdHd1+/16/9MpOL9L8t6TGmDySMPEzrtX5izDyahgGGkV47LJrpypVDRAblF3mtrQV5I
 yWXZ07rEAtikgQDJITQ9Qoyt+xGY8Yahf2WyE514X6HjVVD9medBulKPa4A9EXDPtMe+GBEslOq
 2Tf4ArOvJrdESDI+BoLv6h/zbc8f4wOa4JFP4DLDmmrFneybcD7mKAVURb8XTS4RV+wgHCSk3Hy
 2kW6nz7YZGzzZCv52GSvZO8EYtCQyXScHvd5+55O6mUk5GVGyCZ7eR/6HhWcE/mlZLCMAIT07lU
 vlnIB1W8jgHI9Uww0Ef2hwSf3pdpEkxlyXqCP1OUK8/ZpiNBRvzWBe3RwfZAMXV3WgNzrYrDoja
 JlpwAlq6KCLLp1/w7MA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601060129
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The hypervisor generated wrapping key is an AES-GCM-256 symmetric key which
is stored in a non-volatile, secure, and encrypted storage called the Power
LPAR Platform KeyStore. It has policy based protections that prevent it
from being read out or exposed to the user.

Implement H_PKS_GEN_KEY, H_PKS_WRAP_OBJECT, and H_PKS_UNWRAP_OBJECT HCALLs
to enable using the PowerVM Key Wrapping Module (PKWM) as a new trust
source for trusted keys. Disallow H_PKS_READ_OBJECT, H_PKS_SIGNED_UPDATE,
and H_PKS_WRITE_OBJECT for objects with the 'wrapping key' policy set.
Capture the availability status for the H_PKS_WRAP_OBJECT interface.

Signed-off-by: Srish Srinivasan <ssrish@linux.ibm.com>
---
 Documentation/arch/powerpc/papr_hcalls.rst |  43 +++
 arch/powerpc/include/asm/plpks.h           |  10 +
 arch/powerpc/platforms/pseries/plpks.c     | 342 ++++++++++++++++++++-
 3 files changed, 393 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/powerpc/papr_hcalls.rst b/Documentation/arch/powerpc/papr_hcalls.rst
index 805e1cb9bab9..14e39f095a1c 100644
--- a/Documentation/arch/powerpc/papr_hcalls.rst
+++ b/Documentation/arch/powerpc/papr_hcalls.rst
@@ -300,6 +300,49 @@ H_HTM supports setup, configuration, control and dumping of Hardware Trace
 Macro (HTM) function and its data. HTM buffer stores tracing data for functions
 like core instruction, core LLAT and nest.
 
+**H_PKS_GEN_KEY**
+
+| Input: authorization, objectlabel, objectlabellen, policy, out, outlen
+| Out: *Hypervisor Generated Key, or None when the wrapping key policy is set*
+| Return Value: *H_SUCCESS, H_Function, H_State, H_R_State, H_Parameter, H_P2,
+                H_P3, H_P4, H_P5, H_P6, H_Authority, H_Nomem, H_Busy, H_Resource,
+                H_Aborted*
+
+H_PKS_GEN_KEY is used to have the hypervisor generate a new random key.
+This key is stored as an object in the Power LPAR Platform KeyStore with
+the provided object label. With the wrapping key policy set the key is only
+visible to the hypervisor, while the key's label would still be visible to
+the user. Generation of wrapping keys is supported only for a key size of
+32 bytes.
+
+**H_PKS_WRAP_OBJECT**
+
+| Input: authorization, wrapkeylabel, wrapkeylabellen, objectwrapflags, in,
+|        inlen, out, outlen, continue-token
+| Out: *continue-token, byte size of wrapped object, wrapped object*
+| Return Value: *H_SUCCESS, H_Function, H_State, H_R_State, H_Parameter, H_P2,
+                H_P3, H_P4, H_P5, H_P6, H_P7, H_P8, H_P9, H_Authority, H_Invalid_Key,
+                H_NOT_FOUND, H_Busy, H_LongBusy, H_Aborted*
+
+H_PKS_WRAP_OBJECT is used to wrap an object using a wrapping key stored in the
+Power LPAR Platform KeyStore and return the wrapped object to the caller. The
+caller provides a label to a wrapping key with the 'wrapping key' policy set,
+which must have been previously created with H_PKS_GEN_KEY. The provided object
+is then encrypted with the wrapping key and additional metadata and the result
+is returned to the caller.
+
+
+**H_PKS_UNWRAP_OBJECT**
+
+| Input: authorization, objectwrapflags, in, inlen, out, outlen, continue-token
+| Out: *continue-token, byte size of unwrapped object, unwrapped object*
+| Return Value: *H_SUCCESS, H_Function, H_State, H_R_State, H_Parameter, H_P2,
+                H_P3, H_P4, H_P5, H_P6, H_P7, H_Authority, H_Unsupported, H_Bad_Data,
+                H_NOT_FOUND, H_Invalid_Key, H_Busy, H_LongBusy, H_Aborted*
+
+H_PKS_UNWRAP_OBJECT is used to unwrap an object that was previously warapped with
+H_PKS_WRAP_OBJECT.
+
 References
 ==========
 .. [1] "Power Architecture Platform Reference"
diff --git a/arch/powerpc/include/asm/plpks.h b/arch/powerpc/include/asm/plpks.h
index 8f034588fdf7..e87f90e40d4e 100644
--- a/arch/powerpc/include/asm/plpks.h
+++ b/arch/powerpc/include/asm/plpks.h
@@ -113,6 +113,16 @@ void plpks_early_init_devtree(void);
 int plpks_populate_fdt(void *fdt);
 
 int plpks_config_create_softlink(struct kobject *from);
+
+bool plpks_wrapping_is_supported(void);
+
+int plpks_gen_wrapping_key(void);
+
+int plpks_wrap_object(u8 **input_buf, u32 input_len, u16 wrap_flags,
+		      u8 **output_buf, u32 *output_len);
+
+int plpks_unwrap_object(u8 **input_buf, u32 input_len,
+			u8 **output_buf, u32 *output_len);
 #else // CONFIG_PSERIES_PLPKS
 static inline bool plpks_is_available(void) { return false; }
 static inline u16 plpks_get_passwordlen(void) { BUILD_BUG(); }
diff --git a/arch/powerpc/platforms/pseries/plpks.c b/arch/powerpc/platforms/pseries/plpks.c
index 4a08f51537c8..b97b7750f6a8 100644
--- a/arch/powerpc/platforms/pseries/plpks.c
+++ b/arch/powerpc/platforms/pseries/plpks.c
@@ -9,6 +9,32 @@
 
 #define pr_fmt(fmt) "plpks: " fmt
 
+#define PLPKS_WRAPKEY_COMPONENT	"PLPKSWR"
+#define PLPKS_WRAPKEY_NAME	"default-wrapping-key"
+
+/*
+ * To 4K align the {input, output} buffers to the {UN}WRAP H_CALLs
+ */
+#define PLPKS_WRAPPING_BUF_ALIGN	4096
+
+/*
+ * To ensure the output buffer's length is at least 1024 bytes greater
+ * than the input buffer's length during the WRAP H_CALL
+ */
+#define PLPKS_WRAPPING_BUF_DIFF	1024
+
+#define PLPKS_WRAP_INTERFACE_BIT	3
+#define PLPKS_WRAPPING_KEY_LENGTH	32
+
+#define WRAPFLAG_BE_BIT_SET(be_bit) \
+	BIT_ULL(63 - (be_bit))
+
+#define WRAPFLAG_BE_GENMASK(be_bit_hi, be_bit_lo) \
+	GENMASK_ULL(63 - (be_bit_hi), 63 - (be_bit_lo))
+
+#define WRAPFLAG_BE_FIELD_PREP(be_bit_hi, be_bit_lo, val) \
+	FIELD_PREP(WRAPFLAG_BE_GENMASK(be_bit_hi, be_bit_lo), (val))
+
 #include <linux/delay.h>
 #include <linux/errno.h>
 #include <linux/io.h>
@@ -39,6 +65,7 @@ static u32 supportedpolicies;
 static u32 maxlargeobjectsize;
 static u64 signedupdatealgorithms;
 static u64 wrappingfeatures;
+static bool wrapsupport;
 
 struct plpks_auth {
 	u8 version;
@@ -283,6 +310,7 @@ static int _plpks_get_config(void)
 	maxlargeobjectsize = be32_to_cpu(config->maxlargeobjectsize);
 	signedupdatealgorithms = be64_to_cpu(config->signedupdatealgorithms);
 	wrappingfeatures = be64_to_cpu(config->wrappingfeatures);
+	wrapsupport = config->flags & PPC_BIT8(PLPKS_WRAP_INTERFACE_BIT);
 
 	// Validate that the numbers we get back match the requirements of the spec
 	if (maxpwsize < 32) {
@@ -614,6 +642,9 @@ int plpks_signed_update_var(struct plpks_var *var, u64 flags)
 	if (!(var->policy & PLPKS_SIGNEDUPDATE))
 		return -EINVAL;
 
+	if (var->policy & PLPKS_WRAPPINGKEY)
+		return -EINVAL;
+
 	// Signed updates need the component to be NULL.
 	if (var->component)
 		return -EINVAL;
@@ -696,6 +727,9 @@ int plpks_write_var(struct plpks_var var)
 	if (var.policy & PLPKS_SIGNEDUPDATE)
 		return -EINVAL;
 
+	if (var.policy & PLPKS_WRAPPINGKEY)
+		return -EINVAL;
+
 	auth = construct_auth(PLPKS_OS_OWNER);
 	if (IS_ERR(auth))
 		return PTR_ERR(auth);
@@ -790,6 +824,9 @@ static int plpks_read_var(u8 consumer, struct plpks_var *var)
 	if (var->namelen > PLPKS_MAX_NAME_SIZE)
 		return -EINVAL;
 
+	if (var->policy & PLPKS_WRAPPINGKEY)
+		return -EINVAL;
+
 	auth = construct_auth(consumer);
 	if (IS_ERR(auth))
 		return PTR_ERR(auth);
@@ -845,8 +882,309 @@ static int plpks_read_var(u8 consumer, struct plpks_var *var)
 }
 
 /**
- * plpks_read_os_var() - Fetch the data for the specified variable that is
- * owned by the OS consumer.
+ * plpks_wrapping_is_supported() - Get the H_PKS_WRAP_OBJECT interface
+ * availability status for the LPAR.
+ *
+ * Successful execution of the H_PKS_GET_CONFIG HCALL during initialization
+ * sets bit 3 of the flags variable in the PLPKS config structure if the
+ * H_PKS_WRAP_OBJECT interface is supported.
+ *
+ * Returns: true if the H_PKS_WRAP_OBJECT interface is supported, false if not.
+ */
+bool plpks_wrapping_is_supported(void)
+{
+	return wrapsupport;
+}
+
+/**
+ * plpks_gen_wrapping_key() - Generate a new random key with the 'wrapping key'
+ * policy set.
+ *
+ * The H_PKS_GEN_KEY HCALL makes the hypervisor generate a new random key and
+ * store the key in a PLPKS object with the provided object label. With the
+ * 'wrapping key' policy set, only the label to the newly generated random key
+ * would be visible to the user.
+ *
+ * Possible reasons for the returned errno values:
+ *
+ * -ENXIO	if PLPKS is not supported
+ * -EIO		if PLPKS access is blocked due to the LPAR's state
+ *		if PLPKS modification is blocked due to the LPAR's state
+ *		if an error occurred while processing the request
+ * -EINVAL	if invalid authorization parameter
+ *		if invalid object label parameter
+ *		if invalid object label len parameter
+ *		if invalid or unsupported policy declaration
+ *		if invalid output buffer parameter
+ *		if invalid output buffer length parameter
+ * -EPERM	if access is denied
+ * -ENOMEM	if there is inadequate memory to perform this operation
+ * -EBUSY	if unable to handle the request
+ * -EEXIST	if the object label already exists
+ *
+ * Returns: On success 0 is returned, a negative errno if not.
+ */
+int plpks_gen_wrapping_key(void)
+{
+	unsigned long retbuf[PLPAR_HCALL_BUFSIZE] = { 0 };
+	struct plpks_auth *auth;
+	struct label *label;
+	int rc = 0, pseries_status = 0;
+	struct plpks_var var = {
+		.name = PLPKS_WRAPKEY_NAME,
+		.namelen = strlen(var.name),
+		.policy = PLPKS_WRAPPINGKEY,
+		.os = PLPKS_VAR_LINUX,
+		.component = PLPKS_WRAPKEY_COMPONENT
+	};
+
+	auth = construct_auth(PLPKS_OS_OWNER);
+	if (IS_ERR(auth))
+		return PTR_ERR(auth);
+
+	label = construct_label(var.component, var.os, var.name, var.namelen);
+	if (IS_ERR(label)) {
+		rc = PTR_ERR(label);
+		goto out;
+	}
+
+	rc = plpar_hcall(H_PKS_GEN_KEY, retbuf,
+			 virt_to_phys(auth), virt_to_phys(label),
+			 label->size, var.policy,
+			 NULL, PLPKS_WRAPPING_KEY_LENGTH);
+
+	if (!rc)
+		rc = plpks_confirm_object_flushed(label, auth);
+
+	pseries_status = rc;
+	rc = pseries_status_to_err(rc);
+
+	if (rc && rc != -EEXIST) {
+		pr_err("H_PKS_GEN_KEY failed. pseries_status=%d, rc=%d",
+		       pseries_status, rc);
+	} else {
+		rc = 0;
+	}
+
+	kfree(label);
+out:
+	kfree(auth);
+	return rc;
+}
+EXPORT_SYMBOL_GPL(plpks_gen_wrapping_key);
+
+/**
+ * plpks_wrap_object() - Wrap an object using the default wrapping key stored in
+ * the PLPKS.
+ * @input_buf: buffer containing the data to be wrapped
+ * @input_len: length of the input buffer
+ * @wrap_flags: object wrapping flags
+ * @output_buf: buffer to store the wrapped data
+ * @output_len: length of the output buffer
+ *
+ * The H_PKS_WRAP_OBJECT HCALL wraps an object using a wrapping key stored in
+ * the PLPKS and returns the wrapped object to the caller. The caller provides a
+ * label to the wrapping key with the 'wrapping key' policy set that must have
+ * been previously created with the H_PKS_GEN_KEY HCALL. The provided object is
+ * then encrypted with the wrapping key and additional metadata and the result
+ * is returned to the user. The metadata includes the wrapping algorithm and the
+ * wrapping key name so those parameters are not required during unwrap.
+ *
+ * Possible reasons for the returned errno values:
+ *
+ * -ENXIO	if PLPKS is not supported
+ * -EIO		if PLPKS access is blocked due to the LPAR's state
+ *		if PLPKS modification is blocked due to the LPAR's state
+ *		if an error occurred while processing the request
+ * -EINVAL	if invalid authorization parameter
+ *		if invalid wrapping key label parameter
+ *		if invalid wrapping key label length parameter
+ *		if invalid or unsupported object wrapping flags
+ *		if invalid input buffer parameter
+ *		if invalid input buffer length parameter
+ *		if invalid output buffer parameter
+ *		if invalid output buffer length parameter
+ *		if invalid continue token parameter
+ *		if the wrapping key is not compatible with the wrapping
+ *		algorithm
+ * -EPERM	if access is denied
+ * -ENOENT	if the requested wrapping key was not found
+ * -EBUSY	if unable to handle the request or long running operation
+ *		initiated, retry later.
+ *
+ * Returns: On success 0 is returned, a negative errno if not.
+ */
+int plpks_wrap_object(u8 **input_buf, u32 input_len, u16 wrap_flags,
+		      u8 **output_buf, u32 *output_len)
+{
+	unsigned long retbuf[PLPAR_HCALL9_BUFSIZE] = { 0 };
+	struct plpks_auth *auth;
+	struct label *label;
+	u64 continuetoken = 0;
+	u64 objwrapflags = 0;
+	int rc = 0, pseries_status = 0;
+	bool sb_audit_or_enforce_bit = wrap_flags & BIT(0);
+	bool sb_enforce_bit = wrap_flags & BIT(1);
+	struct plpks_var var = {
+		.name = PLPKS_WRAPKEY_NAME,
+		.namelen = strlen(var.name),
+		.os = PLPKS_VAR_LINUX,
+		.component = PLPKS_WRAPKEY_COMPONENT
+	};
+
+	auth = construct_auth(PLPKS_OS_OWNER);
+	if (IS_ERR(auth))
+		return PTR_ERR(auth);
+
+	label = construct_label(var.component, var.os, var.name, var.namelen);
+	if (IS_ERR(label)) {
+		rc = PTR_ERR(label);
+		goto out;
+	}
+
+	/* Set the consumer password requirement bit. A must have. */
+	objwrapflags |= WRAPFLAG_BE_BIT_SET(3);
+
+	/* Set the wrapping algorithm bit. Just one algorithm option for now */
+	objwrapflags |= WRAPFLAG_BE_FIELD_PREP(60, 63, 0x1);
+
+	if (sb_audit_or_enforce_bit & sb_enforce_bit) {
+		pr_err("Cannot set both audit/enforce and enforce bits.");
+		rc = -EINVAL;
+		goto out_free_label;
+	} else if (sb_audit_or_enforce_bit) {
+		objwrapflags |= WRAPFLAG_BE_BIT_SET(1);
+	} else if (sb_enforce_bit) {
+		objwrapflags |= WRAPFLAG_BE_BIT_SET(2);
+	}
+
+	*output_len = input_len + PLPKS_WRAPPING_BUF_DIFF;
+
+	*output_buf = kzalloc(ALIGN(*output_len, PLPKS_WRAPPING_BUF_ALIGN),
+			      GFP_KERNEL);
+	if (!(*output_buf)) {
+		pr_err("Output buffer allocation failed. Returning -ENOMEM.");
+		rc = -ENOMEM;
+		goto out_free_label;
+	}
+
+	do {
+		rc = plpar_hcall9(H_PKS_WRAP_OBJECT, retbuf,
+				  virt_to_phys(auth), virt_to_phys(label),
+				  label->size, objwrapflags,
+				  virt_to_phys(*input_buf), input_len,
+				  virt_to_phys(*output_buf), *output_len,
+				  continuetoken);
+
+		continuetoken = retbuf[0];
+		pseries_status = rc;
+		rc = pseries_status_to_err(rc);
+	} while (rc == -EBUSY);
+
+	if (rc) {
+		pr_err("H_PKS_WRAP_OBJECT failed. pseries_status=%d, rc=%d",
+		       pseries_status, rc);
+		kfree(*output_buf);
+		*output_buf = NULL;
+	} else {
+		*output_len = retbuf[1];
+	}
+
+out_free_label:
+	kfree(label);
+out:
+	kfree(auth);
+	return rc;
+}
+EXPORT_SYMBOL_GPL(plpks_wrap_object);
+
+/**
+ * plpks_unwrap_object() - Unwrap an object using the default wrapping key
+ * stored in the PLPKS.
+ * @input_buf: buffer containing the data to be unwrapped
+ * @input_len: length of the input buffer
+ * @output_buf: buffer to store the unwrapped data
+ * @output_len: length of the output buffer
+ *
+ * The H_PKS_UNWRAP_OBJECT HCALL unwraps an object that was previously wrapped
+ * using the H_PKS_WRAP_OBJECT HCALL.
+ *
+ * Possible reasons for the returned errno values:
+ *
+ * -ENXIO	if PLPKS is not supported
+ * -EIO		if PLPKS access is blocked due to the LPAR's state
+ *		if PLPKS modification is blocked due to the LPAR's state
+ *		if an error occurred while processing the request
+ * -EINVAL	if invalid authorization parameter
+ *		if invalid or unsupported object unwrapping flags
+ *		if invalid input buffer parameter
+ *		if invalid input buffer length parameter
+ *		if invalid output buffer parameter
+ *		if invalid output buffer length parameter
+ *		if invalid continue token parameter
+ *		if the wrapping key is not compatible with the wrapping
+ *		algorithm
+ *		if the wrapped object's format is not supported
+ *		if the wrapped object is invalid
+ * -EPERM	if access is denied
+ * -ENOENT	if the wrapping key for the provided object was not found
+ * -EBUSY	if unable to handle the request or long running operation
+ *		initiated, retry later.
+ *
+ * Returns: On success 0 is returned, a negative errno if not.
+ */
+int plpks_unwrap_object(u8 **input_buf, u32 input_len, u8 **output_buf,
+			u32 *output_len)
+{
+	unsigned long retbuf[PLPAR_HCALL9_BUFSIZE] = { 0 };
+	struct plpks_auth *auth;
+	u64 continuetoken = 0;
+	u64 objwrapflags = 0;
+	int rc = 0, pseries_status = 0;
+
+	auth = construct_auth(PLPKS_OS_OWNER);
+	if (IS_ERR(auth))
+		return PTR_ERR(auth);
+
+	*output_len = input_len - PLPKS_WRAPPING_BUF_DIFF;
+	*output_buf = kzalloc(ALIGN(*output_len, PLPKS_WRAPPING_BUF_ALIGN),
+			      GFP_KERNEL);
+	if (!(*output_buf)) {
+		pr_err("Output buffer allocation failed. Returning -ENOMEM.");
+		rc = -ENOMEM;
+		goto out;
+	}
+
+	do {
+		rc = plpar_hcall9(H_PKS_UNWRAP_OBJECT, retbuf,
+				  virt_to_phys(auth), objwrapflags,
+				  virt_to_phys(*input_buf), input_len,
+				  virt_to_phys(*output_buf), *output_len,
+				  continuetoken);
+
+		continuetoken = retbuf[0];
+		pseries_status = rc;
+		rc = pseries_status_to_err(rc);
+	} while (rc == -EBUSY);
+
+	if (rc) {
+		pr_err("H_PKS_UNWRAP_OBJECT failed. pseries_status=%d, rc=%d",
+		       pseries_status, rc);
+		kfree(*output_buf);
+		*output_buf = NULL;
+	} else {
+		*output_len = retbuf[1];
+	}
+
+out:
+	kfree(auth);
+	return rc;
+}
+EXPORT_SYMBOL_GPL(plpks_unwrap_object);
+
+/**
+ * plpks_read_os_var() - Fetch the data for the specified variable that is owned
+ * by the OS consumer.
  * @var: variable to be read from the PLPKS
  *
  * The consumer or the owner of the object is the os kernel. The
-- 
2.47.3


