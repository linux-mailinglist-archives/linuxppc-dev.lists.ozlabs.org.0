Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC982A8366
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 17:22:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRphh3WKDzDr6P
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 03:22:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=cheloha@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=D1Fj/ggy; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRpf63BGZzDr5Q
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Nov 2020 03:20:30 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A5G6iOu140624; Thu, 5 Nov 2020 11:20:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=EiJYfRQI1jsb9ufeIkJT458ZtWLXSCdW6Inff7g19iI=;
 b=D1Fj/ggy5SrKmHmZC86OEBXaPoTYh4/IyXao74NpGjc2Bl4puLSGl4NFal6F95empyZQ
 5GjhOaWUp/cAs+0yNDsADJdUoriykJSuzXktTx+q7vTbeJSHACqWxliToHRSCMuSklEe
 +6GNbIoKgO85Dne+CJBHgis0FmFK7CyNZMZD3bnSWVOz6WS/qCOebYbql1k5REfMTmJ+
 PkEkb74EbsMY7BZj9Vnr+Q7d8DcnJrR48jUG0UAqYMT+QmC1J+pDDWqxgXea8ixSIsaC
 XYUedxOwNKHF5LA/ZpXO12BWEXNMSn2RVoVx6FO/9OdF9TG8a7vs37aatWBvCOPcIZ+R SQ== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34m5ftk73h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Nov 2020 11:20:21 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0A5GDNIZ030123;
 Thu, 5 Nov 2020 16:20:20 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03wdc.us.ibm.com with ESMTP id 34h0fk88v0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Nov 2020 16:20:20 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0A5GKDPb7144158
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Nov 2020 16:20:13 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 09CF0C6055;
 Thu,  5 Nov 2020 16:20:19 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C855BC605A;
 Thu,  5 Nov 2020 16:20:18 +0000 (GMT)
Received: from rascal.austin.ibm.com (unknown [9.41.179.32])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  5 Nov 2020 16:20:18 +0000 (GMT)
From: Scott Cheloha <cheloha@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: topology.h: fix build when CONFIG_NUMA=n
Date: Thu,  5 Nov 2020 10:20:18 -0600
Message-Id: <20201105162018.3559108-1-cheloha@linux.ibm.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-05_09:2020-11-05,
 2020-11-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 mlxscore=0 phishscore=0 suspectscore=1 clxscore=1011 bulkscore=0
 priorityscore=1501 mlxlogscore=983 adultscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011050106
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
 Laurent Dufour <ldufour@linux.ibm.com>, kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a non-NUMA definition for of_drconf_to_nid_single() to topology.h
so we have one even if powerpc/mm/numa.c is not compiled.  On a non-NUMA
kernel the appropriate node id is always first_online_node.

Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
Reported-by: kernel test robot <lkp@intel.com>
Fixes: 72cdd117c449 ("pseries/hotplug-memory: hot-add: skip redundant LMB lookup")
---
 arch/powerpc/include/asm/topology.h | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
index 8728590f514a..90d2424418b5 100644
--- a/arch/powerpc/include/asm/topology.h
+++ b/arch/powerpc/include/asm/topology.h
@@ -61,6 +61,10 @@ static inline int early_cpu_to_node(int cpu)
 	 */
 	return (nid < 0) ? 0 : nid;
 }
+
+struct drmem_lmb;
+extern int of_drconf_to_nid_single(struct drmem_lmb *lmb);
+
 #else
 
 static inline int early_cpu_to_node(int cpu) { return 0; }
@@ -84,10 +88,13 @@ static inline int cpu_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
 	return 0;
 }
 
-#endif /* CONFIG_NUMA */
-
 struct drmem_lmb;
-int of_drconf_to_nid_single(struct drmem_lmb *lmb);
+static inline int of_drconf_to_nid_single(struct drmem_lmb *lmb)
+{
+	return first_online_node;
+}
+
+#endif /* CONFIG_NUMA */
 
 #if defined(CONFIG_NUMA) && defined(CONFIG_PPC_SPLPAR)
 extern int find_and_online_cpu_nid(int cpu);
-- 
2.28.0

