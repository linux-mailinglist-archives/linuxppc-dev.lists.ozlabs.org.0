Return-Path: <linuxppc-dev+bounces-14610-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A43FFCA4D27
	for <lists+linuxppc-dev@lfdr.de>; Thu, 04 Dec 2025 18:56:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMhy81Fwtz2xfC;
	Fri, 05 Dec 2025 04:56:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764870960;
	cv=none; b=Ln6m93ws7fCNY+ia673q8XPo051Va4vYHmjLzX81wHq2R0AGvp+lq2aEHhfWBF3Vl7Kzhz+W3IAZ8GpIjaRxvRt2Tlch9bSMKsiZ5T8ak8IRuH1a6jc46Ho5+eIwOjoBbeJvdgbTVwa0ifIH9GCn9KH5ao+T8IPEpazK3fT+XlqaRUdUu3y2I/PxdQYIgVE/Dz1/cWYgxnD8TUeEOarHuMCeVuyLuGao1sDit5bXvhdSErW8ntPjD7C4dCgkJ7KlvgvpL/3ySb2vS8sRAK/5iGjssqx3YMHUwJrzEbysOQ/utJlYe17tsugs5sM/KedOzUnghjAXS40DHGpyTc6bzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764870960; c=relaxed/relaxed;
	bh=cGvV2EyuoGRv/QbasIead7YLzTxiH5r0RDBU1Y5c1ew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bca0L+PNkaBqnYteRiEuoObY0KFNbbgT5MhlU9Uh1wHBFCNRQIMnArT9y50z2PpjfbfhdayBhyrimYnD9DmQUI+eLuu5WNIDDpPm0vE8v79d7b46sX0iuOvmFDF6RlYb4k7WURBSxOF051gteLXTu/V5BpO/mB99p4BEqmvIF+TpXY+BsQf26a+p5jVp+h/GPD1D+oS4G77ryYQb8xFJ4bX0nDP5ciDAhMYPshghhFDTKMQlmnvKa7yc6Ch073pZ266ARdEEalsO1tp5SFEf54A4Z80neSQlgRSpm+//8j/StiI17dr7uCGCoThQPfp/dsTZDDhv2L8o845Uma5vBA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=na0PXfMC; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=na0PXfMC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dMhy723ylz2xXB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Dec 2025 04:55:59 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5B4E8tkP001931;
	Thu, 4 Dec 2025 17:55:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=cGvV2EyuoGRv/Qbas
	Iead7YLzTxiH5r0RDBU1Y5c1ew=; b=na0PXfMCOj4egkHS1AnM7MZa/zFKanMzf
	OTOOSSeoxyEENcBNpcH3g4m8dpLW5Y07z1BhlJLaQi79U7B4aMcXRvGUjc476nvM
	Ygh+0Vyv8cb0/J1p0Aq4c6vhwY8RV9xclDpwGZ5BbeCkmmxeDzeNTd8i7sdwcdav
	QdLOU00hqeOXb76ghAO1uqZcrf67tHt82jC7HJiSqNXgE+npZiRC4icEUcWeUL2S
	YEt9jMaO1t5tOLyGyi7Vcsp25z+LMoOJkOCKFTiy+5dC+h4ssXQx+Hn26JRaffoU
	cqDJ7rRZ7qKjWqexrXk3Z1zVLOBnbij3grnkSqQzqv7leZl16tGCg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqp8q9e38-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:55:26 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5B4HfL8g021218;
	Thu, 4 Dec 2025 17:55:26 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqp8q9e35-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:55:26 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B4FGjN4010284;
	Thu, 4 Dec 2025 17:55:25 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4arcnkh2r6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:55:25 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5B4HtL5S22479462
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 4 Dec 2025 17:55:21 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 27E9720043;
	Thu,  4 Dec 2025 17:55:21 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 950C720040;
	Thu,  4 Dec 2025 17:55:17 +0000 (GMT)
Received: from sapthagiri.in.ibm.com (unknown [9.39.29.188])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  4 Dec 2025 17:55:17 +0000 (GMT)
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
Subject: [PATCH 02/17] powerpc/lpar: Reorder steal accounting calculation
Date: Thu,  4 Dec 2025 23:23:50 +0530
Message-ID: <20251204175405.1511340-3-srikar@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDAwMCBTYWx0ZWRfX9sEvZAI+B/Jc
 nMnAj/OgAv6Xv/l0nKq5wp+q+tELpkIfT7Hat1oHlo6S3/jfWq2SGjbcr1eV1/z2htIk/Om44DG
 bXN9MTsSTcCDxh7DTy5TS0bt+yl4k9OlXGfV0iD3YJStOigQref0ykS1peL4aVal4OsW8eGQ1o+
 LmOwmkXIKz03eUauY/I3Kq0o8a4CpYKTDkJBgksA/GpR6svaxbn1ArPqhNmZWFLi6fOWHY6gb4T
 PcvL3jkgj9lx2AiD/MvMzaG+BDpLZ/AjGbZbCZ1wg86aefrkC68ob9fzp6/nqPpOyeIgyKoE1Rt
 KHrKaD+h17D0eT62iuVt8HkzSJme1YHgviRrGX4mmaFltB34j84HBUlr3WK0m3TJ5t7AxybETnK
 tatfJNRNH+oLgQOFZ3MQVjCesECOUw==
X-Authority-Analysis: v=2.4 cv=dIerWeZb c=1 sm=1 tr=0 ts=6931cb0e cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=e-Ya-t4VmWCOyrdcCoEA:9
X-Proofpoint-ORIG-GUID: YlIRh_9WmKkJVYFswaUNP2EkDVsRXSDq
X-Proofpoint-GUID: kVUXudLvu6logZnZqfTueeVQHP8bpJho
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

There is no functional change. Calculated steal could be used in the
subsequent changes. Hence reordering the function.

Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/lpar.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 6a415febc53b..dde12b27ba60 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -662,15 +662,20 @@ machine_device_initcall(pseries, vcpudispatch_stats_procfs_init);
 u64 pseries_paravirt_steal_clock(int cpu)
 {
 	struct lppaca *lppaca = &lppaca_of(cpu);
+	unsigned long steal;
+
+	steal = be64_to_cpu(READ_ONCE(lppaca->ready_enqueue_tb));
+	steal += be64_to_cpu(READ_ONCE(lppaca->enqueue_dispatch_tb));
 
 	/*
 	 * VPA steal time counters are reported at TB frequency. Hence do a
-	 * conversion to ns before returning
+	 * conversion to ns before using.
 	 */
-	return tb_to_ns(be64_to_cpu(READ_ONCE(lppaca->enqueue_dispatch_tb)) +
-			be64_to_cpu(READ_ONCE(lppaca->ready_enqueue_tb)));
+	steal = tb_to_ns(steal);
+
+	return steal;
 }
-#endif
+#endif /* CONFIG_PARAVIRT_TIME_ACCOUNTING */
 
 #endif /* CONFIG_PPC_SPLPAR */
 
-- 
2.43.7


