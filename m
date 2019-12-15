Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7600911F7ED
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Dec 2019 14:14:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47bPxn65SdzDqZF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2019 00:14:21 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47bPkm0wChzDqYn
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2019 00:04:47 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBFCusn7109257; Sun, 15 Dec 2019 08:04:34 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wwe892q5h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 15 Dec 2019 08:04:33 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id xBFCusCL109377;
 Sun, 15 Dec 2019 08:04:33 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wwe892q58-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 15 Dec 2019 08:04:33 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBFCxs1g008948;
 Sun, 15 Dec 2019 13:04:32 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04wdc.us.ibm.com with ESMTP id 2wvqc5uc59-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 15 Dec 2019 13:04:32 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBFD4Wh213501234
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 15 Dec 2019 13:04:32 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E84B124053;
 Sun, 15 Dec 2019 13:04:32 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A590B124052;
 Sun, 15 Dec 2019 13:04:31 +0000 (GMT)
Received: from [9.70.82.143] (unknown [9.70.82.143])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Sun, 15 Dec 2019 13:04:31 +0000 (GMT)
Subject: [PATCH 05/10] crypto/nx: Organize powernv 842 code to add new GZIP
 compression type
From: Haren Myneni <haren@linux.ibm.com>
To: herbert@gondor.apana.org.au
In-Reply-To: <1576414240.16318.4066.camel@hbabu-laptop>
References: <1576414240.16318.4066.camel@hbabu-laptop>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 15 Dec 2019 05:02:42 -0800
Message-ID: <1576414962.16318.4085.camel@hbabu-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-15_03:2019-12-13,2019-12-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=1 bulkscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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


Move common code for 842 and GZIP such as initializtion, read device
tree entries and allocation of receive and send (kernel usage) windows
to nx-common-powernv.c and keep 842 specific code in nx-842-powernv.c

Signed-off-by: Haren Myneni <haren@us.ibm.com>
---
 drivers/crypto/nx/Makefile            |   2 +-
 drivers/crypto/nx/nx-842-powernv.c    | 412 +---------------------------------
 drivers/crypto/nx/nx-842-powernv.h    |  29 +++
 drivers/crypto/nx/nx-commom-powernv.c | 408 +++++++++++++++++++++++++++++++++
 4 files changed, 447 insertions(+), 404 deletions(-)
 create mode 100644 drivers/crypto/nx/nx-842-powernv.h
 create mode 100644 drivers/crypto/nx/nx-commom-powernv.c

diff --git a/drivers/crypto/nx/Makefile b/drivers/crypto/nx/Makefile
index 015155d..1949449 100644
--- a/drivers/crypto/nx/Makefile
+++ b/drivers/crypto/nx/Makefile
@@ -15,4 +15,4 @@ obj-$(CONFIG_CRYPTO_DEV_NX_COMPRESS_PSERIES) += nx-compress-pseries.o nx-compres
 obj-$(CONFIG_CRYPTO_DEV_NX_COMPRESS_POWERNV) += nx-compress-powernv.o nx-compress.o
 nx-compress-objs := nx-842.o
 nx-compress-pseries-objs := nx-842-pseries.o
-nx-compress-powernv-objs := nx-842-powernv.o
+nx-compress-powernv-objs := nx-commom-powernv.o nx-842-powernv.o
diff --git a/drivers/crypto/nx/nx-842-powernv.c b/drivers/crypto/nx/nx-842-powernv.c
index 8e63326..1469ad8 100644
--- a/drivers/crypto/nx/nx-842-powernv.c
+++ b/drivers/crypto/nx/nx-842-powernv.c
@@ -1,32 +1,18 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Driver for IBM PowerNV 842 compression accelerator
+ * IBM PowerNV NX 842 compression API
  *
  * Copyright (C) 2015 Dan Streetman, IBM Corp
  */
 
-#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-
 #include "nx-842.h"
 
 #include <linux/timer.h>
 
-#include <asm/prom.h>
 #include <asm/icswx.h>
 #include <asm/vas.h>
 #include <asm/reg.h>
-#include <asm/opal-api.h>
-#include <asm/opal.h>
-
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Dan Streetman <ddstreet@ieee.org>");
-MODULE_DESCRIPTION("842 H/W Compression driver for IBM PowerNV processors");
-MODULE_ALIAS_CRYPTO("842");
-MODULE_ALIAS_CRYPTO("842-nx");
-
-#define WORKMEM_ALIGN	(CRB_ALIGN)
-#define CSB_WAIT_MAX	(5000) /* ms */
-#define VAS_RETRIES	(10)
+#include "nx-842-powernv.h"
 
 struct nx842_workmem {
 	/* Below fields must be properly aligned */
@@ -40,30 +26,10 @@ struct nx842_workmem {
 	char padding[WORKMEM_ALIGN]; /* unused, to allow alignment */
 } __packed __aligned(WORKMEM_ALIGN);
 
-struct nx842_coproc {
-	unsigned int chip_id;
-	unsigned int ct;
-	unsigned int ci;	/* Coprocessor instance, used with icswx */
-	struct {
-		struct vas_window *rxwin;
-		int id;
-	} vas;
-	struct list_head list;
-};
-
-/*
- * Send the request to NX engine on the chip for the corresponding CPU
- * where the process is executing. Use with VAS function.
- */
-static DEFINE_PER_CPU(struct vas_window *, cpu_txwin);
-
-/* no cpu hotplug on powernv, so this list never changes after init */
-static LIST_HEAD(nx842_coprocs);
-static unsigned int nx842_ct;	/* used in icswx function */
-
-static int (*nx842_powernv_exec)(const unsigned char *in,
-				unsigned int inlen, unsigned char *out,
-				unsigned int *outlenp, void *workmem, int fc);
+int (*nx842_powernv_exec)(const unsigned char *in, unsigned int inlen,
+				unsigned char *out, unsigned int *outlenp,
+				void *workmem, int fc);
+DECLARE_PER_CPU(struct vas_window *, cpu_txwin);
 
 /**
  * setup_indirect_dde - Setup an indirect DDE
@@ -446,7 +412,7 @@ static int nx842_config_crb(const unsigned char *in, unsigned int inlen,
  *   -ETIMEDOUT	hardware did not complete operation in reasonable time
  *   -EINTR	operation was aborted
  */
-static int nx842_exec_icswx(const unsigned char *in, unsigned int inlen,
+int nx842_exec_icswx(const unsigned char *in, unsigned int inlen,
 				  unsigned char *out, unsigned int *outlenp,
 				  void *workmem, int fc)
 {
@@ -549,7 +515,7 @@ static int nx842_exec_icswx(const unsigned char *in, unsigned int inlen,
  *   -ETIMEDOUT	hardware did not complete operation in reasonable time
  *   -EINTR	operation was aborted
  */
-static int nx842_exec_vas(const unsigned char *in, unsigned int inlen,
+int nx842_exec_vas(const unsigned char *in, unsigned int inlen,
 				  unsigned char *out, unsigned int *outlenp,
 				  void *workmem, int fc)
 {
@@ -666,307 +632,6 @@ static int nx842_powernv_decompress(const unsigned char *in, unsigned int inlen,
 				      wmem, CCW_FC_842_DECOMP_CRC);
 }
 
-static inline void nx842_add_coprocs_list(struct nx842_coproc *coproc,
-					int chipid)
-{
-	coproc->chip_id = chipid;
-	INIT_LIST_HEAD(&coproc->list);
-	list_add(&coproc->list, &nx842_coprocs);
-}
-
-static struct vas_window *nx842_alloc_txwin(struct nx842_coproc *coproc)
-{
-	struct vas_window *txwin = NULL;
-	struct vas_tx_win_attr txattr;
-
-	/*
-	 * Kernel requests will be high priority. So open send
-	 * windows only for high priority RxFIFO entries.
-	 */
-	vas_init_tx_win_attr(&txattr, coproc->ct);
-	txattr.lpid = 0;	/* lpid is 0 for kernel requests */
-	txattr.pid = 0;		/* pid is 0 for kernel requests */
-
-	/*
-	 * Open a VAS send window which is used to send request to NX.
-	 */
-	txwin = vas_tx_win_open(coproc->vas.id, coproc->ct, &txattr);
-	if (IS_ERR(txwin))
-		pr_err("ibm,nx-842: Can not open TX window: %ld\n",
-				PTR_ERR(txwin));
-
-	return txwin;
-}
-
-/*
- * Identify chip ID for each CPU, open send wndow for the corresponding NX
- * engine and save txwin in percpu cpu_txwin.
- * cpu_txwin is used in copy/paste operation for each compression /
- * decompression request.
- */
-static int nx842_open_percpu_txwins(void)
-{
-	struct nx842_coproc *coproc, *n;
-	unsigned int i, chip_id;
-
-	for_each_possible_cpu(i) {
-		struct vas_window *txwin = NULL;
-
-		chip_id = cpu_to_chip_id(i);
-
-		list_for_each_entry_safe(coproc, n, &nx842_coprocs, list) {
-			/*
-			 * Kernel requests use only high priority FIFOs. So
-			 * open send windows for these FIFOs.
-			 */
-
-			if (coproc->ct != VAS_COP_TYPE_842_HIPRI)
-				continue;
-
-			if (coproc->chip_id == chip_id) {
-				txwin = nx842_alloc_txwin(coproc);
-				if (IS_ERR(txwin))
-					return PTR_ERR(txwin);
-
-				per_cpu(cpu_txwin, i) = txwin;
-				break;
-			}
-		}
-
-		if (!per_cpu(cpu_txwin, i)) {
-			/* shouldn't happen, Each chip will have NX engine */
-			pr_err("NX engine is not available for CPU %d\n", i);
-			return -EINVAL;
-		}
-	}
-
-	return 0;
-}
-
-static int __init vas_cfg_coproc_info(struct device_node *dn, int chip_id,
-					int vasid, int *ct)
-{
-	struct vas_window *rxwin = NULL;
-	struct vas_rx_win_attr rxattr;
-	struct nx842_coproc *coproc;
-	u32 lpid, pid, tid, fifo_size;
-	u64 rx_fifo;
-	const char *priority;
-	int ret;
-
-	ret = of_property_read_u64(dn, "rx-fifo-address", &rx_fifo);
-	if (ret) {
-		pr_err("Missing rx-fifo-address property\n");
-		return ret;
-	}
-
-	ret = of_property_read_u32(dn, "rx-fifo-size", &fifo_size);
-	if (ret) {
-		pr_err("Missing rx-fifo-size property\n");
-		return ret;
-	}
-
-	ret = of_property_read_u32(dn, "lpid", &lpid);
-	if (ret) {
-		pr_err("Missing lpid property\n");
-		return ret;
-	}
-
-	ret = of_property_read_u32(dn, "pid", &pid);
-	if (ret) {
-		pr_err("Missing pid property\n");
-		return ret;
-	}
-
-	ret = of_property_read_u32(dn, "tid", &tid);
-	if (ret) {
-		pr_err("Missing tid property\n");
-		return ret;
-	}
-
-	ret = of_property_read_string(dn, "priority", &priority);
-	if (ret) {
-		pr_err("Missing priority property\n");
-		return ret;
-	}
-
-	coproc = kzalloc(sizeof(*coproc), GFP_KERNEL);
-	if (!coproc)
-		return -ENOMEM;
-
-	if (!strcmp(priority, "High"))
-		coproc->ct = VAS_COP_TYPE_842_HIPRI;
-	else if (!strcmp(priority, "Normal"))
-		coproc->ct = VAS_COP_TYPE_842;
-	else {
-		pr_err("Invalid RxFIFO priority value\n");
-		ret =  -EINVAL;
-		goto err_out;
-	}
-
-	vas_init_rx_win_attr(&rxattr, coproc->ct);
-	rxattr.rx_fifo = (void *)rx_fifo;
-	rxattr.rx_fifo_size = fifo_size;
-	rxattr.lnotify_lpid = lpid;
-	rxattr.lnotify_pid = pid;
-	rxattr.lnotify_tid = tid;
-	/*
-	 * Maximum RX window credits can not be more than #CRBs in
-	 * RxFIFO. Otherwise, can get checkstop if RxFIFO overruns.
-	 */
-	rxattr.wcreds_max = fifo_size / CRB_SIZE;
-
-	/*
-	 * Open a VAS receice window which is used to configure RxFIFO
-	 * for NX.
-	 */
-	rxwin = vas_rx_win_open(vasid, coproc->ct, &rxattr);
-	if (IS_ERR(rxwin)) {
-		ret = PTR_ERR(rxwin);
-		pr_err("setting RxFIFO with VAS failed: %d\n",
-			ret);
-		goto err_out;
-	}
-
-	coproc->vas.rxwin = rxwin;
-	coproc->vas.id = vasid;
-	nx842_add_coprocs_list(coproc, chip_id);
-
-	/*
-	 * (lpid, pid, tid) combination has to be unique for each
-	 * coprocessor instance in the system. So to make it
-	 * unique, skiboot uses coprocessor type such as 842 or
-	 * GZIP for pid and provides this value to kernel in pid
-	 * device-tree property.
-	 */
-	*ct = pid;
-
-	return 0;
-
-err_out:
-	kfree(coproc);
-	return ret;
-}
-
-
-static int __init nx842_powernv_probe_vas(struct device_node *pn)
-{
-	struct device_node *dn;
-	int chip_id, vasid, ret = 0;
-	int nx_fifo_found = 0;
-	int uninitialized_var(ct);
-
-	chip_id = of_get_ibm_chip_id(pn);
-	if (chip_id < 0) {
-		pr_err("ibm,chip-id missing\n");
-		return -EINVAL;
-	}
-
-	vasid = chip_to_vas_id(chip_id);
-	if (vasid < 0) {
-		pr_err("Unable to map chip_id %d to vasid\n", chip_id);
-		return -EINVAL;
-	}
-
-	for_each_child_of_node(pn, dn) {
-		if (of_device_is_compatible(dn, "ibm,p9-nx-842")) {
-			ret = vas_cfg_coproc_info(dn, chip_id, vasid, &ct);
-			if (ret) {
-				of_node_put(dn);
-				return ret;
-			}
-			nx_fifo_found++;
-		}
-	}
-
-	if (!nx_fifo_found) {
-		pr_err("NX842 FIFO nodes are missing\n");
-		return -EINVAL;
-	}
-
-	/*
-	 * Initialize NX instance for both high and normal priority FIFOs.
-	 */
-	if (opal_check_token(OPAL_NX_COPROC_INIT)) {
-		ret = opal_nx_coproc_init(chip_id, ct);
-		if (ret) {
-			pr_err("Failed to initialize NX for chip(%d): %d\n",
-				chip_id, ret);
-			ret = opal_error_code(ret);
-		}
-	} else
-		pr_warn("Firmware doesn't support NX initialization\n");
-
-	return ret;
-}
-
-static int __init nx842_powernv_probe(struct device_node *dn)
-{
-	struct nx842_coproc *coproc;
-	unsigned int ct, ci;
-	int chip_id;
-
-	chip_id = of_get_ibm_chip_id(dn);
-	if (chip_id < 0) {
-		pr_err("ibm,chip-id missing\n");
-		return -EINVAL;
-	}
-
-	if (of_property_read_u32(dn, "ibm,842-coprocessor-type", &ct)) {
-		pr_err("ibm,842-coprocessor-type missing\n");
-		return -EINVAL;
-	}
-
-	if (of_property_read_u32(dn, "ibm,842-coprocessor-instance", &ci)) {
-		pr_err("ibm,842-coprocessor-instance missing\n");
-		return -EINVAL;
-	}
-
-	coproc = kzalloc(sizeof(*coproc), GFP_KERNEL);
-	if (!coproc)
-		return -ENOMEM;
-
-	coproc->ct = ct;
-	coproc->ci = ci;
-	nx842_add_coprocs_list(coproc, chip_id);
-
-	pr_info("coprocessor found on chip %d, CT %d CI %d\n", chip_id, ct, ci);
-
-	if (!nx842_ct)
-		nx842_ct = ct;
-	else if (nx842_ct != ct)
-		pr_err("NX842 chip %d, CT %d != first found CT %d\n",
-		       chip_id, ct, nx842_ct);
-
-	return 0;
-}
-
-static void nx842_delete_coprocs(void)
-{
-	struct nx842_coproc *coproc, *n;
-	struct vas_window *txwin;
-	int i;
-
-	/*
-	 * close percpu txwins that are opened for the corresponding coproc.
-	 */
-	for_each_possible_cpu(i) {
-		txwin = per_cpu(cpu_txwin, i);
-		if (txwin)
-			vas_win_close(txwin);
-
-		per_cpu(cpu_txwin, i) = 0;
-	}
-
-	list_for_each_entry_safe(coproc, n, &nx842_coprocs, list) {
-		if (coproc->vas.rxwin)
-			vas_win_close(coproc->vas.rxwin);
-
-		list_del(&coproc->list);
-		kfree(coproc);
-	}
-}
-
 static struct nx842_constraints nx842_powernv_constraints = {
 	.alignment =	DDE_BUFFER_ALIGN,
 	.multiple =	DDE_BUFFER_LAST_MULT,
@@ -988,7 +653,7 @@ static int nx842_powernv_crypto_init(struct crypto_tfm *tfm)
 	return nx842_crypto_init(tfm, &nx842_powernv_driver);
 }
 
-static struct crypto_alg nx842_powernv_alg = {
+struct crypto_alg nx842_powernv_alg = {
 	.cra_name		= "842",
 	.cra_driver_name	= "842-nx",
 	.cra_priority		= 300,
@@ -1001,62 +666,3 @@ static int nx842_powernv_crypto_init(struct crypto_tfm *tfm)
 	.coa_compress		= nx842_crypto_compress,
 	.coa_decompress		= nx842_crypto_decompress } }
 };
-
-static __init int nx842_powernv_init(void)
-{
-	struct device_node *dn;
-	int ret;
-
-	/* verify workmem size/align restrictions */
-	BUILD_BUG_ON(WORKMEM_ALIGN % CRB_ALIGN);
-	BUILD_BUG_ON(CRB_ALIGN % DDE_ALIGN);
-	BUILD_BUG_ON(CRB_SIZE % DDE_ALIGN);
-	/* verify buffer size/align restrictions */
-	BUILD_BUG_ON(PAGE_SIZE % DDE_BUFFER_ALIGN);
-	BUILD_BUG_ON(DDE_BUFFER_ALIGN % DDE_BUFFER_SIZE_MULT);
-	BUILD_BUG_ON(DDE_BUFFER_SIZE_MULT % DDE_BUFFER_LAST_MULT);
-
-	for_each_compatible_node(dn, NULL, "ibm,power9-nx") {
-		ret = nx842_powernv_probe_vas(dn);
-		if (ret) {
-			nx842_delete_coprocs();
-			of_node_put(dn);
-			return ret;
-		}
-	}
-
-	if (list_empty(&nx842_coprocs)) {
-		for_each_compatible_node(dn, NULL, "ibm,power-nx")
-			nx842_powernv_probe(dn);
-
-		if (!nx842_ct)
-			return -ENODEV;
-
-		nx842_powernv_exec = nx842_exec_icswx;
-	} else {
-		ret = nx842_open_percpu_txwins();
-		if (ret) {
-			nx842_delete_coprocs();
-			return ret;
-		}
-
-		nx842_powernv_exec = nx842_exec_vas;
-	}
-
-	ret = crypto_register_alg(&nx842_powernv_alg);
-	if (ret) {
-		nx842_delete_coprocs();
-		return ret;
-	}
-
-	return 0;
-}
-module_init(nx842_powernv_init);
-
-static void __exit nx842_powernv_exit(void)
-{
-	crypto_unregister_alg(&nx842_powernv_alg);
-
-	nx842_delete_coprocs();
-}
-module_exit(nx842_powernv_exit);
diff --git a/drivers/crypto/nx/nx-842-powernv.h b/drivers/crypto/nx/nx-842-powernv.h
new file mode 100644
index 0000000..b754023
--- /dev/null
+++ b/drivers/crypto/nx/nx-842-powernv.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __NX_COMPRESS_POWERNV_H__
+#define __NX_COMPRESS_POWERNV_H__
+
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/crypto.h>
+#include <linux/slab.h>
+#include <linux/mm.h>
+
+#define WORKMEM_ALIGN	(CRB_ALIGN)
+#define CSB_WAIT_MAX	(5000) /* ms */
+#define VAS_RETRIES	(10)
+
+extern unsigned int nx842_ct;
+extern struct crypto_alg nx842_powernv_alg;
+
+extern int nx842_exec_icswx(const unsigned char *in, unsigned int inlen,
+				unsigned char *out, unsigned int *outlenp,
+				void *workmem, int fc);
+extern int nx842_exec_vas(const unsigned char *in, unsigned int inlen,
+				unsigned char *out, unsigned int *outlenp,
+				void *workmem, int fc);
+extern int (*nx842_powernv_exec)(const unsigned char *in, unsigned int inlen,
+				unsigned char *out, unsigned int *outlenp,
+				void *workmem, int fc);
+
+#endif /* __NX_COMPRESS_POWERNV_H__ */
diff --git a/drivers/crypto/nx/nx-commom-powernv.c b/drivers/crypto/nx/nx-commom-powernv.c
new file mode 100644
index 0000000..799ba28
--- /dev/null
+++ b/drivers/crypto/nx/nx-commom-powernv.c
@@ -0,0 +1,408 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Driver for IBM PowerNV NX compression accelerator
+ *
+ * Copyright (C) 2015 Dan Streetman, IBM Corp
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/module.h>
+#include <asm/prom.h>
+#include <asm/icswx.h>
+#include <asm/vas.h>
+#include <asm/reg.h>
+#include <asm/opal-api.h>
+#include <asm/opal.h>
+#include "nx-842-powernv.h"
+#include "nx-842.h"
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Dan Streetman <ddstreet@ieee.org>");
+MODULE_DESCRIPTION("NX H/W Compression driver for IBM PowerNV processors");
+MODULE_ALIAS_CRYPTO("842");
+MODULE_ALIAS_CRYPTO("842-nx");
+
+struct nx842_coproc {
+	unsigned int chip_id;
+	unsigned int ct;
+	unsigned int ci;        /* Coprocessor instance, used with icswx */
+	struct {
+		struct vas_window *rxwin;
+		int id;
+	} vas;
+	struct list_head list;
+};
+
+/*
+ * Send the request to NX engine on the chip for the corresponding CPU
+ * where the process is executing. Use with VAS function.
+ */
+DEFINE_PER_CPU(struct vas_window *, cpu_txwin) = NULL;
+
+unsigned int nx842_ct;	/* used in icswx function */
+
+/* no cpu hotplug on powernv, so this list never changes after init */
+static LIST_HEAD(nx842_coprocs);
+
+static inline void nx842_add_coprocs_list(struct nx842_coproc *coproc,
+					int chipid)
+{
+	coproc->chip_id = chipid;
+	INIT_LIST_HEAD(&coproc->list);
+	list_add(&coproc->list, &nx842_coprocs);
+}
+
+static struct vas_window *nx842_alloc_txwin(struct nx842_coproc *coproc)
+{
+	struct vas_window *txwin = NULL;
+	struct vas_tx_win_attr txattr;
+
+	/*
+	 * Kernel requests will be high priority. So open send
+	 * windows only for high priority RxFIFO entries.
+	 */
+	vas_init_tx_win_attr(&txattr, coproc->ct);
+	txattr.lpid = 0;	/* lpid is 0 for kernel requests */
+	txattr.pid = 0;		/* pid is 0 for kernel requests */
+
+	/*
+	 * Open a VAS send window which is used to send request to NX.
+	 */
+	txwin = vas_tx_win_open(coproc->vas.id, coproc->ct, &txattr);
+	if (IS_ERR(txwin))
+		pr_err("ibm,nx-842: Can not open TX window: %ld\n",
+				PTR_ERR(txwin));
+
+	return txwin;
+}
+
+/*
+ * Identify chip ID for each CPU, open send wndow for the corresponding NX
+ * engine and save txwin in percpu cpu_txwin.
+ * cpu_txwin is used in copy/paste operation for each compression /
+ * decompression request.
+ */
+static int nx842_open_percpu_txwins(void)
+{
+	struct nx842_coproc *coproc, *n;
+	unsigned int i, chip_id;
+
+	for_each_possible_cpu(i) {
+		struct vas_window *txwin = NULL;
+
+		chip_id = cpu_to_chip_id(i);
+
+		list_for_each_entry_safe(coproc, n, &nx842_coprocs, list) {
+			/*
+			 * Kernel requests use only high priority FIFOs. So
+			 * open send windows for these FIFOs.
+			 */
+
+			if (coproc->ct != VAS_COP_TYPE_842_HIPRI)
+				continue;
+
+			if (coproc->chip_id == chip_id) {
+				txwin = nx842_alloc_txwin(coproc);
+				if (IS_ERR(txwin))
+					return PTR_ERR(txwin);
+
+				per_cpu(cpu_txwin, i) = txwin;
+				break;
+			}
+		}
+
+		if (!per_cpu(cpu_txwin, i)) {
+			/* shouldn't happen, Each chip will have NX engine */
+			pr_err("NX engine is not available for CPU %d\n", i);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static int __init vas_cfg_coproc_info(struct device_node *dn, int chip_id,
+					int vasid, int *ct)
+{
+	struct vas_window *rxwin = NULL;
+	struct vas_rx_win_attr rxattr;
+	struct nx842_coproc *coproc;
+	u32 lpid, pid, tid, fifo_size;
+	u64 rx_fifo;
+	const char *priority;
+	int ret;
+
+	ret = of_property_read_u64(dn, "rx-fifo-address", &rx_fifo);
+	if (ret) {
+		pr_err("Missing rx-fifo-address property\n");
+		return ret;
+	}
+
+	ret = of_property_read_u32(dn, "rx-fifo-size", &fifo_size);
+	if (ret) {
+		pr_err("Missing rx-fifo-size property\n");
+		return ret;
+	}
+
+	ret = of_property_read_u32(dn, "lpid", &lpid);
+	if (ret) {
+		pr_err("Missing lpid property\n");
+		return ret;
+	}
+
+	ret = of_property_read_u32(dn, "pid", &pid);
+	if (ret) {
+		pr_err("Missing pid property\n");
+		return ret;
+	}
+
+	ret = of_property_read_u32(dn, "tid", &tid);
+	if (ret) {
+		pr_err("Missing tid property\n");
+		return ret;
+	}
+
+	ret = of_property_read_string(dn, "priority", &priority);
+	if (ret) {
+		pr_err("Missing priority property\n");
+		return ret;
+	}
+
+	coproc = kzalloc(sizeof(*coproc), GFP_KERNEL);
+	if (!coproc)
+		return -ENOMEM;
+
+	if (!strcmp(priority, "High"))
+		coproc->ct = VAS_COP_TYPE_842_HIPRI;
+	else if (!strcmp(priority, "Normal"))
+		coproc->ct = VAS_COP_TYPE_842;
+	else {
+		pr_err("Invalid RxFIFO priority value\n");
+		ret =  -EINVAL;
+		goto err_out;
+	}
+
+	vas_init_rx_win_attr(&rxattr, coproc->ct);
+	rxattr.rx_fifo = (void *)rx_fifo;
+	rxattr.rx_fifo_size = fifo_size;
+	rxattr.lnotify_lpid = lpid;
+	rxattr.lnotify_pid = pid;
+	rxattr.lnotify_tid = tid;
+	/*
+	 * Maximum RX window credits can not be more than #CRBs in
+	 * RxFIFO. Otherwise, can get checkstop if RxFIFO overruns.
+	 */
+	rxattr.wcreds_max = fifo_size / CRB_SIZE;
+
+	/*
+	 * Open a VAS receice window which is used to configure RxFIFO
+	 * for NX.
+	 */
+	rxwin = vas_rx_win_open(vasid, coproc->ct, &rxattr);
+	if (IS_ERR(rxwin)) {
+		ret = PTR_ERR(rxwin);
+		pr_err("setting RxFIFO with VAS failed: %d\n",
+			ret);
+		goto err_out;
+	}
+
+	coproc->vas.rxwin = rxwin;
+	coproc->vas.id = vasid;
+	nx842_add_coprocs_list(coproc, chip_id);
+
+	/*
+	 * (lpid, pid, tid) combination has to be unique for each
+	 * coprocessor instance in the system. So to make it
+	 * unique, skiboot uses coprocessor type such as 842 or
+	 * GZIP for pid and provides this value to kernel in pid
+	 * device-tree property.
+	 */
+	*ct = pid;
+
+	return 0;
+
+err_out:
+	kfree(coproc);
+	return ret;
+}
+
+
+static int __init nx842_powernv_probe_vas(struct device_node *pn)
+{
+	struct device_node *dn;
+	int chip_id, vasid, ret = 0;
+	int nx_fifo_found = 0;
+	int ct = 0;
+
+	chip_id = of_get_ibm_chip_id(pn);
+	if (chip_id < 0) {
+		pr_err("ibm,chip-id missing\n");
+		return -EINVAL;
+	}
+
+	vasid = chip_to_vas_id(chip_id);
+	if (vasid < 0) {
+		pr_err("Unable to map chip_id %d to vasid\n", chip_id);
+		return -EINVAL;
+	}
+
+	for_each_child_of_node(pn, dn) {
+		if (of_device_is_compatible(dn, "ibm,p9-nx-842")) {
+			ret = vas_cfg_coproc_info(dn, chip_id, vasid, &ct);
+			if (ret) {
+				of_node_put(dn);
+				return ret;
+			}
+			nx_fifo_found++;
+		}
+	}
+
+	if (!nx_fifo_found) {
+		pr_err("NX842 FIFO nodes are missing\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * Initialize NX instance for both high and normal priority FIFOs.
+	 */
+	if (opal_check_token(OPAL_NX_COPROC_INIT)) {
+		ret = opal_nx_coproc_init(chip_id, ct);
+		if (ret) {
+			pr_err("Failed to initialize NX for chip(%d): %d\n",
+				chip_id, ret);
+			ret = opal_error_code(ret);
+		}
+	} else
+		pr_warn("Firmware doesn't support NX initialization\n");
+
+	return ret;
+}
+
+static int __init nx842_powernv_probe(struct device_node *dn)
+{
+	struct nx842_coproc *coproc;
+	unsigned int ct, ci;
+	int chip_id;
+
+	chip_id = of_get_ibm_chip_id(dn);
+	if (chip_id < 0) {
+		pr_err("ibm,chip-id missing\n");
+		return -EINVAL;
+	}
+
+	if (of_property_read_u32(dn, "ibm,842-coprocessor-type", &ct)) {
+		pr_err("ibm,842-coprocessor-type missing\n");
+		return -EINVAL;
+	}
+
+	if (of_property_read_u32(dn, "ibm,842-coprocessor-instance", &ci)) {
+		pr_err("ibm,842-coprocessor-instance missing\n");
+		return -EINVAL;
+	}
+
+	coproc = kmalloc(sizeof(*coproc), GFP_KERNEL);
+	if (!coproc)
+		return -ENOMEM;
+
+	coproc->ct = ct;
+	coproc->ci = ci;
+	nx842_add_coprocs_list(coproc, chip_id);
+
+	pr_info("coprocessor found on chip %d, CT %d CI %d\n", chip_id, ct, ci);
+
+	if (!nx842_ct)
+		nx842_ct = ct;
+	else if (nx842_ct != ct)
+		pr_err("NX842 chip %d, CT %d != first found CT %d\n",
+		       chip_id, ct, nx842_ct);
+
+	return 0;
+}
+
+static void nx842_delete_coprocs(void)
+{
+	struct nx842_coproc *coproc, *n;
+	struct vas_window *txwin;
+	int i;
+
+	/*
+	 * close percpu txwins that are opened for the corresponding coproc.
+	 */
+	for_each_possible_cpu(i) {
+		txwin = per_cpu(cpu_txwin, i);
+		if (txwin)
+			vas_win_close(txwin);
+
+		per_cpu(cpu_txwin, i) = 0;
+	}
+
+	list_for_each_entry_safe(coproc, n, &nx842_coprocs, list) {
+		if (coproc->vas.rxwin)
+			vas_win_close(coproc->vas.rxwin);
+
+		list_del(&coproc->list);
+		kfree(coproc);
+	}
+}
+
+static __init int nx842_powernv_init(void)
+{
+	struct device_node *dn;
+	int ret;
+
+	/* verify workmem size/align restrictions */
+	BUILD_BUG_ON(WORKMEM_ALIGN % CRB_ALIGN);
+	BUILD_BUG_ON(CRB_ALIGN % DDE_ALIGN);
+	BUILD_BUG_ON(CRB_SIZE % DDE_ALIGN);
+	/* verify buffer size/align restrictions */
+	BUILD_BUG_ON(PAGE_SIZE % DDE_BUFFER_ALIGN);
+	BUILD_BUG_ON(DDE_BUFFER_ALIGN % DDE_BUFFER_SIZE_MULT);
+	BUILD_BUG_ON(DDE_BUFFER_SIZE_MULT % DDE_BUFFER_LAST_MULT);
+
+	nx842_ct = 0;
+
+	for_each_compatible_node(dn, NULL, "ibm,power9-nx") {
+		ret = nx842_powernv_probe_vas(dn);
+		if (ret) {
+			nx842_delete_coprocs();
+			of_node_put(dn);
+			return ret;
+		}
+	}
+
+	if (list_empty(&nx842_coprocs)) {
+		for_each_compatible_node(dn, NULL, "ibm,power-nx")
+			nx842_powernv_probe(dn);
+
+		if (!nx842_ct)
+			return -ENODEV;
+
+		nx842_powernv_exec = nx842_exec_icswx;
+	} else {
+		ret = nx842_open_percpu_txwins();
+		if (ret) {
+			nx842_delete_coprocs();
+			return ret;
+		}
+
+		nx842_powernv_exec = nx842_exec_vas;
+	}
+
+	ret = crypto_register_alg(&nx842_powernv_alg);
+	if (ret) {
+		nx842_delete_coprocs();
+		return ret;
+	}
+
+	return 0;
+}
+module_init(nx842_powernv_init);
+
+static void __exit nx842_powernv_exit(void)
+{
+	crypto_unregister_alg(&nx842_powernv_alg);
+
+	nx842_delete_coprocs();
+}
+module_exit(nx842_powernv_exit);
-- 
1.8.3.1




