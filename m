Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 555602CD342
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 11:18:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmsH30WTZzDrP2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 21:18:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=bJ2Fqs43; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmsD8428mzDqfN
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Dec 2020 21:15:36 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B3A3HKt049343; Thu, 3 Dec 2020 05:15:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=d29Q2qhjCFDHQ3KvuYzDEQ4HdAEdxxQfM1d+KMGEON0=;
 b=bJ2Fqs430ZPcuA3gmsbQcNVVaqyMb08UzvN8TxMWxx6BB2QWAGAHxE4CS0xCA51n94mN
 Yb+mZDFFxa0jzQh54+UlB4rqC+AwiirxKtQAopwO6HnaKbwsvLgYzVJgOFN+rsjkHzgr
 LL03dEsMmfWV0nfqIwgku2HVeggCZNFa85i0jV4e/sDt4i571NdLbSDgpmaayxI4Dddr
 dqKlt/jRArx6AnKm+DY6AWqkwKt1ge4SY4joZ33VZdmdW+T/uLScNDRXnFuOCIqYEFNS
 C+y0VZwSbOEVHpZcsB+ML8bLnrOWM1b3GJW3skKzmZSP8ERl2FUMFlTWXUVwqYApjUEt UQ== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 356wbej0tk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Dec 2020 05:15:22 -0500
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B3A7wrn030751;
 Thu, 3 Dec 2020 10:15:19 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04fra.de.ibm.com with ESMTP id 353e68anbu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Dec 2020 10:15:19 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B3AFGTD25624932
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Dec 2020 10:15:16 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AAAD6AE058;
 Thu,  3 Dec 2020 10:15:16 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 62E5DAE05F;
 Thu,  3 Dec 2020 10:15:16 +0000 (GMT)
Received: from pomme.tlslab.ibm.com (unknown [9.145.64.135])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  3 Dec 2020 10:15:16 +0000 (GMT)
From: Laurent Dufour <ldufour@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/hotplug: assign hot added LMB to the right node
Date: Thu,  3 Dec 2020 11:15:14 +0100
Message-Id: <20201203101514.33591-1-ldufour@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-03_06:2020-12-03,
 2020-12-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=1 bulkscore=0
 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012030060
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Scott Cheloha <cheloha@linux.ibm.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch applies to 5.9 and earlier kernels only.

Since 5.10, this has been fortunately fixed by the commit
e5e179aa3a39 ("pseries/drmem: don't cache node id in drmem_lmb struct").

When LMBs are added to a running system, the node id assigned to the LMB is
fetched from the temporary DT node provided by the hypervisor.

However, LMBs added are always assigned to the first online node. This is a
mistake and this is because hot_add_drconf_scn_to_nid() called by
lmb_set_nid() is checking for the LMB flags DRCONF_MEM_ASSIGNED which is
set later in dlpar_add_lmb().

To fix this issue, simply set that flag earlier in dlpar_add_lmb().

Note, this code has been rewrote in 5.10 and thus this fix has no meaning
since this version.

Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Scott Cheloha <cheloha@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: stable@vger.kernel.org
---
 arch/powerpc/platforms/pseries/hotplug-memory.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index e54dcbd04b2f..92d83915c629 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -663,12 +663,14 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
 		return rc;
 	}
 
+	lmb->flags |= DRCONF_MEM_ASSIGNED;
 	lmb_set_nid(lmb);
 	block_sz = memory_block_size_bytes();
 
 	/* Add the memory */
 	rc = __add_memory(lmb->nid, lmb->base_addr, block_sz);
 	if (rc) {
+		lmb->flags &= ~DRCONF_MEM_ASSIGNED;
 		invalidate_lmb_associativity_index(lmb);
 		return rc;
 	}
@@ -676,10 +678,9 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
 	rc = dlpar_online_lmb(lmb);
 	if (rc) {
 		__remove_memory(lmb->nid, lmb->base_addr, block_sz);
+		lmb->flags &= ~DRCONF_MEM_ASSIGNED;
 		invalidate_lmb_associativity_index(lmb);
 		lmb_clear_nid(lmb);
-	} else {
-		lmb->flags |= DRCONF_MEM_ASSIGNED;
 	}
 
 	return rc;
-- 
2.29.2

