Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC20174671
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Feb 2020 12:25:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48V3wm3BvszDqvl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Feb 2020 22:25:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48V3lq5m1fzDrFp
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Feb 2020 22:17:27 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01TBFwN6184314; Sat, 29 Feb 2020 06:17:19 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yfmfx2uqb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 29 Feb 2020 06:17:18 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 01TBGCIe184669;
 Sat, 29 Feb 2020 06:17:18 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yfmfx2ups-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 29 Feb 2020 06:17:18 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01TBGQUE019841;
 Sat, 29 Feb 2020 11:17:16 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03wdc.us.ibm.com with ESMTP id 2yffk62b2x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 29 Feb 2020 11:17:16 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01TBHGBC30343664
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 29 Feb 2020 11:17:16 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 52B7A112066;
 Sat, 29 Feb 2020 11:17:16 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A08B6112061;
 Sat, 29 Feb 2020 11:17:15 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Sat, 29 Feb 2020 11:17:15 +0000 (GMT)
Subject: [PATCH V2 6/9] crypto/nx: Make enable code generic to add new GZIP
 compression type
From: Haren Myneni <haren@linux.ibm.com>
To: herbert@gondor.apana.org.au
In-Reply-To: <1582974266.18705.28.camel@hbabu-laptop>
References: <1582974266.18705.28.camel@hbabu-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 29 Feb 2020 03:16:20 -0800
Message-ID: <1582974980.18705.52.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-29_03:2020-02-28,
 2020-02-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 malwarescore=0 adultscore=0 suspectscore=1
 priorityscore=1501 spamscore=0 mlxscore=0 bulkscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002290088
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
Cc: mikey@neuling.org, npiggin@gmail.com, linux-crypto@vger.kernel.org,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Make setup and enable code generic to support new GZIP compression type.
Changed nx842 reference to nx and moved some code to new functions. The
actual functionality is not changed.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 drivers/crypto/nx/nx-common-powernv.c | 159 +++++++++++++++++++++-------------
 1 file changed, 100 insertions(+), 59 deletions(-)

diff --git a/drivers/crypto/nx/nx-common-powernv.c b/drivers/crypto/nx/nx-common-powernv.c
index f42881f..1cd4f40 100644
--- a/drivers/crypto/nx/nx-common-powernv.c
+++ b/drivers/crypto/nx/nx-common-powernv.c
@@ -40,9 +40,9 @@ struct nx842_workmem {
 	char padding[WORKMEM_ALIGN]; /* unused, to allow alignment */
 } __packed __aligned(WORKMEM_ALIGN);
 
-struct nx842_coproc {
+struct nx_coproc {
 	unsigned int chip_id;
-	unsigned int ct;
+	unsigned int ct;	/* Can be 842 or GZIP high/normal*/
 	unsigned int ci;	/* Coprocessor instance, used with icswx */
 	struct {
 		struct vas_window *rxwin;
@@ -58,9 +58,15 @@ struct nx842_coproc {
 static DEFINE_PER_CPU(struct vas_window *, cpu_txwin);
 
 /* no cpu hotplug on powernv, so this list never changes after init */
-static LIST_HEAD(nx842_coprocs);
+static LIST_HEAD(nx_coprocs);
 static unsigned int nx842_ct;	/* used in icswx function */
 
+/*
+ * Using same values as in skiboot or coprocessor type representing
+ * in NX workbook.
+ */
+#define NX_CT_842	(3)
+
 static int (*nx842_powernv_exec)(const unsigned char *in,
 				unsigned int inlen, unsigned char *out,
 				unsigned int *outlenp, void *workmem, int fc);
@@ -666,15 +672,15 @@ static int nx842_powernv_decompress(const unsigned char *in, unsigned int inlen,
 				      wmem, CCW_FC_842_DECOMP_CRC);
 }
 
-static inline void nx842_add_coprocs_list(struct nx842_coproc *coproc,
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
@@ -704,9 +710,9 @@ static struct vas_window *nx842_alloc_txwin(struct nx842_coproc *coproc)
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
@@ -714,17 +720,18 @@ static int nx842_open_percpu_txwins(void)
 
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
 
@@ -743,13 +750,28 @@ static int nx842_open_percpu_txwins(void)
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
+	struct nx_coproc *coproc;
 	u64 rx_fifo;
 	const char *priority;
 	int ret;
@@ -794,15 +816,12 @@ static int __init vas_cfg_coproc_info(struct device_node *dn, int chip_id,
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
+			VAS_COP_TYPE_842);
+
+	if (ret)
 		goto err_out;
-	}
 
 	vas_init_rx_win_attr(&rxattr, coproc->ct);
 	rxattr.rx_fifo = (void *)rx_fifo;
@@ -830,7 +849,7 @@ static int __init vas_cfg_coproc_info(struct device_node *dn, int chip_id,
 
 	coproc->vas.rxwin = rxwin;
 	coproc->vas.id = vasid;
-	nx842_add_coprocs_list(coproc, chip_id);
+	nx_add_coprocs_list(coproc, chip_id);
 
 	/*
 	 * (lpid, pid, tid) combination has to be unique for each
@@ -848,13 +867,43 @@ static int __init vas_cfg_coproc_info(struct device_node *dn, int chip_id,
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
-	int uninitialized_var(ct);
+	struct device_node *dn;
+	int ct_842 = 0;
 
 	chip_id = of_get_ibm_chip_id(pn);
 	if (chip_id < 0) {
@@ -869,17 +918,13 @@ static int __init nx842_powernv_probe_vas(struct device_node *pn)
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
@@ -887,22 +932,14 @@ static int __init nx842_powernv_probe_vas(struct device_node *pn)
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
 
@@ -928,7 +965,7 @@ static int __init nx842_powernv_probe(struct device_node *dn)
 
 	coproc->ct = ct;
 	coproc->ci = ci;
-	nx842_add_coprocs_list(coproc, chip_id);
+	nx_add_coprocs_list(coproc, chip_id);
 
 	pr_info("coprocessor found on chip %d, CT %d CI %d\n", chip_id, ct, ci);
 
@@ -941,9 +978,9 @@ static int __init nx842_powernv_probe(struct device_node *dn)
 	return 0;
 }
 
-static void nx842_delete_coprocs(void)
+static void nx_delete_coprocs(void)
 {
-	struct nx842_coproc *coproc, *n;
+	struct nx_coproc *coproc, *n;
 	struct vas_window *txwin;
 	int i;
 
@@ -958,7 +995,7 @@ static void nx842_delete_coprocs(void)
 		per_cpu(cpu_txwin, i) = 0;
 	}
 
-	list_for_each_entry_safe(coproc, n, &nx842_coprocs, list) {
+	list_for_each_entry_safe(coproc, n, &nx_coprocs, list) {
 		if (coproc->vas.rxwin)
 			vas_win_close(coproc->vas.rxwin);
 
@@ -1002,7 +1039,7 @@ static int nx842_powernv_crypto_init(struct crypto_tfm *tfm)
 	.coa_decompress		= nx842_crypto_decompress } }
 };
 
-static __init int nx842_powernv_init(void)
+static __init int nx_compress_powernv_init(void)
 {
 	struct device_node *dn;
 	int ret;
@@ -1017,15 +1054,15 @@ static __init int nx842_powernv_init(void)
 	BUILD_BUG_ON(DDE_BUFFER_SIZE_MULT % DDE_BUFFER_LAST_MULT);
 
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
 
@@ -1034,9 +1071,13 @@ static __init int nx842_powernv_init(void)
 
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
 
@@ -1045,18 +1086,18 @@ static __init int nx842_powernv_init(void)
 
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



