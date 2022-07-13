Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17ED3573A8B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jul 2022 17:50:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LjhsX6p6Rz3dvP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jul 2022 01:50:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RVWla6H1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RVWla6H1;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ljhpg6K2nz3bwr
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jul 2022 01:47:55 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26DFiOdo029351;
	Wed, 13 Jul 2022 15:47:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=JtKwEmpnzjtAWixLZG3p75w/fSMVduVmKn+32o3EkJM=;
 b=RVWla6H1ULfV47ZniOsUGQqMubwoTkpj+aJZmX8zkjtEqLrZbRUrp5hIp47X2ojC5K6U
 owgUjiyT9cK0+GDUHcjbIr/zWi0sVVOfe+J/3fBM4nrbAKDtyme6LFJ+pr1Vtpx6xnfF
 q1g6UHDkrop3AgMO/fCBCoVjmm0n5AVuTqVo/U0GdYDtCgH5c7o3zjyHA/Ao3oDRcdk1
 vqcLBbdR+S9Wc00Rrgq/tjtvBewYIkRx6V1UpyTaJzQw1Hz8wI1fWKd1jOOjwWRdPuJB
 pS8ASW4OJzraBe7tZDtxCvoT2qVoidM4G7k/gdorZ4eeI+4wUfOicpyNqQ4wUNKmZeij Tg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ha0xxr2fd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Jul 2022 15:47:38 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26DFjH24031176;
	Wed, 13 Jul 2022 15:47:38 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ha0xxr2ee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Jul 2022 15:47:38 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26DFOCsV008894;
	Wed, 13 Jul 2022 15:47:36 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma03ams.nl.ibm.com with ESMTP id 3h71a8wvgf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Jul 2022 15:47:36 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26DFk1IM23134598
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 13 Jul 2022 15:46:01 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1C522AE04D;
	Wed, 13 Jul 2022 15:47:33 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9D8EFAE051;
	Wed, 13 Jul 2022 15:47:32 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.2.121])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 13 Jul 2022 15:47:32 +0000 (GMT)
From: Laurent Dufour <ldufour@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        wim@linux-watchdog.org, linux@roeck-us.net, nathanl@linux.ibm.com,
        rdunlap@infradead.org
Subject: [PATCH v5 4/4] pseries/mobility: set NMI watchdog factor during an LPM
Date: Wed, 13 Jul 2022 17:47:29 +0200
Message-Id: <20220713154729.80789-5-ldufour@linux.ibm.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220713154729.80789-1-ldufour@linux.ibm.com>
References: <20220713154729.80789-1-ldufour@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: lUDFZl9W97dLVwAsA3N4FbmcqFn696ut
X-Proofpoint-GUID: 2sMueNNtOCs5vLxNWpibAijQkb12eMh6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-13_05,2022-07-13_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207130063
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
Cc: hch@infradead.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, haren@linux.vnet.ibm.com, linux-watchdog@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

During an LPM, while the memory transfer is in progress on the arrival
side, some latencies are generated when accessing not yet transferred pages
on the arrival side. Thus, the NMI watchdog may be triggered too
frequently, which increases the risk to hit an NMI interrupt in a bad place
in the kernel, leading to a kernel panic.

Disabling the Hard Lockup Watchdog until the memory transfer could be a too
strong work around, some users would want this timeout to be eventually
triggered if the system is hanging even during an LPM.

Introduce a new sysctl variable nmi_watchdog_factor. It allows to apply a
factor to the NMI watchdog timeout during an LPM. Just before the CPUs are
stopped for the switchover sequence, the NMI watchdog timer is set to
watchdog_thresh + factor%

A value of 0 has no effect. The default value is 200, meaning that the NMI
watchdog is set to 30s during LPM (based on a 10s watchdog_thresh value).
Once the memory transfer is achieved, the factor is reset to 0.

Setting this value to a high number is like disabling the NMI watchdog
during an LPM.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
---
 Documentation/admin-guide/sysctl/kernel.rst | 12 ++++++
 arch/powerpc/platforms/pseries/mobility.c   | 43 +++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index ddccd1077462..d73faa619c15 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -592,6 +592,18 @@ to the guest kernel command line (see
 Documentation/admin-guide/kernel-parameters.rst).
 
 
+nmi_wd_lpm_factor (PPC only)
+============================
+
+Factor apply to the NMI watchdog timeout (only when ``nmi_watchdog`` is
+set to 1). This factor represents the percentage added to
+``watchdog_thresh`` when calculating the NMI watchdog timeout during an
+LPM. The soft lockup timeout is not impacted.
+
+A value of 0 means no change. The default value is 200 meaning the NMI
+watchdog is set to 30s (based on ``watchdog_thresh`` equal to 10).
+
+
 numa_balancing
 ==============
 
diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index 6297467072e6..3d36a8955eaf 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -48,6 +48,39 @@ struct update_props_workarea {
 #define MIGRATION_SCOPE	(1)
 #define PRRN_SCOPE -2
 
+#ifdef CONFIG_PPC_WATCHDOG
+static unsigned int nmi_wd_lpm_factor = 200;
+
+#ifdef CONFIG_SYSCTL
+static struct ctl_table nmi_wd_lpm_factor_ctl_table[] = {
+	{
+		.procname	= "nmi_wd_lpm_factor",
+		.data		= &nmi_wd_lpm_factor,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= proc_douintvec_minmax,
+	},
+	{}
+};
+static struct ctl_table nmi_wd_lpm_factor_sysctl_root[] = {
+	{
+		.procname       = "kernel",
+		.mode           = 0555,
+		.child          = nmi_wd_lpm_factor_ctl_table,
+	},
+	{}
+};
+
+static int __init register_nmi_wd_lpm_factor_sysctl(void)
+{
+	register_sysctl_table(nmi_wd_lpm_factor_sysctl_root);
+
+	return 0;
+}
+device_initcall(register_nmi_wd_lpm_factor_sysctl);
+#endif /* CONFIG_SYSCTL */
+#endif /* CONFIG_PPC_WATCHDOG */
+
 static int mobility_rtas_call(int token, char *buf, s32 scope)
 {
 	int rc;
@@ -702,13 +735,20 @@ static int pseries_suspend(u64 handle)
 static int pseries_migrate_partition(u64 handle)
 {
 	int ret;
+	unsigned int factor = 0;
 
+#ifdef CONFIG_PPC_WATCHDOG
+	factor = nmi_wd_lpm_factor;
+#endif
 	ret = wait_for_vasi_session_suspending(handle);
 	if (ret)
 		return ret;
 
 	vas_migration_handler(VAS_SUSPEND);
 
+	if (factor)
+		watchdog_nmi_set_timeout_pct(factor);
+
 	ret = pseries_suspend(handle);
 	if (ret == 0) {
 		post_mobility_fixup();
@@ -722,6 +762,9 @@ static int pseries_migrate_partition(u64 handle)
 	} else
 		pseries_cancel_migration(handle, ret);
 
+	if (factor)
+		watchdog_nmi_set_timeout_pct(0);
+
 	vas_migration_handler(VAS_RESUME);
 
 	return ret;
-- 
2.37.0

