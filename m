Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDBAF95F1E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 14:47:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CVvG54CzzDqnR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 22:47:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CTyz3WNgzDqwL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 22:06:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46CTyy2xHvz8tFS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 22:06:02 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46CTyy0ZNHz9sDQ; Tue, 20 Aug 2019 22:06:02 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46CTyx2fTPz9sBF
 for <linuxppc-dev@ozlabs.org>; Tue, 20 Aug 2019 22:06:01 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7KC2BXd041398
 for <linuxppc-dev@ozlabs.org>; Tue, 20 Aug 2019 08:05:59 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ugeaepd56-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 20 Aug 2019 08:05:59 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Tue, 20 Aug 2019 13:05:57 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 20 Aug 2019 13:05:54 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7KC5qER55312496
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Aug 2019 12:05:52 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9551F4203F;
 Tue, 20 Aug 2019 12:05:52 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F72642042;
 Tue, 20 Aug 2019 12:05:51 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.184.183.117])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 20 Aug 2019 12:05:51 +0000 (GMT)
Subject: [PATCH v5 14/31] powernv/fadump: define register/un-register
 callback functions
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Tue, 20 Aug 2019 17:35:50 +0530
In-Reply-To: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
References: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19082012-0016-0000-0000-000002A0AFCD
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082012-0017-0000-0000-00003300DEE1
Message-Id: <156630275043.8896.8993437371524687114.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-20_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908200128
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
Cc: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Vasant Hegde <hegdevasant@linux.ibm.com>, Oliver <oohall@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Make OPAL calls to register and un-register with firmware for MPIPL.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/opal-fadump.c |   79 +++++++++++++++++++++++++-
 1 file changed, 77 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal-fadump.c b/arch/powerpc/platforms/powernv/opal-fadump.c
index e466f7e..91fb909 100644
--- a/arch/powerpc/platforms/powernv/opal-fadump.c
+++ b/arch/powerpc/platforms/powernv/opal-fadump.c
@@ -23,6 +23,22 @@
 
 static struct opal_fadump_mem_struct *opal_fdm;
 
+static int opal_fadump_unregister(struct fw_dump *fadump_conf);
+
+static void opal_fadump_update_config(struct fw_dump *fadump_conf,
+				      const struct opal_fadump_mem_struct *fdm)
+{
+	/*
+	 * The destination address of the first boot memory region is the
+	 * destination address of boot memory regions.
+	 */
+	fadump_conf->boot_mem_dest_addr = fdm->rgn[0].dest;
+	pr_debug("Destination address of boot memory regions: %#016lx\n",
+		 fadump_conf->boot_mem_dest_addr);
+
+	fadump_conf->fadumphdr_addr = fdm->fadumphdr_addr;
+}
+
 /* Initialize kernel metadata */
 static void opal_fadump_init_metadata(struct opal_fadump_mem_struct *fdm)
 {
@@ -52,6 +68,8 @@ static ulong opal_fadump_init_mem_struct(struct fw_dump *fadump_conf)
 	opal_fdm->fadumphdr_addr = (opal_fdm->rgn[0].dest +
 				    fadump_conf->boot_memory_size);
 
+	opal_fadump_update_config(fadump_conf, opal_fdm);
+
 	return addr;
 }
 
@@ -97,12 +115,69 @@ static int opal_fadump_setup_metadata(struct fw_dump *fadump_conf)
 
 static int opal_fadump_register(struct fw_dump *fadump_conf)
 {
-	return -EIO;
+	int i, err = -EIO;
+	s64 rc;
+
+	for (i = 0; i < opal_fdm->region_cnt; i++) {
+		rc = opal_mpipl_update(OPAL_MPIPL_ADD_RANGE,
+				       opal_fdm->rgn[i].src,
+				       opal_fdm->rgn[i].dest,
+				       opal_fdm->rgn[i].size);
+		if (rc != OPAL_SUCCESS)
+			break;
+
+		opal_fdm->registered_regions++;
+	}
+
+	switch (rc) {
+	case OPAL_SUCCESS:
+		pr_info("Registration is successful!\n");
+		fadump_conf->dump_registered = 1;
+		err = 0;
+		break;
+	case OPAL_RESOURCE:
+		/* If MAX regions limit in f/w is hit, warn and proceed. */
+		pr_warn("%d regions could not be registered for MPIPL as MAX limit is reached!\n",
+			(opal_fdm->region_cnt - opal_fdm->registered_regions));
+		fadump_conf->dump_registered = 1;
+		err = 0;
+		break;
+	case OPAL_PARAMETER:
+		pr_err("Failed to register. Parameter Error(%lld).\n", rc);
+		break;
+	case OPAL_HARDWARE:
+		pr_err("Support not available.\n");
+		fadump_conf->fadump_supported = 0;
+		fadump_conf->fadump_enabled = 0;
+		break;
+	default:
+		pr_err("Failed to register. Unknown Error(%lld).\n", rc);
+		break;
+	}
+
+	/*
+	 * If some regions were registered before OPAL_MPIPL_ADD_RANGE
+	 * OPAL call failed, unregister all regions.
+	 */
+	if ((err < 0) && (opal_fdm->registered_regions > 0))
+		opal_fadump_unregister(fadump_conf);
+
+	return err;
 }
 
 static int opal_fadump_unregister(struct fw_dump *fadump_conf)
 {
-	return -EIO;
+	s64 rc;
+
+	rc = opal_mpipl_update(OPAL_MPIPL_REMOVE_ALL, 0, 0, 0);
+	if (rc) {
+		pr_err("Failed to un-register - unexpected Error(%lld).\n", rc);
+		return -EIO;
+	}
+
+	opal_fdm->registered_regions = 0;
+	fadump_conf->dump_registered = 0;
+	return 0;
 }
 
 static int opal_fadump_invalidate(struct fw_dump *fadump_conf)

