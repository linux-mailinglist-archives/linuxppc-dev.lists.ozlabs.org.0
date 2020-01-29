Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE1014CC03
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 15:04:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4874x326s6zDqRm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2020 01:04:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4874hK5y44zDqQW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2020 00:53:37 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00TDqlol160857
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 08:53:35 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xrvw8xp2m-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 08:53:33 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <srikar@linux.vnet.ibm.com>;
 Wed, 29 Jan 2020 13:53:19 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 29 Jan 2020 13:53:16 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 00TDrF4746661926
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jan 2020 13:53:15 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 60880A4064;
 Wed, 29 Jan 2020 13:53:15 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF6FBA405C;
 Wed, 29 Jan 2020 13:53:12 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.193.110.254])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 29 Jan 2020 13:53:12 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v6 2/5] powerpc/numa: Handle extra hcall_vphn error cases
Date: Wed, 29 Jan 2020 19:22:58 +0530
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200129135301.24739-1-srikar@linux.vnet.ibm.com>
References: <20200129135301.24739-1-srikar@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 20012913-4275-0000-0000-0000039C0517
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20012913-4276-0000-0000-000038B0203C
Message-Id: <20200129135301.24739-3-srikar@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-29_03:2020-01-28,
 2020-01-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 spamscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1911200001 definitions=main-2001290115
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
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
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
Cc: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Cc: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
Reported-by: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
Reviewed-by: Nathan Lynch <nathanl@linux.ibm.com>
---
Changelog (v2->v1):
 Handled comments from Nathan:
  - Split patch from patch 1.
  - Corrected a problem where I missed calling stop_topology_update().
  - Using pr_err_ratelimited instead of printk.

 arch/powerpc/mm/numa.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

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

