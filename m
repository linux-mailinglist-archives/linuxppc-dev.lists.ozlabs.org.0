Return-Path: <linuxppc-dev+bounces-14615-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BEBCA4D3F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 04 Dec 2025 18:57:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMhyT4rr6z2yK7;
	Fri, 05 Dec 2025 04:56:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764870977;
	cv=none; b=Ezi60rCOpCa9A5VLILxdftGz67GINDs9RsS2/j5dissT0mRubo6Pd9ckUwA+QpMPblzCoqkQtBB13Uq5iVbYK3qf0Hm6o9J1P7nKqeQqkY/RfiZqfCVi6WD0tWCsgT3h/4RnIA98QgYILiseFSpUUnh8cnaTU85hWTBObvr4C8sbXg7AQ/5ZUEYXIMhcf2McR+UGiEux0LFxIHw6XPRgQQ2XyfIiB5rmdZosfU90R6RbpTZG/hH22tL/+1VNKNGR3wjKsBV6GvQzMgtL/YIRpy2V/zunI8YjoB8fDsTdJlnAaGn14OsRt8TkafCBTg2NWEJ9/vdgJ/Tn2AuC3zIm6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764870977; c=relaxed/relaxed;
	bh=L9hSPWn9kNfDvGkjwY79YeQX2N4JGRCB25PXRwW7tQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IMyK07n9u/eSLrHqzCJgmaH6yyq7T3t21ow8tqYboR0vDHdgWKEmyzJg+eYxEzjcRUdVRPvi7QxMkQzZ5ylo5i+08fqchSoGRX/nZ1exG6bm9qC1LJfmd+Rff1xX8d5i9UqIe5eTlty8G169SbGAKh4B4qslzo69+KUxdbM9VgASrw+Q2UbrFLwYRwUFfNHHxPvB6feZlDlXlqnm6EqF5d99eNCITuWVP+736GXfng0Agq25uJyC09ZGP3FLT4Oh5gYBVesgQ2TyUdKDUYSYrI80tuoAf34UAVElDpA2gz54PozOOHUijVemjxkuY7/+p2dM9I4wzKXS9o5msjtl9A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MUYguFmw; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MUYguFmw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dMhyS5dgsz2xLR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Dec 2025 04:56:16 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5B4C4AIE010288;
	Thu, 4 Dec 2025 17:55:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=L9hSPWn9kNfDvGkjw
	Y79YeQX2N4JGRCB25PXRwW7tQE=; b=MUYguFmwmRRd0JpBg6o4vfBbPgvIhnhSk
	fJesW8OIF8UL+CnNkmBRpQK6SpIH8vD8oh/tphx5y3BrUroRE1PSKHkVRoIG6sV6
	lfLEYeOKC7h+CMzYpAv70hlPM9PExxq01YhpC/QxEDAb2mhaV22+O7/Cbi15jrcW
	8R55uvyl5T5cdKR1bqO2tiPaIXUL8Udapu35/gp5PgU0tbl8dXpu0QJvipQwr14z
	jTIZkTNP2hUO/frjgQPTb4fbu4wtWHJjscPylR1sIe/Igb7iMEHZNHo4B1xbtd+P
	EtotSPGzf/lbTTddAy+0zP/25Xbbadn5qw3MHDVY1SFxDy1j/BnZQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqp8q9e4x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:55:49 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5B4Hhwq7026247;
	Thu, 4 Dec 2025 17:55:48 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqp8q9e4v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:55:48 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B4GQpKe021503;
	Thu, 4 Dec 2025 17:55:48 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4at8c6jba4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:55:47 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5B4Htikb26214774
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 4 Dec 2025 17:55:44 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0E3A020043;
	Thu,  4 Dec 2025 17:55:44 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 568DF20040;
	Thu,  4 Dec 2025 17:55:40 +0000 (GMT)
Received: from sapthagiri.in.ibm.com (unknown [9.39.29.188])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  4 Dec 2025 17:55:40 +0000 (GMT)
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
Subject: [PATCH 08/17] sched/core: Implement CPU soft offline/online
Date: Thu,  4 Dec 2025 23:23:56 +0530
Message-ID: <20251204175405.1511340-9-srikar@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDAwMCBTYWx0ZWRfXzEO9T9nxp8Sm
 k/a/qBoKLFIRlREgWn3Ttw6DInezbD4ymrRG6P1TxKRicoKjQf6teeGY+n6vgyfyv+QXOGhxRe0
 7cZpnA/6dxZFqQaFal/OA4d80Pgm7icfrS4nHgBj0WhyrDFfXJ8aZ4n2h0wRQBgIMkG8qUDa2SN
 m+YqRN/bEVLrNESPVq124BymBZyL2AvXtt1YzJ88DjmD1fv/gtK5Wck4lO+IZ4XYDZr4K0jDBpz
 20OeqXIjB+DlB8Y0w5anIpgb/ucaKE1jHGNJIomctJlvX+1OB06gCUQHV/dbsyuKj8ZHEFA2lW+
 SK3/36spsFdAk7M/143EUK+A00AMNRd06iG1mPwpOLAZxCl2i9Ya+QYPm02ayoo5epXcbejRST2
 X4EyANVvcdiMWWisr0AO2Ia2J+HqzQ==
X-Authority-Analysis: v=2.4 cv=dIerWeZb c=1 sm=1 tr=0 ts=6931cb25 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=i_Grb7urhSapXPVAAnwA:9
X-Proofpoint-ORIG-GUID: 1NSFEosnOBjow0v-3ZV3xWGqlnZTAi9f
X-Proofpoint-GUID: jucU3bnD4SrqdJkLcS8AlEYyBox03jwf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_04,2025-12-04_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1011 spamscore=0
 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511290000
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Scheduler already supports CPU online/offline. However for cases where
scheduler has to offline a CPU temporarily, the online/offline cost is
too high. Hence here is an attempt to come-up with soft-offline that
almost looks similar to offline without actually having to do the
full-offline. Since CPUs are not to be used temporarily for a short
duration, they will continue to be part of the CPU topology.

In the soft-offline, CPU will be marked as inactive, i.e removed from
the cpu_active_mask, CPUs capacity would be reduced and non-pinned tasks
would be migrated out of the CPU's runqueue.

Similarly when onlined, CPU will be remarked as active, i.e. added to
cpu_active_mask, CPUs capacity would be restored.

Soft-offline is almost similar as 1st step of offline except rebuilding
the sched-domains. Since the other steps are not done including
rebuilding the sched-domain, the overhead of soft-offline would be less
compared to regular offline. A new cpumask is used to indicate
soft-offline is in progress and hence skips rebuilding the
sched-domains.

To push tasks out of the CPU, balance_push is modified to push tasks out
till there are runnable tasks on the runqueue or till the CPU is in dying
state.

Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
---
 include/linux/sched/topology.h |  1 +
 kernel/sched/core.c            | 44 ++++++++++++++++++++++++++++++----
 2 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/include/linux/sched/topology.h b/include/linux/sched/topology.h
index bbcfdf12aa6e..ed45d7db3e76 100644
--- a/include/linux/sched/topology.h
+++ b/include/linux/sched/topology.h
@@ -241,4 +241,5 @@ static inline int task_node(const struct task_struct *p)
 	return cpu_to_node(task_cpu(p));
 }
 
+extern void set_cpu_softoffline(int cpu, bool soft_offline);
 #endif /* _LINUX_SCHED_TOPOLOGY_H */
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 89efff1e1ead..f66fd1e925b0 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8177,13 +8177,16 @@ static void balance_push(struct rq *rq)
 	 * Only active while going offline and when invoked on the outgoing
 	 * CPU.
 	 */
-	if (!cpu_dying(rq->cpu) || rq != this_rq())
+	if (cpu_active(rq->cpu) || rq != this_rq())
 		return;
 
 	/*
-	 * Ensure the thing is persistent until balance_push_set(.on = false);
+	 * Unless soft-offline, Ensure the thing is persistent until
+	 * balance_push_set(.on = false); In case of soft-offline, just
+	 * enough to push current non-pinned tasks out.
 	 */
-	rq->balance_callback = &balance_push_callback;
+	if (cpu_dying(rq->cpu) || rq->nr_running)
+		rq->balance_callback = &balance_push_callback;
 
 	/*
 	 * Both the cpu-hotplug and stop task are in this case and are
@@ -8392,6 +8395,8 @@ static inline void sched_smt_present_dec(int cpu)
 #endif
 }
 
+static struct cpumask cpu_softoffline_mask;
+
 int sched_cpu_activate(unsigned int cpu)
 {
 	struct rq *rq = cpu_rq(cpu);
@@ -8411,7 +8416,10 @@ int sched_cpu_activate(unsigned int cpu)
 	if (sched_smp_initialized) {
 		sched_update_numa(cpu, true);
 		sched_domains_numa_masks_set(cpu);
-		cpuset_cpu_active();
+
+		/* For CPU soft-offline, dont need to rebuild sched-domains */
+		if (!cpumask_test_cpu(cpu, &cpu_softoffline_mask))
+			cpuset_cpu_active();
 	}
 
 	scx_rq_activate(rq);
@@ -8485,7 +8493,11 @@ int sched_cpu_deactivate(unsigned int cpu)
 		return 0;
 
 	sched_update_numa(cpu, false);
-	cpuset_cpu_inactive(cpu);
+
+	/* For CPU soft-offline, dont need to rebuild sched-domains */
+	if (!cpumask_test_cpu(cpu, &cpu_softoffline_mask))
+		cpuset_cpu_inactive(cpu);
+
 	sched_domains_numa_masks_clear(cpu);
 	return 0;
 }
@@ -10928,3 +10940,25 @@ void sched_enq_and_set_task(struct sched_enq_and_set_ctx *ctx)
 		set_next_task(rq, ctx->p);
 }
 #endif /* CONFIG_SCHED_CLASS_EXT */
+
+void set_cpu_softoffline(int cpu, bool soft_offline)
+{
+	struct sched_domain *sd;
+
+	if (!cpu_online(cpu))
+		return;
+
+	cpumask_set_cpu(cpu, &cpu_softoffline_mask);
+
+	rcu_read_lock();
+	for_each_domain(cpu, sd)
+		update_group_capacity(sd, cpu);
+	rcu_read_unlock();
+
+	if (soft_offline)
+		sched_cpu_deactivate(cpu);
+	else
+		sched_cpu_activate(cpu);
+
+	cpumask_clear_cpu(cpu, &cpu_softoffline_mask);
+}
-- 
2.43.7


