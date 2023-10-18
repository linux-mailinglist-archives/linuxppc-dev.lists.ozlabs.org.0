Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CDF7CE317
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Oct 2023 18:42:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iDjPZBlN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S9c7z5pTzz3vZF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Oct 2023 03:42:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iDjPZBlN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S9c6J6dgpz3cNH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Oct 2023 03:40:40 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39IGc6bO031967;
	Wed, 18 Oct 2023 16:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=+9mWtK2LAk088BzZ2/UXjxJTYDJYHbNIVObLJlcqYas=;
 b=iDjPZBlNsA6fa6fXHtR8+hgx6dNjpHNn00I6o61O60isxONpCozYkcGo76U1boXHFd/b
 U7jp87pSET7xS3ulb6B8z0KjnWttjgOIvNLXDhlaefcewhpiS4en3QRkg+h4qfEyEQ9w
 vnY89TCKZ/g808wcxFhPHlnsz+RVuRemXoSnQFXFZgzf+fTy+rbBo/TS0zQ46e+9VzrR
 gYRoXC89KlGhlYgbUGZyWUSLACIWoFubMP/2HxPBFe5CSOQlE0OKMlI73V4A1l2PM8o8
 jGj6TnLJt2F8Kfnlh398AdZ3zyWo/MMIWGeV8GGhgIJynVuulJwXAYGwn3r6TJYFkw7Q JA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ttjn41485-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 16:40:26 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39IGcgZE003583;
	Wed, 18 Oct 2023 16:40:20 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ttjn40xnb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 16:40:19 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39IG32YM026943;
	Wed, 18 Oct 2023 16:38:30 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tr5asjawh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 16:38:30 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39IGcT4v12583508
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Oct 2023 16:38:29 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F04912004E;
	Wed, 18 Oct 2023 16:38:28 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 35E2620040;
	Wed, 18 Oct 2023 16:38:26 +0000 (GMT)
Received: from sapthagiri.in.ibm.com (unknown [9.43.47.66])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 18 Oct 2023 16:38:25 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 6/6] powerpc/smp: Avoid asym packing within thread_group of a core
Date: Wed, 18 Oct 2023 22:07:46 +0530
Message-ID: <20231018163751.2423181-7-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231018163751.2423181-1-srikar@linux.vnet.ibm.com>
References: <20231018163751.2423181-1-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5zcFTzW3cgn2tkT_kawQYByBZWYmIWuT
X-Proofpoint-GUID: 3nPjRWY_fioBTO33AYGy4yBKjzx6YwO9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-18_15,2023-10-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1011
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0
 phishscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310180135
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Valentin Schneider <vschneid@redhat.com>, Srikar Dronamraju <srikar@linux.vnet.ibm.com>, Peter Zijlstra <peterz@infradead.org>, "ndesaulniers@google.com" <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Rohan McLure <rmclure@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PowerVM Hypervisor will schedule at a core granularity. However each
core can have more than one thread_groups. For better utilization in
case of a shared processor, its preferable for the scheduler to pack to
the lowest core. However there is no benefit of moving a thread between
two thread groups of the same core.

Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/smp.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index b1eb11a66902..a710fb32a2a9 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1695,6 +1695,8 @@ void start_secondary(void *unused)
 	BUG();
 }
 
+DEFINE_STATIC_KEY_FALSE(splpar_asym_pack);
+
 static void __init fixup_topology(void)
 {
 	int i;
@@ -1704,6 +1706,7 @@ static void __init fixup_topology(void)
 		static_branch_enable(&powerpc_asym_packing);
 	} else if (is_shared_processor() && has_big_cores) {
 		static_branch_enable(&powerpc_asym_packing);
+		static_branch_enable(&splpar_asym_pack);
 	}
 
 #ifdef CONFIG_SCHED_SMT
@@ -1758,6 +1761,19 @@ void __init smp_cpus_done(unsigned int max_cpus)
 	set_sched_topology(powerpc_topology);
 }
 
+/*
+ * For asym packing, by default lower numbered CPU has higher priority.
+ * On shared processors, pack to lower numbered core. However avoid moving
+ * between thread_groups within the same core.
+ */
+int arch_asym_cpu_priority(int cpu)
+{
+	if (static_branch_unlikely(&splpar_asym_pack))
+		return -cpu / threads_per_core;
+
+	return -cpu;
+}
+
 #ifdef CONFIG_HOTPLUG_CPU
 int __cpu_disable(void)
 {
-- 
2.31.1

