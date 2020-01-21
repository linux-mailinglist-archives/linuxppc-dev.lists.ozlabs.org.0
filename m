Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2085B14353F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 02:38:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 481rlp4FzLzDqfs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 12:38:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=huawei.com;
 envelope-from=chenzhou10@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 481rkF2LGPzDqch
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2020 12:36:59 +1100 (AEDT)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 2A1821F9D21F6B68683B;
 Tue, 21 Jan 2020 09:36:53 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.439.0; Tue, 21 Jan 2020 09:36:43 +0800
From: Chen Zhou <chenzhou10@huawei.com>
To: <benh@kernel.crashing.org>, <paulus@samba.org>, <mpe@ellerman.id.au>
Subject: [PATCH -next] powerpc/maple: fix comparing pointer to 0
Date: Tue, 21 Jan 2020 09:31:53 +0800
Message-ID: <20200121013153.9937-1-chenzhou10@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.25]
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
Cc: chenzhou10@huawei.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, nivedita@alum.mit.edu, tglx@linutronix.de,
 linuxppc-dev@lists.ozlabs.org, allison@lohutok.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fixes coccicheck warning:
./arch/powerpc/platforms/maple/setup.c:232:15-16:
	WARNING comparing pointer to 0

Compare pointer-typed values to NULL rather than 0.

Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
---
 arch/powerpc/platforms/maple/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/maple/setup.c b/arch/powerpc/platforms/maple/setup.c
index 47f7310..00a0780 100644
--- a/arch/powerpc/platforms/maple/setup.c
+++ b/arch/powerpc/platforms/maple/setup.c
@@ -229,7 +229,7 @@ static void __init maple_init_IRQ(void)
 	root = of_find_node_by_path("/");
 	naddr = of_n_addr_cells(root);
 	opprop = of_get_property(root, "platform-open-pic", &opplen);
-	if (opprop != 0) {
+	if (opprop) {
 		openpic_addr = of_read_number(opprop, naddr);
 		has_isus = (opplen > naddr);
 		printk(KERN_DEBUG "OpenPIC addr: %lx, has ISUs: %d\n",
-- 
2.7.4

