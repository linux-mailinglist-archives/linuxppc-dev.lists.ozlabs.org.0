Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2438A11F7EF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Dec 2019 14:16:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47bQ0Y1py5zDqQb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2019 00:16:45 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47bPlm68YXzDqYb
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2019 00:05:40 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBFCusS7002837; Sun, 15 Dec 2019 08:05:12 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wwdxe31u7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 15 Dec 2019 08:05:12 -0500
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xBFCurNM002700;
 Sun, 15 Dec 2019 08:05:12 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wwdxe31ts-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 15 Dec 2019 08:05:12 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBFD4vRO024700;
 Sun, 15 Dec 2019 13:05:11 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04dal.us.ibm.com with ESMTP id 2wvqc5x8yy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 15 Dec 2019 13:05:11 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBFD590D47317388
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 15 Dec 2019 13:05:09 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA89BBE059;
 Sun, 15 Dec 2019 13:05:09 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 34E8ABE053;
 Sun, 15 Dec 2019 13:05:09 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sun, 15 Dec 2019 13:05:09 +0000 (GMT)
Subject: [PATCH 06/10] crypto/NX: Make code generic to add new GZIP compression
From: Haren Myneni <haren@linux.ibm.com>
To: herbert@gondor.apana.org.au
In-Reply-To: <1576414240.16318.4066.camel@hbabu-laptop>
References: <1576414240.16318.4066.camel@hbabu-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 15 Dec 2019 05:03:20 -0800
Message-ID: <1576415000.16318.4088.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-15_03:2019-12-13,2019-12-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 spamscore=0 malwarescore=0 suspectscore=1 lowpriorityscore=0
 impostorscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912150124
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
Cc: mikey@neuling.org, npiggin@gmail.com, hch@infradead.org,
 linux-crypto@vger.kernel.org, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Make code generic so that extend it to support new GZIP compression
type. Changed nx842 reference to nx and moved some code to new
functions. The actual functionality is not changed.

Signed-off-by: Haren Myneni <haren@us.ibm.com>
---
 drivers/crypto/nx/nx-commom-powernv.c | 160 +++++++++++++++++++++-------------
 1 file changed, 100 insertions(+), 60 deletions(-)

diff --git a/drivers/crypto/nx/nx-commom-powernv.c b/drivers/crypto/nx/nx-commom-powernv.c
index 799ba28..86efa4f 100644
--- a/drivers/crypto/nx/nx-commom-powernv.c
+++ b/drivers/crypto/nx/nx-commom-powernv.c
@@ -23,9 +23,9 @@
 MODULE_ALIAS_CRYPTO("842");
 MODULE_ALIAS_CRYPTO("842-nx");
 
-struct nx842_coproc {
+struct nx_coproc {
 	unsigned int chip_id;
-	unsigned int ct;
+	unsigned int ct;	/* Can be 842 or GZIP high/normal*/
 	unsigned int ci;        /* Coprocessor instance, used with icswx */
 	struct {
 		struct vas_window *rxwin;
@@ -43,17 +43,23 @@ struct nx842_coproc {
 unsigned int nx842_ct;	/* used in icswx function */
 
 /* no cpu hotplug on powernv, so this list never changes after init */
-static LIST_HEAD(nx842_coprocs);
+static LIST_HEAD(nx_coprocs);
 
-static inline void nx842_add_coprocs_list(struct nx842_coproc *coproc,
+/*
+ * Using same values as in skiboot or coprocessor type representing
+ * in NX workbook.
+ */
+#define NX_CT_842	(3)
+
+static inline void nx_add_coprocs_list(struct nx_coproc *coproc,
 					int chipid)
 {
 	coproc->chip_id = chipid;
 	INIT_LIST_HEAD(&coproc->list);
-	list_add(&coproc->list, &nx842_coprocs);
+	list_add(&coproc->list, &nx_coprocs);
 }
 
-static struct vas_window *nx842_alloc_txwin(struct nx842_coproc *coproc)
+static struct vas_window *nx_alloc_txwin(struct nx_coproc *coproc)
 {
 	struct vas_window *txwin = NULL;
 	struct vas_tx_win_attr txattr;
@@ -83,9 +89,9 @@ static struct vas_window *nx842_alloc_txwin(struct nx842_coproc *coproc)
  * cpu_txwin is used in copy/paste operation for each compression /
  * decompression request.
  */
-static int nx842_open_percpu_txwins(void)
+static int nx_open_percpu_txwins(void)
 {
-	struct nx842_coproc *coproc, *n;
+	struct nx_coproc *coproc, *n;
 	unsigned int i, chip_id;
 
 	for_each_possible_cpu(i) {
@@ -93,17 +99,18 @@ static int nx842_open_percpu_txwins(void)
 
 		chip_id = cpu_to_chip_id(i);
 
-		list_for_each_entry_safe(coproc, n, &nx842_coprocs, list) {
+		list_for_each_entry_safe(coproc, n, &nx_coprocs, list) {
 			/*
 			 * Kernel requests use only high priority FIFOs. So
 			 * open send windows for these FIFOs.
+			 * GZIP is not supported in kernel right now.
 			 */
 
 			if (coproc->ct != VAS_COP_TYPE_842_HIPRI)
 				continue;
 
 			if (coproc->chip_id == chip_id) {
-				txwin = nx842_alloc_txwin(coproc);
+				txwin = nx_alloc_txwin(coproc);
 				if (IS_ERR(txwin))
 					return PTR_ERR(txwin);
 
@@ -122,15 +129,30 @@ static int nx842_open_percpu_txwins(void)
 	return 0;
 }
 
+static int __init nx_set_ct(struct nx_coproc *coproc, const char *priority,
+				int high, int normal)
+{
+	if (!strcmp(priority, "High"))
+		coproc->ct = high;
+	else if (!strcmp(priority, "Normal"))
+		coproc->ct = normal;
+	else {
+		pr_err("Invalid RxFIFO priority value\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int __init vas_cfg_coproc_info(struct device_node *dn, int chip_id,
-					int vasid, int *ct)
+					int vasid, int type, int *ct)
 {
 	struct vas_window *rxwin = NULL;
 	struct vas_rx_win_attr rxattr;
-	struct nx842_coproc *coproc;
 	u32 lpid, pid, tid, fifo_size;
-	u64 rx_fifo;
+	struct nx_coproc *coproc;
 	const char *priority;
+	u64 rx_fifo;
 	int ret;
 
 	ret = of_property_read_u64(dn, "rx-fifo-address", &rx_fifo);
@@ -173,15 +195,11 @@ static int __init vas_cfg_coproc_info(struct device_node *dn, int chip_id,
 	if (!coproc)
 		return -ENOMEM;
 
-	if (!strcmp(priority, "High"))
-		coproc->ct = VAS_COP_TYPE_842_HIPRI;
-	else if (!strcmp(priority, "Normal"))
-		coproc->ct = VAS_COP_TYPE_842;
-	else {
-		pr_err("Invalid RxFIFO priority value\n");
-		ret =  -EINVAL;
+	if (type == NX_CT_842)
+		ret = nx_set_ct(coproc, priority, VAS_COP_TYPE_842_HIPRI,
+				VAS_COP_TYPE_842);
+	if (ret)
 		goto err_out;
-	}
 
 	vas_init_rx_win_attr(&rxattr, coproc->ct);
 	rxattr.rx_fifo = (void *)rx_fifo;
@@ -209,7 +227,7 @@ static int __init vas_cfg_coproc_info(struct device_node *dn, int chip_id,
 
 	coproc->vas.rxwin = rxwin;
 	coproc->vas.id = vasid;
-	nx842_add_coprocs_list(coproc, chip_id);
+	nx_add_coprocs_list(coproc, chip_id);
 
 	/*
 	 * (lpid, pid, tid) combination has to be unique for each
@@ -227,13 +245,43 @@ static int __init vas_cfg_coproc_info(struct device_node *dn, int chip_id,
 	return ret;
 }
 
+static int __init nx_coproc_init(int chip_id, int ct_842)
+{
+	int ret = 0;
 
-static int __init nx842_powernv_probe_vas(struct device_node *pn)
+	if (opal_check_token(OPAL_NX_COPROC_INIT)) {
+		ret = opal_nx_coproc_init(chip_id, ct_842);
+		if (ret) {
+			ret = opal_error_code(ret);
+			pr_err("Failed to initialize NX for chip(%d): %d\n",
+				chip_id, ret);
+		}
+	} else
+		pr_warn("Firmware doesn't support NX initialization\n");
+
+	return ret;
+}
+
+static int __init find_nx_device_tree(struct device_node *dn, int chip_id,
+					int vasid, int type, char *devname,
+					int *ct)
+{
+	int ret = 0;
+
+	if (of_device_is_compatible(dn, devname)) {
+		ret  = vas_cfg_coproc_info(dn, chip_id, vasid, type, ct);
+		if (ret)
+			of_node_put(dn);
+	}
+
+	return ret;
+}
+
+static int __init nx_powernv_probe_vas(struct device_node *pn)
 {
-	struct device_node *dn;
 	int chip_id, vasid, ret = 0;
-	int nx_fifo_found = 0;
-	int ct = 0;
+	struct device_node *dn;
+	int ct_842 = 0;
 
 	chip_id = of_get_ibm_chip_id(pn);
 	if (chip_id < 0) {
@@ -248,17 +296,13 @@ static int __init nx842_powernv_probe_vas(struct device_node *pn)
 	}
 
 	for_each_child_of_node(pn, dn) {
-		if (of_device_is_compatible(dn, "ibm,p9-nx-842")) {
-			ret = vas_cfg_coproc_info(dn, chip_id, vasid, &ct);
-			if (ret) {
-				of_node_put(dn);
-				return ret;
-			}
-			nx_fifo_found++;
-		}
+		ret = find_nx_device_tree(dn, chip_id, vasid, NX_CT_842,
+					"ibm,p9-nx-842", &ct_842);
+		if (ret)
+			return ret;
 	}
 
-	if (!nx_fifo_found) {
+	if (!ct_842) {
 		pr_err("NX842 FIFO nodes are missing\n");
 		return -EINVAL;
 	}
@@ -266,22 +310,14 @@ static int __init nx842_powernv_probe_vas(struct device_node *pn)
 	/*
 	 * Initialize NX instance for both high and normal priority FIFOs.
 	 */
-	if (opal_check_token(OPAL_NX_COPROC_INIT)) {
-		ret = opal_nx_coproc_init(chip_id, ct);
-		if (ret) {
-			pr_err("Failed to initialize NX for chip(%d): %d\n",
-				chip_id, ret);
-			ret = opal_error_code(ret);
-		}
-	} else
-		pr_warn("Firmware doesn't support NX initialization\n");
+	ret = nx_coproc_init(chip_id, ct_842);
 
 	return ret;
 }
 
 static int __init nx842_powernv_probe(struct device_node *dn)
 {
-	struct nx842_coproc *coproc;
+	struct nx_coproc *coproc;
 	unsigned int ct, ci;
 	int chip_id;
 
@@ -307,7 +343,7 @@ static int __init nx842_powernv_probe(struct device_node *dn)
 
 	coproc->ct = ct;
 	coproc->ci = ci;
-	nx842_add_coprocs_list(coproc, chip_id);
+	nx_add_coprocs_list(coproc, chip_id);
 
 	pr_info("coprocessor found on chip %d, CT %d CI %d\n", chip_id, ct, ci);
 
@@ -320,9 +356,9 @@ static int __init nx842_powernv_probe(struct device_node *dn)
 	return 0;
 }
 
-static void nx842_delete_coprocs(void)
+static void nx_delete_coprocs(void)
 {
-	struct nx842_coproc *coproc, *n;
+	struct nx_coproc *coproc, *n;
 	struct vas_window *txwin;
 	int i;
 
@@ -337,7 +373,7 @@ static void nx842_delete_coprocs(void)
 		per_cpu(cpu_txwin, i) = 0;
 	}
 
-	list_for_each_entry_safe(coproc, n, &nx842_coprocs, list) {
+	list_for_each_entry_safe(coproc, n, &nx_coprocs, list) {
 		if (coproc->vas.rxwin)
 			vas_win_close(coproc->vas.rxwin);
 
@@ -346,7 +382,7 @@ static void nx842_delete_coprocs(void)
 	}
 }
 
-static __init int nx842_powernv_init(void)
+static __init int nx_compress_powernv_init(void)
 {
 	struct device_node *dn;
 	int ret;
@@ -363,15 +399,15 @@ static __init int nx842_powernv_init(void)
 	nx842_ct = 0;
 
 	for_each_compatible_node(dn, NULL, "ibm,power9-nx") {
-		ret = nx842_powernv_probe_vas(dn);
+		ret = nx_powernv_probe_vas(dn);
 		if (ret) {
-			nx842_delete_coprocs();
+			nx_delete_coprocs();
 			of_node_put(dn);
 			return ret;
 		}
 	}
 
-	if (list_empty(&nx842_coprocs)) {
+	if (list_empty(&nx_coprocs)) {
 		for_each_compatible_node(dn, NULL, "ibm,power-nx")
 			nx842_powernv_probe(dn);
 
@@ -380,9 +416,13 @@ static __init int nx842_powernv_init(void)
 
 		nx842_powernv_exec = nx842_exec_icswx;
 	} else {
-		ret = nx842_open_percpu_txwins();
+		/*
+		 * GZIP is not supported in kernel right now.
+		 * So open tx windows only for 842.
+		 */
+		ret = nx_open_percpu_txwins();
 		if (ret) {
-			nx842_delete_coprocs();
+			nx_delete_coprocs();
 			return ret;
 		}
 
@@ -391,18 +431,18 @@ static __init int nx842_powernv_init(void)
 
 	ret = crypto_register_alg(&nx842_powernv_alg);
 	if (ret) {
-		nx842_delete_coprocs();
+		nx_delete_coprocs();
 		return ret;
 	}
 
 	return 0;
 }
-module_init(nx842_powernv_init);
+module_init(nx_compress_powernv_init);
 
-static void __exit nx842_powernv_exit(void)
+static void __exit nx_compress_powernv_exit(void)
 {
 	crypto_unregister_alg(&nx842_powernv_alg);
 
-	nx842_delete_coprocs();
+	nx_delete_coprocs();
 }
-module_exit(nx842_powernv_exit);
+module_exit(nx_compress_powernv_exit);
-- 
1.8.3.1



