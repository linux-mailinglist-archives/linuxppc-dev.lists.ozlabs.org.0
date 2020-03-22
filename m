Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6251F18EA05
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Mar 2020 17:07:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48lj8K68JyzDr4g
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 03:07:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48lj6L3d22zDqyB
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 03:05:45 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02MG3QoF067618
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Mar 2020 12:05:42 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ywdr33kxr-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Mar 2020 12:05:42 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ganeshgr@linux.ibm.com>;
 Sun, 22 Mar 2020 16:05:40 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sun, 22 Mar 2020 16:05:39 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02MG5cm655377990
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 22 Mar 2020 16:05:38 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 301F14C044;
 Sun, 22 Mar 2020 16:05:38 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6CB794C040;
 Sun, 22 Mar 2020 16:05:36 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.60.27])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun, 22 Mar 2020 16:05:36 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3] powerpc/pseries: Handle UE event for memcpy_mcsafe
Date: Sun, 22 Mar 2020 21:35:25 +0530
X-Mailer: git-send-email 2.17.2
X-TM-AS-GCONF: 00
x-cbid: 20032216-0016-0000-0000-000002F5B645
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20032216-0017-0000-0000-000033594A79
Message-Id: <20200322160525.7624-1-ganeshgr@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-22_05:2020-03-21,
 2020-03-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_spam_definite policy=outbound
 score=100 malwarescore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 mlxlogscore=436 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003220097
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
Cc: mahesh@linux.vnet.ibm.com, santosh@fossix.org,
 Ganesh Goudar <ganeshgr@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If we hit UE at an instruction with a fixup entry, flag to
ignore the event and set nip to continue execution at the
fixup entry.
For powernv these changes are already made by
commit 895e3dceeb97 ("powerpc/mce: Handle UE event for memcpy_mcsafe")

Reviewed-by: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
Reviewed-by: Santosh S <santosh@fossix.org>
Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
---
V2: Fixes a trivial checkpatch error in commit msg.
V3: Use proper subject prefix.
---
 arch/powerpc/platforms/pseries/ras.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
index 43710b69e09e..58e2483fbb1a 100644
--- a/arch/powerpc/platforms/pseries/ras.c
+++ b/arch/powerpc/platforms/pseries/ras.c
@@ -10,6 +10,7 @@
 #include <linux/fs.h>
 #include <linux/reboot.h>
 #include <linux/irq_work.h>
+#include <linux/extable.h>
 
 #include <asm/machdep.h>
 #include <asm/rtas.h>
@@ -505,6 +506,7 @@ static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *errp)
 	int initiator = rtas_error_initiator(errp);
 	int severity = rtas_error_severity(errp);
 	u8 error_type, err_sub_type;
+	const struct exception_table_entry *entry;
 
 	if (initiator == RTAS_INITIATOR_UNKNOWN)
 		mce_err.initiator = MCE_INITIATOR_UNKNOWN;
@@ -558,6 +560,12 @@ static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *errp)
 	switch (mce_log->error_type) {
 	case MC_ERROR_TYPE_UE:
 		mce_err.error_type = MCE_ERROR_TYPE_UE;
+		entry = search_kernel_exception_table(regs->nip);
+		if (entry) {
+			mce_err.ignore_event = true;
+			regs->nip = extable_fixup(entry);
+			disposition = RTAS_DISP_FULLY_RECOVERED;
+		}
 		switch (err_sub_type) {
 		case MC_ERROR_UE_IFETCH:
 			mce_err.u.ue_error_type = MCE_UE_ERROR_IFETCH;
-- 
2.17.2

