Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAB9A1148
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 07:57:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JsN402FfzDrQw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 15:57:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com;
 envelope-from=srikar@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JsDH4BFLzDrKj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 15:51:11 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7T5mVkc164522
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 01:51:06 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2umnmwskd8-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 01:50:57 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <srikar@linux.vnet.ibm.com>;
 Thu, 29 Aug 2019 06:50:47 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 29 Aug 2019 06:50:45 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7T5oiPl48103556
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Aug 2019 05:50:44 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB3AD42041;
 Thu, 29 Aug 2019 05:50:44 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1C9DC42047;
 Thu, 29 Aug 2019 05:50:43 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.204.205.139])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 29 Aug 2019 05:50:42 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 2/4] powerpc/numa: Handle extra hcall_vphn error cases
Date: Thu, 29 Aug 2019 11:20:21 +0530
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190829055023.6171-1-srikar@linux.vnet.ibm.com>
References: <20190829055023.6171-1-srikar@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19082905-0020-0000-0000-0000036521D1
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082905-0021-0000-0000-000021BA7801
Message-Id: <20190829055023.6171-3-srikar@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-29_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908290063
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently code handles H_FUNCTION, H_SUCCESS, H_HARDWARE return codes.
However hcall_vphn can return other return codes. Now it also handles
H_PARAMETER return code.  Also the rest return codes are handled under the
default case.

Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
Reported-by: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
---
Changelog (v2->v1):
 Handled comments from Nathan:
  - Split patch from patch 1.
  - Corrected a problem where I missed calling stop_topology_update().
  - Using pr_err_ratelimited instead of printk.

 arch/powerpc/mm/numa.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 50d68d2..8fbe57c 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -1191,23 +1191,30 @@ static long vphn_get_associativity(unsigned long cpu,
 				VPHN_FLAG_VCPU, associativity);
 
 	switch (rc) {
+	case H_SUCCESS:
+		dbg("VPHN hcall succeeded. Reset polling...\n");
+		timed_topology_update(0);
+		goto out;
+
 	case H_FUNCTION:
-		printk_once(KERN_INFO
-			"VPHN is not supported. Disabling polling...\n");
-		stop_topology_update();
+		pr_err_ratelimited("VPHN unsupported. Disabling polling...\n");
 		break;
 	case H_HARDWARE:
-		printk(KERN_ERR
-			"hcall_vphn() experienced a hardware fault "
+		pr_err_ratelimited("hcall_vphn() experienced a hardware fault "
 			"preventing VPHN. Disabling polling...\n");
-		stop_topology_update();
 		break;
-	case H_SUCCESS:
-		dbg("VPHN hcall succeeded. Reset polling...\n");
-		timed_topology_update(0);
+	case H_PARAMETER:
+		pr_err_ratelimited("hcall_vphn() was passed an invalid parameter. "
+			"Disabling polling...\n");
+		break;
+	default:
+		pr_err_ratelimited("hcall_vphn() returned %ld. Disabling polling...\n"
+			, rc);
 		break;
 	}
 
+	stop_topology_update();
+out:
 	return rc;
 }
 
-- 
1.8.3.1

