Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7E34E56CD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Mar 2022 17:47:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KNvQW57m7z30NR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Mar 2022 03:46:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SY/xtDpB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=SY/xtDpB; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KNvPr4WFjz2xVn
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Mar 2022 03:46:24 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22NGJKn4025581; 
 Wed, 23 Mar 2022 16:46:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=dk8FCBmyhr8d985yyeKRz5mOH1J1N/kLnhzi+JyPdqY=;
 b=SY/xtDpBnRJSCQYFpJSmAclxShPml7RXzuBeXS0AdfvxdMKMX0eOMQum+Yauu/mv/zFB
 8cEY9WkQEQMvowA21iRIE9iOgbcx3CaTOwc3Wxe9xOOE1CcmDM1APb0LpwLxoofid+Lh
 fnZlvS7/IoFPASLFZux3IffjXxuF110yiPsvW7dpW9GsKwE2C58JzMuLp2o3zp14jhK4
 wcsPK2Gv7LAoWcRjsQ3lm5uXeuC6hAYOMup+B7bXKpYW6GbfPIHc3gLd//cMtTKEB+G+
 ofk4/16a8etldw52NkJefhpcLvDxj0x2AJdSc9UiMRWMO0v2ajTrVs55f/BqE82CguJs CQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f06yfgkhq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Mar 2022 16:46:10 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22NGjMu9013945;
 Wed, 23 Mar 2022 16:46:08 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3ew6t910s2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Mar 2022 16:46:08 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 22NGk99O42402122
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Mar 2022 16:46:09 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B8AE4C04E;
 Wed, 23 Mar 2022 16:46:05 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D9FA4C044;
 Wed, 23 Mar 2022 16:46:00 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.30.161]) by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 23 Mar 2022 16:45:59 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, nvdimm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, peterz@infradead.org,
 dan.j.williams@intel.com, ira.weiny@intel.com, vishal.l.verma@intel.com
Subject: [v2 PATCH 1/2] drivers/nvdimm: Fix build failure when
 CONFIG_PERF_EVENTS is not set
Date: Wed, 23 Mar 2022 22:15:49 +0530
Message-Id: <20220323164550.109768-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8nMy5r5dcVttaXPpbYzX4-wTgJQ3aAPo
X-Proofpoint-ORIG-GUID: 8nMy5r5dcVttaXPpbYzX4-wTgJQ3aAPo
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-23_07,2022-03-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 impostorscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203230087
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
Cc: santosh@fossix.org, maddy@linux.ibm.com, kernel test robot <lkp@intel.com>,
 rnsastry@linux.ibm.com, aneesh.kumar@linux.ibm.com,
 atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, vaibhav@linux.ibm.com,
 tglx@linutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The following build failure occurs when CONFIG_PERF_EVENTS is not set
as generic pmu functions are not visible in that scenario.

|-- s390-randconfig-r044-20220313
|   |-- nd_perf.c:(.text):undefined-reference-to-perf_pmu_migrate_context
|   |-- nd_perf.c:(.text):undefined-reference-to-perf_pmu_register
|   `-- nd_perf.c:(.text):undefined-reference-to-perf_pmu_unregister

Similar build failure in nds32 architecture:
nd_perf.c:(.text+0x21e): undefined reference to `perf_pmu_migrate_context'
nd_perf.c:(.text+0x434): undefined reference to `perf_pmu_register'
nd_perf.c:(.text+0x57c): undefined reference to `perf_pmu_unregister'

Fix this issue by adding check for CONFIG_PERF_EVENTS config option
and disabling the nvdimm perf interface incase this config is not set.

Also remove function declaration of perf_pmu_migrate_context,
perf_pmu_register, perf_pmu_unregister functions from nd.h as these are
common pmu functions which are part of perf_event.h and since we
are disabling nvdimm perf interface incase CONFIG_PERF_EVENTS option
is not set, we not need to declare them in nd.h

Also move the platform_device header file addition part from nd.h to
nd_perf.c and add stub functions for register_nvdimm_pmu and
unregister_nvdimm_pmu functions to handle CONFIG_PERF_EVENTS=n
case.

Fixes: 0fab1ba6ad6b ("drivers/nvdimm: Add perf interface to expose
nvdimm performance stats") (Commit id based on libnvdimm-for-next tree)
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
Link: https://lore.kernel.org/all/62317124.YBQFU33+s%2FwdvWGj%25lkp@intel.com/
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/nvdimm/Makefile  |  2 +-
 drivers/nvdimm/nd_perf.c |  1 +
 include/linux/nd.h       | 16 ++++++++++++----
 3 files changed, 14 insertions(+), 5 deletions(-)

---
Changelog:

v1 -> v2
- Rebase and tested the fix patch changes on top of libnvdimm-for-next branch

- Add stub functions for register_nvdimm_pmu and unregister_nvdimm_pmu
  functions to handle CONFIG_PERF_EVENTS=n case as suggested by Dan Williams

- Move the platform_device header file addition part from nd.h to
  nd_perf.c and just forward declare struct platform_device in nd.h
---

diff --git a/drivers/nvdimm/Makefile b/drivers/nvdimm/Makefile
index 3fb806748716..ba0296dca9db 100644
--- a/drivers/nvdimm/Makefile
+++ b/drivers/nvdimm/Makefile
@@ -15,7 +15,7 @@ nd_e820-y := e820.o
 libnvdimm-y := core.o
 libnvdimm-y += bus.o
 libnvdimm-y += dimm_devs.o
-libnvdimm-y += nd_perf.o
+libnvdimm-$(CONFIG_PERF_EVENTS) += nd_perf.o
 libnvdimm-y += dimm.o
 libnvdimm-y += region_devs.o
 libnvdimm-y += region.o
diff --git a/drivers/nvdimm/nd_perf.c b/drivers/nvdimm/nd_perf.c
index 314415894acf..433bbb68ae64 100644
--- a/drivers/nvdimm/nd_perf.c
+++ b/drivers/nvdimm/nd_perf.c
@@ -10,6 +10,7 @@
 #define pr_fmt(fmt) "nvdimm_pmu: " fmt
 
 #include <linux/nd.h>
+#include <linux/platform_device.h>
 
 #define EVENT(_name, _code)     enum{_name = _code}
 
diff --git a/include/linux/nd.h b/include/linux/nd.h
index 7b2ccbdc1cbc..f3e91c891cbc 100644
--- a/include/linux/nd.h
+++ b/include/linux/nd.h
@@ -9,7 +9,6 @@
 #include <linux/device.h>
 #include <linux/badblocks.h>
 #include <linux/perf_event.h>
-#include <linux/platform_device.h>
 
 enum nvdimm_event {
 	NVDIMM_REVALIDATE_POISON,
@@ -57,15 +56,24 @@ struct nvdimm_pmu {
 	struct cpumask arch_cpumask;
 };
 
+struct platform_device;
+
+#ifdef CONFIG_PERF_EVENTS
 extern ssize_t nvdimm_events_sysfs_show(struct device *dev,
 					struct device_attribute *attr,
 					char *page);
 
 int register_nvdimm_pmu(struct nvdimm_pmu *nvdimm, struct platform_device *pdev);
 void unregister_nvdimm_pmu(struct nvdimm_pmu *nd_pmu);
-void perf_pmu_migrate_context(struct pmu *pmu, int src_cpu, int dst_cpu);
-int perf_pmu_register(struct pmu *pmu, const char *name, int type);
-void perf_pmu_unregister(struct pmu *pmu);
+
+#else
+static inline int register_nvdimm_pmu(struct nvdimm_pmu *nvdimm, struct platform_device *pdev)
+{
+	return -ENXIO;
+}
+
+static inline void unregister_nvdimm_pmu(struct nvdimm_pmu *nd_pmu) { }
+#endif
 
 struct nd_device_driver {
 	struct device_driver drv;
-- 
2.31.1

