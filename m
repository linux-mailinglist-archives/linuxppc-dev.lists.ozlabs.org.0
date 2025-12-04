Return-Path: <linuxppc-dev+bounces-14620-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1136CA4D51
	for <lists+linuxppc-dev@lfdr.de>; Thu, 04 Dec 2025 18:57:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMhyt0kBHz2ynh;
	Fri, 05 Dec 2025 04:56:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764870998;
	cv=none; b=HSC8WJeIBmBnb6GE3ROyG9BTIopJysTXLubpdbdNqVRvNX5PPRdeZFqZxY/Kx7048V36/6+IHxSXamJ70pFjuVk0v/WIfne83e1EFdBJuPl5yOK8hmEzFW04m0xZ7/0izKX/BqpC7pTMOHRMv+B6J1On1wdSu3/A8cqCuTdOu0afHxJNP5+TLXAMJ/zKzye7zytzhP2jS29PVIaK2jXi5ZvrDL7rtMS2riLC1TtxD6Oi5RRRRhxyU7VYvmBa9G6EAPG+mkqonjLw2axrlHuLBo2F549zF45h3ahqUUuiRTf44AyTIi3ouo8c6/qkT91SLYAoa4qt7trstuIo/BrFag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764870998; c=relaxed/relaxed;
	bh=gBvk4eMk6v6ZAOxTBGwue2xrVUEEoxsJgnPd2ac/fyw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NUilpicbzvsP8fWc9EPATrf9KgiEVdvsgeH6G2Qs9gJ/u0pGrbATJuStB2IlKeLq92Ozs9+wndioy2CodlKrTir526l1JuTWAp0jMRbB56zBteldGR+eyF+Ht/4uvb5Blw4kP9hKcPltpj11wGYOv9G7mIsEJXpzhJmVQDzR5edmO4s6Tpacyylj5Dxjulx5ZlCl4kmk/mkupXvIluaBAzWAh8GVz0AXZkMYqiwGmXGl6ZY1skDBkVZLsk7l/gUk0Xyyqteyc7rFHXnqqF+2smNuwCgC1Q2/og0kiQTTnU67iDrq959IeIjG8HAGx39n3WlrXd7Z1W5cLBTLAHAghw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=npNBkVM1; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=npNBkVM1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dMhys1RBqz2yhD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Dec 2025 04:56:36 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5B4CIoHr010190;
	Thu, 4 Dec 2025 17:56:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=gBvk4eMk6v6ZAOxTB
	Gwue2xrVUEEoxsJgnPd2ac/fyw=; b=npNBkVM1tbJ3JUr5HJrj6rtcZD3Ab+qOM
	9uXk/lGJ/Rh708lBvFROVXK2LJ6tz7dmbLOPjsoUeMgg9t96lXztNlpxpMCuVzSC
	DrbJl1yE08ZlB6hFzRpY82Bw5RcAxhuJ59Aebtg/2yRLo0Q+8jIYCEXr497Ou6hU
	W+StBDZ9cd3BfGiDkWEDwFrVklGV2J65uzMkf8p6VR5brdh2Y1cjRZJLF8oOFniw
	IK+P0TuNPxlK1OpWYvpX5s+G/4dURlQrbB2pq+LguRLDOGUuBRxUcTQrugNbYPvk
	24qDCvbSM2A+G8qsvP5SBwKV0foQ4Juf3LoAIdMmWZ37Xg2Z5S8iw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqp8q9e6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:56:12 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5B4HuBdw018464;
	Thu, 4 Dec 2025 17:56:11 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqp8q9e6g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:56:11 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B4G1MLm029338;
	Thu, 4 Dec 2025 17:56:10 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ardv1rvcu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:56:10 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5B4Hu6FR46203282
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 4 Dec 2025 17:56:06 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B3F6320043;
	Thu,  4 Dec 2025 17:56:06 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3C6B920040;
	Thu,  4 Dec 2025 17:56:03 +0000 (GMT)
Received: from sapthagiri.in.ibm.com (unknown [9.39.29.188])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  4 Dec 2025 17:56:03 +0000 (GMT)
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
Subject: [PATCH 14/17] powerpc/smp: Assume preempt if CPU is inactive.
Date: Thu,  4 Dec 2025 23:24:02 +0530
Message-ID: <20251204175405.1511340-15-srikar@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDAwMCBTYWx0ZWRfX3yL8M1FQVfis
 im8nnAvYJT/jR7qKWigQ4v15uxYEjhX7o1H6AaQJVmaTX6M3tKWqJRJn4IenYRfAw2QFUc0B+G6
 Qyg1cGu/5jChU1xSMkQuJdXg4z+dZD3ApBi9+uzDDbDN8D1w9IGm/qAusaaHvc/elrZHheGHPeQ
 kUYwvvp3y7B7BwWVgB3o3JlqH3d95zwN63IRRm14xX6Y0z79NWW7WtcE1QplMtgHs0Zuul0y36i
 ua2GbxKLer7R1I+aU2Jj9pBP7J3Ydk7POaVsXVAuD4kaatkb3HgwKNZWbbRzy7T2P+w4rXI4qI8
 U/U43IoAbX3xu1sUjkH+sLrmoKLf2HKmbm/0s1dc4DXrvUCtZIeSAN716rPc6KnCxtgnskCHVe6
 cZGv6i/w2CoKx0B6kMYIp81BWkrc+A==
X-Authority-Analysis: v=2.4 cv=dIerWeZb c=1 sm=1 tr=0 ts=6931cb3c cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=R1vJ1bMZ7EzTfBZCLQ4A:9
X-Proofpoint-ORIG-GUID: sZ-3IVy9C2T-DcjEVeXc27zHs0lFgv6u
X-Proofpoint-GUID: I5KCaBuqR44QxaNU3pBk_7-8f26bzBvN
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

When a vCPU is marked inactive, it qualifies as preempted vCPU.
And when a vCPU is marked active, we should hope that its not going to
be preempted. Also with lower steal times, the chances of active vCPU
being preempted reduces too.

Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
---
 arch/powerpc/include/asm/paravirt.h | 62 +++++------------------------
 1 file changed, 9 insertions(+), 53 deletions(-)

diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/asm/paravirt.h
index b78b82d66057..93c4e4f57cb3 100644
--- a/arch/powerpc/include/asm/paravirt.h
+++ b/arch/powerpc/include/asm/paravirt.h
@@ -145,6 +145,15 @@ static inline bool vcpu_is_preempted(int cpu)
 	if (!is_shared_processor())
 		return false;
 
+#ifdef CONFIG_PPC_SPLPAR
+	/*
+	 * Assume the target CPU to be preempted if it is above soft
+	 * entitlement limit
+	 */
+	if (!is_kvm_guest())
+		return !cpu_active(cpu);
+#endif
+
 	/*
 	 * If the hypervisor has dispatched the target CPU on a physical
 	 * processor, then the target CPU is definitely not preempted.
@@ -159,59 +168,6 @@ static inline bool vcpu_is_preempted(int cpu)
 	if (!is_vcpu_idle(cpu))
 		return true;
 
-#ifdef CONFIG_PPC_SPLPAR
-	if (!is_kvm_guest()) {
-		int first_cpu, i;
-
-		/*
-		 * The result of vcpu_is_preempted() is used in a
-		 * speculative way, and is always subject to invalidation
-		 * by events internal and external to Linux. While we can
-		 * be called in preemptable context (in the Linux sense),
-		 * we're not accessing per-cpu resources in a way that can
-		 * race destructively with Linux scheduler preemption and
-		 * migration, and callers can tolerate the potential for
-		 * error introduced by sampling the CPU index without
-		 * pinning the task to it. So it is permissible to use
-		 * raw_smp_processor_id() here to defeat the preempt debug
-		 * warnings that can arise from using smp_processor_id()
-		 * in arbitrary contexts.
-		 */
-		first_cpu = cpu_first_thread_sibling(raw_smp_processor_id());
-
-		/*
-		 * The PowerVM hypervisor dispatches VMs on a whole core
-		 * basis. So we know that a thread sibling of the executing CPU
-		 * cannot have been preempted by the hypervisor, even if it
-		 * has called H_CONFER, which will set the yield bit.
-		 */
-		if (cpu_first_thread_sibling(cpu) == first_cpu)
-			return false;
-
-		/*
-		 * The specific target CPU was marked by guest OS as idle, but
-		 * then also check all other cpus in the core for PowerVM
-		 * because it does core scheduling and one of the vcpu
-		 * of the core getting preempted by hypervisor implies
-		 * other vcpus can also be considered preempted.
-		 */
-		first_cpu = cpu_first_thread_sibling(cpu);
-		for (i = first_cpu; i < first_cpu + threads_per_core; i++) {
-			if (i == cpu)
-				continue;
-			if (vcpu_is_dispatched(i))
-				return false;
-			if (!is_vcpu_idle(i))
-				return true;
-		}
-	}
-#endif
-
-	/*
-	 * None of the threads in target CPU's core are running but none of
-	 * them were preempted too. Hence assume the target CPU to be
-	 * non-preempted.
-	 */
 	return false;
 }
 
-- 
2.43.7


