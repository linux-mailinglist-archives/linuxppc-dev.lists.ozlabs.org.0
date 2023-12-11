Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F4980C35D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Dec 2023 09:36:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=l3yBUN0e;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpZpm1sTfz3dTS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Dec 2023 19:36:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=l3yBUN0e;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpZkP3gbCz30NK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Dec 2023 19:32:45 +1100 (AEDT)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4SpZkP3G7Tz4x2V
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Dec 2023 19:32:45 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4SpZkP3B2Wz4x2W; Mon, 11 Dec 2023 19:32:45 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=l3yBUN0e;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4SpZkP0BlLz4x2V
	for <linuxppc-dev@ozlabs.org>; Mon, 11 Dec 2023 19:32:44 +1100 (AEDT)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BB8Jhbe008959;
	Mon, 11 Dec 2023 08:32:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=J6fhO+S7eHhTaU4yy+0JvIm5RqNTSwcPvqGlLW8k9oU=;
 b=l3yBUN0epqxfHdc5IBf/pD9DeRR6lozU1Sg57ZJB4FslN70GWtvWS4JZE6wykN+Q5op1
 62gbiUDqCJ3IYy4HX7MnFGu66nFvPSQVMHvrs07NvPa1KhsTujHayxd8fizPthmQh84Y
 j7515RE9p5plYNH/yVHH9zmTEB5u6VOP8MoWUYNbIYuuujOmtToQUZcb584zbkvIPQJ7
 gNeNoMPzz7g53UGgBvOhP5UHLhi2kc3RP8jHXgGV/HPOV8X+bQGX/jLY0d4NGooZWF54
 LqIuzUpRfdpzJoTc5FBQd/oEKIWzPJjpT4tn1lQApasQ3GSkgrudrsxjYWs9Z96iQDOo iA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uwu4txa53-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 08:32:07 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3BB8KQcc012570;
	Mon, 11 Dec 2023 08:32:06 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uwu4txa4p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 08:32:06 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3BB6mk77008544;
	Mon, 11 Dec 2023 08:32:05 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3uw2jt0bw2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 08:32:05 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3BB8W2Ob5571088
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 11 Dec 2023 08:32:02 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5970520043;
	Mon, 11 Dec 2023 08:32:02 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6A51420040;
	Mon, 11 Dec 2023 08:31:51 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.c4p-in.ibmmobiledemo.com (unknown [9.177.92.36])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 11 Dec 2023 08:31:51 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v14 3/6] crash: add a new kexec flag for FDT update
Date: Mon, 11 Dec 2023 14:00:53 +0530
Message-ID: <20231211083056.340404-4-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231211083056.340404-1-sourabhjain@linux.ibm.com>
References: <20231211083056.340404-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Zo0hfFvALfhaNcQe-_sSblPS0nfbeR0_
X-Proofpoint-GUID: TineP5Zea9Ovm8qcvZNG9pMjNlcyte7a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-11_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 mlxscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311290000 definitions=main-2312110071
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
Cc: David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, Mimi Zohar <zohar@linux.ibm.com>, Eric DeVolder <eric.devolder@oracle.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Valentin Schneider <vschneid@redhat.com>, Baoquan He <bhe@redhat.com>, x86@kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Laurent Dufour <laurent.dufour@fr.ibm.com>, Dave Young <dyoung@redhat.com>, Vivek Goyal <vgoyal@redhat.com>, Naveen N Rao <naveen@kernel.org>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>, Oscar Salvador <osalvador@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, Akhil Raj <lf32.dev@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The commit a72bbec70da2 ("crash: hotplug support for kexec_load()")
introduced a new kexec flag, `KEXEC_UPDATE_ELFCOREHDR`. Kexec tool uses
this flag to indicate kernel that it is safe to modify the elfcorehdr
of kdump image loaded using kexec_load system call.

Similarly, add a new kexec flag, `KEXEC_UPDATE_FDT`, for another kdump
component named FDT (Flatten Device Tree). Architectures like PowerPC
need to update FDT kdump image component on CPU hotplug events. Kexec
tool passing `KEXEC_UPDATE_FDT` will be an indication to kernel that FDT
segment is not part of SHA calculation hence it is safe to update it.

With the `KEXEC_UPDATE_ELFCOREHDR` and `KEXEC_UPDATE_FDT` kexec flags,
crash hotplug support can be added to PowerPC for the kexec_load syscall
while maintaining the backward compatibility with older kexec tools that
do not have these newly introduced flags.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Akhil Raj <lf32.dev@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
Cc: Baoquan He <bhe@redhat.com>
Cc: Borislav Petkov (AMD) <bp@alien8.de>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Dave Young <dyoung@redhat.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Eric DeVolder <eric.devolder@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Laurent Dufour <laurent.dufour@fr.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Mimi Zohar <zohar@linux.ibm.com>
Cc: Naveen N Rao <naveen@kernel.org>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Valentin Schneider <vschneid@redhat.com>
Cc: Vivek Goyal <vgoyal@redhat.com>
Cc: kexec@lists.infradead.org
Cc: x86@kernel.org
---
 include/linux/kexec.h      | 6 ++++--
 include/uapi/linux/kexec.h | 1 +
 kernel/kexec.c             | 2 ++
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index 0f6ea35879ee..bcedb7625b1f 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -319,6 +319,7 @@ struct kimage {
 #ifdef CONFIG_CRASH_HOTPLUG
 	/* If set, allow changes to elfcorehdr of kexec_load'd image */
 	unsigned int update_elfcorehdr:1;
+	unsigned int update_fdt:1;
 #endif
 
 #ifdef ARCH_HAS_KIMAGE_ARCH
@@ -396,9 +397,10 @@ bool kexec_load_permitted(int kexec_image_type);
 
 /* List of defined/legal kexec flags */
 #ifndef CONFIG_KEXEC_JUMP
-#define KEXEC_FLAGS    (KEXEC_ON_CRASH | KEXEC_UPDATE_ELFCOREHDR)
+#define KEXEC_FLAGS    (KEXEC_ON_CRASH | KEXEC_UPDATE_ELFCOREHDR | KEXEC_UPDATE_FDT)
 #else
-#define KEXEC_FLAGS    (KEXEC_ON_CRASH | KEXEC_PRESERVE_CONTEXT | KEXEC_UPDATE_ELFCOREHDR)
+#define KEXEC_FLAGS    (KEXEC_ON_CRASH | KEXEC_PRESERVE_CONTEXT | KEXEC_UPDATE_ELFCOREHDR | \
+			KEXEC_UPDATE_FDT)
 #endif
 
 /* List of defined/legal kexec file flags */
diff --git a/include/uapi/linux/kexec.h b/include/uapi/linux/kexec.h
index 01766dd839b0..3d5b3d757bed 100644
--- a/include/uapi/linux/kexec.h
+++ b/include/uapi/linux/kexec.h
@@ -13,6 +13,7 @@
 #define KEXEC_ON_CRASH		0x00000001
 #define KEXEC_PRESERVE_CONTEXT	0x00000002
 #define KEXEC_UPDATE_ELFCOREHDR	0x00000004
+#define KEXEC_UPDATE_FDT	0x00000008
 #define KEXEC_ARCH_MASK		0xffff0000
 
 /*
diff --git a/kernel/kexec.c b/kernel/kexec.c
index 8f35a5a42af8..97eb151cd931 100644
--- a/kernel/kexec.c
+++ b/kernel/kexec.c
@@ -132,6 +132,8 @@ static int do_kexec_load(unsigned long entry, unsigned long nr_segments,
 #ifdef CONFIG_CRASH_HOTPLUG
 	if (flags & KEXEC_UPDATE_ELFCOREHDR)
 		image->update_elfcorehdr = 1;
+	if (flags & KEXEC_UPDATE_FDT)
+		image->update_fdt = 1;
 #endif
 
 	ret = machine_kexec_prepare(image);
-- 
2.41.0

