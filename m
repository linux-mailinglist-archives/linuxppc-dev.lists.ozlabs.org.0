Return-Path: <linuxppc-dev+bounces-14845-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB94CC90A6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Dec 2025 18:25:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWgg20kTyz30V1;
	Thu, 18 Dec 2025 04:25:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765992334;
	cv=none; b=WreiZWGS1zRTzjJpAbDjh+X+IsK0XrFbr8vbJLSw2dnIJRBqTr6UBEXuXTybHJlQyG86U1GC0Pfts7oJtgYuGi3RCBS5iKx0G98XV6UizUtNmgKjtKvQiSeCsYzJ/r24ipuEvKKa445wwkHtnWmda/I+VrmzX65eXYM6tjESc7YZh2h2xnMhmYlpWGdL9+QVjVg1SauE/88XAMlrKBGHW7tNBSe+fiXal4Jf0m9fbkj4LwR0YwFCj992IpwGxrkM3ee0Xv7FUfcht77NGI8KPqlltvx3vtVDQ16cPljm9kbVdgnImsM84rzk00Bhy5R4OXW8Zu23rW+UjbRneugV6g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765992334; c=relaxed/relaxed;
	bh=zRuVMP8fy62QWWdddDjnySGr6oOB4PJyRbIstZEBTFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D5eqmArr98ywXmOeGl1i8zXoIidkroWD947SPCz+/be/y8GQXBwuZ/nGFrq5u0vgJmPKM9raOV+1vt++6H1Na6HMqCMZnxxT0T8VsyGXf9vmyw3dhLMDXpoTw2ZapSeIg6kd38sN+OEv+gCtDjTSmK/0qwdzb2/gYPf103aHh5FfUGqr0CcImDxsms8e+k7ENOabi9pkhergHshvpTH+jD8KZDKLKyP7qgjQfddz0pHFXJrAkR22xsDBo3XMF0C9c9o9dm3I8HoUoGdJ7bhL0q80b5FHfxD/UkOsjmSJ1nrMH4lPhMNjnAeoNPPcB9UTjLSqPDo40c9L2hykVXGB9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TRlRriX0; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TRlRriX0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dWgg10smRz304l
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Dec 2025 04:25:32 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BHAboHh022697;
	Wed, 17 Dec 2025 17:25:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=zRuVMP8fy62QWWddd
	DjnySGr6oOB4PJyRbIstZEBTFU=; b=TRlRriX0lbT7tx9/wSWZkkk4RqAyHkl+A
	x+DJPWrGDj5w9j9aFaJDQlz+2kzHxiH9LiE/SVpKoBC7DCuS4eG++98E6YtWojOL
	W5g1/0ko+GNQ02KcbvE+QOysf7gTe39TSQ95ROiuGM03o55tMji27YOSQBZxECFh
	m4y7QzNSf0rWlE6O0JsWdr6l8rpYhHn+BT4NdRHaY6PDS0AqZbEngWd9bMvo66uo
	4Wmn7M0Mx613EJdAuMXK/R6UjnDkOhfuT4YK3Fh7HDWWVaGJxCZAPg/FwWv0Clhp
	AlPFDWz8DeGyBiODslYKzgUFj2BdDLaQMg3F+LU3pvpCuqFcmjkFQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0ytvea88-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 17:25:19 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5BHHIndq003108;
	Wed, 17 Dec 2025 17:25:19 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0ytvea81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 17:25:18 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BHG4Y5R012835;
	Wed, 17 Dec 2025 17:25:17 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4b1juybrup-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 17:25:17 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BHHPDZW18809090
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Dec 2025 17:25:13 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 322FF20043;
	Wed, 17 Dec 2025 17:25:13 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C668620040;
	Wed, 17 Dec 2025 17:25:09 +0000 (GMT)
Received: from li-fc74f8cc-3279-11b2-a85c-ef5828687581.ibm.com.com (unknown [9.124.211.226])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 17 Dec 2025 17:25:09 +0000 (GMT)
From: Srish Srinivasan <ssrish@linux.ibm.com>
To: linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, James.Bottomley@HansenPartnership.com,
        jarkko@kernel.org, zohar@linux.ibm.com, nayna@linux.ibm.com,
        rnsastry@linux.ibm.com, linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org, ssrish@linux.ibm.com
Subject: [PATCH v2 1/6] pseries/plpks: fix kernel-doc comment inconsistencies
Date: Wed, 17 Dec 2025 22:55:00 +0530
Message-ID: <20251217172505.112398-2-ssrish@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251217172505.112398-1-ssrish@linux.ibm.com>
References: <20251217172505.112398-1-ssrish@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAyMyBTYWx0ZWRfX0ZUTsAsQ1Evb
 dPQN4QQpcdFtyeB7k/C5dM8TbO7UjIPw5FR1uKyQR1fo4Rgp5w/l2ylzyJ/AYXFowhudJYjM9F/
 6xRNszYmBSTBH2biG9OdEKzpAy3gf0mmxQtMUxv6FcGchqLPcfX8I3Pel6nFP9wU4Q/KEYikD+t
 UaCVEQmCZwKCi9BiYBLUrxYqZMOu5RyJxLxTBSEk3nIL0MLUsPfJbuIRT6Ezkk29T09dBBaVLOO
 O+9zhLty+KG7Nlu8j4LLiSlbrjO3F+Pf4ACla4o5iTdyHGQKjRxUOKUSYwwLin7eMR0KI1qOKv7
 iAeShr8W9UVufr04I+ec89BU8G9OdmiI0/aib4QqzypJJTwqaQ4a47vPFgZZL2Vwiq7ze5zqpY8
 97Vum7EVBFfp3encxYnZF6APDA3mkQ==
X-Proofpoint-ORIG-GUID: g_m3xiV8Q5zCTRMQTztysynByXHDkWWv
X-Authority-Analysis: v=2.4 cv=QtRTHFyd c=1 sm=1 tr=0 ts=6942e77f cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=_jD9v-G-JNOk7KggL9IA:9 a=tQW_-zY1P7yUjf7c:21
X-Proofpoint-GUID: JFkRIscgwCTiemAxp6RSqKbCNbCU3Gq5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512130023
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Fix issues with comments for all the applicable functions to be
consistent with kernel-doc format. Move them before the function
definition as opposed to the function prototype.

Signed-off-by: Srish Srinivasan <ssrish@linux.ibm.com>
---
 arch/powerpc/include/asm/plpks.h       |  77 ------
 arch/powerpc/platforms/pseries/plpks.c | 328 ++++++++++++++++++++++++-
 2 files changed, 318 insertions(+), 87 deletions(-)

diff --git a/arch/powerpc/include/asm/plpks.h b/arch/powerpc/include/asm/plpks.h
index 7a84069759b0..f303922bf622 100644
--- a/arch/powerpc/include/asm/plpks.h
+++ b/arch/powerpc/include/asm/plpks.h
@@ -67,122 +67,45 @@ struct plpks_var_name_list {
 	struct plpks_var_name varlist[];
 };
 
-/**
- * Updates the authenticated variable. It expects NULL as the component.
- */
 int plpks_signed_update_var(struct plpks_var *var, u64 flags);
 
-/**
- * Writes the specified var and its data to PKS.
- * Any caller of PKS driver should present a valid component type for
- * their variable.
- */
 int plpks_write_var(struct plpks_var var);
 
-/**
- * Removes the specified var and its data from PKS.
- */
 int plpks_remove_var(char *component, u8 varos,
 		     struct plpks_var_name vname);
 
-/**
- * Returns the data for the specified os variable.
- *
- * Caller must allocate a buffer in var->data with length in var->datalen.
- * If no buffer is provided, var->datalen will be populated with the object's
- * size.
- */
 int plpks_read_os_var(struct plpks_var *var);
 
-/**
- * Returns the data for the specified firmware variable.
- *
- * Caller must allocate a buffer in var->data with length in var->datalen.
- * If no buffer is provided, var->datalen will be populated with the object's
- * size.
- */
 int plpks_read_fw_var(struct plpks_var *var);
 
-/**
- * Returns the data for the specified bootloader variable.
- *
- * Caller must allocate a buffer in var->data with length in var->datalen.
- * If no buffer is provided, var->datalen will be populated with the object's
- * size.
- */
 int plpks_read_bootloader_var(struct plpks_var *var);
 
-/**
- * Returns if PKS is available on this LPAR.
- */
 bool plpks_is_available(void);
 
-/**
- * Returns version of the Platform KeyStore.
- */
 u8 plpks_get_version(void);
 
-/**
- * Returns hypervisor storage overhead per object, not including the size of
- * the object or label. Only valid for config version >= 2
- */
 u16 plpks_get_objoverhead(void);
 
-/**
- * Returns maximum password size. Must be >= 32 bytes
- */
 u16 plpks_get_maxpwsize(void);
 
-/**
- * Returns maximum object size supported by Platform KeyStore.
- */
 u16 plpks_get_maxobjectsize(void);
 
-/**
- * Returns maximum object label size supported by Platform KeyStore.
- */
 u16 plpks_get_maxobjectlabelsize(void);
 
-/**
- * Returns total size of the configured Platform KeyStore.
- */
 u32 plpks_get_totalsize(void);
 
-/**
- * Returns used space from the total size of the Platform KeyStore.
- */
 u32 plpks_get_usedspace(void);
 
-/**
- * Returns bitmask of policies supported by the hypervisor.
- */
 u32 plpks_get_supportedpolicies(void);
 
-/**
- * Returns maximum byte size of a single object supported by the hypervisor.
- * Only valid for config version >= 3
- */
 u32 plpks_get_maxlargeobjectsize(void);
 
-/**
- * Returns bitmask of signature algorithms supported for signed updates.
- * Only valid for config version >= 3
- */
 u64 plpks_get_signedupdatealgorithms(void);
 
-/**
- * Returns the length of the PLPKS password in bytes.
- */
 u16 plpks_get_passwordlen(void);
 
-/**
- * Called in early init to retrieve and clear the PLPKS password from the DT.
- */
 void plpks_early_init_devtree(void);
 
-/**
- * Populates the FDT with the PLPKS password to prepare for kexec.
- */
 int plpks_populate_fdt(void *fdt);
 #else // CONFIG_PSERIES_PLPKS
 static inline bool plpks_is_available(void) { return false; }
diff --git a/arch/powerpc/platforms/pseries/plpks.c b/arch/powerpc/platforms/pseries/plpks.c
index b1667ed05f98..03722fabf9c3 100644
--- a/arch/powerpc/platforms/pseries/plpks.c
+++ b/arch/powerpc/platforms/pseries/plpks.c
@@ -312,40 +312,107 @@ static int _plpks_get_config(void)
 	return rc;
 }
 
+/**
+ * plpks_get_version() - Get the version of the PLPKS config structure.
+ *
+ * Successful execution of the H_PKS_GET_CONFIG HCALL during initialization
+ * reads the PLPKS config structure version and saves it in a file local static
+ * version variable.
+ *
+ * Returns: On success the saved PLPKS config structure version is returned, 0
+ * if not.
+ */
 u8 plpks_get_version(void)
 {
 	return version;
 }
 
+/**
+ * plpks_get_objoverhead() - Get the hypervisor storage overhead per object.
+ *
+ * Successful execution of the H_PKS_GET_CONFIG HCALL during initialization
+ * reads the per object hypervisor storage overhead in bytes into the local
+ * static objoverhead variable, excluding the size of the object or the label.
+ * This value can be treated as valid only when the PLPKS config structure
+ * version >= 2.
+ *
+ * Returns: If PLPKS config structure version >= 2 then the storage overhead is
+ * returned, 0 otherwise.
+ */
 u16 plpks_get_objoverhead(void)
 {
 	return objoverhead;
 }
 
+/**
+ * plpks_get_maxpwsize() - Get the maximum password size.
+ *
+ * Successful execution of the H_PKS_GET_CONFIG HCALL during initialization
+ * reads the maximum password size and checks if it is 32 bytes at the least
+ * before storing it in the local static maxpwsize variable.
+ *
+ * Returns: On success the maximum password size is returned, 0 if not.
+ */
 u16 plpks_get_maxpwsize(void)
 {
 	return maxpwsize;
 }
 
+/**
+ * plpks_get_maxobjectsize() - Get the maximum object size supported by the
+ * PLPKS.
+ *
+ * Successful execution of the H_PKS_GET_CONFIG HCALL during initialization
+ * reads the maximum object size into the file local static maxobjsize variable.
+ *
+ * Returns: On success the maximum object size is returned, 0 if not.
+ */
 u16 plpks_get_maxobjectsize(void)
 {
 	return maxobjsize;
 }
 
+/**
+ * plpks_get_maxobjectlabelsize() - Get the maximum object label size supported
+ * by the PLPKS.
+ *
+ * Successful execution of the H_PKS_GET_CONFIG HCALL during initialization
+ * reads the maximum object label size into the local static maxobjlabelsize
+ * variable.
+ *
+ * Returns: On success the maximum object label size is returned, 0 if not.
+ */
 u16 plpks_get_maxobjectlabelsize(void)
 {
 	return maxobjlabelsize;
 }
 
+/**
+ * plpks_get_totalsize() - Get the total size of the PLPKS that is configured.
+ *
+ * Successful execution of the H_PKS_GET_CONFIG HCALL during initialization
+ * reads the total size of the PLPKS that is configured for the LPAR into the
+ * file local static totalsize variable.
+ *
+ * Returns: On success the total size of the PLPKS configured is returned, 0 if
+ * not.
+ */
 u32 plpks_get_totalsize(void)
 {
 	return totalsize;
 }
 
+/**
+ * plpks_get_usedspace() - Get the used space from the total size of the PLPKS.
+ *
+ * Invoke the H_PKS_GET_CONFIG HCALL to refresh the latest value for the used
+ * space as this keeps changing with the creation and removal of objects in the
+ * PLPKS.
+ *
+ * Returns: On success the used space is returned, 0 if not.
+ */
 u32 plpks_get_usedspace(void)
 {
-	// Unlike other config values, usedspace regularly changes as objects
-	// are updated, so we need to refresh.
 	int rc = _plpks_get_config();
 	if (rc) {
 		pr_err("Couldn't get config, rc: %d\n", rc);
@@ -354,26 +421,84 @@ u32 plpks_get_usedspace(void)
 	return usedspace;
 }
 
+/**
+ * plpks_get_supportedpolicies() - Get a bitmask of the policies supported by
+ * the hypervisor.
+ *
+ * Successful execution of the H_PKS_GET_CONFIG HCALL during initialization
+ * reads a bitmask of the policies supported by the hypervisor into the file
+ * local static supportedpolicies variable.
+ *
+ * Returns: On success the bitmask of the policies supported by the hypervisor
+ * are returned, 0 if not.
+ */
 u32 plpks_get_supportedpolicies(void)
 {
 	return supportedpolicies;
 }
 
+/**
+ * plpks_get_maxlargeobjectsize() - Get the maximum object size supported for
+ * PLPKS config structure version >= 3
+ *
+ * Successful execution of the H_PKS_GET_CONFIG HCALL during initialization
+ * reads the maximum object size into the local static maxlargeobjectsize
+ * variable for PLPKS config structure version >= 3. This was introduced
+ * starting with PLPKS config structure version 3 to allow for objects of
+ * size >= 64K.
+ *
+ * Returns: If PLPKS config structure version >= 3 then the new maximum object
+ * size is returned, 0 if not.
+ */
 u32 plpks_get_maxlargeobjectsize(void)
 {
 	return maxlargeobjectsize;
 }
 
+/**
+ * plpks_get_signedupdatealgorithms() - Get a bitmask of the signature
+ * algorithms supported for signed updates.
+ *
+ * Successful execution of the H_PKS_GET_CONFIG HCALL during initialization
+ * reads a bitmask of the signature algorithms supported for signed updates into
+ * the file local static signedupdatealgorithms variable. This is valid only
+ * when the PLPKS config structure version >= 3.
+ *
+ * Returns: On success the bitmask of the signature algorithms supported for
+ * signed updates is returned, 0 if not.
+ */
 u64 plpks_get_signedupdatealgorithms(void)
 {
 	return signedupdatealgorithms;
 }
 
+/**
+ * plpks_get_passwordlen() - Get the length of the PLPKS password in bytes.
+ *
+ * The H_PKS_GEN_PASSWORD HCALL makes the hypervisor generate a random password
+ * for the specified consumer, apply that password to the PLPKS and return it to
+ * the caller. In this process, the password length for the OS consumer is
+ * stored in the local static ospasswordlength variable.
+ *
+ * Returns: On success the password length for the OS consumer in bytes is
+ * returned, 0 if not.
+ */
 u16 plpks_get_passwordlen(void)
 {
 	return ospasswordlength;
 }
 
+/**
+ * plpks_is_available() - Get the PLPKS availability status for the LPAR.
+ *
+ * The availability of PLPKS is inferred based upon the successful execution of
+ * the H_PKS_GET_CONFIG HCALL provided the firmware supports this feature. The
+ * H_PKS_GET_CONFIG HCALL reads the configuration and status information related
+ * to the PLPKS. The configuration structure provides a version number to inform
+ * the caller of the supported features.
+ *
+ * Returns: true is returned if PLPKS is available, false if not.
+ */
 bool plpks_is_available(void)
 {
 	int rc;
@@ -425,6 +550,35 @@ static int plpks_confirm_object_flushed(struct label *label,
 	return pseries_status_to_err(rc);
 }
 
+/**
+ * plpks_signed_update_var() - Update the specified authenticated variable.
+ * @var: authenticated variable to be updated
+ * @flags: signed update request operation flags
+ *
+ * The H_PKS_SIGNED_UPDATE HCALL performs a signed update to an object in the
+ * PLPKS. The object must have the signed update policy flag set.
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
+ *		if invalid signed update flags
+ *		if invalid input data parameter
+ *		if invalid input data len parameter
+ *		if invalid continue token parameter
+ * -EPERM	if access is denied
+ * -ENOMEM	if there is inadequate memory to perform the operation
+ * -EBUSY	if unable to handle the request or long running operation
+ *		initiated, retry later
+ *
+ * Returns: On success 0 is returned, a negative errno if not.
+ */
 int plpks_signed_update_var(struct plpks_var *var, u64 flags)
 {
 	unsigned long retbuf[PLPAR_HCALL9_BUFSIZE] = {0};
@@ -481,6 +635,33 @@ int plpks_signed_update_var(struct plpks_var *var, u64 flags)
 	return rc;
 }
 
+/**
+ * plpks_write_var() - Write the specified variable and its data to PLPKS.
+ * @var: variable to be written into the PLPKS
+ *
+ * The H_PKS_WRITE_OBJECT HCALL writes an object into the PLPKS. The caller must
+ * provide a valid component type for the variable, and the signed update policy
+ * flag must not be set.
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
+ *		if invalid input data parameter
+ *		if invalid input data len parameter
+ * -EPERM	if access is denied
+ * -ENOMEM	if unable to store the requested object in the space available
+ * -EBUSY	if unable to handle the request
+ * -EEXIST	if the object label already exists
+ *
+ * Returns: On success 0 is returned, a negative errno if not.
+ */
 int plpks_write_var(struct plpks_var var)
 {
 	unsigned long retbuf[PLPAR_HCALL_BUFSIZE] = { 0 };
@@ -520,6 +701,30 @@ int plpks_write_var(struct plpks_var var)
 	return rc;
 }
 
+/**
+ * plpks_remove_var() - Remove the specified variable and its data from PLPKS.
+ * @component: metadata prefix in the object label metadata structure
+ * @varos: metadata OS flags in the object label metadata structure
+ * @vname: object label for the object that needs to be removed
+ *
+ * The H_PKS_REMOVE_OBJECT HCALL removes an object from the PLPKS. The removal
+ * is independent of the policy bits that are set.
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
+ * -EPERM	if access is denied
+ * -ENOENT	if the requested object was not found
+ * -EBUSY	if unable to handle the request
+ *
+ * Returns: On success 0 is returned, a negative errno if not.
+ */
 int plpks_remove_var(char *component, u8 varos, struct plpks_var_name vname)
 {
 	unsigned long retbuf[PLPAR_HCALL_BUFSIZE] = { 0 };
@@ -619,21 +824,119 @@ static int plpks_read_var(u8 consumer, struct plpks_var *var)
 	return rc;
 }
 
+/**
+ * plpks_read_os_var() - Fetch the data for the specified variable that is
+ * owned by the OS consumer.
+ * @var: variable to be read from the PLPKS
+ *
+ * The consumer or the owner of the object is the os kernel. The
+ * H_PKS_READ_OBJECT HCALL reads an object from the PLPKS. The caller must
+ * allocate the buffer var->data and specify the length for this buffer in
+ * var->datalen. If no buffer is provided, var->datalen will be populated with
+ * the requested object's size.
+ *
+ * Possible reasons for the returned errno values:
+ *
+ * -ENXIO	if PLPKS is not supported
+ * -EIO		if PLPKS access is blocked due to the LPAR's state
+ *		if an error occurred while processing the request
+ * -EINVAL	if invalid authorization parameter
+ *		if invalid object label parameter
+ *		if invalid object label len parameter
+ *		if invalid output data parameter
+ *		if invalid output data len parameter
+ * -EPERM	if access is denied
+ * -ENOENT	if the requested object was not found
+ * -EFBIG	if the requested object couldn't be
+ *		stored in the buffer provided
+ * -EBUSY	if unable to handle the request
+ *
+ * Returns: On success 0 is returned, a negative errno if not.
+ */
 int plpks_read_os_var(struct plpks_var *var)
 {
 	return plpks_read_var(PLPKS_OS_OWNER, var);
 }
 
+/**
+ * plpks_read_fw_var() - Fetch the data for the specified variable that is
+ * owned by the firmware consumer.
+ * @var: variable to be read from the PLPKS
+ *
+ * The consumer or the owner of the object is the firmware. The
+ * H_PKS_READ_OBJECT HCALL reads an object from the PLPKS. The caller must
+ * allocate the buffer var->data and specify the length for this buffer in
+ * var->datalen. If no buffer is provided, var->datalen will be populated with
+ * the requested object's size.
+ *
+ * Possible reasons for the returned errno values:
+ *
+ * -ENXIO	if PLPKS is not supported
+ * -EIO		if PLPKS access is blocked due to the LPAR's state
+ *		if an error occurred while processing the request
+ * -EINVAL	if invalid authorization parameter
+ *		if invalid object label parameter
+ *		if invalid object label len parameter
+ *		if invalid output data parameter
+ *		if invalid output data len parameter
+ * -EPERM	if access is denied
+ * -ENOENT	if the requested object was not found
+ * -EFBIG	if the requested object couldn't be
+ *		stored in the buffer provided
+ * -EBUSY	if unable to handle the request
+ *
+ * Returns: On success 0 is returned, a negative errno if not.
+ */
 int plpks_read_fw_var(struct plpks_var *var)
 {
 	return plpks_read_var(PLPKS_FW_OWNER, var);
 }
 
+/**
+ * plpks_read_bootloader_var() - Fetch the data for the specified variable
+ * owned by the bootloader consumer.
+ * @var: variable to be read from the PLPKS
+ *
+ * The consumer or the owner of the object is the bootloader. The
+ * H_PKS_READ_OBJECT HCALL reads an object from the PLPKS. The caller must
+ * allocate the buffer var->data and specify the length for this buffer in
+ * var->datalen. If no buffer is provided, var->datalen will be populated with
+ * the requested object's size.
+ *
+ * Possible reasons for the returned errno values:
+ *
+ * -ENXIO	if PLPKS is not supported
+ * -EIO		if PLPKS access is blocked due to the LPAR's state
+ *		if an error occurred while processing the request
+ * -EINVAL	if invalid authorization parameter
+ *		if invalid object label parameter
+ *		if invalid object label len parameter
+ *		if invalid output data parameter
+ *		if invalid output data len parameter
+ * -EPERM	if access is denied
+ * -ENOENT	if the requested object was not found
+ * -EFBIG	if the requested object couldn't be
+ *		stored in the buffer provided
+ * -EBUSY	if unable to handle the request
+ *
+ * Returns: On success 0 is returned, a negative errno if not.
+ */
 int plpks_read_bootloader_var(struct plpks_var *var)
 {
 	return plpks_read_var(PLPKS_BOOTLOADER_OWNER, var);
 }
 
+/**
+ * plpks_populate_fdt(): Populates the FDT with the PLPKS password to prepare
+ * for kexec.
+ * @fdt: pointer to the device tree blob
+ *
+ * Upon confirming the existence of the chosen node, invoke fdt_setprop to
+ * populate the device tree with the PLPKS password in order to prepare for
+ * kexec.
+ *
+ * Returns: On success 0 is returned, a negative value if not.
+ */
 int plpks_populate_fdt(void *fdt)
 {
 	int chosen_offset = fdt_path_offset(fdt, "/chosen");
@@ -647,14 +950,19 @@ int plpks_populate_fdt(void *fdt)
 	return fdt_setprop(fdt, chosen_offset, "ibm,plpks-pw", ospassword, ospasswordlength);
 }
 
-// Once a password is registered with the hypervisor it cannot be cleared without
-// rebooting the LPAR, so to keep using the PLPKS across kexec boots we need to
-// recover the previous password from the FDT.
-//
-// There are a few challenges here.  We don't want the password to be visible to
-// users, so we need to clear it from the FDT.  This has to be done in early boot.
-// Clearing it from the FDT would make the FDT's checksum invalid, so we have to
-// manually cause the checksum to be recalculated.
+/**
+ * plpks_early_init_devtree() - Retrieves and clears the PLPKS password from the
+ * DT in early init.
+ *
+ * Once a password is registered with the hypervisor it cannot be cleared
+ * without rebooting the LPAR, so to keep using the PLPKS across kexec boots we
+ * need to recover the previous password from the FDT.
+ *
+ * There are a few challenges here.  We don't want the password to be visible to
+ * users, so we need to clear it from the FDT.  This has to be done in early
+ * boot. Clearing it from the FDT would make the FDT's checksum invalid, so we
+ * have to manually cause the checksum to be recalculated.
+ */
 void __init plpks_early_init_devtree(void)
 {
 	void *fdt = initial_boot_params;
-- 
2.47.3


