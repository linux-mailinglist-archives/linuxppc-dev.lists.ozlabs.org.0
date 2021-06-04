Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FA539B61A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jun 2021 11:38:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FxHlH4HLTz3bsH
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jun 2021 19:38:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com;
 envelope-from=heying24@huawei.com; receiver=<UNKNOWN>)
X-Greylist: delayed 994 seconds by postgrey-1.36 at boromir;
 Fri, 04 Jun 2021 19:38:31 AEST
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FxHkv4QS0z2yYQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jun 2021 19:38:28 +1000 (AEST)
Received: from dggeme758-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FxHG50cc6zWpSp;
 Fri,  4 Jun 2021 17:17:01 +0800 (CST)
Received: from huawei.com (10.67.174.47) by dggeme758-chm.china.huawei.com
 (10.3.19.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 4 Jun
 2021 17:21:46 +0800
From: He Ying <heying24@huawei.com>
To: <mpe@ellerman.id.au>, <benh@kernel.crashing.org>, <paulus@samba.org>,
 <nathan@kernel.org>
Subject: [PATCH] powerpc: Fix kernel-jump address for ppc64 wrapper boot
Date: Fri, 4 Jun 2021 05:22:28 -0400
Message-ID: <20210604092228.199588-1-heying24@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.47]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggeme758-chm.china.huawei.com (10.3.19.104)
X-CFilter-Loop: Reflected
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 heying24@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From "64-bit PowerPC ELF Application Binary Interface Supplement 1.9",
we know that the value of a function pointer in a language like C is
the address of the function descriptor and the first doubleword
of the function descriptor contains the address of the entry point
of the function.

So, when we want to jump to an address (e.g. addr) to execute for
PPC-elf64abi, we should assign the address of addr *NOT* addr itself
to the function pointer or system will jump to the wrong address.

Link: https://refspecs.linuxfoundation.org/ELF/ppc64/PPC-elf64abi.html#FUNC-DES
Signed-off-by: He Ying <heying24@huawei.com>
---
 arch/powerpc/boot/main.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/powerpc/boot/main.c b/arch/powerpc/boot/main.c
index cae31a6e8f02..50fd7f11b642 100644
--- a/arch/powerpc/boot/main.c
+++ b/arch/powerpc/boot/main.c
@@ -268,7 +268,16 @@ void start(void)
 	if (console_ops.close)
 		console_ops.close();
 
+#ifdef CONFIG_PPC64_BOOT_WRAPPER
+	/*
+	 * For PPC-elf64abi, the value of a function pointer is the address
+	 * of the function descriptor. And the first doubleword of a function
+	 * descriptor contains the address of the entry point of the function.
+	 */
+	kentry = (kernel_entry_t) &vmlinux.addr;
+#else
 	kentry = (kernel_entry_t) vmlinux.addr;
+#endif
 	if (ft_addr) {
 		if(platform_ops.kentry)
 			platform_ops.kentry(ft_addr, vmlinux.addr);
-- 
2.17.1

