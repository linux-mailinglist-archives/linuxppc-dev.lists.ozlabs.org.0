Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE995530E79
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 May 2022 12:54:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6Djm5XxCz3btT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 May 2022 20:54:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RdASwsNQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=RdASwsNQ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6Dj62HF8z305G
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 May 2022 20:54:01 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24N8TVsf013713;
 Mon, 23 May 2022 10:53:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=6UMUzwDk7Knl7yKff6zPUr/I01UUIQ+Vb7Q4pZVZB9w=;
 b=RdASwsNQj7yr8ejsBvywyjnTVWgZyMTVlA9tqNMRgm+NOS/Wy0uVZRhkx/PGAd01CGqs
 VGIG29rnq5SSsbcsJzj8Gmf/FEdF1xyFn73flYI9bi/UPZzlv3XcV8aDHYH7VEWNyRGH
 rid4s8SjlTYKKZjjvXOg488YIvJPWlq+r/7DOavqg+EnzqE8iGzg6lFUqrljSA8BnYLx
 eT9qHbD/XJdIcWI/TRt3Khb3sfwtzllmKevLiTsBRKvo53bGvrPeH7l78BHdKLi3PjyF
 /2D+jJINTeLfD5YUKPfr+tfrGxTdz7e8W1vR7EmlHBfyjWj9uY+zVUXpRSetLS4pESxp fQ== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g79daawyn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 May 2022 10:53:55 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24NAU9eW025669;
 Mon, 23 May 2022 10:53:54 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma02dal.us.ibm.com with ESMTP id 3g6qq9b8h9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 May 2022 10:53:54 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24NArqMG21561850
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 May 2022 10:53:52 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D63FD136053;
 Mon, 23 May 2022 10:53:52 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39B7413604F;
 Mon, 23 May 2022 10:53:51 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.56.196])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 23 May 2022 10:53:50 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [RFC PATCH] powerpc/numa: Return the first online node if device tree
 mapping returns a not online node
Date: Mon, 23 May 2022 16:23:42 +0530
Message-Id: <20220523105342.229906-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 026URZ6Z-zsojEyDqd-ctHYVn5S65V_H
X-Proofpoint-GUID: 026URZ6Z-zsojEyDqd-ctHYVn5S65V_H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-23_03,2022-05-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 malwarescore=0 phishscore=0 bulkscore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205230057
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

numa_setup_cpu can return nodes that are not online. But setup_node_data()
only initialize NODE_DATA for only online numa nodes. Hence avoid returning
nodes that are not online.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/numa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 3becb2588726..80d9be07552c 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -742,7 +742,7 @@ static int numa_setup_cpu(unsigned long lcpu)
 	of_node_put(cpu);
 
 out_present:
-	if (nid < 0 || !node_possible(nid))
+	if (nid < 0 || !node_online(nid))
 		nid = first_online_node;
 
 	/*
-- 
2.36.1

