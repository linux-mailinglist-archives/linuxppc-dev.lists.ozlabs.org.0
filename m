Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E51F38C394
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 11:42:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmhV13YlPz3d6T
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 19:42:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lu2Z9lFO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=lu2Z9lFO; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmhTY50kFz307S
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 19:42:09 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14L9YRGu092849; Fri, 21 May 2021 05:42:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=0W7kIX6FOOTKalWI22G3z8O5NCLDuITllHpG9FZSN+M=;
 b=lu2Z9lFOn+36Fepjtu4lkwfmorob/q/GTgzEHhcBw0gcWfPmV22/c3MaVRGJ0dLvsZlM
 cnkmGBgyxEZupe21fehMKQx9GGeiE2l7evx0gvjSmm+HWTrl8pRriEmEP0D+tTzj/0ob
 ibSR5JYCnHg1qhRLKcDZEiMup7MTf+aq/rr0FGb0D86VbyhAlvmAj0cnppW0N4Rzatje
 Is8O2Rwzmjb0xJZKu+PmyYGKGItTwymWBlyWE+MIq0MhkObmy22G8xpOxpIIe470e3TX
 jAikY/y7CKqGaFWQJLChRD3jqDL6eylG2F5cy5HeOof+X+Zv7D3T2yrsQSgszVi9Yen5 Jg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38pa2k8rus-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 05:42:02 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14L9YSji092950;
 Fri, 21 May 2021 05:42:01 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38pa2k8rt0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 05:42:01 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14L9WoRT001852;
 Fri, 21 May 2021 09:42:00 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04dal.us.ibm.com with ESMTP id 38j5xat6jv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 09:42:00 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14L9fxeX38863358
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 09:41:59 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0DB9B2066;
 Fri, 21 May 2021 09:41:59 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C45FDB2065;
 Fri, 21 May 2021 09:41:58 +0000 (GMT)
Received: from sig-9-65-94-165.ibm.com (unknown [9.65.94.165])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 21 May 2021 09:41:58 +0000 (GMT)
Message-ID: <f89258ec786c15d6fca90a227e89cda6db1028cd.camel@linux.ibm.com>
Subject: [PATCH v4 15/16] crypto/nx: Get NX capabilities for GZIP
 coprocessor type
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 mpe@ellerman.id.au, herbert@gondor.apana.org.au, npiggin@gmail.com
Date: Fri, 21 May 2021 02:41:57 -0700
In-Reply-To: <8d219c0816133a8643d650709066cf04c9c77322.camel@linux.ibm.com>
References: <8d219c0816133a8643d650709066cf04c9c77322.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6_ewy_UhkRsTYm01MHtxAQ-91qsBgWIr
X-Proofpoint-ORIG-GUID: OCF2uE4sV3Hr2TrEdt43kQY34BIVdIt0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-21_03:2021-05-20,
 2021-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105210061
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
 drivers/crypto/nx/nx-common-pseries.c | 89 +++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/drivers/crypto/nx/nx-common-pseries.c b/drivers/crypto/nx/nx-common-pseries.c
index 9a40fca8a9e6..4a7278464156 100644
--- a/drivers/crypto/nx/nx-common-pseries.c
+++ b/drivers/crypto/nx/nx-common-pseries.c
@@ -9,6 +9,7 @@
  */
 
 #include <asm/vio.h>
+#include <asm/hvcall.h>
 #include <asm/vas.h>
 
 #include "nx-842.h"
@@ -20,6 +21,30 @@ MODULE_DESCRIPTION("842 H/W Compression driver for IBM Power processors");
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
+	char	name[VAS_DESCR_LEN + 1];
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
@@ -1066,6 +1091,66 @@ static void nx842_remove(struct vio_dev *viodev)
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
+	rc = plpar_vas_query_capabilities(H_QUERY_NX_CAPABILITIES, 0,
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
+		rc = plpar_vas_query_capabilities(H_QUERY_NX_CAPABILITIES,
+						  VAS_NX_GZIP_FEAT,
+						  (u64)virt_to_phys(hv_nxc));
+	} else {
+		pr_err("NX-GZIP feature is not available\n");
+		rc = -EINVAL;
+	}
+
+	if (!rc) {
+		snprintf(nx_ct_caps.name, VAS_DESCR_LEN + 1, "%.8s",
+			 (char *)&hv_nxc->descriptor);
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
@@ -1093,6 +1178,10 @@ static int __init nx842_pseries_init(void)
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


