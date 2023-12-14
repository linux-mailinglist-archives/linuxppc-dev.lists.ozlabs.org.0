Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 642A3813983
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 19:11:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bkSWeCSy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SrgR40f5Cz3dXj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Dec 2023 05:11:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bkSWeCSy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SrgMS0WK9z3cXR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Dec 2023 05:08:35 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BEHlgGm019669;
	Thu, 14 Dec 2023 18:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=8au+0nL1pt5CKf9ZgB7sDRFqKE6Qpu8bTuZNpB3Zptk=;
 b=bkSWeCSynhyAHcZr2YRUKSq7NDnGuuX1fjHcglu979+ngeiOyoQaYak18Jg/vCK4J9h5
 BRmO2eWeJ8rxX8JnCyN8UzIBqaBHOdC3unOJbzrcxeJqy/Pd+HbblXJ/I5m8PABWP+kY
 LQoB3XTIBZy6xPcZCmkce064dJ2rTbsxCb9tomvVQdbPCT4ru9a4kTn91TLVSeIdB3JI
 jKc8zQuNHJF+HLZrahqQc5KOmOHI4dGVPVkPcSS1VDUFiABE8f6RPumCcKuyPR4OxFMp
 gf6K0lAKCT7tdpv5I0UhR0hdcIw2Q1Ii1scdqzi7zYHINFLjSOHpDNZl+asKfEJDXX5R Hw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3v06dt8kbn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 18:08:14 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3BEHwbju027232;
	Thu, 14 Dec 2023 18:08:14 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3v06dt8kat-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 18:08:13 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3BEHFTVB028201;
	Thu, 14 Dec 2023 18:08:12 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3uw2y02mcv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Dec 2023 18:08:12 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3BEI8ArB35979746
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Dec 2023 18:08:10 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3BDF82004D;
	Thu, 14 Dec 2023 18:08:10 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EE2C520049;
	Thu, 14 Dec 2023 18:08:06 +0000 (GMT)
Received: from sapthagiri.in.ibm.com (unknown [9.43.25.55])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 14 Dec 2023 18:08:06 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v5 3/5] powerpc/smp: Add __ro_after_init attribute
Date: Thu, 14 Dec 2023 23:37:13 +0530
Message-ID: <20231214180720.310852-4-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231214180720.310852-1-srikar@linux.vnet.ibm.com>
References: <20231214180720.310852-1-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MHIr5yUDEde61GlGsZ7gwRI-NtUZEVWC
X-Proofpoint-ORIG-GUID: g9qjwy0Yi1aamis85_8M0LNRA0iMeVge
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-14_12,2023-12-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 mlxscore=0 suspectscore=0 bulkscore=0
 spamscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312140128
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
Cc: Mark Rutland <mark.rutland@arm.com>, Valentin Schneider <vschneid@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Srikar Dronamraju <srikar@linux.vnet.ibm.com>, "Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, "ndesaulniers@google.com" <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, Aneesh <aneesh.kumar@kernel.org>, Rohan McLure <rmclure@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are some variables that are only updated at boot time.
So add __ro_after_init attribute to such variables

Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
Changelog:
v2 -> v3:
Use __ro_after_init instead of __read_mostly
Suggested by : Peter Zijlstra and Michael Ellerman

 arch/powerpc/kernel/smp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 2cebc53e97f9..aea149627209 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -77,10 +77,10 @@ static DEFINE_PER_CPU(int, cpu_state) = { 0 };
 #endif
 
 struct task_struct *secondary_current;
-bool has_big_cores;
-bool coregroup_enabled;
-bool thread_group_shares_l2;
-bool thread_group_shares_l3;
+bool has_big_cores __ro_after_init;
+bool coregroup_enabled __ro_after_init;
+bool thread_group_shares_l2 __ro_after_init;
+bool thread_group_shares_l3 __ro_after_init;
 
 DEFINE_PER_CPU(cpumask_var_t, cpu_sibling_map);
 DEFINE_PER_CPU(cpumask_var_t, cpu_smallcore_map);
@@ -987,7 +987,7 @@ static int __init init_thread_group_cache_map(int cpu, int cache_property)
 	return 0;
 }
 
-static bool shared_caches;
+static bool shared_caches __ro_after_init;
 
 #ifdef CONFIG_SCHED_SMT
 /* cpumask of CPUs with asymmetric SMT dependency */
-- 
2.35.3

