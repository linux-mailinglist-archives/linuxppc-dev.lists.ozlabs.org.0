Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBA6905B8E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 20:53:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Cd46wL97;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vzvnx0DvLz30WY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2024 04:53:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Cd46wL97;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nysal@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vzvm95gG5z3cG6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2024 04:52:09 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45CHTeNc025730;
	Wed, 12 Jun 2024 18:52:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pp1; bh=vW5lsyIFWSZkq
	9+WtC/JLBFyEtR2dLFJCqUMsgFyCqs=; b=Cd46wL97RUwSHZ6G+DYdGbVmrMSLr
	oYJJS0VSN5T8LJ06QP88Ar4RquF+m4OkTeG8PTDeLVijJO3t2HoPrJaCgVUPN+EW
	/+VWLZrVHIPO5PjW1wuNiN+F27RKu4lryZAhcDvNA4eWkcLOE2YCCIVdDCrk05fj
	t3F/hsNzhE3j5ES3PDGfZXGaxCKaPwmWONPmlBMupATF1a2KyEW3rC/1ZHeLIvKz
	hrxJTnDG7ttIJYNWPeygWBLAOwjLcGvaGglX28fe42OWYGZUJv/ShG4bnBNmNB1c
	FEf0HjedacN5Dhzxg1eRLiaKAuq3eXVWoF+o+kNL+h59EAEwGjyJQN+NA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yqg4dg771-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 18:51:59 +0000 (GMT)
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45CIpxIO020141;
	Wed, 12 Jun 2024 18:51:59 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yqg4dg76w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 18:51:59 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45CHk4Qm023609;
	Wed, 12 Jun 2024 18:51:58 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3yn3umrent-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 18:51:58 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45CIpqDG34603636
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Jun 2024 18:51:55 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C7FAE20040;
	Wed, 12 Jun 2024 18:51:52 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CEB832004B;
	Wed, 12 Jun 2024 18:51:49 +0000 (GMT)
Received: from li-80eaad4c-2afd-11b2-a85c-af8123d033e3.ibm.com (unknown [9.124.218.62])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 12 Jun 2024 18:51:49 +0000 (GMT)
From: "Nysal Jan K.A." <nysal@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 2/2] powerpc/topology: Check if a core is online
Date: Thu, 13 Jun 2024 00:20:38 +0530
Message-ID: <20240612185046.1826891-3-nysal@linux.ibm.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240612185046.1826891-1-nysal@linux.ibm.com>
References: <20240612185046.1826891-1-nysal@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: y0CmASwOnchMM_lNxM3pTCqYDpQRyUjC
X-Proofpoint-ORIG-GUID: 7A2i1_wFaeyJnh6LWP4SYwqr0LtVLDaj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_09,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 bulkscore=0 mlxlogscore=986 impostorscore=0 spamscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406120131
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, "Nysal Jan K.A" <nysal@linux.ibm.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Nysal Jan K.A" <nysal@linux.ibm.com>

topology_is_core_online() checks if the core a CPU belongs to
is online. The core is online if at least one of the sibling
CPUs is online. The first CPU of an online core is also online
in the common case, so this should be fairly quick.

Signed-off-by: Nysal Jan K.A <nysal@linux.ibm.com>
---
 arch/powerpc/include/asm/topology.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
index f4e6f2dd04b7..16bacfe8c7a2 100644
--- a/arch/powerpc/include/asm/topology.h
+++ b/arch/powerpc/include/asm/topology.h
@@ -145,6 +145,7 @@ static inline int cpu_to_coregroup_id(int cpu)
 
 #ifdef CONFIG_HOTPLUG_SMT
 #include <linux/cpu_smt.h>
+#include <linux/cpumask.h>
 #include <asm/cputhreads.h>
 
 static inline bool topology_is_primary_thread(unsigned int cpu)
@@ -156,6 +157,18 @@ static inline bool topology_smt_thread_allowed(unsigned int cpu)
 {
 	return cpu_thread_in_core(cpu) < cpu_smt_num_threads;
 }
+
+#define topology_is_core_online topology_is_core_online
+static inline bool topology_is_core_online(unsigned int cpu)
+{
+	int i, first_cpu = cpu_first_thread_sibling(cpu);
+
+	for (i = first_cpu; i < first_cpu + threads_per_core; ++i) {
+		if (cpu_online(i))
+			return true;
+	}
+	return false;
+}
 #endif
 
 #endif /* __KERNEL__ */
-- 
2.35.3

