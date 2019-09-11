Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BA3B0066
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 17:42:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T5k766TbzF3SX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 01:42:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T4bm03b0zF3CT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:51:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46T4bk69vfz8swG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:51:30 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46T4bk3Cvqz9sNF; Thu, 12 Sep 2019 00:51:30 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 46T4bj4ZVTz9sDB
 for <linuxppc-dev@ozlabs.org>; Thu, 12 Sep 2019 00:51:29 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8BEgdxT051783
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:51:27 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uy2702c69-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:51:27 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Wed, 11 Sep 2019 15:51:25 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 11 Sep 2019 15:51:21 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8BEpJLf53936356
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Sep 2019 14:51:19 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 912AAAE045;
 Wed, 11 Sep 2019 14:51:19 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B5DFAAE053;
 Wed, 11 Sep 2019 14:51:17 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.24.71])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 11 Sep 2019 14:51:17 +0000 (GMT)
Subject: [PATCH v6 17/36] powernv/fadump: reset metadata address during
 clean up
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Wed, 11 Sep 2019 20:21:16 +0530
In-Reply-To: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
References: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091114-0012-0000-0000-0000034A0ED9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091114-0013-0000-0000-0000218477EB
Message-Id: <156821346629.5656.10783321582005237813.stgit@hbathini.in.ibm.com>
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

During kexec boot, metadata address needs to be reset to avoid running
into errors interpreting stale metadata address, in case the kexec'ed
kernel crashes before metadata address could be setup again.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

Changes in v6:
  * Drop shallow rtas_fadump_cleanup() callback definition. Instead, check
    before using the callback.


 arch/powerpc/include/asm/fadump-internal.h   |    1 +
 arch/powerpc/kernel/fadump.c                 |    6 ++++++
 arch/powerpc/platforms/powernv/opal-fadump.c |   10 ++++++++++
 3 files changed, 17 insertions(+)

diff --git a/arch/powerpc/include/asm/fadump-internal.h b/arch/powerpc/include/asm/fadump-internal.h
index 5262c76..0c2c4f5 100644
--- a/arch/powerpc/include/asm/fadump-internal.h
+++ b/arch/powerpc/include/asm/fadump-internal.h
@@ -117,6 +117,7 @@ struct fadump_ops {
 	int	(*fadump_register)(struct fw_dump *fadump_conf);
 	int	(*fadump_unregister)(struct fw_dump *fadump_conf);
 	int	(*fadump_invalidate)(struct fw_dump *fadump_conf);
+	void	(*fadump_cleanup)(struct fw_dump *fadump_conf);
 	int	(*fadump_process)(struct fw_dump *fadump_conf);
 	void	(*fadump_region_show)(struct fw_dump *fadump_conf,
 				      struct seq_file *m);
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 7e70563..aab9b4d 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -965,6 +965,9 @@ static int register_fadump(void)
 
 void fadump_cleanup(void)
 {
+	if (!fw_dump.fadump_supported)
+		return;
+
 	/* Invalidate the registration only if dump is active. */
 	if (fw_dump.dump_active) {
 		pr_debug("Invalidating firmware-assisted dump registration\n");
@@ -974,6 +977,9 @@ void fadump_cleanup(void)
 		fw_dump.ops->fadump_unregister(&fw_dump);
 		free_crash_memory_ranges();
 	}
+
+	if (fw_dump.ops->fadump_cleanup)
+		fw_dump.ops->fadump_cleanup(&fw_dump);
 }
 
 static void fadump_free_reserved_memory(unsigned long start_pfn,
diff --git a/arch/powerpc/platforms/powernv/opal-fadump.c b/arch/powerpc/platforms/powernv/opal-fadump.c
index 21de832..871a129 100644
--- a/arch/powerpc/platforms/powernv/opal-fadump.c
+++ b/arch/powerpc/platforms/powernv/opal-fadump.c
@@ -105,6 +105,15 @@ static int opal_fadump_invalidate(struct fw_dump *fadump_conf)
 	return -EIO;
 }
 
+static void opal_fadump_cleanup(struct fw_dump *fadump_conf)
+{
+	s64 ret;
+
+	ret = opal_mpipl_register_tag(OPAL_MPIPL_TAG_KERNEL, 0);
+	if (ret != OPAL_SUCCESS)
+		pr_warn("Could not reset (%llu) kernel metadata tag!\n", ret);
+}
+
 static int __init opal_fadump_process(struct fw_dump *fadump_conf)
 {
 	return -EINVAL;
@@ -145,6 +154,7 @@ static struct fadump_ops opal_fadump_ops = {
 	.fadump_register		= opal_fadump_register,
 	.fadump_unregister		= opal_fadump_unregister,
 	.fadump_invalidate		= opal_fadump_invalidate,
+	.fadump_cleanup			= opal_fadump_cleanup,
 	.fadump_process			= opal_fadump_process,
 	.fadump_region_show		= opal_fadump_region_show,
 	.fadump_trigger			= opal_fadump_trigger,

