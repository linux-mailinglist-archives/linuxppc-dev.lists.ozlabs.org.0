Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DA252A11D9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 08:38:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JtGV6MBSzDrK0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 16:38:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JtC94jNMzDr61
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 16:35:17 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7T6ZBqj069369; Thu, 29 Aug 2019 02:35:11 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2up5runp3a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Aug 2019 02:35:10 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x7T6ZApn069308;
 Thu, 29 Aug 2019 02:35:10 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2up5runnk8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Aug 2019 02:35:09 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7T6TW8i028119;
 Thu, 29 Aug 2019 06:33:56 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04wdc.us.ibm.com with ESMTP id 2ujvv6tswj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Aug 2019 06:33:56 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7T6XsiV20251084
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Aug 2019 06:33:54 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CEF7CC6055;
 Thu, 29 Aug 2019 06:33:54 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F37B2C6057;
 Thu, 29 Aug 2019 06:33:52 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.124.35.73])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 29 Aug 2019 06:33:52 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 1/2] powerpc/nvdimm: Use HCALL error as the return value
Date: Thu, 29 Aug 2019 12:03:46 +0530
Message-Id: <20190829063347.13966-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-29_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=992 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908290070
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
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This simplifies the error handling and also enable us to switch to
H_SCM_QUERY hcall in a later patch on H_OVERLAP error.

We also do some kernel print formatting fixup in this patch.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/papr_scm.c | 24 ++++++++++-------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index a5ac371a3f06..220e595cb579 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -66,28 +66,22 @@ static int drc_pmem_bind(struct papr_scm_priv *p)
 	} while (rc == H_BUSY);
 
 	if (rc) {
-		/* H_OVERLAP needs a separate error path */
-		if (rc == H_OVERLAP)
-			return -EBUSY;
-
 		dev_err(&p->pdev->dev, "bind err: %lld\n", rc);
-		return -ENXIO;
+		return rc;
 	}
 
 	p->bound_addr = saved;
-
-	dev_dbg(&p->pdev->dev, "bound drc %x to %pR\n", p->drc_index, &p->res);
-
+	dev_dbg(&p->pdev->dev, "bound drc 0x%x to %pR\n", p->drc_index, &p->res);
 	return 0;
 }
 
-static int drc_pmem_unbind(struct papr_scm_priv *p)
+static void drc_pmem_unbind(struct papr_scm_priv *p)
 {
 	unsigned long ret[PLPAR_HCALL_BUFSIZE];
 	uint64_t token = 0;
 	int64_t rc;
 
-	dev_dbg(&p->pdev->dev, "unbind drc %x\n", p->drc_index);
+	dev_dbg(&p->pdev->dev, "unbind drc 0x%x\n", p->drc_index);
 
 	/* NB: unbind has the same retry requirements as drc_pmem_bind() */
 	do {
@@ -110,10 +104,10 @@ static int drc_pmem_unbind(struct papr_scm_priv *p)
 	if (rc)
 		dev_err(&p->pdev->dev, "unbind error: %lld\n", rc);
 	else
-		dev_dbg(&p->pdev->dev, "unbind drc %x complete\n",
+		dev_dbg(&p->pdev->dev, "unbind drc 0x%x complete\n",
 			p->drc_index);
 
-	return rc == H_SUCCESS ? 0 : -ENXIO;
+	return;
 }
 
 static int papr_scm_meta_get(struct papr_scm_priv *p,
@@ -436,14 +430,16 @@ static int papr_scm_probe(struct platform_device *pdev)
 	rc = drc_pmem_bind(p);
 
 	/* If phyp says drc memory still bound then force unbound and retry */
-	if (rc == -EBUSY) {
+	if (rc == H_OVERLAP) {
 		dev_warn(&pdev->dev, "Retrying bind after unbinding\n");
 		drc_pmem_unbind(p);
 		rc = drc_pmem_bind(p);
 	}
 
-	if (rc)
+	if (rc != H_SUCCESS) {
+		rc = -ENXIO;
 		goto err;
+	}
 
 	/* setup the resource for the newly bound range */
 	p->res.start = p->bound_addr;
-- 
2.21.0

