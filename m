Return-Path: <linuxppc-dev+bounces-14609-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD55CA4D24
	for <lists+linuxppc-dev@lfdr.de>; Thu, 04 Dec 2025 18:56:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMhy72NXRz2xYc;
	Fri, 05 Dec 2025 04:55:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764870959;
	cv=none; b=fWNH3garCWFZvDRGSOFB5rnvI6zTjrEDN8Vyb3t5lH1txuzEzKZmMaaZ94bZSrS+tQTa6EWbV5nPel8LaPCrycinYl1Ub+m9vWDkUHc6YVK1bmBjLdadmrbsENBXfR5pc0Hw7/FOdrFjhE/EJBeVahU17p7Sj81oqEmJUFK5a/DLu451PC+Xv8b11u1iwtIxrqipCoUbteVRPcG6wXEBxlIG6AugXz4kACMX85iV1jq8rVHh4l0Ley4aTXJ9rGgERsU7E5ZAqtUyOlZ+BL3qnc/XXph3jT5xzmYWCVAf8Z3TjOtXxXazcJkGhteaZUBgbWFOIoyZYpOgMnQUHf7kIg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764870959; c=relaxed/relaxed;
	bh=fbQTfFT/PIPbdoYiCV2JGcsZoVdZC5l+iaIv04MhFIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZOuQMIpsAFyy9s9i6YubzUCJc/aOlLVvdq4cHtmvaFre3dv6u+oLvW34G+Sh7Y3KEXibpqv/5weUoFQANjczez3JKS4AHh356+9whfARV/NaaSk4NCvH2qAwrPbzw/LknZL/UR/LQyAuxzIwOvT7SEm80fq+DY7+r9RmjDEqxrarj3NmmEEHUm411KGVNSFbCH2Xh2VumYDIZGQHjoBPVh1EPQyielRFQDoKlOSuPDWsoj6slmHutUjjglAjKBDsgIfA8I5wqV9JjsHAhXUcotAtTPSZAzYcKniAmiBE7WOiXsK5Sm5Xyk+Vvc+MblCMM+7pKZ7P5/ZQTB1Rw31/zg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g6jtrhxD; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g6jtrhxD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dMhy65HSGz2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Dec 2025 04:55:58 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5B4Daton006081;
	Thu, 4 Dec 2025 17:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=fbQTfFT/PIPbdoYiC
	V2JGcsZoVdZC5l+iaIv04MhFIc=; b=g6jtrhxDMWL2mCmJjhdrCXUTtYgiZ2jje
	xa8TLgQeeOjj6VIXl4Axtj5H00h7qbjf35EDzJvDmvLxLDnSeopz+B13YvWscG6I
	c66M3wiKToMhZobGSc1hTvzk/QFK2+MnLWZs+sZ0TFLyfgsfMFUTvPbYR7LOIWRk
	8Qt3OkUyVPnRwfPdAezYHOjv2yaUHD+zEaH9NGNO/dPBCdQcedY2Arwv+hDRgOdj
	liqtdF1fQAdh95hnZeFY7JA3Nf3TzoGXhYB9sKw2YC6H8vqP5p1zvkpU0TXWgxAd
	jTu+joylfvP8c7jFcqNkGCuYAMWe5xvR1v89YREU5jVgW2UztaQwQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqrja1t8n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:55:30 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5B4Hmgc7028947;
	Thu, 4 Dec 2025 17:55:29 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqrja1t8h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:55:29 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B4FtTO4003864;
	Thu, 4 Dec 2025 17:55:28 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ardck0x3s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:55:28 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5B4HtPLj52167138
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 4 Dec 2025 17:55:25 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EAB522004D;
	Thu,  4 Dec 2025 17:55:24 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 70F7120040;
	Thu,  4 Dec 2025 17:55:21 +0000 (GMT)
Received: from sapthagiri.in.ibm.com (unknown [9.39.29.188])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  4 Dec 2025 17:55:21 +0000 (GMT)
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
Subject: [PATCH 03/17] pseries/lpar: Process steal metrics
Date: Thu,  4 Dec 2025 23:23:51 +0530
Message-ID: <20251204175405.1511340-4-srikar@linux.ibm.com>
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
X-Proofpoint-GUID: PDJchYl4t_BHLdsDo034nr6fkaKJRJgb
X-Proofpoint-ORIG-GUID: pUgg4ZLiPm4NqPH0eoO3lYS8onZPQH9L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDAyMCBTYWx0ZWRfX9zF4ujQNz521
 84jncEtnzCSCFqxbljRwBhkCsp3heo2acBrr+U0mind6N9vR3kKOUUgkb1oQNo3et4ed4DKlI8g
 wljpwmIlD0CV3SzhmhKC/3CKcLkjnCq9lZJdv4+docEOlAI9sCUWEndlqMO/nzFn6vvf8gZ171l
 HH1B+SnJIj49oVxx7pvzNiawdHUUxhjOJ4uT2+5e1qI/6Bu9OyWgkQL8Z70I2rF/lR/Oa7firoZ
 +KkIZyiJQUE4FmQUZBHYtDk4iF+5l0ma0EsvxhP3y4H+lq/MlpU8ZLNJry898p9aB5rB2b0hYFr
 X+kNGKKtEls0AsZ4J5V4yPj6DE0PCtpyNejjhJm/50Ho0bqBpRW9fqhkibatUpjyiGn4iq6NpIa
 6/CAZJOHisobPOdgcu7UgTlVg7GbZQ==
X-Authority-Analysis: v=2.4 cv=dYGNHHXe c=1 sm=1 tr=0 ts=6931cb12 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=_esyMj-MSB3OpN4JKqEA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_04,2025-12-04_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1011 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511290020
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Based on steal metrics, find the ratio of current runtime to steal.
This ratio would further be used to soft offline/online the core.

Steal above a limit would indicate that there is more contention on
cores and hence few cores would be soft-offlined. Steal below a limit
would indicate that there are probably available cores and hence few
cores would be soft-onlined.

Currently only the first online CPU will calculate the steal and even
this CPU will process steal metrics at a 1 second granularity. Also
currently this steal processing is enabled on non-KVM shared logical
partitions. Since the steal time would be portion of the processor's
runtime, use a multiple to bump up the steal time so that its easier to
compare with limits.

Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/lpar.c    | 50 ++++++++++++++++++++++++
 arch/powerpc/platforms/pseries/pseries.h |  4 ++
 2 files changed, 54 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index dde12b27ba60..3431730a10ea 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -659,6 +659,53 @@ static int __init vcpudispatch_stats_procfs_init(void)
 machine_device_initcall(pseries, vcpudispatch_stats_procfs_init);
 
 #ifdef CONFIG_PARAVIRT_TIME_ACCOUNTING
+#define STEAL_MULTIPLE (STEAL_RATIO * STEAL_RATIO)
+#define PURR_UPDATE_TB tb_ticks_per_sec
+
+static void trigger_softoffline(unsigned long steal_ratio)
+{
+}
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
+	static unsigned long next_tb, prev_steal;
+	unsigned long steal_ratio, delta_tb;
+	unsigned long tb = mftb();
+	unsigned long steal = 0;
+	unsigned int i;
+
+	if (!should_cpu_process_steal(cpu))
+		return;
+
+	if (tb < next_tb)
+		return;
+
+	for_each_online_cpu(i) {
+		struct lppaca *lppaca = &lppaca_of(i);
+
+		steal += be64_to_cpu(READ_ONCE(lppaca->ready_enqueue_tb));
+		steal += be64_to_cpu(READ_ONCE(lppaca->enqueue_dispatch_tb));
+	}
+
+	if (next_tb && prev_steal) {
+		delta_tb = max(tb - (next_tb - PURR_UPDATE_TB), 1);
+		steal_ratio = (steal - prev_steal) * STEAL_MULTIPLE;
+		steal_ratio /= (delta_tb * num_online_cpus());
+		trigger_softoffline(steal_ratio);
+	}
+
+	next_tb = tb + PURR_UPDATE_TB;
+	prev_steal = steal;
+}
+
 u64 pseries_paravirt_steal_clock(int cpu)
 {
 	struct lppaca *lppaca = &lppaca_of(cpu);
@@ -667,6 +714,9 @@ u64 pseries_paravirt_steal_clock(int cpu)
 	steal = be64_to_cpu(READ_ONCE(lppaca->ready_enqueue_tb));
 	steal += be64_to_cpu(READ_ONCE(lppaca->enqueue_dispatch_tb));
 
+	if (is_shared_processor() && !is_kvm_guest())
+		process_steal(cpu);
+
 	/*
 	 * VPA steal time counters are reported at TB frequency. Hence do a
 	 * conversion to ns before using.
diff --git a/arch/powerpc/platforms/pseries/pseries.h b/arch/powerpc/platforms/pseries/pseries.h
index 3968a6970fa8..68cf25152870 100644
--- a/arch/powerpc/platforms/pseries/pseries.h
+++ b/arch/powerpc/platforms/pseries/pseries.h
@@ -26,6 +26,10 @@ void pSeries_machine_check_log_err(void);
 #ifdef CONFIG_SMP
 extern void smp_init_pseries(void);
 
+#ifdef CONFIG_PPC_SPLPAR
+#define STEAL_RATIO 100
+#endif
+
 /* Get state of physical CPU from query_cpu_stopped */
 int smp_query_cpu_stopped(unsigned int pcpu);
 #define QCSS_STOPPED 0
-- 
2.43.7


