Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16397411631
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Sep 2021 15:58:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HCmNR6gcbz3c8l
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Sep 2021 23:57:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ew48S+Sk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Ew48S+Sk; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HCmKH20Fzz2yNL
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Sep 2021 23:55:14 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18KDdcER018101; 
 Mon, 20 Sep 2021 09:55:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=IS7qAeG5PohuTTJo6v+2B4kXBmU0kECYCO0uiPGypUk=;
 b=Ew48S+SkqBw+SQJGrOmVjx76u0ZA3PWSx2yorlf98T7gSrACucnsG1KaDadx5MkjJ2Qo
 jAB6ktsoYmpo1Pmd4vVuoZgAQtKzVc6l+Isn8MQ0Agqrc7HzE/vAcSOzk5wGpKSRyMxw
 Tq/ABK/alj3iVC38VjIzXfNbXM+9EYZAcOqiYb0Ei7XR933X8fTNSqsxZVRLsbm30NA+
 nXQF/0GDKJVCAbM1Bn3x8mYRcnjXjWi3PiImX0oAqizUMKsM1AnzBTvuCgdYRQdSjBNG
 x2DZUrYObtH+qjukicxUQwGZgQd3pBWmJJrOnOwOezccQlUE1OfMUuXMHWXS+qFADx1Y IA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3b5wa190na-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Sep 2021 09:55:10 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18KDltac009229;
 Mon, 20 Sep 2021 09:55:10 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3b5wa190mw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Sep 2021 09:55:09 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18KDq6K5023167;
 Mon, 20 Sep 2021 13:55:09 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02dal.us.ibm.com with ESMTP id 3b57r9ydvj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Sep 2021 13:55:09 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18KDt7Zf26214848
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Sep 2021 13:55:07 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 838126E065;
 Mon, 20 Sep 2021 13:55:07 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 684C46E050;
 Mon, 20 Sep 2021 13:55:07 +0000 (GMT)
Received: from localhost (unknown [9.211.63.177])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 20 Sep 2021 13:55:07 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/3] powerpc/pseries/cpuhp: delete add/remove_by_count code
Date: Mon, 20 Sep 2021 08:55:04 -0500
Message-Id: <20210920135504.1792219-4-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210920135504.1792219-1-nathanl@linux.ibm.com>
References: <20210920135504.1792219-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tRNUFTwRXf_GuDybJEuuh776PdjqZceu
X-Proofpoint-GUID: jHE_UOj6rOm6tJ3t8mRncTq0zjH5ld9Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-20_07,2021-09-20_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 mlxscore=0 phishscore=0 spamscore=0 impostorscore=0
 malwarescore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109030001 definitions=main-2109200086
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
Cc: tyreld@linux.ibm.com, ldufour@linux.ibm.com, aneesh.kumar@linux.ibm.com,
 danielhb413@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The core DLPAR code supports two actions (add and remove) and three
subtypes of action:

* By DRC index: the action is attempted on a single specified resource.
  This is the usual case for processors.
* By indexed count: the action is attempted on a range of resources
  beginning at the specified index. This is implemented only by the memory
  DLPAR code.
* By count: the lower layer (CPU or memory) is responsible for locating the
  specified number of resources to which the action can be applied.

I cannot find any evidence of the "by count" subtype being used by drmgr or
qemu for processors. And when I try to exercise this code, the add case
does not work:

  $ ppc64_cpu --smt ; nproc
  SMT=8
  24
  $ printf "cpu remove count 2" > /sys/kernel/dlpar
  $ nproc
  8
  $ printf "cpu add count 2" > /sys/kernel/dlpar
  -bash: printf: write error: Invalid argument
  $ dmesg | tail -2
  pseries-hotplug-cpu: Failed to find enough CPUs (1 of 2) to add
  dlpar: Could not handle DLPAR request "cpu add count 2"
  $ nproc
  8
  $ drmgr -c cpu -a -q 2         # this uses the by-index method
  Validating CPU DLPAR capability...yes.
  CPU 1
  CPU 17
  $ nproc
  24

This is because find_drc_info_cpus_to_add() does not increment drc_index
appropriately during its search.

This is not hard to fix. But the _by_count() functions also have the
property that they attempt to roll back all prior operations if the entire
request cannot be satisfied, even though the rollback itself can encounter
errors. It's not possible to provide transaction-like behavior at this
level, and it's undesirable to have code that can only pretend to do that.
Any users of these functions cannot know what the state of the system is in
the error case. And the error paths are, to my knowledge, impossible to
test without adding custom error injection code.

Summary:

* This code has not worked reliably since its introduction.
* There is no evidence that it is used.
* It contains questionable rollback behaviors in error paths which are
  difficult to test.

So let's remove it.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
Fixes: ac71380071d1 ("powerpc/pseries: Add CPU dlpar remove functionality")
Fixes: 90edf184b9b7 ("powerpc/pseries: Add CPU dlpar add functionality")
Fixes: b015f6bc9547 ("powerpc/pseries: Add cpu DLPAR support for drc-info property")
---
 arch/powerpc/platforms/pseries/hotplug-cpu.c | 218 +------------------
 1 file changed, 2 insertions(+), 216 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
index 87a0fbe9cf12..768997261ce8 100644
--- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
+++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
@@ -741,216 +741,6 @@ static int dlpar_cpu_remove_by_index(u32 drc_index)
 	return rc;
 }
 
-static int find_dlpar_cpus_to_remove(u32 *cpu_drcs, int cpus_to_remove)
-{
-	struct device_node *dn;
-	int cpus_found = 0;
-	int rc;
-
-	/* We want to find cpus_to_remove + 1 CPUs to ensure we do not
-	 * remove the last CPU.
-	 */
-	for_each_node_by_type(dn, "cpu") {
-		cpus_found++;
-
-		if (cpus_found > cpus_to_remove) {
-			of_node_put(dn);
-			break;
-		}
-
-		/* Note that cpus_found is always 1 ahead of the index
-		 * into the cpu_drcs array, so we use cpus_found - 1
-		 */
-		rc = of_property_read_u32(dn, "ibm,my-drc-index",
-					  &cpu_drcs[cpus_found - 1]);
-		if (rc) {
-			pr_warn("Error occurred getting drc-index for %pOFn\n",
-				dn);
-			of_node_put(dn);
-			return -1;
-		}
-	}
-
-	if (cpus_found < cpus_to_remove) {
-		pr_warn("Failed to find enough CPUs (%d of %d) to remove\n",
-			cpus_found, cpus_to_remove);
-	} else if (cpus_found == cpus_to_remove) {
-		pr_warn("Cannot remove all CPUs\n");
-	}
-
-	return cpus_found;
-}
-
-static int dlpar_cpu_remove_by_count(u32 cpus_to_remove)
-{
-	u32 *cpu_drcs;
-	int cpus_found;
-	int cpus_removed = 0;
-	int i, rc;
-
-	pr_debug("Attempting to hot-remove %d CPUs\n", cpus_to_remove);
-
-	cpu_drcs = kcalloc(cpus_to_remove, sizeof(*cpu_drcs), GFP_KERNEL);
-	if (!cpu_drcs)
-		return -EINVAL;
-
-	cpus_found = find_dlpar_cpus_to_remove(cpu_drcs, cpus_to_remove);
-	if (cpus_found <= cpus_to_remove) {
-		kfree(cpu_drcs);
-		return -EINVAL;
-	}
-
-	for (i = 0; i < cpus_to_remove; i++) {
-		rc = dlpar_cpu_remove_by_index(cpu_drcs[i]);
-		if (rc)
-			break;
-
-		cpus_removed++;
-	}
-
-	if (cpus_removed != cpus_to_remove) {
-		pr_warn("CPU hot-remove failed, adding back removed CPUs\n");
-
-		for (i = 0; i < cpus_removed; i++)
-			dlpar_cpu_add(cpu_drcs[i]);
-
-		rc = -EINVAL;
-	} else {
-		rc = 0;
-	}
-
-	kfree(cpu_drcs);
-	return rc;
-}
-
-static int find_drc_info_cpus_to_add(struct device_node *cpus,
-				     struct property *info,
-				     u32 *cpu_drcs, u32 cpus_to_add)
-{
-	struct of_drc_info drc;
-	const __be32 *value;
-	u32 count, drc_index;
-	int cpus_found = 0;
-	int i, j;
-
-	if (!info)
-		return -1;
-
-	value = of_prop_next_u32(info, NULL, &count);
-	if (value)
-		value++;
-
-	for (i = 0; i < count; i++) {
-		of_read_drc_info_cell(&info, &value, &drc);
-		if (strncmp(drc.drc_type, "CPU", 3))
-			break;
-
-		drc_index = drc.drc_index_start;
-		for (j = 0; j < drc.num_sequential_elems; j++) {
-			if (dlpar_cpu_exists(cpus, drc_index))
-				continue;
-
-			cpu_drcs[cpus_found++] = drc_index;
-
-			if (cpus_found == cpus_to_add)
-				return cpus_found;
-
-			drc_index += drc.sequential_inc;
-		}
-	}
-
-	return cpus_found;
-}
-
-static int find_drc_index_cpus_to_add(struct device_node *cpus,
-				      u32 *cpu_drcs, u32 cpus_to_add)
-{
-	int cpus_found = 0;
-	int index, rc;
-	u32 drc_index;
-
-	/* Search the ibm,drc-indexes array for possible CPU drcs to
-	 * add. Note that the format of the ibm,drc-indexes array is
-	 * the number of entries in the array followed by the array
-	 * of drc values so we start looking at index = 1.
-	 */
-	index = 1;
-	while (cpus_found < cpus_to_add) {
-		rc = of_property_read_u32_index(cpus, "ibm,drc-indexes",
-						index++, &drc_index);
-
-		if (rc)
-			break;
-
-		if (dlpar_cpu_exists(cpus, drc_index))
-			continue;
-
-		cpu_drcs[cpus_found++] = drc_index;
-	}
-
-	return cpus_found;
-}
-
-static int dlpar_cpu_add_by_count(u32 cpus_to_add)
-{
-	struct device_node *parent;
-	struct property *info;
-	u32 *cpu_drcs;
-	int cpus_added = 0;
-	int cpus_found;
-	int i, rc;
-
-	pr_debug("Attempting to hot-add %d CPUs\n", cpus_to_add);
-
-	cpu_drcs = kcalloc(cpus_to_add, sizeof(*cpu_drcs), GFP_KERNEL);
-	if (!cpu_drcs)
-		return -EINVAL;
-
-	parent = of_find_node_by_path("/cpus");
-	if (!parent) {
-		pr_warn("Could not find CPU root node in device tree\n");
-		kfree(cpu_drcs);
-		return -1;
-	}
-
-	info = of_find_property(parent, "ibm,drc-info", NULL);
-	if (info)
-		cpus_found = find_drc_info_cpus_to_add(parent, info, cpu_drcs, cpus_to_add);
-	else
-		cpus_found = find_drc_index_cpus_to_add(parent, cpu_drcs, cpus_to_add);
-
-	of_node_put(parent);
-
-	if (cpus_found < cpus_to_add) {
-		pr_warn("Failed to find enough CPUs (%d of %d) to add\n",
-			cpus_found, cpus_to_add);
-		kfree(cpu_drcs);
-		return -EINVAL;
-	}
-
-	for (i = 0; i < cpus_to_add; i++) {
-		rc = dlpar_cpu_add(cpu_drcs[i]);
-		if (rc)
-			break;
-
-		cpus_added++;
-	}
-
-	if (cpus_added < cpus_to_add) {
-		pr_warn("CPU hot-add failed, removing any added CPUs\n");
-
-		for (i = 0; i < cpus_added; i++)
-			dlpar_cpu_remove_by_index(cpu_drcs[i]);
-
-		rc = -EINVAL;
-	} else {
-		rc = 0;
-	}
-
-	kfree(cpu_drcs);
-	return rc;
-}
-
 int dlpar_cpu(struct pseries_hp_errorlog *hp_elog)
 {
 	u32 count, drc_index;
@@ -963,9 +753,7 @@ int dlpar_cpu(struct pseries_hp_errorlog *hp_elog)
 
 	switch (hp_elog->action) {
 	case PSERIES_HP_ELOG_ACTION_REMOVE:
-		if (hp_elog->id_type == PSERIES_HP_ELOG_ID_DRC_COUNT)
-			rc = dlpar_cpu_remove_by_count(count);
-		else if (hp_elog->id_type == PSERIES_HP_ELOG_ID_DRC_INDEX) {
+		if (hp_elog->id_type == PSERIES_HP_ELOG_ID_DRC_INDEX) {
 			rc = dlpar_cpu_remove_by_index(drc_index);
 			/*
 			 * Setting the isolation state of an UNISOLATED/CONFIGURED
@@ -979,9 +767,7 @@ int dlpar_cpu(struct pseries_hp_errorlog *hp_elog)
 			rc = -EINVAL;
 		break;
 	case PSERIES_HP_ELOG_ACTION_ADD:
-		if (hp_elog->id_type == PSERIES_HP_ELOG_ID_DRC_COUNT)
-			rc = dlpar_cpu_add_by_count(count);
-		else if (hp_elog->id_type == PSERIES_HP_ELOG_ID_DRC_INDEX)
+		if (hp_elog->id_type == PSERIES_HP_ELOG_ID_DRC_INDEX)
 			rc = dlpar_cpu_add(drc_index);
 		else
 			rc = -EINVAL;
-- 
2.31.1

