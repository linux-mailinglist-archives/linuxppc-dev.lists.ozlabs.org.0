Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FBB725B3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 06:09:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45thh00BvfzDq9K
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 14:09:52 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tNpP4QpKzDqPk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 02:14:21 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6NGD8vY042847
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2019 12:14:19 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tx54w1ay7-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2019 12:14:19 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <vaibhav@linux.ibm.com>;
 Tue, 23 Jul 2019 17:14:17 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 23 Jul 2019 17:14:15 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x6NGDxxg32964954
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Jul 2019 16:13:59 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E84AFA405F;
 Tue, 23 Jul 2019 16:14:13 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B075A405B;
 Tue, 23 Jul 2019 16:14:11 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.109.195.195])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 23 Jul 2019 16:14:10 +0000 (GMT)
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 4/4] powerpc/papr_scm: Force a scm-unbind if initial
 scm-bind fails
Date: Tue, 23 Jul 2019 21:43:57 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190723161357.26718-1-vaibhav@linux.ibm.com>
References: <20190723161357.26718-1-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19072316-0012-0000-0000-000003357F39
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19072316-0013-0000-0000-0000216F1049
Message-Id: <20190723161357.26718-5-vaibhav@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-23_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=975 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907230163
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
can arise due to panic of the previous kernel or forced lpar
fadump. In such cases the H_SCM_BIND_MEM return a H_OVERLAP error.

To mitigate such cases the patch updates papr_scm_probe() to force a
call to drc_pmem_unbind() in case the initial bind of scm memory fails
with EBUSY error. In case scm-bind operation again fails after the
forced scm-unbind then we follow the existing error path. We also
update drc_pmem_bind() to handle the H_OVERLAP error returned by phyp
and indicate it as a EBUSY error back to the caller.

Suggested-by: "Oliver O'Halloran" <oohall@gmail.com>
Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
Reviewed-by: Oliver O'Halloran <oohall@gmail.com>
---
Change-log:

v5:
* None. Re-spinning the patchset.

v4:
* None. Re-spinning the patchset.

v3:
* Minor update to a code comment. [Oliver]

v2:
* Moved the retry code from drc_pmem_bind() to papr_scm_probe()
  [Oliver]
* Changed the type of variable 'rc' in drc_pmem_bind() to
  int64_t. [Oliver]
---
 arch/powerpc/platforms/pseries/papr_scm.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 82568a7e0a7c..2c07908359b2 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -44,8 +44,9 @@ struct papr_scm_priv {
 static int drc_pmem_bind(struct papr_scm_priv *p)
 {
 	unsigned long ret[PLPAR_HCALL_BUFSIZE];
-	uint64_t rc, token;
 	uint64_t saved = 0;
+	uint64_t token;
+	int64_t rc;
 
 	/*
 	 * When the hypervisor cannot map all the requested memory in a single
@@ -65,6 +66,10 @@ static int drc_pmem_bind(struct papr_scm_priv *p)
 	} while (rc == H_BUSY);
 
 	if (rc) {
+		/* H_OVERLAP needs a separate error path */
+		if (rc == H_OVERLAP)
+			return -EBUSY;
+
 		dev_err(&p->pdev->dev, "bind err: %lld\n", rc);
 		return -ENXIO;
 	}
@@ -404,6 +409,14 @@ static int papr_scm_probe(struct platform_device *pdev)
 
 	/* request the hypervisor to bind this region to somewhere in memory */
 	rc = drc_pmem_bind(p);
+
+	/* If phyp says drc memory still bound then force unbound and retry */
+	if (rc == -EBUSY) {
+		dev_warn(&pdev->dev, "Retrying bind after unbinding\n");
+		drc_pmem_unbind(p);
+		rc = drc_pmem_bind(p);
+	}
+
 	if (rc)
 		goto err;
 
-- 
2.21.0

