Return-Path: <linuxppc-dev+bounces-14361-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 878A7C6E90C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 13:47:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBLnp3wXyz3fHc;
	Wed, 19 Nov 2025 23:46:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763556382;
	cv=none; b=U3boLwRPoIhAaOGvemj3s1MtZAH0ARVG5EKcopLsEO4hqCTWiPfg4x30Lxn0L7y/kc9eoAd9+uH8kr0KwMfBSYJZ7hyyl3TV5/433g/aGxbXqFUD9uMBCchNMuDilFPJ5dHoFQqOG+sYgTOjGFgS+hb9SacO+7OcXr4b5ArWkuL89abnglhO1ZJWvU84UKnqmkb8dEjLWW8omRBJqZv248rpQycBXXRuqIvF613FxrF991XnYhjQeI+jpva4/Vvt1kTg8C9Fp7iOldYq58wAAH7vDbUFQwQI7nxQVbxdPohCC6paO2oR3bmaa9niahNhDFen/0epY4AzgQAsgaxwDw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763556382; c=relaxed/relaxed;
	bh=k1P52ymW6kaxc9FumUth9OoQ2+0WOk7K41d6063xHqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BntHH81zTP3taxEATnIx2AllcomxhuFSCtI9/dPI3epyZC0A7PggjLD2njHtEV0akopvU4Kp13S22PynGhWH/Yid9QK+zJWjMLnnZC33p/AktpfRBhwa5/MM+9TXNhQZtBlg6h6saSaM879kW3V4//hRpuG429FErGBe6aKwMLdXK+VghHM2JjO5NBXmrN6YKK6cECt2m58IBN+e4+Av5e3d+2nxXjFCLW3cyoymeYhF5yOH+aMqC8QgyCSAXdUe/FadnbIwEIdvj+mKgQtzrJvC1P/1cq+H9WJV/K/0BEqCD1g9PfWchgM9/sKcQspZHtlkOljtdfwKot4SICDJ/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kNvnXNzN; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kNvnXNzN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBLnn5L3Tz3fDj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 23:46:21 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ89VUN026824;
	Wed, 19 Nov 2025 12:46:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=k1P52ymW6kaxc9Fum
	Uth9OoQ2+0WOk7K41d6063xHqU=; b=kNvnXNzNvvrGOAdxi1CcGVS+fBY5w/PU+
	gIZufITYZkSXxCjP2Ol40CExf6RcXt4+ZA1995LR5SibG1ZKtG5CMgZCVZKzFMtj
	0em9LWcODd9b6WtKX8Eh2bc3kGBZderUEGHHytAr0adw7oasZ+c1DBBm0DSK6uuO
	+lttuA5iE01r70qjk+d+WWYUTuNdgOdSgS8psKgkx6jUBGPqmiiX32N0/zK10wPi
	3T1s3TNigg2l2e9+ySs9IosT8C78tzc5K4y7GC5PNTqwajhWyvkLMPE1qjZhqljv
	PJ89vi1S2O70BrZOClz98jaa2EsR4Wu0IAfUQSjxsZuxG7PAPFz+A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejka0d22-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:46:02 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AJCWDfM027897;
	Wed, 19 Nov 2025 12:46:01 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejka0d1v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:46:01 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJB3Atb030851;
	Wed, 19 Nov 2025 12:46:00 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4af47y0rr9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:46:00 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AJCjuRf56951058
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Nov 2025 12:45:56 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4D96420043;
	Wed, 19 Nov 2025 12:45:56 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 422DF20040;
	Wed, 19 Nov 2025 12:45:52 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.25.220])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Nov 2025 12:45:52 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org, tglx@linutronix.de,
        yury.norov@gmail.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
        gregkh@linuxfoundation.org, pbonzini@redhat.com, seanjc@google.com,
        kprateek.nayak@amd.com, vschneid@redhat.com, iii@linux.ibm.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH 13/17] powerpc: enable/disable paravirt CPUs based on steal time
Date: Wed, 19 Nov 2025 18:14:45 +0530
Message-ID: <20251119124449.1149616-14-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251119124449.1149616-1-sshegde@linux.ibm.com>
References: <20251119124449.1149616-1-sshegde@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MizLiqhS08QOdJAksgIXv1X_4BEsEoh6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX78MeoHp8dtkB
 L9J9hugshqdbYLG8cu8rPW3IID+mH4xwF1GrepvXxm7dnPEtaasmmiTlFyqH9MUqO4IOJpdHs97
 m1ovNQi4yd3/hLpDyJGqubAsg5ZS/MUwHlU3A3pltYWxQkdJQ1Uahf2Pe8MY+A42o/scmWJK+oh
 qgDb6Q/GwIkKjXHwBYcm6zmd1Gg8xlrNoHzEqQ0VxTBq8Nc/gXu+ZoI0lfTcoGVyQEj762PQ8cp
 Wn9wZEOBOx6k6G5N4s3Iipw057IeVXdPSeY83MhWUhhtWEvrt+wNY5euOQjp//rnSPbiIJ0yfnC
 FPZ/VxcntsmOMjhzHCAq7oIrTXeaQKmG41cNplsejUusohZcx4HJVhMEEQcrM9d0eqdsE14axdK
 SjqQvt/U9GqkNvkljsMQcvGhqu109w==
X-Proofpoint-ORIG-GUID: AQgkYdCtibiJzz9AEQYjshn9oa5s2sQ7
X-Authority-Analysis: v=2.4 cv=XtL3+FF9 c=1 sm=1 tr=0 ts=691dbc0a cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=xVd_9023M5FCHxFdF00A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

available_cores - Number of cores LPAR(VM) can use at this moment.
remaining cores will have CPUs marked as paravirt.

This follow stepwise approach for reducing/increasing the number of
available_cores.

Very simple Logic.
	if (steal_time > high_threshold)
		available_cores--
	if (steal_time < low_threshould)
		available_cores++

It also check previous direction taken to avoid un-necessary ping-pongs.

Note: It works well only when CPUs are spread out equal numbered across
NUMA nodes.

Originally-by: Srikar Dronamraju <srikar@linux.ibm.com>
Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/lpar.c    | 53 ++++++++++++++++++++++++
 arch/powerpc/platforms/pseries/pseries.h |  1 +
 2 files changed, 54 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 935fced6e127..825b5b4e2b43 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -43,6 +43,7 @@
 #include <asm/fadump.h>
 #include <asm/dtl.h>
 #include <asm/vphn.h>
+#include <linux/sched/isolation.h>
 
 #include "pseries.h"
 
@@ -2056,6 +2057,58 @@ void pseries_init_ec_vp_cores(void)
 	/* Initialize the available cores to all VP initially */
 	available_cores = max(entitled_cores, virtual_procs);
 }
+
+#define STEAL_RATIO_HIGH 400
+#define STEAL_RATIO_LOW  150
+
+void update_soft_entitlement(unsigned long steal_ratio)
+{
+	static int prev_direction;
+	int cpu;
+
+	if  (!entitled_cores)
+		return;
+
+	if (steal_ratio >= STEAL_RATIO_HIGH && prev_direction > 0) {
+		/*
+		 * System entitlement was reduced earlier but we continue to
+		 * see steal time. Reduce entitlement further.
+		 */
+		if (available_cores == entitled_cores)
+			return;
+
+		/* Mark them paravirt, enable tick if it is nohz_full */
+		for (cpu = (available_cores - 1) * threads_per_core;
+		     cpu < available_cores * threads_per_core; cpu++) {
+			set_cpu_paravirt(cpu, true);
+			if (tick_nohz_full_cpu(cpu))
+				tick_nohz_dep_set_cpu(cpu, TICK_DEP_BIT_SCHED);
+		}
+		available_cores--;
+
+	} else if (steal_ratio <= STEAL_RATIO_LOW && prev_direction < 0) {
+		/*
+		 * System entitlement was increased but we continue to see
+		 * less steal time. Increase entitlement further.
+		 */
+		if (available_cores == virtual_procs)
+			return;
+
+		/* mark them avaialble */
+		for (cpu = available_cores * threads_per_core;
+		     cpu < (available_cores + 1) * threads_per_core; cpu++)
+			set_cpu_paravirt(cpu, false);
+
+		available_cores++;
+	}
+	if (steal_ratio >= STEAL_RATIO_HIGH)
+		prev_direction = 1;
+	else if (steal_ratio <= STEAL_RATIO_LOW)
+		prev_direction = -1;
+	else
+		prev_direction = 0;
+}
 #else
 void pseries_init_ec_vp_cores(void) { return; }
+void update_soft_entitlement(unsigned long steal_ratio) { return; }
 #endif
diff --git a/arch/powerpc/platforms/pseries/pseries.h b/arch/powerpc/platforms/pseries/pseries.h
index 3968a6970fa8..d1f9ec77ff57 100644
--- a/arch/powerpc/platforms/pseries/pseries.h
+++ b/arch/powerpc/platforms/pseries/pseries.h
@@ -115,6 +115,7 @@ int dlpar_workqueue_init(void);
 
 extern u32 pseries_security_flavor;
 void pseries_setup_security_mitigations(void);
+void update_soft_entitlement(unsigned long steal_ratio);
 
 #ifdef CONFIG_PPC_64S_HASH_MMU
 void pseries_lpar_read_hblkrm_characteristics(void);
-- 
2.47.3


