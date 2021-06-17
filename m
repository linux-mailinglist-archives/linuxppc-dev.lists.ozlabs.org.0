Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7774A3ABDA0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 22:39:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5Ynr1C6Xz3dwh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 06:39:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cYHKRnqV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=cYHKRnqV; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5YnP2xXTz3c5X
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 06:39:21 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15HKYWdc155926; Thu, 17 Jun 2021 16:39:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=VNnL32h8YLdrfnAgrLtUDrJqedk8ARUwVwEKbksjtaI=;
 b=cYHKRnqVJjewFuH7kLCyQLyD7ICWrZJ8rSsJQuZe+jHLHEBZGdO0Qj1n1NCDK0jxK4dd
 ZpjnnN4GSsrQCK2a6KPAN/JDVy2M8KRT1k7ed5aWY23zZNyebYdFyRzJyJ6QlgI2gwdv
 Aqte8JKgEhc07YCdZf/1Hpvj2UelVLtO67riT0Y9tNLVi8VLqUwiHIm+9nm0FfSh/Om6
 DyAEWn6XdHWvhvjJkjFGJO1tlKsHz+D5aHEml/Nk3Kr1zjp4L40eWsYJ1syRp715cZyx
 YTLinz9eV7I16ResBlLcHOz9bmMYXuAe7tV2O2MUv3BcwarljqwXE+Cp41qU9mkrAayj Tg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3988xqrs8u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 16:39:13 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15HKZV2c164638;
 Thu, 17 Jun 2021 16:39:12 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3988xqrs8g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 16:39:12 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15HKcFuv023415;
 Thu, 17 Jun 2021 20:39:12 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02dal.us.ibm.com with ESMTP id 394mjaeqsu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 20:39:12 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15HKdBuq17957250
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Jun 2021 20:39:11 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 33343112062;
 Thu, 17 Jun 2021 20:39:11 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1AB31112061;
 Thu, 17 Jun 2021 20:39:10 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.180.39])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 17 Jun 2021 20:39:09 +0000 (GMT)
Message-ID: <510da86abbd904878d5f13d74aba72603c37d783.camel@linux.ibm.com>
Subject: [PATCH v6 16/17] crypto/nx: Add sysfs interface to export NX
 capabilities
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 mpe@ellerman.id.au, herbert@gondor.apana.org.au, npiggin@gmail.com
Date: Thu, 17 Jun 2021 13:39:08 -0700
In-Reply-To: <827bf56dce09620ebecd8a00a5f97105187a6205.camel@linux.ibm.com>
References: <827bf56dce09620ebecd8a00a5f97105187a6205.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: eaBzOXh3Z459e0s6p5IQISD9tdHOg6rD
X-Proofpoint-ORIG-GUID: FxvFA1mZroZmQ7vQhAip-9xBeW1j_qmP
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_16:2021-06-15,
 2021-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 mlxscore=0 malwarescore=0
 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106170123
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


Export NX-GZIP capabilities to usrespace in sysfs
/sys/devices/vio/ibm,compression-v1/nx_gzip_caps directory.
These are queried by userspace accelerator libraries to set
minimum length heuristics and maximum limits on request sizes.

NX-GZIP capabilities:
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
index 9fc2abb56019..f51a50d40504 100644
--- a/drivers/crypto/nx/nx-common-pseries.c
+++ b/drivers/crypto/nx/nx-common-pseries.c
@@ -967,6 +967,36 @@ static struct attribute_group nx842_attribute_group = {
 	.attrs = nx842_sysfs_entries,
 };
 
+#define	nxcop_caps_read(_name)						\
+static ssize_t nxcop_##_name##_show(struct device *dev,			\
+			struct device_attribute *attr, char *buf)	\
+{									\
+	return sprintf(buf, "%lld\n", nx_cop_caps._name);		\
+}
+
+#define NXCT_ATTR_RO(_name)						\
+	nxcop_caps_read(_name);						\
+	static struct device_attribute dev_attr_##_name = __ATTR(_name,	\
+						0444,			\
+						nxcop_##_name##_show,	\
+						NULL);
+
+NXCT_ATTR_RO(req_max_processed_len);
+NXCT_ATTR_RO(min_compress_len);
+NXCT_ATTR_RO(min_decompress_len);
+
+static struct attribute *nxcop_caps_sysfs_entries[] = {
+	&dev_attr_req_max_processed_len.attr,
+	&dev_attr_min_compress_len.attr,
+	&dev_attr_min_decompress_len.attr,
+	NULL,
+};
+
+static struct attribute_group nxcop_caps_attr_group = {
+	.name	=	"nx_gzip_caps",
+	.attrs	=	nxcop_caps_sysfs_entries,
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
+					&nxcop_caps_attr_group)) {
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
+		sysfs_remove_group(&viodev->dev.kobj, &nxcop_caps_attr_group);
+
 	crypto_unregister_alg(&nx842_pseries_alg);
 
 	spin_lock_irqsave(&devdata_mutex, flags);
-- 
2.18.2


