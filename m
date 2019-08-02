Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F5C8010A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 21:35:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460cnw2LmZzDr7f
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Aug 2019 05:35:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460cg31j2pzDrCN
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Aug 2019 05:29:34 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x72JRSrV081047
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 2 Aug 2019 15:29:31 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2u4s97n3k1-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Aug 2019 15:29:31 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <nathanl@linux.ibm.com>;
 Fri, 2 Aug 2019 20:29:31 +0100
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 2 Aug 2019 20:29:29 +0100
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x72JTSGt50331930
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 2 Aug 2019 19:29:28 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3AD9EB206B
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 19:29:28 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 173E6B2064
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 19:29:28 +0000 (GMT)
Received: from localhost (unknown [9.80.205.161])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 19:29:27 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/3] powerpc/rtas: allow rescheduling while changing cpu
 states
Date: Fri,  2 Aug 2019 14:29:25 -0500
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190802192926.19277-1-nathanl@linux.ibm.com>
References: <20190802192926.19277-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19080219-0064-0000-0000-00000405ACE7
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011539; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000287; SDB=6.01241144; UDB=6.00654545; IPR=6.01022575; 
 MB=3.00028013; MTD=3.00000008; XFM=3.00000015; UTC=2019-08-02 19:29:29
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19080219-0065-0000-0000-00003E851CB7
Message-Id: <20190802192926.19277-3-nathanl@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-02_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=750 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908020205
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

rtas_cpu_state_change_mask() potentially operates on scores of cpus,
so explicitly allow rescheduling in the loop body.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/rtas.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 05824eb4323b..b7ca2fde68a9 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -16,6 +16,7 @@
 #include <linux/capability.h>
 #include <linux/delay.h>
 #include <linux/cpu.h>
+#include <linux/sched.h>
 #include <linux/smp.h>
 #include <linux/completion.h>
 #include <linux/cpumask.h>
@@ -898,6 +899,7 @@ static int rtas_cpu_state_change_mask(enum rtas_cpu_state state,
 				cpumask_clear_cpu(cpu, cpus);
 			}
 		}
+		cond_resched();
 	}
 
 	return ret;
-- 
2.20.1

