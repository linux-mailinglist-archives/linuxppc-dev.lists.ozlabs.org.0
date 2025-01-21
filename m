Return-Path: <linuxppc-dev+bounces-5443-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E61A17D4F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2025 12:55:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YclyC3QPWz30Gf;
	Tue, 21 Jan 2025 22:55:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737460515;
	cv=none; b=dz3HIFnH5CjmMnRAaRz3U8knpy1koRpe3GkbsR9f0E+kTXZm9QmR3Oi5CjwN/SA3uNUtitRBqDvEz1PnLvlah4dbEs8MM3hmOZaWtoM27UMOBMuBet9K0IxmOYHS5EyIwV/PHO+QC69J8xYQBegfxncyH2w5UlK97cxdRwRSuicIPwbi0fDOTC5C1lM23oJ9oWvW5LDVVbuRvZBSR2xNRgM7alLM7ecWJceRT96Q3XoNoFki0wf4Pu6TkJml5qm6UvvrzCT420Uxqs6zvc41whA+r7k1QKkcAeDMPdf+QSE8Gh5X1CywZAxCLJRLCtsViR7ne35IYczImKiGI6l/Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737460515; c=relaxed/relaxed;
	bh=qADcYPa4bM+Ff0Qcz2KjMujcQUaYXmGNS3B1iOxKeEA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gs4kq+YfqBby6hwKN+xnNCjem4J3++y9VSZHmRLzBpfm2EUXT52nMWOpvaH3OuJRr56C94cQB1MbIKchOy6KBH/y7LT37xM1dmOxa/CczoLSwyhGnFOhqun/rLi5bxAcg8Q1WH13kchl/QVI9lZbyyIp8kA0WnJEhrj4glUIvo3NviMYgf90B+1gDIZmeUNXD9hwQ0jI8uwDGxZJP3osGuy+0rOR1picb55zyfWkuwNp3c3wgoh0Aqz3Xa/NNfEnuXjqr6S7RkU331CmHzuAAzBBxahSDgyxe58jLqWksXtajUOxxr3C2MIfD43UZ+l+UeLb00PEUHht4HY74oLGvQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GqpPwR/E; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GqpPwR/E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YclyB50RSz30C5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2025 22:55:14 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50L7XLB5010140;
	Tue, 21 Jan 2025 11:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=qADcYPa4bM+Ff0Qcz
	2KjMujcQUaYXmGNS3B1iOxKeEA=; b=GqpPwR/Eqv1J8y90NZHQ0vutCCG7DMz7J
	ZVmau3hFyjUr38ysRRjdZI9pmxs32g+5it1Oyv0o0bSZ9xAjhCqghhXDg5T0FtJh
	aKe2kDccy+MPYus3A3pGw/lZMIipEw/tlrzEVs+EAFTCUAqSbs72X9cRN6aXenuX
	KWxdLbdllb1r+6D55VoTHkRc5Mswb2dWKk411L9sAhJB3exnY9hHQFnHtyiibKKP
	fYewsXA3Uat8eRrfDdksElr6G8jtRTuMXp8zfbEFAcNhpkeyUK+sHn4F9A9kn2f9
	CjMOfYrQY9z5CtMhgWpB7Im5+DDQEH+hKohVzCFl1GoRA4/3qwPoQ==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44a79n16ug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 11:55:04 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50LAtOU4021012;
	Tue, 21 Jan 2025 11:55:04 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 448sb1anh7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 11:55:04 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50LBt0PP54133066
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jan 2025 11:55:00 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9AE7220040;
	Tue, 21 Jan 2025 11:55:00 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BC75120043;
	Tue, 21 Jan 2025 11:54:57 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.43.54.128])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 21 Jan 2025 11:54:57 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>, Baoquan he <bhe@redhat.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] crash: let arch decide crash memory export to iomem_resource
Date: Tue, 21 Jan 2025 17:24:39 +0530
Message-ID: <20250121115442.1278458-4-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250121115442.1278458-1-sourabhjain@linux.ibm.com>
References: <20250121115442.1278458-1-sourabhjain@linux.ibm.com>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Gpkoxbm4_lMfrIfIwJce-msFe3yKyBvb
X-Proofpoint-ORIG-GUID: Gpkoxbm4_lMfrIfIwJce-msFe3yKyBvb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_05,2025-01-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 mlxlogscore=999 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501210095
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

insert_crashkernel_resources() adds crash memory to iomem_resource if
generic crashkernel reservation is enabled on an architecture.

On PowerPC, system RAM is added to iomem_resource. See commit
c40dd2f766440 ("powerpc: Add System RAM to /proc/iomem").

Enabling generic crashkernel reservation on PowerPC leads to a conflict
when system RAM is added to iomem_resource because a part of the system
RAM, the crashkernel memory, has already been added to iomem_resource.

The next commit in the series "powerpc/crash: use generic crashkernel
reservation" enables generic crashkernel reservation on PowerPC. If the
crashkernel is added to iomem_resource, the kernel fails to add
system RAM to /proc/iomem and prints the following traces:

CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.13.0-rc2+
snip...
NIP [c000000002016b3c] add_system_ram_resources+0xf0/0x15c
LR [c000000002016b34] add_system_ram_resources+0xe8/0x15c
Call Trace:
[c00000000484bbc0] [c000000002016b34] add_system_ram_resources+0xe8/0x15c
[c00000000484bc20] [c000000000010a4c] do_one_initcall+0x7c/0x39c
[c00000000484bd00] [c000000002005418] do_initcalls+0x144/0x18c
[c00000000484bd90] [c000000002005714] kernel_init_freeable+0x21c/0x290
[c00000000484bdf0] [c0000000000110f4] kernel_init+0x2c/0x1b8
[c00000000484be50] [c00000000000dd3c] ret_from_kernel_user_thread+0x14/0x1c

To avoid this, an architecture hook is added in
insert_crashkernel_resources(), allowing the architecture to decide
whether crashkernel memory should be added to iomem_resource.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan he <bhe@redhat.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: kexec@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 include/linux/crash_reserve.h | 11 +++++++++++
 kernel/crash_reserve.c        |  3 +++
 2 files changed, 14 insertions(+)

diff --git a/include/linux/crash_reserve.h b/include/linux/crash_reserve.h
index 1fe7e7d1b214..f1205d044dae 100644
--- a/include/linux/crash_reserve.h
+++ b/include/linux/crash_reserve.h
@@ -18,6 +18,17 @@ int __init parse_crashkernel(char *cmdline, unsigned long long system_ram,
 		unsigned long long *crash_size, unsigned long long *crash_base,
 		unsigned long long *low_size, bool *high);
 
+#ifdef CONFIG_ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
+
+#ifndef arch_add_crash_res_to_iomem
+static inline bool arch_add_crash_res_to_iomem(void)
+{
+	return true;
+}
+#endif
+
+#endif
+
 #ifdef CONFIG_ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
 #ifndef DEFAULT_CRASH_KERNEL_LOW_SIZE
 #define DEFAULT_CRASH_KERNEL_LOW_SIZE	(128UL << 20)
diff --git a/kernel/crash_reserve.c b/kernel/crash_reserve.c
index aff7c0fdbefa..190104f32fe1 100644
--- a/kernel/crash_reserve.c
+++ b/kernel/crash_reserve.c
@@ -460,6 +460,9 @@ void __init reserve_crashkernel_generic(unsigned long long crash_size,
 #ifndef HAVE_ARCH_ADD_CRASH_RES_TO_IOMEM_EARLY
 static __init int insert_crashkernel_resources(void)
 {
+	if (!arch_add_crash_res_to_iomem())
+		return 0;
+
 	if (crashk_res.start < crashk_res.end)
 		insert_resource(&iomem_resource, &crashk_res);
 
-- 
2.47.1


