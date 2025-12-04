Return-Path: <linuxppc-dev+bounces-14618-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D08F9CA4D4B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 04 Dec 2025 18:57:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMhyg5KTRz2xQB;
	Fri, 05 Dec 2025 04:56:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764870987;
	cv=none; b=NNz/jLaaJHlzpA1F5hnLrHRCrxMdDk+FKjmSNnUsb+Cmz3YV7aquFSXf3TYX3jdc+AoleMBz4DNIjIVP0Yd+AJJdO4Xa78kIoeHAGPz/d+ExLUkwY5J+4ZLUFkii1447O2rnxiaNAn87ncuICqz2nNl9XQbgxRskGsbCJys6xyoI8CjwHJNsc/roHjjVcW5fyorl6ETkbvqmiYo64gDDJpbjMA6TH/1dw6Ygk0teiHira85u3UDLa6VuENYivSgI6FlrxRIlKcu3yl8fOiyECYoi5wNBlW7p7fjjMY6kA0kfTFfKvd51Aesrs+Dcn6pFeV6HKxuY2g6fGobxhS8v+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764870987; c=relaxed/relaxed;
	bh=ysKpJ6qK+0o6f5e9zaWSj7+gvfbnph9GLv07UXGGudU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RPvIH2s/0ti4MJTWd/Pa57pSNQoCR2910OacnALtDDlQ9xfWcZ/4VTm7018Dlthx4OdTYTq2LTfjYECkftl0ggA2AiU4kmCYqsja6oCSOfApg2JCKq9N0DBUuBgCUf2MpWHo2s4bgp/ub4fPWR1VCRs/9sJU9+2P9z26iqbCgSUkiLWzYsYznpVNIx+Uxm4k3soaU47c6fvnptn0INZ8cTox9DFui9yT+2F9YW3PlYtZqOrGEpD7i9sLUEfSH65S6tbKKg3wEScYWG2jHeEegVP9oj5vw6tik6Qrk8cM9F95s9fI1fL2JD1qwGLE/V++5a7cMNMzuv6xU9fwU5Nong==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RftKjCJL; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RftKjCJL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dMhyf6HG2z2xLR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Dec 2025 04:56:26 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5B4AZqtS007787;
	Thu, 4 Dec 2025 17:56:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=ysKpJ6qK+0o6f5e9z
	aWSj7+gvfbnph9GLv07UXGGudU=; b=RftKjCJLWuvbPaE36VbCIoLVUgqSjREft
	7GPPn6ZMTyyCM+lKgHvTFHss2QVwU0OeTkNUOMDkIitaFfQUqJWZOyYsUJNY2mU1
	Fj+KFpg9Bq206SgDe6RvfcR7UkosCgKhl40W/TnOJ+4vS7EVpwTQVkArkKMTxwvs
	gFdB8AcMpWPXa9LhCaCGuAHmBTU18j8nXvPhwJ8T3VoG6ST0WaCvTZamZoWRQwp8
	cX1/AQRLACnQhjwB7HqyvdKnt/+LN+aG2AFXqOT3w6vE2hUjTinPkIkrXi6nvHag
	50mk6nz1M//XdLi5yuNr8nuSF2wOvi8prN6LCeguWCTXKKTFlAOCA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqp8q9e5q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:56:00 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5B4Hl97R001863;
	Thu, 4 Dec 2025 17:56:00 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqp8q9e5k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:55:59 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B4F08Y4024080;
	Thu, 4 Dec 2025 17:55:59 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4arb5ss9v5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:55:58 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5B4HttdL52625664
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 4 Dec 2025 17:55:55 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 661BB20043;
	Thu,  4 Dec 2025 17:55:55 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D908E20040;
	Thu,  4 Dec 2025 17:55:51 +0000 (GMT)
Received: from sapthagiri.in.ibm.com (unknown [9.39.29.188])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  4 Dec 2025 17:55:51 +0000 (GMT)
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
Subject: [PATCH 11/17] pseries/smp: Create soft offline infrastructure for Powerpc shared LPARs.
Date: Thu,  4 Dec 2025 23:23:59 +0530
Message-ID: <20251204175405.1511340-12-srikar@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDAwMCBTYWx0ZWRfX35luS4bBhR1r
 QmlIM/dV30GhP6qHbKEP8ECfAUoyjboLKj+LH3EWKw0CPxYH3HZ1eUWrM6WsSl3MKczLSHePcUr
 vzGVcqaokapzt3nOGmL0Ms1CV0qP4Jm+ZBfMBCJqj7FXItUqqRQASWCxaHMc6x6d/xbojHXvNgd
 gbHQXsdYx4wFIaVu5qhOAkDJW8GYsg2+6v66hpMRcWmKQNLsVLmWV6CVihG04u9ySrdesGmJxYi
 BbK/laXMgWFit9PwaCPisJpdSoHV77sHNOqlDiqved7HDXp4cEh/NPDOPE31shz9lnEUReNniaq
 BFOn1GFQW3ALhQdV/4fZaFR0OPU7kLhtCNu3UG+h1QcNWckgxLpVs3Bxkyh7wVzLRC7OpJjHMbj
 +12Ni3ofKdtEKYxDFAMxpEefJKnDvQ==
X-Authority-Analysis: v=2.4 cv=dIerWeZb c=1 sm=1 tr=0 ts=6931cb30 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=3qOYXtFuKzhovN1QMkgA:9
X-Proofpoint-ORIG-GUID: dHHVYs7YbjW6iW96gITP0-qTI929wgAc
X-Proofpoint-GUID: zTTYAFQMt9ec2zkkq3HPKXSJaEn3Q6RZ
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

Create an infrastructure that uses Linux scheduler's new soft
online/offline infrastructure to temporarily enable and disable CPUs.
This utilizes the workqueue mechanism to activate worker functions to
online/offline CPUs as and when requested.

Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/smp.c | 39 ++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/smp.c b/arch/powerpc/platforms/pseries/smp.c
index a36153c959d0..ec1af13670f2 100644
--- a/arch/powerpc/platforms/pseries/smp.c
+++ b/arch/powerpc/platforms/pseries/smp.c
@@ -122,6 +122,42 @@ static inline int smp_startup_cpu(unsigned int lcpu)
 	return 1;
 }
 
+#ifdef CONFIG_PPC_SPLPAR
+struct offline_worker {
+	struct work_struct work;
+	int offline;
+	int cpu;
+};
+
+static DEFINE_PER_CPU(struct offline_worker, offline_workers);
+
+static void softoffline_work_fn(struct work_struct *work)
+{
+	struct offline_worker *worker = this_cpu_ptr(&offline_workers);
+
+	set_cpu_softoffline(worker->cpu, worker->offline);
+}
+
+static void softoffline_work_init(void)
+{
+	int cpu;
+
+	if (!is_shared_processor() || is_kvm_guest())
+		return;
+
+	for_each_possible_cpu(cpu) {
+		struct offline_worker *worker = &per_cpu(offline_workers, cpu);
+
+		INIT_WORK(&worker->work, softoffline_work_fn);
+		worker->cpu = cpu;
+	}
+}
+#else
+static void softoffline_work_init(void)
+{
+}
+#endif
+
 static void smp_setup_cpu(int cpu)
 {
 	if (xive_enabled())
@@ -260,6 +296,9 @@ static unsigned int pseries_num_available_cores(void)
 	if (plpar_hcall9(H_GET_PPP, retbuf))
 		return num_present_cpus() / threads_per_core;
 
+	if (!entitled_cores)
+		softoffline_work_init();
+
 	entitled_cores = retbuf[0] / 100;
 	max_virtual_cores = present_cores;
 
-- 
2.43.7


