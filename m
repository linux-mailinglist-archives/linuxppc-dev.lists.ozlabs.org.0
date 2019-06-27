Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9714757B3E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 07:22:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Z7ZG0cgwzDq5t
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 15:22:30 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Z7QW6KZwzDqdM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 15:15:47 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5R5CCjC081053
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 01:15:45 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tcpwg9ayt-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 01:15:45 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <nathanl@linux.ibm.com>;
 Thu, 27 Jun 2019 06:15:44 +0100
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 27 Jun 2019 06:15:42 +0100
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5R5Fgng57934318
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 05:15:42 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F13AF7805F
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 05:15:41 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B2EB378060
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 05:15:41 +0000 (GMT)
Received: from localhost (unknown [9.80.233.188])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 05:15:41 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/4] powerpc/cacheinfo: improve diagnostics about malformed
 cache lists
Date: Thu, 27 Jun 2019 00:15:36 -0500
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190627051537.7298-1-nathanl@linux.ibm.com>
References: <20190627051537.7298-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19062705-0004-0000-0000-00001521893B
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011338; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01223849; UDB=6.00644095; IPR=6.01005038; 
 MB=3.00027484; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-27 05:15:43
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062705-0005-0000-0000-00008C3CEE78
Message-Id: <20190627051537.7298-4-nathanl@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-27_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=506 adultscore=0 classifier=spam adjust=0 reason=mlx
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

If we have a bug which causes us to start with the wrong kind of OF
node when linking up the cache tree, it's helpful for debugging to
print information about what we found vs what we expected. So replace
uses of WARN_ON_ONCE with WARN_ONCE, which lets us include an
informative message instead of a contentless backtrace.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/cacheinfo.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/cacheinfo.c b/arch/powerpc/kernel/cacheinfo.c
index d8200f7e1075..30be2cdc8aa9 100644
--- a/arch/powerpc/kernel/cacheinfo.c
+++ b/arch/powerpc/kernel/cacheinfo.c
@@ -429,8 +429,14 @@ static void link_cache_lists(struct cache *smaller, struct cache *bigger)
 
 static void do_subsidiary_caches_debugcheck(struct cache *cache)
 {
-	WARN_ON_ONCE(cache->level != 1);
-	WARN_ON_ONCE(!of_node_is_type(cache->ofnode, "cpu"));
+	WARN_ONCE(cache->level != 1,
+		  "instantiating cache chain from L%d %s cache for "
+		  "%pOFP instead of an L1\n", cache->level,
+		  cache_type_string(cache), cache->ofnode);
+	WARN_ONCE(!of_node_is_type(cache->ofnode, "cpu"),
+		  "instantiating cache chain from node %pOFP of type '%s' "
+		  "instead of a cpu node\n", cache->ofnode,
+		  of_node_get_device_type(cache->ofnode));
 }
 
 static void do_subsidiary_caches(struct cache *cache)
-- 
2.20.1

