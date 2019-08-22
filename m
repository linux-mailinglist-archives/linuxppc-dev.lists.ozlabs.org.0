Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EF199763
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 16:52:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DnZc4GWFzDqvH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 00:52:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=srikar@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DnMG4fZWzDqZQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2019 00:43:06 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7MEeIh7137096
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 10:43:03 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uhuesvyjj-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 10:43:03 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <srikar@linux.vnet.ibm.com>;
 Thu, 22 Aug 2019 15:43:01 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 22 Aug 2019 15:42:58 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7MEgvPb63176876
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Aug 2019 14:42:57 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 87DFB4C040;
 Thu, 22 Aug 2019 14:42:57 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 891844C044;
 Thu, 22 Aug 2019 14:42:56 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.122.211.52])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 22 Aug 2019 14:42:56 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/3] powerpc/vphn: Check for error from hcall_vphn
Date: Thu, 22 Aug 2019 20:12:33 +0530
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190822144235.19398-1-srikar@linux.vnet.ibm.com>
References: <20190822144235.19398-1-srikar@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19082214-0028-0000-0000-0000039286AA
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082214-0029-0000-0000-00002454B253
Message-Id: <20190822144235.19398-2-srikar@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-22_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908220148
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
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is no point in unpacking associativity, if
H_HOME_NODE_ASSOCIATIVITY hcall has returned an error.

Also added error messages for H_PARAMETER and default case in
vphn_get_associativity.

Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Reported-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
Reported-by: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
---
 arch/powerpc/mm/numa.c                | 16 +++++++++++++---
 arch/powerpc/platforms/pseries/vphn.c |  3 ++-
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 50d68d2..88b5157 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -1191,6 +1191,10 @@ static long vphn_get_associativity(unsigned long cpu,
 				VPHN_FLAG_VCPU, associativity);
 
 	switch (rc) {
+	case H_SUCCESS:
+		dbg("VPHN hcall succeeded. Reset polling...\n");
+		timed_topology_update(0);
+		break;
 	case H_FUNCTION:
 		printk_once(KERN_INFO
 			"VPHN is not supported. Disabling polling...\n");
@@ -1202,9 +1206,15 @@ static long vphn_get_associativity(unsigned long cpu,
 			"preventing VPHN. Disabling polling...\n");
 		stop_topology_update();
 		break;
-	case H_SUCCESS:
-		dbg("VPHN hcall succeeded. Reset polling...\n");
-		timed_topology_update(0);
+	case H_PARAMETER:
+		printk(KERN_ERR
+			"hcall_vphn() was passed an invalid parameter."
+			"Disabling polling...\n");
+		break;
+	default:
+		printk(KERN_ERR
+			"hcall_vphn() returned %ld. Disabling polling \n", rc);
+		stop_topology_update();
 		break;
 	}
 
diff --git a/arch/powerpc/platforms/pseries/vphn.c b/arch/powerpc/platforms/pseries/vphn.c
index 3f07bf6..cca474a 100644
--- a/arch/powerpc/platforms/pseries/vphn.c
+++ b/arch/powerpc/platforms/pseries/vphn.c
@@ -82,7 +82,8 @@ long hcall_vphn(unsigned long cpu, u64 flags, __be32 *associativity)
 	long retbuf[PLPAR_HCALL9_BUFSIZE] = {0};
 
 	rc = plpar_hcall9(H_HOME_NODE_ASSOCIATIVITY, retbuf, flags, cpu);
-	vphn_unpack_associativity(retbuf, associativity);
+	if (rc == H_SUCCESS)
+		vphn_unpack_associativity(retbuf, associativity);
 
 	return rc;
 }
-- 
1.8.3.1

