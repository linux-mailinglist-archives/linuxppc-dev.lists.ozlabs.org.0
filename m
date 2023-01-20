Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59975674ECF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 08:58:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NysMD1Wk5z3fLX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 18:58:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KqfIoJmG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KqfIoJmG;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nys1v0y9mz3fGx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 18:43:46 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30K6U130017292;
	Fri, 20 Jan 2023 07:43:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=hP9qjlGVsrBjTqu2sisIkUsIKpm1YIbazfgyAY8cBmo=;
 b=KqfIoJmGJEmyQsFPaLr9B5I2N5fRuXxzyQmWJlv+dBZU7Ourr/PCPRSq6uiZx3+RkghB
 4JNVDxHUZl2NHDyWHJl8UpRYX03Xo9+j6m4vueiNFPBuBVfYVXfu0ZlJbtTa5xwkN4hR
 IzLt8M3HAI91I5DPyFkaMefcCp3kt7j+AZdtH+rIY70eM4dENgSg7PBTNH6PlVBgaLWO
 1b7QySY144vMuSr6eMRRx+vPa0tQM+eGEwhLstGyyo/duCHzSaK/85EFEUFO/FWHg1wM
 6Or9cldYAfwe3WBN39tYJ6qF96bC5dbH/CkHvu/uoEbLRWv52aSVMKSw3DGZz8tEul2Z aA== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n7nr9hed8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jan 2023 07:43:41 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30JJXD1R030244;
	Fri, 20 Jan 2023 07:43:39 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3n3m16njj7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jan 2023 07:43:39 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30K7haQN22217146
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Jan 2023 07:43:36 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 946AC2004D;
	Fri, 20 Jan 2023 07:43:36 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9F76320040;
	Fri, 20 Jan 2023 07:43:35 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 20 Jan 2023 07:43:35 +0000 (GMT)
Received: from jarvis-ozlabs-ibm-com.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 28A0360972;
	Fri, 20 Jan 2023 18:43:30 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org
Subject: [PATCH v4 15/24] powerpc/pseries: Expose PLPKS config values, support additional fields
Date: Fri, 20 Jan 2023 18:42:57 +1100
Message-Id: <20230120074306.1326298-16-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120074306.1326298-1-ajd@linux.ibm.com>
References: <20230120074306.1326298-1-ajd@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hBWZ4aXL3kv8_pynrOGj2V_wjnwfFTZ4
X-Proofpoint-GUID: hBWZ4aXL3kv8_pynrOGj2V_wjnwfFTZ4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-20_04,2023-01-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 clxscore=1015 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301200070
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: sudhakar@linux.ibm.com, bgray@linux.ibm.com, erichte@linux.ibm.com, gregkh@linuxfoundation.org, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com, gjoyce@linux.ibm.com, ruscur@russell.cc, gcwilson@linux.ibm.com, joel@jms.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nayna Jain <nayna@linux.ibm.com>

The plpks driver uses the H_PKS_GET_CONFIG hcall to retrieve configuration
and status information about the PKS from the hypervisor.

Update _plpks_get_config() to handle some additional fields. Add getter
functions to allow the PKS configuration information to be accessed from
other files. Validate that the values we're getting comply with the spec.

While we're here, move the config struct in _plpks_get_config() off the
stack - it's getting large and we also need to make sure it doesn't cross
a page boundary.

Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
[ajd: split patch, extend to support additional v3 API fields, minor fixes]
Co-developed-by: Andrew Donnellan <ajd@linux.ibm.com>
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
Signed-off-by: Russell Currey <ruscur@russell.cc>

---

v3: Merge plpks fixes and signed update series with secvar series

    Refresh config values in plpks_get_usedspace() (ajd)

    Validate the config values being returned comply with spec (ruscur)

    Return maxobjlabelsize as is (ruscur)

    Move plpks.h to include/asm (ruscur)

    Fix checkpatch checks (ruscur)
---
 arch/powerpc/include/asm/plpks.h       |  58 ++++++++++
 arch/powerpc/platforms/pseries/plpks.c | 149 +++++++++++++++++++++++--
 2 files changed, 195 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/plpks.h b/arch/powerpc/include/asm/plpks.h
index 6466aadd7145..7c5f51a9af7c 100644
--- a/arch/powerpc/include/asm/plpks.h
+++ b/arch/powerpc/include/asm/plpks.h
@@ -96,6 +96,64 @@ int plpks_read_fw_var(struct plpks_var *var);
  */
 int plpks_read_bootloader_var(struct plpks_var *var);
 
+/**
+ * Returns if PKS is available on this LPAR.
+ */
+bool plpks_is_available(void);
+
+/**
+ * Returns version of the Platform KeyStore.
+ */
+u8 plpks_get_version(void);
+
+/**
+ * Returns hypervisor storage overhead per object, not including the size of
+ * the object or label. Only valid for config version >= 2
+ */
+u16 plpks_get_objoverhead(void);
+
+/**
+ * Returns maximum password size. Must be >= 32 bytes
+ */
+u16 plpks_get_maxpwsize(void);
+
+/**
+ * Returns maximum object size supported by Platform KeyStore.
+ */
+u16 plpks_get_maxobjectsize(void);
+
+/**
+ * Returns maximum object label size supported by Platform KeyStore.
+ */
+u16 plpks_get_maxobjectlabelsize(void);
+
+/**
+ * Returns total size of the configured Platform KeyStore.
+ */
+u32 plpks_get_totalsize(void);
+
+/**
+ * Returns used space from the total size of the Platform KeyStore.
+ */
+u32 plpks_get_usedspace(void);
+
+/**
+ * Returns bitmask of policies supported by the hypervisor.
+ */
+u32 plpks_get_supportedpolicies(void);
+
+/**
+ * Returns maximum byte size of a single object supported by the hypervisor.
+ * Only valid for config version >= 3
+ */
+u32 plpks_get_maxlargeobjectsize(void);
+
+/**
+ * Returns bitmask of signature algorithms supported for signed updates.
+ * Only valid for config version >= 3
+ */
+u64 plpks_get_signedupdatealgorithms(void);
+
 #endif // CONFIG_PSERIES_PLPKS
 
 #endif // _ASM_POWERPC_PLPKS_H
diff --git a/arch/powerpc/platforms/pseries/plpks.c b/arch/powerpc/platforms/pseries/plpks.c
index 91f3f623a2c7..1189246b03dc 100644
--- a/arch/powerpc/platforms/pseries/plpks.c
+++ b/arch/powerpc/platforms/pseries/plpks.c
@@ -24,8 +24,16 @@ static u8 *ospassword;
 static u16 ospasswordlength;
 
 // Retrieved with H_PKS_GET_CONFIG
+static u8 version;
+static u16 objoverhead;
 static u16 maxpwsize;
 static u16 maxobjsize;
+static s16 maxobjlabelsize;
+static u32 totalsize;
+static u32 usedspace;
+static u32 supportedpolicies;
+static u32 maxlargeobjectsize;
+static u64 signedupdatealgorithms;
 
 struct plpks_auth {
 	u8 version;
@@ -206,32 +214,149 @@ static struct label *construct_label(char *component, u8 varos, u8 *name,
 static int _plpks_get_config(void)
 {
 	unsigned long retbuf[PLPAR_HCALL_BUFSIZE] = { 0 };
-	struct {
+	struct config {
 		u8 version;
 		u8 flags;
-		__be32 rsvd0;
+		__be16 rsvd0;
+		__be16 objoverhead;
 		__be16 maxpwsize;
 		__be16 maxobjlabelsize;
 		__be16 maxobjsize;
 		__be32 totalsize;
 		__be32 usedspace;
 		__be32 supportedpolicies;
-		__be64 rsvd1;
-	} __packed config;
+		__be32 maxlargeobjectsize;
+		__be64 signedupdatealgorithms;
+		u8 rsvd1[476];
+	} __packed * config;
 	size_t size;
-	int rc;
+	int rc = 0;
+
+	size = sizeof(*config);
+
+	// Config struct must not cross a page boundary. So long as the struct
+	// size is a power of 2, this should be fine as alignment is guaranteed
+	config = kzalloc(size, GFP_KERNEL);
+	if (!config) {
+		rc = -ENOMEM;
+		goto err;
+	}
+
+	rc = plpar_hcall(H_PKS_GET_CONFIG, retbuf, virt_to_phys(config), size);
+
+	if (rc != H_SUCCESS) {
+		rc = pseries_status_to_err(rc);
+		goto err;
+	}
+
+	version = config->version;
+	objoverhead = be16_to_cpu(config->objoverhead);
+	maxpwsize = be16_to_cpu(config->maxpwsize);
+	maxobjsize = be16_to_cpu(config->maxobjsize);
+	maxobjlabelsize = be16_to_cpu(config->maxobjlabelsize);
+	totalsize = be32_to_cpu(config->totalsize);
+	usedspace = be32_to_cpu(config->usedspace);
+	supportedpolicies = be32_to_cpu(config->supportedpolicies);
+	maxlargeobjectsize = be32_to_cpu(config->maxlargeobjectsize);
+	signedupdatealgorithms = be64_to_cpu(config->signedupdatealgorithms);
+
+	// Validate that the numbers we get back match the requirements of the spec
+	if (maxpwsize < 32) {
+		pr_err("Invalid Max Password Size received from hypervisor (%d < 32)\n", maxpwsize);
+		rc = -EIO;
+		goto err;
+	}
+
+	if (maxobjlabelsize < 255) {
+		pr_err("Invalid Max Object Label Size received from hypervisor (%d < 255)\n",
+		       maxobjlabelsize);
+		rc = -EIO;
+		goto err;
+	}
 
-	size = sizeof(config);
+	if (totalsize < 4096) {
+		pr_err("Invalid Total Size received from hypervisor (%d < 4096)\n", totalsize);
+		rc = -EIO;
+		goto err;
+	}
+
+	if (version >= 3 && maxlargeobjectsize >= 65536 && maxobjsize != 0xFFFF) {
+		pr_err("Invalid Max Object Size (0x%x != 0xFFFF)\n", maxobjsize);
+		rc = -EIO;
+		goto err;
+	}
+
+err:
+	kfree(config);
+	return rc;
+}
+
+u8 plpks_get_version(void)
+{
+	return version;
+}
 
-	rc = plpar_hcall(H_PKS_GET_CONFIG, retbuf, virt_to_phys(&config), size);
+u16 plpks_get_objoverhead(void)
+{
+	return objoverhead;
+}
 
-	if (rc != H_SUCCESS)
-		return pseries_status_to_err(rc);
+u16 plpks_get_maxpwsize(void)
+{
+	return maxpwsize;
+}
 
-	maxpwsize = be16_to_cpu(config.maxpwsize);
-	maxobjsize = be16_to_cpu(config.maxobjsize);
+u16 plpks_get_maxobjectsize(void)
+{
+	return maxobjsize;
+}
+
+u16 plpks_get_maxobjectlabelsize(void)
+{
+	return maxobjlabelsize;
+}
+
+u32 plpks_get_totalsize(void)
+{
+	return totalsize;
+}
+
+u32 plpks_get_usedspace(void)
+{
+	// Unlike other config values, usedspace regularly changes as objects
+	// are updated, so we need to refresh.
+	int rc = _plpks_get_config();
+	if (rc) {
+		pr_err("Couldn't get config, rc: %d\n", rc);
+		return 0;
+	}
+	return usedspace;
+}
+
+u32 plpks_get_supportedpolicies(void)
+{
+	return supportedpolicies;
+}
+
+u32 plpks_get_maxlargeobjectsize(void)
+{
+	return maxlargeobjectsize;
+}
+
+u64 plpks_get_signedupdatealgorithms(void)
+{
+	return signedupdatealgorithms;
+}
+
+bool plpks_is_available(void)
+{
+	int rc;
+
+	rc = _plpks_get_config();
+	if (rc)
+		return false;
 
-	return 0;
+	return true;
 }
 
 static int plpks_confirm_object_flushed(struct label *label,
-- 
2.39.0

