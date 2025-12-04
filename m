Return-Path: <linuxppc-dev+bounces-14622-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1FBCA4D5A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 04 Dec 2025 18:57:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMhyy41BTz2ywy;
	Fri, 05 Dec 2025 04:56:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764871002;
	cv=none; b=N40XltrB+CXkd6zyTiPqUPb46vssVLqbHriS8ZvIjvytFmjZXys/uBz/ItEvJpdQHxnWMFHXeagpOMq9XBjJ9WM4e7At1w9knfeE19NuhyduRB5xSmY/FvS2/UF6fjqLgqfpXZNAl1Lzi4CwVIvGmXdvNdVjg1FHK30b+0IpxP52zp3t1wgcLoe6KUQX74sTZLdmJqCQP64aP0y4+kFAo3lBkVBmIfyw3cxEkNbvxQcdh3GgzsSdYTLn47Kyt6Tyd1QzVQ0lWMoPHSh0qYxl7fvDi87hYLhji9pFMWi8eFY4wNVOTdNnvWgbR7pddPN/ZFgU+EvGWXAn8IWPeSAZpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764871002; c=relaxed/relaxed;
	bh=ux0EhBWJUf5wZJAGzUVeEs+JHElwVRFtaD5oNwlf0HM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J/NVgp+CKw9YBYHBakSuJ6zufzc4K8BZ67eMswbocCXeXHNY1QSllnH7KlV7SJsOQoTnwYOHj/9lSG8qqN2dFsY3kAhIA+USXoXstcU++imDvOhqwZNlQryKJqclmfjXprHG53aUoPwSht0Y/bEl2Ap0v3vYa8ADLThQ0elqhdvVPJCz3t04fo6/L+nxUBV1MUZ1PKerkqsahptOzbMOCmeRSZ/TnZ/kCZONfvVNmIUt7LqgXivgT15YRTJBUnFz8u30ZmkV4H6ifBJIb627xyWU9yl7QCkCOTV2ryEVJyPbPa93gaQaa/vZuydSVo8HqW5RdKvFEfG9tHUGAIwBhA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bZOOj5+3; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bZOOj5+3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dMhyx5y8gz2xRm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Dec 2025 04:56:41 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5B4ARExC025115;
	Thu, 4 Dec 2025 17:56:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=ux0EhBWJUf5wZJAGz
	UVeEs+JHElwVRFtaD5oNwlf0HM=; b=bZOOj5+3RxGyH+FGQ4N1WrNWrKk3kX8fS
	T3TPCtRTErvoKxbodAEn9RhzwCAc79cGfloAou4BBXZCPvlE4chzLasYEOFd0s4M
	M3s5o4VJwBJrhrK/Mj8kA+Sljnz/GAtIkr2ICrVeOb+3ireC8TvtrEc91sMysmFv
	ymuKQ9hQ8Ttw4RrQ1X/Yp7QMDelu05iKJJeeR+HUV3oGKeOmsXEhYlaFBv/jquK1
	NbHFTSp7uzFvGGNOFnHfyALqMuVjnM10BYOh5Havs4e01qpTjLlGQkhMELYeres6
	I17zzbiZXRsILW2y9Sg8NX25QJ4SIqHNc+ldoK+G18Klcl/qWKg5A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqrg5s6f1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:56:15 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5B4HgGoB024742;
	Thu, 4 Dec 2025 17:56:15 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqrg5s6ew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:56:15 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B4FAKAP019051;
	Thu, 4 Dec 2025 17:56:14 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4arbhy96v8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 17:56:14 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5B4HuAMA27853372
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 4 Dec 2025 17:56:10 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7A9A120043;
	Thu,  4 Dec 2025 17:56:10 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 04C7B20040;
	Thu,  4 Dec 2025 17:56:07 +0000 (GMT)
Received: from sapthagiri.in.ibm.com (unknown [9.39.29.188])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  4 Dec 2025 17:56:06 +0000 (GMT)
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
Subject: [PATCH 15/17] pseries/hotplug: Update available_cores on a dlpar event
Date: Thu,  4 Dec 2025 23:24:03 +0530
Message-ID: <20251204175405.1511340-16-srikar@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: wOfvkC0uOapX7Jh4z6xnd_FzMcZQjtFY
X-Authority-Analysis: v=2.4 cv=Ir0Tsb/g c=1 sm=1 tr=0 ts=6931cb40 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=WWXCdL_Rce5lBg350DQA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDAyMCBTYWx0ZWRfXyDHhUZlL/rbr
 muAdVF4jCCrEnyxd0+8tqrFy8tA5zov3Ron2eG7LTLJTot7YzcYv2Wu1uxyE6Nd6N1Ye60mKfH2
 8EU7466aialjO8EsG/boJ9RTRFri6yUQG/nVDx27MBmp25FD+N4zHuk/d+wMT0GKGv5qU5cXGSe
 XiMgwvsb/THc1LP4yPkRUhDxukBbvCtYkU4xa9ICuTBfXZYdaZxx8SvmJgTqIZnwWoXILsbiUri
 vdgaXSEhG4f4lJaw5xTOLoxFMRzzTlS3ThFnjWfShV00ItGPacua0x/POdnl/gHkOZRYo4VTeXd
 fKlQZA4O3ymSgtJfem5oEl4ASJnWJ3yGbBY3A7JbkyF1xMJls4jc8xxbJBm8JeWAwwVr8JiHbPj
 xneJR98hvjWaHsuGk9yFcpU4W4dXGA==
X-Proofpoint-GUID: rS9Up9g0pBVUYbf6f-AaloNfu_F1ttWL
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

Everytime, a DLPAR CPU event happens on a shared LPAR, the number of
entitled_cores, and virtual processors allotted to the LPAR can change.
Hence available_cores has to be updated to be in sync.

Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/hotplug-cpu.c | 6 ++++++
 arch/powerpc/platforms/pseries/pseries.h     | 1 +
 arch/powerpc/platforms/pseries/smp.c         | 2 +-
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
index bc6926dbf148..4ba8cc049b5b 100644
--- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
+++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
@@ -284,6 +284,9 @@ static int pseries_add_processor(struct device_node *np)
 
 out:
 	cpu_maps_update_done();
+#ifdef CONFIG_PPC_SPLPAR
+	pseries_num_available_cores();
+#endif
 	free_cpumask_var(cpu_mask);
 	return rc;
 }
@@ -323,6 +326,9 @@ static void pseries_remove_processor(struct device_node *np)
 			       "with physical id 0x%x\n", thread);
 	}
 	cpu_maps_update_done();
+#ifdef CONFIG_PPC_SPLPAR
+	pseries_num_available_cores();
+#endif
 }
 
 static int dlpar_offline_cpu(struct device_node *dn)
diff --git a/arch/powerpc/platforms/pseries/pseries.h b/arch/powerpc/platforms/pseries/pseries.h
index 2527c2049e74..1eed08752a03 100644
--- a/arch/powerpc/platforms/pseries/pseries.h
+++ b/arch/powerpc/platforms/pseries/pseries.h
@@ -121,6 +121,7 @@ extern u32 pseries_security_flavor;
 void pseries_setup_security_mitigations(void);
 #ifdef CONFIG_PPC_SPLPAR
 void trigger_softoffline(unsigned long steal_ratio);
+unsigned int pseries_num_available_cores(void);
 #endif
 
 #ifdef CONFIG_PPC_64S_HASH_MMU
diff --git a/arch/powerpc/platforms/pseries/smp.c b/arch/powerpc/platforms/pseries/smp.c
index 69e209880b6f..a3daac4c3e1e 100644
--- a/arch/powerpc/platforms/pseries/smp.c
+++ b/arch/powerpc/platforms/pseries/smp.c
@@ -293,7 +293,7 @@ static unsigned int entitled_cores __read_mostly;
 static unsigned int available_cores;
 
 /* Get pseries soft entitlement limit */
-static unsigned int pseries_num_available_cores(void)
+unsigned int pseries_num_available_cores(void)
 {
 	unsigned int present_cores = num_present_cpus() / threads_per_core;
 	unsigned long retbuf[PLPAR_HCALL9_BUFSIZE];
-- 
2.43.7


