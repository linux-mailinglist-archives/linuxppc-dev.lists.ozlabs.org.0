Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE08395B10
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 May 2021 15:04:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FtwVD1BWkz30CS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 May 2021 23:04:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DTw2LX0w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=srs0=xcnv=k2=linux.ibm.com=hbathini@ozlabs.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DTw2LX0w; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FtwTg2yhfz2xfy
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 May 2021 23:03:51 +1000 (AEST)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by ozlabs.org (Postfix) with ESMTP id 4FtwTY0tZqz9sWD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 May 2021 23:03:45 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4FtwTY03Cxz9sW6; Mon, 31 May 2021 23:03:45 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DTw2LX0w; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4FtwTX2f4sz9sVb;
 Mon, 31 May 2021 23:03:43 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14VD2lmg050199; Mon, 31 May 2021 09:03:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=yVUHgsnJ5MR5rZSoCjet1NcDt0lXtwu9jPTeZ1t5cDw=;
 b=DTw2LX0wImFQFmP0VuFS9GH0/VK8aI938QzXQoGoYafOxy3F57JCG01gVwLmpxD3MKNb
 wVuchE0/DpoKSxjegO521RGkJ3jva1o3Zo4Uc/oBKGCKd+UEujGvaHgIq/njVnpUHvho
 RAz2xQOeDEtGKveFVXCb9viNTB41WCdFPI1gUxdFsmy05U52u0+tfJvwrlmL8CIJCjtF
 AKXTY2alspCG3ZJ+ck1WkrAiA5MjoeROz8AqLEm8b1lpn8/nD9MfQXOmmXpVWnqv/RZn
 z40rXEtCNll39ztDaH0Bnc+TcinV5lX/yMmv9N/jHtwlsxV2kOpDg9hR0QqBb23gcBnu Wg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38w0a6r3uw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 May 2021 09:03:40 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14VD3BBf052758;
 Mon, 31 May 2021 09:03:40 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38w0a6r3tu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 May 2021 09:03:40 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 14VD2OoG018660;
 Mon, 31 May 2021 13:03:37 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 38ud888jkj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 May 2021 13:03:37 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14VD3YW929294986
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 May 2021 13:03:34 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 262EA52054;
 Mon, 31 May 2021 13:03:34 +0000 (GMT)
Received: from hbathini-workstation.ibm.com (unknown [9.85.89.198])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 5056E52051;
 Mon, 31 May 2021 13:03:32 +0000 (GMT)
Subject: [PATCH] powerpc/fadump: register for fadump as early as possible
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 31 May 2021 18:33:31 +0530
Message-ID: <162246621134.46902.9619354353561918017.stgit@hbathini-workstation.ibm.com>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hX-u_RCXYANijPGQ4VOYFRo5OB25mnFb
X-Proofpoint-ORIG-GUID: qcvsT7W-OTK3G5N5jKUkOmnaXUGFjU-X
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-31_08:2021-05-31,
 2021-05-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 spamscore=0 clxscore=1011 bulkscore=0 lowpriorityscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105310092
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
not already dump capture capable and then initiates registration for
firmware assisted dump (echo 1 > /sys/kernel/fadump/registered). But
registration for fadump can be done as early as initial kernel boot
process itself, providing crash recovery support for scenarios where
kernel crashes before the userspace service could start up. So, try
registering for fadump while setting it up in the kernel itself. Also,
have setup_fadump() called by subsys_init_sync() to make sure
crash_save_vmcoreinfo_init() is done before registering for fadump.

Commit 0823c68b054b ("powerpc/fadump: re-register firmware-assisted
dump if already registered") would ensure this change does not lead to
error while the userspace service tries to re-register fadump.

Also, this change, in rare scenario, can lead to a case where the
initrd is not dump capture capable, to offload the vmcore after a
crash. But that does not make the case any worse than it already is.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/kernel/fadump.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index b990075285f5..0f5ecff6210d 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -1638,12 +1638,14 @@ int __init setup_fadump(void)
 			fadump_invalidate_release_mem();
 	}
 	/* Initialize the kernel dump memory structure for FAD registration. */
-	else if (fw_dump.reserve_dump_area_size)
+	else if (fw_dump.reserve_dump_area_size) {
 		fw_dump.ops->fadump_init_mem_struct(&fw_dump);
+		register_fadump();
+	}
 
 	return 1;
 }
-subsys_initcall(setup_fadump);
+subsys_initcall_sync(setup_fadump);
 #else /* !CONFIG_PRESERVE_FA_DUMP */
 
 /* Scan the Firmware Assisted dump configuration details. */


