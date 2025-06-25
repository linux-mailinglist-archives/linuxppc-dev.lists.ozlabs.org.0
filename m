Return-Path: <linuxppc-dev+bounces-9790-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D67CAE8E3A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 21:13:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSBK56vcNz30Wn;
	Thu, 26 Jun 2025 05:12:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750878745;
	cv=none; b=GlacuNQV9EkqAX7ItT0wG6br35ikIPNpmq9Iqq1JESFGr8ByuG/GunVHk3DNIB78BgJzEwFZNKIY1ioJ03ACcMd602uwvmnTLAe9QDYATu/iQO306+WeM0ThqRkJINuhCeHfOc/kKQ2z+MmhTiX9aHGa1w2BB+tGZvI72amkx+6DzBR7GwJxkiLcd5ZOZrZ190SZAwjEIVhyhDeqbBNZsPfIdM5tJLRJJHq1t/SnUnIB2DHffy/2rvGYMKX5+FBWdlc77Mze08VL1/i2UtmAxptJKidUYpM/BdusAmDJ422lCBH4iYTbZOQ3QC/jHM6fglzFg73xk/pF4ZbXfhAR0A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750878745; c=relaxed/relaxed;
	bh=sj4hwpYQjyOaXXLYMwbz9n8YmXdOIVju/O/KyJyJKkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EMq436PiNCcUauD4SopIK3plWES4tDVpxCiOSC5aw/Y9hiYkgKIucJB6zwfG9BzL7HM1GjKlxZLohjOmSMh0Z189EzhOYYZs7Hf1kuAmS4O1H/K6+IFD7721QP9UGOW+Z57c3lGOcBi2gS+id2/uKUAK4GdTmOv9za/nulRvUDbAw1DBxBPS7lSxoNIB04MJ6j3RlMuh1SZJqS4ASEmt6kc6O+ueZqhGzOidvM9QZJCW0LbptozHDWU06YoZjYlTRzPUNt+YSgmIjBfga6rZQYj5UX1RNy50wP7ZpIxmStOv28GXS0ZU8sJvPhaJksUxFf67amvLHE4mqFS0YltH7w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rQ23vrEl; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rQ23vrEl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSBK43ljBz3bkb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 05:12:24 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PIvp0T002954;
	Wed, 25 Jun 2025 19:12:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=sj4hwpYQjyOaXXLYM
	wbz9n8YmXdOIVju/O/KyJyJKkQ=; b=rQ23vrEliBZhkHyNP6uH/NX5D/iV90lz5
	Sbzfh5xvFGQ3hhs8dranANb/CTkG5sbGz+v+0gQqHyOcPJ3OuJiXixNkwFyHAagh
	B1yDfI9X+t8/y8sagSpPYtjTmumrY/LtP3Rgb/wZ+Dc9XF7eRq3Mo3qnkjz3P3Fp
	bQCDp4A16iFQ65QD+LqMLaahVbJusXjk/KZyBP/lWSxJpfABb6xeJgLJAuchygX5
	tFbdTW2b+IrdjsSkrtUjo1Fs21RO+mfeTC9qzYEihYNBaU4CgV6CF8jcBjkuiGY4
	FbitLYvjLQq/GBQM8DHABv2PjwwlTQJb3sfIoauYmKc8FGL4KN4WQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dmf394kx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 19:12:09 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55PJ7gLb013252;
	Wed, 25 Jun 2025 19:12:09 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dmf394kt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 19:12:09 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55PHlU9B002512;
	Wed, 25 Jun 2025 19:12:08 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47e8jmasem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 19:12:08 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55PJC4Lx45351400
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 19:12:04 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 47CA520043;
	Wed, 25 Jun 2025 19:12:04 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8E2EB20040;
	Wed, 25 Jun 2025 19:12:00 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.124.209.143])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Jun 2025 19:12:00 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, tglx@linutronix.de, yury.norov@gmail.com,
        maddy@linux.ibm.com
Cc: sshegde@linux.ibm.com, vschneid@redhat.com, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, kprateek.nayak@amd.com, huschle@linux.ibm.com,
        srikar@linux.ibm.com, linux-kernel@vger.kernel.org,
        christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org,
        gregkh@linuxfoundation.org
Subject: [RFC v2 9/9] [DEBUG] powerpc: add debug file for set/unset cpu avoid
Date: Thu, 26 Jun 2025 00:41:08 +0530
Message-ID: <20250625191108.1646208-10-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250625191108.1646208-1-sshegde@linux.ibm.com>
References: <20250625191108.1646208-1-sshegde@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=M5FNKzws c=1 sm=1 tr=0 ts=685c4a09 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=p-EdeYucjEwV52n1TQsA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MSBTYWx0ZWRfX6kykvkwcHs8Q EmPt6oNDn72P8qGY1IlDGuJMzbvzyCBdy7RFg30K1X2Pub5eNmlPEAkNPNC3r4Ls1KH0dGKp4kx Ic4mdmdcq8iX6qfIs6MnKsqfjepUfWU7p+kaGPUpkYXjdIfDrYxgdnzBUyOVQC8NvBiMiHUlwWT
 DMkpXO3LHm5JSGOQRLe5T2LB0Ll4zZpzSQL8ilXEMfdEfjM0B0e9oNbZE9Nzy0pJ5yUINItFChj 3rEKD94QUQU6PpMph0ZbC+XwYI1jj42MpIUmn/fn86acbtdP4YcAxMLTpi8lQ4Pi/ButXvqYjrR ZQW5o3BOnmeYEsfacXWM1A9MkVUpQs1YIoXXllrFVkoWGCIPWWgeT44ddGDoUz9JugGAkKaM2AZ
 en3UwsXpSDHOHw2V3g2WmylHytXmFrh4JRjlQSqXYj+aeSqKzSKP8RM4m6x6nc/bc7yqG0VT
X-Proofpoint-GUID: tSfwQunLDKfYkRT561MPEbEFGHR3E6AR
X-Proofpoint-ORIG-GUID: YFBlOehKcrciiuM9VgjlQ--IrzfvbzFB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 adultscore=0
 mlxscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250141
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Reference patch for how an architecture can make use of this infra. 

This is not meant to be merged. Instead the vp_manual_hint should either
come from hardware or could be derived using steal time. 

When the provided hint is less than the total CPUs in the system, it
will enable the cpu avoid static key and set those CPUs as avoid. 

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 arch/powerpc/include/asm/paravirt.h |  2 ++
 arch/powerpc/kernel/smp.c           | 50 +++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm/paravirt.h
index b78b82d66057..b6497e0b60d8 100644
--- a/arch/powerpc/include/asm/paravirt.h
+++ b/arch/powerpc/include/asm/paravirt.h
@@ -10,6 +10,8 @@
 #include <asm/hvcall.h>
 #endif
 
+DECLARE_STATIC_KEY_FALSE(paravirt_cpu_avoid_enabled);
+
 #ifdef CONFIG_PPC_SPLPAR
 #include <linux/smp.h>
 #include <asm/kvm_guest.h>
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 5ac7084eebc0..e00cdc4de441 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -64,6 +64,7 @@
 #include <asm/systemcfg.h>
 
 #include <trace/events/ipi.h>
+#include <linux/debugfs.h>
 
 #ifdef DEBUG
 #include <asm/udbg.h>
@@ -82,6 +83,7 @@ bool has_big_cores __ro_after_init;
 bool coregroup_enabled __ro_after_init;
 bool thread_group_shares_l2 __ro_after_init;
 bool thread_group_shares_l3 __ro_after_init;
+static int vp_manual_hint = NR_CPUS;
 
 DEFINE_PER_CPU(cpumask_var_t, cpu_sibling_map);
 DEFINE_PER_CPU(cpumask_var_t, cpu_smallcore_map);
@@ -1727,6 +1729,7 @@ static void __init build_sched_topology(void)
 	BUG_ON(i >= ARRAY_SIZE(powerpc_topology) - 1);
 
 	set_sched_topology(powerpc_topology);
+	vp_manual_hint = num_present_cpus();
 }
 
 void __init smp_cpus_done(unsigned int max_cpus)
@@ -1807,4 +1810,51 @@ void __noreturn arch_cpu_idle_dead(void)
 	start_secondary_resume();
 }
 
+/*
+ * sysfs hint to mark CPUs as Avoid. This will help in restricting
+ * the workload to specified number of CPUs.
+ * For example 40 > vp_manual_hint means, workload will run on
+ * 0-39 CPUs.
+ */
+
+static int pv_vp_manual_hint_set(void *data, u64 val)
+{
+	int cpu;
+
+	if (val == 0 || vp_manual_hint > num_present_cpus())
+		vp_manual_hint = num_present_cpus();
+
+	if (val != vp_manual_hint)
+		vp_manual_hint = val;
+
+	if (vp_manual_hint < num_present_cpus())
+		static_branch_enable(&paravirt_cpu_avoid_enabled);
+	else
+		static_branch_disable(&paravirt_cpu_avoid_enabled);
+
+	for_each_present_cpu(cpu) {
+		if (cpu >= vp_manual_hint)
+			set_cpu_avoid(cpu, true);
+		else
+			set_cpu_avoid(cpu, false);
+	}
+	return 0;
+}
+
+static int pv_vp_manual_hint_get(void *data, u64 *val)
+{
+	*val = vp_manual_hint;
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(fops_pv_vp_manual_hint, pv_vp_manual_hint_get, pv_vp_manual_hint_set, "%llu\n");
+
+static __init int paravirt_debugfs_init(void)
+{
+	if (is_shared_processor())
+		debugfs_create_file("vp_manual_hint", 0600, arch_debugfs_dir, NULL, &fops_pv_vp_manual_hint);
+	return 0;
+}
+
+device_initcall(paravirt_debugfs_init)
 #endif
-- 
2.43.0


