Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 326FEB008A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 17:51:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T5wP4vfnzF3Wj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 01:51:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T4dB16x7zF3DC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:52:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46T4d95rjhz8swG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:52:45 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46T4d93QWjz9sNF; Thu, 12 Sep 2019 00:52:45 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 46T4d84qzVz9s4Y
 for <linuxppc-dev@ozlabs.org>; Thu, 12 Sep 2019 00:52:44 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8BEggqO089262
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:52:42 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uy2vk8g1h-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:52:42 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Wed, 11 Sep 2019 15:52:40 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 11 Sep 2019 15:52:37 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8BEqZ7V48627724
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Sep 2019 14:52:35 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4141EA4068;
 Wed, 11 Sep 2019 14:52:35 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D93CA405B;
 Wed, 11 Sep 2019 14:52:33 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.24.71])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 11 Sep 2019 14:52:33 +0000 (GMT)
Subject: [PATCH v6 21/36] powernv/fadump: Warn before processing partial
 crashdump
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Wed, 11 Sep 2019 20:22:32 +0530
In-Reply-To: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
References: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091114-0008-0000-0000-000003146BEE
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091114-0009-0000-0000-00004A32D820
Message-Id: <156821352793.5656.1734051341024721407.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-11_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909110138
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

If all kernel boot memory regions are not registered for MPIPL before
system crashes, try processing the partial crashdump but warn the user
before proceeding.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

Changes in v6:
  * Use prints suggested by mpe.


 arch/powerpc/platforms/powernv/opal-fadump.c |   24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/opal-fadump.c b/arch/powerpc/platforms/powernv/opal-fadump.c
index 5ace7c4..533adae 100644
--- a/arch/powerpc/platforms/powernv/opal-fadump.c
+++ b/arch/powerpc/platforms/powernv/opal-fadump.c
@@ -69,6 +69,30 @@ static void opal_fadump_get_config(struct fw_dump *fadump_conf,
 	 */
 	fadump_conf->reserve_dump_area_start = fdm->rgn[0].dest;
 
+	/*
+	 * Rarely, but it can so happen that system crashes before all
+	 * boot memory regions are registered for MPIPL. In such
+	 * cases, warn that the vmcore may not be accurate and proceed
+	 * anyway as that is the best bet considering free pages, cache
+	 * pages, user pages, etc are usually filtered out.
+	 *
+	 * Hope the memory that could not be preserved only has pages
+	 * that are usually filtered out while saving the vmcore.
+	 */
+	if (fdm->region_cnt > fdm->registered_regions) {
+		pr_warn("Not all memory regions were saved!!!\n");
+		pr_warn("  Unsaved memory regions:\n");
+		i = fdm->registered_regions;
+		while (i < fdm->region_cnt) {
+			pr_warn("\t[%03d] base: 0x%llx, size: 0x%llx\n",
+				i, fdm->rgn[i].src, fdm->rgn[i].size);
+			i++;
+		}
+
+		pr_warn("If the unsaved regions only contain pages that are filtered out (eg. free/user pages), the vmcore should still be usable.\n");
+		pr_warn("WARNING: If the unsaved regions contain kernel pages, the vmcore will be corrupted.\n");
+	}
+
 	opal_fadump_update_config(fadump_conf, fdm);
 }
 

