Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2AA3A57E7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Jun 2021 13:06:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G2sGM4177z3cSh
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Jun 2021 21:06:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=I9QnTW+/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=I9QnTW+/; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G2sFv3xK1z2yxq
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jun 2021 21:06:11 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15DB2rBw122547; Sun, 13 Jun 2021 07:06:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=KPgPDXzL+Q9pTdUE86uGn3v+0LR2rWvKtBIQfCtc2cM=;
 b=I9QnTW+/1tuD1uN5/zCZGJNuM4FOyYXx6DVCTzcoa7FCyGZS3lnFNlvsad/Ex2vq8THv
 NUX2v3b1wp/VF3ODIKaOm+S52SRQqATO8QcAxDV+hkBpHaqmPhIYiIvQuJgjIC8X1M6L
 eXkWFic5qZ+rHjTpqe8PlC4c7D+p4QJehNrNYgspzlAkhZN4o5LFmPRK4V0amUJmSk6Q
 xJ7YmFz0IOnOMjBgytujMjTdTFLOg9GkiSPd2wG60FMD/nvdDaI0Jns888zsbRbw9giL
 mqoBr6TYJt2XeWmQdBxq1RnDRZ52lA3Bzhb/ov+UMcKM1G7qErU+0ZT27zxS9LBYAk3Z oQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 395gr103df-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 13 Jun 2021 07:06:05 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15DB644N130155;
 Sun, 13 Jun 2021 07:06:04 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 395gr103d5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 13 Jun 2021 07:06:04 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15DAwGxh023047;
 Sun, 13 Jun 2021 11:06:03 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04wdc.us.ibm.com with ESMTP id 394mj90a3f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 13 Jun 2021 11:06:03 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15DB628j23396834
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 13 Jun 2021 11:06:02 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C431378064;
 Sun, 13 Jun 2021 11:06:02 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1039C7805C;
 Sun, 13 Jun 2021 11:06:00 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.180.39])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sun, 13 Jun 2021 11:06:00 +0000 (GMT)
Message-ID: <8fd529d8612ea47cce69101b62e9498de9324850.camel@linux.ibm.com>
Subject: [PATCH v5 17/17] crypto/nx: Add sysfs interface to export NX
 capabilities
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 mpe@ellerman.id.au, herbert@gondor.apana.org.au, npiggin@gmail.com
Date: Sun, 13 Jun 2021 04:05:58 -0700
In-Reply-To: <ed7a09822cf3a2e463f942e5a37309a2365c9d79.camel@linux.ibm.com>
References: <ed7a09822cf3a2e463f942e5a37309a2365c9d79.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9RgJYJlOr8Y3wt17bmjG2uGbNdo8PDfV
X-Proofpoint-ORIG-GUID: WMvM3jOn3RveXZ3_EjeeB3DtAe2nt6hP
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-13_04:2021-06-11,
 2021-06-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 clxscore=1015 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2106130082
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


Changes to export the following NXGZIP capabilities through sysfs:

/sys/devices/vio/ibm,compression-v1/nx_gzip_caps:
min_compress_len  /*Recommended minimum compress length in bytes*/
min_decompress_len /*Recommended minimum decompress length in bytes*/
req_max_processed_len /* Maximum number of bytes processed in one
			request */

NX will return RMA_Reject if the request buffer size is greater
than req_max_processed_len.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
Acked-by: Herbert Xu <herbert@gondor.apana.org.au>
---
 drivers/crypto/nx/nx-common-pseries.c | 43 +++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/crypto/nx/nx-common-pseries.c b/drivers/crypto/nx/nx-common-pseries.c
index 60b5049ec9f7..db28a84a826c 100644
--- a/drivers/crypto/nx/nx-common-pseries.c
+++ b/drivers/crypto/nx/nx-common-pseries.c
@@ -967,6 +967,36 @@ static struct attribute_group nx842_attribute_group = {
 	.attrs = nx842_sysfs_entries,
 };
 
+#define	nxct_caps_read(_name)						\
+static ssize_t nxct_##_name##_show(struct device *dev,			\
+			struct device_attribute *attr, char *buf)	\
+{									\
+	return sprintf(buf, "%lld\n", nx_ct_caps._name);		\
+}
+
+#define NXCT_ATTR_RO(_name)						\
+	nxct_caps_read(_name);						\
+	static struct device_attribute dev_attr_##_name = __ATTR(_name,	\
+						0444,			\
+						nxct_##_name##_show,	\
+						NULL);
+
+NXCT_ATTR_RO(req_max_processed_len);
+NXCT_ATTR_RO(min_compress_len);
+NXCT_ATTR_RO(min_decompress_len);
+
+static struct attribute *nxct_caps_sysfs_entries[] = {
+	&dev_attr_req_max_processed_len.attr,
+	&dev_attr_min_compress_len.attr,
+	&dev_attr_min_decompress_len.attr,
+	NULL,
+};
+
+static struct attribute_group nxct_caps_attr_group = {
+	.name	=	"nx_gzip_caps",
+	.attrs	=	nxct_caps_sysfs_entries,
+};
+
 static struct nx842_driver nx842_pseries_driver = {
 	.name =		KBUILD_MODNAME,
 	.owner =	THIS_MODULE,
@@ -1056,6 +1086,16 @@ static int nx842_probe(struct vio_dev *viodev,
 		goto error;
 	}
 
+	if (caps_feat) {
+		if (sysfs_create_group(&viodev->dev.kobj,
+					&nxct_caps_attr_group)) {
+			dev_err(&viodev->dev,
+				"Could not create sysfs NX capability entries\n");
+			ret = -1;
+			goto error;
+		}
+	}
+
 	return 0;
 
 error_unlock:
@@ -1075,6 +1115,9 @@ static void nx842_remove(struct vio_dev *viodev)
 	pr_info("Removing IBM Power 842 compression device\n");
 	sysfs_remove_group(&viodev->dev.kobj, &nx842_attribute_group);
 
+	if (caps_feat)
+		sysfs_remove_group(&viodev->dev.kobj, &nxct_caps_attr_group);
+
 	crypto_unregister_alg(&nx842_pseries_alg);
 
 	spin_lock_irqsave(&devdata_mutex, flags);
-- 
2.18.2


