Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC26C6919E1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 09:17:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCmmb3blTz3fTL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 19:17:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fyaamj8p;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fyaamj8p;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCmVB0m7Qz3cLX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Feb 2023 19:04:33 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31A7sbTN025276;
	Fri, 10 Feb 2023 08:04:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=qZAUAYNyMth+nPFzeTG+4szRNRHxZNhxEcB9Us7i+xk=;
 b=fyaamj8p1x1jmFsM5DVLKU24WAfAX9TFg/hDqv5KfhHCTcXqQ3k29fSVFYFFRlxISqbt
 IkVUZlJQBVnzdoCmanK7ZML1JmzVIk+gMd2L7qi+vVG5nwoNY98rAvZKZf+kRuMKo0XP
 Zzii3V5jsJqBtz4aG1qnjh2DVn3iL0CHh7F8a9melJ/LbR96eyTO7jntPP1QWBT97l4P
 k+ZYhFij2lDIF7gVhHQF9VLhPfLZh4k/9ZzDe3yogtAIVnJa/80EKCMefLVectgmGAve
 gJMtPadDxRn8apZdEu1EyGfllkzEpGwbaFFYI22Bt148SNfzCjyyzRdBJDgPZO+N9oHy nA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nnhxxg9de-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Feb 2023 08:04:28 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31A7uilY031226;
	Fri, 10 Feb 2023 08:04:28 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nnhxxg9c2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Feb 2023 08:04:28 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31A7kBnl002393;
	Fri, 10 Feb 2023 08:04:25 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3nhf06q4vk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Feb 2023 08:04:25 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31A84M8F25494038
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Feb 2023 08:04:22 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A65772004E;
	Fri, 10 Feb 2023 08:04:22 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A2C212004D;
	Fri, 10 Feb 2023 08:04:21 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 10 Feb 2023 08:04:21 +0000 (GMT)
Received: from jarvis-ozlabs-ibm-com.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 777B960996;
	Fri, 10 Feb 2023 19:04:15 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org
Subject: [PATCH v6 16/26] powerpc/pseries: Expose PLPKS config values, support additional fields
Date: Fri, 10 Feb 2023 19:03:51 +1100
Message-Id: <20230210080401.345462-17-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230210080401.345462-1-ajd@linux.ibm.com>
References: <20230210080401.345462-1-ajd@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: oZQCA7tMPPL0IbPRUtMcTkntCbMDSu9s
X-Proofpoint-GUID: G0vC_NuFDeYvE0qUHXN-ZcOaO0-ExTaw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-10_03,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 suspectscore=0 clxscore=1015 mlxscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 phishscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302100070
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
Cc: sudhakar@linux.ibm.com, erichte@linux.ibm.com, gregkh@linuxfoundation.org, nayna@linux.ibm.com, npiggin@gmail.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com, gjoyce@linux.ibm.com, ruscur@russell.cc, joel@jms.id.au, bgray@linux.ibm.com, brking@linux.ibm.com, gcwilson@linux.ibm.com, stefanb@linux.ibm.com
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
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>

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
2.39.1

