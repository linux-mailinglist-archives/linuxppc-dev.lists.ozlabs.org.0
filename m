Return-Path: <linuxppc-dev+bounces-14623-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CB0CA4D5D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 04 Dec 2025 18:58:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMhz945gkz2xS5;
	Fri, 05 Dec 2025 04:56:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764871013;
	cv=none; b=kGDkwDzJGSa/088oYcUc6KfMs3hKjU5oQCMso1bIq4lilynRi1/pLQc5JGTghZb/O0KEUjq0IxVg2afokXm7j+f/WGxEBxKC3AxaNPv9TU4g0j1wjaCN4Lcu42UEIZx2KtdUufkMiM9bE3jgAD4Xhsuyi6h9cpUTzqSEkdP3V/WrUlUVdGl4LxO+DrhDv7jStNgn/m6A0cA8W1oMaPhVizK3oBfWP4xr79/wt7PCkgGMGfetgpIizKRKbOWo05PgfvhsAskOQ+rNn4qhlqeHxGdt91RNQiR86s+q6CwEk6NmPDo+BQXJMnG1XMqZrCmBKqkRjAKgqTLfd6yvPVIbgw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764871013; c=relaxed/relaxed;
	bh=UikS5TkXcNc8h8b6tYpk0p5GLnY/uUu63XCX0ekANJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hUGH6RG/97bmN4aQXS6eLGZlYuedRxKHDMuaFasdkELZURVYazNkU0i5o44snMOFp40/fVryFel1yJ9YI1p/OZ+RYCSn7CXtLnBYW9rwCtWKjNcp+eVw8KWxPlt/oE4vfFUs3PZlo+g/GCxo+o2WPZ2WEcKNggBLYSYfIO+zrHOrVjFB0jIhy28EO+KXAoGfokk9atOcfpt8aTGIJZV+dmXNZGP9MmGgjHB/FqdLKfWZtTNJAOeNHi5FxAT9T0fyeL2UtvSutOt5/fPGcmy8Av7hdpG2Fj8N93MVOnKSfoRY2W81ess2VkatfPrCuLxaVE5HiZkjMYUoYN8SgISXlA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j5S4S+1V; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j5S4S+1V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dMhz84h8Gz2xR4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Dec 2025 04:56:52 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5B4B2KH1014613;
	Thu, 4 Dec 2025 17:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=UikS5TkXcNc8h8b6t
	Ypk0p5GLnY/uUu63XCX0ekANJg=; b=j5S4S+1Vesxx/U6OLSeAMzAqXhWOOKxyc
	Q6J53knusEKWbJ4dfjj847npJHkLSoMT9x0qxDSt10uZD+yMvFakcH8KwkFCBFSa
	3uP6cKzhsuKtNTthexJWlNX+y0iziW8++2ybKQtW2I91gZAigvDGjvo77yzn4eXO
	3kZKZAgOEK/5chR+Ncg+NLrdF0Axki4sdW2tnQWHgnTujooeBUYlhnmv9VvUukDv
	rgQzO/3uWb4MQHWG8YXxhB/grkEQc9IKMkj7MsQu/QRHFXP8GaX2v3FrI6cTq/G8
	CGyL0EiIlK5yXQ8PpqsKSvW9wO5wQSERzl7Q61MnjMnUnLCYe5gvA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqrja1tc0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:56:24 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5B4HuNYp011085;
	Thu, 4 Dec 2025 17:56:23 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqrja1tbu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:56:23 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B4FXrQs010240;
	Thu, 4 Dec 2025 17:56:22 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4arcnkh2v3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:56:21 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5B4HuI8u45744424
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 4 Dec 2025 17:56:18 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0822E2004B;
	Thu,  4 Dec 2025 17:56:18 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 87CC220040;
	Thu,  4 Dec 2025 17:56:14 +0000 (GMT)
Received: from sapthagiri.in.ibm.com (unknown [9.39.29.188])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  4 Dec 2025 17:56:14 +0000 (GMT)
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
Subject: [PATCH 17/17] pseries/lpar: Add debug interface to set steal interval
Date: Thu,  4 Dec 2025 23:24:05 +0530
Message-ID: <20251204175405.1511340-18-srikar@linux.ibm.com>
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
X-Proofpoint-GUID: ni3vhbmp42pzMrrHuc6bnF_Kzql4ImFA
X-Proofpoint-ORIG-GUID: DAgezDF_G1mL2zRPjpvzMWkMiCPNhsPZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDAyMCBTYWx0ZWRfX2HJrKpeW8ZP3
 S8JNVf73b2KIBPAzcIfTRQ7qp4G/iE/NRxRbPMSG2YsgmfNB+jOt4JIto+3k1M2wDJhyWqQQdN0
 uGSW2ZGq8Glj3wRmBTiIbXFDbDK9OtA0B7E1iTEED4HWXsXr8xL0a4h75Cjp+rxn+C8GoWLNQY/
 aq417TvC/ewmG6jNeYZoxT0/MyrFFDNiezE114VFNKRABSVvsWaeLhuSYHQmsoipOVpwSTVdIwr
 TXOqkjnrFlzz0mk6xtH9LcgyevRUfI+WHt8CYSMLBFxzXdyiJe+lIUtniFVd5eQocIIK/3rQ2j+
 Hg8BYcTrxFE4H6pLE58lrIkg5LZpWA6R6IG84e40Z+DTiB3wz8wZPNyL/MF7dS+itIUmjctCPfd
 Z3HEccxcu089gz02Ao4YIYbV4uM7tw==
X-Authority-Analysis: v=2.4 cv=dYGNHHXe c=1 sm=1 tr=0 ts=6931cb48 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=WutiPhbOZldT-Hsz3twA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_04,2025-12-04_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511290020
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Currently steal metrics are processed on CPU 0 at a 2 second interval.
However the right value for processing the steal interval has yet to be
discovered. If a too small value is provided, LPAR may end up adjusting
too frequently and also the steal metrics may also be unreliable. If
too large value is provided, LPAR may lose the opportunity for soft
online and offline. Hence enable a debug interface for privileged users to
specify steal interval.

Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/lpar.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index f5caf1137707..4f7b217a4eb3 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -660,8 +660,8 @@ machine_device_initcall(pseries, vcpudispatch_stats_procfs_init);
 
 #ifdef CONFIG_PARAVIRT_TIME_ACCOUNTING
 #define STEAL_MULTIPLE (STEAL_RATIO * STEAL_RATIO)
-#define PURR_UPDATE_TB tb_ticks_per_sec
 
+static u8 steal_interval = 1;
 
 static bool should_cpu_process_steal(int cpu)
 {
@@ -674,8 +674,8 @@ static bool should_cpu_process_steal(int cpu)
 extern bool process_steal_enable;
 static void process_steal(int cpu)
 {
+	unsigned long steal_ratio, delta_tb, interval_tb;
 	static unsigned long next_tb, prev_steal;
-	unsigned long steal_ratio, delta_tb;
 	unsigned long tb = mftb();
 	unsigned long steal = 0;
 	unsigned int i;
@@ -696,14 +696,18 @@ static void process_steal(int cpu)
 		steal += be64_to_cpu(READ_ONCE(lppaca->enqueue_dispatch_tb));
 	}
 
+	if (!steal_interval)
+		steal_interval = 1;
+
+	interval_tb = steal_interval * tb_ticks_per_sec;
 	if (next_tb && prev_steal) {
-		delta_tb = max(tb - (next_tb - PURR_UPDATE_TB), 1);
+		delta_tb = max(tb - (next_tb - interval_tb), 1);
 		steal_ratio = (steal - prev_steal) * STEAL_MULTIPLE;
 		steal_ratio /= (delta_tb * num_online_cpus());
 		trigger_softoffline(steal_ratio);
 	}
 
-	next_tb = tb + PURR_UPDATE_TB;
+	next_tb = tb + interval_tb;
 	prev_steal = steal;
 }
 
@@ -2081,6 +2085,9 @@ static int __init vpa_debugfs_init(void)
 		debugfs_create_file(name, 0400, vpa_dir, (void *)i, &vpa_fops);
 	}
 
+#ifdef CONFIG_PARAVIRT_TIME_ACCOUNTING
+	debugfs_create_u8("steal_interval_secs", 0600, arch_debugfs_dir, &steal_interval);
+#endif
 	return 0;
 }
 machine_arch_initcall(pseries, vpa_debugfs_init);
-- 
2.43.7


