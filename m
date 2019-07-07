Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C37E261358
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jul 2019 02:20:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45h8PB5HbczDqWt
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jul 2019 10:20:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=nayna@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45h8Mj6dYwzDqRy
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Jul 2019 10:19:13 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x670HLbV036023
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 6 Jul 2019 20:19:09 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tjr58kfr8-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 06 Jul 2019 20:19:08 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <nayna@linux.ibm.com>;
 Sun, 7 Jul 2019 01:19:06 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sun, 7 Jul 2019 01:19:03 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x670J2XS23331042
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 7 Jul 2019 00:19:02 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F353DAE051;
 Sun,  7 Jul 2019 00:19:01 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1E826AE053;
 Sun,  7 Jul 2019 00:18:59 +0000 (GMT)
Received: from swastik.ibm.com (unknown [9.80.232.154])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun,  7 Jul 2019 00:18:58 +0000 (GMT)
From: Nayna Jain <nayna@linux.ibm.com>
To: linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] tpm: tpm_ibm_vtpm: Fix unallocated banks
Date: Sat,  6 Jul 2019 20:18:45 -0400
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19070700-0028-0000-0000-000003817FD5
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070700-0029-0000-0000-0000244184A4
Message-Id: <1562458725-15999-1-git-send-email-nayna@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-06_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907070003
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 Michal Suchanek <msuchanek@suse.de>, Nayna Jain <nayna@linux.ibm.com>,
 linux-kernel@vger.kernel.org,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Mimi Zohar <zohar@linux.ibm.com>,
 Peter Huewe <peterhuewe@gmx.de>, George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The nr_allocated_banks and allocated banks are initialized as part of
tpm_chip_register. Currently, this is done as part of auto startup
function. However, some drivers, like the ibm vtpm driver, do not run
auto startup during initialization. This results in uninitialized memory
issue and causes a kernel panic during boot.

This patch moves the pcr allocation outside the auto startup function
into tpm_chip_register. This ensures that allocated banks are initialized
in any case.

Fixes: 879b589210a9 ("tpm: retrieve digest size of unknown algorithms with
PCR read")
Reported-by: Michal Suchanek <msuchanek@suse.de>
Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
Tested-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
Tested-by: Michal Suchánek <msuchanek@suse.de>
---
Changelog:

v2:
* Includes Jarkko's feedbacks
  * fixes the function name to tpm_get_pcr_allocation()
  * adds new function tpm1_get_pcr_allocation()
  * updates patch summary line
  * fixes alignment
  * adds Reported-by: Michal Suchanek <msuchanek@suse.de>
* Includes Stefan's feedbacks
  * Fixes overwriting of return code
  * Fixes misplacing of tpm_chip_stop()
* Adds Reviewed-by, Tested-by

 drivers/char/tpm/tpm-chip.c | 22 ++++++++++++++++++++++
 drivers/char/tpm/tpm.h      |  2 ++
 drivers/char/tpm/tpm1-cmd.c | 36 ++++++++++++++++++++++++------------
 drivers/char/tpm/tpm2-cmd.c |  6 +-----
 4 files changed, 49 insertions(+), 17 deletions(-)

diff --git a/drivers/char/tpm/tpm-chip.c b/drivers/char/tpm/tpm-chip.c
index 8804c9e916fd..6589291df355 100644
--- a/drivers/char/tpm/tpm-chip.c
+++ b/drivers/char/tpm/tpm-chip.c
@@ -550,6 +550,22 @@ static int tpm_add_hwrng(struct tpm_chip *chip)
 	return hwrng_register(&chip->hwrng);
 }
 
+/*
+ * tpm_get_pcr_allocation() - initialize the chip allocated banks for PCRs
+ * @chip: TPM chip to use.
+ */
+static int tpm_get_pcr_allocation(struct tpm_chip *chip)
+{
+	int rc;
+
+	if (chip->flags & TPM_CHIP_FLAG_TPM2)
+		rc = tpm2_get_pcr_allocation(chip);
+	else
+		rc = tpm1_get_pcr_allocation(chip);
+
+	return rc;
+}
+
 /*
  * tpm_chip_register() - create a character device for the TPM chip
  * @chip: TPM chip to use.
@@ -569,6 +585,12 @@ int tpm_chip_register(struct tpm_chip *chip)
 	if (rc)
 		return rc;
 	rc = tpm_auto_startup(chip);
+	if (rc) {
+		tpm_chip_stop(chip);
+		return rc;
+	}
+
+	rc = tpm_get_pcr_allocation(chip);
 	tpm_chip_stop(chip);
 	if (rc)
 		return rc;
diff --git a/drivers/char/tpm/tpm.h b/drivers/char/tpm/tpm.h
index 2cce072f25b5..d571df3694c3 100644
--- a/drivers/char/tpm/tpm.h
+++ b/drivers/char/tpm/tpm.h
@@ -399,6 +399,7 @@ int tpm1_pcr_read(struct tpm_chip *chip, u32 pcr_idx, u8 *res_buf);
 ssize_t tpm1_getcap(struct tpm_chip *chip, u32 subcap_id, cap_t *cap,
 		    const char *desc, size_t min_cap_length);
 int tpm1_get_random(struct tpm_chip *chip, u8 *out, size_t max);
+int tpm1_get_pcr_allocation(struct tpm_chip *chip);
 unsigned long tpm_calc_ordinal_duration(struct tpm_chip *chip, u32 ordinal);
 int tpm_pm_suspend(struct device *dev);
 int tpm_pm_resume(struct device *dev);
@@ -454,6 +455,7 @@ int tpm2_unseal_trusted(struct tpm_chip *chip,
 ssize_t tpm2_get_tpm_pt(struct tpm_chip *chip, u32 property_id,
 			u32 *value, const char *desc);
 
+ssize_t tpm2_get_pcr_allocation(struct tpm_chip *chip);
 int tpm2_auto_startup(struct tpm_chip *chip);
 void tpm2_shutdown(struct tpm_chip *chip, u16 shutdown_type);
 unsigned long tpm2_calc_ordinal_duration(struct tpm_chip *chip, u32 ordinal);
diff --git a/drivers/char/tpm/tpm1-cmd.c b/drivers/char/tpm/tpm1-cmd.c
index 85dcf2654d11..260a3917f0fe 100644
--- a/drivers/char/tpm/tpm1-cmd.c
+++ b/drivers/char/tpm/tpm1-cmd.c
@@ -696,18 +696,6 @@ int tpm1_auto_startup(struct tpm_chip *chip)
 		goto out;
 	}
 
-	chip->allocated_banks = kcalloc(1, sizeof(*chip->allocated_banks),
-					GFP_KERNEL);
-	if (!chip->allocated_banks) {
-		rc = -ENOMEM;
-		goto out;
-	}
-
-	chip->allocated_banks[0].alg_id = TPM_ALG_SHA1;
-	chip->allocated_banks[0].digest_size = hash_digest_size[HASH_ALGO_SHA1];
-	chip->allocated_banks[0].crypto_id = HASH_ALGO_SHA1;
-	chip->nr_allocated_banks = 1;
-
 	return rc;
 out:
 	if (rc > 0)
@@ -776,3 +764,27 @@ int tpm1_pm_suspend(struct tpm_chip *chip, u32 tpm_suspend_pcr)
 	return rc;
 }
 
+/**
+ * tpm1_get_pcr_allocation() - initialize the allocated bank
+ * @chip: TPM chip to use.
+ *
+ * The function initializes the SHA1 allocated bank to extend PCR
+ *
+ * Return:
+ * * 0 on success,
+ * * < 0 on error.
+ */
+int tpm1_get_pcr_allocation(struct tpm_chip *chip)
+{
+	chip->allocated_banks = kcalloc(1, sizeof(*chip->allocated_banks),
+					GFP_KERNEL);
+	if (!chip->allocated_banks)
+		return -ENOMEM;
+
+	chip->allocated_banks[0].alg_id = TPM_ALG_SHA1;
+	chip->allocated_banks[0].digest_size = hash_digest_size[HASH_ALGO_SHA1];
+	chip->allocated_banks[0].crypto_id = HASH_ALGO_SHA1;
+	chip->nr_allocated_banks = 1;
+
+	return 0;
+}
diff --git a/drivers/char/tpm/tpm2-cmd.c b/drivers/char/tpm/tpm2-cmd.c
index e74c5b7b64bf..b4384d0e3741 100644
--- a/drivers/char/tpm/tpm2-cmd.c
+++ b/drivers/char/tpm/tpm2-cmd.c
@@ -841,7 +841,7 @@ struct tpm2_pcr_selection {
 	u8  pcr_select[3];
 } __packed;
 
-static ssize_t tpm2_get_pcr_allocation(struct tpm_chip *chip)
+ssize_t tpm2_get_pcr_allocation(struct tpm_chip *chip)
 {
 	struct tpm2_pcr_selection pcr_selection;
 	struct tpm_buf buf;
@@ -1041,10 +1041,6 @@ int tpm2_auto_startup(struct tpm_chip *chip)
 			goto out;
 	}
 
-	rc = tpm2_get_pcr_allocation(chip);
-	if (rc)
-		goto out;
-
 	rc = tpm2_get_cc_attrs_tbl(chip);
 
 out:
-- 
2.20.1

