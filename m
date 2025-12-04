Return-Path: <linuxppc-dev+bounces-14612-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F577CA4D2D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 04 Dec 2025 18:56:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMhyK5TGqz2xlP;
	Fri, 05 Dec 2025 04:56:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764870969;
	cv=none; b=KLQ/MXusDk47PCd0uMTQ0wfSSTt82YhKCI8oBG3uqarFdjKIVZvFXX4grw++l3yqzqv8u03PCMB4NpSetOShc4ZB9sBcdsGSiwzlEu4iQGgx04f1pKbDG6Ksjklp7IR2Bhk6SMSgHJL0NdSpQCQTUkPe8QAxAKqh8fCm8m5NrPN5j/hWGedF6bNet3XKYMS227/v2Gk0dhF3sqRP2BoRXRLNVmDdmSqXziZmC0KcS9g1i+32htO+bMXgF2bbuTioGmkvST+ExuK47GHsHU90Pw56DLXxm0jh3ufrwofAHUXoqc0QLdYB1t7akODTY6kPysKB3SkmRuMWMLAfKG8vCA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764870969; c=relaxed/relaxed;
	bh=kMTJ/GDQee/iBpeJERuosO4o6/1bcvJe+OVqpZx+BcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VwvyOoeVCYb4Bx3ippdDgnVX2QkWUU5ZcqCzF8xJCAXqrx+JLS70B4nQC5RVmMbX/YPgKuXBvLug+JDfmCSozrRqQF0Vm3gzJ+XADVHrPcVd2tUm5XDalq4lFfHW27Fb6dUJjUx3+wzVcy2hW3Rv1zxk84SC9xQG2Zp4EGd4D1p8gXu9k8+p77OIrTTmXlM+Fz/HKzij341wa0LKfCqZwzztZzKvtuMIKVYfh87LwmgKF/rmEadO/4figWk9adDZVPfgt8W8vRcYturT8qv6DZWDVooUfRb7HIj0xIvlpwnJtPC2LeqLn2tek3XjtUWGV8gn+NPx/gvtfQodjdmVBQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tJdEv8iK; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tJdEv8iK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dMhyK0y3fz2xJ8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Dec 2025 04:56:08 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5B4E3eQ3022200;
	Thu, 4 Dec 2025 17:55:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=kMTJ/GDQee/iBpeJE
	RuosO4o6/1bcvJe+OVqpZx+BcE=; b=tJdEv8iKDMtHlahfsPwncQkbQyMQr1olp
	JdUikeCRF6LKXsnlOURYwnzaXFd1djG8o0xmQrgkIIHSQgYKVd2xo7COOJnL2hQz
	TTy/Jv6NRfrs5SBLt1ElJz82loAiqnlypnm9sbCCM4rzhZRYL7K5cYZ7uyU6wMno
	lZ8oJhmgBfBT/pkEkvcHpmy3b8hwZpdcq1OXW09v8INv8nwWc0Vc6oS/zFMF8mLq
	+wFDuL4/rcXjGQX15m7tr1pNgE6/nd6oG2ZBatjDFvXYQiGFndiVfpciT7RUuyiD
	SAKnDMW73yjUwHhWbA3HLmVvSwtCrYkFOPFmscXpYNgTi0cxbjahw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqrbgj16v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:55:41 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5B4HrSU7020699;
	Thu, 4 Dec 2025 17:55:41 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqrbgj16s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:55:41 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B4FhhkX029343;
	Thu, 4 Dec 2025 17:55:40 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ardv1rvad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:55:40 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5B4Htanf41812374
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 4 Dec 2025 17:55:36 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 47D0820043;
	Thu,  4 Dec 2025 17:55:36 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C8CB420040;
	Thu,  4 Dec 2025 17:55:32 +0000 (GMT)
Received: from sapthagiri.in.ibm.com (unknown [9.39.29.188])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  4 Dec 2025 17:55:32 +0000 (GMT)
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
Subject: [PATCH 06/17] powerpc/smp: Delay processing steal time at boot
Date: Thu,  4 Dec 2025 23:23:54 +0530
Message-ID: <20251204175405.1511340-7-srikar@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: MyEZB6I1h3psUYLHXo3Fj1mnYlU4LXID
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDAxNiBTYWx0ZWRfX9mAN1DMg/KdM
 bjfa5FCzbcEXEJnh/L9rdqDmE5hN00qLm0grGS+L6/qxDG48sNRL9TElmkbyEV3hcvmF7TVWO1r
 rPPs2Ic/1K39u449+WtxUwH112eqs7aMDBoePynpyj55o8hJUcIgAWtfkpgekAO/lS9Cot+f2Qj
 wj+x1hgu+rj1HXigjFFMaikL/H30J/Bn1YumnB9QoekwrcTSPaqELjzUBRwdMIw8YL75UCZ4vr9
 gsfNl+BL2OlVSHzMb6AKpe37yLUpVl1PsmU/e3kB4dan6/ZTXScMMzNTaGNk23nIocjMd+Lz7qU
 pPHZitg09Yr0Im+EOS5hDkbg06myvg/k9q9EVXHbWykI+QqAxslvpCF9bIotHyh9pI7POyh89F8
 jwpNp8k1oeJ+X3tHV46DzX7vNF0HWw==
X-Authority-Analysis: v=2.4 cv=UO7Q3Sfy c=1 sm=1 tr=0 ts=6931cb1d cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=1EFQ6eh71MqxaOUTsigA:9
X-Proofpoint-GUID: P-pgooUrMI7eb-N5SDgr-iSEfULqXNy9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_04,2025-12-04_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511290016
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Before processing steal metrics, system also needs to know the number of
entitled CPUs. Till that time, delay the steal processing till the time
entitlement information is available.

Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
---
 arch/powerpc/kernel/smp.c             | 8 ++++++++
 arch/powerpc/platforms/pseries/lpar.c | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index c33e9928a2b0..016dc7dc5bbc 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -82,6 +82,9 @@ bool has_big_cores __ro_after_init;
 bool coregroup_enabled __ro_after_init;
 bool thread_group_shares_l2 __ro_after_init;
 bool thread_group_shares_l3 __ro_after_init;
+#ifdef CONFIG_PPC_SPLPAR
+bool process_steal_enable __ro_after_init;
+#endif
 
 DEFINE_PER_CPU(cpumask_var_t, cpu_sibling_map);
 DEFINE_PER_CPU(cpumask_var_t, cpu_smallcore_map);
@@ -1736,6 +1739,11 @@ void __init smp_cpus_done(unsigned int max_cpus)
 #ifdef CONFIG_PPC_SPLPAR
 	if (smp_ops->num_available_cores)
 		smp_ops->num_available_cores();
+
+	if (is_shared_processor() && !is_kvm_guest())
+		process_steal_enable = true;
+	else
+		process_steal_enable = false;
 #endif
 }
 
diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 3431730a10ea..f8e049ac9364 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -674,6 +674,7 @@ static bool should_cpu_process_steal(int cpu)
 	return false;
 }
 
+extern bool process_steal_enable;
 static void process_steal(int cpu)
 {
 	static unsigned long next_tb, prev_steal;
@@ -682,6 +683,9 @@ static void process_steal(int cpu)
 	unsigned long steal = 0;
 	unsigned int i;
 
+	if (!process_steal_enable)
+		return;
+
 	if (!should_cpu_process_steal(cpu))
 		return;
 
-- 
2.43.7


