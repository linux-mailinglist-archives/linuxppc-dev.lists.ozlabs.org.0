Return-Path: <linuxppc-dev+bounces-1181-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE81C971C0D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Sep 2024 16:03:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2T7T2xsqz2yLC;
	Tue, 10 Sep 2024 00:03:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725890581;
	cv=none; b=GLd+WHOSjEY18sq4eDh2JTeyUJqqSzBy/lcSaR5jAxkkw2uB5UOiXdjUL8lZV3orLvQnOH3pwsUvRF1SviXjynJ4eVxsZr2kcpXoxyUF/2cAYE2DD03ub6Sn2nq2ZnXEJQAQ4oBvRnCco3GtBWcVmpW2jr82L7f/3FX0Fe5PycZVEbFx0esOreWrnuqkiI3naNHtUXrS6Q5Gv56OBHEFLsovzm2nENzUH4ZCVVv/XIVxrl3JiQyl7XGVODp3yv7GP7lNCF8DOyi6jZxy6D5Uj0HAsCCV4k/4tfLyanMRADFf0g0Dcmn6R/eZgb26oM4qJklDpK4B2fuTMkLP62QtkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725890581; c=relaxed/relaxed;
	bh=yqo72ZH3uwBBeekmo7QfA6R2nWE3Fj2bj3GZAzl5R0c=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=EKchQEqx5oopJxTZSth8lbJUxcDdzAviMopq9T/T+iyHHSq7meuEsmK/xk2NMrLQXbLgcCqF82kqgfGiFlwmE60M4ii9bfSbbNcbSeZgfhbtPhg3x1W34UrLjyxJS4UmnClmwmtlW32a1gqsyWJpu/9aK6j2uHAu/7UE5BxN81b1yRpo1H1Z2Mh3KknUtTEee5BnTx9IM5k6gHWSlVmhGc6AAhekgvpDfii8XE9yX6Gp9bDlARmiUTB3zZsD8mzrrg6HJl01mQgsrkflVxafOoQeqZzxLAF8tVEkMD9G8+AiaYxakhfKt6GYB9kgJYEJO9vlJCEk4TAafEVHtB7bpw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Gja6Y9sN; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nnmlinux@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Gja6Y9sN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nnmlinux@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2T7S5jlZz2yK9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2024 00:03:00 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 489DwMKB000802;
	Mon, 9 Sep 2024 14:02:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:content-transfer-encoding
	:mime-version; s=pp1; bh=yqo72ZH3uwBBeekmo7QfA6R2nWE3Fj2bj3GZAzl
	5R0c=; b=Gja6Y9sNjP2+G2vDqbh4FstDcoNiKXsdSRh58ImTP6ZONXvI51UBJQc
	/6SUHJHbAcgZcyj2Cjqnt9ti2hSmJPZsVkmxGOVfjfZBgkP0CICzl4UOTqwcalWn
	tsEwCH/aTtJ4CzJ2MVob368ioEqH31N2pB0qJsDuKAoqF6jVRcrYpDcQshTIUeDS
	gwhWHrB7dQuB+OR2P4dB/U8JAn6dNnLm1GZ+l8H3ijlIEHIvhdunhL52TZwGxbVK
	/6pMpYGkXo4uv76E7KxiXeIsw/BZ4IcDmZkj+tKEmEH3pX4J5GIfsWJmnHVYNI53
	ioZ/ixnhLokS7H5z5VwKYJuB8E0BzMQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41gegwj6v9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Sep 2024 14:02:47 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 489E2kg8012058;
	Mon, 9 Sep 2024 14:02:46 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41gegwj6uw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Sep 2024 14:02:46 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 489Bg1j2032109;
	Mon, 9 Sep 2024 14:02:44 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 41h2nmempq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Sep 2024 14:02:44 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 489E2fIW21037540
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Sep 2024 14:02:41 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F11D92004B;
	Mon,  9 Sep 2024 14:02:40 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3565520043;
	Mon,  9 Sep 2024 14:02:39 +0000 (GMT)
Received: from ltcrain34-lp2.aus.stglabs.ibm.com (unknown [9.3.101.41])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  9 Sep 2024 14:02:39 +0000 (GMT)
From: Narayana Murty N <nnmlinux@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
        linux-kernel@vger.kernel.org
Cc: mahesh@linux.ibm.com, oohall@gmail.com, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org, vaibhav@linux.ibm.com,
        ganeshgr@linux.ibm.com, sbhat@linux.ibm.com
Subject: [PATCH v3] powerpc/pseries/eeh: Fix pseries_eeh_err_inject
Date: Mon,  9 Sep 2024 09:02:20 -0500
Message-ID: <20240909140220.529333-1-nnmlinux@linux.ibm.com>
X-Mailer: git-send-email 2.45.2
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tvjZ2tSnPZLGSzcn3ImH8zDHTJu3Sl3W
X-Proofpoint-ORIG-GUID: qiUD1P0MQK4xkHwyNr-kHOZCYUHjUgRH
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-09_06,2024-09-09_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 impostorscore=0 clxscore=1011 malwarescore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409090113

VFIO_EEH_PE_INJECT_ERR ioctl is currently failing on pseries
due to missing implementation of err_inject eeh_ops for pseries.
This patch implements pseries_eeh_err_inject in eeh_ops/pseries
eeh_ops. Implements support for injecting MMIO load/store error
for testing from user space.

The check on PCI error type (bus type) code is moved to platform
code, since the eeh_pe_inject_err can be allowed to more error
types depending on platform requirement. Removal of the check for
'type' in eeh_pe_inject_err() doesn't impact PowerNV as
pnv_eeh_err_inject() already has an equivalent check in place.

Signed-off-by: Narayana Murty N <nnmlinux@linux.ibm.com>
Reviewed-by: Vaibhav Jain <vaibhav@linux.ibm.com>

---

Testing:
========
vfio-test [1] by Alex Willamson, was forked and updated to add
support inject error on pSeries guest and used to test this
patch[2].

References:
===========
[1] https://github.com/awilliam/tests
[2] https://github.com/nnmwebmin/vfio-ppc-tests/tree/vfio-ppc-ex

================
Changelog:
V2: https://lore.kernel.org/all/20240823151158.92602-1-nnmlinux@linux.ibm.com/
- Updated patch description explicitly mentioning about similar checks
in place for PoweRNV as suggested.
- eeh_pe_inject_mmio_error wrapper function removed because CONFIG_EEH
is always enabled built for PPC_PSERIES when PPC_PSERIES=y.
V1: https://lore.kernel.org/all/20240822082713.529982-1-nnmlinux@linux.ibm.com/
- Resolved build issues for ppc64|le_defconfig by moving the
pseries_eeh_err_inject() definition outside of the CONFIG_PCI_IOV
code block.
- New eeh_pe_inject_mmio_error wrapper function added to avoid
CONFIG_EEH is not set.
---
 arch/powerpc/include/asm/eeh.h               |  2 +-
 arch/powerpc/kernel/eeh.c                    |  9 +++--
 arch/powerpc/platforms/pseries/eeh_pseries.c | 39 +++++++++++++++++++-
 3 files changed, 44 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index 91a9fd53254f..317b12fc1fe4 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -308,7 +308,7 @@ int eeh_pe_reset(struct eeh_pe *pe, int option, bool include_passed);
 int eeh_pe_configure(struct eeh_pe *pe);
 int eeh_pe_inject_err(struct eeh_pe *pe, int type, int func,
 		      unsigned long addr, unsigned long mask);
-
+int eeh_pe_inject_mmio_error(struct pci_dev *pdev);
 /**
  * EEH_POSSIBLE_ERROR() -- test for possible MMIO failure.
  *
diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index d03f17987fca..49ab11a287a3 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -1537,10 +1537,6 @@ int eeh_pe_inject_err(struct eeh_pe *pe, int type, int func,
 	if (!eeh_ops || !eeh_ops->err_inject)
 		return -ENOENT;
 
-	/* Check on PCI error type */
-	if (type != EEH_ERR_TYPE_32 && type != EEH_ERR_TYPE_64)
-		return -EINVAL;
-
 	/* Check on PCI error function */
 	if (func < EEH_ERR_FUNC_MIN || func > EEH_ERR_FUNC_MAX)
 		return -EINVAL;
@@ -1851,6 +1847,11 @@ static const struct file_operations eeh_dev_break_fops = {
 	.read   = eeh_debugfs_dev_usage,
 };
 
+int eeh_pe_inject_mmio_error(struct pci_dev *pdev)
+{
+	return eeh_debugfs_break_device(pdev);
+}
+
 static ssize_t eeh_dev_can_recover(struct file *filp,
 				   const char __user *user_buf,
 				   size_t count, loff_t *ppos)
diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index b1ae0c0d1187..1893f66371fa 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -784,6 +784,43 @@ static int pseries_notify_resume(struct eeh_dev *edev)
 }
 #endif
 
+/**
+ * pseries_eeh_err_inject - Inject specified error to the indicated PE
+ * @pe: the indicated PE
+ * @type: error type
+ * @func: specific error type
+ * @addr: address
+ * @mask: address mask
+ * The routine is called to inject specified error, which is
+ * determined by @type and @func, to the indicated PE
+ */
+static int pseries_eeh_err_inject(struct eeh_pe *pe, int type, int func,
+				  unsigned long addr, unsigned long mask)
+{
+	struct	eeh_dev	*pdev;
+
+	/* Check on PCI error type */
+	if (type != EEH_ERR_TYPE_32 && type != EEH_ERR_TYPE_64)
+		return -EINVAL;
+
+	switch (func) {
+	case EEH_ERR_FUNC_LD_MEM_ADDR:
+	case EEH_ERR_FUNC_LD_MEM_DATA:
+	case EEH_ERR_FUNC_ST_MEM_ADDR:
+	case EEH_ERR_FUNC_ST_MEM_DATA:
+		/* injects a MMIO error for all pdev's belonging to PE */
+		pci_lock_rescan_remove();
+		list_for_each_entry(pdev, &pe->edevs, entry)
+			eeh_pe_inject_mmio_error(pdev->pdev);
+		pci_unlock_rescan_remove();
+		break;
+	default:
+		return -ERANGE;
+	}
+
+	return 0;
+}
+
 static struct eeh_ops pseries_eeh_ops = {
 	.name			= "pseries",
 	.probe			= pseries_eeh_probe,
@@ -792,7 +829,7 @@ static struct eeh_ops pseries_eeh_ops = {
 	.reset			= pseries_eeh_reset,
 	.get_log		= pseries_eeh_get_log,
 	.configure_bridge       = pseries_eeh_configure_bridge,
-	.err_inject		= NULL,
+	.err_inject		= pseries_eeh_err_inject,
 	.read_config		= pseries_eeh_read_config,
 	.write_config		= pseries_eeh_write_config,
 	.next_error		= NULL,
-- 
2.45.2


