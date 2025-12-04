Return-Path: <linuxppc-dev+bounces-14619-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E73CA4D4E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 04 Dec 2025 18:57:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMhym70ntz2xQD;
	Fri, 05 Dec 2025 04:56:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764870992;
	cv=none; b=drmUprXPUsMYvqWGUq2czpLQDU+xWH2wZc9XK3RoBzz8nGRIl2+tKaezgp6yo1JEBFE5rsbvTg5BeMqfioPkkdYWV/2J3u4cFCJphwCXt6kj3SNEc8gMI1kIKXpNhR8N+lQb9AHH2LejnIE1TxolD/edS9CS1DaxoeRUAatGatkCtgFqPnNRuNYnksna43opl9Qmbm3vrGMmgEBcu4PKHDohEnIcn5pLZ69L+IZr0PeTAgb7jI9dxe33Aka2gBj8yiBjPIOikmZrDtC0+2VbjMTZM9Ap4KJcGIJ2RIRAicGHHsa6oBLtsXPNE2Q09NWEdPsm9yfRlOj4Jh+hf56Yqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764870992; c=relaxed/relaxed;
	bh=kkg9Mm171EveHML6ppZAmLKP+NVKMK5te30viw6KABs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V+tojXRHU9vfLlh0Evvc/dSsl6arqmDQx0BiHLbEhyRClCdGSMR+jaKHDKVCrsRPSW4SsI9ieaxHa3/4sHxmZTRLDk25qN0kU3j+4CqQ2BPsA2oe+uBZFhzStvQpQnMemXef6cBn1Xs6WtUwmu4YxXJM/r4FO1ZyPLRYK3B3Wg582T9J7m3F2211+sWr6mhqeIleamP/qzECziJFitNF6oZNCqUEms/rx9k/USLC6Df0Rx5sLBD6mBB2tGd9ygF9+T4JcmWiNQ0vfJLtBYtUFI3Ah01cl7nziq8Ie0C/LuBH7o5V0cOhJuJlleYosaWZVRSknoAb0lkKzz24b/jg2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XSQ+SfwL; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XSQ+SfwL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dMhym1wSZz2xQC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Dec 2025 04:56:32 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5B4B7HVR014086;
	Thu, 4 Dec 2025 17:56:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=kkg9Mm171EveHML6p
	pZAmLKP+NVKMK5te30viw6KABs=; b=XSQ+SfwL6z47CoKBBmz3Q9telL8/hbtRI
	5sdYycFJjuS7kp0bP/N3/CBif4092s9DjX9te2V7QTTYGZuXbzNd5FN65tBc8h6I
	ZqyPJdXb6mCsLvcjaevXOJ/HQXFuLvb8Jb9W7mQzLlGHWpsWwfLSnFFa3CphkT4q
	lpdCbS+ERxpeuiHtl7pZYQ8gS3awsqanO1n/e8n9QgoSrw0B0kiFjO2YXuqq92x8
	WLiAfnfg4KFOMId/3m8of53BIR/fMQpVhKf4TYYdQ8Mz8TwWcBJB/K/mmlk7Z9ly
	52PvN3LgjIhUDwiT5Hx7i9bDW/SPKekWyUpXF6GHSc1pGQfsP8tgQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqrg5s6eg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:56:04 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5B4HtbE6019080;
	Thu, 4 Dec 2025 17:56:04 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqrg5s6eb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:56:03 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B4G44Fo021859;
	Thu, 4 Dec 2025 17:56:03 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4at8c6jbbd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:56:03 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5B4Htxnc43123066
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 4 Dec 2025 17:55:59 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2A89720043;
	Thu,  4 Dec 2025 17:55:59 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AB86B20040;
	Thu,  4 Dec 2025 17:55:55 +0000 (GMT)
Received: from sapthagiri.in.ibm.com (unknown [9.39.29.188])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  4 Dec 2025 17:55:55 +0000 (GMT)
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
Subject: [PATCH 12/17] pseries/smp: Trigger softoffline based on steal metrics
Date: Thu,  4 Dec 2025 23:24:00 +0530
Message-ID: <20251204175405.1511340-13-srikar@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: Fm2fUOblfS-MMrubUr6aOuAovAIP_ibQ
X-Authority-Analysis: v=2.4 cv=Ir0Tsb/g c=1 sm=1 tr=0 ts=6931cb34 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=FOpSX02iUUlzJe458GUA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDAyMCBTYWx0ZWRfXzH5h37RCypag
 CCwblen8QWnLe+fJsBdDHQmMtzkqPHZyQRpErufS0TjeQoNj8c3hcWF3/e0yJFSONnll0h44xut
 0NsHUMjoP+83VDDvVWpk/SAzr3PYwUI+ltRxjx75+riyLC14MrbLGTs7QYkaHYeNqFwtc1dpL3C
 GScLGWxf/oocOLQNYEdJc9ywkMYN64zxK+k3UwHNTdaJF2IeWn60SOkojs44g19vJeeUWgooAW0
 plIcSA1/fHFF5PKuTYIu36eEEbDn1eTcEVKKeSPThx6cWKtM5QqwTeWjRb6ZQ/4N5xUzJ3UHL9d
 4etSHgiSKVA5uMEm58kZKVvYctnKMn+WhLQgjxEJhHow9QoXXHMUfudaNtOcLdrpi7ib7FyCrsu
 v3ALub4VJxULOJjMiFoDzS7AUmxogA==
X-Proofpoint-GUID: Ljq-AuS19zSba1sj3Hwb21dCzsrOzBLx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_04,2025-12-04_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511290020
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Based on the steal metrics, update the number of CPUs that need to
soft onlined/offlined. If LPAR continues to see steal above the given
higher threshold, then continue to offline more CPUs. This will result
in more CPUs of the active cores being used and LPAR should see lesser
vCPU preemption. In the next interval, the steal metrics would also
continue to drop. If LPAR continues to see steal below the lower
threshold, then continue to online more cores. To avoid ping-pong
behaviour, online/offline a core only if steal metrics trend is seen for
at least 2 intervals.

In a PowerVM environment schedules at a core granularity. Hence its
preferable to soft online/offline an entire core. Online / Offline of
only few CPUs from a core is neither going to reduce steal nor would the
resources being used efficiently/effectively.

A Shared LPAR on a PowerVM environment will have cores interleaved
across multiple NUMA nodes. Hence choosing the last active core to
offline and the first inactive core to online will most likely be able
to balance NUMA. A more intelligent approach to select cores to online
/offline may be needed in the future.

Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/lpar.c    |  3 --
 arch/powerpc/platforms/pseries/pseries.h |  3 ++
 arch/powerpc/platforms/pseries/smp.c     | 57 ++++++++++++++++++++++++
 3 files changed, 60 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index f8e049ac9364..f5caf1137707 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -662,9 +662,6 @@ machine_device_initcall(pseries, vcpudispatch_stats_procfs_init);
 #define STEAL_MULTIPLE (STEAL_RATIO * STEAL_RATIO)
 #define PURR_UPDATE_TB tb_ticks_per_sec
 
-static void trigger_softoffline(unsigned long steal_ratio)
-{
-}
 
 static bool should_cpu_process_steal(int cpu)
 {
diff --git a/arch/powerpc/platforms/pseries/pseries.h b/arch/powerpc/platforms/pseries/pseries.h
index 68cf25152870..2527c2049e74 100644
--- a/arch/powerpc/platforms/pseries/pseries.h
+++ b/arch/powerpc/platforms/pseries/pseries.h
@@ -119,6 +119,9 @@ int dlpar_workqueue_init(void);
 
 extern u32 pseries_security_flavor;
 void pseries_setup_security_mitigations(void);
+#ifdef CONFIG_PPC_SPLPAR
+void trigger_softoffline(unsigned long steal_ratio);
+#endif
 
 #ifdef CONFIG_PPC_64S_HASH_MMU
 void pseries_lpar_read_hblkrm_characteristics(void);
diff --git a/arch/powerpc/platforms/pseries/smp.c b/arch/powerpc/platforms/pseries/smp.c
index ec1af13670f2..4c83749018d0 100644
--- a/arch/powerpc/platforms/pseries/smp.c
+++ b/arch/powerpc/platforms/pseries/smp.c
@@ -51,6 +51,9 @@
  * interface by prom_hold_cpus and is spinning on secondary_hold_spinloop.
  */
 static cpumask_var_t of_spin_mask;
+#ifdef CONFIG_PPC_SPLPAR
+static cpumask_var_t cpus;
+#endif
 
 /* Query where a cpu is now.  Return codes #defined in plpar_wrappers.h */
 int smp_query_cpu_stopped(unsigned int pcpu)
@@ -277,6 +280,14 @@ static __init void pSeries_smp_probe(void)
 }
 
 #ifdef CONFIG_PPC_SPLPAR
+/*
+ * Set higher threshold values to which steal has to be limited. Also set
+ * lower threshold values below which allow work to spread out to more
+ * cores.
+ */
+#define STEAL_RATIO_HIGH (10 * STEAL_RATIO)
+#define STEAL_RATIO_LOW (5 * STEAL_RATIO)
+
 static unsigned int max_virtual_cores __read_mostly;
 static unsigned int entitled_cores __read_mostly;
 static unsigned int available_cores;
@@ -311,6 +322,49 @@ static unsigned int pseries_num_available_cores(void)
 
 	return available_cores;
 }
+
+void trigger_softoffline(unsigned long steal_ratio)
+{
+	int currcpu = smp_processor_id();
+	static int prev_direction;
+	int cpu, i;
+
+	if (steal_ratio >= STEAL_RATIO_HIGH && prev_direction > 0) {
+		/*
+		 * System entitlement was reduced earlier but we continue to
+		 * see steal time. Reduce entitlement further.
+		 */
+		cpu = cpumask_last(cpu_active_mask);
+		for_each_cpu_andnot(i, cpu_sibling_mask(cpu), cpu_sibling_mask(currcpu)) {
+			struct offline_worker *worker = &per_cpu(offline_workers, i);
+
+			worker->offline = 1;
+			schedule_work_on(i, &worker->work);
+		}
+	} else if (steal_ratio <= STEAL_RATIO_LOW && prev_direction < 0) {
+		/*
+		 * System entitlement was increased but we continue to see
+		 * less steal time. Increase entitlement further.
+		 */
+		cpumask_andnot(cpus, cpu_online_mask, cpu_active_mask);
+		if (cpumask_empty(cpus))
+			return;
+
+		cpu = cpumask_first(cpus);
+		for_each_cpu_andnot(i, cpu_sibling_mask(cpu), cpu_sibling_mask(currcpu)) {
+			struct offline_worker *worker = &per_cpu(offline_workers, i);
+
+			worker->offline = 0;
+			schedule_work_on(i, &worker->work);
+		}
+	}
+	if (steal_ratio >= STEAL_RATIO_HIGH)
+		prev_direction = 1;
+	else if (steal_ratio <= STEAL_RATIO_LOW)
+		prev_direction = -1;
+	else
+		prev_direction = 0;
+}
 #endif
 
 static struct smp_ops_t pseries_smp_ops = {
@@ -336,6 +390,9 @@ void __init smp_init_pseries(void)
 	smp_ops = &pseries_smp_ops;
 
 	alloc_bootmem_cpumask_var(&of_spin_mask);
+#ifdef CONFIG_PPC_SPLPAR
+	alloc_bootmem_cpumask_var(&cpus);
+#endif
 
 	/*
 	 * Mark threads which are still spinning in hold loops
-- 
2.43.7


