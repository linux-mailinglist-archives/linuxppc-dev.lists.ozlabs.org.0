Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0AD9E6EA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 13:40:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Hn4d3DXlzDqvx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 21:40:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Hn2j2ZyRzDqrZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 21:39:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46Hn2h624sz8sxb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 21:39:08 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46Hn2h5ZVzz9sML; Tue, 27 Aug 2019 21:39:08 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 46Hn2h1Wkzz9sDQ
 for <linuxppc-dev@ozlabs.org>; Tue, 27 Aug 2019 21:39:07 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7RBc318051089
 for <linuxppc-dev@ozlabs.org>; Tue, 27 Aug 2019 07:39:05 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2un0wkqpwc-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 27 Aug 2019 07:39:05 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Tue, 27 Aug 2019 12:39:03 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 27 Aug 2019 12:38:59 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x7RBcwM540239436
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Aug 2019 11:38:58 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E1FB11C058;
 Tue, 27 Aug 2019 11:38:58 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9482511C05B;
 Tue, 27 Aug 2019 11:38:54 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.109.217.45])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 27 Aug 2019 11:38:54 +0000 (GMT)
Subject: [RESEND PATCH v5 13/31] powernv/fadump: reset metadata address
 during clean up
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Tue, 27 Aug 2019 17:08:53 +0530
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19082711-0008-0000-0000-0000030DD323
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082711-0009-0000-0000-00004A2C0F01
Message-Id: <156690588671.5695.8043760289865316072.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-27_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908270131
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

* Added check in fadump_cleanup() function for whether FADump is supported
  before proceeding with cleanup callbacks as this function can be called
  outside FADump code in shutdown and kexec paths which could crash the
  system on machines that do not support FADump.


 arch/powerpc/kernel/fadump-common.h          |    1 +
 arch/powerpc/kernel/fadump.c                 |    5 +++++
 arch/powerpc/platforms/powernv/opal-fadump.c |   10 ++++++++++
 arch/powerpc/platforms/pseries/rtas-fadump.c |    3 +++
 4 files changed, 19 insertions(+)

diff --git a/arch/powerpc/kernel/fadump-common.h b/arch/powerpc/kernel/fadump-common.h
index 0acf412..d2dd117 100644
--- a/arch/powerpc/kernel/fadump-common.h
+++ b/arch/powerpc/kernel/fadump-common.h
@@ -120,6 +120,7 @@ struct fadump_ops {
 	int	(*fadump_register)(struct fw_dump *fadump_config);
 	int	(*fadump_unregister)(struct fw_dump *fadump_config);
 	int	(*fadump_invalidate)(struct fw_dump *fadump_config);
+	void	(*fadump_cleanup)(struct fw_dump *fadump_config);
 	int	(*fadump_process)(struct fw_dump *fadump_config);
 	void	(*fadump_region_show)(struct fw_dump *fadump_config,
 				      struct seq_file *m);
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index a086a09..02ccfd4 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -821,6 +821,9 @@ static int register_fadump(void)
 
 void fadump_cleanup(void)
 {
+	if (!fw_dump.fadump_supported)
+		return;
+
 	/* Invalidate the registration only if dump is active. */
 	if (fw_dump.dump_active) {
 		pr_debug("Invalidating firmware-assisted dump registration\n");
@@ -830,6 +833,8 @@ void fadump_cleanup(void)
 		fw_dump.ops->fadump_unregister(&fw_dump);
 		free_crash_memory_ranges();
 	}
+
+	fw_dump.ops->fadump_cleanup(&fw_dump);
 }
 
 static void fadump_free_reserved_memory(unsigned long start_pfn,
diff --git a/arch/powerpc/platforms/powernv/opal-fadump.c b/arch/powerpc/platforms/powernv/opal-fadump.c
index e5c4700..e466f7e 100644
--- a/arch/powerpc/platforms/powernv/opal-fadump.c
+++ b/arch/powerpc/platforms/powernv/opal-fadump.c
@@ -110,6 +110,15 @@ static int opal_fadump_invalidate(struct fw_dump *fadump_conf)
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
@@ -150,6 +159,7 @@ static struct fadump_ops opal_fadump_ops = {
 	.fadump_register		= opal_fadump_register,
 	.fadump_unregister		= opal_fadump_unregister,
 	.fadump_invalidate		= opal_fadump_invalidate,
+	.fadump_cleanup			= opal_fadump_cleanup,
 	.fadump_process			= opal_fadump_process,
 	.fadump_region_show		= opal_fadump_region_show,
 	.fadump_trigger			= opal_fadump_trigger,
diff --git a/arch/powerpc/platforms/pseries/rtas-fadump.c b/arch/powerpc/platforms/pseries/rtas-fadump.c
index 4111ee9..6164c5a 100644
--- a/arch/powerpc/platforms/pseries/rtas-fadump.c
+++ b/arch/powerpc/platforms/pseries/rtas-fadump.c
@@ -235,6 +235,8 @@ static int rtas_fadump_invalidate(struct fw_dump *fadump_conf)
 	return 0;
 }
 
+static void rtas_fadump_cleanup(struct fw_dump *fadump_conf) { }
+
 #define RTAS_FADUMP_GPR_MASK			0xffffff0000000000
 static inline int rtas_fadump_gpr_index(u64 id)
 {
@@ -508,6 +510,7 @@ static struct fadump_ops rtas_fadump_ops = {
 	.fadump_register		= rtas_fadump_register,
 	.fadump_unregister		= rtas_fadump_unregister,
 	.fadump_invalidate		= rtas_fadump_invalidate,
+	.fadump_cleanup			= rtas_fadump_cleanup,
 	.fadump_process			= rtas_fadump_process,
 	.fadump_region_show		= rtas_fadump_region_show,
 	.fadump_trigger			= rtas_fadump_trigger,

