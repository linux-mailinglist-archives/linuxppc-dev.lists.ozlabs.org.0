Return-Path: <linuxppc-dev+bounces-9784-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8D7AE8E2B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 21:12:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSBJw0sPvz30Vl;
	Thu, 26 Jun 2025 05:12:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750878736;
	cv=none; b=RJJlI54J0ywgdltOaHr8FPWdKWsI+9nwzDAbuOdD6Apl294NYXbXanYJXQWHZtEY38oY/xxst1+Q50vbpOP5/oGmELdu0A8h6AGgs8nCHt4e/HKwEKcjcTlZFobuoTSgfxI7bwaJCf0f0z/F+Mmpxysuc+cBKVSU6bw/6iWGNhOxqOi9nba+VRUvTq7gd5g/tEzI/StslET2PmHTjzaZtrjp05oZNYnHXPWrchERzBSXl58aXHZf4M1r5Ypz4Uk1bSGPgok8mhTSqHzCfqGDt+AOP6vxCYa6IGH7sOLKwNrDlejZi1YjmOU8T+R6tB4kbXQ7aa+5ydD4ULAgoWu70A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750878736; c=relaxed/relaxed;
	bh=GHer5xhnBVAf9AAcFjfq5ZgcgMov2g/1t4b6uVEZ2sg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KuMh/RAahtWPjT760a9Lwt8S9Sc916lz1UpgF+MAaZJFtA/F2AU8CunqhT43DfweJbkA4/S/Aa95wEs8o4eVISH8m7KxJc03SLaa69+OBOQWTumYZ1hIBPx1tGCWIc0wiiUBPK89bJcJv7N1W0oDn9CdUpZ/ecSd5X678ZeGKH/zOdfZ6MvkckpMDSl6dFR8gkJuiRDFoVHqylntZuAzPR5IYjfwlyxqTinUD06uU3n21CFQ0vw75pU5d247NUo/iUmGbPvlLlf9aETMpoTkt/+DswKVH6RXmT2ukqK3FTl0iS/AUqiBdEqpMxq21ZaDbzp0aTJ4fQoyMx9TV/OFGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cU4u2gwf; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cU4u2gwf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSBJv2FmXz30KY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 05:12:15 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PIjF8F021390;
	Wed, 25 Jun 2025 19:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=GHer5xhnBVAf9AAcF
	jfq5ZgcgMov2g/1t4b6uVEZ2sg=; b=cU4u2gwfrbwbmauS1L3Q0hP6pCxUk7jQQ
	8pN39+2FEXcwhQYesPmYz9aBmg7ic/4ydYy1dyyVs/3Ij4gEiqi4auyket/diAEG
	RguLIn1QMf1qSQVWWhOqvxeAyLHKJP5rjU3/jX6k4NQ6S17vaKNEpklnrxLy40Ci
	I7v1EwIqTgwntX1EPCSiOtTFGum767xpaDu90l0KDNVOE1rewZO7cbXGNdqmf1hz
	WOC4JFK8kzwukIB9UUOwCPOU5YPKDpqFSH6CK62/0FXdyqgx+XHd8ls9f7QCvlNB
	xI8uAW5V4VFxcfnCEOTDir2MJbQvg8A3dm9HY3AKRuAxDou5LItPg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dj5u1e83-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 19:11:41 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55PJ3HWZ012306;
	Wed, 25 Jun 2025 19:11:41 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dj5u1e7y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 19:11:40 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55PHm8qK002502;
	Wed, 25 Jun 2025 19:11:40 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47e8jmasck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 19:11:40 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55PJBajD43581934
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 19:11:36 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 07D7520043;
	Wed, 25 Jun 2025 19:11:36 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 67E0420040;
	Wed, 25 Jun 2025 19:11:32 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.124.209.143])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Jun 2025 19:11:32 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, tglx@linutronix.de, yury.norov@gmail.com,
        maddy@linux.ibm.com
Cc: sshegde@linux.ibm.com, vschneid@redhat.com, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, kprateek.nayak@amd.com, huschle@linux.ibm.com,
        srikar@linux.ibm.com, linux-kernel@vger.kernel.org,
        christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org,
        gregkh@linuxfoundation.org
Subject: [RFC v2 2/9] cpumask: Introduce cpu_avoid_mask
Date: Thu, 26 Jun 2025 00:41:01 +0530
Message-ID: <20250625191108.1646208-3-sshegde@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: dE9UtAVDRPTezjRgirKRyHN9rZp5_v0i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MSBTYWx0ZWRfX/UKBIUdc5CFJ npscVWmTiaWEZb8I2RHf2qPH94MOtjHrFraxwYledlw9DYyJ1xA3JHiG6MmvG0E9RcaCblO23MI gC9ec4PIWBGZZz0BSyqbOOPqRbm+aUwxoAn/cckUrEHdm3LS/lHSGQqWkG//+oo6uqrCWVz4TZB
 N+AaYwjzrEbS0B2vbJMlQWDnpECM0GDj/Fo4AINce6WDhVgo1QFqA8h8XjX5An+19MR1a5C1NzM QBygdnjcGXDNbgRkwIpLgyCce5YxPJ49PkAfZziZGlI8zkXyyxvcAbSQt0nuQPaVdsO3xmVINK8 LmVZGHbRRcNFDB+w+pIMeMZ+qWgAypP/BGVgxqtZQkrdixQylTbuiqpqAKs0uHU5OyULvI6g40Z
 WTclGm8WuvAXJmuluZQB+0oIx3eP8Y+2wnRSWwcFD6oyOBmsAzXwRzYN2FC/Fwxp7ba2lbel
X-Authority-Analysis: v=2.4 cv=MshS63ae c=1 sm=1 tr=0 ts=685c49ed cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=43edTZbtrg5bJSvecBcA:9
X-Proofpoint-GUID: 1B4I5-iUm_Kdo6JFcyZtVd6UUixFXvlq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1011 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250141
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Introduce cpu_avoid_mask and get/set routines for it.

By having the mask, it is easier for other kernel subsystem to consume
it as well. One could quickly know which CPUs are currently marked as
avoid.
 
Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
There is a sysfs patch later in the series which prints this mask. If it 
should be sqashed into this patch, let me know. 
 
include/linux/cpumask.h | 17 +++++++++++++++++
 kernel/cpu.c            |  3 +++
 2 files changed, 20 insertions(+)

diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
index 7ae80a7ca81e..6394c67a4fb3 100644
--- a/include/linux/cpumask.h
+++ b/include/linux/cpumask.h
@@ -84,6 +84,7 @@ static __always_inline void set_nr_cpu_ids(unsigned int nr)
  *     cpu_enabled_mask - has bit 'cpu' set iff cpu can be brought online
  *     cpu_online_mask  - has bit 'cpu' set iff cpu available to scheduler
  *     cpu_active_mask  - has bit 'cpu' set iff cpu available to migration
+ *     cpu_avoid_mask  - has bit 'cpu' set iff cpu is to be avoided now
  *
  *  If !CONFIG_HOTPLUG_CPU, present == possible, and active == online.
  *
@@ -101,6 +102,10 @@ static __always_inline void set_nr_cpu_ids(unsigned int nr)
  *  (*) Well, cpu_present_mask is dynamic in the hotplug case.  If not
  *      hotplug, it's a copy of cpu_possible_mask, hence fixed at boot.
  *
+ *  A CPU is said to be avoided when there is contention for underlying
+ *  physical CPU resource in paravirtulized environment. It is recommneded
+ *  not run anything on that CPU though it is online.
+ *
  * Subtleties:
  * 1) UP ARCHes (NR_CPUS == 1, CONFIG_SMP not defined) hardcode
  *    assumption that their single CPU is online.  The UP
@@ -118,12 +123,14 @@ extern struct cpumask __cpu_enabled_mask;
 extern struct cpumask __cpu_present_mask;
 extern struct cpumask __cpu_active_mask;
 extern struct cpumask __cpu_dying_mask;
+extern struct cpumask __cpu_avoid_mask;
 #define cpu_possible_mask ((const struct cpumask *)&__cpu_possible_mask)
 #define cpu_online_mask   ((const struct cpumask *)&__cpu_online_mask)
 #define cpu_enabled_mask   ((const struct cpumask *)&__cpu_enabled_mask)
 #define cpu_present_mask  ((const struct cpumask *)&__cpu_present_mask)
 #define cpu_active_mask   ((const struct cpumask *)&__cpu_active_mask)
 #define cpu_dying_mask    ((const struct cpumask *)&__cpu_dying_mask)
+#define cpu_avoid_mask    ((const struct cpumask *)&__cpu_avoid_mask)
 
 extern atomic_t __num_online_cpus;
 
@@ -1133,6 +1140,7 @@ void init_cpu_possible(const struct cpumask *src);
 #define set_cpu_present(cpu, present)	assign_cpu((cpu), &__cpu_present_mask, (present))
 #define set_cpu_active(cpu, active)	assign_cpu((cpu), &__cpu_active_mask, (active))
 #define set_cpu_dying(cpu, dying)	assign_cpu((cpu), &__cpu_dying_mask, (dying))
+#define set_cpu_avoid(cpu, avoid)       assign_cpu((cpu), &__cpu_avoid_mask, (avoid))
 
 void set_cpu_online(unsigned int cpu, bool online);
 
@@ -1222,6 +1230,11 @@ static __always_inline bool cpu_dying(unsigned int cpu)
 	return cpumask_test_cpu(cpu, cpu_dying_mask);
 }
 
+static __always_inline bool cpu_avoid(unsigned int cpu)
+{
+	return cpumask_test_cpu(cpu, cpu_avoid_mask);
+}
+
 #else
 
 #define num_online_cpus()	1U
@@ -1260,6 +1273,10 @@ static __always_inline bool cpu_dying(unsigned int cpu)
 	return false;
 }
 
+static __always_inline bool cpu_avoid(unsigned int cpu)
+{
+	return false;
+}
 #endif /* NR_CPUS > 1 */
 
 #define cpu_is_offline(cpu)	unlikely(!cpu_online(cpu))
diff --git a/kernel/cpu.c b/kernel/cpu.c
index a59e009e0be4..44e8c66d2839 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -3107,6 +3107,9 @@ EXPORT_SYMBOL(__cpu_active_mask);
 struct cpumask __cpu_dying_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_dying_mask);
 
+struct cpumask __cpu_avoid_mask __read_mostly;
+EXPORT_SYMBOL(__cpu_avoid_mask);
+
 atomic_t __num_online_cpus __read_mostly;
 EXPORT_SYMBOL(__num_online_cpus);
 
-- 
2.43.0


