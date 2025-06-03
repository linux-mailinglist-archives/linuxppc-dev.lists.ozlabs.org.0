Return-Path: <linuxppc-dev+bounces-9092-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1EEACC3CB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Jun 2025 11:58:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bBR3b090Zz2yRn;
	Tue,  3 Jun 2025 19:58:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748944682;
	cv=none; b=I9Xv2WY10pFsyBzSvwKH7j9YHKpitBAohssTLNMqp/b/lOHAURA/qUcj9V4CJEx/3GUYRvOp36YXBhGMwVk9dTlfn4vsypMUbT2PjwuMBwToryEaqcHt8TudQtd9sSCVse2efoke124PbunrGNa3RSnDAIb1pA4DN587kSG7/P8U9VIEkc/jvv5RAb57zzKmWKo4kN16GWUBWOl+cp5JodJrMrRlPUk94GsaLac+cv3o4LBfakCx0exIDetMMES91r2zluoVdSYD7zJeeTK3jRgtra92w/J2G2QHuIWlTOSIpxLkx+v7jdAbYhcc70iE3d01WQywIYBqzpkryXir5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748944682; c=relaxed/relaxed;
	bh=wmzFqBJbcjrL+CWfY0ZbYCONlwyjWQK7JNaPcqkMwyw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cXXjxM9BfqevXKdiN5IsIA7JJM9OCrGt9iibRF9SaH7ya3vHaWwOySKw3LaO1J8oCLxhXTPNnLwcTxoIARO+GH0F8iMDESx3crOaFAdTZxJKBCKJoi21L9v533ZILGIYXhcQwwVhs0N6J3bkcDLfXhLV/7/DKsebgJc4WULKIIQI9//i3PQE8mNwXwW2f+r7DwRApJmDXJwgDdmLVkq/AHu1ZbUNEvJGmCRvzKUg7oivNclBg36/By3XIdwEEZ3kQwNtumDmCUrD+uNQPPj7DAtDDhKdAcxpfPYnT/yCwUArMN3Gg0SSS67zI4wDtifeFEowIQKDvTFT7Deid+weLw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PkhVd2Ud; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PkhVd2Ud;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bBR3Z0310z2y8l
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Jun 2025 19:58:01 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553836Df019729;
	Tue, 3 Jun 2025 09:57:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=wmzFqBJbcjrL+CWfY
	0ZbYCONlwyjWQK7JNaPcqkMwyw=; b=PkhVd2UdwIGFunXvbttTUKd4wDB/b0sm4
	MJ85iSuoYEQwl5Sd5QrVCJhBcW/p+c5hjyv6ogPSeg4p2zmEIO2bFGjWyZjHjDCb
	FZLYpojxeg99aC0o8D63D94EHXUew+hMicaTnDIw4sfUp7fZPr8wW6PiFhC4Ssb+
	jGtOPjsIUMGb0kq6FL3Saqw5toqAvQ+QCaKcJogfuR2ThaIZrGCaxpwoW9I6SgB5
	jz0JtHM/YgqVahWeG8LtwXzomKKMRc554MAKibFFDGSCTpCoKfXJJSTxxQgDW070
	LJKKxwytS0ImEar48K/02B6w05j1JTrwBSnfCQB9zovHmNMYRVykQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 471geykmwc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jun 2025 09:57:48 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5539sInB027153;
	Tue, 3 Jun 2025 09:57:48 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 471geykmw4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jun 2025 09:57:48 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5535II2e022530;
	Tue, 3 Jun 2025 09:57:47 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 470c3tacrm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jun 2025 09:57:47 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5539vhjZ56885592
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Jun 2025 09:57:43 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5E12220040;
	Tue,  3 Jun 2025 09:57:43 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8C4462004D;
	Tue,  3 Jun 2025 09:57:40 +0000 (GMT)
Received: from li-fc74f8cc-3279-11b2-a85c-ef5828687581.in.ibm.com (unknown [9.204.203.112])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  3 Jun 2025 09:57:40 +0000 (GMT)
From: Srish Srinivasan <ssrish@linux.ibm.com>
To: linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org, ajd@linux.ibm.com,
        zohar@linux.ibm.com, nayna@linux.ibm.com, rnsastry@linux.ibm.com,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] powerpc/pseries: Correct secvar format representation for static key management
Date: Tue,  3 Jun 2025 15:27:34 +0530
Message-ID: <20250603095736.99007-2-ssrish@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250603095736.99007-1-ssrish@linux.ibm.com>
References: <20250603095736.99007-1-ssrish@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=Pq2TbxM3 c=1 sm=1 tr=0 ts=683ec71c cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=FNRAjOYsECM2cVzVVdoA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA3OCBTYWx0ZWRfX24Dt9kdk0mi/ +gTkdg5SNgvkZOiN84fULAOwI9jI1s+bp5zHjisOCv5Ia+gX1bZPZj1tjFVszOck+ulVVh6J9g2 O1kALwUoN3RwStV2ETvoH+qTTwze+kwh4GOCZvdgsAIer71t3J6z4FJ5chd6YodN7YgfFAzHUFe
 eAf1sr7OB7zfulT9j10vfmc6HF3X2oCudhcVEvKY3yTO2ejXYjzyaFjs7qO2uLw6Ph2gpb0ROQ5 Qz8TSIkgK8nTNbF015arbHF375ipsyKZfDRvTD5I6XTvU3waGOwwxJZDlv06TYQhkrBIp1SY1bi ZdPQH5FW8R9QvEkRIRTI5HMZ6+EYBnJRf83mmtwrg/rCvlRbH8bAdlSqGIp3N2kHWJrP5Rd4NP5
 YJ5DuK9v6mN0FCod9UiEGPgmZglnfVncqqyEvYbjjLSqrFf4e0bQuX8IO70tmWED6y5CFey8
X-Proofpoint-GUID: edzYsGddDcnJmr5AjWJHG-pJFPdI6BUK
X-Proofpoint-ORIG-GUID: dD96C7PSr-dR13T_96mb_5395dLUa6u2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 mlxscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506030078
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
Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>
---
 Documentation/ABI/testing/sysfs-secvar        | 10 ++-
 arch/powerpc/platforms/pseries/plpks-secvar.c | 76 +++++++++++--------
 2 files changed, 53 insertions(+), 33 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-secvar b/Documentation/ABI/testing/sysfs-secvar
index 857cf12b0904..f001a4f4bd2e 100644
--- a/Documentation/ABI/testing/sysfs-secvar
+++ b/Documentation/ABI/testing/sysfs-secvar
@@ -22,9 +22,13 @@ Description:	A string indicating which backend is in use by the firmware.
 		and is expected to be "ibm,edk2-compat-v1".
 
 		On pseries/PLPKS, this is generated by the kernel based on the
-		version number in the SB_VERSION variable in the keystore, and
-		has the form "ibm,plpks-sb-v<version>", or
-		"ibm,plpks-sb-unknown" if there is no SB_VERSION variable.
+		version number in the SB_VERSION variable in the keystore. The
+		version numbering in the SB_VERSION variable starts from 1. The
+		format string takes the form "ibm,plpks-sb-v<version>" in the
+		case of dynamic key management mode. If the SB_VERSION variable
+		does not exist (or there is an error while reading it), it takes
+		the form "ibm,plpks-sb-v0", indicating that the key management
+		mode is static.
 
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


