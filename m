Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB9F38E0FA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 May 2021 08:26:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FpS0B0fbjz3bvC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 May 2021 16:26:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=hisilicon.com (client-ip=45.249.212.190;
 helo=szxga04-in.huawei.com; envelope-from=song.bao.hua@hisilicon.com;
 receiver=<UNKNOWN>)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FpQdV2FbRz2yqC
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 May 2021 15:24:57 +1000 (AEST)
Received: from dggems701-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FpQYy1hfSz1BQ79;
 Mon, 24 May 2021 13:21:58 +0800 (CST)
Received: from dggemi761-chm.china.huawei.com (10.1.198.147) by
 dggems701-chm.china.huawei.com (10.3.19.178) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 24 May 2021 13:24:48 +0800
Received: from SWX921481.china.huawei.com (10.126.200.111) by
 dggemi761-chm.china.huawei.com (10.1.198.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Mon, 24 May 2021 13:24:44 +0800
From: Barry Song <song.bao.hua@hisilicon.com>
To: <corbet@lwn.net>, <linux-doc@vger.kernel.org>
Subject: [PATCH] docs: kernel-parameters: mark numa=off is supported by a
 bundle of architectures
Date: Mon, 24 May 2021 17:17:15 +1200
Message-ID: <20210524051715.13604-1-song.bao.hua@hisilicon.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.200.111]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggemi761-chm.china.huawei.com (10.1.198.147)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 24 May 2021 16:26:00 +1000
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
Cc: Barry Song <song.bao.hua@hisilicon.com>, aou@eecs.berkeley.edu,
 catalin.marinas@arm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
 paulus@samba.org, linux-riscv@lists.infradead.org, will@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

risc-v and arm64 support numa=off by common arch_numa_init()
in drivers/base/arch_numa.c. x86, ppc, mips, sparc support it
by arch-level early_param.
numa=off is widely used in linux distributions. it is better
to document it.

Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index cb89dbdedc46..a388fbdaa2ec 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3513,6 +3513,9 @@
 
 	nr_uarts=	[SERIAL] maximum number of UARTs to be registered.
 
+	numa=off 	[KNL, ARM64, PPC, RISCV, SPARC, X86] Disable NUMA, Only
+			set up a single NUMA node spanning all memory.
+
 	numa_balancing=	[KNL,ARM64,PPC,RISCV,S390,X86] Enable or disable automatic
 			NUMA balancing.
 			Allowed values are enable and disable
-- 
2.25.1

