Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 683C8731CFC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 17:48:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=krst2C3+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QhmsL2TKbz3bpd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 01:48:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=krst2C3+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QhmrP4bBYz3bVP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 01:47:17 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35FF7P7s002298;
	Thu, 15 Jun 2023 15:46:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=HyPT7JhScHY14W+4yC0YwDdKiDyYVhW1/dxqq65NYJI=;
 b=krst2C3+gXxJYDbopCRfm9DLkau3GcMzBDl6WZsSs9dkP9+4AkKPonlJAQQa540MppPm
 DGQ1U8MRiiwsawGTqB8ZXKviXFlosyErjdOWd16+5GuxQASB1AiPWHpI4uzzw4blbPIy
 vkBdMj94a4iLoJqlGGBbtO92idqvjaGgR6xNxU87jrFVO+CLgzNX48S/r3LPi2MdLNid
 udwsoDhUzQPlYNi/m3d5eiVV/epvCS0RH3VPyTwPQKzm2CZLyhGHvj4AqJHuUl3EDpIc
 /J7ArH2xM0AIsT/sFM7zmZPZjs8u8AASB4qYFj4N2cJwVHTBrM3OChsNP7PFxwyKY2MM Uw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r84qb1yhd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jun 2023 15:46:45 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35FFGq7A014158;
	Thu, 15 Jun 2023 15:46:44 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r84qb1yfr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jun 2023 15:46:44 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35F2kCxN030742;
	Thu, 15 Jun 2023 15:46:41 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3r4gt53pba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jun 2023 15:46:41 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35FFkd3N19989232
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jun 2023 15:46:39 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7773120040;
	Thu, 15 Jun 2023 15:46:39 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F3C2220043;
	Thu, 15 Jun 2023 15:46:38 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.144.159.119])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Jun 2023 15:46:38 +0000 (GMT)
From: Laurent Dufour <ldufour@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 05/10] cpu/SMT: Create topology_smt_threads_supported()
Date: Thu, 15 Jun 2023 17:46:30 +0200
Message-ID: <20230615154635.13660-6-ldufour@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230615154635.13660-1-ldufour@linux.ibm.com>
References: <20230615154635.13660-1-ldufour@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GKY_m6eO-S-9CF-jGda-6u9bAXCzu_wL
X-Proofpoint-ORIG-GUID: nvzwFDIsa5kbDWYfeiYiz2CuKupDqmI2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-15_12,2023-06-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=497 phishscore=0
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

A subsequent patch will enable partial SMT states, ie. when not all SMT
threads are brought online.

To support that, add an arch helper to check how many SMT threads are
supported.

To retain existing behaviour, the x86 implementation only allows a
single thread or all threads to be online.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/x86/include/asm/topology.h |  2 ++
 arch/x86/kernel/smpboot.c       | 12 ++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/x86/include/asm/topology.h b/arch/x86/include/asm/topology.h
index 87358a8fe843..232df5ffab34 100644
--- a/arch/x86/include/asm/topology.h
+++ b/arch/x86/include/asm/topology.h
@@ -143,6 +143,7 @@ int topology_update_die_map(unsigned int dieid, unsigned int cpu);
 int topology_phys_to_logical_pkg(unsigned int pkg);
 int topology_phys_to_logical_die(unsigned int die, unsigned int cpu);
 bool topology_is_primary_thread(unsigned int cpu);
+bool topology_smt_threads_supported(unsigned int threads);
 #else
 #define topology_max_packages()			(1)
 static inline int
@@ -155,6 +156,7 @@ static inline int topology_phys_to_logical_die(unsigned int die,
 static inline int topology_max_die_per_package(void) { return 1; }
 static inline int topology_max_smt_threads(void) { return 1; }
 static inline bool topology_is_primary_thread(unsigned int cpu) { return true; }
+static inline bool topology_smt_threads_supported(unsigned int threads) { return false; }
 #endif
 
 static inline void arch_fix_phys_package_id(int num, u32 slot)
diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index 3052c171668d..d163ef55577b 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -278,6 +278,18 @@ bool topology_is_primary_thread(unsigned int cpu)
 	return apic_id_is_primary_thread(per_cpu(x86_cpu_to_apicid, cpu));
 }
 
+/**
+ * topology_smt_threads_supported - Check if the given number of SMT threads
+ *				    is supported.
+ *
+ * @threads:	The number of SMT threads.
+ */
+bool topology_smt_threads_supported(unsigned int threads)
+{
+	// Only support a single thread or all threads.
+	return threads == 1 || threads == smp_num_siblings;
+}
+
 /**
  * topology_phys_to_logical_pkg - Map a physical package id to a logical
  *
-- 
2.41.0

