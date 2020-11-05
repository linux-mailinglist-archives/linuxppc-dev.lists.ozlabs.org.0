Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CC22A89DA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 23:32:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRyv55RgwzDr7n
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 09:32:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRysS6vLzzDr7W
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Nov 2020 09:30:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=hRd62O3N; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4CRysS5khrz8tKX
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Nov 2020 09:30:52 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4CRysS4w3Bz9sTL; Fri,  6 Nov 2020 09:30:52 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=cheloha@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=hRd62O3N; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4CRysR5h7dz9sTD
 for <linuxppc-dev@ozlabs.org>; Fri,  6 Nov 2020 09:30:50 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0A5LxR0s080593; Thu, 5 Nov 2020 17:30:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=8nFnAVkWVUToEVibzHOY2DIjx+gBUWwpXWRhVwXeeEQ=;
 b=hRd62O3NwqpqUMGxXitFGyZ7duLZ2bf3Qo3tLmINjek+0/HI+HMfd/8ldfI71iPTlU9s
 m+piQ7VQ7U04SuZ4dPWLGkAoKUXsQO4jV0mPK1XabS4WMOP4WuHKJodvB012G/YAnsvG
 i9m5RvGH2pZZnuk4+XzG082H1R+HqrWzaoc5upgjTIzX9HVE8HFUByqjqr2b/vCdxcBG
 axOxjQ5DquMTR2KYHIQEBcpeybbJgKNjYVKyYrhdnWSxomryJCYsxi14LK0RpA1VukFc
 zU3UQKeVbUggebBVumoir3/fX8KyjAaxXiYOlj2dXhUfofjp/jhA4h8TYhlUiPAQDy7L FA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34mfdgqrmp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Nov 2020 17:30:42 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0A5MLZR3011440;
 Thu, 5 Nov 2020 22:30:41 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02dal.us.ibm.com with ESMTP id 34h0230equ-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Nov 2020 22:30:41 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0A5MUeVS11207222
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Nov 2020 22:30:40 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CDB52112062;
 Thu,  5 Nov 2020 22:30:40 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6B28B112066;
 Thu,  5 Nov 2020 22:30:40 +0000 (GMT)
Received: from rascal.austin.ibm.com (unknown [9.41.179.32])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  5 Nov 2020 22:30:40 +0000 (GMT)
From: Scott Cheloha <cheloha@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2] powerpc: topology.h: fix build when CONFIG_NUMA=n
Date: Thu,  5 Nov 2020 16:30:40 -0600
Message-Id: <20201105223040.3612663-1-cheloha@linux.ibm.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-05_15:2020-11-05,
 2020-11-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 clxscore=1011 phishscore=0 adultscore=0
 suspectscore=1 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011050139
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
 Laurent Dufour <ldufour@linux.vnet.ibm.com>, kernel test robot <lkp@intel.com>
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
v1: Initial patch.

v2: Incorporate suggested cleanups from Christophe Leroy.

 arch/powerpc/include/asm/topology.h | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
index 8728590f514a..3beeb030cd78 100644
--- a/arch/powerpc/include/asm/topology.h
+++ b/arch/powerpc/include/asm/topology.h
@@ -6,6 +6,7 @@
 
 struct device;
 struct device_node;
+struct drmem_lmb;
 
 #ifdef CONFIG_NUMA
 
@@ -61,6 +62,9 @@ static inline int early_cpu_to_node(int cpu)
 	 */
 	return (nid < 0) ? 0 : nid;
 }
+
+int of_drconf_to_nid_single(struct drmem_lmb *lmb);
+
 #else
 
 static inline int early_cpu_to_node(int cpu) { return 0; }
@@ -84,10 +88,12 @@ static inline int cpu_distance(__be32 *cpu1_assoc, __be32 *cpu2_assoc)
 	return 0;
 }
 
-#endif /* CONFIG_NUMA */
+static inline int of_drconf_to_nid_single(struct drmem_lmb *lmb)
+{
+	return first_online_node;
+}
 
-struct drmem_lmb;
-int of_drconf_to_nid_single(struct drmem_lmb *lmb);
+#endif /* CONFIG_NUMA */
 
 #if defined(CONFIG_NUMA) && defined(CONFIG_PPC_SPLPAR)
 extern int find_and_online_cpu_nid(int cpu);
-- 
2.28.0

