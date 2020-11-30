Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D51202C7D75
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 04:46:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ckrjz08XKzDr2w
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 14:45:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=iaDii9eC; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ckrh96NCJzDqxq
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 14:44:25 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AU3Vdxi068221; Sun, 29 Nov 2020 22:44:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=oRf9EInfCGO5sUmEtaw9uY2++dG2WvO9kAmuWejfdDs=;
 b=iaDii9eC92UsjDpDKy87bbSr+rlJI6FMag4DdVk+koJ5XuPS8NmNGN0cjPvSTwavPIrR
 9jaCTkxxy3fc8DkBvBIazqY4pyhhRyfGYXHgXFPoueeH3opJpURNhAV6W3T8oh8LB703
 j1UgB2C7qERBFkgDsb/pg9BEm32owJAWESc2n5yfHvBTL5w09tZzcBXHuLqDRROEs/3R
 eG92X+P5mj4Ngh+eoS1ZkYsr2UQamjwybzIjpHgLOzbCRkN1yy8pWJpR9CgyD7gowWGN
 eWPIpQj2cFqwV1dOQJB11a2VX6zCqnvf3ODQNPmt2R9lU3sKPT+e1Jcwfz1qnlRqntRA SA== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 354q0ct5uc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 29 Nov 2020 22:44:15 -0500
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AU3iDco003805;
 Mon, 30 Nov 2020 03:44:13 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06fra.de.ibm.com with ESMTP id 353dth8thq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Nov 2020 03:44:13 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AU3iBPW5112384
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Nov 2020 03:44:11 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3886242049;
 Mon, 30 Nov 2020 03:44:11 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9071942042;
 Mon, 30 Nov 2020 03:44:09 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.39.210])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 30 Nov 2020 03:44:09 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/xmon: Fix build failure for 8xx
Date: Mon, 30 Nov 2020 09:14:06 +0530
Message-Id: <20201130034406.288047-1-ravi.bangoria@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-29_12:2020-11-26,
 2020-11-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 suspectscore=3
 phishscore=0 bulkscore=0 mlxscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011300018
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
Cc: christophe.leroy@c-s.fr, ravi.bangoria@linux.ibm.com, mikey@neuling.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With CONFIG_PPC_8xx and CONFIG_XMON set, kernel build fails with

  arch/powerpc/xmon/xmon.c:1379:12: error: 'find_free_data_bpt' defined
  but not used [-Werror=unused-function]

Fix it by enclosing find_free_data_bpt() inside #ifndef CONFIG_PPC_8xx.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 30df74d67d48 ("powerpc/watchpoint/xmon: Support 2nd DAWR")
Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 arch/powerpc/xmon/xmon.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 55c43a6c9111..5559edf36756 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -1383,6 +1383,7 @@ static long check_bp_loc(unsigned long addr)
 	return 1;
 }
 
+#ifndef CONFIG_PPC_8xx
 static int find_free_data_bpt(void)
 {
 	int i;
@@ -1394,6 +1395,7 @@ static int find_free_data_bpt(void)
 	printf("Couldn't find free breakpoint register\n");
 	return -1;
 }
+#endif
 
 static void print_data_bpts(void)
 {
-- 
2.17.1

