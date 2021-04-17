Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B7F36326D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Apr 2021 23:13:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FN5Qt2wswz3dbv
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Apr 2021 07:13:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=l5QB9FZW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=l5QB9FZW; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FN5QR4CyXz2y8Q
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Apr 2021 07:13:03 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13HL4nH9168449; Sat, 17 Apr 2021 17:12:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=pxeHkQP1kmn1yXzALIc5qkqciwnKnZqng2FUwOgZiXs=;
 b=l5QB9FZWG/6hK+SKrgTeZTb0tZ1Otjeo/w9zicNRPiJWvclcwpWCWd38YkVS0ryRUNFB
 0oJ4BQwTIguZcOJ6T62wkaJATDSkXvRpo7SLiXVZPauN4/ZtrWZDJJ1Zqo+Ji2jxrQRK
 xwkO5g4y+tMmlNbfY+L7xkwv/EaRsYTs5wZw5vigsK06L+NnIdMcpEMi8tfhfYfsBwus
 KaMrETXGRxM/5/gbeFFxP0QqXbGMoU/FVeExBeT7Tc4HHFt+fWGwCP29x0sGD/r7o0SV
 TIzhwjjwUXvtrucEIezSEwwqgodbZnHvC2S3bao6Iut/rnaamLXL8dUW95096odOeCij oA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37ytga46r3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 17 Apr 2021 17:12:57 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13HL5LHO169109;
 Sat, 17 Apr 2021 17:12:56 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37ytga46qy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 17 Apr 2021 17:12:56 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13HLCEBb014901;
 Sat, 17 Apr 2021 21:12:56 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03wdc.us.ibm.com with ESMTP id 37yqa8dj6t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 17 Apr 2021 21:12:56 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13HLCtHI33751302
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 17 Apr 2021 21:12:55 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 52A3C78060;
 Sat, 17 Apr 2021 21:12:55 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 10BA77805C;
 Sat, 17 Apr 2021 21:12:54 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.80.232.48])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sat, 17 Apr 2021 21:12:53 +0000 (GMT)
Message-ID: <e5fff6adbf3ce7769b0efe4846f39dbc6c795dd1.camel@linux.ibm.com>
Subject: [V3 PATCH 15/16] crypto/nx: Get NX capabilities for GZIP
 coprocessor type
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 mpe@ellerman.id.au, herbert@gondor.apana.org.au, npiggin@gmail.com
Date: Sat, 17 Apr 2021 14:12:51 -0700
In-Reply-To: <a910e5bd3f3398b4bd430b25a856500735b993c3.camel@linux.ibm.com>
References: <a910e5bd3f3398b4bd430b25a856500735b993c3.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DqNnksXLh7vYaD9l1mK35uIfQaPb0l8W
X-Proofpoint-ORIG-GUID: AplVzCIziz9w-4rpxAmsEvuRRkx05dof
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-17_12:2021-04-16,
 2021-04-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104170152
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


phyp provides NX capabilities which gives recommended minimum
compression / decompression length and maximum request buffer size
in bytes.

Changes to get NX overall capabilities which points to the specific
features phyp supports. Then retrieve NXGZIP specific capabilities.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 drivers/crypto/nx/nx-common-pseries.c | 83 +++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/drivers/crypto/nx/nx-common-pseries.c b/drivers/crypto/nx/nx-common-pseries.c
index 9a40fca8a9e6..49224870d05e 100644
--- a/drivers/crypto/nx/nx-common-pseries.c
+++ b/drivers/crypto/nx/nx-common-pseries.c
@@ -9,6 +9,7 @@
  */
 
 #include <asm/vio.h>
+#include <asm/hvcall.h>
 #include <asm/vas.h>
 
 #include "nx-842.h"
@@ -20,6 +21,24 @@ MODULE_DESCRIPTION("842 H/W Compression driver for IBM Power processors");
 MODULE_ALIAS_CRYPTO("842");
 MODULE_ALIAS_CRYPTO("842-nx");
 
+struct nx_ct_capabs_be {
+	__be64	descriptor;
+	__be64	req_max_processed_len;	/* Max bytes in one GZIP request */
+	__be64	min_compress_len;	/* Min compression size in bytes */
+	__be64	min_decompress_len;	/* Min decompression size in bytes */
+} __packed __aligned(0x1000);
+
+struct nx_ct_capabs {
+	char	name[VAS_DESCR_LEN + 1];
+	u64	descriptor;
+	u64	req_max_processed_len;	/* Max bytes in one GZIP request */
+	u64	min_compress_len;	/* Min compression in bytes */
+	u64	min_decompress_len;	/* Min decompression in bytes */
+};
+
+u64 capab_feat = 0;
+struct nx_ct_capabs nx_ct_capab;
+
 static struct nx842_constraints nx842_pseries_constraints = {
 	.alignment =	DDE_BUFFER_ALIGN,
 	.multiple =	DDE_BUFFER_LAST_MULT,
@@ -1066,6 +1085,66 @@ static void nx842_remove(struct vio_dev *viodev)
 	kfree(old_devdata);
 }
 
+/*
+ * Get NX capabilities from pHyp.
+ * Only NXGZIP capabilities are available right now and these values
+ * are available through sysfs.
+ */
+static void __init nxct_get_capabilities(void)
+{
+	struct vas_all_capabs_be *capabs_be;
+	struct nx_ct_capabs_be *nxc_be;
+	int rc;
+
+	capabs_be = kmalloc(sizeof(*capabs_be), GFP_KERNEL);
+	if (!capabs_be)
+		return;
+	/*
+	 * Get NX overall capabilities with feature type=0
+	 */
+	rc = plpar_vas_query_capabilities(H_QUERY_NX_CAPABILITIES, 0,
+					  (u64)virt_to_phys(capabs_be));
+	if (rc)
+		goto out;
+
+	capab_feat = be64_to_cpu(capabs_be->feat_type);
+	/*
+	 * NX-GZIP feature available
+	 */
+	if (capab_feat & VAS_NX_GZIP_FEAT_BIT) {
+		nxc_be = kmalloc(sizeof(*nxc_be), GFP_KERNEL);
+		if (!nxc_be)
+			goto out;
+		/*
+		 * Get capabilities for NX-GZIP feature
+		 */
+		rc = plpar_vas_query_capabilities(H_QUERY_NX_CAPABILITIES,
+						  VAS_NX_GZIP_FEAT,
+						  (u64)virt_to_phys(nxc_be));
+	} else {
+		pr_err("NX-GZIP feature is not available\n");
+		rc = -EINVAL;
+	}
+
+	if (!rc) {
+		snprintf(nx_ct_capab.name, VAS_DESCR_LEN + 1, "%.8s",
+			 (char *)&nxc_be->descriptor);
+		nx_ct_capab.descriptor = be64_to_cpu(nxc_be->descriptor);
+		nx_ct_capab.req_max_processed_len =
+				be64_to_cpu(nxc_be->req_max_processed_len);
+		nx_ct_capab.min_compress_len =
+				be64_to_cpu(nxc_be->min_compress_len);
+		nx_ct_capab.min_decompress_len =
+				be64_to_cpu(nxc_be->min_decompress_len);
+	} else {
+		capab_feat = 0;
+	}
+
+	kfree(nxc_be);
+out:
+	kfree(capabs_be);
+}
+
 static const struct vio_device_id nx842_vio_driver_ids[] = {
 	{"ibm,compression-v1", "ibm,compression"},
 	{"", ""},
@@ -1093,6 +1172,10 @@ static int __init nx842_pseries_init(void)
 		return -ENOMEM;
 
 	RCU_INIT_POINTER(devdata, new_devdata);
+	/*
+	 * Get NX capabilities from pHyp which is used for NX-GZIP.
+	 */
+	nxct_get_capabilities();
 
 	ret = vio_register_driver(&nx842_vio_driver);
 	if (ret) {
-- 
2.18.2


