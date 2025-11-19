Return-Path: <linuxppc-dev+bounces-14326-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 210A6C6CE72
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 07:23:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBBHM57KCz3cZ4;
	Wed, 19 Nov 2025 17:22:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763533375;
	cv=none; b=V6kgvQBCxX9kUQ7HEKJZirgGtg017qLH4yopbs2h3FBAdh5uaEyQd8JTJS1K5ZiYK+t4A4RkA6qmOETzNxeRFPj8rz8sZ5rmLyXzhVAPm84BhnBqz2LwP7E9I18jDyTz7c8A3P4XWb5IR7wJxHjMTYO6ZOrxhMm6vI5vfJKhQ4VW+gdXCfzfiJWtrDXQCYerUTUXXmxdvQrtuLYEPvOT1Njk6d7Q+S1XSSklCX6W6U6g1IQA59cs1wr/D1Is5I+rOQfmNqyeiJ0DQy44hV1jDTOJwnU2rP2o+oKOsYUr7gRkTpDchwes9fSyPJiXUiHZ+CC5rosVobfg/01LiJ4QyA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763533375; c=relaxed/relaxed;
	bh=5J8B5BjCgcW7Mhruz5B4PQwUqSYdH0D4WBWeJo3om/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N7NB1/bhfVWj2wMNWobJnTqEgDjObVpgd8vq5hz8LEAtL/MENkpLCasV5gS2EVcH4oDv4ZZjh4D0LAuidumGkDZlJqAtdJQfmQd60Btk1GQk6fmTnxBHDrml5YuhodjQ9JposNEiScaKVZz1dP4fMW3zA8KtpuOXfrXQxQjEZoeyzPU8w39KRcELZWssn2bZcdxmFe7IvthHIYflSV+dfPAM7N7599l8kWxbgsKazzToYUMie2uW5SUCQrYiGOVtSbz/9CSTuKsTK+vPit1UizK7oqTHSQIg3DlR5xOFZHlRP8H5OGSLbZKhOdvzzW+0ofoNCGnyDkN6qAJIeTA5LQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FmfFKI8+; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FmfFKI8+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBBHL6SgFz3c1C
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 17:22:54 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AIGLaBG008745;
	Wed, 19 Nov 2025 06:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=5J8B5BjCgcW7Mhruz
	5B4PQwUqSYdH0D4WBWeJo3om/8=; b=FmfFKI8+7LhwGhX4CCd20glWlTobMJd7X
	8HnC2VF7LDJJ3iRRZW9sqZIoXGPX3v6zF0C18mqWll2xgz3ux8SYCYlKdsrIad/4
	nn9QF6+GUD1DuC9a5IMeArf8XfA/TNe6Doa31nsPigwiIUmMzsdIFPJYT/hpFEfC
	dNgPvPM4KWuxSfuN7pBRhsUaOcRhEyxv3/agDkkXgZ3AGzcnhYORksVsHKvX+Adr
	lzVKXHz1wUPuEVYWL/E2mZHThXA/4Uit7d28njyEroqQqD5iwe+t3bVw0b3V55wT
	LHTHTr3jCzw0LJuUiNDd44py2hQmWp3HQtf4jSLCh+SE+zTz7n4Fg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejmsp75d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:22:37 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AJ6I1KP025614;
	Wed, 19 Nov 2025 06:22:36 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejmsp75b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:22:36 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ4ks47007031;
	Wed, 19 Nov 2025 06:22:35 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4af62jexwf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:22:35 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AJ6MVQx16515484
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Nov 2025 06:22:32 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D00292004B;
	Wed, 19 Nov 2025 06:22:31 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0203420040;
	Wed, 19 Nov 2025 06:22:28 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.25.220])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Nov 2025 06:22:27 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org, tglx@linutronix.de,
        yury.norov@gmail.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
        gregkh@linuxfoundation.org, pbonzini@redhat.com, seanjc@google.com,
        kprateek.nayak@amd.com, vschneid@redhat.com, iii@linux.ibm.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        christophe.leroy@csgroup.eu
Subject: [RFC PATCH v4 14/17] powerpc: process steal values at fixed intervals
Date: Wed, 19 Nov 2025 11:50:57 +0530
Message-ID: <20251119062100.1112520-15-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251119062100.1112520-1-sshegde@linux.ibm.com>
References: <20251119062100.1112520-1-sshegde@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: HaLFCyz-iRJRyOAUZ9iR9oMLV4bArAGB
X-Authority-Analysis: v=2.4 cv=Rv3I7SmK c=1 sm=1 tr=0 ts=691d622d cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=Mwgd3rNTb8mxO3DA2-gA:9
X-Proofpoint-GUID: Z3m08x9DwrRb2D0DLgXIKIQE7Nid7xYv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfXw218n/8cAmRU
 OvLNLtQiVnWLPcWphrSE0wQcrDHrdvbYgstXPaMrKbfCCKXOjc1S0WBFwgsabDVJ4w11Kzqc6B7
 pQXOGS/tnFVKGkeKFVsWRTHUbP8WkB+4JVHbRAjzc5N4c7TAEPLMjmS+ABqVHbV7NNu71i2Pz4+
 epkXSCo/a2ykCjRANcYesHtflUZi2vyBtcS3byM+jdRXL0GUsTPxj6MFPDzZj6t9UXpLfjkFFaZ
 byTSMwnIBuyNXD7/7hVdQDmBmBKMvvcFHSZ9ohdhl26df7dIBCcGeR4uRLaDi31xVYaJeFm+f7T
 DwhvFNIN8Dmz1rhjgyCn/HSCyZ74pUne2UeG41BMjx43eNtadoVz4etPcNYr4w9eyPrDzJLKSy3
 yjJoifsoOj5m2kyuMhm8a35TMPfeGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Process steal time at regular intervals. Sum of steal time across the
vCPUs is computed against the time to get the steal ratio.

Only first online CPU does this work. That reduces the racing issues.
This is done only on SPLPAR (non kvm guest). This assumes PowerVM being
the hypervisor.
 
Originally-by: Srikar Dronamraju <srikar@linux.ibm.com>
Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/lpar.c | 59 +++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 825b5b4e2b43..c16d97e1a1fe 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -660,10 +660,58 @@ static int __init vcpudispatch_stats_procfs_init(void)
 machine_device_initcall(pseries, vcpudispatch_stats_procfs_init);
 
 #ifdef CONFIG_PARAVIRT_TIME_ACCOUNTING
+
+#define STEAL_MULTIPLE 10000
+#define PURR_UPDATE_TB NSEC_PER_SEC
+
+static bool should_cpu_process_steal(int cpu)
+{
+	if (cpu == cpumask_first(cpu_online_mask))
+		return true;
+
+	return false;
+}
+
+static void process_steal(int cpu)
+{
+	static unsigned long next_tb_ns, prev_steal;
+	unsigned long steal_ratio, delta_tb;
+	unsigned long tb_ns = tb_to_ns(mftb());
+	unsigned long steal = 0;
+	unsigned int i;
+
+	if (!should_cpu_process_steal(cpu))
+		return;
+
+	if (tb_ns < next_tb_ns)
+		return;
+
+	for_each_online_cpu(i) {
+		struct lppaca *lppaca = &lppaca_of(i);
+
+		steal += be64_to_cpu(READ_ONCE(lppaca->ready_enqueue_tb));
+		steal += be64_to_cpu(READ_ONCE(lppaca->enqueue_dispatch_tb));
+	}
+
+	steal = tb_to_ns(steal);
+
+	if (next_tb_ns && prev_steal) {
+		delta_tb = max(tb_ns - (next_tb_ns - PURR_UPDATE_TB), 1);
+		steal_ratio = (steal - prev_steal) * STEAL_MULTIPLE;
+		steal_ratio /= (delta_tb * num_online_cpus());
+		update_soft_entitlement(steal_ratio);
+	}
+
+	next_tb_ns = tb_ns + PURR_UPDATE_TB;
+	prev_steal = steal;
+}
+
 u64 pseries_paravirt_steal_clock(int cpu)
 {
 	struct lppaca *lppaca = &lppaca_of(cpu);
 
+	if (is_shared_processor() && !is_kvm_guest())
+		process_steal(cpu);
 	/*
 	 * VPA steal time counters are reported at TB frequency. Hence do a
 	 * conversion to ns before returning
@@ -2061,6 +2109,17 @@ void pseries_init_ec_vp_cores(void)
 #define STEAL_RATIO_HIGH 400
 #define STEAL_RATIO_LOW  150
 
+/*
+ * [0]<----------->[EC]---->{AC}-->[VP]
+ * EC == Entitled Cores. Guaranteed number of cores by hypervsior.
+ * VP == Virtual Processors. Total number of cores. When there is overcommit
+ * this will be higher than EC.
+ * AC == Available Cores Varies between EC <-> VP.
+ *
+ * If Steal time is high, then reduce Available Cores.
+ * If steal time is low, increase Available Cores
+ */
+
 void update_soft_entitlement(unsigned long steal_ratio)
 {
 	static int prev_direction;
-- 
2.47.3


