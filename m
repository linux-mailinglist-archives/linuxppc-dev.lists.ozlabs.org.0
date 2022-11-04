Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6947619ECF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 18:34:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3nnG4B23z3f8g
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Nov 2022 04:34:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o/csY/eS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o/csY/eS;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3nfH0hBfz3cMf
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Nov 2022 04:28:38 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A4H1FUM004213;
	Fri, 4 Nov 2022 17:28:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=17BLfKnsWZ3uMChhDScW+mlbmu+AG/HhgAZHdCCb69k=;
 b=o/csY/eShAF+j2Cn1CiQX+vFxKQ5LHTW51svhLhYylKP/SK5pF9IY3/W+pTV/tNu9S03
 WE97TWBa5u4fvPONd+p2nH8MCS/1jBPYOAMI2XipSQMV2pQZg86DNg4ypKb6J0s6iIMB
 YtEMLb8HgsYTUPmtx38xqmuhU24nQMM4l4uXROjnhw3vsqvQt0Mc8SuMiDhH2ySX6Ygm
 9NsrQ+KUMvDjPrLHlGgaRIRq2qrridhx7yhaZiMdLj/Ku5sk4JbzJuf+HHieE4bomOjv
 sia74e6jvf3cR6LCMFAfckTxywFCEqYoZIGYVnP/z4FFzM4GXKIYEPPD3pfThENmQXIL 1g== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kmyqw6xsf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Nov 2022 17:28:25 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A4HJwT5008925;
	Fri, 4 Nov 2022 17:28:23 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma06ams.nl.ibm.com with ESMTP id 3kguej2qh5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Nov 2022 17:28:22 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A4HSKIu46268736
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 4 Nov 2022 17:28:20 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 780645204F;
	Fri,  4 Nov 2022 17:28:20 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 842625204E;
	Fri,  4 Nov 2022 17:28:19 +0000 (GMT)
Received: from jarvis-ozlabs-ibm-com.ibmuc.com (unknown [9.43.196.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 099426038F;
	Sat,  5 Nov 2022 04:28:15 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 4/6] powerpc/powernv: Convert pointers to physical addresses in OPAL call args
Date: Sat,  5 Nov 2022 04:27:35 +1100
Message-Id: <20221104172737.391978-5-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221104172737.391978-1-ajd@linux.ibm.com>
References: <20221104172737.391978-1-ajd@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Y4v4z7vYuERWxh00phOq7BTw7bsYQYfA
X-Proofpoint-GUID: Y4v4z7vYuERWxh00phOq7BTw7bsYQYfA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-04_11,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211040108
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
Cc: linux-hardening@vger.kernel.org, cmr@bluescreens.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A number of OPAL calls take addresses as arguments (e.g. buffers with
strings to print, etc). These addresses need to be physical addresses, as
OPAL runs in real mode.

Since the hardware ignores the top two bits of the address in real mode,
passing addresses in the kernel's linear map works fine even if we don't
wrap them in __pa().

With VMAP_STACK, however, we're going to have to use vmalloc_to_phys() to
convert addresses from the stack into an address that OPAL can use.

Introduce a new macro, stack_pa(), that uses vmalloc_to_phys() for
addresses in the vmalloc area, and __pa() for linear map addresses. Add it
to all the existing callsites where we pass pointers to OPAL.

Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
---
 arch/powerpc/kvm/book3s_hv_builtin.c          |  2 +-
 arch/powerpc/platforms/powernv/eeh-powernv.c  | 20 ++++++-----
 arch/powerpc/platforms/powernv/ocxl.c         |  3 +-
 arch/powerpc/platforms/powernv/opal-core.c    |  4 +--
 arch/powerpc/platforms/powernv/opal-dump.c    |  6 ++--
 arch/powerpc/platforms/powernv/opal-elog.c    | 10 +++---
 arch/powerpc/platforms/powernv/opal-fadump.c  | 12 +++----
 arch/powerpc/platforms/powernv/opal-flash.c   |  5 +--
 arch/powerpc/platforms/powernv/opal-hmi.c     |  3 +-
 arch/powerpc/platforms/powernv/opal-irqchip.c |  4 +--
 arch/powerpc/platforms/powernv/opal-lpc.c     |  8 ++---
 arch/powerpc/platforms/powernv/opal-nvram.c   |  4 +--
 arch/powerpc/platforms/powernv/opal-power.c   |  4 +--
 .../powerpc/platforms/powernv/opal-powercap.c |  2 +-
 arch/powerpc/platforms/powernv/opal-prd.c     |  6 ++--
 arch/powerpc/platforms/powernv/opal-psr.c     |  2 +-
 arch/powerpc/platforms/powernv/opal-rtc.c     |  2 +-
 arch/powerpc/platforms/powernv/opal-secvar.c  |  9 +++--
 arch/powerpc/platforms/powernv/opal-sensor.c  |  4 +--
 .../powerpc/platforms/powernv/opal-sysparam.c |  4 +--
 arch/powerpc/platforms/powernv/opal-xscom.c   |  2 +-
 arch/powerpc/platforms/powernv/opal.c         | 16 ++++-----
 arch/powerpc/platforms/powernv/pci-ioda.c     | 14 ++++----
 arch/powerpc/platforms/powernv/pci.c          | 25 +++++++-------
 arch/powerpc/platforms/powernv/setup.c        |  2 +-
 arch/powerpc/platforms/powernv/smp.c          |  2 +-
 arch/powerpc/sysdev/xics/icp-opal.c           |  2 +-
 arch/powerpc/sysdev/xics/ics-opal.c           |  8 ++---
 arch/powerpc/sysdev/xive/native.c             | 33 ++++++++++++-------
 drivers/char/ipmi/ipmi_powernv.c              |  6 ++--
 drivers/char/powernv-op-panel.c               |  2 +-
 drivers/i2c/busses/i2c-opal.c                 |  2 +-
 drivers/leds/leds-powernv.c                   |  6 ++--
 drivers/mtd/devices/powernv_flash.c           |  4 +--
 drivers/rtc/rtc-opal.c                        |  4 +--
 35 files changed, 135 insertions(+), 107 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_builtin.c b/arch/powerpc/kvm/book3s_hv_builtin.c
index da85f046377a..dba041d659d2 100644
--- a/arch/powerpc/kvm/book3s_hv_builtin.c
+++ b/arch/powerpc/kvm/book3s_hv_builtin.c
@@ -414,7 +414,7 @@ static long kvmppc_read_one_intr(bool *again)
 	xics_phys = local_paca->kvm_hstate.xics_phys;
 	rc = 0;
 	if (!xics_phys)
-		rc = opal_int_get_xirr(&xirr, false);
+		rc = opal_int_get_xirr(stack_pa(&xirr), false);
 	else
 		xirr = __raw_rm_readl(xics_phys + XICS_XIRR);
 	if (rc < 0)
diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
index a83cb679dd59..f069aa28f969 100644
--- a/arch/powerpc/platforms/powernv/eeh-powernv.c
+++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
@@ -517,7 +517,7 @@ static void pnv_eeh_get_phb_diag(struct eeh_pe *pe)
 	struct pnv_phb *phb = pe->phb->private_data;
 	s64 rc;
 
-	rc = opal_pci_get_phb_diag_data2(phb->opal_id, pe->data,
+	rc = opal_pci_get_phb_diag_data2(phb->opal_id, stack_pa(pe->data),
 					 phb->diag_data_size);
 	if (rc != OPAL_SUCCESS)
 		pr_warn("%s: Failure %lld getting PHB#%x diag-data\n",
@@ -534,8 +534,8 @@ static int pnv_eeh_get_phb_state(struct eeh_pe *pe)
 
 	rc = opal_pci_eeh_freeze_status(phb->opal_id,
 					pe->addr,
-					&fstate,
-					&pcierr,
+					stack_pa(&fstate),
+					stack_pa(&pcierr),
 					NULL);
 	if (rc != OPAL_SUCCESS) {
 		pr_warn("%s: Failure %lld getting PHB#%x state\n",
@@ -594,8 +594,8 @@ static int pnv_eeh_get_pe_state(struct eeh_pe *pe)
 	} else {
 		rc = opal_pci_eeh_freeze_status(phb->opal_id,
 						pe->addr,
-						&fstate,
-						&pcierr,
+						stack_pa(&fstate),
+						stack_pa(&pcierr),
 						NULL);
 		if (rc != OPAL_SUCCESS) {
 			pr_warn("%s: Failure %lld getting PHB#%x-PE%x state\n",
@@ -1287,7 +1287,8 @@ static void pnv_eeh_get_and_dump_hub_diag(struct pci_controller *hose)
 		(struct OpalIoP7IOCErrorData*)phb->diag_data;
 	long rc;
 
-	rc = opal_pci_get_hub_diag_data(phb->hub_id, data, sizeof(*data));
+	rc = opal_pci_get_hub_diag_data(phb->hub_id, stack_pa(data),
+					sizeof(*data));
 	if (rc != OPAL_SUCCESS) {
 		pr_warn("%s: Failed to get HUB#%llx diag-data (%ld)\n",
 			__func__, phb->hub_id, rc);
@@ -1432,7 +1433,9 @@ static int pnv_eeh_next_error(struct eeh_pe **pe)
 			continue;
 
 		rc = opal_pci_next_error(phb->opal_id,
-					 &frozen_pe_no, &err_type, &severity);
+					 stack_pa(&frozen_pe_no),
+					 stack_pa(&err_type),
+					 stack_pa(&severity));
 		if (rc != OPAL_SUCCESS) {
 			pr_devel("%s: Invalid return value on "
 				 "PHB#%x (0x%lx) from opal_pci_next_error",
@@ -1511,7 +1514,8 @@ static int pnv_eeh_next_error(struct eeh_pe **pe)
 
 				/* Dump PHB diag-data */
 				rc = opal_pci_get_phb_diag_data2(phb->opal_id,
-					phb->diag_data, phb->diag_data_size);
+								 stack_pa(phb->diag_data),
+								 phb->diag_data_size);
 				if (rc == OPAL_SUCCESS)
 					pnv_pci_dump_phb_diag_data(hose,
 							phb->diag_data);
diff --git a/arch/powerpc/platforms/powernv/ocxl.c b/arch/powerpc/platforms/powernv/ocxl.c
index 629067781cec..33d5b85df078 100644
--- a/arch/powerpc/platforms/powernv/ocxl.c
+++ b/arch/powerpc/platforms/powernv/ocxl.c
@@ -450,7 +450,8 @@ int pnv_ocxl_spa_setup(struct pci_dev *dev, void *spa_mem, int PE_mask,
 		return -ENOMEM;
 
 	bdfn = (dev->bus->number << 8) | dev->devfn;
-	rc = opal_npu_spa_setup(phb->opal_id, bdfn, virt_to_phys(spa_mem),
+	rc = opal_npu_spa_setup(phb->opal_id, bdfn,
+				(uint64_t)stack_pa(spa_mem),
 				PE_mask);
 	if (rc) {
 		dev_err(&dev->dev, "Can't setup Shared Process Area: %d\n", rc);
diff --git a/arch/powerpc/platforms/powernv/opal-core.c b/arch/powerpc/platforms/powernv/opal-core.c
index bb7657115f1d..6a4a1fd9ec33 100644
--- a/arch/powerpc/platforms/powernv/opal-core.c
+++ b/arch/powerpc/platforms/powernv/opal-core.c
@@ -475,7 +475,7 @@ static void __init opalcore_config_init(void)
 	}
 
 	/* Get OPAL metadata */
-	ret = opal_mpipl_query_tag(OPAL_MPIPL_TAG_OPAL, &addr);
+	ret = opal_mpipl_query_tag(OPAL_MPIPL_TAG_OPAL, stack_pa(&addr));
 	if ((ret != OPAL_SUCCESS) || !addr) {
 		pr_err("Failed to get OPAL metadata (%d)\n", ret);
 		goto error_out;
@@ -486,7 +486,7 @@ static void __init opalcore_config_init(void)
 	opalc_metadata = __va(addr);
 
 	/* Get OPAL CPU metadata */
-	ret = opal_mpipl_query_tag(OPAL_MPIPL_TAG_CPU, &addr);
+	ret = opal_mpipl_query_tag(OPAL_MPIPL_TAG_CPU, stack_pa(&addr));
 	if ((ret != OPAL_SUCCESS) || !addr) {
 		pr_err("Failed to get OPAL CPU metadata (%d)\n", ret);
 		goto error_out;
diff --git a/arch/powerpc/platforms/powernv/opal-dump.c b/arch/powerpc/platforms/powernv/opal-dump.c
index 16c5860f1372..9d48257988bc 100644
--- a/arch/powerpc/platforms/powernv/opal-dump.c
+++ b/arch/powerpc/platforms/powernv/opal-dump.c
@@ -223,9 +223,9 @@ static int64_t dump_read_info(uint32_t *dump_id, uint32_t *dump_size, uint32_t *
 
 	type = cpu_to_be32(0xffffffff);
 
-	rc = opal_dump_info2(&id, &size, &type);
+	rc = opal_dump_info2(stack_pa(&id), stack_pa(&size), stack_pa(&type));
 	if (rc == OPAL_PARAMETER)
-		rc = opal_dump_info(&id, &size);
+		rc = opal_dump_info(stack_pa(&id), stack_pa(&size));
 
 	if (rc) {
 		pr_warn("%s: Failed to get dump info (%d)\n",
@@ -262,7 +262,7 @@ static int64_t dump_read_data(struct dump_obj *dump)
 	}
 
 	/* First entry address */
-	addr = __pa(list);
+	addr = (uint64_t)stack_pa(list);
 
 	/* Fetch data */
 	rc = OPAL_BUSY_EVENT;
diff --git a/arch/powerpc/platforms/powernv/opal-elog.c b/arch/powerpc/platforms/powernv/opal-elog.c
index 554fdd7f88b8..8750d7729e7c 100644
--- a/arch/powerpc/platforms/powernv/opal-elog.c
+++ b/arch/powerpc/platforms/powernv/opal-elog.c
@@ -169,7 +169,7 @@ static ssize_t raw_attr_read(struct file *filep, struct kobject *kobj,
 		if (!elog->buffer)
 			return -EIO;
 
-		opal_rc = opal_read_elog(__pa(elog->buffer),
+		opal_rc = opal_read_elog((uint64_t)stack_pa(elog->buffer),
 					 elog->size, elog->id);
 		if (opal_rc != OPAL_SUCCESS) {
 			pr_err_ratelimited("ELOG: log read failed for log-id=%llx\n",
@@ -212,8 +212,8 @@ static void create_elog_obj(uint64_t id, size_t size, uint64_t type)
 	elog->buffer = kzalloc(elog->size, GFP_KERNEL);
 
 	if (elog->buffer) {
-		rc = opal_read_elog(__pa(elog->buffer),
-					 elog->size, elog->id);
+		rc = opal_read_elog((uint64_t)stack_pa(elog->buffer),
+				    elog->size, elog->id);
 		if (rc != OPAL_SUCCESS) {
 			pr_err("ELOG: log read failed for log-id=%llx\n",
 			       elog->id);
@@ -270,7 +270,9 @@ static irqreturn_t elog_event(int irq, void *data)
 	char name[2+16+1];
 	struct kobject *kobj;
 
-	rc = opal_get_elog_size(&id, &size, &type);
+	rc = opal_get_elog_size(stack_pa(&id),
+				stack_pa(&size),
+				stack_pa(&type));
 	if (rc != OPAL_SUCCESS) {
 		pr_err("ELOG: OPAL log info read failed\n");
 		return IRQ_HANDLED;
diff --git a/arch/powerpc/platforms/powernv/opal-fadump.c b/arch/powerpc/platforms/powernv/opal-fadump.c
index 964f464b1b0e..d4bdf4540c1f 100644
--- a/arch/powerpc/platforms/powernv/opal-fadump.c
+++ b/arch/powerpc/platforms/powernv/opal-fadump.c
@@ -47,7 +47,7 @@ void __init opal_fadump_dt_scan(struct fw_dump *fadump_conf, u64 node)
 	if (!prop)
 		return;
 
-	ret = opal_mpipl_query_tag(OPAL_MPIPL_TAG_KERNEL, &addr);
+	ret = opal_mpipl_query_tag(OPAL_MPIPL_TAG_KERNEL, stack_pa(&addr));
 	if ((ret != OPAL_SUCCESS) || !addr) {
 		pr_debug("Could not get Kernel metadata (%lld)\n", ret);
 		return;
@@ -63,7 +63,7 @@ void __init opal_fadump_dt_scan(struct fw_dump *fadump_conf, u64 node)
 	if (be16_to_cpu(opal_fdm_active->registered_regions) == 0)
 		return;
 
-	ret = opal_mpipl_query_tag(OPAL_MPIPL_TAG_BOOT_MEM, &addr);
+	ret = opal_mpipl_query_tag(OPAL_MPIPL_TAG_BOOT_MEM, stack_pa(&addr));
 	if ((ret != OPAL_SUCCESS) || !addr) {
 		pr_err("Failed to get boot memory tag (%lld)\n", ret);
 		return;
@@ -607,7 +607,7 @@ static void opal_fadump_trigger(struct fadump_crash_info_header *fdh,
 	 */
 	fdh->crashing_cpu = (u32)mfspr(SPRN_PIR);
 
-	rc = opal_cec_reboot2(OPAL_REBOOT_MPIPL, msg);
+	rc = opal_cec_reboot2(OPAL_REBOOT_MPIPL, stack_pa(msg));
 	if (rc == OPAL_UNSUPPORTED) {
 		pr_emerg("Reboot type %d not supported.\n",
 			 OPAL_REBOOT_MPIPL);
@@ -690,7 +690,7 @@ void __init opal_fadump_dt_scan(struct fw_dump *fadump_conf, u64 node)
 	if (!prop)
 		return;
 
-	ret = opal_mpipl_query_tag(OPAL_MPIPL_TAG_KERNEL, &be_addr);
+	ret = opal_mpipl_query_tag(OPAL_MPIPL_TAG_KERNEL, stack_pa(&be_addr));
 	if ((ret != OPAL_SUCCESS) || !be_addr) {
 		pr_err("Failed to get Kernel metadata (%lld)\n", ret);
 		return;
@@ -712,8 +712,8 @@ void __init opal_fadump_dt_scan(struct fw_dump *fadump_conf, u64 node)
 		return;
 	}
 
-	ret = opal_mpipl_query_tag(OPAL_MPIPL_TAG_CPU, &be_addr);
-	if (be_addr) {
+	ret = opal_mpipl_query_tag(OPAL_MPIPL_TAG_CPU, stack_pa(&be_addr));
+	if (addr) {
 		addr = be64_to_cpu(be_addr);
 		pr_debug("CPU metadata addr: %llx\n", addr);
 		opal_cpu_metadata = __va(addr);
diff --git a/arch/powerpc/platforms/powernv/opal-flash.c b/arch/powerpc/platforms/powernv/opal-flash.c
index d5ea04e8e4c5..fb989707ce94 100644
--- a/arch/powerpc/platforms/powernv/opal-flash.c
+++ b/arch/powerpc/platforms/powernv/opal-flash.c
@@ -134,7 +134,8 @@ static inline void opal_flash_validate(void)
 	__be32 size = cpu_to_be32(validate_flash_data.buf_size);
 	__be32 result;
 
-	ret = opal_validate_flash(__pa(buf), &size, &result);
+	ret = opal_validate_flash((uint64_t)stack_pa(buf), stack_pa(&size),
+				  stack_pa(&result));
 
 	validate_flash_data.status = ret;
 	validate_flash_data.buf_size = be32_to_cpu(size);
@@ -290,7 +291,7 @@ static int opal_flash_update(int op)
 		goto invalid_img;
 
 	/* First entry address */
-	addr = __pa(list);
+	addr = (unsigned long)stack_pa(list);
 
 flash:
 	rc = opal_update_flash(addr);
diff --git a/arch/powerpc/platforms/powernv/opal-hmi.c b/arch/powerpc/platforms/powernv/opal-hmi.c
index f0c1830deb51..a7df32dfd090 100644
--- a/arch/powerpc/platforms/powernv/opal-hmi.c
+++ b/arch/powerpc/platforms/powernv/opal-hmi.c
@@ -303,7 +303,8 @@ static void hmi_event_handler(struct work_struct *work)
 
 	if (unrecoverable) {
 		/* Pull all HMI events from OPAL before we panic. */
-		while (opal_get_msg(__pa(&msg), sizeof(msg)) == OPAL_SUCCESS) {
+		while (opal_get_msg((uint64_t)stack_pa(&msg),
+				    sizeof(msg)) == OPAL_SUCCESS) {
 			u32 type;
 
 			type = be32_to_cpu(msg.msg_type);
diff --git a/arch/powerpc/platforms/powernv/opal-irqchip.c b/arch/powerpc/platforms/powernv/opal-irqchip.c
index d55652b5f6fa..0af8e517884c 100644
--- a/arch/powerpc/platforms/powernv/opal-irqchip.c
+++ b/arch/powerpc/platforms/powernv/opal-irqchip.c
@@ -60,7 +60,7 @@ void opal_handle_events(void)
 		cond_resched();
 	}
 	last_outstanding_events = 0;
-	if (opal_poll_events(&events) != OPAL_SUCCESS)
+	if (opal_poll_events(stack_pa(&events)) != OPAL_SUCCESS)
 		return;
 	e = be64_to_cpu(events) & opal_event_irqchip.mask;
 	if (e)
@@ -123,7 +123,7 @@ static irqreturn_t opal_interrupt(int irq, void *data)
 {
 	__be64 events;
 
-	opal_handle_interrupt(virq_to_hw(irq), &events);
+	opal_handle_interrupt(virq_to_hw(irq), stack_pa(&events));
 	last_outstanding_events = be64_to_cpu(events);
 	if (opal_have_pending_events())
 		opal_wake_poller();
diff --git a/arch/powerpc/platforms/powernv/opal-lpc.c b/arch/powerpc/platforms/powernv/opal-lpc.c
index d129d6d45a50..01114ab629dc 100644
--- a/arch/powerpc/platforms/powernv/opal-lpc.c
+++ b/arch/powerpc/platforms/powernv/opal-lpc.c
@@ -28,7 +28,7 @@ static u8 opal_lpc_inb(unsigned long port)
 
 	if (opal_lpc_chip_id < 0 || port > 0xffff)
 		return 0xff;
-	rc = opal_lpc_read(opal_lpc_chip_id, OPAL_LPC_IO, port, &data, 1);
+	rc = opal_lpc_read(opal_lpc_chip_id, OPAL_LPC_IO, port, stack_pa(&data), 1);
 	return rc ? 0xff : be32_to_cpu(data);
 }
 
@@ -41,7 +41,7 @@ static __le16 __opal_lpc_inw(unsigned long port)
 		return 0xffff;
 	if (port & 1)
 		return (__le16)opal_lpc_inb(port) << 8 | opal_lpc_inb(port + 1);
-	rc = opal_lpc_read(opal_lpc_chip_id, OPAL_LPC_IO, port, &data, 2);
+	rc = opal_lpc_read(opal_lpc_chip_id, OPAL_LPC_IO, port, stack_pa(&data), 2);
 	return rc ? 0xffff : be32_to_cpu(data);
 }
 static u16 opal_lpc_inw(unsigned long port)
@@ -61,7 +61,7 @@ static __le32 __opal_lpc_inl(unsigned long port)
 		       (__le32)opal_lpc_inb(port + 1) << 16 |
 		       (__le32)opal_lpc_inb(port + 2) <<  8 |
 			       opal_lpc_inb(port + 3);
-	rc = opal_lpc_read(opal_lpc_chip_id, OPAL_LPC_IO, port, &data, 4);
+	rc = opal_lpc_read(opal_lpc_chip_id, OPAL_LPC_IO, port, stack_pa(&data), 4);
 	return rc ? 0xffffffff : be32_to_cpu(data);
 }
 
@@ -208,7 +208,7 @@ static ssize_t lpc_debug_read(struct file *filp, char __user *ubuf,
 				len = 2;
 		}
 		rc = opal_lpc_read(opal_lpc_chip_id, lpc->lpc_type, pos,
-				   &data, len);
+				   stack_pa(&data), len);
 		if (rc)
 			return -ENXIO;
 
diff --git a/arch/powerpc/platforms/powernv/opal-nvram.c b/arch/powerpc/platforms/powernv/opal-nvram.c
index 380bc2d7ebbf..d92e5070baf2 100644
--- a/arch/powerpc/platforms/powernv/opal-nvram.c
+++ b/arch/powerpc/platforms/powernv/opal-nvram.c
@@ -33,7 +33,7 @@ static ssize_t opal_nvram_read(char *buf, size_t count, loff_t *index)
 	off = *index;
 	if ((off + count) > nvram_size)
 		count = nvram_size - off;
-	rc = opal_read_nvram(__pa(buf), count, off);
+	rc = opal_read_nvram((uint64_t)stack_pa(buf), count, off);
 	if (rc != OPAL_SUCCESS)
 		return -EIO;
 	*index += count;
@@ -56,7 +56,7 @@ static ssize_t opal_nvram_write(char *buf, size_t count, loff_t *index)
 		count = nvram_size - off;
 
 	while (rc == OPAL_BUSY || rc == OPAL_BUSY_EVENT) {
-		rc = opal_write_nvram(__pa(buf), count, off);
+		rc = opal_write_nvram((uint64_t)stack_pa(buf), count, off);
 		if (rc == OPAL_BUSY_EVENT) {
 			if (in_interrupt() || irqs_disabled())
 				mdelay(OPAL_BUSY_DELAY_MS);
diff --git a/arch/powerpc/platforms/powernv/opal-power.c b/arch/powerpc/platforms/powernv/opal-power.c
index db99ffcb7b82..6927bcd3630e 100644
--- a/arch/powerpc/platforms/powernv/opal-power.c
+++ b/arch/powerpc/platforms/powernv/opal-power.c
@@ -31,7 +31,7 @@ static bool detect_epow(void)
 	* to OPAL. OPAL returns EPOW info along with classes present.
 	*/
 	epow_classes = cpu_to_be16(OPAL_SYSEPOW_MAX);
-	rc = opal_get_epow_status(opal_epow_status, &epow_classes);
+	rc = opal_get_epow_status(stack_pa(opal_epow_status), stack_pa(&epow_classes));
 	if (rc != OPAL_SUCCESS) {
 		pr_err("Failed to get EPOW event information\n");
 		return false;
@@ -59,7 +59,7 @@ static bool __init poweroff_pending(void)
 	__be64 opal_dpo_timeout;
 
 	/* Check for DPO event */
-	rc = opal_get_dpo_status(&opal_dpo_timeout);
+	rc = opal_get_dpo_status(stack_pa(&opal_dpo_timeout));
 	if (rc == OPAL_SUCCESS) {
 		pr_info("Existing DPO event detected.\n");
 		return true;
diff --git a/arch/powerpc/platforms/powernv/opal-powercap.c b/arch/powerpc/platforms/powernv/opal-powercap.c
index 7bfe4cbeb35a..63e0e4427aea 100644
--- a/arch/powerpc/platforms/powernv/opal-powercap.c
+++ b/arch/powerpc/platforms/powernv/opal-powercap.c
@@ -46,7 +46,7 @@ static ssize_t powercap_show(struct kobject *kobj, struct kobj_attribute *attr,
 	if (ret)
 		goto out_token;
 
-	ret = opal_get_powercap(pcap_attr->handle, token, (u32 *)__pa(&pcap));
+	ret = opal_get_powercap(pcap_attr->handle, token, (u32 *)stack_pa(&pcap));
 	switch (ret) {
 	case OPAL_ASYNC_COMPLETION:
 		ret = opal_async_wait_response(token, &msg);
diff --git a/arch/powerpc/platforms/powernv/opal-prd.c b/arch/powerpc/platforms/powernv/opal-prd.c
index 113bdb151f68..649e8510ec00 100644
--- a/arch/powerpc/platforms/powernv/opal-prd.c
+++ b/arch/powerpc/platforms/powernv/opal-prd.c
@@ -234,7 +234,7 @@ static ssize_t opal_prd_write(struct file *file, const char __user *buf,
 	if (IS_ERR(msg))
 		return PTR_ERR(msg);
 
-	rc = opal_prd_msg(msg);
+	rc = opal_prd_msg(stack_pa(msg));
 	if (rc) {
 		pr_warn("write: opal_prd_msg returned %d\n", rc);
 		size = -EIO;
@@ -252,7 +252,7 @@ static int opal_prd_release(struct inode *inode, struct file *file)
 	msg.size = cpu_to_be16(sizeof(msg));
 	msg.type = OPAL_PRD_MSG_TYPE_FINI;
 
-	opal_prd_msg((struct opal_prd_msg *)&msg);
+	opal_prd_msg((struct opal_prd_msg *)stack_pa(&msg));
 
 	atomic_xchg(&prd_usage, 0);
 
@@ -281,7 +281,7 @@ static long opal_prd_ioctl(struct file *file, unsigned int cmd,
 			return -EFAULT;
 
 		scom.rc = opal_xscom_read(scom.chip, scom.addr,
-				(__be64 *)&scom.data);
+					  (__be64 *)stack_pa(&scom.data));
 		scom.data = be64_to_cpu(scom.data);
 		pr_devel("ioctl SCOM_READ: chip %llx addr %016llx data %016llx rc %lld\n",
 				scom.chip, scom.addr, scom.data, scom.rc);
diff --git a/arch/powerpc/platforms/powernv/opal-psr.c b/arch/powerpc/platforms/powernv/opal-psr.c
index 6441e17b6996..c37257b1ffe4 100644
--- a/arch/powerpc/platforms/powernv/opal-psr.c
+++ b/arch/powerpc/platforms/powernv/opal-psr.c
@@ -40,7 +40,7 @@ static ssize_t psr_show(struct kobject *kobj, struct kobj_attribute *attr,
 		goto out_token;
 
 	ret = opal_get_power_shift_ratio(psr_attr->handle, token,
-					    (u32 *)__pa(&psr));
+					    (u32 *)stack_pa(&psr));
 	switch (ret) {
 	case OPAL_ASYNC_COMPLETION:
 		ret = opal_async_wait_response(token, &msg);
diff --git a/arch/powerpc/platforms/powernv/opal-rtc.c b/arch/powerpc/platforms/powernv/opal-rtc.c
index a9bcf9217e64..891651455066 100644
--- a/arch/powerpc/platforms/powernv/opal-rtc.c
+++ b/arch/powerpc/platforms/powernv/opal-rtc.c
@@ -43,7 +43,7 @@ time64_t __init opal_get_boot_time(void)
 		return 0;
 
 	while (rc == OPAL_BUSY || rc == OPAL_BUSY_EVENT) {
-		rc = opal_rtc_read(&__y_m_d, &__h_m_s_ms);
+		rc = opal_rtc_read(stack_pa(&__y_m_d), stack_pa(&__h_m_s_ms));
 		if (rc == OPAL_BUSY_EVENT) {
 			mdelay(OPAL_BUSY_DELAY_MS);
 			opal_poll_events(NULL);
diff --git a/arch/powerpc/platforms/powernv/opal-secvar.c b/arch/powerpc/platforms/powernv/opal-secvar.c
index 14133e120bdd..a44df58d565d 100644
--- a/arch/powerpc/platforms/powernv/opal-secvar.c
+++ b/arch/powerpc/platforms/powernv/opal-secvar.c
@@ -64,7 +64,8 @@ static int opal_get_variable(const char *key, uint64_t ksize,
 
 	*dsize = cpu_to_be64(*dsize);
 
-	rc = opal_secvar_get(key, ksize, data, dsize);
+	rc = opal_secvar_get(stack_pa(key), ksize, stack_pa(data),
+			     stack_pa(dsize));
 
 	*dsize = be64_to_cpu(*dsize);
 
@@ -81,7 +82,8 @@ static int opal_get_next_variable(const char *key, uint64_t *keylen,
 
 	*keylen = cpu_to_be64(*keylen);
 
-	rc = opal_secvar_get_next(key, keylen, keybufsize);
+	rc = opal_secvar_get_next(stack_pa(key), stack_pa(keylen),
+				  keybufsize);
 
 	*keylen = be64_to_cpu(*keylen);
 
@@ -96,7 +98,8 @@ static int opal_set_variable(const char *key, uint64_t ksize, u8 *data,
 	if (!key || !data)
 		return -EINVAL;
 
-	rc = opal_secvar_enqueue_update(key, ksize, data, dsize);
+	rc = opal_secvar_enqueue_update(stack_pa(key), ksize, stack_pa(data),
+					dsize);
 
 	return opal_status_to_err(rc);
 }
diff --git a/arch/powerpc/platforms/powernv/opal-sensor.c b/arch/powerpc/platforms/powernv/opal-sensor.c
index 3192c614a1e1..ff5f78bb419b 100644
--- a/arch/powerpc/platforms/powernv/opal-sensor.c
+++ b/arch/powerpc/platforms/powernv/opal-sensor.c
@@ -25,7 +25,7 @@ int opal_get_sensor_data(u32 sensor_hndl, u32 *sensor_data)
 	if (token < 0)
 		return token;
 
-	ret = opal_sensor_read(sensor_hndl, token, &data);
+	ret = opal_sensor_read(sensor_hndl, token, stack_pa(&data));
 	switch (ret) {
 	case OPAL_ASYNC_COMPLETION:
 		ret = opal_async_wait_response(token, &msg);
@@ -78,7 +78,7 @@ int opal_get_sensor_data_u64(u32 sensor_hndl, u64 *sensor_data)
 	if (token < 0)
 		return token;
 
-	ret = opal_sensor_read_u64(sensor_hndl, token, &data);
+	ret = opal_sensor_read_u64(sensor_hndl, token, stack_pa(&data));
 	switch (ret) {
 	case OPAL_ASYNC_COMPLETION:
 		ret = opal_async_wait_response(token, &msg);
diff --git a/arch/powerpc/platforms/powernv/opal-sysparam.c b/arch/powerpc/platforms/powernv/opal-sysparam.c
index a12312afe4ef..3882b31a9e61 100644
--- a/arch/powerpc/platforms/powernv/opal-sysparam.c
+++ b/arch/powerpc/platforms/powernv/opal-sysparam.c
@@ -41,7 +41,7 @@ static ssize_t opal_get_sys_param(u32 param_id, u32 length, void *buffer)
 		goto out;
 	}
 
-	ret = opal_get_param(token, param_id, (u64)buffer, length);
+	ret = opal_get_param(token, param_id, (u64)stack_pa(buffer), length);
 	if (ret != OPAL_ASYNC_COMPLETION) {
 		ret = opal_error_code(ret);
 		goto out_token;
@@ -76,7 +76,7 @@ static int opal_set_sys_param(u32 param_id, u32 length, void *buffer)
 		goto out;
 	}
 
-	ret = opal_set_param(token, param_id, (u64)buffer, length);
+	ret = opal_set_param(token, param_id, (u64)stack_pa(buffer), length);
 
 	if (ret != OPAL_ASYNC_COMPLETION) {
 		ret = opal_error_code(ret);
diff --git a/arch/powerpc/platforms/powernv/opal-xscom.c b/arch/powerpc/platforms/powernv/opal-xscom.c
index 6b4eed2ef4fa..b318e2ef4ba2 100644
--- a/arch/powerpc/platforms/powernv/opal-xscom.c
+++ b/arch/powerpc/platforms/powernv/opal-xscom.c
@@ -58,7 +58,7 @@ static int opal_scom_read(uint32_t chip, uint64_t addr, u64 reg, u64 *value)
 	__be64 v;
 
 	reg = opal_scom_unmangle(addr + reg);
-	rc = opal_xscom_read(chip, reg, (__be64 *)__pa(&v));
+	rc = opal_xscom_read(chip, reg, (__be64 *)stack_pa(&v));
 	if (rc) {
 		*value = 0xfffffffffffffffful;
 		return -EIO;
diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
index cdf3838f08d3..ada336d77e64 100644
--- a/arch/powerpc/platforms/powernv/opal.c
+++ b/arch/powerpc/platforms/powernv/opal.c
@@ -357,7 +357,7 @@ static void opal_handle_message(void)
 	s64 ret;
 	u32 type;
 
-	ret = opal_get_msg(__pa(opal_msg), opal_msg_size);
+	ret = opal_get_msg((uint64_t)stack_pa(opal_msg), opal_msg_size);
 	/* No opal message pending. */
 	if (ret == OPAL_RESOURCE)
 		return;
@@ -431,11 +431,11 @@ int opal_get_chars(uint32_t vtermno, char *buf, int count)
 
 	if (!opal.entry)
 		return -ENODEV;
-	opal_poll_events(&evt);
+	opal_poll_events(stack_pa(&evt));
 	if ((be64_to_cpu(evt) & OPAL_EVENT_CONSOLE_INPUT) == 0)
 		return 0;
 	len = cpu_to_be64(count);
-	rc = opal_console_read(vtermno, &len, buf);
+	rc = opal_console_read(vtermno, stack_pa(&len), stack_pa(buf));
 	if (rc == OPAL_SUCCESS)
 		return be64_to_cpu(len);
 	return 0;
@@ -453,7 +453,7 @@ static int __opal_put_chars(uint32_t vtermno, const char *data, int total_len, b
 
 	if (atomic)
 		spin_lock_irqsave(&opal_write_lock, flags);
-	rc = opal_console_write_buffer_space(vtermno, &olen);
+	rc = opal_console_write_buffer_space(vtermno, stack_pa(&olen));
 	if (rc || be64_to_cpu(olen) < total_len) {
 		/* Closed -> drop characters */
 		if (rc)
@@ -465,7 +465,7 @@ static int __opal_put_chars(uint32_t vtermno, const char *data, int total_len, b
 
 	/* Should not get a partial write here because space is available. */
 	olen = cpu_to_be64(total_len);
-	rc = opal_console_write(vtermno, &olen, data);
+	rc = opal_console_write(vtermno, stack_pa(&olen), stack_pa((void *)data));
 	if (rc == OPAL_BUSY || rc == OPAL_BUSY_EVENT) {
 		if (rc == OPAL_BUSY_EVENT)
 			opal_poll_events(NULL);
@@ -527,7 +527,7 @@ static s64 __opal_flush_console(uint32_t vtermno)
 		 */
 		WARN_ONCE(1, "opal: OPAL_CONSOLE_FLUSH missing.\n");
 
-		opal_poll_events(&evt);
+		opal_poll_events(stack_pa(&evt));
 		if (!(be64_to_cpu(evt) & OPAL_EVENT_CONSOLE_OUTPUT))
 			return OPAL_SUCCESS;
 		return OPAL_BUSY;
@@ -647,7 +647,7 @@ void __noreturn pnv_platform_error_reboot(struct pt_regs *regs, const char *msg)
 	 * Don't bother to shut things down because this will
 	 * xstop the system.
 	 */
-	if (opal_cec_reboot2(OPAL_REBOOT_PLATFORM_ERROR, msg)
+	if (opal_cec_reboot2(OPAL_REBOOT_PLATFORM_ERROR, stack_pa((void *)msg))
 						== OPAL_UNSUPPORTED) {
 		pr_emerg("Reboot type %d not supported for %s\n",
 				OPAL_REBOOT_PLATFORM_ERROR, msg);
@@ -720,7 +720,7 @@ int opal_hmi_exception_early2(struct pt_regs *regs)
 	 * Check 64-bit flag mask to find out if an event was generated,
 	 * and whether TB is still valid or not etc.
 	 */
-	rc = opal_handle_hmi2(&out_flags);
+	rc = opal_handle_hmi2(stack_pa(&out_flags));
 	if (rc != OPAL_SUCCESS)
 		return 0;
 
diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 5c144c05cbfd..4d85e8253f94 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -628,7 +628,8 @@ static int pnv_ioda_get_pe_state(struct pnv_phb *phb, int pe_no)
 
 	/* Check the master PE */
 	rc = opal_pci_eeh_freeze_status(phb->opal_id, pe_no,
-					&state, &pcierr, NULL);
+					stack_pa(&state),
+					stack_pa(&pcierr), NULL);
 	if (rc != OPAL_SUCCESS) {
 		pr_warn("%s: Failure %lld getting "
 			"PHB#%x-PE#%x state\n",
@@ -644,8 +645,8 @@ static int pnv_ioda_get_pe_state(struct pnv_phb *phb, int pe_no)
 	list_for_each_entry(slave, &pe->slaves, list) {
 		rc = opal_pci_eeh_freeze_status(phb->opal_id,
 						slave->pe_number,
-						&fstate,
-						&pcierr,
+						stack_pa(&fstate),
+						stack_pa(&pcierr),
 						NULL);
 		if (rc != OPAL_SUCCESS) {
 			pr_warn("%s: Failure %lld getting "
@@ -2061,7 +2062,7 @@ static int __pnv_pci_ioda_msi_setup(struct pnv_phb *phb, struct pci_dev *dev,
 		__be64 addr64;
 
 		rc = opal_get_msi_64(phb->opal_id, pe->mve_number, xive_num, 1,
-				     &addr64, &data);
+				     stack_pa(&addr64), stack_pa(&data));
 		if (rc) {
 			pr_warn("%s: OPAL error %d getting 64-bit MSI data\n",
 				pci_name(dev), rc);
@@ -2073,7 +2074,7 @@ static int __pnv_pci_ioda_msi_setup(struct pnv_phb *phb, struct pci_dev *dev,
 		__be32 addr32;
 
 		rc = opal_get_msi_32(phb->opal_id, pe->mve_number, xive_num, 1,
-				     &addr32, &data);
+				     stack_pa(&addr32), stack_pa(&data));
 		if (rc) {
 			pr_warn("%s: OPAL error %d getting 32-bit MSI data\n",
 				pci_name(dev), rc);
@@ -2415,7 +2416,8 @@ static int pnv_pci_diag_data_set(void *data, u64 val)
 	s64 ret;
 
 	/* Retrieve the diag data from firmware */
-	ret = opal_pci_get_phb_diag_data2(phb->opal_id, phb->diag_data,
+	ret = opal_pci_get_phb_diag_data2(phb->opal_id,
+					  stack_pa(phb->diag_data),
 					  phb->diag_data_size);
 	if (ret != OPAL_SUCCESS)
 		return -EIO;
diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
index 233a50e65fce..0c21b5aa24f5 100644
--- a/arch/powerpc/platforms/powernv/pci.c
+++ b/arch/powerpc/platforms/powernv/pci.c
@@ -84,7 +84,7 @@ int pnv_pci_get_device_tree(uint32_t phandle, void *buf, uint64_t len)
 	if (!opal_check_token(OPAL_GET_DEVICE_TREE))
 		return -ENXIO;
 
-	rc = opal_get_device_tree(phandle, (uint64_t)buf, len);
+	rc = opal_get_device_tree(phandle, (uint64_t)stack_pa(buf), len);
 	if (rc < OPAL_SUCCESS)
 		return -EIO;
 
@@ -99,7 +99,7 @@ int pnv_pci_get_presence_state(uint64_t id, uint8_t *state)
 	if (!opal_check_token(OPAL_PCI_GET_PRESENCE_STATE))
 		return -ENXIO;
 
-	rc = opal_pci_get_presence_state(id, (uint64_t)state);
+	rc = opal_pci_get_presence_state(id, (uint64_t)stack_pa(state));
 	if (rc != OPAL_SUCCESS)
 		return -EIO;
 
@@ -114,7 +114,7 @@ int pnv_pci_get_power_state(uint64_t id, uint8_t *state)
 	if (!opal_check_token(OPAL_PCI_GET_POWER_STATE))
 		return -ENXIO;
 
-	rc = opal_pci_get_power_state(id, (uint64_t)state);
+	rc = opal_pci_get_power_state(id, (uint64_t)stack_pa(state));
 	if (rc != OPAL_SUCCESS)
 		return -EIO;
 
@@ -135,7 +135,7 @@ int pnv_pci_set_power_state(uint64_t id, uint8_t state, struct opal_msg *msg)
 	if (unlikely(token < 0))
 		return token;
 
-	rc = opal_pci_set_power_state(token, id, (uint64_t)&state);
+	rc = opal_pci_set_power_state(token, id, (uint64_t)stack_pa(&state));
 	if (rc == OPAL_SUCCESS) {
 		ret = 0;
 		goto exit;
@@ -493,7 +493,8 @@ static void pnv_pci_handle_eeh_config(struct pnv_phb *phb, u32 pe_no)
 	spin_lock_irqsave(&phb->lock, flags);
 
 	/* Fetch PHB diag-data */
-	rc = opal_pci_get_phb_diag_data2(phb->opal_id, phb->diag_data,
+	rc = opal_pci_get_phb_diag_data2(phb->opal_id,
+					 stack_pa(phb->diag_data),
 					 phb->diag_data_size);
 	has_diag = (rc == OPAL_SUCCESS);
 
@@ -554,8 +555,8 @@ static void pnv_pci_config_check_eeh(struct pci_dn *pdn)
 	} else {
 		rc = opal_pci_eeh_freeze_status(phb->opal_id,
 						pe_no,
-						&fstate,
-						&pcierr,
+						stack_pa(&fstate),
+						stack_pa(&pcierr),
 						NULL);
 		if (rc) {
 			pr_warn("%s: Failure %lld getting PHB#%x-PE#%x state\n",
@@ -592,20 +593,22 @@ int pnv_pci_cfg_read(struct pci_dn *pdn,
 	switch (size) {
 	case 1: {
 		u8 v8;
-		rc = opal_pci_config_read_byte(phb->opal_id, bdfn, where, &v8);
+		rc = opal_pci_config_read_byte(phb->opal_id, bdfn, where,
+					       stack_pa(&v8));
 		*val = (rc == OPAL_SUCCESS) ? v8 : 0xff;
 		break;
 	}
 	case 2: {
 		__be16 v16;
 		rc = opal_pci_config_read_half_word(phb->opal_id, bdfn, where,
-						   &v16);
+						    stack_pa(&v16));
 		*val = (rc == OPAL_SUCCESS) ? be16_to_cpu(v16) : 0xffff;
 		break;
 	}
 	case 4: {
 		__be32 v32;
-		rc = opal_pci_config_read_word(phb->opal_id, bdfn, where, &v32);
+		rc = opal_pci_config_read_word(phb->opal_id, bdfn, where,
+					       stack_pa(&v32));
 		*val = (rc == OPAL_SUCCESS) ? be32_to_cpu(v32) : 0xffffffff;
 		break;
 	}
@@ -765,7 +768,7 @@ int pnv_pci_set_tunnel_bar(struct pci_dev *dev, u64 addr, int enable)
 		return -ENXIO;
 
 	mutex_lock(&tunnel_mutex);
-	rc = opal_pci_get_pbcq_tunnel_bar(phb->opal_id, &val);
+	rc = opal_pci_get_pbcq_tunnel_bar(phb->opal_id, stack_pa(&val));
 	if (rc != OPAL_SUCCESS) {
 		rc = -EIO;
 		goto out;
diff --git a/arch/powerpc/platforms/powernv/setup.c b/arch/powerpc/platforms/powernv/setup.c
index 61ab2d38ff4b..aae6ad04c65f 100644
--- a/arch/powerpc/platforms/powernv/setup.c
+++ b/arch/powerpc/platforms/powernv/setup.c
@@ -407,7 +407,7 @@ static void pnv_kexec_wait_secondaries_down(void)
 
 		for (;;) {
 			rc = opal_query_cpu_status(get_hard_smp_processor_id(i),
-						   &status);
+						   stack_pa(&status));
 			if (rc != OPAL_SUCCESS || status != OPAL_THREAD_STARTED)
 				break;
 			barrier();
diff --git a/arch/powerpc/platforms/powernv/smp.c b/arch/powerpc/platforms/powernv/smp.c
index 9e1a25398f98..2f70e0bf9873 100644
--- a/arch/powerpc/platforms/powernv/smp.c
+++ b/arch/powerpc/platforms/powernv/smp.c
@@ -86,7 +86,7 @@ static int pnv_smp_kick_cpu(int nr)
 	 * first time. OPAL v3 allows us to query OPAL to know if it
 	 * has the CPUs, so we do that
 	 */
-	rc = opal_query_cpu_status(pcpu, &status);
+	rc = opal_query_cpu_status(pcpu, stack_pa(&status));
 	if (rc != OPAL_SUCCESS) {
 		pr_warn("OPAL Error %ld querying CPU %d state\n", rc, nr);
 		return -ENODEV;
diff --git a/arch/powerpc/sysdev/xics/icp-opal.c b/arch/powerpc/sysdev/xics/icp-opal.c
index 4dae624b9f2f..a79b98349a1e 100644
--- a/arch/powerpc/sysdev/xics/icp-opal.c
+++ b/arch/powerpc/sysdev/xics/icp-opal.c
@@ -53,7 +53,7 @@ static unsigned int icp_opal_get_xirr(void)
 		return kvm_xirr;
 
 	/* Then ask OPAL */
-	rc = opal_int_get_xirr(&hw_xirr, false);
+	rc = opal_int_get_xirr(stack_pa(&hw_xirr), false);
 	if (rc < 0)
 		return 0;
 	return be32_to_cpu(hw_xirr);
diff --git a/arch/powerpc/sysdev/xics/ics-opal.c b/arch/powerpc/sysdev/xics/ics-opal.c
index 6cfbb4fac7fb..5bf54470b35d 100644
--- a/arch/powerpc/sysdev/xics/ics-opal.c
+++ b/arch/powerpc/sysdev/xics/ics-opal.c
@@ -105,7 +105,7 @@ static int ics_opal_set_affinity(struct irq_data *d,
 	if (hw_irq == XICS_IPI || hw_irq == XICS_IRQ_SPURIOUS)
 		return -1;
 
-	rc = opal_get_xive(hw_irq, &oserver, &priority);
+	rc = opal_get_xive(hw_irq, stack_pa(&oserver), stack_pa(&priority));
 	if (rc != OPAL_SUCCESS) {
 		pr_err("%s: opal_get_xive(irq=%d [hw 0x%x]) error %lld\n",
 		       __func__, d->irq, hw_irq, rc);
@@ -160,7 +160,7 @@ static int ics_opal_check(struct ics *ics, unsigned int hw_irq)
 		return -EINVAL;
 
 	/* Check if HAL knows about this interrupt */
-	rc = opal_get_xive(hw_irq, &server, &priority);
+	rc = opal_get_xive(hw_irq, stack_pa(&server), stack_pa(&priority));
 	if (rc != OPAL_SUCCESS)
 		return -ENXIO;
 
@@ -174,7 +174,7 @@ static void ics_opal_mask_unknown(struct ics *ics, unsigned long vec)
 	int8_t priority;
 
 	/* Check if HAL knows about this interrupt */
-	rc = opal_get_xive(vec, &server, &priority);
+	rc = opal_get_xive(vec, stack_pa(&server), stack_pa(&priority));
 	if (rc != OPAL_SUCCESS)
 		return;
 
@@ -188,7 +188,7 @@ static long ics_opal_get_server(struct ics *ics, unsigned long vec)
 	int8_t priority;
 
 	/* Check if HAL knows about this interrupt */
-	rc = opal_get_xive(vec, &server, &priority);
+	rc = opal_get_xive(vec, stack_pa(&server), stack_pa(&priority));
 	if (rc != OPAL_SUCCESS)
 		return -1;
 	return ics_opal_unmangle_server(be16_to_cpu(server));
diff --git a/arch/powerpc/sysdev/xive/native.c b/arch/powerpc/sysdev/xive/native.c
index 3925825954bc..a2082ee866ca 100644
--- a/arch/powerpc/sysdev/xive/native.c
+++ b/arch/powerpc/sysdev/xive/native.c
@@ -52,8 +52,11 @@ int xive_native_populate_irq_data(u32 hw_irq, struct xive_irq_data *data)
 
 	memset(data, 0, sizeof(*data));
 
-	rc = opal_xive_get_irq_info(hw_irq, &flags, &eoi_page, &trig_page,
-				    &esb_shift, &src_chip);
+	rc = opal_xive_get_irq_info(hw_irq, stack_pa(&flags),
+				    stack_pa(&eoi_page),
+				    stack_pa(&trig_page),
+				    stack_pa(&esb_shift),
+				    stack_pa(&src_chip));
 	if (rc) {
 		pr_err("opal_xive_get_irq_info(0x%x) returned %lld\n",
 		       hw_irq, rc);
@@ -117,7 +120,8 @@ static int xive_native_get_irq_config(u32 hw_irq, u32 *target, u8 *prio,
 	__be64 vp;
 	__be32 lirq;
 
-	rc = opal_xive_get_irq_config(hw_irq, &vp, prio, &lirq);
+	rc = opal_xive_get_irq_config(hw_irq, stack_pa(&vp), stack_pa(prio),
+				      stack_pa(&lirq));
 
 	*target = be64_to_cpu(vp);
 	*sw_irq = be32_to_cpu(lirq);
@@ -150,8 +154,8 @@ int xive_native_configure_queue(u32 vp_id, struct xive_q *q, u8 prio,
 	q->toggle = 0;
 
 	rc = opal_xive_get_queue_info(vp_id, prio, NULL, NULL,
-				      &qeoi_page_be,
-				      &esc_irq_be,
+				      stack_pa(&qeoi_page_be),
+				      stack_pa(&esc_irq_be),
 				      NULL);
 	if (rc) {
 		vp_err(vp_id, "Failed to get queue %d info : %lld\n", prio, rc);
@@ -416,7 +420,8 @@ static void xive_native_setup_cpu(unsigned int cpu, struct xive_cpu *xc)
 	}
 
 	/* Grab it's CAM value */
-	rc = opal_xive_get_vp_info(vp, NULL, &vp_cam_be, NULL, NULL);
+	rc = opal_xive_get_vp_info(vp, NULL, stack_pa(&vp_cam_be), NULL,
+				   NULL);
 	if (rc) {
 		pr_err("Failed to get pool VP info CPU %d\n", cpu);
 		return;
@@ -756,7 +761,8 @@ int xive_native_get_vp_info(u32 vp_id, u32 *out_cam_id, u32 *out_chip_id)
 	__be32 vp_chip_id_be;
 	s64 rc;
 
-	rc = opal_xive_get_vp_info(vp_id, NULL, &vp_cam_be, NULL, &vp_chip_id_be);
+	rc = opal_xive_get_vp_info(vp_id, NULL, stack_pa(&vp_cam_be), NULL,
+				   stack_pa(&vp_chip_id_be));
 	if (rc) {
 		vp_err(vp_id, "Failed to get VP info : %lld\n", rc);
 		return -EIO;
@@ -794,8 +800,11 @@ int xive_native_get_queue_info(u32 vp_id, u32 prio,
 	__be64 qflags;
 	s64 rc;
 
-	rc = opal_xive_get_queue_info(vp_id, prio, &qpage, &qsize,
-				      &qeoi_page, &escalate_irq, &qflags);
+	rc = opal_xive_get_queue_info(vp_id, prio, stack_pa(&qpage),
+				      stack_pa(&qsize),
+				      stack_pa(&qeoi_page),
+				      stack_pa(&escalate_irq),
+				      stack_pa(&qflags));
 	if (rc) {
 		vp_err(vp_id, "failed to get queue %d info : %lld\n", prio, rc);
 		return -EIO;
@@ -822,8 +831,8 @@ int xive_native_get_queue_state(u32 vp_id, u32 prio, u32 *qtoggle, u32 *qindex)
 	__be32 opal_qindex;
 	s64 rc;
 
-	rc = opal_xive_get_queue_state(vp_id, prio, &opal_qtoggle,
-				       &opal_qindex);
+	rc = opal_xive_get_queue_state(vp_id, prio, stack_pa(&opal_qtoggle),
+				       stack_pa(&opal_qindex));
 	if (rc) {
 		vp_err(vp_id, "failed to get queue %d state : %lld\n", prio, rc);
 		return -EIO;
@@ -864,7 +873,7 @@ int xive_native_get_vp_state(u32 vp_id, u64 *out_state)
 	__be64 state;
 	s64 rc;
 
-	rc = opal_xive_get_vp_state(vp_id, &state);
+	rc = opal_xive_get_vp_state(vp_id, stack_pa(&state));
 	if (rc) {
 		vp_err(vp_id, "failed to get vp state : %lld\n", rc);
 		return -EIO;
diff --git a/drivers/char/ipmi/ipmi_powernv.c b/drivers/char/ipmi/ipmi_powernv.c
index da22a8cbe68e..55032e205e8e 100644
--- a/drivers/char/ipmi/ipmi_powernv.c
+++ b/drivers/char/ipmi/ipmi_powernv.c
@@ -91,7 +91,7 @@ static void ipmi_powernv_send(void *send_info, struct ipmi_smi_msg *msg)
 
 	pr_devel("%s: opal_ipmi_send(0x%llx, %p, %ld)\n", __func__,
 			smi->interface_id, opal_msg, size);
-	rc = opal_ipmi_send(smi->interface_id, opal_msg, size);
+	rc = opal_ipmi_send(smi->interface_id, stack_pa(opal_msg), size);
 	pr_devel("%s:  -> %d\n", __func__, rc);
 
 	if (!rc) {
@@ -132,8 +132,8 @@ static int ipmi_powernv_recv(struct ipmi_smi_powernv *smi)
 	size = cpu_to_be64(sizeof(*opal_msg) + IPMI_MAX_MSG_LENGTH);
 
 	rc = opal_ipmi_recv(smi->interface_id,
-			opal_msg,
-			&size);
+			    stack_pa(opal_msg),
+			    stack_pa(&size));
 	size = be64_to_cpu(size);
 	pr_devel("%s:   -> %d (size %lld)\n", __func__,
 			rc, rc == 0 ? size : 0);
diff --git a/drivers/char/powernv-op-panel.c b/drivers/char/powernv-op-panel.c
index 3c99696b145e..10588093e2e2 100644
--- a/drivers/char/powernv-op-panel.c
+++ b/drivers/char/powernv-op-panel.c
@@ -60,7 +60,7 @@ static int __op_panel_update_display(void)
 		return token;
 	}
 
-	rc = opal_write_oppanel_async(token, oppanel_lines, num_lines);
+	rc = opal_write_oppanel_async(token, stack_pa(oppanel_lines), num_lines);
 	switch (rc) {
 	case OPAL_ASYNC_COMPLETION:
 		rc = opal_async_wait_response(token, &msg);
diff --git a/drivers/i2c/busses/i2c-opal.c b/drivers/i2c/busses/i2c-opal.c
index 9f773b4f5ed8..d1d1fb3a55ba 100644
--- a/drivers/i2c/busses/i2c-opal.c
+++ b/drivers/i2c/busses/i2c-opal.c
@@ -49,7 +49,7 @@ static int i2c_opal_send_request(u32 bus_id, struct opal_i2c_request *req)
 		return token;
 	}
 
-	rc = opal_i2c_request(token, bus_id, req);
+	rc = opal_i2c_request(token, bus_id, stack_pa(req));
 	if (rc != OPAL_ASYNC_COMPLETION) {
 		rc = i2c_opal_translate_error(rc);
 		goto exit;
diff --git a/drivers/leds/leds-powernv.c b/drivers/leds/leds-powernv.c
index 743e2cdd0891..b65bfdf6fa18 100644
--- a/drivers/leds/leds-powernv.c
+++ b/drivers/leds/leds-powernv.c
@@ -99,7 +99,7 @@ static int powernv_led_set(struct powernv_led_data *powernv_led,
 	}
 
 	rc = opal_leds_set_ind(token, powernv_led->loc_code,
-			       led_mask, led_value, &max_type);
+			       led_mask, led_value, stack_pa(&max_type));
 	if (rc != OPAL_ASYNC_COMPLETION) {
 		dev_err(dev, "%s: OPAL set LED call failed for %s [rc=%d]\n",
 			__func__, powernv_led->loc_code, rc);
@@ -142,7 +142,9 @@ static enum led_brightness powernv_led_get(struct powernv_led_data *powernv_led)
 	max_type = powernv_led_common->max_led_type;
 
 	rc = opal_leds_get_ind(powernv_led->loc_code,
-			       &mask, &value, &max_type);
+			       stack_pa(&mask),
+			       stack_pa(&value),
+			       stack_pa(&max_type));
 	if (rc != OPAL_SUCCESS && rc != OPAL_PARTIAL) {
 		dev_err(dev, "%s: OPAL get led call failed [rc=%d]\n",
 			__func__, rc);
diff --git a/drivers/mtd/devices/powernv_flash.c b/drivers/mtd/devices/powernv_flash.c
index 36e060386e59..a2d0e61d0afe 100644
--- a/drivers/mtd/devices/powernv_flash.c
+++ b/drivers/mtd/devices/powernv_flash.c
@@ -66,10 +66,10 @@ static int powernv_flash_async_op(struct mtd_info *mtd, enum flash_op op,
 
 	switch (op) {
 	case FLASH_OP_READ:
-		rc = opal_flash_read(info->id, offset, __pa(buf), len, token);
+		rc = opal_flash_read(info->id, offset, (uint64_t)stack_pa(buf), len, token);
 		break;
 	case FLASH_OP_WRITE:
-		rc = opal_flash_write(info->id, offset, __pa(buf), len, token);
+		rc = opal_flash_write(info->id, offset, (uint64_t)stack_pa(buf), len, token);
 		break;
 	case FLASH_OP_ERASE:
 		rc = opal_flash_erase(info->id, offset, len, token);
diff --git a/drivers/rtc/rtc-opal.c b/drivers/rtc/rtc-opal.c
index ad41aaf8a17f..9e627fb7115a 100644
--- a/drivers/rtc/rtc-opal.c
+++ b/drivers/rtc/rtc-opal.c
@@ -53,7 +53,7 @@ static int opal_get_rtc_time(struct device *dev, struct rtc_time *tm)
 	__be64 __h_m_s_ms;
 
 	while (rc == OPAL_BUSY || rc == OPAL_BUSY_EVENT) {
-		rc = opal_rtc_read(&__y_m_d, &__h_m_s_ms);
+		rc = opal_rtc_read(stack_pa(&__y_m_d), stack_pa(&__h_m_s_ms));
 		if (rc == OPAL_BUSY_EVENT) {
 			msleep(OPAL_BUSY_DELAY_MS);
 			opal_poll_events(NULL);
@@ -127,7 +127,7 @@ static int opal_get_tpo_time(struct device *dev, struct rtc_wkalrm *alarm)
 		return token;
 	}
 
-	rc = opal_tpo_read(token, &__y_m_d, &__h_m);
+	rc = opal_tpo_read(token, stack_pa(&__y_m_d), stack_pa(&__h_m));
 	if (rc != OPAL_ASYNC_COMPLETION) {
 		rc = -EIO;
 		goto exit;
-- 
2.38.1

