Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2033A57E5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Jun 2021 13:05:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G2sF14zgvz3bsQ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Jun 2021 21:05:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jqB2FSqe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=jqB2FSqe; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G2sDW2QDwz2yR8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jun 2021 21:04:59 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15DB3dKT075551; Sun, 13 Jun 2021 07:04:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=ZsVkRoq3Y8R1FcsqXdZppD5pi9hTEyOqGBQKxlYaLig=;
 b=jqB2FSqeI8XGnOcr8Iz6I60OBnXdW1afzBDT5ozZNm5ZWIyjiQNZsqJ8G5lQIRJvKvZE
 XVzgGH7e2l+UN7FXCXlGzNQprMK8nOQJzxOJ0BpCoNLn51bPnn8SgJ25wqETIAj6q6NH
 xNES29Ih7IFYKKXL1+kwXVh/j2Fef8zvDobbmXWMz9oawR9KBJENELg/Wci/Kc5vWjH7
 DvyAoUZKx722yrfLOBIZ9v4v5dlDcSz01iQCBBL4r7tJajBwecxysOSkfeYmPGhyjJ2H
 qS8AfdWuiV8vEK4vIvI2adF7Sot0j7bUcnSlgE2JE6Mvdp+KXV3OmzRp4QH6WD8QvdXZ eg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 395gasgeyb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 13 Jun 2021 07:04:53 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15DB3cJl075500;
 Sun, 13 Jun 2021 07:04:52 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 395gasgey2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 13 Jun 2021 07:04:52 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15DAw96P002263;
 Sun, 13 Jun 2021 11:04:51 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02wdc.us.ibm.com with ESMTP id 394mj988yy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 13 Jun 2021 11:04:51 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15DB4oZa29229430
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 13 Jun 2021 11:04:50 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 83A7DBE056;
 Sun, 13 Jun 2021 11:04:50 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D77B3BE053;
 Sun, 13 Jun 2021 11:04:48 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.180.39])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sun, 13 Jun 2021 11:04:48 +0000 (GMT)
Message-ID: <726de270eb20e0898f4391a0b0e7077697db66ab.camel@linux.ibm.com>
Subject: [PATCH v5 16/17] crypto/nx: Get NX capabilities for GZIP
 coprocessor type
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 mpe@ellerman.id.au, herbert@gondor.apana.org.au, npiggin@gmail.com
Date: Sun, 13 Jun 2021 04:04:46 -0700
In-Reply-To: <ed7a09822cf3a2e463f942e5a37309a2365c9d79.camel@linux.ibm.com>
References: <ed7a09822cf3a2e463f942e5a37309a2365c9d79.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tMGVU2PZU15kKJh7u2hqNPLuR8kr8APn
X-Proofpoint-GUID: evLQDmeY2lRKXqoe4R6dtIt1LcislpE7
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-13_04:2021-06-11,
 2021-06-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 mlxlogscore=999
 impostorscore=0 spamscore=0 bulkscore=0 mlxscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106130082
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


The hypervisor provides different capabilities that it supports
to define the user space NX request. These capabilities are
recommended minimum compression / decompression lengths and the
maximum request buffer size in bytes.

Changes to get NX overall capabilities which points to the
specific features that the hypervisor supports. Then retrieve
the capabilities for the specific feature (available only
for NXGZIP).

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
Acked-by: Herbert Xu <herbert@gondor.apana.org.au>
---
 drivers/crypto/nx/nx-common-pseries.c | 86 +++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/drivers/crypto/nx/nx-common-pseries.c b/drivers/crypto/nx/nx-common-pseries.c
index 9a40fca8a9e6..60b5049ec9f7 100644
--- a/drivers/crypto/nx/nx-common-pseries.c
+++ b/drivers/crypto/nx/nx-common-pseries.c
@@ -9,6 +9,7 @@
  */
 
 #include <asm/vio.h>
+#include <asm/hvcall.h>
 #include <asm/vas.h>
 
 #include "nx-842.h"
@@ -20,6 +21,29 @@ MODULE_DESCRIPTION("842 H/W Compression driver for IBM Power processors");
 MODULE_ALIAS_CRYPTO("842");
 MODULE_ALIAS_CRYPTO("842-nx");
 
+/*
+ * Coprocessor type specific capabilities from the hypervisor.
+ */
+struct hv_nx_ct_caps {
+	__be64	descriptor;
+	__be64	req_max_processed_len;	/* Max bytes in one GZIP request */
+	__be64	min_compress_len;	/* Min compression size in bytes */
+	__be64	min_decompress_len;	/* Min decompression size in bytes */
+} __packed __aligned(0x1000);
+
+/*
+ * Coprocessor type specific capabilities.
+ */
+struct nx_ct_caps {
+	u64	descriptor;
+	u64	req_max_processed_len;	/* Max bytes in one GZIP request */
+	u64	min_compress_len;	/* Min compression in bytes */
+	u64	min_decompress_len;	/* Min decompression in bytes */
+};
+
+static u64 caps_feat;
+static struct nx_ct_caps nx_ct_caps;
+
 static struct nx842_constraints nx842_pseries_constraints = {
 	.alignment =	DDE_BUFFER_ALIGN,
 	.multiple =	DDE_BUFFER_LAST_MULT,
@@ -1066,6 +1090,64 @@ static void nx842_remove(struct vio_dev *viodev)
 	kfree(old_devdata);
 }
 
+/*
+ * Get NX capabilities from the hypervisor.
+ * Only NXGZIP capabilities are provided by the hypersvisor right
+ * now and these values are available to user space with sysfs.
+ */
+static void __init nxct_get_capabilities(void)
+{
+	struct hv_vas_all_caps *hv_caps;
+	struct hv_nx_ct_caps *hv_nxc;
+	int rc;
+
+	hv_caps = kmalloc(sizeof(*hv_caps), GFP_KERNEL);
+	if (!hv_caps)
+		return;
+	/*
+	 * Get NX overall capabilities with feature type=0
+	 */
+	rc = h_query_vas_capabilities(H_QUERY_NX_CAPABILITIES, 0,
+					  (u64)virt_to_phys(hv_caps));
+	if (rc)
+		goto out;
+
+	caps_feat = be64_to_cpu(hv_caps->feat_type);
+	/*
+	 * NX-GZIP feature available
+	 */
+	if (caps_feat & VAS_NX_GZIP_FEAT_BIT) {
+		hv_nxc = kmalloc(sizeof(*hv_nxc), GFP_KERNEL);
+		if (!hv_nxc)
+			goto out;
+		/*
+		 * Get capabilities for NX-GZIP feature
+		 */
+		rc = h_query_vas_capabilities(H_QUERY_NX_CAPABILITIES,
+						  VAS_NX_GZIP_FEAT,
+						  (u64)virt_to_phys(hv_nxc));
+	} else {
+		pr_err("NX-GZIP feature is not available\n");
+		rc = -EINVAL;
+	}
+
+	if (!rc) {
+		nx_ct_caps.descriptor = be64_to_cpu(hv_nxc->descriptor);
+		nx_ct_caps.req_max_processed_len =
+				be64_to_cpu(hv_nxc->req_max_processed_len);
+		nx_ct_caps.min_compress_len =
+				be64_to_cpu(hv_nxc->min_compress_len);
+		nx_ct_caps.min_decompress_len =
+				be64_to_cpu(hv_nxc->min_decompress_len);
+	} else {
+		caps_feat = 0;
+	}
+
+	kfree(hv_nxc);
+out:
+	kfree(hv_caps);
+}
+
 static const struct vio_device_id nx842_vio_driver_ids[] = {
 	{"ibm,compression-v1", "ibm,compression"},
 	{"", ""},
@@ -1093,6 +1175,10 @@ static int __init nx842_pseries_init(void)
 		return -ENOMEM;
 
 	RCU_INIT_POINTER(devdata, new_devdata);
+	/*
+	 * Get NX capabilities from the hypervisor.
+	 */
+	nxct_get_capabilities();
 
 	ret = vio_register_driver(&nx842_vio_driver);
 	if (ret) {
-- 
2.18.2


