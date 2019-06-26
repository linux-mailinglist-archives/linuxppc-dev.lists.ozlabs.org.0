Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B928D56B8C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 16:11:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YlLs74rzzDqLZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 00:11:17 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YlC55Q8lzDqG6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 00:04:33 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5QE2mYe051674
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 10:04:31 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tc9e4a9mg-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 10:04:30 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <vaibhav@linux.ibm.com>;
 Wed, 26 Jun 2019 15:04:28 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 26 Jun 2019 15:04:25 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x5QE4NO139584014
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jun 2019 14:04:23 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C37BB52052;
 Wed, 26 Jun 2019 14:04:23 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.109.195.183])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id ACBDE52051;
 Wed, 26 Jun 2019 14:04:21 +0000 (GMT)
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 2/3] powerpc/papr_scm: Update drc_pmem_unbind() to use
 H_SCM_UNBIND_ALL
Date: Wed, 26 Jun 2019 19:34:03 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190626140404.27448-1-vaibhav@linux.ibm.com>
References: <20190626140404.27448-1-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19062614-0012-0000-0000-0000032C9763
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062614-0013-0000-0000-00002165D1B9
Message-Id: <20190626140404.27448-3-vaibhav@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-26_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906260168
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
unbind all or specific scm memory assigned to an lpar. This is
more efficient than using H_SCM_UNBIND_MEM as currently we don't
support partial unbind of scm memory.

Hence this patch proposes following changes to drc_pmem_unbind():

    * Update drc_pmem_unbind() to replace hcall H_SCM_UNBIND_MEM to
      H_SCM_UNBIND_ALL.

    * Update drc_pmem_unbind() to handles cases when PHYP asks the guest
      kernel to wait for specific amount of time before retrying the
      hcall via the 'LONG_BUSY' return value.

    * Ensure appropriate error code is returned back from the function
      in case of an error.

Reviewed-by: Oliver O'Halloran <oohall@gmail.com>
Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
Change-log:

v3:
* Fixed a build warning reported by kbuild-robot.
* Updated patch description to put emphasis on 'scm memory' instead of
  'scm drc memory blocks' as for phyp there is a stark difference
  between how drc are managed for scm memory v/s regular memory. [Oliver]

v2:
* Added a dev_dbg when unbind operation succeeds [Oliver]
* Changed type of variable 'rc' to int64_t [Oliver]
* Removed the code that was logging a warning in case bind operation
  takes >1-seconds [Oliver]
* Spinned off changes to hvcall.h as a separate patch. [Oliver]
---
 arch/powerpc/platforms/pseries/papr_scm.c | 29 +++++++++++++++++------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 96c53b23e58f..c01a03fd3ee7 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -11,6 +11,7 @@
 #include <linux/sched.h>
 #include <linux/libnvdimm.h>
 #include <linux/platform_device.h>
+#include <linux/delay.h>
 
 #include <asm/plpar_wrappers.h>
 
@@ -77,22 +78,36 @@ static int drc_pmem_bind(struct papr_scm_priv *p)
 static int drc_pmem_unbind(struct papr_scm_priv *p)
 {
 	unsigned long ret[PLPAR_HCALL_BUFSIZE];
-	uint64_t rc, token;
+	uint64_t token = 0;
+	int64_t rc;
 
-	token = 0;
+	dev_dbg(&p->pdev->dev, "unbind drc %x\n", p->drc_index);
 
-	/* NB: unbind has the same retry requirements mentioned above */
+	/* NB: unbind has the same retry requirements as drc_pmem_bind() */
 	do {
-		rc = plpar_hcall(H_SCM_UNBIND_MEM, ret, p->drc_index,
-				p->bound_addr, p->blocks, token);
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
+		} else if (rc == H_BUSY) {
+			cond_resched();
+		}
+
 	} while (rc == H_BUSY);
 
 	if (rc)
 		dev_err(&p->pdev->dev, "unbind error: %lld\n", rc);
+	else
+		dev_dbg(&p->pdev->dev, "unbind drc %x complete\n",
+			p->drc_index);
 
-	return !!rc;
+	return rc == H_SUCCESS ? 0 : -ENXIO;
 }
 
 static int papr_scm_meta_get(struct papr_scm_priv *p,
-- 
2.21.0

