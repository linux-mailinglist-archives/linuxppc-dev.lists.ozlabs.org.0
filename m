Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDACA68B2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 14:39:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46N63V3JvqzDqkp
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 22:39:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46N5yD0pX5zDqJN
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 22:35:15 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x83CWlGQ043724; Tue, 3 Sep 2019 08:35:10 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2usqvygxej-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Sep 2019 08:35:09 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x83CWm9O043798;
 Tue, 3 Sep 2019 08:35:09 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2usqvygxdp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Sep 2019 08:35:09 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x83CZ6bC031053;
 Tue, 3 Sep 2019 12:35:07 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01wdc.us.ibm.com with ESMTP id 2uqgh6je4m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Sep 2019 12:35:07 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x83CZ6bU46137704
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Sep 2019 12:35:06 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 15702BE051;
 Tue,  3 Sep 2019 12:35:06 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CF947BE054;
 Tue,  3 Sep 2019 12:35:03 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.33.18])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  3 Sep 2019 12:35:03 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2 2/2] powerpc/nvdimm: use H_SCM_QUERY hcall on H_OVERLAP
 error
Date: Tue,  3 Sep 2019 18:04:52 +0530
Message-Id: <20190903123452.28620-2-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190903123452.28620-1-aneesh.kumar@linux.ibm.com>
References: <20190903123452.28620-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-03_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909030131
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

Right now we force an unbind of SCM memory at drcindex on H_OVERLAP error.
This really slows down operations like kexec where we get the H_OVERLAP
error because we don't go through a full hypervisor re init.

H_OVERLAP error for a H_SCM_BIND_MEM hcall indicates that SCM memory at
drc index is already bound. Since we don't specify a logical memory
address for bind hcall, we can use the H_SCM_QUERY hcall to query
the already bound logical address.

Boot time difference with and without patch is:

[    5.583617] IOMMU table initialized, virtual merging enabled
[    5.603041] papr_scm ibm,persistent-memory:ibm,pmemory@44104001: Retrying bind after unbinding
[  301.514221] papr_scm ibm,persistent-memory:ibm,pmemory@44108001: Retrying bind after unbinding
[  340.057238] hv-24x7: read 1530 catalog entries, created 537 event attrs (0 failures), 275 descs

after fix

[    5.101572] IOMMU table initialized, virtual merging enabled
[    5.116984] papr_scm ibm,persistent-memory:ibm,pmemory@44104001: Querying SCM details
[    5.117223] papr_scm ibm,persistent-memory:ibm,pmemory@44108001: Querying SCM details
[    5.120530] hv-24x7: read 1530 catalog entries, created 537 event attrs (0 failures), 275 descs

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
Changes from V1:
* Use the first block and last block to query the logical bind memory
* If we fail to query, ubind and retry the bind.


 arch/powerpc/platforms/pseries/papr_scm.c | 48 +++++++++++++++++++----
 1 file changed, 40 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 3bef4d298ac6..61883291defc 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -65,10 +65,8 @@ static int drc_pmem_bind(struct papr_scm_priv *p)
 		cond_resched();
 	} while (rc == H_BUSY);
 
-	if (rc) {
-		dev_err(&p->pdev->dev, "bind err: %lld\n", rc);
+	if (rc)
 		return rc;
-	}
 
 	p->bound_addr = saved;
 	dev_dbg(&p->pdev->dev, "bound drc 0x%x to %pR\n", p->drc_index, &p->res);
@@ -110,6 +108,42 @@ static void drc_pmem_unbind(struct papr_scm_priv *p)
 	return;
 }
 
+static int drc_pmem_query_n_bind(struct papr_scm_priv *p)
+{
+	unsigned long start_addr;
+	unsigned long end_addr;
+	unsigned long ret[PLPAR_HCALL_BUFSIZE];
+	int64_t rc;
+
+
+	rc = plpar_hcall(H_SCM_QUERY_BLOCK_MEM_BINDING, ret,
+			 p->drc_index, 0);
+	if (rc)
+		goto err_out;
+	start_addr = ret[0];
+
+	/* Make sure the full region is bound. */
+	rc = plpar_hcall(H_SCM_QUERY_BLOCK_MEM_BINDING, ret,
+			 p->drc_index, p->blocks - 1);
+	if (rc)
+		goto err_out;
+	end_addr = ret[0];
+
+	if ((end_addr - start_addr) != ((p->blocks - 1) * p->block_size))
+		goto err_out;
+
+	p->bound_addr = start_addr;
+	dev_dbg(&p->pdev->dev, "bound drc 0x%x to %pR\n", p->drc_index, &p->res);
+	return rc;
+
+err_out:
+	dev_info(&p->pdev->dev,
+		 "Failed to query, trying an unbind followed by bind");
+	drc_pmem_unbind(p);
+	return drc_pmem_bind(p);
+}
+
+
 static int papr_scm_meta_get(struct papr_scm_priv *p,
 			     struct nd_cmd_get_config_data_hdr *hdr)
 {
@@ -430,13 +464,11 @@ static int papr_scm_probe(struct platform_device *pdev)
 	rc = drc_pmem_bind(p);
 
 	/* If phyp says drc memory still bound then force unbound and retry */
-	if (rc == H_OVERLAP) {
-		dev_warn(&pdev->dev, "Retrying bind after unbinding\n");
-		drc_pmem_unbind(p);
-		rc = drc_pmem_bind(p);
-	}
+	if (rc == H_OVERLAP)
+		rc = drc_pmem_query_n_bind(p);
 
 	if (rc != H_SUCCESS) {
+		dev_err(&p->pdev->dev, "bind err: %d\n", rc);
 		rc = -ENXIO;
 		goto err;
 	}
-- 
2.21.0

