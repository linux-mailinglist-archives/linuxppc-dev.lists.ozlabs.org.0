Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EF34A19B84B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 00:16:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48t0s15V4KzDqst
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 09:16:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48t0fr3XLrzDrDn
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 09:07:16 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 031M3u03098345; Wed, 1 Apr 2020 18:07:07 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 304g86t91n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 18:07:07 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 031M4XIZ100068;
 Wed, 1 Apr 2020 18:07:06 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 304g86t918-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 18:07:06 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 031M6kWs027671;
 Wed, 1 Apr 2020 22:07:05 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03wdc.us.ibm.com with ESMTP id 301x76v7cy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 22:07:05 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 031M75qr53215514
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Apr 2020 22:07:05 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 50FA3AC320;
 Wed,  1 Apr 2020 22:07:05 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 882CFAC315;
 Wed,  1 Apr 2020 22:07:04 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  1 Apr 2020 22:07:04 +0000 (GMT)
Subject: [PATCH v5 7/9] crypto/nx: Enable and setup GZIP compression type
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au
In-Reply-To: <1585777592.10664.462.camel@hbabu-laptop>
References: <1585777592.10664.462.camel@hbabu-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 01 Apr 2020 15:07:03 -0700
Message-ID: <1585778823.2275.3.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-01_04:2020-03-31,
 2020-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=1 adultscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004010179
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
Cc: mikey@neuling.org, herbert@gondor.apana.org.au, npiggin@gmail.com,
 linux-crypto@vger.kernel.org, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Changes to probe GZIP device-tree nodes, open RX windows and setup
GZIP compression type. No plans to provide GZIP usage in kernel right
now, but this patch enables GZIP for user space usage.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
Acked-by: Herbert Xu <herbert@gondor.apana.org.au>
---
 drivers/crypto/nx/nx-common-powernv.c | 43 ++++++++++++++++++++++++++++++-----
 1 file changed, 37 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/nx/nx-common-powernv.c b/drivers/crypto/nx/nx-common-powernv.c
index 82dfa60..f570691 100644
--- a/drivers/crypto/nx/nx-common-powernv.c
+++ b/drivers/crypto/nx/nx-common-powernv.c
@@ -65,6 +65,7 @@ struct nx_coproc {
  * Using same values as in skiboot or coprocessor type representing
  * in NX workbook.
  */
+#define NX_CT_GZIP	(2)	/* on P9 and later */
 #define NX_CT_842	(3)
 
 static int (*nx842_powernv_exec)(const unsigned char *in,
@@ -819,6 +820,9 @@ static int __init vas_cfg_coproc_info(struct device_node *dn, int chip_id,
 	if (type == NX_CT_842)
 		ret = nx_set_ct(coproc, priority, VAS_COP_TYPE_842_HIPRI,
 			VAS_COP_TYPE_842);
+	else if (type == NX_CT_GZIP)
+		ret = nx_set_ct(coproc, priority, VAS_COP_TYPE_GZIP_HIPRI,
+				VAS_COP_TYPE_GZIP);
 
 	if (ret)
 		goto err_out;
@@ -867,12 +871,16 @@ static int __init vas_cfg_coproc_info(struct device_node *dn, int chip_id,
 	return ret;
 }
 
-static int __init nx_coproc_init(int chip_id, int ct_842)
+static int __init nx_coproc_init(int chip_id, int ct_842, int ct_gzip)
 {
 	int ret = 0;
 
 	if (opal_check_token(OPAL_NX_COPROC_INIT)) {
 		ret = opal_nx_coproc_init(chip_id, ct_842);
+
+		if (!ret)
+			ret = opal_nx_coproc_init(chip_id, ct_gzip);
+
 		if (ret) {
 			ret = opal_error_code(ret);
 			pr_err("Failed to initialize NX for chip(%d): %d\n",
@@ -902,8 +910,8 @@ static int __init find_nx_device_tree(struct device_node *dn, int chip_id,
 static int __init nx_powernv_probe_vas(struct device_node *pn)
 {
 	int chip_id, vasid, ret = 0;
+	int ct_842 = 0, ct_gzip = 0;
 	struct device_node *dn;
-	int ct_842 = 0;
 
 	chip_id = of_get_ibm_chip_id(pn);
 	if (chip_id < 0) {
@@ -920,19 +928,24 @@ static int __init nx_powernv_probe_vas(struct device_node *pn)
 	for_each_child_of_node(pn, dn) {
 		ret = find_nx_device_tree(dn, chip_id, vasid, NX_CT_842,
 					"ibm,p9-nx-842", &ct_842);
+
+		if (!ret)
+			ret = find_nx_device_tree(dn, chip_id, vasid,
+				NX_CT_GZIP, "ibm,p9-nx-gzip", &ct_gzip);
+
 		if (ret)
 			return ret;
 	}
 
-	if (!ct_842) {
-		pr_err("NX842 FIFO nodes are missing\n");
+	if (!ct_842 || !ct_gzip) {
+		pr_err("NX FIFO nodes are missing\n");
 		return -EINVAL;
 	}
 
 	/*
 	 * Initialize NX instance for both high and normal priority FIFOs.
 	 */
-	ret = nx_coproc_init(chip_id, ct_842);
+	ret = nx_coproc_init(chip_id, ct_842, ct_gzip);
 
 	return ret;
 }
@@ -1072,10 +1085,19 @@ static __init int nx_compress_powernv_init(void)
 		nx842_powernv_exec = nx842_exec_icswx;
 	} else {
 		/*
+		 * Register VAS user space API for NX GZIP so
+		 * that user space can use GZIP engine.
+		 * 842 compression is supported only in kernel.
+		 */
+		ret = vas_register_coproc_api(THIS_MODULE);
+
+		/*
 		 * GZIP is not supported in kernel right now.
 		 * So open tx windows only for 842.
 		 */
-		ret = nx_open_percpu_txwins();
+		if (!ret)
+			ret = nx_open_percpu_txwins();
+
 		if (ret) {
 			nx_delete_coprocs();
 			return ret;
@@ -1096,6 +1118,15 @@ static __init int nx_compress_powernv_init(void)
 
 static void __exit nx_compress_powernv_exit(void)
 {
+	/*
+	 * GZIP engine is supported only in power9 or later and nx842_ct
+	 * is used on power8 (icswx).
+	 * VAS API for NX GZIP is registered during init for user space
+	 * use. So delete this API use for GZIP engine.
+	 */
+	if (!nx842_ct)
+		vas_unregister_coproc_api();
+
 	crypto_unregister_alg(&nx842_powernv_alg);
 
 	nx_delete_coprocs();
-- 
1.8.3.1



