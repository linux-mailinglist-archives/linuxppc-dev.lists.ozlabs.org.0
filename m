Return-Path: <linuxppc-dev+bounces-14621-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BD4CA4D54
	for <lists+linuxppc-dev@lfdr.de>; Thu, 04 Dec 2025 18:57:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMhyv128Hz2yhD;
	Fri, 05 Dec 2025 04:56:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764870999;
	cv=none; b=byjUX3qe10HhjgXJOvJ8CMdhvcPvYJ+umMwXyfvWhiOCqt8ZkKlR4Q9tccasTwqZ0TdTKFiN7qPuXxU7QGr/lVXZWtQZAl/JDdIcvgjb2SgTE0nXKzT8S9ldqNm+wTugCuGWEHuW23z8xYHYoeMk9tQu80Dgb+DSKnUFfzOLVOyJkNg6e0bbGNNqlDs/yzgqKfebBpku1+S18q/TxcOzXgbHhXb37QpfzvyO7O7FdWVcvS+KlvVapOsFwM78wnbxSoMXJbK7M7jS9O7IsrcYP6EdXU7zYTW0tibXpWQWYh1U/6kXTh2zS2U7b6Df/AG8/RwftILRfqAmE6TQlPkahA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764870999; c=relaxed/relaxed;
	bh=COHvKYjgKzz9JnJqBR21qXREb5HwbfkQOktMhWdqSPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SwzKXkcxTXH4SjrHK9rxgI940OloBKWKg1s4sOdkvFkfygEqjdp0g/Z8GkWp9/T9wMXYVnNJee+oN5P147WBwVn9B8q2zTZb9jASJ6fQCcv8p8sYg2cRHQMefnstP56XxgHFWLTK6ef5wiQufFwasWFf6sHvREezxi2caTLet8SxVUba1XCVGU5vspsVxASRbDaN74KO7I9W3I1pU9KWRHIEpGaQxHbz/RLHPXMMq1tm7lypZxU1msSsMN4RXhWRCNVomK6FZB2kOY4HrvcmHBiUoG4MLwfaWIDd9wAdc2LsVUcIV+/GW2z/r6gEeIoabBd9/eY1YapN86fYo147hQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eRg9eVDa; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eRg9eVDa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dMhyt2QYjz2ypw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Dec 2025 04:56:38 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5B4CVwkE013518;
	Thu, 4 Dec 2025 17:56:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=COHvKYjgKzz9JnJqB
	R21qXREb5HwbfkQOktMhWdqSPg=; b=eRg9eVDan64NzQCgvAJQD28SRJsfbWhFL
	RKVlLM81qofcj9iQBMfadDhwCTHfDPWcV87c1IMgV5ZWzrheA57/NqSxlVNFzcvT
	ZfE/RxF/2pe6S/ZKEZBxT3Mn4EnuW6t3sspqE5yHZYViV7dhlOhSy31cs3Pc8RLc
	uKJEgeT7rz3mv/b2Z6I8TvJiUfJhkKmuzInUw/FmuVimKqrRb0G/Y1T6IGXIDFSS
	weBWApxaScBHHxEZ8ZaQmMql1VY1CybOkleI/MHNBfzeTCObka7H7y3LHdJpYsMB
	L+LlrwfamzWwmw1DnB1iTThkTsYMKOiUgpkwXnr0NQ65tmpNKXiOA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqrh79vv5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:56:09 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5B4Hg50q026211;
	Thu, 4 Dec 2025 17:56:08 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqrh79vv2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:56:08 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B4G8xq8021690;
	Thu, 4 Dec 2025 17:56:07 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4at8c6jbbv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:56:07 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5B4Hu3Cd16318956
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 4 Dec 2025 17:56:03 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E77B520043;
	Thu,  4 Dec 2025 17:56:02 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6FB0820040;
	Thu,  4 Dec 2025 17:55:59 +0000 (GMT)
Received: from sapthagiri.in.ibm.com (unknown [9.39.29.188])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  4 Dec 2025 17:55:59 +0000 (GMT)
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
Subject: [PATCH 13/17] pseries/smp: Account cores when triggering softoffline
Date: Thu,  4 Dec 2025 23:24:01 +0530
Message-ID: <20251204175405.1511340-14-srikar@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=dK+rWeZb c=1 sm=1 tr=0 ts=6931cb39 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=hMrejquCwrOoUXIZ0_UA:9
X-Proofpoint-GUID: _vx2ZrcX-PNX-n7NeBZdzw1v8eHZdwRE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDAyMCBTYWx0ZWRfXz1o2mbP6IcH1
 OmMQ0MzVFzMZbjMEoDw3dXCwAhhF71D93YxPTBXSEOdtzs+smnbCvCM3LM2SHCaKDHXouLZZEBw
 hfxsigcRyxYK8u0dn2f0UYTI8lqS5oQ+8SnrVHfLNrCBF8mvRNq7oyE1k8lZnaHjpcoz4jbGbsR
 evuuEppTlo5nZqh/qQYkW4dYrBL4vLzgfPofmGcYxtnYwK011ETidVWxfaHVJtZT0B65WG6z7im
 RGg5YCa4GWPQZ1V4r1s5iZwP2V4K4JlTpqLhjEH4M8nByIiA9PSoeoyAn3MFmAZed8UTt/koxJd
 /L0hwxrp1pvPbOGqlyFUDmLGTf6xKJ2OED16UdrOEtOKc0bw7avlV3+TaKAymFQpoPIyJDbZTKv
 Kr7LNVbUdsQjzcWjat/KDP6cErtzvQ==
X-Proofpoint-ORIG-GUID: Y6oyYVlwPGDCHU8eIffBBUvXwfclhGHw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_04,2025-12-04_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511290020
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On a shared LPAR is entitled to certain number of cores, i.e the number
of cores that PowerVM hypervisor is committed to provide at any point of
time. Hence based on steal metrics, soft offline such that at least
soft-offline cores are available.

Also when soft-onlining cores, unless DLPAR, ensure system can only
online up to max virtual cores.

Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/smp.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/smp.c b/arch/powerpc/platforms/pseries/smp.c
index 4c83749018d0..69e209880b6f 100644
--- a/arch/powerpc/platforms/pseries/smp.c
+++ b/arch/powerpc/platforms/pseries/smp.c
@@ -327,25 +327,45 @@ void trigger_softoffline(unsigned long steal_ratio)
 {
 	int currcpu = smp_processor_id();
 	static int prev_direction;
+	int success = 0;
 	int cpu, i;
 
+	/*
+	 * Compare delta runtime versus delta steal time.
+	 *  [0]<----------->[EC]--------->[VP]
+	 *  [0]<------------------>{AC}-->[VP]
+	 *  EC == Entitled Cores
+	 *  VP == Virtual Processors
+	 *  AC == Available Cores Varies between 0 to EC/VP.
+	 * If Steal time is high, then reduce Available Cores.
+	 * If steal time is low, increase Available Cores
+	 */
 	if (steal_ratio >= STEAL_RATIO_HIGH && prev_direction > 0) {
 		/*
 		 * System entitlement was reduced earlier but we continue to
-		 * see steal time. Reduce entitlement further.
+		 * see steal time. Reduce entitlement further if possible.
 		 */
+		if (available_cores <= entitled_cores)
+			return;
+
 		cpu = cpumask_last(cpu_active_mask);
 		for_each_cpu_andnot(i, cpu_sibling_mask(cpu), cpu_sibling_mask(currcpu)) {
 			struct offline_worker *worker = &per_cpu(offline_workers, i);
 
 			worker->offline = 1;
 			schedule_work_on(i, &worker->work);
+			success = 1;
 		}
+		if (success)
+			available_cores--;
 	} else if (steal_ratio <= STEAL_RATIO_LOW && prev_direction < 0) {
 		/*
 		 * System entitlement was increased but we continue to see
-		 * less steal time. Increase entitlement further.
+		 * less steal time. Increase entitlement further if possible.
 		 */
+		if (available_cores >= max_virtual_cores)
+			return;
+
 		cpumask_andnot(cpus, cpu_online_mask, cpu_active_mask);
 		if (cpumask_empty(cpus))
 			return;
@@ -356,7 +376,10 @@ void trigger_softoffline(unsigned long steal_ratio)
 
 			worker->offline = 0;
 			schedule_work_on(i, &worker->work);
+			success = 1;
 		}
+		if (success)
+			available_cores++;
 	}
 	if (steal_ratio >= STEAL_RATIO_HIGH)
 		prev_direction = 1;
-- 
2.43.7


