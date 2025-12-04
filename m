Return-Path: <linuxppc-dev+bounces-14616-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDAECA4D42
	for <lists+linuxppc-dev@lfdr.de>; Thu, 04 Dec 2025 18:57:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMhyX2bRSz2yDY;
	Fri, 05 Dec 2025 04:56:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764870980;
	cv=none; b=C7WCvQBPibohnBxsCnhN/v879B70L3C49489hFuLtoDycJEN7LXoJGyqqpkj8n8hqBsAZO/dqakQZuoPJFF5N5YoFdCCj3NNPJaA542S9BB9CvleohoyyrGPgpTQqkVgp4dbUemwWziH8qIKJMBrjpgK+Awjua9BQpiv+5avrBBVGHFTGqDbdVv/s8hhHQ4Z0fEKRGEzxwN3VXfTT9+E6w9o1HFY7UYo/Sf34LAvOKbqzv5v5K/fYdbcZiHb20Henz26iQY+f/fy1PKFBNjVPr3ToG40r70HPaOlTj+AydLa8Sx1yY7MuCOjNevK3blj6vx0Z9bT4TPebAVP6ykcPw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764870980; c=relaxed/relaxed;
	bh=Ndrrcx1O9Y/Vz03DaIShxn4p1fkYnsBk7V1KxQMIrAI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S5V7c8VSGGUER69VaAmbyTyxcRpCbMMsKRyBHPMrrSwbteDPcrrPWkLCJBYSpUolxVGxHpDpu4yhxx76DE0oX4DB5esAkNJuPURNJ1cKiUFBp1+q2YzAejnZAOKa7Yqe96EwOmY8/IXhLD/pJsWGSNNavdgB42uJhWtQQr7f+k/AdpcPV1dJw4ZF0QUltyAQ/KMH15gK8U9af8j2ZfMYU2yDXoSLI0mJHemYVT95oNf0WrK9PrHOQzsRBI9IZBc7NGx9HP2Q9zsFnHUbam9ss008SojwArwQOl2apghyyjvI4ONCVcv4iaR1S/bj5X4y8VHMVIEssH6agGyFdKrYSg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AGrqVwjg; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AGrqVwjg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dMhyW4nrqz2xLR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Dec 2025 04:56:19 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5B4DbUPJ027754;
	Thu, 4 Dec 2025 17:55:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=Ndrrcx1O9Y/Vz03Da
	IShxn4p1fkYnsBk7V1KxQMIrAI=; b=AGrqVwjg2dzbunMJYse9z2Q4yVYiTYDJP
	vw3I1i++cHePBfG0VvCjqFSmwJp5mQ4aPNUDJlS5XM+bqx+kTJ0ausRGaJ6dATWO
	PATRN/4nMFsZuKdpaOiqwcF39Py1QCop5DGsKySswkJzx8k671qCTHNbsYhOa0u2
	/fqMMyKZ8NNUsHTVrUX2sADSUymqGmM/ooOEm2QZTfmvhG2pg9QlxY/i/+R8J8X2
	anFDj4aoJzldJFv4WuQjDAwg+zclbcO+S6JsRb4QLtrEaqDgXrrhg7FDAPhBrz2J
	5AqPk63tTVHd0GEC1CfaxBzFkOy3GNBEdVdLtbWbHmCswOecBBRFg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqp8q9e58-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:55:53 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5B4Hk24C031925;
	Thu, 4 Dec 2025 17:55:53 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqp8q9e53-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:55:52 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B4FiU9t010227;
	Thu, 4 Dec 2025 17:55:52 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4arcnkh2t1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:55:51 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5B4Htl9H60293626
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 4 Dec 2025 17:55:48 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C780320043;
	Thu,  4 Dec 2025 17:55:47 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 54A2720040;
	Thu,  4 Dec 2025 17:55:44 +0000 (GMT)
Received: from sapthagiri.in.ibm.com (unknown [9.39.29.188])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  4 Dec 2025 17:55:44 +0000 (GMT)
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
Subject: [PATCH 09/17] powerpc/smp: Implement arch_scale_cpu_capacity for shared LPARs
Date: Thu,  4 Dec 2025 23:23:57 +0530
Message-ID: <20251204175405.1511340-10-srikar@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDAwMCBTYWx0ZWRfX2cPI5z1HXWzy
 qV5ExdlzYTaDfqFxWJdGjU4UfSQ75FBUqL7CiqEymyTjVn8NerSpT5BIfExtKb2q1uubx1Nf/6b
 7A06Q7wJmhlGTyu3pmSofSvqwxwB77nT4sse81NbP5LJ7CNZHxlxGNDsLuDyOMFf2LnPAigDXNn
 vkAZbFbZnVFXP5wGCkn89eb6dMYvwXVlj07PO20nHI+MYeiaWeKVLTgHlPnCGwcb83D3SGxTad9
 2yqcnT/r7kXbcX6j+RlhZCD8xCLRezm/9OliY7PKzos5xB3jh++gC0g5tRQYsl6NUepp+ZvktxJ
 KbflRX2D9XIZK7ScFHEUdjFOVfB5WixAd2g401U21CJpgGpd4V5v7YXCBCcMTYq6nQ1T3qkdhYT
 WMpSCwp7bOyedFRZ6Paoza1WOk5yiw==
X-Authority-Analysis: v=2.4 cv=dIerWeZb c=1 sm=1 tr=0 ts=6931cb29 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=oq048o8STzGrlCM9ncQA:9
X-Proofpoint-ORIG-GUID: 23B6ub71QgzygcDZbRocq0TUB4x15cgd
X-Proofpoint-GUID: DG6BoV-zGkVac9lbvnZkjTSBW46qxC_l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_04,2025-12-04_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511290000
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

If a CPU is soft-offlined, then its marked as in-active CPU.
On a shared LPAR, reduce that CPU's capacity. This will force the Linux
kernel scheduler's load balancer to prefer CPUs with higher capacity.

Setting the capacity to be low also helps the scheduler in load
balancing. If there are 2 equal groups of CPUS but if one group has more
inactive CPUs compared to the other, then setting to low capacity will
make the scheduler schedule more tasks on the group with more active
CPUs.

However tasks pinned on that particular CPU (or set of CPUs that are all
marked as inactive) will continue to run on the same CPU.

Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
---
 arch/powerpc/include/asm/topology.h |  5 +++++
 arch/powerpc/kernel/smp.c           | 17 +++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
index f19ca44512d1..031c067fc820 100644
--- a/arch/powerpc/include/asm/topology.h
+++ b/arch/powerpc/include/asm/topology.h
@@ -174,5 +174,10 @@ static inline bool topology_is_core_online(unsigned int cpu)
 }
 #endif
 
+#ifdef CONFIG_PPC_SPLPAR
+#define arch_scale_cpu_capacity arch_scale_cpu_capacity
+unsigned long arch_scale_cpu_capacity(int cpu);
+#endif
+
 #endif /* __KERNEL__ */
 #endif	/* _ASM_POWERPC_TOPOLOGY_H */
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 016dc7dc5bbc..c269b38dcba5 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1811,3 +1811,20 @@ void __noreturn arch_cpu_idle_dead(void)
 }
 
 #endif
+
+#ifdef CONFIG_PPC_SPLPAR
+#define MIN_CAPACITY 1
+
+/*
+ * Assume CPU capacity to be low if CPU number happens be above soft
+ * available limit. This forces load balancer to prefer higher capacity CPUs
+ */
+unsigned long arch_scale_cpu_capacity(int cpu)
+{
+	if (is_shared_processor() && !is_kvm_guest()) {
+		if (!cpu_active(cpu))
+			return MIN_CAPACITY;
+	}
+	return SCHED_CAPACITY_SCALE;
+}
+#endif /* CONFIG_PPC_SPLPAR */
-- 
2.43.7


