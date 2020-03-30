Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE3D197B01
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 13:42:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rVv23zT4zDqZR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 22:42:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rVpt3vXczDq6K
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 22:39:01 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02UBX1bg118717
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 07:38:59 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3022qfys1q-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 07:38:59 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <atrajeev@linux.vnet.ibm.com>;
 Mon, 30 Mar 2020 12:38:47 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 30 Mar 2020 12:38:44 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 02UBcshG46334284
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Mar 2020 11:38:54 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3577D4C04A;
 Mon, 30 Mar 2020 11:38:54 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 61F604C044;
 Mon, 30 Mar 2020 11:38:53 +0000 (GMT)
Received: from localhost.localdomain.localdomain (unknown [9.199.38.61])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 30 Mar 2020 11:38:53 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/perf: Add documentation around use of
 "ppc_set_pmu_inuse" in PMU core-book3s
Date: Mon, 30 Mar 2020 07:38:52 -0400
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 20033011-4275-0000-0000-000003B633DF
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20033011-4276-0000-0000-000038CB7FB0
Message-Id: <1585568332-11934-1-git-send-email-atrajeev@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-30_01:2020-03-27,
 2020-03-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=999 mlxscore=0 phishscore=0 suspectscore=1
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003300110
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
Cc: maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"pmcregs_in_use" flag is part of lppaca (Virtual Process Area),
which is used to indicate whether Performance Monitoring Unit (PMU) and
PMU sprs are in-use and whether should it be saved/restored by
hypervisor. ppc_set_pmu_inuse() is used to set/unset the VPA
flag "pmcregs_in_use". "pmcregs_in_use" flag is set in
"power_pmu_enable" via ppc_set_pmu_inuse(1) and it is unset
when there are no active events (n_events == 0 condition).

Patch here adds documentation on the ppc_set_pmu_inuse() usage.

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 arch/powerpc/perf/core-book3s.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 3086055..48bfdc9 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -1285,6 +1285,11 @@ static void power_pmu_enable(struct pmu *pmu)
 		goto out;
 
 	if (cpuhw->n_events == 0) {
+		/*
+		 * Indicate PMU not in-use to Hypervisor.
+		 * We end-up here via "ctx_sched_out()" from common code and
+		 * "power_pmu_del()".
+		 */
 		ppc_set_pmu_inuse(0);
 		goto out;
 	}
@@ -1341,6 +1346,11 @@ static void power_pmu_enable(struct pmu *pmu)
 	 * Write the new configuration to MMCR* with the freeze
 	 * bit set and set the hardware events to their initial values.
 	 * Then unfreeze the events.
+	 * ppc_set_pmu_inuse(1): "power_pmu_enable" will unset the
+	 * "pmcregs_in_use" flag when a previous profiling/sampling session
+	 * is completed and un-setting of flag will notify the Hypervisor to
+	 * drop save/restore of PMU sprs. Now that PMU need to be enabled, first
+	 * set the "pmcregs_in_use" flag in VPA.
 	 */
 	ppc_set_pmu_inuse(1);
 	mtspr(SPRN_MMCRA, cpuhw->mmcr[2] & ~MMCRA_SAMPLE_ENABLE);
-- 
1.8.3.1

