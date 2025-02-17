Return-Path: <linuxppc-dev+bounces-6264-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A64A381C3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2025 12:33:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YxLBD1BmCz30NP;
	Mon, 17 Feb 2025 22:33:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739791988;
	cv=none; b=Vzzxbs0ywxxQQ4q3i4U5pzsuyp/bGELbnXvaxr6sgGbX7XSiM3kHDyoWHL406OLaDoOiWGFfE9aKYD8lM1/iJlYuDU0LFtMy0aAuq+HNSMdTfVWmZ14kYmpptFDVXm0V6tpeH55YsX8BwH2bTNaUrA/bGpKaVe5QfR+TBlzAcAaqeHg0HXYcfyGLwaFbedckaPeJSv2zDQtxjW7FQ3Elsa8cvlTDlEf7R4vSlSGx/x/9dJ3FafQeYkV+wWAmAbf2YYdzmTFvDTWrQnqn9864fzFpLreFBsm6HVqYj3m6wy+xYHfI6+9ypp8ynLFvxmuGGqtFDefHQuQT0EH04zS9NA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739791988; c=relaxed/relaxed;
	bh=5scFkvSBGX+8VpmeFIcdSWgrGL13fZO0gx+OvswNrik=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EcTPS0THxXyOIsRY7vcNz5W5YSh3W1Gblhkqmb4zxbkrNFI326cC5IXWG8kafs2ljhRciBhUtYEicQ7DWIYHrO3vwAuEd2luVNHhJ/+50fpHMjFDHGJX/OShx3LF7AhKC6p4iruIBW6/PstlyDmd+aNkVR8a6FOVL8Ami6SLKPvMD54lg6gyUcfzZDcnUOqpJgj3XSbfz7stxSvjCct/erFlYrzAWFhBcafqNM+Z4xCw8pYRtmwO4xzEZkG+Vs85NIDmdwuNucE6auOYO37TxwWdT0wJex1ZFVCBiMtJfbwKXS2w9WuQ8/HSYzwyHQOcIsj2B03/VQNTfYcTY93FxQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UiJO3Jnl; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=huschle@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UiJO3Jnl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=huschle@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YxLBC0tbZz30Ds
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 22:33:06 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51HBVwkV029404;
	Mon, 17 Feb 2025 11:32:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=5scFkvSBGX+8VpmeF
	IcdSWgrGL13fZO0gx+OvswNrik=; b=UiJO3Jnly3zIs+nO1/1tGEPbdZs7qAd4d
	/jzrSjItfvq8QHI/iRlMgY8MdCYILxQuALM0dJXLvQR/aQHGLlIOnmkiaKbmCAMr
	ybGqaYlsSlG/bxWXnSS6Ry/D7R8i4VIKoChX1Yr7RybXOHTCNlaeXg+PKCfHcfO+
	G27wDpG+lg47JTT3d733B1/e7E1MVmEwKucnMBcDFwf3u51C7cKqw3cCOy4HlTQN
	QprXy696E7tIsT5P5+qXF1fcWsU6/LLjXixZOdeS2klgxavE7R3f87GeGQdVJ4c7
	eemP+94Hcy41KJ3T0+Q1bGxm6eevviRREnxqp1Jp7EQZcAMLMcZ5g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44us5a2wpb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 11:32:58 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51HBWvGL011153;
	Mon, 17 Feb 2025 11:32:57 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44us5a2wp9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 11:32:57 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51H92VN6032384;
	Mon, 17 Feb 2025 11:32:56 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44u6rknrv0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 11:32:56 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51HBWqUS33292898
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Feb 2025 11:32:52 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 72C0C20043;
	Mon, 17 Feb 2025 11:32:52 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 92C6D20040;
	Mon, 17 Feb 2025 11:32:51 +0000 (GMT)
Received: from IBM-PW0CRK36.ibm.com (unknown [9.179.18.115])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 17 Feb 2025 11:32:51 +0000 (GMT)
From: Tobias Huschle <huschle@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        vschneid@redhat.com, sshegde@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org
Subject: [RFC PATCH v2 3/3] s390/topology: Add initial implementation for selection of parked CPUs
Date: Mon, 17 Feb 2025 12:32:52 +0100
Message-Id: <20250217113252.21796-4-huschle@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250217113252.21796-1-huschle@linux.ibm.com>
References: <20250217113252.21796-1-huschle@linux.ibm.com>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qggV-NYwYh3AV9N61X1WI-6NdqDpf5vb
X-Proofpoint-GUID: pz89BfH_r6PC0tNHewRG5lxj9uLm2v93
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_05,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 mlxlogscore=964 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502170101
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

At first, vertical low CPUs will be parked generally. This will later
be adjusted by making the parked state dependent on the overall
utilization on the underlying hypervisor.

Vertical lows are always bound to the highest CPU IDs. This implies that
the three types of vertically polarized CPUs are always clustered by ID.
This has the following implications:
- There might be scheduler domains consisting of only vertical highs
- There might be scheduler domains consisting of only vertical lows

Signed-off-by: Tobias Huschle <huschle@linux.ibm.com>
---
 arch/s390/include/asm/smp.h | 2 ++
 arch/s390/kernel/smp.c      | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/arch/s390/include/asm/smp.h b/arch/s390/include/asm/smp.h
index 7feca96c48c6..d4b65c5cebdc 100644
--- a/arch/s390/include/asm/smp.h
+++ b/arch/s390/include/asm/smp.h
@@ -13,6 +13,7 @@
 
 #define raw_smp_processor_id()	(get_lowcore()->cpu_nr)
 #define arch_scale_cpu_capacity smp_cpu_get_capacity
+#define arch_cpu_parked smp_cpu_parked
 
 extern struct mutex smp_cpu_state_mutex;
 extern unsigned int smp_cpu_mt_shift;
@@ -38,6 +39,7 @@ extern int smp_cpu_get_polarization(int cpu);
 extern void smp_cpu_set_capacity(int cpu, unsigned long val);
 extern void smp_set_core_capacity(int cpu, unsigned long val);
 extern unsigned long smp_cpu_get_capacity(int cpu);
+extern bool smp_cpu_parked(int cpu);
 extern int smp_cpu_get_cpu_address(int cpu);
 extern void smp_fill_possible_mask(void);
 extern void smp_detect_cpus(void);
diff --git a/arch/s390/kernel/smp.c b/arch/s390/kernel/smp.c
index 7b08399b0846..e65850cac02b 100644
--- a/arch/s390/kernel/smp.c
+++ b/arch/s390/kernel/smp.c
@@ -686,6 +686,11 @@ void smp_set_core_capacity(int cpu, unsigned long val)
 		smp_cpu_set_capacity(i, val);
 }
 
+bool smp_cpu_parked(int cpu)
+{
+	return smp_cpu_get_polarization(cpu) == POLARIZATION_VL;
+}
+
 int smp_cpu_get_cpu_address(int cpu)
 {
 	return per_cpu(pcpu_devices, cpu).address;
-- 
2.34.1


