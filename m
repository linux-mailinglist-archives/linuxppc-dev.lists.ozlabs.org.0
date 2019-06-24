Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B6E51014
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2019 17:15:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45XXsd0vNMzDqM5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 01:15:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=vaibhav@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45XXXD29PQzDqQR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 01:00:11 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5OEr7LU093442
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2019 11:00:09 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tay8m535q-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2019 10:59:53 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <vaibhav@linux.ibm.com>;
 Mon, 24 Jun 2019 15:59:28 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 24 Jun 2019 15:59:24 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5OExN4E36765742
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jun 2019 14:59:23 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4548D42042;
 Mon, 24 Jun 2019 14:59:23 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 518CD42041;
 Mon, 24 Jun 2019 14:59:21 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.109.195.176])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 24 Jun 2019 14:59:21 +0000 (GMT)
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/papr_scm: Force a scm-unbind if initial scm-bind
 fails
Date: Mon, 24 Jun 2019 20:29:13 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190624145913.20122-1-vaibhav@linux.ibm.com>
References: <20190624145913.20122-1-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19062414-0012-0000-0000-0000032BF4AB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062414-0013-0000-0000-0000216525F7
Message-Id: <20190624145913.20122-3-vaibhav@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-24_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906240121
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

In some cases initial bind of scm memory for an lpar can fail if
previously it wasn't released using a scm-unbind hcall. This situation
can arise due to panic of the previous kernel or forced lpar reset. In
such cases the H_SCM_BIND_MEM return a H_OVERLAP error.

To mitigate such cases the patch updates drc_pmem_bind() to force a
call to drc_pmem_unbind() in case the initial bind of scm memory fails
with H_OVERLAP error. In case scm-bind operation again fails after the
forced scm-unbind then we follow the existing error path.

Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/papr_scm.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index d790e4e4ffb3..049d7927c0a4 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -44,19 +44,26 @@ struct papr_scm_priv {
 	struct nd_interleave_set nd_set;
 };
 
+/* Forward declaration */
+static int drc_pmem_unbind(struct papr_scm_priv *);
+
 static int drc_pmem_bind(struct papr_scm_priv *p)
 {
 	unsigned long ret[PLPAR_HCALL_BUFSIZE];
 	uint64_t rc, token;
-	uint64_t saved = 0;
+	uint64_t saved;
+	bool tried_unbind = false;
 
+	dev_dbg(&p->pdev->dev, "bind drc %x\n", p->drc_index);
 	/*
 	 * When the hypervisor cannot map all the requested memory in a single
 	 * hcall it returns H_BUSY and we call again with the token until
 	 * we get H_SUCCESS. Aborting the retry loop before getting H_SUCCESS
 	 * leave the system in an undefined state, so we wait.
 	 */
+retry:
 	token = 0;
+	saved = 0;
 
 	do {
 		rc = plpar_hcall(H_SCM_BIND_MEM, ret, p->drc_index, 0,
@@ -68,8 +75,18 @@ static int drc_pmem_bind(struct papr_scm_priv *p)
 	} while (rc == H_BUSY);
 
 	if (rc) {
-		dev_err(&p->pdev->dev, "bind err: %lld\n", rc);
-		return -ENXIO;
+		/* retry after unbinding */
+		if (rc == H_OVERLAP &&  !tried_unbind) {
+			dev_warn(&p->pdev->dev, "Un-binding and retrying\n");
+			/* Try unbind and ignore any errors */
+			tried_unbind = true;
+			drc_pmem_unbind(p);
+			goto retry;
+
+		} else {
+			dev_err(&p->pdev->dev, "bind err: %lld\n", rc);
+			return -ENXIO;
+		}
 	}
 
 	p->bound_addr = saved;
-- 
2.21.0

