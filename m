Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5637A4F5A38
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 11:41:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYKK71f49z3brQ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 19:41:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hTD1XTZZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=hTD1XTZZ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYKGJ3HKlz3bWf
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Apr 2022 19:39:04 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2367agwh016828; 
 Wed, 6 Apr 2022 09:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ITp8q4UYi9x1cC9nY/guKwg/ooAJDffjoQMTkQA9u24=;
 b=hTD1XTZZjY2dWh5oV+wQfpPMSCnIp2aGG6BARePQQaWI74Q6ccNmNoiFdFWrEA1zPL4I
 2TgcV8LdAjbn60Qoa/4yF5sVAiKvUKwczVKXFepVbubvi+MhvDlg89P3A5G+2GYFLnS/
 8sFvms/wY8Fo451yHXU3WPLkmgD4AzXtjG2bNXz1OGNaaXgrwT8ErXSjTYDezOslMIMi
 ccNOlIq/EY17QKv7kdy72xJ0AoGbFx3dWqjRzcNHmZkkZcnKun3rQFq1I9idKiBtOdLX
 EBYofefbey5y05Upo9b1Ac94wRn9bOVTrK2wQfOt5uMQKP/+Dw4iI7p/J5w109XF/DDT hA== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f8txynxxg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Apr 2022 09:38:59 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2369bDIN007267;
 Wed, 6 Apr 2022 09:38:56 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 3f6drhqfwj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Apr 2022 09:38:56 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2369cr6X40305124
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 6 Apr 2022 09:38:53 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 18F6052050;
 Wed,  6 Apr 2022 09:38:53 +0000 (GMT)
Received: from hbathini-workstation.ibm.com.domain.name (unknown
 [9.211.33.167])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id A330A5204F;
 Wed,  6 Apr 2022 09:38:50 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 3/3] powerpc/fadump: print start of preserved area
Date: Wed,  6 Apr 2022 15:08:39 +0530
Message-Id: <20220406093839.206608-4-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406093839.206608-1-hbathini@linux.ibm.com>
References: <20220406093839.206608-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7VlxvMlruilNlD0kPyHtxKJ2kj3Zalrq
X-Proofpoint-ORIG-GUID: 7VlxvMlruilNlD0kPyHtxKJ2kj3Zalrq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-06_03,2022-04-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204060044
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
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Print preserved area start address in fadump_region_show() function.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/opal-fadump.c | 6 +++---
 arch/powerpc/platforms/pseries/rtas-fadump.c | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal-fadump.c b/arch/powerpc/platforms/powernv/opal-fadump.c
index c8ad057c7221..c56fb5a7146a 100644
--- a/arch/powerpc/platforms/powernv/opal-fadump.c
+++ b/arch/powerpc/platforms/powernv/opal-fadump.c
@@ -578,10 +578,10 @@ static void opal_fadump_region_show(struct fw_dump *fadump_conf,
 			   fdm_ptr->rgn[i].size, dumped_bytes);
 	}
 
-	/* Dump is active. Show reserved area start address. */
+	/* Dump is active. Show preserved area start address. */
 	if (fadump_conf->dump_active) {
-		seq_printf(m, "\nMemory above %#016lx is reserved for saving crash dump\n",
-			   fadump_conf->reserve_dump_area_start);
+		seq_printf(m, "\nMemory above %#016llx is reserved for saving crash dump\n",
+			   fadump_conf->boot_mem_top);
 	}
 }
 
diff --git a/arch/powerpc/platforms/pseries/rtas-fadump.c b/arch/powerpc/platforms/pseries/rtas-fadump.c
index 764df25304bd..50b140c7b513 100644
--- a/arch/powerpc/platforms/pseries/rtas-fadump.c
+++ b/arch/powerpc/platforms/pseries/rtas-fadump.c
@@ -468,10 +468,10 @@ static void rtas_fadump_region_show(struct fw_dump *fadump_conf,
 		   be64_to_cpu(fdm_ptr->rmr_region.source_len),
 		   be64_to_cpu(fdm_ptr->rmr_region.bytes_dumped));
 
-	/* Dump is active. Show reserved area start address. */
+	/* Dump is active. Show preserved area start address. */
 	if (fdm_active) {
-		seq_printf(m, "\nMemory above %#016lx is reserved for saving crash dump\n",
-			   fadump_conf->reserve_dump_area_start);
+		seq_printf(m, "\nMemory above %#016llx is reserved for saving crash dump\n",
+			   fadump_conf->boot_mem_top);
 	}
 }
 
-- 
2.35.1

