Return-Path: <linuxppc-dev+bounces-14624-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 169E2CA4D63
	for <lists+linuxppc-dev@lfdr.de>; Thu, 04 Dec 2025 18:58:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMhzB6JgQz30RT;
	Fri, 05 Dec 2025 04:56:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764871014;
	cv=none; b=OVPjihtqYQby7laWiFF7AaK/EJCiuJ8pJNbCtdtgW8sHFdD43WkpOkdxZ3f9Tcunq9smlCVIv2/awWMxNBVMH3eKT5KTZ5EZwTqo1rVlRrkRrnUks7BrCDC/yBnrp84eQ9Vql7LcznV1HA8fCyQLxHCEosFEwhsgA7qOKFK44ME80u/JteuQn0pigFJ1ZeV/ITdbCoVwxLlHjtAEM4jV1BSqsVbLH4P9JjUp3PyF9b7OmLUMKp7DIlR96QvK2NilLrKtQlW++SwKW/ESST5T3D2CtAueCPkcZ+1BpCf//35U7oI9pC/yn/mClTCD12WDU9eARLcP8RNU1lJaUC9SeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764871014; c=relaxed/relaxed;
	bh=mlpFgm7ForCx1wVbrClPH+oaDY6Ooxw2Cvy2EE53C0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GLXWfbeh9H7TtKijaUudCm8PEkg+mQre/xuhP8FX9tQfDqF3DJgcUoPzlxLpgOALlep0H3fDhLtucMRqp5SLAZ+Y+diWVSfL7OXr+A2WJXabpVmWGJ5ZD+Z577H+MjLl1f3iPOMhN39FazBLV10Bi2irGAM8+HCm4RcJviaViuyrgRarrhIZf1+Ad47p2JmVhe7GNDYcn8Hn4/UoCfhOjlxe2Aizrl+hH1TsoWoRhWUTzVeklTI7xw/nQ76vCBo3sJKlMzffexM0Rr7pTYSycW9ZJj0xxnfccuk7puogGIM85ZTaIFXjviWOHLKrk2/AVra5F6p4SbLZT1WmQvOfpg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ad0TnzAn; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ad0TnzAn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dMhzB257jz30Lt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Dec 2025 04:56:54 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5B4D0P6o007009;
	Thu, 4 Dec 2025 17:56:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=mlpFgm7ForCx1wVbr
	ClPH+oaDY6Ooxw2Cvy2EE53C0k=; b=Ad0TnzAn4WMhluNwES1hPnnE4b+7HPKyP
	vr+lKHZEFntXLeJiU8kMX7ObNTESAEjHgtZyWsWSvbXz/x2ajHNezeuN/URrxCqY
	T137OmZVyBkpLB5unBkp/0r0D4JsyxfPG5dp2efZ6dgzYDtHCyydxIreSl+pm5vj
	8YnYVQ7Rb4e7sB5lcaZjFb+hJA2vmNUTG4TVmyG2EH/guq0eozmCcoay5Anny1qA
	xpW4QAhxoYZXs8zqRktVL3OErZRpU0+Nmx7T4NNX1hEiOYdF9Cgt94Rg5W20SlF4
	0Q7pBdKWbe2mEfE1LXnL9yUOeiDJJJiDDkLPXfmhORya3cLJHN09g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqrja1tbr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:56:20 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5B4HuJSJ010965;
	Thu, 4 Dec 2025 17:56:19 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqrja1tbm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:56:19 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B4GHegV021731;
	Thu, 4 Dec 2025 17:56:18 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4at8c6jbcg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:56:18 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5B4HuE1K47579394
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 4 Dec 2025 17:56:14 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 41F5920043;
	Thu,  4 Dec 2025 17:56:14 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C008320040;
	Thu,  4 Dec 2025 17:56:10 +0000 (GMT)
Received: from sapthagiri.in.ibm.com (unknown [9.39.29.188])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  4 Dec 2025 17:56:10 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Peter Zijlstra <peterz@infradead.org>
Cc: Ben Segall <bsegall@google.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ingo Molnar <mingo@kernel.org>, Juri Lelli <juri.lelli@redhat.com>,
        K Prateek Nayak <kprateek.nayak@amd.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mel Gorman <mgorman@suse.de>, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>,
        Srikar Dronamraju <srikar@linux.ibm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Swapnil Sapkal <swapnil.sapkal@amd.com>,
        Thomas Huth <thuth@redhat.com>,
        Valentin Schneider <vschneid@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        virtualization@lists.linux.dev, Yicong Yang <yangyicong@hisilicon.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 16/17] pseries/smp: Allow users to override steal thresholds
Date: Thu,  4 Dec 2025 23:24:04 +0530
Message-ID: <20251204175405.1511340-17-srikar@linux.ibm.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251204175405.1511340-1-srikar@linux.ibm.com>
References: <20251204175405.1511340-1-srikar@linux.ibm.com>
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
X-Proofpoint-GUID: grM7ksqg05fc0zyk6Jf5luq4L1sLl7QD
X-Proofpoint-ORIG-GUID: lIT3fTsKSgeSOSZOVu_7aTC0h3wmOs2R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDAyMCBTYWx0ZWRfXx2Wd0mAODIb1
 2SIn1PAlKT/M3dItrJU/K7MSZGxABGvpR+OJg+vop7J8b1zWuXXEP1nVfXGMc8pKVZcnDzr6jkr
 hZorn7QH8NsvxK71BHfEy2Ps3zf95xJjrdjsVKHIAUz7US1xWhroVURiB/ymHLpvvY0/RWdMKpr
 v/EF/19jBY74yFZ5c2W555nyN3HBzQM0uimZPDnSDb+x4QUJl62nONfzOIEOloH1AL0ozME7G28
 JAinplCabXKbxJ/VoCUeYr782H9GPQ/tNy3SxQOrGbdDBxAjA51LXpMItbih7XG4cz6wwaDWJFG
 EO0gvLe/yemllrNV5D+uUoWSCgyJhidUyTGqdu46i9DkZtmS1U6EUi9AgEZkHfZyysW5V6qLXXC
 0dfBEMoWBWOhTwaA4DROIJVu7fzXmg==
X-Authority-Analysis: v=2.4 cv=dYGNHHXe c=1 sm=1 tr=0 ts=6931cb44 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=D5CivmakTvuzdLjxN4gA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_04,2025-12-04_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511290020
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Different shared LPARs will have different entitled cores, different
number of cores in shared pools and different virtual processors. Also
the number and configuration of other shared LPARs sharing the same pool
will differ in each case. Hence a single set of threshold values may not
work. Hence provide a debugfs interface by which a privileged user can set
the high and low threshold values.

Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/smp.c | 30 +++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/smp.c b/arch/powerpc/platforms/pseries/smp.c
index a3daac4c3e1e..909f2d58384a 100644
--- a/arch/powerpc/platforms/pseries/smp.c
+++ b/arch/powerpc/platforms/pseries/smp.c
@@ -21,6 +21,9 @@
 #include <linux/device.h>
 #include <linux/cpu.h>
 #include <linux/pgtable.h>
+#if defined(CONFIG_DEBUG_FS) && defined(CONFIG_PPC_SPLPAR)
+#include <linux/debugfs.h>
+#endif
 
 #include <asm/ptrace.h>
 #include <linux/atomic.h>
@@ -285,9 +288,6 @@ static __init void pSeries_smp_probe(void)
  * lower threshold values below which allow work to spread out to more
  * cores.
  */
-#define STEAL_RATIO_HIGH (10 * STEAL_RATIO)
-#define STEAL_RATIO_LOW (5 * STEAL_RATIO)
-
 static unsigned int max_virtual_cores __read_mostly;
 static unsigned int entitled_cores __read_mostly;
 static unsigned int available_cores;
@@ -323,6 +323,9 @@ unsigned int pseries_num_available_cores(void)
 	return available_cores;
 }
 
+static u8 steal_ratio_high = 10;
+static u8 steal_ratio_low = 5;
+
 void trigger_softoffline(unsigned long steal_ratio)
 {
 	int currcpu = smp_processor_id();
@@ -340,7 +343,7 @@ void trigger_softoffline(unsigned long steal_ratio)
 	 * If Steal time is high, then reduce Available Cores.
 	 * If steal time is low, increase Available Cores
 	 */
-	if (steal_ratio >= STEAL_RATIO_HIGH && prev_direction > 0) {
+	if (steal_ratio >= STEAL_RATIO * steal_ratio_high && prev_direction > 0) {
 		/*
 		 * System entitlement was reduced earlier but we continue to
 		 * see steal time. Reduce entitlement further if possible.
@@ -358,7 +361,7 @@ void trigger_softoffline(unsigned long steal_ratio)
 		}
 		if (success)
 			available_cores--;
-	} else if (steal_ratio <= STEAL_RATIO_LOW && prev_direction < 0) {
+	} else if (steal_ratio <= STEAL_RATIO * steal_ratio_low && prev_direction < 0) {
 		/*
 		 * System entitlement was increased but we continue to see
 		 * less steal time. Increase entitlement further if possible.
@@ -381,9 +384,9 @@ void trigger_softoffline(unsigned long steal_ratio)
 		if (success)
 			available_cores++;
 	}
-	if (steal_ratio >= STEAL_RATIO_HIGH)
+	if (steal_ratio >= STEAL_RATIO * steal_ratio_high)
 		prev_direction = 1;
-	else if (steal_ratio <= STEAL_RATIO_LOW)
+	else if (steal_ratio <= STEAL_RATIO * steal_ratio_low)
 		prev_direction = -1;
 	else
 		prev_direction = 0;
@@ -437,3 +440,16 @@ void __init smp_init_pseries(void)
 
 	pr_debug(" <- smp_init_pSeries()\n");
 }
+
+#if defined(CONFIG_DEBUG_FS) && defined(CONFIG_PPC_SPLPAR)
+static int __init steal_ratio_debugfs_init(void)
+{
+	if (!firmware_has_feature(FW_FEATURE_SPLPAR))
+		return 0;
+
+	debugfs_create_u8("steal_high", 0600, arch_debugfs_dir, &steal_ratio_high);
+	debugfs_create_u8("steal_low", 0600, arch_debugfs_dir, &steal_ratio_low);
+	return 0;
+}
+machine_arch_initcall(pseries, steal_ratio_debugfs_init);
+#endif /* CONFIG_DEBUG_FS && CONFIG_PPC_SPLPAR*/
-- 
2.43.7


