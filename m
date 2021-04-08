Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDB5357958
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 03:11:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FG39w4fwzz3bqW
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 11:11:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.32; helo=szxga06-in.huawei.com;
 envelope-from=yukuai3@huawei.com; receiver=<UNKNOWN>)
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FG39933qyz2yxP
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Apr 2021 11:10:35 +1000 (AEST)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FG36x2tTSzkj1b;
 Thu,  8 Apr 2021 09:08:41 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.498.0; Thu, 8 Apr 2021
 09:09:44 +0800
From: Yu Kuai <yukuai3@huawei.com>
To: <mpe@ellerman.id.au>
Subject: [PATCH 1/2] powerpc: remove set but not used variable
 'force_printk_to_btext'
Date: Thu, 8 Apr 2021 09:18:00 +0800
Message-ID: <20210408011801.557004-2-yukuai3@huawei.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210408011801.557004-1-yukuai3@huawei.com>
References: <20210408011801.557004-1-yukuai3@huawei.com>
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

Fixes gcc '-Wunused-but-set-variable' warning:

arch/powerpc/kernel/btext.c:49:12: error: 'force_printk_to_btext'
defined but not used.

It is never used, and so can be removed.

Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 arch/powerpc/kernel/btext.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/kernel/btext.c b/arch/powerpc/kernel/btext.c
index 803c2a45b22a..359d0f4ca532 100644
--- a/arch/powerpc/kernel/btext.c
+++ b/arch/powerpc/kernel/btext.c
@@ -46,7 +46,6 @@ unsigned long disp_BAT[2] __initdata = {0, 0};
 static unsigned char vga_font[cmapsz];
 
 int boot_text_mapped __force_data = 0;
-int force_printk_to_btext = 0;
 
 extern void rmci_on(void);
 extern void rmci_off(void);
-- 
2.25.4

