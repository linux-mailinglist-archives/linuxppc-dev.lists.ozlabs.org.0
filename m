Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E2B3D88CC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jul 2021 09:27:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GZQH627T7z3bjW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jul 2021 17:27:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZIlL3nft;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=srs0=jfoe=mu=linux.ibm.com=hbathini@ozlabs.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ZIlL3nft; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZQGY54rQz2yZL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jul 2021 17:27:17 +1000 (AEST)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by ozlabs.org (Postfix) with ESMTP id 4GZQGQ52v8z9sX1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jul 2021 17:27:10 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4GZQGQ4YXkz9sWw; Wed, 28 Jul 2021 17:27:10 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ZIlL3nft; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4GZQGP5Nkqz9sSs;
 Wed, 28 Jul 2021 17:27:08 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16S7AL4T125737; Wed, 28 Jul 2021 03:27:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=Uzd+uCddAdpy+30hlVYxOFwFoleqOWg55fIefDuT8n8=;
 b=ZIlL3nftKEKpOQQarL6Frpo1u6Rp20n/5D33KirIdzoNM7aSNOg+xdunt0j5IrqNNnAg
 TrvD6Rnj3mEgcE8E35zBY4/WPVq3bUE66POLqzJNBi5rBe/aoyhrEE5LXIaQhUmLcZLf
 JMb7TSPwAmnjorh9aYfYJc4ibsczFCfDiNOM7/JqaS2smUHvkWP86swi2CFNemEKmRYV
 8d+eojWrICpqzzUOssSDNeAD3Vm27BDPw90+wxGe+KqG/8dywnJNEYBQUH+xVCG8sNm4
 8KSy81dkpY2wvH9NX9PwiumKIQ3/foYt7B6op3vQdaR8WnPiBu4ZTr+UFzX+zwyr6i/0 tA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a31ym1qpg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Jul 2021 03:27:06 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16S7HfI2013093;
 Wed, 28 Jul 2021 03:27:06 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a31ym1qnn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Jul 2021 03:27:06 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16S7Geic015089;
 Wed, 28 Jul 2021 07:27:04 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3a235kgvpx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Jul 2021 07:27:03 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 16S7OGQe30671118
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Jul 2021 07:24:16 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3BFB5A4075;
 Wed, 28 Jul 2021 07:26:58 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 33B04A4073;
 Wed, 28 Jul 2021 07:26:55 +0000 (GMT)
Received: from hbathini-workstation.ibm.com (unknown [9.77.202.40])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 28 Jul 2021 07:26:54 +0000 (GMT)
Subject: [PATCH V2] powerpc/fadump: register for fadump as early as possible
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 28 Jul 2021 12:56:53 +0530
Message-ID: <162745719918.257192.9734055270116337209.stgit@hbathini-workstation.ibm.com>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: h5Gz0NrU2K_OrhrznySqSeEoLRGVRO1L
X-Proofpoint-ORIG-GUID: -FXQC4nTJx-xtMHefL_i6uvYXjMoMg-2
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-28_05:2021-07-27,
 2021-07-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2107280040
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
 =?utf-8?q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
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

Changes in V2:
* Updated the changelog with bit more explanation about userspace issue
  with/without this change.
* Added a comment in the code for why setup_fadump function is changed
  from subsys_init() to subsys_init_sync() call.


 arch/powerpc/kernel/fadump.c |   13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index b990075285f5..2911aefdf594 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -1637,13 +1637,20 @@ int __init setup_fadump(void)
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


