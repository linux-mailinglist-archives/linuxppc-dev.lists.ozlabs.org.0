Return-Path: <linuxppc-dev+bounces-12007-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 674F6B51F4A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Sep 2025 19:45:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMSkX4TDVz3dT1;
	Thu, 11 Sep 2025 03:44:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757526292;
	cv=none; b=j/spL9dDzAp05IHvZFRflJIPZFWNPR/DOKUIvXobnLNlw/8oXD8SNHQq3gfl5c9N5VtD1jHR0ZJ41HyuMWzZmnBhlqNomwPOonfJzH55CmiDy3OjFJ+sBUdfVD8qSnRNm8llRMnBNLWyOUHsCFFlYkL3kPbH9JPviQ9Anj+H0bgTuxQuDMWVbjZgJ4gXjOpc6Ul4gMb+e5Uyh/ZeIg8jd1cmVCrOfP5szDNmzDdp9ot8p4j+uxtGxLmjpCFf8O+PjD/UQFL2yZnjrwVttWPlEpnx+V0lmn3pxFUwaJe6DzMxvARRgew0Iml3VO9v+s6b9FgmBWYc9dzjUg4aqGPdag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757526292; c=relaxed/relaxed;
	bh=3M2N//NXu7GH7/7+RHy6jE+7odu5vxHJAue17NuOL6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=COyoRPQWbyZhghylHhTLMq7G5T29gosu02DhuZhha8pLxTkxl0afudGRoayL9aLfeWGuylAGnzJ0PQYomTKqC9WtkEvBYj+xrpPDv1dNlgaKnJrRD6QeRmjyXds3vfXJglSpif0BiLw+Q7e76VK7fK44i9wEX3anQwV1wtlt2JVD8RTyiN0LerMOZ7misQTy52AcUa2eK3jERHC750mb9kDUsMqCJAjY/5vLTdNUBH2C9KrIo39oLP+1BN5/gxC0zD6MhLHEtgdnjYNOEfhVvy+qOkqcWogS3EzvMcXde5T126/UynVf+zXZjAIN9Rx3kktkNeu26V5i9swaAGTRLQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OsiQfbuu; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OsiQfbuu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMSkW6YzMz3dSj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Sep 2025 03:44:51 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ADEwqs026934;
	Wed, 10 Sep 2025 17:44:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=3M2N//NXu7GH7/7+R
	Hy6jE+7odu5vxHJAue17NuOL6E=; b=OsiQfbuuj2EsHZzvV37+U3YWY/JEpUBTu
	Uh8wwLFpyv8VAPvVRj8IH0aMij+2eZdHmbNNaxXsmCS04HEG7KnuER7tXi4jnsg2
	KnTBFfExPdCzDeL42tIOp7sRosgWOmP4K3QEcON0Y1WF1nAB9Agukz7cEerJZYEV
	l+XJeduDzEw0ngXmWahumQUGldboissU9rmdvVlNet+T7VkkLLLJ0QTsv6POrQZ0
	b5kUww8ygd56lsdbJZus04OeG0USNtwBHwxg70JYxx9Vu5JN2g+uDx0DaYA17J3H
	YB2J8XaOVk24Vaxvik4ASNQkm9mGusESDu4t1Dd2zv3iLAH1wWtNg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cmwyw1k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 17:44:41 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58AHY9F5018148;
	Wed, 10 Sep 2025 17:44:40 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cmwyw1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 17:44:40 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58AGn4rW011435;
	Wed, 10 Sep 2025 17:44:39 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 490y9uj05c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 17:44:39 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58AHiaBN51052956
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Sep 2025 17:44:36 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 04F1520043;
	Wed, 10 Sep 2025 17:44:36 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0EB6A20040;
	Wed, 10 Sep 2025 17:44:30 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.124.208.171])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 10 Sep 2025 17:44:29 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, tglx@linutronix.de, yury.norov@gmail.com,
        maddy@linux.ibm.com, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, gregkh@linuxfoundation.org
Cc: sshegde@linux.ibm.com, vschneid@redhat.com, iii@linux.ibm.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        vineeth@bitbyteword.org, jgross@suse.com, pbonzini@redhat.com,
        seanjc@google.com
Subject: [RFC PATCH v3 09/10] powerpc: Add debug file for set/unset paravirt CPUs
Date: Wed, 10 Sep 2025 23:12:09 +0530
Message-ID: <20250910174210.1969750-10-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910174210.1969750-1-sshegde@linux.ibm.com>
References: <20250910174210.1969750-1-sshegde@linux.ibm.com>
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
X-Proofpoint-GUID: amcS-wnazfFzGDd6FUD5JkuCKo5WkKe7
X-Proofpoint-ORIG-GUID: DBl5RwKUzaSI_21H3nfDix1PY3aRtyBD
X-Authority-Analysis: v=2.4 cv=J52q7BnS c=1 sm=1 tr=0 ts=68c1b909 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=X4BZNoojgDGXhmZENQsA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNSBTYWx0ZWRfX/UsDCfDmnuwC
 V2+AgMjbXVKawQJvm45qdVIOhyLGWNw1ZWwEk5ALOXiHyonlV4d/xi97tqrSDqW8l+tH0YgoY2M
 4WvlSeud74RBd88OHEsa5p3bMTmZK7TzV137nKwIT9fOGhjkzlBBpVxPnNMkPfGRcKlo10shat7
 V2WxDKcfmZsYIEc1uSvgsO+9IwMoJTvlMZnau3InZk3JzByce+eirEuBlPIo423mdS8Ic0VxIgp
 MpLzhQ7jMs9IS1lulnU7OVSVA3z+kY3Ff24s18Lv1SC1cNeu2T2RgB2T5Nb5HF0EJTWfKGX1JK5
 WDVUfrPTuJSFvusQonElJ9/k00eMy7IdFb7gCSDKhldnup9z3TV0F+8xFNJQaLCGWGxq6YWuorw
 hIQ1nKoY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_03,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060025
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

PowerPC systems can be deployed shared processor Logical Partitions (SPLPAR)
aka Shared VM. These configurations allows overcommit of CPU resource.
i.e more virtual CPUs than physical CPUs.

When there is contention of physical CPUs in such cases arch needs to
have a mechanism to set the CPUs as paravirt. It also needs to clear
them when the contention goes away.

Ideal would be get the hint from hypervisor. It would be more accurate
since it has knowledge of all SPLPARs deployed in the system.

Till the hint from underlying hypervisor arrives, another idea is to
approximate the hint from steal time. There are some works ongoing, but
not there yet due to challenges revolving around limits and
convergence.

Till that happens, there is a need for debugfs file which could be used to
set/unset the hint. The interface currently is number starting from which
CPUs will marked as paravirt. It could be changed to one the takes a
cpumask(list of CPUs) in future.

============== Usage Example ============

Lets say 720 CPU system. It is observing 20% steal time. It is evident
that one should probably only 576 CPUs. Do,

echo 576 > /sys/kernel/debug/powerpc/vp_manual_hint
cat /sys/devices/system/cpu/paravirt
576-719

This marks CPUs 576-719 as paravirt and move the tasks out of these
CPUs. To unset, echo total number of CPUs(720) or higher value.

echo 720 > /sys/kernel/debug/powerpc/vp_manual_hint
cat /sys/devices/system/cpu/paravirt

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 arch/powerpc/include/asm/paravirt.h |  1 +
 arch/powerpc/kernel/smp.c           | 58 +++++++++++++++++++++++++++++
 2 files changed, 59 insertions(+)

diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm/paravirt.h
index b78b82d66057..8854da8e532c 100644
--- a/arch/powerpc/include/asm/paravirt.h
+++ b/arch/powerpc/include/asm/paravirt.h
@@ -16,6 +16,7 @@
 #include <asm/cputhreads.h>
 
 DECLARE_STATIC_KEY_FALSE(shared_processor);
+DECLARE_STATIC_KEY_FALSE(cpu_paravirt_push_tasks);
 
 static inline bool is_shared_processor(void)
 {
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 68edb66c2964..1c0d59d353bd 100644
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
@@ -1717,6 +1719,7 @@ static void __init build_sched_topology(void)
 	BUG_ON(i >= ARRAY_SIZE(powerpc_topology) - 1);
 
 	set_sched_topology(powerpc_topology);
+	vp_manual_hint = num_present_cpus();
 }
 
 void __init smp_cpus_done(unsigned int max_cpus)
@@ -1797,4 +1800,59 @@ void __noreturn arch_cpu_idle_dead(void)
 	start_secondary_resume();
 }
 
+#ifdef CONFIG_PARAVIRT
+/*
+ * sysfs hint to mark CPUs as paravirt. This will help in restricting
+ * the workload to specified number of CPUs.
+ * For example, On 720 CPU system 576 > vp_manual_hint means, workload will
+ * run on 0-575 CPUs. Tasks will move out of 576-719 CPUs.
+ */
+
+static int pv_vp_manual_hint_set(void *data, u64 val)
+{
+	int cpu;
+	int online_cpus = num_online_cpus();
+
+	if (val == vp_manual_hint)
+		return 0;
+
+	if (val == 0 || val > online_cpus)
+		val = online_cpus;
+
+	vp_manual_hint = val;
+
+	if (vp_manual_hint < online_cpus)
+		static_branch_enable(&cpu_paravirt_push_tasks);
+	else
+		static_branch_disable(&cpu_paravirt_push_tasks);
+
+	for_each_online_cpu(cpu) {
+		if (cpu >= vp_manual_hint)
+			set_cpu_paravirt(cpu, true);
+		else
+			set_cpu_paravirt(cpu, false);
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
+DEFINE_SIMPLE_ATTRIBUTE(fops_pv_vp_manual_hint, pv_vp_manual_hint_get,
+			pv_vp_manual_hint_set, "%llu\n");
+
+static __init int paravirt_debugfs_init(void)
+{
+	if (is_shared_processor())
+		debugfs_create_file("vp_manual_hint", 0600, arch_debugfs_dir,
+				    NULL, &fops_pv_vp_manual_hint);
+	return 0;
+}
+
+device_initcall(paravirt_debugfs_init)
+#endif
+
 #endif
-- 
2.47.3


