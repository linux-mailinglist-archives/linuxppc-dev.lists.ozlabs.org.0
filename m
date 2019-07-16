Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B69026A7C0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 13:56:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nzPk71JDzDqP4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 21:56:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nyvg0ZnqzDqTn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 21:33:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45nyvf69tfz8t9P
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 21:33:34 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45nyvf5xBhz9sN4; Tue, 16 Jul 2019 21:33:34 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45nyvf2gZWz9s8m
 for <linuxppc-dev@ozlabs.org>; Tue, 16 Jul 2019 21:33:34 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6GBMbvO080431
 for <linuxppc-dev@ozlabs.org>; Tue, 16 Jul 2019 07:33:32 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tsbp5dffa-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 16 Jul 2019 07:33:32 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Tue, 16 Jul 2019 12:33:30 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 16 Jul 2019 12:33:26 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6GBXP4w47710416
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jul 2019 11:33:25 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 64EF911C04A;
 Tue, 16 Jul 2019 11:33:25 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D2D4711C05B;
 Tue, 16 Jul 2019 11:33:23 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.184.183.117])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 16 Jul 2019 11:33:23 +0000 (GMT)
Subject: [PATCH v4 12/25] powernv/fadump: define register/un-register
 callback functions
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Tue, 16 Jul 2019 17:03:23 +0530
In-Reply-To: <156327668777.27462.5297279227799429100.stgit@hbathini.in.ibm.com>
References: <156327668777.27462.5297279227799429100.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19071611-0008-0000-0000-000002FDA6BA
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071611-0009-0000-0000-0000226B1C53
Message-Id: <156327680307.27462.16414477591782848444.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-16_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907160145
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
 Nicholas Piggin <npiggin@gmail.com>, Stewart Smith <stewart@linux.ibm.com>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Make OPAL calls to register and un-register with firmware for MPIPL.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/opal-fadump.c |   71 +++++++++++++++++++++++++-
 1 file changed, 69 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal-fadump.c b/arch/powerpc/platforms/powernv/opal-fadump.c
index 4b8504e..2179126 100644
--- a/arch/powerpc/platforms/powernv/opal-fadump.c
+++ b/arch/powerpc/platforms/powernv/opal-fadump.c
@@ -27,6 +27,20 @@
 
 static struct opal_fadump_mem_struct *opal_fdm;
 
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
 static ulong opal_fadump_init_mem_struct(struct fw_dump *fadump_conf)
 {
 	ulong addr = fadump_conf->reserve_dump_area_start;
@@ -47,6 +61,8 @@ static ulong opal_fadump_init_mem_struct(struct fw_dump *fadump_conf)
 	opal_fdm->fadumphdr_addr = (opal_fdm->rgn[0].dest +
 				    fadump_conf->boot_memory_size);
 
+	opal_fadump_update_config(fadump_conf, opal_fdm);
+
 	return addr;
 }
 
@@ -88,12 +104,63 @@ static int opal_fadump_setup_kernel_metadata(struct fw_dump *fadump_conf)
 
 static int opal_fadump_register_fadump(struct fw_dump *fadump_conf)
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
+	case OPAL_UNSUPPORTED:
+		pr_err("Support not available.\n");
+		fadump_conf->fadump_supported = 0;
+		fadump_conf->fadump_enabled = 0;
+		break;
+	case OPAL_INTERNAL_ERROR:
+		pr_err("Failed to register. Hardware Error(%lld).\n", rc);
+		break;
+	case OPAL_PARAMETER:
+		pr_err("Failed to register. Parameter Error(%lld).\n", rc);
+		break;
+	case OPAL_PERMISSION:
+		pr_err("Already registered!\n");
+		fadump_conf->dump_registered = 1;
+		err = -EEXIST;
+		break;
+	default:
+		pr_err("Failed to register. Unknown Error(%lld).\n", rc);
+		break;
+	}
+
+	return err;
 }
 
 static int opal_fadump_unregister_fadump(struct fw_dump *fadump_conf)
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
 
 static int opal_fadump_invalidate_fadump(struct fw_dump *fadump_conf)

