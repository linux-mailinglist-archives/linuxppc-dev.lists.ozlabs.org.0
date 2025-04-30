Return-Path: <linuxppc-dev+bounces-8179-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC11AA4644
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Apr 2025 11:04:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZnWTB3hnhz2yjV;
	Wed, 30 Apr 2025 19:04:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746003854;
	cv=none; b=mxF0vAz+ULzbxN2MjCm6mnSAMwqR9fdfOdNZqVi2GBo0r28MFLpB3ox7wVUgPWIvfhu2qnW0IJZiN2CWocvSZ6XaEqWW3nL7rDrkMQBX/7mz3+jMpbMl+YvAyusm3iRQ6tgsawOI7pKVKbNUDUo5xGUSgz0XNs5rq0DMzGJo+Ys4to+VPpJBIiaxt44r3fuwDQa8fp3X6JsLy5PkMkBJNSAfeBeUWPyTlM9J0baQvgHKKXit3JFhgjfOy6Gc7h1I/8oVZIl9ySQMuT/aMPx9CnvFvkFWvedq26xNTQHHKvrTlxNMlr7GGUOU60OmrBFsO40fSUj1+n/OwKGUjLbCug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746003854; c=relaxed/relaxed;
	bh=Zumhz/f/NeuhysH9wnyORwBkCLTtfSiGRadpRGVjBfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cs0ynddVVSBytSiyMiCvxP/TjCHuzJMCM8e/UkPLLVctF1yBkBnP9tG0R5i4x4t4eIzgvTYYGZawx7JzsjeTH7Il1AGUjueZ8HXSkymp7oiZkZtOhvHrdwZokA7j3fbAbv2f0+LA3dj6RBoVMIL1F9JVyqxECFziTnpkM+ve8VvZFLSLjn6M9wb0HxcSZWe/3TZ3zoE2mMcnHftJDMdTlqtCB83+BW5pYrk3vXNiOQW57dPqNA+1aQ480LMFOWuIGt2vPc67VEWFV5BClu9dz0RWSzJmMxJt8W4x4weg3CBT9lsLacm3Bk3kF3O64Xs3aVjchrbeRhV/vSaI5D1Byg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XLboUL3X; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XLboUL3X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZnWT94Nzxz3blg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Apr 2025 19:04:13 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TNkP8p027617;
	Wed, 30 Apr 2025 09:04:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=Zumhz/f/NeuhysH9w
	nyORwBkCLTtfSiGRadpRGVjBfk=; b=XLboUL3X+nzBXTMaBGcZfaqjk3SZdWgZD
	UDLqy6F3ewOxq2kPhl3aOz2qdVgKu5kCnu3HufjwQUgcxg4nIG/huK9RoiK3EKw8
	2IfpIHFUQOmxS/63HJoyTgthaDApAdfdacuPfE1jwVFQewH0jFx0Hhlsr3duSSI6
	XNzSj3LAl5tvFXagIMjU6/HE2mcFUm1MwgyJcP+xCIqz4+aLEvJq+DdO2X6C4qbi
	r1zjOj8olqWynqlnnPZrFdGyXFZbyw7oGY8uLMyCB5Tcs/RdaLQBvcGRIoxYY/Iv
	C30hOfv7bGCJGWUbOq+o5jLUPl5RfsQzIONdhGAHyQMOC08u4i+NQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46b8r0sqm6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 09:04:01 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53U941h4020790;
	Wed, 30 Apr 2025 09:04:01 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46b8r0sqm2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 09:04:01 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53U71dUj016584;
	Wed, 30 Apr 2025 09:04:00 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 469a70f8y1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 09:04:00 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53U93udV20513234
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Apr 2025 09:03:56 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7EC9D20065;
	Wed, 30 Apr 2025 09:03:56 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B86FA20043;
	Wed, 30 Apr 2025 09:03:53 +0000 (GMT)
Received: from li-fc74f8cc-3279-11b2-a85c-ef5828687581.ibm.com.com (unknown [9.39.31.221])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 30 Apr 2025 09:03:53 +0000 (GMT)
From: Srish Srinivasan <ssrish@linux.ibm.com>
To: linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org, ajd@linux.ibm.com,
        zohar@linux.ibm.com, nayna@linux.ibm.com, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] powerpc/pseries: Correct secvar format representation for static key management
Date: Wed, 30 Apr 2025 14:33:48 +0530
Message-ID: <20250430090350.30023-2-ssrish@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250430090350.30023-1-ssrish@linux.ibm.com>
References: <20250430090350.30023-1-ssrish@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA2MCBTYWx0ZWRfX+13vK5Gh/K/O n4H5UJgNIhNxU6Zfnfiy7DxWBznYrqX3dyDGDShB1Yj7yNdk/k6EB3YMb8kB2HxX+CvC7wWLiU6 UeczulnXHn4KjQRbvWfB6WWWfaxUYfHCxy+zv98owRN1d29/z/sCZzZdZeH8pg2a670DDEyhiYd
 stDJ9HA2U7Q8B84EivqmOGg1JRUsr7ZKIrWTTmN5hXBOkvizeSVACNM0WKIt87Ft0ViBPOyeKg8 c/E6Rh2LmQkZkY0xEG9WO3YpNe+KJM09GYOK03V2/J35SYiwWadUIiqvzKt1NmqjvW1VF5BAdd6 4kACtKBFViIldVDItglnR2Zh8inACBTVKfgm7QZIkc/plXyJ2dW7BTsj/Zvbjb+6hkaEOnUVqTx
 5DKS9nbn7GOaHtVet72YEffFVL7GJgW0xb3lQz/BlfLplaUR8BVubvTz05kRtTBFszO04+iJ
X-Authority-Analysis: v=2.4 cv=OqdPyz/t c=1 sm=1 tr=0 ts=6811e781 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=bBRBZpPUCD0QNnH9FkMA:9
X-Proofpoint-GUID: BAHk3Ggd2D9hfL-yeVeOSX-T_peAdEW8
X-Proofpoint-ORIG-GUID: dcBnhR0V-OfBfJo4CYr5TItUhOVk5CVe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1011 spamscore=0 mlxlogscore=999
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300060
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
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

Set the secvar format property to either "ibm,plpks-sb-v1" or
"ibm,plpks-sb-v0" based on the key management mode, and return the
length of the secvar format property.

Co-developed-by: Souradeep <soura@imap.linux.ibm.com>
Signed-off-by: Souradeep <soura@imap.linux.ibm.com>
Signed-off-by: Srish Srinivasan <ssrish@linux.ibm.com>
Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/plpks-secvar.c | 70 +++++++++++--------
 1 file changed, 40 insertions(+), 30 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/plpks-secvar.c b/arch/powerpc/platforms/pseries/plpks-secvar.c
index 257fd1f8bc19..d57067a733ab 100644
--- a/arch/powerpc/platforms/pseries/plpks-secvar.c
+++ b/arch/powerpc/platforms/pseries/plpks-secvar.c
@@ -152,39 +152,49 @@ static int plpks_set_variable(const char *key, u64 key_len, u8 *data,
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
+ * SB_VERSION is defined as a "1 byte unsigned integer value". It is owned by
+ * the Partition Firmware and its presence indicates that the key management
+ * mode is dynamic. Only signed variables have null bytes in their names.
+ * SB_VERSION does not.
+ *
+ * Return 1 to indicate that the key management mode is dynamic. Otherwise
+ * return 0, indicating that the key management mode is static.
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
+		pr_info("Error %ld reading SB_VERSION from firmware\n", rc);
+		mode = 0;
 	}
+	return mode;
+}
 
-	ret = snprintf(buf, bufsize, "ibm,plpks-sb-v%hhu", version);
-err:
-	return ret;
+// PLPKS dynamic secure boot doesn't give us a format string in the same way
+// OPAL does. Instead, report the format using the SB_VERSION variable in the
+// keystore. The string, made up by us, takes the form "ibm,plpks-sb-v<n>".Set
+// the secvar format property to either "ibm,plpks-sb-v1" or "ibm,plpks-sb-v0",
+// based on the key management mode, and return the length of the secvar format
+// property.
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


