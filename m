Return-Path: <linuxppc-dev+bounces-4248-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 904409F4432
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2024 07:47:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YC6mp5qb9z3bVF;
	Tue, 17 Dec 2024 17:47:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734418026;
	cv=none; b=QnwsOQUX2X3hP8zjFy6KcUAijSQ3U0EBbUiAT9R0URCbDIilbxecIZv8+pnKczEm1Abrb9wT0JqSZXgPOg38liwvEAX2lWJewkm8JKxU9cIL1ZjAZFCTctIrAO6WS04srK/iyg7D07t0zQg8WRBMeqCwCvriR5xOVc60uZdjDmWzhkrn/8ktn9AP0Tys1iUsVxfHagHzn1TQEE6U14v9XtatCZAOmqx8xxljfcKKRiVmE42z3E75EXeuNcmAK53BdswSxccAssSUKmH8Sq9yag9ch5sqC3GU2GXhdgcBXHQbLqlyohDk26agA8unrJIraQBd9DUjTIAQJ61dl/JKdw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734418026; c=relaxed/relaxed;
	bh=EwscI7uVcdbmUY3L0es/V7Diybjo/Bbg4ugn3C2Ls+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B9vIyb2BotRbY5imGJnKWiwN11NPw/CIhXfHLIVxO0yDZO1PHjltt4SvXM1PZ1itTyQB0uVVPaU4ZTKcsS8zM2g3snsH6wDtza/pCHl8Lp3REbCoH/tOsAO93kDcmXpBgjUWHKPtfCA8+j8MAw4+uzujDDzDpzbul3fy8KmMeFTN5E8RRYAWDMQXNVCP5G18eJG0WjHavfmK8ZLXbxn1GTYcWDNrRAhAn4pvbD8U6QBjcgGauZigQtVVQDozN0B7snMTZnVk9gkDVYHXCxXPOWo4Jd8Vi9VPMdrgwzqhGWv9Ke91gtQ3Ttv9fqDAMB/wSw7eoog3OnbHWirOrRuJmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VzSREzqt; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VzSREzqt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YC6mn4J7nz30Pn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2024 17:47:05 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGNaVru023385;
	Tue, 17 Dec 2024 06:46:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=EwscI7uVcdbmUY3L0
	es/V7Diybjo/Bbg4ugn3C2Ls+o=; b=VzSREzqtxtkizVmTpzkKqJ1X2Fiso6dLl
	29SGRZi+wrVZS1npmBOJqlaxjDcE82AZ1NAEQRB2bwdH2xho7GPB90OPPjWdAN2q
	78cwod38PnNKWDg4c+ULVxHIS29Umm3DI/VOBpLhbrC/u3qVXIlm3dY5VAgxjqfx
	RysVHCYCQqzx8O2ci/VL/n5ryApAFRixMnIZhz+nN3D44gOMXyO6x0ZqBTJhQmDy
	ruoJDuoVlxRT6t7dJE7oxgW+KSw5DgdcuMl+6zMmlUE2VnOezbqUtLcGmxsC+DZn
	brecMsI55Ey43/KKzB2FO+ygJxlBbAyhpR6o7dM/Xrs4XXysZkV/g==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jx1a9a40-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 06:46:53 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH3tDcC011295;
	Tue, 17 Dec 2024 06:46:53 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 43hpjk1bwr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 06:46:53 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BH6knBt60686736
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Dec 2024 06:46:49 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AA21D20043;
	Tue, 17 Dec 2024 06:46:49 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2DEF320040;
	Tue, 17 Dec 2024 06:46:45 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.43.29.128])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 17 Dec 2024 06:46:44 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>, Baoquan he <bhe@redhat.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] crash: let arch decide crash memory export to iomem_resource
Date: Tue, 17 Dec 2024 12:16:10 +0530
Message-ID: <20241217064613.1042866-3-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241217064613.1042866-1-sourabhjain@linux.ibm.com>
References: <20241217064613.1042866-1-sourabhjain@linux.ibm.com>
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
X-Proofpoint-GUID: k63nIDxe6HsLNslYA99kBcErIbowGZeT
X-Proofpoint-ORIG-GUID: k63nIDxe6HsLNslYA99kBcErIbowGZeT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170052
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


