Return-Path: <linuxppc-dev+bounces-12004-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BABA9B51F47
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Sep 2025 19:44:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMSkF2Z9Cz3dTb;
	Thu, 11 Sep 2025 03:44:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757526277;
	cv=none; b=hIkBsmbrOaHOZn49fi6efXPXZYSQ+pzAbyAkm908QlwyRx+3wLiiLQcS3hpAjDxT2Ddf8zzhpywYIVFVRY3XQz3Crla+W/ip/u4OptJhnUYyAiLL9voeKvAg7/7MHObIszvp71jFZvNrkU+kBTo4mqs5FAua97LybLVcgDkkKfECeIuLj0FgkqJ/aZd8747PPjbfFl+Ga5fjb9uPEuSpo7kEiC5S/LvUdewmWEbZAKzQovaVl05PdKma5qsg2crQS209BwiPX5t1S83qvQ/DrRu8Ho71vVzMcGiUf8sWt2Cf7eL/DAmG8UP9PcYFis274XNckHbCiqUsyyKEEf6k8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757526277; c=relaxed/relaxed;
	bh=caQJxuyMNXmT2YGeedFr5wjbzQp50dRVbIvtg+mq248=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QeV7ZxmupgEbN8z167S7ZbyPclqeRfDzTMu1YT/s7ArJ7ZRBT2k1XAS61pgJ1q0s9aYxIhRNmETyPvuyFlDXSgOqKyJRy90+GlRpqVOP1/F2OCv4kEYxBFd6UWsHtiDXbzgo+TdzqIugI46Krv52iYhwn0GVLH2w1fOGueda+ejTk4ZH5bow/vyiRJthksm9Fb9ga2R0cbXnlHLLeUY3ZtD0Ek2v02hN2UeEWurKvBi77Lw8aKCQr/Na5jz6/dXerhAQt2JEZJurwbNJKcAZdpewaTDcul9VyHL3TYm3xoSw/IR1ultwI5dR6Gj/FXtLrE6Bl/plQsNU/xjOtM1VvQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=E2MXqEWR; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=E2MXqEWR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMSkD4HLrz3dTB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Sep 2025 03:44:36 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ADNw72012298;
	Wed, 10 Sep 2025 17:44:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=caQJxuyMNXmT2YGee
	dFr5wjbzQp50dRVbIvtg+mq248=; b=E2MXqEWRbsIS65eL3fdG5FTyFbLHGj+TO
	akwGLosd+ZAzz6jaEujSYpvuy9yIbW+T+k/ctXWXCyn8G7py9G2NSWWD/HxIR8ee
	m8F9btPC3kC0OdwlUBbd5KA94V3RgvGH1vmCnOkNDLvfP0ijEH5OrpkfX5bBEh1O
	4V7oXdriTxt+d+VEJQFOazMP42yHIAqy3MBsJId7/9RVYqi+lDown0oPZah7ToQv
	Ps5kMBCdz94yLZhhtBibQo5Z/ekkOsDE0icKALU9mLVSJer2/PUJJUX8v6fjGTx2
	Q8VmL9FpyFMAhY34t7ewhA54JyXZM20EJ/8QKcoHt757rCceSEx4Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cfffx33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 17:44:13 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58AHTCbZ015585;
	Wed, 10 Sep 2025 17:44:12 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cfffx2x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 17:44:12 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58AEaXaJ001155;
	Wed, 10 Sep 2025 17:44:11 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 491203hexf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 17:44:11 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58AHi7Z757016624
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Sep 2025 17:44:08 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CBAC920043;
	Wed, 10 Sep 2025 17:44:07 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7808A20040;
	Wed, 10 Sep 2025 17:44:01 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.124.208.171])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 10 Sep 2025 17:44:01 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, tglx@linutronix.de, yury.norov@gmail.com,
        maddy@linux.ibm.com, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, gregkh@linuxfoundation.org
Cc: sshegde@linux.ibm.com, vschneid@redhat.com, iii@linux.ibm.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        vineeth@bitbyteword.org, jgross@suse.com, pbonzini@redhat.com,
        seanjc@google.com
Subject: [RFC PATCH v3 05/10] sched/fair: Don't consider paravirt CPUs for wakeup and load balance
Date: Wed, 10 Sep 2025 23:12:05 +0530
Message-ID: <20250910174210.1969750-6-sshegde@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: WlLF5e_u7kVZ-Z3w_YCW3_HJDJt-40rr
X-Proofpoint-GUID: G46-hpU5sGWoRmCAWFOmlEvJFNJrvAg6
X-Authority-Analysis: v=2.4 cv=EYDIQOmC c=1 sm=1 tr=0 ts=68c1b8ed cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=4f14yCUMJlVUugEBjfIA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMCBTYWx0ZWRfX4lSqDjT+jOLX
 xkCLj5OtMNYr6/wz7Z6G9t+ABi0caNRbuv6uUonx3jpBWoMN2FrqpcQ6G0JiDfQ+7H6ynRz7unk
 8SNYjEjJ59qQ6n4ZR+IVf2kR8ib3ZzlIzMiFdO+2mKfdzfF3VvI2HlnHEQnn7oEvdU6FTBx83Qo
 1Lq2zV/WMXFmdyvqr6AOHlajQTLF9HD7g9uzVw5ioal6yg7bIDCKYYUOkgyLp/GQQokHRlC0uM/
 rv0KlVAfXXKqAOqjniNzkpVbz/RD6jFmL2a2IXOVF+k2j3wcXyrWGlPODWNO8wYVolOMP1Cwv57
 F4QCzSZoBUPHtDDpN6yvWCDRg8wM+xCo/R8amI3L+R1tudex1u0zcjrpR2XmO+lM3mFRwc8Ee49
 TNPN8pEl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_03,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060020
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

load balancer for fair class looks at sched domain and active cpus to consider
spreading the load. mask out the paravirt CPUs so that tasks doesn't spread to
those.

At wakeup, don't select a paravirt CPU.

Expect minimal impact when it is disabled.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 kernel/sched/fair.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index df8dc389af8e..3dc76525b32c 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8563,7 +8563,7 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
 		if (!is_rd_overutilized(this_rq()->rd)) {
 			new_cpu = find_energy_efficient_cpu(p, prev_cpu);
 			if (new_cpu >= 0)
-				return new_cpu;
+				goto check_new_cpu;
 			new_cpu = prev_cpu;
 		}
 
@@ -8605,7 +8605,12 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
 	}
 	rcu_read_unlock();
 
-	return new_cpu;
+	/* If newly found or prev_cpu is a paravirt cpu, use current cpu */
+check_new_cpu:
+	if (is_cpu_paravirt(new_cpu))
+		return cpu;
+	else
+		return new_cpu;
 }
 
 /*
@@ -11734,6 +11739,12 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
 
 	cpumask_and(cpus, sched_domain_span(sd), cpu_active_mask);
 
+#ifdef CONFIG_PARAVIRT
+	/* Don't spread load to paravirt CPUs */
+	if (static_branch_unlikely(&cpu_paravirt_push_tasks))
+		cpumask_andnot(cpus, cpus, cpu_paravirt_mask);
+#endif
+
 	schedstat_inc(sd->lb_count[idle]);
 
 redo:
-- 
2.47.3


