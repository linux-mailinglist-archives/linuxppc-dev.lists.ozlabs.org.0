Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08433A7202
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 19:55:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NF3F1T8FzDqmJ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 03:55:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anju@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NF1H3V3LzDqkV
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 03:53:22 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x83Hr1UE130569
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 3 Sep 2019 13:53:19 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ustc5x6xn-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Sep 2019 13:53:18 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <anju@linux.vnet.ibm.com>;
 Tue, 3 Sep 2019 18:53:16 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 3 Sep 2019 18:53:14 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x83HrD7N43319606
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Sep 2019 17:53:13 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 671C411C04C;
 Tue,  3 Sep 2019 17:53:13 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 61A5E11C050;
 Tue,  3 Sep 2019 17:53:12 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.63.96])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  3 Sep 2019 17:53:12 +0000 (GMT)
From: Anju T Sudhakar <anju@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2] platform/powernv: Avoid re-registration of imc debugfs
 directory
Date: Tue,  3 Sep 2019 23:23:08 +0530
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19090317-4275-0000-0000-00000360A2D8
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19090317-4276-0000-0000-00003872E5AA
Message-Id: <20190903175308.5819-1-anju@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-03_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909030179
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
Cc: anju@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

export_imc_mode_and_cmd() function which creates the debugfs interface for
imc-mode and imc-command, is invoked when each nest pmu units is
registered.
When the first nest pmu unit is registered, export_imc_mode_and_cmd()
creates 'imc' directory under `/debug/powerpc/`. In the subsequent
invocations debugfs_create_dir() function returns, since the directory
already exists.

The recent commit <c33d442328f55> (debugfs: make error message a bit more
verbose), throws a warning if we try to invoke `debugfs_create_dir()`
with an already existing directory name.

Address this warning by searching for an existing 'imc' directory,
and do not invoke debugfs_create_dir(), if the debugfs interface for
imc already exists.

This patch is based on:
https://lists.ozlabs.org/pipermail/linuxppc-dev/2019-August/195898.html

Signed-off-by: Anju T Sudhakar <anju@linux.vnet.ibm.com>
Tested-by: Nageswara R Sastry <rnsastry@linux.vnet.ibm.com>
---
Changes from v1 -> v2

* Minor changes in the commit message.
-------
 arch/powerpc/platforms/powernv/opal-imc.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal-imc.c b/arch/powerpc/platforms/powernv/opal-imc.c
index e04b20625cb9..fc2f0e60a44d 100644
--- a/arch/powerpc/platforms/powernv/opal-imc.c
+++ b/arch/powerpc/platforms/powernv/opal-imc.c
@@ -55,14 +55,19 @@ static void export_imc_mode_and_cmd(struct device_node *node,
 	static u64 loc, *imc_mode_addr, *imc_cmd_addr;
 	char mode[16], cmd[16];
 	u32 cb_offset;
+	struct dentry *dir = NULL;
 	struct imc_mem_info *ptr = pmu_ptr->mem_info;
 
+
+	/* Return, if 'imc' interface already exists */
+	dir = debugfs_lookup("imc", powerpc_debugfs_root);
+	if (dir) {
+		dput(dir);
+		return;
+	}
 	imc_debugfs_parent = debugfs_create_dir("imc", powerpc_debugfs_root);
 
-	/*
-	 * Return here, either because 'imc' directory already exists,
-	 * Or failed to create a new one.
-	 */
+	/* Return here, if failed to create the directory */
 	if (!imc_debugfs_parent)
 		return;
 
-- 
2.20.1

