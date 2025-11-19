Return-Path: <linuxppc-dev+bounces-14349-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 119A8C6E8BB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 13:45:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBLmm6gX2z3cfY;
	Wed, 19 Nov 2025 23:45:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763556328;
	cv=none; b=UqwzhespnndWKIjZ9unbTwPCHLkyXTI2ta5oDU77/j9qNKJcSoyQB+I3zwI1rSlQxfq1toAtQCajIEu/Cf99Y2U2NgyycGZimbK1+/dkbFlpAZthoQ88E8Qu7S50hGNM1WehMfP6teCaJNi6txbIErp2LqJ03kVcKAjlLrhyzzibn5zAmUghvt75xquEL/LPAzEGQAP3KhVAx+eqrZdBYRA/qVnvE6zHj3qPoi2dKVrcauTKqrST6o/w/+sTaA/MfkkyYkm7p32wvboIAJI5ouYTKtisY67XwigIKHPtfQFXn4ARcnxKugmLnKiHCXtZjutVpPu0qxGPkyKJdNHa6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763556328; c=relaxed/relaxed;
	bh=SsxUtQuljbB31H4Vb1A8/PH/i69O3OULsuRsxx0vaAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M+k4Vdth4IGGXAJ1hkESj7QmZen2yJsPUao9u+E0A2CArEf7I4FWaOj6KKtWCkvwI2tm0/FhZrA7UyZmIGR6kce2mRikj3Ep+lkq8Q0PcyAWz5zwRT54cX3Hw4k8nmKcEDRBqc+1I9+v7MoaCoReqD63gjRwszvR6PNErxkBZXFaiMyMsAy1nyOrMOTER24d45CWdLO7MJYYX8oCH/1+3Ge5PXcTakCPSzZdPV+APxe+8L7UKLw05706mnOYq1kSbLvyvp4a9iqJF6r94T1vLrvTd0OZmLaTvVyTNGd4BrXO5bx1eLoyGWmQPEJd9U+/N6cQJqFF+J2G2JV/3Nu/GA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YSluk9rF; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YSluk9rF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBLmm0zs7z3c9l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 23:45:27 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ9wdM8019708;
	Wed, 19 Nov 2025 12:45:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=SsxUtQuljbB31H4Vb
	1A8/PH/i69O3OULsuRsxx0vaAs=; b=YSluk9rFqcOa+A1A7G273GtHp4Q5SiAkG
	shKm+DwU3EoPtQisnrTywQ5V6PgYU2LEYvVGVYwYvUXp9y7APzCZDRLObUWhnWQ+
	PHy1tb7X9MIKjRdq2UksHiUAkuVwouAS6gcjNBIx6L0ygju5hcMOwj6+l3OBOetR
	bCKc8XZtzqomcrYIJxRIsgILktlpUj/xJXWxAoig3ci3mYf97J379qNcXU1t0hP6
	q9tHw0EcvFP++lc0HQ+cdtWeGDFKZOxDpbjcAqe+qLitcXnOznrkzlMoIdLF83Gc
	x0lCwvuhKzKp5BEjYpmrDtjxDpHbyDIw5XGVeVQdefMSNoD7ghPyQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejgwym99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:45:12 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AJCjC1v032011;
	Wed, 19 Nov 2025 12:45:12 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejgwym96-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:45:12 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJBiPhr022311;
	Wed, 19 Nov 2025 12:45:11 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4af4un0n15-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:45:11 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AJCj7d156951046
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Nov 2025 12:45:07 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7DF1F20043;
	Wed, 19 Nov 2025 12:45:07 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8DA7F20040;
	Wed, 19 Nov 2025 12:45:03 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.25.220])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Nov 2025 12:45:03 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org, tglx@linutronix.de,
        yury.norov@gmail.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
        gregkh@linuxfoundation.org, pbonzini@redhat.com, seanjc@google.com,
        kprateek.nayak@amd.com, vschneid@redhat.com, iii@linux.ibm.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH 02/17] cpumask: Introduce cpu_paravirt_mask
Date: Wed, 19 Nov 2025 18:14:34 +0530
Message-ID: <20251119124449.1149616-3-sshegde@linux.ibm.com>
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
X-Proofpoint-GUID: MtzTJCe4lQpT_P7m9pyhjr-5a8YqBN_W
X-Authority-Analysis: v=2.4 cv=YqwChoYX c=1 sm=1 tr=0 ts=691dbbd9 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=PotXWsJoChvkt9Z01ZEA:9
X-Proofpoint-ORIG-GUID: lZnDUJjFBBriO7zlrR7s22hKBPnaPJag
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX7fDfPyhBOSJU
 iR7amjyJmckyUrUwRe20L3rkj+I3sDPhy1ipz+v8wyQOG53PhiPf5cM7WPY1jHXip0c9eGWicB2
 RyOEnOcSqJ19ourib02haMBg+MYsKsqhcOCssD2G++h4ohRDqo7i+0HoWTVHV8cSfas66/n3W2/
 m+tckKMvQCGccbaufnpBcBjwPp44u3EGYvFdPpJ44DrE70di1K19Hd45br6tF6BMDSb4Y4gQ8+U
 UfYOU2xjqCWOuORN1btWyLVw8t+9p3smxnZs5JYQM7auLYv3OsC0BcIqs5dR6AlnYPQlWgOsbCC
 e/fF/2VOYs6MCvqKdf/7/7Cly3/Vj/LUj5afeqmoiwogNF6Ze948/lX9LxnukMSosCglVUDynkR
 HNx3Q2YIAhXR79A9V6K6qsS0Sxru2w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This patch does
- Declare and Define cpu_paravirt_mask.
- Get/Set helpers for it.

Values are set by arch code and consumed by the scheduler.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 include/linux/cpumask.h | 20 ++++++++++++++++++++
 kernel/sched/core.c     |  5 +++++
 2 files changed, 25 insertions(+)

diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
index ff8f41ab7ce6..079903851341 100644
--- a/include/linux/cpumask.h
+++ b/include/linux/cpumask.h
@@ -1270,6 +1270,26 @@ static __always_inline bool cpu_dying(unsigned int cpu)
 
 #endif /* NR_CPUS > 1 */
 
+/*
+ * All related wrappers kept together to avoid too many ifdefs
+ * See Documentation/scheduler/sched-arch.rst for details
+ */
+#ifdef CONFIG_PARAVIRT
+extern struct cpumask __cpu_paravirt_mask;
+#define cpu_paravirt_mask    ((const struct cpumask *)&__cpu_paravirt_mask)
+#define set_cpu_paravirt(cpu, paravirt) assign_cpu((cpu), &__cpu_paravirt_mask, (paravirt))
+
+static __always_inline bool cpu_paravirt(unsigned int cpu)
+{
+	return cpumask_test_cpu(cpu, cpu_paravirt_mask);
+}
+#else
+static __always_inline bool cpu_paravirt(unsigned int cpu)
+{
+	return false;
+}
+#endif
+
 #define cpu_is_offline(cpu)	unlikely(!cpu_online(cpu))
 
 #if NR_CPUS <= BITS_PER_LONG
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 9f10cfbdc228..40db5e659994 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -10852,3 +10852,8 @@ void sched_change_end(struct sched_change_ctx *ctx)
 		p->sched_class->prio_changed(rq, p, ctx->prio);
 	}
 }
+
+#ifdef CONFIG_PARAVIRT
+struct cpumask __cpu_paravirt_mask __read_mostly;
+EXPORT_SYMBOL(__cpu_paravirt_mask);
+#endif
-- 
2.47.3


