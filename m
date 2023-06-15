Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EC2731CFF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 17:48:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZtllXgKZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QhmtK1Xx6z3c2k
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 01:48:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZtllXgKZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QhmrP4McJz30hG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 01:47:17 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35FFfmbA031929;
	Thu, 15 Jun 2023 15:46:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=jVW7yohLK9Vw3P0klRV5j1vQuRogcPT4LlvarI8f2XM=;
 b=ZtllXgKZw/g4uFoHc8DU3jpSMWboQk0VcUXkOmRd5qXblaICbrqJY3aY/fq0SkX1ISrZ
 /R7Z+ZWDG5q/LPeUBJtb+hA9ObKTd7gRNjTHG0CBPbYvR5eaeTvqOkWLtEBWkVAttYdi
 uBYYMhnjPY1eyuoC6RI32Y0sApmBCm6vuxXxmTezGvh8xeIndybC1w0oZzl2efq9hKf/
 ta1uhPYYR9mqhbcQwv6bi4mcWTgC7Y+ASGmpqOix2ryoMkmpsR2boiIfDBBpNjBuwhCv
 EeYmBqPRREyxVkfhwyd3vDqwi7J4574kC+ygjIeOfyNHBBgKpkRlAAIjnQJa9HPZS2Ys JQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r84qb1yms-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jun 2023 15:46:48 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35FFIJmU020546;
	Thu, 15 Jun 2023 15:46:48 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r84qb1yj6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jun 2023 15:46:48 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35F10bch012068;
	Thu, 15 Jun 2023 15:46:45 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3r4gt52r47-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jun 2023 15:46:44 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35FFkgVg20710028
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jun 2023 15:46:42 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7DE8A20040;
	Thu, 15 Jun 2023 15:46:42 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E3C8A20043;
	Thu, 15 Jun 2023 15:46:41 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.144.159.119])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Jun 2023 15:46:41 +0000 (GMT)
From: Laurent Dufour <ldufour@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 10/10] powerpc/pseries: Honour current SMT state when DLPAR onlining CPUs
Date: Thu, 15 Jun 2023 17:46:35 +0200
Message-ID: <20230615154635.13660-11-ldufour@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230615154635.13660-1-ldufour@linux.ibm.com>
References: <20230615154635.13660-1-ldufour@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nXfwAgs5Y7mDP_h_f298NttcCwBTagAh
X-Proofpoint-ORIG-GUID: ILE6_SZWj42_A3EWK-8GoGAfYD46l_34
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-15_12,2023-06-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=879 phishscore=0
 spamscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306150136
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
Cc: linux-arch@vger.kernel.org, dave.hansen@linux.intel.com, x86@kernel.org, mingo@redhat.com, bp@alien8.de, npiggin@gmail.com, tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Michael Ellerman <mpe@ellerman.id.au>

Integrate with the generic SMT support, so that when a CPU is DLPAR
onlined it is brought up with the correct SMT mode.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/pseries/hotplug-cpu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
index 61fb7cb00880..e62835a12d73 100644
--- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
+++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
@@ -398,6 +398,14 @@ static int dlpar_online_cpu(struct device_node *dn)
 		for_each_present_cpu(cpu) {
 			if (get_hard_smp_processor_id(cpu) != thread)
 				continue;
+
+			if (!topology_is_primary_thread(cpu)) {
+				if (cpu_smt_control != CPU_SMT_ENABLED)
+					break;
+				if (!topology_smt_thread_allowed(cpu))
+					break;
+			}
+
 			cpu_maps_update_done();
 			find_and_update_cpu_nid(cpu);
 			rc = device_online(get_cpu_device(cpu));
-- 
2.41.0

