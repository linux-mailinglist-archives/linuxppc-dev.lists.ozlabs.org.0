Return-Path: <linuxppc-dev+bounces-17575-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FhYBZTmpmnjZAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17575-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 14:48:04 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2DE1F0AA4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 14:48:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQHDn5vlJz3c9b;
	Wed, 04 Mar 2026 00:47:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772545673;
	cv=none; b=YOtYKLq6FCdXjXQ/EXVjDIE526isLJ0FJPnm8sCOnKrajt3F9bNphMSEVWSI87lDm7yVsgAwdlUxdi/rVme10mzVTqpywzGXLqbSc0XF8MwIhIUal2y7sv63adWAgYKOF4zd7AZfpdzFJdVfBapiu1HEuwKv+s1XeeYXnWmsKPOVZmrPk65tmbyrxe/DmIT3I6vkGb0t1SeUy967O+cwWiXAcZYowVIcq7IDlu1oTNSvtB0WBkkdQh/SxsrPIiiqX+FGAUYHQ22vkIwi07g8hS8Q7p/NYJ3HjdSt9ww+eJNjE36Vj6ArmST7q2TkR/eXKx54yuhr+0QyJ057llWPAw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772545673; c=relaxed/relaxed;
	bh=Vd6w/sjQ6otMIHTrF2QES+CZTnDd1ucw/R/BI17uFJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mmk/aecdt2tBFeTN65HdbjeFbXozxmuir/ac6YTwTg7hY8sEN+NHeNcLzLVs1kZVoKG/oQ39bd/5z7KHT+4zFTQnFSHx7ZAxegkpK23/vzsmfWIsfhwcILGHSsxjEU6f4s+teWQPloGPe8kB+LgZFsZYISmqOP2byW0Xbd8vS4B6tTEqDP9D5BPePtCz3KpYCl/8ulA3KRIyJCG1TAeeEl/qn+r1cqUsxvMkt4KvHvTbSBG5ZLGwvJ2SBvlCf1Xspvg95a3QwYd1F0Tb1MRLQG2BhXKzM1aD/B3IZSNdX9TE0AAuVE86IOXw9DUt9MIktXpDNaDKRtK0EvETneeDNQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QjWY/qYh; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QjWY/qYh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQHDn0v4Dz3btf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 00:47:52 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6233xQln1938926;
	Tue, 3 Mar 2026 13:47:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=Vd6w/sjQ6otMIHTrF
	2QES+CZTnDd1ucw/R/BI17uFJg=; b=QjWY/qYh84Rxn2szoJ02bVJ4j8astX4+H
	OVKgo/EEXqIpjQljJ0VtFqr/Ps8dq3wuX9bac1tDJHOwEF8O4BKcL+SVxSA+va0K
	gKXjijVUXLHGyU5XDFPu3cO+fZGL26MBcNUORUdUtfrdAzZZMITxsDK9XoV3gkyv
	VSxuAmXja06GCwBAifXNqVXgnUeyjU23jlHZW1632AeFUEeevAeeMWw5ab50vAkL
	XyweJq7xFlMc4CV2q7ZhfciitnpRF1fXtfcMJFBoS9VkUeJ4KZfIRr6jjtdoFjTA
	CPqWbyGIoM6BlapTFFplHWTr1lFKLXuZQMCiLf5lQIJ+NFdIE6Drw==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cksrj36tb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 13:47:46 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 623AckPS010327;
	Tue, 3 Mar 2026 13:47:45 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cmc6k2dxd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 13:47:45 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 623Dlf2e54395320
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Mar 2026 13:47:41 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0594F2004D;
	Tue,  3 Mar 2026 13:47:41 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EED0E2004B;
	Tue,  3 Mar 2026 13:47:38 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.in.ibm.com (unknown [9.109.204.116])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  3 Mar 2026 13:47:38 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shivang Upadhyay <shivangu@linux.ibm.com>
Subject: [PATCH 2/2] powerpc/crash: Update backup region offset in elfcorehdr on memory hotplug
Date: Tue,  3 Mar 2026 19:17:16 +0530
Message-ID: <20260303134722.2814049-3-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260303134722.2814049-1-sourabhjain@linux.ibm.com>
References: <20260303134722.2814049-1-sourabhjain@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=Rp/I7SmK c=1 sm=1 tr=0 ts=69a6e682 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8 a=pGLkceISAAAA:8
 a=6h3uKJss54rF53--RuIA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEwOCBTYWx0ZWRfX0oIfLv6finAY
 aVv7UAd7sh5oM25/I/eKafsEWcNY8B2E+e5OygP6o3XBUTvXetJp+ppRQsvbDESoR7kpFgveKHp
 CF/9b2yQCMGr6B8hG4kZaUGTQ4/tWvJe4x2kFdNlW/Gey2XSKv3TeydmCQFJbl1HDgqg713k2XA
 rP7uXjgi25XesMGwVad+Etx5/nOP29G+CdyxXHaanF/DidxiuL5P7ndgaH/O/9lGB3dG/y6IMp5
 xoB1hUJ9oNEXO8P/CVQlTmDzZXE2kFfuXB/kchlVR/qzBkAX1Qcz1MVCbtzHfa9kzlwDCreZdPb
 1QhUvoFg3ZTHK1Uo+5+zLRAgf4bPU3yEvHiRcCb7BFeZNwq3EeJ76DkOXlKpP3AHkC21QGxR9dF
 XokMmpOMeplYGOHfCkLf1chVrLIyNexA5M1/Gocyq00bPXg+ocKQDKj/Ss1l52k8JehhyG73fbZ
 I3auXYEw+kKdF+oQwsw==
X-Proofpoint-GUID: EEE_gf4KlHGWDO5gVVtxBJqLV1Nie8LR
X-Proofpoint-ORIG-GUID: F32siWcu5sg7TZvObOCPZ3_lF4uWOlKy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030108
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 2B2DE1F0AA4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17575-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,gmail.com];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,lists.ozlabs.org:rdns,lists.ozlabs.org:helo];
	FROM_NEQ_ENVFROM(0.00)[sourabhjain@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

When elfcorehdr is prepared for kdump, the program header representing
the first 64 KB of memory is expected to have its offset point to the
backup region. This is required because purgatory copies the first 64 KB
of the crashed kernel memory to this backup region following a kernel
crash. This allows the capture kernel to use the first 64 KB of memory
to place the exception vectors and other required data.

When elfcorehdr is recreated due to memory hotplug, the offset of
the program header representing the first 64 KB is not updated.
As a result, the capture kernel exports the first 64 KB at offset
0, even though the data actually resides in the backup region.

Fix this by calling sync_backup_region_phdr() to update the program
header offset in the elfcorehdr created during memory hotplug.

sync_backup_region_phdr() works for images loaded via the
kexec_file_load syscall. However, it does not work for kexec_load,
because image->arch.backup_start is not initialized in that case.
So introduce machine_kexec_post_load() to process the elfcorehdr
prepared by kexec-tools and initialize image->arch.backup_start for
kdump images loaded via kexec_load syscall.

Rename update_backup_region_phdr() to sync_backup_region_phdr() and
extend it to synchronize the backup region offset between the kdump
image and the ELF core header. The helper now supports updating either
the kdump image from the ELF program header or updating the ELF program
header from the kdump image, avoiding code duplication.

This patch depends on the patch titled
"powerpc/crash: fix backup region offset update to elfcorehdr".

Fixes: 849599b702ef ("powerpc/crash: add crash memory hotplug support")
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/include/asm/kexec.h  |  6 ++++
 arch/powerpc/kexec/crash.c        | 60 +++++++++++++++++++++++++++++++
 arch/powerpc/kexec/file_load_64.c | 29 +--------------
 3 files changed, 67 insertions(+), 28 deletions(-)

diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index bd4a6c42a5f3..2adcc5ed9269 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -145,6 +145,10 @@ int arch_crash_hotplug_support(struct kimage *image, unsigned long kexec_flags);
 
 unsigned int arch_crash_get_elfcorehdr_size(void);
 #define crash_get_elfcorehdr_size arch_crash_get_elfcorehdr_size
+
+int machine_kexec_post_load(struct kimage *image);
+#define machine_kexec_post_load machine_kexec_post_load
+
 #endif /* CONFIG_CRASH_HOTPLUG */
 
 extern int crashing_cpu;
@@ -159,6 +163,8 @@ extern void default_machine_crash_shutdown(struct pt_regs *regs);
 extern void crash_kexec_prepare(void);
 extern void crash_kexec_secondary(struct pt_regs *regs);
 
+extern void sync_backup_region_phdr(struct kimage *image, Elf64_Ehdr *ehdr,
+				    bool phdr_to_kimage);
 static inline bool kdump_in_progress(void)
 {
 	return crashing_cpu >= 0;
diff --git a/arch/powerpc/kexec/crash.c b/arch/powerpc/kexec/crash.c
index a325c1c02f96..e8dd941e2159 100644
--- a/arch/powerpc/kexec/crash.c
+++ b/arch/powerpc/kexec/crash.c
@@ -27,6 +27,7 @@
 #include <asm/debug.h>
 #include <asm/interrupt.h>
 #include <asm/kexec_ranges.h>
+#include <asm/crashdump-ppc64.h>
 
 /*
  * The primary CPU waits a while for all secondary CPUs to enter. This is to
@@ -399,7 +400,64 @@ void default_machine_crash_shutdown(struct pt_regs *regs)
 		ppc_md.kexec_cpu_down(1, 0);
 }
 
+#ifdef CONFIG_CRASH_DUMP
+/**
+ * sync_backup_region_phdr - synchronize backup region offset between
+ *			    kexec image and ELF core header.
+ * @image: Kexec image.
+ * @ehdr: ELF core header.
+ * @phdr_to_kimage: If true, read the offset from the ELF program header
+ *		    and update the kimage backup region. If false, update
+ *		    the ELF program header offset from the kimage backup
+ *		    region.
+ *
+ * Returns nothing.
+ */
+void sync_backup_region_phdr(struct kimage *image, Elf64_Ehdr *ehdr, bool phdr_to_kimage)
+{
+	Elf64_Phdr *phdr;
+	unsigned int i;
+
+	phdr = (Elf64_Phdr *)(ehdr + 1);
+	for (i = 0; i < ehdr->e_phnum; i++, phdr++) {
+		if (phdr->p_paddr == BACKUP_SRC_START) {
+			if (phdr_to_kimage)
+				image->arch.backup_start = phdr->p_offset;
+			else
+				phdr->p_offset = image->arch.backup_start;
+
+			kexec_dprintk("Backup region offset updated to 0x%lx\n",
+				      image->arch.backup_start);
+			return;
+		}
+	}
+}
+#endif /* CONFIG_CRASH_DUMP */
+
 #ifdef CONFIG_CRASH_HOTPLUG
+
+int machine_kexec_post_load(struct kimage *image)
+{
+	int i;
+	unsigned long mem;
+	unsigned char *ptr;
+
+	if (image->type != KEXEC_TYPE_CRASH)
+		return 0;
+
+	if (image->file_mode)
+		return 0;
+
+	for (i = 0; i < image->nr_segments; i++) {
+		mem = image->segment[i].mem;
+		ptr = (char *)__va(mem);
+
+		if (ptr && memcmp(ptr, ELFMAG, SELFMAG) == 0)
+			sync_backup_region_phdr(image, (Elf64_Ehdr *) ptr, true);
+	}
+	return 0;
+}
+
 #undef pr_fmt
 #define pr_fmt(fmt) "crash hp: " fmt
 
@@ -474,6 +532,8 @@ static void update_crash_elfcorehdr(struct kimage *image, struct memory_notify *
 		goto out;
 	}
 
+	sync_backup_region_phdr(image, (Elf64_Ehdr *) elfbuf, false);
+
 	ptr = __va(mem);
 	if (ptr) {
 		/* Temporarily invalidate the crash image while it is replaced */
diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index e631cf2eda2c..502976a1823d 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -374,33 +374,6 @@ static int load_backup_segment(struct kimage *image, struct kexec_buf *kbuf)
 	return 0;
 }
 
-/**
- * update_backup_region_phdr - Update backup region's offset for the core to
- *                             export the region appropriately.
- * @image:                     Kexec image.
- * @ehdr:                      ELF core header.
- *
- * Assumes an exclusive program header is setup for the backup region
- * in the ELF headers
- *
- * Returns nothing.
- */
-static void update_backup_region_phdr(struct kimage *image, Elf64_Ehdr *ehdr)
-{
-	Elf64_Phdr *phdr;
-	unsigned int i;
-
-	phdr = (Elf64_Phdr *)(ehdr + 1);
-	for (i = 0; i < ehdr->e_phnum; i++, phdr++) {
-		if (phdr->p_paddr == BACKUP_SRC_START) {
-			phdr->p_offset = image->arch.backup_start;
-			kexec_dprintk("Backup region offset updated to 0x%lx\n",
-				      image->arch.backup_start);
-			return;
-		}
-	}
-}
-
 static unsigned int kdump_extra_elfcorehdr_size(struct crash_mem *cmem)
 {
 #if defined(CONFIG_CRASH_HOTPLUG) && defined(CONFIG_MEMORY_HOTPLUG)
@@ -445,7 +418,7 @@ static int load_elfcorehdr_segment(struct kimage *image, struct kexec_buf *kbuf)
 	}
 
 	/* Fix the offset for backup region in the ELF header */
-	update_backup_region_phdr(image, headers);
+	sync_backup_region_phdr(image, headers, false);
 
 	kbuf->buffer = headers;
 	kbuf->mem = KEXEC_BUF_MEM_UNKNOWN;
-- 
2.52.0


