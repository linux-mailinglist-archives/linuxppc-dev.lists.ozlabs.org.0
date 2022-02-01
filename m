Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 663764A5AAB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 11:54:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jp1yW13zDz3bPT
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 21:54:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XIUmFnVH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jp1xk2cCcz2xtv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 21:53:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XIUmFnVH; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4Jp1xj00Y2z4xhm
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 21:53:29 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4Jp1xh74Trz4xcR; Tue,  1 Feb 2022 21:53:28 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XIUmFnVH; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Jp1xh2PVTz4xRB;
 Tue,  1 Feb 2022 21:53:27 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 211A2NKb020565; 
 Tue, 1 Feb 2022 10:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=cM3RzJAO+/lPdf7SNoFYvC2YlCfZJIoKOuV9w8lWcrw=;
 b=XIUmFnVHJtgAUIZ4A/064w/QLRmF6vTZFAv+PtIVi0/PU5fDSjENITj5AQqiMWTLE/cg
 Y9Vs1sH3EY9NanfbPu+Rdg7g0IiCNIbUKacBg37gyVpwD8VQwoKcLY+DodCLBSeYTtzX
 +HuJHjP073RIg7nwYzco1+fX8VaVZQf+nw5cO+nZHpjqQ4b/tLug+3zLKcJHwNWGuAOo
 UsT7kgUGloem2FPWYWyg7V8DsNM+6gBGVOxZ7rDFd1HmZqqdbNVUNfZ6KMy4ZXvRCMoZ
 +zaw6IAhc16PMXegxsW2q+V7XyP0thSUUk7NJdUE1J64LOIhViUAAP1aDTu901jvaXMq bA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dy2ru8su2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Feb 2022 10:53:23 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 211Ai6vh018949;
 Tue, 1 Feb 2022 10:53:23 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dy2ru8stg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Feb 2022 10:53:23 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 211AmXrW006439;
 Tue, 1 Feb 2022 10:53:21 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 3dvw79j978-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Feb 2022 10:53:21 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 211ArIAd46203206
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Feb 2022 10:53:18 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1608BA404D;
 Tue,  1 Feb 2022 10:53:18 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E5992A405D;
 Tue,  1 Feb 2022 10:53:12 +0000 (GMT)
Received: from hbathini-workstation.ibm.com.com (unknown [9.211.70.16])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  1 Feb 2022 10:53:12 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [RESEND PATCH v2] powerpc/fadump: register for fadump as early as
 possible
Date: Tue,  1 Feb 2022 16:23:05 +0530
Message-Id: <20220201105305.155511-1-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oldLWWnZFoXTwpJCdwya0WISei97IXWc
X-Proofpoint-ORIG-GUID: ovTHen19IbKSO1U2wIiLrJ4qqAnIoWin
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-01_03,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 phishscore=0 suspectscore=0 clxscore=1011
 adultscore=0 impostorscore=0 mlxlogscore=999 spamscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202010058
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
Cc: Kairui Song <kasong@redhat.com>, Petr Tesarik <ptesarik@suse.cz>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>,
 =?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>,
 Dave Young <dyoung@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Crash recovery (fadump) is setup in the userspace by some service.
This service rebuilds initrd with dump capture capability, if it is
not already dump capture capable before proceeding to register for
firmware assisted dump (echo 1 > /sys/kernel/fadump/registered). But
arming the kernel with crash recovery support does not have to wait
for userspace configuration. So, register for fadump while setting
it up itself. This can at worst lead to a scenario, where /proc/vmcore
is ready afer crash but the initrd does not know how/where to offload
it, which is always better than not having a /proc/vmcore at all due
to incomplete configuration in the userspace at the time of crash.

Commit 0823c68b054b ("powerpc/fadump: re-register firmware-assisted
dump if already registered") ensures this change does not break
userspace.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

* Resending the patch after rebasing on latest code.

Changes in V2:
* Updated the changelog with bit more explanation about userspace issue
  with/without this change.
* Added a comment in the code for why setup_fadump function is changed
  from subsys_init() to subsys_init_sync() call.


 arch/powerpc/kernel/fadump.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index d03e488cfe9c..97d80df4563f 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -1637,9 +1637,11 @@ int __init setup_fadump(void)
 		if (fw_dump.ops->fadump_process(&fw_dump) < 0)
 			fadump_invalidate_release_mem();
 	}
-	/* Initialize the kernel dump memory structure for FAD registration. */
-	else if (fw_dump.reserve_dump_area_size)
+	/* Initialize the kernel dump memory structure and register with f/w */
+	else if (fw_dump.reserve_dump_area_size) {
 		fw_dump.ops->fadump_init_mem_struct(&fw_dump);
+		register_fadump();
+	}
 
 	/*
 	 * In case of panic, fadump is triggered via ppc_panic_event()
@@ -1651,7 +1653,12 @@ int __init setup_fadump(void)
 
 	return 1;
 }
-subsys_initcall(setup_fadump);
+/*
+ * Replace subsys_initcall() with subsys_initcall_sync() as there is dependency
+ * with crash_save_vmcoreinfo_init() to ensure vmcoreinfo initialization is done
+ * before regisering with f/w.
+ */
+subsys_initcall_sync(setup_fadump);
 #else /* !CONFIG_PRESERVE_FA_DUMP */
 
 /* Scan the Firmware Assisted dump configuration details. */
-- 
2.34.1

