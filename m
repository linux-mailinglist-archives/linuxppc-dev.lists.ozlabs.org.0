Return-Path: <linuxppc-dev+bounces-8833-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D39ABF235
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 12:58:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2T1K5PWlz3c3l;
	Wed, 21 May 2025 20:58:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747825109;
	cv=none; b=GJLGD+C5I1OuHY/jEIgBFaV53X57KKGVtylqHtqESGnfRNmklNXbbfMjT/U4ZZMxD6NpkHfoNCPJIaRLdflPwTXm1SBW0kRRhYIoPrLIfiRf8shxOuHlqKD/vejPxBRtNzeRymNsUT5pBA7cNwUdY+7+gEA2506+6cLeRZkAirxid0eprqKPvwAQD2lZHxg7pc/9rTJDDucibwKq0D0sEWgRe6tOc6OHtZXYOSpmMo/x5vpiGX1ThZ8oEYbb8M5s5Pgw2EYGCOOb+s7SxmttQbuX77+vB9Y46kwxhdY6QoAp7E7gWrphSEoxFUR5cZpIvbxkHA2tkO7pvp4cT/b5iw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747825109; c=relaxed/relaxed;
	bh=h6nWBLUb3tJoieg6uMHTOlSkfwsqMXR5qlqotxgHTQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QylbxbjuajciUvINxXbFeTFdIPt+pKe2dT29/aZqLd1/nlYdLdgC34l7UKi9hCBX/N0Kfw3t5kl2q7UpVUZRMAwgrrcZqCJk3SIsPc4aEGHQYKXTpAht4UVjEu+zgah1iP1OqyjY3Dkeabm0QWNXvXZq+Q/PWHew77iSDJC19JdyirbBwbUy2G5eXWZp7n8MzPBwP3uj0dU+krGxcF+YjPXaQTXDrZaqNmWR5FyftRALvLR74tz3TQ57ibkGFCL7z308kLapSnUi/+81tP3/Whb8dahlW/7CcNV4KRO0sSw6OPznB0ade1MbNyBMrBnNGw8v/wS9IrUsITrgyM/WLg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Sbex4Tlj; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Sbex4Tlj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2T1J0YW1z3c4M
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 20:58:27 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L5wd21024505;
	Wed, 21 May 2025 10:58:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=h6nWBLUb3tJoieg6u
	MHTOlSkfwsqMXR5qlqotxgHTQo=; b=Sbex4TljDGiDecNEaRb6dxHGCYQP/g3dW
	TUqbFPuAETZC+UJjypi6sXe6NaBZXPB2Cogj/i17pPIZ1TAUnznprdyZmZRlp5+N
	GPghI11aeHQNBNeRN1EmbZkALiy0tCu+skJ/RtGmU3DK7aRZuYE/sz3c+F4SlZl5
	m1Kh8lp46WVMott4CO2qqPYYzqruUVuXV3ThEZDHjliPRXBqZ6FF8VuCajI4Ka1p
	hZ8n64x9XFasJdLs5XSBPbGkxCAU/luu510rcaSwH6Cc+WDeG4XO8ouCK8sdeF7b
	WdPnsH7silYNDbnnQ5Fh5nq7E9PFHDNvR/fKrDASaJeanM6NHwGtA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46rxaakwhy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 10:58:10 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54LArS6U002824;
	Wed, 21 May 2025 10:58:09 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46rxaakwhu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 10:58:09 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9shZa024709;
	Wed, 21 May 2025 10:58:09 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46rwkr3tgb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 10:58:08 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54LAw5Zs48038294
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 May 2025 10:58:05 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E59C620043;
	Wed, 21 May 2025 10:58:04 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8E0D020040;
	Wed, 21 May 2025 10:58:02 +0000 (GMT)
Received: from li-fc74f8cc-3279-11b2-a85c-ef5828687581.in.ibm.com (unknown [9.204.203.112])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 21 May 2025 10:58:02 +0000 (GMT)
From: Srish Srinivasan <ssrish@linux.ibm.com>
To: linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org, ajd@linux.ibm.com,
        zohar@linux.ibm.com, nayna@linux.ibm.com, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] powerpc/pseries: Correct secvar format representation for static key management
Date: Wed, 21 May 2025 16:27:57 +0530
Message-ID: <20250521105759.8408-2-ssrish@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250521105759.8408-1-ssrish@linux.ibm.com>
References: <20250521105759.8408-1-ssrish@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=CMEqXQrD c=1 sm=1 tr=0 ts=682db1c2 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=FNRAjOYsECM2cVzVVdoA:9
X-Proofpoint-ORIG-GUID: WoFquhr46etRrQkz54qW1eekvK2bJfxW
X-Proofpoint-GUID: -uMCd_DnlEBKD0buM0YB2fYneUvtDYy_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDEwNSBTYWx0ZWRfXzA6lg5sQCEyM JtrDAbGZLs3St1/0fM8K5O+aTne39z0D110+hMTsN/FZD2UACBC/LI3Mdl6w3bpA5CgTTW3JaKU KEDKAdWpIPzROSFKLE5eb9110K7VTRiCDr3LSoXZ+fNo7jI9wOY7cFAChNZgAEVV9gUzgRZNVs7
 ykGNblYb5Ah+2gbl7IV1vjAmgM67byihsr0hVYqCuTpHgksBvtj4fifu/cuCJXHcm2QI7PxfTAD iAs0D8EKx2f98Me95G+qM4gmxntxzDsRRmdjfHqIKJQFj4x5eTermCbPvXdzJHje9gesEGf/RA9 9KujTHCeXmHaeC5ViriJ4tYrGicEMLSYiULhtb7yzM5gJCMDkFpGcSqjmCZNJO4OrMyxXx2HTdA
 R7kZZCDJHwGqMaTG/GjODLh1zbDV1yfhLFG9gC47yCAnzaCCHi4JcZAwE50c7YaDTAuHO/ib
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_03,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210105
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On a PLPKS enabled PowerVM LPAR, the secvar format property for static
key management is misrepresented as "ibm,plpks-sb-unknown", creating
reason for confusion.

Static key management mode uses fixed, built-in keys. Dynamic key
management mode allows keys to be updated in production to handle
security updates without firmware rebuilds.

Define a function named plpks_get_sb_keymgmt_mode() to retrieve the
key management mode based on the existence of the SB_VERSION property
in the firmware.

Set the secvar format property to either "ibm,plpks-sb-v<version>" or
"ibm,plpks-sb-v0" based on the key management mode, and return the
length of the secvar format property.

Co-developed-by: Souradeep <soura@imap.linux.ibm.com>
Signed-off-by: Souradeep <soura@imap.linux.ibm.com>
Signed-off-by: Srish Srinivasan <ssrish@linux.ibm.com>
Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Nayna Jain <nayna@linux.ibm.com>
---
 Documentation/ABI/testing/sysfs-secvar        |  9 ++-
 arch/powerpc/platforms/pseries/plpks-secvar.c | 76 +++++++++++--------
 2 files changed, 52 insertions(+), 33 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-secvar b/Documentation/ABI/testing/sysfs-secvar
index 857cf12b0904..45281888e520 100644
--- a/Documentation/ABI/testing/sysfs-secvar
+++ b/Documentation/ABI/testing/sysfs-secvar
@@ -22,9 +22,12 @@ Description:	A string indicating which backend is in use by the firmware.
 		and is expected to be "ibm,edk2-compat-v1".
 
 		On pseries/PLPKS, this is generated by the kernel based on the
-		version number in the SB_VERSION variable in the keystore, and
-		has the form "ibm,plpks-sb-v<version>", or
-		"ibm,plpks-sb-unknown" if there is no SB_VERSION variable.
+		version number in the SB_VERSION variable in the keystore. The
+		version numbering in the SB_VERSION variable starts from 1. The
+		format string takes the form "ibm,plpks-sb-v<version>" in the
+		case of dynamic key management mode. Otherwise, for any error in
+		reading SB_VERSION it takes the form "ibm,plpks-sb-v0",
+		indicating that the key management mode is static.
 
 What:		/sys/firmware/secvar/vars/<variable name>
 Date:		August 2019
diff --git a/arch/powerpc/platforms/pseries/plpks-secvar.c b/arch/powerpc/platforms/pseries/plpks-secvar.c
index 257fd1f8bc19..767e5e8c6990 100644
--- a/arch/powerpc/platforms/pseries/plpks-secvar.c
+++ b/arch/powerpc/platforms/pseries/plpks-secvar.c
@@ -152,39 +152,55 @@ static int plpks_set_variable(const char *key, u64 key_len, u8 *data,
 	return rc;
 }
 
-// PLPKS dynamic secure boot doesn't give us a format string in the same way OPAL does.
-// Instead, report the format using the SB_VERSION variable in the keystore.
-// The string is made up by us, and takes the form "ibm,plpks-sb-v<n>" (or "ibm,plpks-sb-unknown"
-// if the SB_VERSION variable doesn't exist). Hypervisor defines the SB_VERSION variable as a
-// "1 byte unsigned integer value".
-static ssize_t plpks_secvar_format(char *buf, size_t bufsize)
+/*
+ * Return the key management mode.
+ *
+ * SB_VERSION is defined as a "1 byte unsigned integer value", taking values
+ * starting from 1. It is owned by the Partition Firmware and its presence
+ * indicates that the key management mode is dynamic. Any failure in
+ * reading SB_VERSION defaults the key management mode to static. The error
+ * codes -ENOENT or -EPERM are expected in static key management mode. An
+ * unexpected error code will have to be investigated. Only signed variables
+ * have null bytes in their names, SB_VERSION does not.
+ *
+ * Return 0 to indicate that the key management mode is static. Otherwise
+ * return the SB_VERSION value to indicate that the key management mode is
+ * dynamic.
+ */
+static u8 plpks_get_sb_keymgmt_mode(void)
 {
-	struct plpks_var var = {0};
-	ssize_t ret;
-	u8 version;
-
-	var.component = NULL;
-	// Only the signed variables have null bytes in their names, this one doesn't
-	var.name = "SB_VERSION";
-	var.namelen = strlen(var.name);
-	var.datalen = 1;
-	var.data = &version;
-
-	// Unlike the other vars, SB_VERSION is owned by firmware instead of the OS
-	ret = plpks_read_fw_var(&var);
-	if (ret) {
-		if (ret == -ENOENT) {
-			ret = snprintf(buf, bufsize, "ibm,plpks-sb-unknown");
-		} else {
-			pr_err("Error %ld reading SB_VERSION from firmware\n", ret);
-			ret = -EIO;
-		}
-		goto err;
+	u8 mode;
+	ssize_t rc;
+	struct plpks_var var = {
+		.component = NULL,
+		.name = "SB_VERSION",
+		.namelen = 10,
+		.datalen = 1,
+		.data = &mode,
+	};
+
+	rc = plpks_read_fw_var(&var);
+	if (rc) {
+		if (rc != -ENOENT && rc != -EPERM)
+			pr_info("Error %ld reading SB_VERSION from firmware\n", rc);
+		mode = 0;
 	}
+	return mode;
+}
 
-	ret = snprintf(buf, bufsize, "ibm,plpks-sb-v%hhu", version);
-err:
-	return ret;
+/*
+ * PLPKS dynamic secure boot doesn't give us a format string in the same way
+ * OPAL does. Instead, report the format using the SB_VERSION variable in the
+ * keystore. The string, made up by us, takes the form of either
+ * "ibm,plpks-sb-v<n>" or "ibm,plpks-sb-v0", based on the key management mode,
+ * and return the length of the secvar format property.
+ */
+static ssize_t plpks_secvar_format(char *buf, size_t bufsize)
+{
+	u8 mode;
+
+	mode = plpks_get_sb_keymgmt_mode();
+	return snprintf(buf, bufsize, "ibm,plpks-sb-v%hhu", mode);
 }
 
 static int plpks_max_size(u64 *max_size)
-- 
2.47.1


