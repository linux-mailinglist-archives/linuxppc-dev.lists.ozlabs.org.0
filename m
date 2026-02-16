Return-Path: <linuxppc-dev+bounces-16886-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOdCBrBRk2nA3QEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16886-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Feb 2026 18:19:44 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD8C146A67
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Feb 2026 18:19:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fF8f174bQz2ySS;
	Tue, 17 Feb 2026 04:19:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771262377;
	cv=none; b=HgZvRFnyN6m7cPlzJ501lDQeGzRj0WoBcNh+YbTKQWVCvzHtmDcXwWTh9eXYil82y6JGHq3x5RuUvOJwlCTQfVY+6hBbIPix/HkC/7SguOiA/8D0gEpO5v/kf86JzOeEoWTpI3qafywo08K18cvzOlI4MCid2IMQ9C6ZnNu8zHWXUYnr9bbgMYaLf9bB+qzAG5M3SBP/GjxJlMmBJbSNXhMPQoxcaROxIXhx7yo+evrxMye0cCHkyLkuWlcwloe+ebZrcK0GDrPEo331cIAki6YL/ML/lVEjfyKukv9d8HffmXt089aHG3dSsq9+eiMPcd4XilCGQRFbJWTt2CSdqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771262377; c=relaxed/relaxed;
	bh=DlfQBWh/1ejwW858oNbtS1e0RO+K3ejkv0QSbNUrw9w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n78foFVpa1XWuaLjZuhTQBOmPxMeWO+jcWVuBc3gtgGkKE6D+6dpiRojYxa9NAYzNxdXUTL3PvxRTWD7SIeEYyNv84MAnhGy0DbJ+/WBusW2N9KZUXAK+E0BCe1R4XISsC6JkJlXTYa1pcA3J/DAL6WggpsKUMucMP/+Tuh6kccBnIGpTr9LOZTcuVwvEl5mZfQ6159TLucm5yF5QIehZz7VriSOPuGmhaHGUpMqkpc9DfaZk5JpYPsns4s+SEydPOcVeJ7Xb6nAS+MPwdmz0n1z3ZbzJwXyUm/B5x8fehPUvR26xxZp480FVUbiwcfSqShrmGgg4YU4+278FOV2dA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rYRiFaSy; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=vishalc@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rYRiFaSy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=vishalc@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fF8f05S9Lz2xVT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Feb 2026 04:19:35 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G9bcCD2549181;
	Mon, 16 Feb 2026 17:19:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=DlfQBWh/1ejwW858oNbtS1e0RO+K3ejkv0QSbNUrw
	9w=; b=rYRiFaSy5WobzD9BZF/g43fnh5iBrOrUJPV3qdgAucJ3ilR2n9DzNptQW
	6lzmDmsiPjLAKX/S43ptirBArALrLJN9bNzM2CFkfb5Cxy/0Waax64tqRYwTBQuD
	kt9wYPM4FyE6kK+LP6zCWIYTQRgbA9Vfr5lUKyGWYIBrsxm3OAm5mcT16OXX+HOy
	2MIV0elxRAHi3VsuNrSdOkLS5/Yb+8wyM3mg1d3eJdoGGRAg6H4Fmcu9KZT7PUC4
	PsomsJy7yMGXgGWsanGkmh9b0fgEQgQtq2BmUN/+9oNBKoTblbeUVy2ALLzMf6wZ
	7aZ4XfE19l66pc94PnE5R5Mi51N8Q==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cajcj84e8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Feb 2026 17:19:05 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61GDiV4q029073;
	Mon, 16 Feb 2026 17:19:04 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cb6315y14-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Feb 2026 17:19:04 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61GHJ0o352429218
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Feb 2026 17:19:00 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AE0BA20043;
	Mon, 16 Feb 2026 17:19:00 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9383A20040;
	Mon, 16 Feb 2026 17:18:51 +0000 (GMT)
Received: from vishalc-ibm.ibm.com (unknown [9.39.25.185])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 16 Feb 2026 17:18:51 +0000 (GMT)
From: Vishal Chourasia <vishalc@linux.ibm.com>
To: maddy@linux.ibm.com, sourabhjain@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        kexec@lists.infradead.org
Cc: mpe@ellerman.id.au, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, akpm@linux-foundation.org,
        bhe@redhat.com, mahesh@linux.ibm.com, ritesh.list@gmail.com,
        vishalc@linux.ibm.com, thuth@redhat.com, hbathini@linux.ibm.com,
        eajames@linux.ibm.com, dwmw@amazon.co.uk, kai.huang@intel.com,
        pbonzini@redhat.com, ubizjak@gmail.com, coxu@redhat.com,
        fuqiang.wang@easystack.cn, brgerst@gmail.com, liaoyuanhong@vivo.com,
        jbohac@suse.cz
Subject: [RFC PATCH v1] kexec: optimize crash hotplug by filtering redundant FDT updates
Date: Mon, 16 Feb 2026 22:44:57 +0530
Message-ID: <20260216171456.527608-2-vishalc@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
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
X-Proofpoint-ORIG-GUID: nCI5gqZepZ3KLvK25N5CfSurnFU4yjHE
X-Authority-Analysis: v=2.4 cv=Md9hep/f c=1 sm=1 tr=0 ts=6993518a cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VnNF1IyMAAAA:8 a=Q1TS8951KDF7Hiku8JMA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDE0NyBTYWx0ZWRfX6Rg7r6oBnCeZ
 Yhuz0zIh4QajyIwnpEk/Dw7aiouITOnmhtHtqgVe1bt1eFkj7UznntfwwPfwHFgJjjobZaDWZlZ
 fNUhINMAMKVxnhppXwANur3mCQ8LblLVNT4w4K4H3lQ56zxNdb/LBg01JwRfp/ujgKL8pAROAuU
 kD69SH1BrGHrvZDZSx3D1s8tlsnMBJdmH+Asio7YqMn6vE20ynZcs4wgdgxkynMWTMnRvHETfYF
 2hpnFhgBHZS2kPtRPkhROw0USndL7dMnHg0+cprouXi8M9oYzmxQzYBJ6kN3QvblKCg/YHTF88r
 IoGg9JekEROzYF1fqcF/U7lu2psgCXjkwGbwcECia64/BDutp2zhCKGcnYI+y6oAILLM3aTVVom
 w25wdMTlxH3BlLNZCgG0Ln/LZmkWdxDlz6Y3f2Un+o4WF8hJ5IjIFMefTjZgeZXzNaZSDmsnHqA
 i/FFS5qPkjr8iftQaUw==
X-Proofpoint-GUID: PrsvvTrYUNbwbokUKjJ5M4S3gZk1CWkf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_05,2026-02-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160147
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	LOTS_OF_MONEY,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[ellerman.id.au,kernel.org,redhat.com,alien8.de,linux.intel.com,linux-foundation.org,linux.ibm.com,gmail.com,amazon.co.uk,intel.com,easystack.cn,vivo.com,suse.cz];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[vishalc@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:maddy@linux.ibm.com,m:sourabhjain@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:kexec@lists.infradead.org,m:mpe@ellerman.id.au,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:akpm@linux-foundation.org,m:bhe@redhat.com,m:mahesh@linux.ibm.com,m:ritesh.list@gmail.com,m:vishalc@linux.ibm.com,m:thuth@redhat.com,m:hbathini@linux.ibm.com,m:eajames@linux.ibm.com,m:dwmw@amazon.co.uk,m:kai.huang@intel.com,m:pbonzini@redhat.com,m:ubizjak@gmail.com,m:coxu@redhat.com,m:fuqiang.wang@easystack.cn,m:brgerst@gmail.com,m:liaoyuanhong@vivo.com,m:jbohac@suse.cz,m:riteshlist@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-16886-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vishalc@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: AFD8C146A67
X-Rspamd-Action: no action

The arch_crash_handle_hotplug_event() interface currently lacks the CPU
index associated with hotplug events. This forces architecture handlers,
specifically on PowerPC, to unconditionally update the crash Flattened
Device Tree (FDT) for every CPU online event which should only be done
in case of DLPAR operations which add/remove new device tree node under the
/cpus. On large systems with crash kernel loaded, this behavior causes a
significant performance bottleneck. For example, during SMT switch
operations involving 1400 CPUs, the redundant execution of
update_crash_fdt() adds over half an hour of overhead

As shown in the ftrace function graph:
   83)   bash-14351   | $ 2283891 us  |     } /* update_cpus_node */

This patch passes the CPU index to the arch-specific handlers and
modifies the PowerPC implementation to check cpus_booted_once_mask. If
a CPU has been previously initialized, its FDT node is already present,
allowing the handler to skip the redundant update_crash_fdt() call.

Fixes: b741092d5976 ("powerpc/crash: add crash CPU hotplug support")
Signed-off-by: Vishal Chourasia <vishalc@linux.ibm.com>
---
 arch/powerpc/include/asm/kexec.h | 2 +-
 arch/powerpc/kexec/crash.c       | 5 +++--
 arch/x86/include/asm/kexec.h     | 2 +-
 arch/x86/kernel/crash.c          | 2 +-
 include/linux/crash_core.h       | 2 +-
 kernel/crash_core.c              | 2 +-
 6 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index bd4a6c42a5f3..2d6d32942bc0 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -137,7 +137,7 @@ static inline void crash_setup_regs(struct pt_regs *newregs,
 }
 
 #ifdef CONFIG_CRASH_HOTPLUG
-void arch_crash_handle_hotplug_event(struct kimage *image, void *arg);
+void arch_crash_handle_hotplug_event(struct kimage *image, int cpu, void *arg);
 #define arch_crash_handle_hotplug_event arch_crash_handle_hotplug_event
 
 int arch_crash_hotplug_support(struct kimage *image, unsigned long kexec_flags);
diff --git a/arch/powerpc/kexec/crash.c b/arch/powerpc/kexec/crash.c
index a325c1c02f96..d280883c8ab6 100644
--- a/arch/powerpc/kexec/crash.c
+++ b/arch/powerpc/kexec/crash.c
@@ -568,7 +568,7 @@ int arch_crash_hotplug_support(struct kimage *image, unsigned long kexec_flags)
  *	       part of the FDT.
  * Memory add/remove: No action is taken as this is not yet supported.
  */
-void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
+void arch_crash_handle_hotplug_event(struct kimage *image, int cpu, void *arg)
 {
 	struct memory_notify *mn;
 
@@ -577,7 +577,8 @@ void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
 		return;
 
 	case KEXEC_CRASH_HP_ADD_CPU:
-		update_crash_fdt(image);
+		if (!cpumask_test_cpu(cpu, &cpus_booted_once_mask))
+			update_crash_fdt(image);
 		break;
 
 	case KEXEC_CRASH_HP_REMOVE_MEMORY:
diff --git a/arch/x86/include/asm/kexec.h b/arch/x86/include/asm/kexec.h
index 5cfb27f26583..57f5c5067267 100644
--- a/arch/x86/include/asm/kexec.h
+++ b/arch/x86/include/asm/kexec.h
@@ -222,7 +222,7 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image);
 extern void kdump_nmi_shootdown_cpus(void);
 
 #ifdef CONFIG_CRASH_HOTPLUG
-void arch_crash_handle_hotplug_event(struct kimage *image, void *arg);
+void arch_crash_handle_hotplug_event(struct kimage *image, int cpu, void *arg);
 #define arch_crash_handle_hotplug_event arch_crash_handle_hotplug_event
 
 int arch_crash_hotplug_support(struct kimage *image, unsigned long kexec_flags);
diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
index 335fd2ee9766..dda4ad1a163e 100644
--- a/arch/x86/kernel/crash.c
+++ b/arch/x86/kernel/crash.c
@@ -508,7 +508,7 @@ unsigned int arch_crash_get_elfcorehdr_size(void)
  *
  * Prepare the new elfcorehdr and replace the existing elfcorehdr.
  */
-void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
+void arch_crash_handle_hotplug_event(struct kimage *image, int cpu, void *arg)
 {
 	void *elfbuf = NULL, *old_elfcorehdr;
 	unsigned long nr_mem_ranges;
diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
index d35726d6a415..118e2e03e0b5 100644
--- a/include/linux/crash_core.h
+++ b/include/linux/crash_core.h
@@ -42,7 +42,7 @@ static inline int crash_load_dm_crypt_keys(struct kimage *image) {return 0; }
 #endif
 
 #ifndef arch_crash_handle_hotplug_event
-static inline void arch_crash_handle_hotplug_event(struct kimage *image, void *arg) { }
+static inline void arch_crash_handle_hotplug_event(struct kimage *image, int cpu, void *arg) { }
 #endif
 
 int crash_check_hotplug_support(void);
diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 3952b3e102e0..27c6f57e5169 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -634,7 +634,7 @@ static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu,
 	image->hp_action = hp_action;
 
 	/* Now invoke arch-specific update handler */
-	arch_crash_handle_hotplug_event(image, arg);
+	arch_crash_handle_hotplug_event(image, cpu, arg);
 
 	/* No longer handling a hotplug event */
 	image->hp_action = KEXEC_CRASH_HP_NONE;
-- 
2.53.0


