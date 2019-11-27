Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B379210AB19
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 08:22:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47NC0M2b5kzDqkh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 18:22:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=anju@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47NBy95XflzDqHF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 18:20:45 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xAR7HVkT089860
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 02:20:42 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2whcxpw2kw-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 02:20:42 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <anju@linux.vnet.ibm.com>;
 Wed, 27 Nov 2019 07:20:41 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 27 Nov 2019 07:20:40 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAR7KdPI41549902
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Nov 2019 07:20:39 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 463FEA4054;
 Wed, 27 Nov 2019 07:20:39 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 27875A4060;
 Wed, 27 Nov 2019 07:20:38 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.102.94])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 27 Nov 2019 07:20:37 +0000 (GMT)
From: Anju T Sudhakar <anju@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v3] platforms/powernv: Avoid re-registration of imc debugfs
 directory
Date: Wed, 27 Nov 2019 12:50:35 +0530
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19112707-0012-0000-0000-0000036CCFCE
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19112707-0013-0000-0000-000021A87795
Message-Id: <20191127072035.4283-1-anju@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-27_01:2019-11-27,2019-11-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 impostorscore=0 clxscore=1011 adultscore=0 suspectscore=3
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911270059
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
Cc: nasastry@in.ibm.com, anju@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

export_imc_mode_and_cmd() function which creates the debugfs interface for
imc-mode and imc-command, is invoked when each nest pmu units is
registered.
When the first nest pmu unit is registered, export_imc_mode_and_cmd()
creates 'imc' directory under `/debug/powerpc/`. In the subsequent
invocations debugfs_create_dir() function returns, since the directory
already exists.

The recent commit <c33d442328f55> (debugfs: make error message a bit more
verbose), throws a warning if we try to invoke `debugfs_create_dir()`
with an already existing directory name.

Address this warning by making the debugfs directory registration
in the opal_imc_counters_probe() function, i.e invoke
export_imc_mode_and_cmd() function from the probe function.

Signed-off-by: Anju T Sudhakar <anju@linux.vnet.ibm.com>
---
Changes from v2 -> v3:

* Invoke export_imc_mode_and_cmd(), which does the imc debugfs
  directory registration and deletion, from the probe fucntion.
* Change the return type of imc_pmu_create() to get the
  control block address for nest units in the probe
  function
* Remove unnecessary comments

---
 arch/powerpc/platforms/powernv/opal-imc.c | 39 +++++++++++++------------------
 1 file changed, 16 insertions(+), 23 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal-imc.c b/arch/powerpc/platforms/powernv/opal-imc.c
index e04b206..3b4518f 100644
--- a/arch/powerpc/platforms/powernv/opal-imc.c
+++ b/arch/powerpc/platforms/powernv/opal-imc.c
@@ -59,10 +59,6 @@ static void export_imc_mode_and_cmd(struct device_node *node,
 
 	imc_debugfs_parent = debugfs_create_dir("imc", powerpc_debugfs_root);
 
-	/*
-	 * Return here, either because 'imc' directory already exists,
-	 * Or failed to create a new one.
-	 */
 	if (!imc_debugfs_parent)
 		return;
 
@@ -135,7 +131,6 @@ static int imc_get_mem_addr_nest(struct device_node *node,
 	}
 
 	pmu_ptr->imc_counter_mmaped = true;
-	export_imc_mode_and_cmd(node, pmu_ptr);
 	kfree(base_addr_arr);
 	kfree(chipid_arr);
 	return 0;
@@ -151,7 +146,7 @@ static int imc_get_mem_addr_nest(struct device_node *node,
  *		    and domain as the inputs.
  * Allocates memory for the struct imc_pmu, sets up its domain, size and offsets
  */
-static int imc_pmu_create(struct device_node *parent, int pmu_index, int domain)
+static struct imc_pmu *imc_pmu_create(struct device_node *parent, int pmu_index, int domain)
 {
 	int ret = 0;
 	struct imc_pmu *pmu_ptr;
@@ -159,27 +154,23 @@ static int imc_pmu_create(struct device_node *parent, int pmu_index, int domain)
 
 	/* Return for unknown domain */
 	if (domain < 0)
-		return -EINVAL;
+		return NULL;
 
 	/* memory for pmu */
 	pmu_ptr = kzalloc(sizeof(*pmu_ptr), GFP_KERNEL);
 	if (!pmu_ptr)
-		return -ENOMEM;
+		return NULL;
 
 	/* Set the domain */
 	pmu_ptr->domain = domain;
 
 	ret = of_property_read_u32(parent, "size", &pmu_ptr->counter_mem_size);
-	if (ret) {
-		ret = -EINVAL;
+	if (ret)
 		goto free_pmu;
-	}
 
 	if (!of_property_read_u32(parent, "offset", &offset)) {
-		if (imc_get_mem_addr_nest(parent, pmu_ptr, offset)) {
-			ret = -EINVAL;
+		if (imc_get_mem_addr_nest(parent, pmu_ptr, offset))
 			goto free_pmu;
-		}
 	}
 
 	/* Function to register IMC pmu */
@@ -190,14 +181,14 @@ static int imc_pmu_create(struct device_node *parent, int pmu_index, int domain)
 		if (pmu_ptr->domain == IMC_DOMAIN_NEST)
 			kfree(pmu_ptr->mem_info);
 		kfree(pmu_ptr);
-		return ret;
+		return NULL;
 	}
 
-	return 0;
+	return pmu_ptr;
 
 free_pmu:
 	kfree(pmu_ptr);
-	return ret;
+	return NULL;
 }
 
 static void disable_nest_pmu_counters(void)
@@ -254,6 +245,7 @@ int get_max_nest_dev(void)
 static int opal_imc_counters_probe(struct platform_device *pdev)
 {
 	struct device_node *imc_dev = pdev->dev.of_node;
+	struct imc_pmu *pmu;
 	int pmu_count = 0, domain;
 	bool core_imc_reg = false, thread_imc_reg = false;
 	u32 type;
@@ -269,6 +261,7 @@ static int opal_imc_counters_probe(struct platform_device *pdev)
 	}
 
 	for_each_compatible_node(imc_dev, NULL, IMC_DTB_UNIT_COMPAT) {
+		pmu = NULL;
 		if (of_property_read_u32(imc_dev, "type", &type)) {
 			pr_warn("IMC Device without type property\n");
 			continue;
@@ -293,9 +286,13 @@ static int opal_imc_counters_probe(struct platform_device *pdev)
 			break;
 		}
 
-		if (!imc_pmu_create(imc_dev, pmu_count, domain)) {
-			if (domain == IMC_DOMAIN_NEST)
+		pmu = imc_pmu_create(imc_dev, pmu_count, domain);
+		if (pmu != NULL) {
+			if (domain == IMC_DOMAIN_NEST) {
+				if (!imc_debugfs_parent)
+					export_imc_mode_and_cmd(imc_dev, pmu);
 				pmu_count++;
+			}
 			if (domain == IMC_DOMAIN_CORE)
 				core_imc_reg = true;
 			if (domain == IMC_DOMAIN_THREAD)
@@ -303,10 +300,6 @@ static int opal_imc_counters_probe(struct platform_device *pdev)
 		}
 	}
 
-	/* If none of the nest units are registered, remove debugfs interface */
-	if (pmu_count == 0)
-		debugfs_remove_recursive(imc_debugfs_parent);
-
 	/* If core imc is not registered, unregister thread-imc */
 	if (!core_imc_reg && thread_imc_reg)
 		unregister_thread_imc();
-- 
1.8.3.1

