Return-Path: <linuxppc-dev+bounces-4828-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3FCA057CB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 11:15:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSkM10dVwz308V;
	Wed,  8 Jan 2025 21:15:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736331325;
	cv=none; b=VkIjlXCoBopsIgt9xX/lYYvfyEXvcBBC58zmjAbBDZpfrC+CRawQVG7fLhEEF5e/h/YeZuoofQpoeII8jvVlNqdE/wN1Clhif2WFD03ahqQCdo9SGr3rqRATogYHwYThqAvVCb4W1CD89JPbzkADIZ4/81D2/RVn2Eolht5GVrhbaPlG5dBllHprWB91uCVEwKzkPi3zKHcxU83skpQMNIIGYjuxFQ2SiYzTikqEhsRA/y99bn4PHd39DWObEXDFwareDGwmwN0N1R0BmGx5WJV6XJU8fmZFtDzeAifDlgNViiqnphYn33SrsqusRjdARDYWxcYJ015gLwqschy4tw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736331325; c=relaxed/relaxed;
	bh=EwscI7uVcdbmUY3L0es/V7Diybjo/Bbg4ugn3C2Ls+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XFwCXxWpdWrjl4n0S1lVnExFstEYZGhY/LyPMEezqlPZBb38/j1FEWCw+pEi6Xqz7mMnfktPotaPobFe8ZlIIeCzLhuvbvSftLQ6+qPFvqeUkasUREk20TfjM9WImF9vI5TOnJIJjPkes55eqdNpLEF6PUF3VEnD8DG6N1rK8iTME+d5fENDFQ6RjYwi6N0gxbUlOaB+bLO8wxNkYLf8FrCm+1UAq+j0wOZExVmYqJi1QWqHCBuOHNVrq7Kccwj8u38IxJ13Bl+KAKLLBvVxurwGTyRjfycDBQtZ2V4BUbczNCBMZcgYpwQhEWtF6hATMuBWDRQ23SpajGILRZKqMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mGahxhez; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mGahxhez;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSkLz4thSz305v
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 21:15:23 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 507Namhe027225;
	Wed, 8 Jan 2025 10:15:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=EwscI7uVcdbmUY3L0
	es/V7Diybjo/Bbg4ugn3C2Ls+o=; b=mGahxhezR0m/lJDzfwjX2pokONhWBQbDs
	ovYHUVyAewEStLeY3HNQdsHVP2yafyFKWbWdeKeFOBHTgwjtHYW09zGG0lnhVDdP
	Cvu3x/lGGCa0GII5upsqPeWnhUC6ZqPzYII2KyvI+O15J4eCTSCwHwGBt8Ub45nP
	5n0iiNys6THqIx76jpIJxqDXrGB42vVTAThuPGiuYeXrDVf2DlAS9evGYTEe+j1J
	romHnlY9qBeGaDwZozAdTt071nQbY1pdXH5rKJv3H/kfsO35HXQEXVYXhytweHOW
	hjF5U3Ez8CRVxjk3TL9NACDDpsS7Co+g08U2KVxUNaA8bCe7p/1ug==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 441e3b29bg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 10:15:13 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 508A2CZl027929;
	Wed, 8 Jan 2025 10:15:12 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 43yhhk7029-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 10:15:12 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 508AF9jp57934084
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Jan 2025 10:15:09 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 142D020063;
	Wed,  8 Jan 2025 10:15:09 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4CBBE2005A;
	Wed,  8 Jan 2025 10:15:07 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.in.ibm.com (unknown [9.109.204.94])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  8 Jan 2025 10:15:07 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>, Baoquan he <bhe@redhat.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v1 2/5] crash: let arch decide crash memory export to iomem_resource
Date: Wed,  8 Jan 2025 15:44:55 +0530
Message-ID: <20250108101458.406806-3-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108101458.406806-1-sourabhjain@linux.ibm.com>
References: <20250108101458.406806-1-sourabhjain@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: 94mdwcB7Nn22nW8ZINhLrIj7f40skBCd
X-Proofpoint-GUID: 94mdwcB7Nn22nW8ZINhLrIj7f40skBCd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 suspectscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080082
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
CC: Madhavan Srinivasan <maddy@linux.ibm.com>
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


