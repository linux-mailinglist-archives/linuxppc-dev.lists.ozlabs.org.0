Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B14857B41
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 07:23:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Z7bw4j9XzDqjH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 15:23:56 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Z7QX4ZNYzDqdM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 15:15:48 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5R5D44m129475
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 01:15:46 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tcpr8sky4-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 01:15:46 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <nathanl@linux.ibm.com>;
 Thu, 27 Jun 2019 06:15:45 +0100
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 27 Jun 2019 06:15:44 +0100
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5R5FhY550069792
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 05:15:43 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 01DF1BE04F
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 05:15:43 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA94EBE053
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 05:15:42 +0000 (GMT)
Received: from localhost (unknown [9.80.233.188])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 05:15:42 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/4] powerpc/cacheinfo: warn if cache object chain becomes
 unordered
Date: Thu, 27 Jun 2019 00:15:37 -0500
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190627051537.7298-1-nathanl@linux.ibm.com>
References: <20190627051537.7298-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19062705-0012-0000-0000-000017497460
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011338; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01223849; UDB=6.00644095; IPR=6.01005038; 
 MB=3.00027484; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-27 05:15:45
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062705-0013-0000-0000-000057D95DA5
Message-Id: <20190627051537.7298-5-nathanl@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-27_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906270056
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

This can catch cases where the device tree has gotten mishandled into
an inconsistent state at runtime, e.g. the cache nodes for both the
source and the destination are present after a migration.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/cacheinfo.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/powerpc/kernel/cacheinfo.c b/arch/powerpc/kernel/cacheinfo.c
index 30be2cdc8aa9..5938aeeba8c0 100644
--- a/arch/powerpc/kernel/cacheinfo.c
+++ b/arch/powerpc/kernel/cacheinfo.c
@@ -425,6 +425,15 @@ static void link_cache_lists(struct cache *smaller, struct cache *bigger)
 	}
 
 	smaller->next_local = bigger;
+
+	/*
+	 * The cache->next_local list sorts by level ascending:
+	 * L1d -> L1i -> L2 -> L3 ...
+	 */
+	WARN_ONCE((smaller->level == 1 && bigger->level > 2) ||
+		  (smaller->level > 1 && bigger->level != smaller->level + 1),
+		  "linking L%i cache %pOFP to L%i cache %pOFP; skipped a level?\n",
+		  smaller->level, smaller->ofnode, bigger->level, bigger->ofnode);
 }
 
 static void do_subsidiary_caches_debugcheck(struct cache *cache)
-- 
2.20.1

