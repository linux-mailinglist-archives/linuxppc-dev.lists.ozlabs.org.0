Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A0C50FB8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2019 17:08:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45XXjZ0jQWzDqS2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 01:08:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=vaibhav@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45XXWR1wsqzDqPk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 00:59:30 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5OEwXqm029836
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2019 10:59:28 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tayjgcscr-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2019 10:59:27 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <vaibhav@linux.ibm.com>;
 Mon, 24 Jun 2019 15:59:24 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 24 Jun 2019 15:59:22 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5OExL7I48234560
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jun 2019 14:59:21 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E30E042045;
 Mon, 24 Jun 2019 14:59:20 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EED8A42047;
 Mon, 24 Jun 2019 14:59:18 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.109.195.176])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 24 Jun 2019 14:59:18 +0000 (GMT)
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc/papr_scm: Update drc_pmem_unbind() to use
 H_SCM_UNBIND_ALL
Date: Mon, 24 Jun 2019 20:29:12 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190624145913.20122-1-vaibhav@linux.ibm.com>
References: <20190624145913.20122-1-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19062414-4275-0000-0000-000003452D2B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062414-4276-0000-0000-0000385565EE
Message-Id: <20190624145913.20122-2-vaibhav@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-24_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906240122
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Vaibhav Jain <vaibhav@linux.ibm.com>,
 Laurent Dufour <ldufour@linux.vnet.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The new hcall named H_SCM_UNBIND_ALL has been introduce that can
unbind all the memory drc memory-blocks assigned to an lpar. This is
more efficient than using H_SCM_UNBIND_MEM as currently we don't
support partial unbind of drc memory-blocks.

Hence this patch proposes following changes to drc_pmem_unbind():

    * Update drc_pmem_unbind() to replace hcall H_SCM_UNBIND_MEM to
      H_SCM_UNBIND_ALL.

    * Update drc_pmem_unbind() to handles cases when PHYP asks the guest
      kernel to wait for specific amount of time before retrying the
      hcall via the 'LONG_BUSY' return value. In case it takes more
      than 1 second to unbind the memory log a warning.

    * Ensure appropriate error code is returned back from the function
      in case of an error.

Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
 arch/powerpc/include/asm/hvcall.h         |  2 +-
 arch/powerpc/platforms/pseries/papr_scm.c | 37 ++++++++++++++++++++---
 2 files changed, 33 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index 463c63a9fcf1..bb56fa0f976c 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -302,7 +302,7 @@
 #define H_SCM_UNBIND_MEM        0x3F0
 #define H_SCM_QUERY_BLOCK_MEM_BINDING 0x3F4
 #define H_SCM_QUERY_LOGICAL_MEM_BINDING 0x3F8
-#define H_SCM_MEM_QUERY	        0x3FC
+#define H_SCM_UNBIND_ALL        0x3FC
 #define H_SCM_BLOCK_CLEAR       0x400
 #define MAX_HCALL_OPCODE	H_SCM_BLOCK_CLEAR
 
diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 96c53b23e58f..d790e4e4ffb3 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -11,11 +11,16 @@
 #include <linux/sched.h>
 #include <linux/libnvdimm.h>
 #include <linux/platform_device.h>
+#include <linux/delay.h>
 
 #include <asm/plpar_wrappers.h>
 
 #define BIND_ANY_ADDR (~0ul)
 
+/* Scope args for H_SCM_UNBIND_ALL */
+#define H_UNBIND_SCOPE_ALL (0x1)
+#define H_UNBIND_SCOPE_DRC (0x2)
+
 #define PAPR_SCM_DIMM_CMD_MASK \
 	((1ul << ND_CMD_GET_CONFIG_SIZE) | \
 	 (1ul << ND_CMD_GET_CONFIG_DATA) | \
@@ -78,21 +83,43 @@ static int drc_pmem_unbind(struct papr_scm_priv *p)
 {
 	unsigned long ret[PLPAR_HCALL_BUFSIZE];
 	uint64_t rc, token;
+	unsigned long starttime;
 
 	token = 0;
 
-	/* NB: unbind has the same retry requirements mentioned above */
+	dev_dbg(&p->pdev->dev, "unbind drc %x\n", p->drc_index);
+
+	/* NB: unbind_all has the same retry requirements as drc_pmem_bind() */
+	starttime = HZ;
 	do {
-		rc = plpar_hcall(H_SCM_UNBIND_MEM, ret, p->drc_index,
-				p->bound_addr, p->blocks, token);
+		/* If this is taking too much time then log warning */
+		if (jiffies_to_msecs(HZ - starttime) > 1000) {
+			dev_warn(&p->pdev->dev,
+				 "unbind taking > 1s to complete\n");
+			starttime = HZ;
+		}
+
+		/* Unbind of all SCM resources associated with drcIndex */
+		rc = plpar_hcall(H_SCM_UNBIND_ALL, ret, H_UNBIND_SCOPE_DRC,
+				 p->drc_index, token);
 		token = ret[0];
-		cond_resched();
+
+		/* Check if we are stalled for some time */
+		if (H_IS_LONG_BUSY(rc)) {
+			msleep(get_longbusy_msecs(rc));
+			rc = H_BUSY;
+			token = 0;
+
+		} else if (rc == H_BUSY) {
+			cond_resched();
+		}
+
 	} while (rc == H_BUSY);
 
 	if (rc)
 		dev_err(&p->pdev->dev, "unbind error: %lld\n", rc);
 
-	return !!rc;
+	return rc == H_SUCCESS ? 0 : -ENXIO;
 }
 
 static int papr_scm_meta_get(struct papr_scm_priv *p,
-- 
2.21.0

