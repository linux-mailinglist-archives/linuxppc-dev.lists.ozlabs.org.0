Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E4E356CA6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 14:51:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFkmj2TrJz3cGl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 22:51:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=szxga04-in.huawei.com;
 envelope-from=yukuai3@huawei.com; receiver=<UNKNOWN>)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFkmP3zpLz302q
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Apr 2021 22:51:33 +1000 (AEST)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FFkjm6dkVz16J2d;
 Wed,  7 Apr 2021 20:49:16 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.498.0; Wed, 7 Apr 2021
 20:51:19 +0800
From: Yu Kuai <yukuai3@huawei.com>
To: <mpe@ellerman.id.au>
Subject: [PATCH] powerpc: Make some symbols static
Date: Wed, 7 Apr 2021 20:59:42 +0800
Message-ID: <20210407125942.4140430-1-yukuai3@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.127.227]
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
Cc: yukuai3@huawei.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, yi.zhang@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The sparse tool complains as follows:

arch/powerpc/kernel/btext.c:48:5: warning:
 symbol 'boot_text_mapped' was not declared. Should it be static?
arch/powerpc/kernel/btext.c:49:5: warning:
 symbol 'force_printk_to_btext' was not declared. Should it be static?

These symbols are not used outside of btext.c, so this
commit marks them static.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 arch/powerpc/kernel/btext.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/btext.c b/arch/powerpc/kernel/btext.c
index 803c2a45b22a..6323304d7f6e 100644
--- a/arch/powerpc/kernel/btext.c
+++ b/arch/powerpc/kernel/btext.c
@@ -45,8 +45,8 @@ unsigned long disp_BAT[2] __initdata = {0, 0};
 
 static unsigned char vga_font[cmapsz];
 
-int boot_text_mapped __force_data = 0;
-int force_printk_to_btext = 0;
+static int boot_text_mapped __force_data;
+static int force_printk_to_btext;
 
 extern void rmci_on(void);
 extern void rmci_off(void);
-- 
2.25.4

