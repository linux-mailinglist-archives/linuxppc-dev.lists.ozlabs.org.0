Return-Path: <linuxppc-dev+bounces-14117-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCA7C5100D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Nov 2025 08:49:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d5wXn6xk8z2yvR;
	Wed, 12 Nov 2025 18:49:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762933785;
	cv=none; b=fF8co9haGE8vOyz+D8Ht0r56Jt8qicFMUs1xR336bhohROhypn+zkl2ymDRcaAWT44mBxCaV+VTgHvJU38ejtHgAccxquE8x32KYZnn+YnBNOpJxX1Fn9H9TBG43XsctQLXQDFbj7JB0W2ku2qxLN9wwULNakTM+kxWB6GPjFmn+xk9ZmmHo2jTloqTcxs9J4kb6dr+dMrS1whSmE2EO+jLNB47aaspJSeI0RusueijbPvLHi/lbj7lv1OoLJYoKFSTrKzAtsYi1SNARbruDN54C7yaygQPTmS+tLxVIgSwnWcknWG+t1+qbDtS7FjY5+K7XXTfgQOiDsmJrDO+eRA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762933785; c=relaxed/relaxed;
	bh=IeasLi6tJZCSJTT4jvd92KlZnCpNxzwF6qmUZxsIbQc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=doKwMRO14ycLtm6/SCjzakZe7Ub7O9GHWwFnr6OsDHehjpg8oI9SoUzkF1svWLKD18dcBD0/zMhGM2L0tYtOPjum71CiJquWPrMSEXJUCWSQ1dKf/BiMiMj+N7ttAVDEpM4tWbwMgC2RARxbXClrliQ41wZ+apqVYaZ2Z+WnaO76W6pi1agCZoD7uJaivs1tco91xWdrXfE2PYL7cH8DPrEIlbkVWujkNlnddSIGWMGKMrjgZuiB/1rob5Qq0B0JF4RokTF2OXnHDl7cHFWmIN9N/BhjTGNIQKL5AvC1HAUp75mAMDYtbhZGdDUDeegoXUsMbB9DaQyd4G/Pj/NAig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rJYSQAWK; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rJYSQAWK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d5wXm31hnz2yhD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Nov 2025 18:49:43 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AC5163a023600;
	Wed, 12 Nov 2025 07:49:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=IeasLi6tJZCSJTT4jvd92KlZnCpNxzwF6qmUZxsIb
	Qc=; b=rJYSQAWKI4Z3VDtNF2RBgy4ytm432/dBkUiCf9Es7Dms0gfhT3QKSoEfN
	vk3gAVtFLp1LJGhkAHc0yQdHtE6HVTw6CUV/UST57Xt2+q1JT8PKC0NnzM1RqZVi
	J7IuKk09xVH8Fb5o59SLBE8ZAHVdmCyIe4BTumhHSKcRd2LfZr3zfnQdX8vE536z
	vD6CptqcVpAu/6Nydcw2smna3jm0v8M5Dhc+VgHDhZxRyNqewSj91GffWG0v9Dk3
	X31tzP9v1jOzriwfc6vyF43Z0FF7fe3xSrMDdgaOTJQTuXMFivhcrdEuh7eN4+Aq
	mLCxKn6HO04eWWZsN5fqjQFBWZ7HA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aa5tjxte7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Nov 2025 07:49:10 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AC7klnU028890;
	Wed, 12 Nov 2025 07:49:10 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aa5tjxte5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Nov 2025 07:49:09 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AC63SSK011605;
	Wed, 12 Nov 2025 07:49:09 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4aajw1en3w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Nov 2025 07:49:09 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AC7n5d238273446
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Nov 2025 07:49:05 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EA53A2004D;
	Wed, 12 Nov 2025 07:49:04 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3644420043;
	Wed, 12 Nov 2025 07:49:03 +0000 (GMT)
Received: from sapthagiri.in.ibm.com (unknown [9.124.211.234])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 12 Nov 2025 07:49:03 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-kernel@vger.kernel.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Shrikanth Hegde <sshegde@linux.ibm.com>,
        Srikar Dronamraju <srikar@linux.ibm.com>
Subject: [PATCH v2] powerpc/smp: Expose die_id and die_cpumask
Date: Wed, 12 Nov 2025 13:18:59 +0530
Message-ID: <20251112074859.814087-1-srikar@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
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
X-Proofpoint-GUID: xlvXidZWXkvSHj8_-mOPw2qUXunJhQmV
X-Proofpoint-ORIG-GUID: RTVaL4WkZMBbQz6x-ys6VvuZQGxdabJA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDA5OSBTYWx0ZWRfX6AeVpa4QxTcB
 naEcD8QMCaiv5o/5rK7OHemX7k0Zk81tCPeCsuB7lXR3Q8f7c3qmq9azhKyq9ElL1tUDYllqRi1
 60+VSbMC62Vh5nOvQZxvrGN3rAA/Olf/iw5/aICJwXCvr5ckgc6yV893ZgHWuHugBzM2rRzxW5/
 BAWmELDbOj0J4vdkkQHPGr4R4xzU81bmUVYqQutz3Wjzuz/C4yfZ7JXC9dCX29lkxicqbFeUhst
 JImktDeRHDvpbIuiXahld8ubQssLCvnc9DKODpT6rudAD2McGwfxZ5aF+rQ6HL+R++ZD9A+8X1f
 4R6VCBhjeZlTvj8w192fu3xOfaSW2Bdqi2Euwv3Ki48UbyBO8aaeuA0TSrqNGfTZVleIupJmon8
 8npIYVwpNCobIFjY7LniFXlpT46caw==
X-Authority-Analysis: v=2.4 cv=V6xwEOni c=1 sm=1 tr=0 ts=69143bf6 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=_0LhuuOVu_CDEUY1ngwA:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_02,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511080099
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From Power10 processors onwards, each chip has 2 hemispheres. For LPARs
running on PowerVM Hypervisor, hypervisor determines the allocation of
CPU groups to each LPAR, resulting in two LPARs with the same number of
CPUs potentially having different numbers of CPUs from each hemisphere.
Additionally, it is not feasible to ascertain the hemisphere based
solely on the CPU number.

Users wishing to assign their workload to all CPUs, or a subset of CPUs
within a specific hemisphere, encounter difficulties in identifying the
cpumask. To address this, it is proposed to expose hemisphere
information as a die in sysfs. This aligns with other architectures
and facilitates the identification of CPUs within the same hemisphere.
Tools such as lstopo can also access this information.

Please note: The hypervisor reveals the locality of the CPUs to
hemispheres only in dedicated mode. Consequently, in systems where
hemisphere information is unavailable, such as shared LPARs, the
die_cpus information in sysfs will mirror package_cpus, with
die_id set to -1.

Without this change.
$ grep . /sys/devices/system/cpu/cpu16/topology/{die*,package*} 2>/dev/null
/sys/devices/system/cpu/cpu16/topology/package_cpus:000000,000000ff,ffff0000
/sys/devices/system/cpu/cpu16/topology/package_cpus_list:16-39

With this change.
$ grep . /sys/devices/system/cpu/cpu16/topology/{die*,package*} 2>/dev/null
/sys/devices/system/cpu/cpu16/topology/die_cpus:000000,00000000,00ff0000
/sys/devices/system/cpu/cpu16/topology/die_cpus_list:16-23
/sys/devices/system/cpu/cpu16/topology/die_id:2
/sys/devices/system/cpu/cpu16/topology/package_cpus:000000,000000ff,ffff0000
/sys/devices/system/cpu/cpu16/topology/package_cpus_list:16-39

snipped lstopo-no-graphics o/p
  Group0 L#0 (total=8747584KB)
    Package L#0 (total=3564096KB CPUModel="POWER10 (architected), altivec supported" CPURevision="2.0 (pvr 0080 0200)")
      NUMANode L#0 (P#0 local=3564096KB total=3564096KB)
      Die L#0 (P#0)
        Core L#0 (P#0)
<snipped>
    Package L#1 (total=5183488KB CPUModel="POWER10 (architected), altivec supported" CPURevision="2.0 (pvr 0080 0200)")
      NUMANode L#1 (P#1 local=5183488KB total=5183488KB)
      Die L#2 (P#2)
        Core L#2 (P#16)
          L3Cache L#4 (size=4096KB linesize=128 ways=16)
            L2Cache L#4 (size=1024KB linesize=128 ways=8)
              L1dCache L#4 (size=32KB linesize=128 ways=8)
                L1iCache L#4 (size=48KB linesize=128 ways=6)
                  PU L#16 (P#16)
                  PU L#17 (P#18)
                  PU L#18 (P#20)
                  PU L#19 (P#22)
          L3Cache L#5 (size=4096KB linesize=128 ways=16)
            L2Cache L#5 (size=1024KB linesize=128 ways=8)
              L1dCache L#5 (size=32KB linesize=128 ways=8)
                L1iCache L#5 (size=48KB linesize=128 ways=6)
                  PU L#20 (P#17)
                  PU L#21 (P#19)
                  PU L#22 (P#21)
                  PU L#23 (P#23)
      Die L#3 (P#3)
        Core L#3 (P#24)
          L3Cache L#6 (size=4096KB linesize=128 ways=16)
            L2Cache L#6 (size=1024KB linesize=128 ways=8)
              L1dCache L#6 (size=32KB linesize=128 ways=8)
                L1iCache L#6 (size=48KB linesize=128 ways=6)
                  PU L#24 (P#24)
                  PU L#25 (P#26)
                  PU L#26 (P#28)
                  PU L#27 (P#30)
          L3Cache L#7 (size=4096KB linesize=128 ways=16)
            L2Cache L#7 (size=1024KB linesize=128 ways=8)
              L1dCache L#7 (size=32KB linesize=128 ways=8)
                L1iCache L#7 (size=48KB linesize=128 ways=6)
                  PU L#28 (P#25)
                  PU L#29 (P#27)
                  PU L#30 (P#29)
                  PU L#31 (P#31)
        Core L#4 (P#32)
          L3Cache L#8 (size=4096KB linesize=128 ways=16)
            L2Cache L#8 (size=1024KB linesize=128 ways=8)
              L1dCache L#8 (size=32KB linesize=128 ways=8)
                L1iCache L#8 (size=48KB linesize=128 ways=6)
                  PU L#32 (P#32)
                  PU L#33 (P#34)
                  PU L#34 (P#36)
                  PU L#35 (P#38)
          L3Cache L#9 (size=4096KB linesize=128 ways=16)
            L2Cache L#9 (size=1024KB linesize=128 ways=8)
              L1dCache L#9 (size=32KB linesize=128 ways=8)
                L1iCache L#9 (size=48KB linesize=128 ways=6)
                  PU L#36 (P#33)
                  PU L#37 (P#35)
                  PU L#38 (P#37)
                  PU L#39 (P#39)
  Group0 L#1 (total=7736896KB)
    Package L#2 (total=5170880KB CPUModel="POWER10 (architected), altivec supported" CPURevision="2.0 (pvr 0080 0200)")
      NUMANode L#2 (P#2 local=5170880KB total=5170880KB)
      Die L#4 (P#4)
<snipped>

Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>
Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
---
Changelog v1: v2:
v1: https://lore.kernel.org/all/20251028105734.1894998-1-srikar@linux.ibm.com/t/#u
Updated changelog and few nits as suggested by Shrikanth

 arch/powerpc/include/asm/topology.h | 11 +++++++----
 arch/powerpc/kernel/smp.c           | 23 +++++++++++++++++++++++
 2 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
index f19ca44512d1..66ed5fe1b718 100644
--- a/arch/powerpc/include/asm/topology.h
+++ b/arch/powerpc/include/asm/topology.h
@@ -132,15 +132,18 @@ static inline int cpu_to_coregroup_id(int cpu)
 #include <asm/cputable.h>
 
 struct cpumask *cpu_coregroup_mask(int cpu);
+const struct cpumask *cpu_die_mask(int cpu);
+int cpu_die_id(int cpu);
 
 #ifdef CONFIG_PPC64
 #include <asm/smp.h>
 
 #define topology_physical_package_id(cpu)	(cpu_to_chip_id(cpu))
-
-#define topology_sibling_cpumask(cpu)	(per_cpu(cpu_sibling_map, cpu))
-#define topology_core_cpumask(cpu)	(per_cpu(cpu_core_map, cpu))
-#define topology_core_id(cpu)		(cpu_to_core_id(cpu))
+#define topology_sibling_cpumask(cpu)		(per_cpu(cpu_sibling_map, cpu))
+#define topology_core_cpumask(cpu)		(per_cpu(cpu_core_map, cpu))
+#define topology_core_id(cpu)			(cpu_to_core_id(cpu))
+#define topology_die_id(cpu)			(cpu_die_id(cpu))
+#define topology_die_cpumask(cpu)		(cpu_die_mask(cpu))
 
 #endif
 #endif
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 68edb66c2964..338142cd97db 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1085,6 +1085,29 @@ static int __init init_big_cores(void)
 	return 0;
 }
 
+/*
+ * die_mask and die_id are only available on systems which support
+ * multiple coregroups within a same package. On all other systems, die_mask
+ * would be same as package mask and die_id would be set to -1.
+ */
+const struct cpumask *cpu_die_mask(int cpu)
+{
+	if (has_coregroup_support())
+		return per_cpu(cpu_coregroup_map, cpu);
+	else
+		return cpu_node_mask(cpu);
+}
+EXPORT_SYMBOL_GPL(cpu_die_mask);
+
+int cpu_die_id(int cpu)
+{
+	if (has_coregroup_support())
+		return cpu_to_coregroup_id(cpu);
+	else
+		return -1;
+}
+EXPORT_SYMBOL_GPL(cpu_die_id);
+
 void __init smp_prepare_cpus(unsigned int max_cpus)
 {
 	unsigned int cpu, num_threads;
-- 
2.43.7


