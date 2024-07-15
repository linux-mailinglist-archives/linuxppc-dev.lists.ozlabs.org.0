Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12540930CE1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2024 04:55:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WMmz06vgpz3fRN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2024 12:55:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iscas.ac.cn (client-ip=159.226.251.81; helo=cstnet.cn; envelope-from=make24@iscas.ac.cn; receiver=lists.ozlabs.org)
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WMmyc60dDz30Tp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2024 12:55:02 +1000 (AEST)
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
	by APP-03 (Coremail) with SMTP id rQCowAB3mCVzj5Rm64nOFQ--.12171S2;
	Mon, 15 Jul 2024 10:54:50 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: fbarrat@linux.ibm.com,
	ajd@linux.ibm.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	mpe@ellerman.id.au,
	manoj@linux.vnet.ibm.com,
	imunsie@au1.ibm.com,
	clombard@linux.vnet.ibm.com
Subject: [PATCH v4] cxl: Fix possible null pointer dereference in read_handle()
Date: Mon, 15 Jul 2024 10:54:42 +0800
Message-Id: <20240715025442.3229209-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowAB3mCVzj5Rm64nOFQ--.12171S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJry7Gr18tF4rKFyxGr4fAFb_yoW8GF1UpF
	Z7GFWjyFyDJanFyF4kXa18ZFyaka4rKFWYgFy09w1fZws8XrWrZa43Ca4F9a4jyrW8t3W0
	va1DtF1avrWUZ3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWUuVWrJwAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
	W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI2
	0VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFV
	Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
	x4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
	1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_
	JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
	sGvfC2KfnxnUUI43ZEXa7VUbHa0DUUUUU==
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/
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
Cc: stable@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Ma Ke <make24@iscas.ac.cn>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In read_handle(), of_get_address() may return NULL if getting address and
size of the node failed. When of_read_number() uses prop to handle
conversions between different byte orders, it could lead to a null pointer
dereference. Add NULL check to fix potential issue.

Found by static analysis.

Cc: stable@vger.kernel.org
Fixes: 14baf4d9c739 ("cxl: Add guest-specific code")
Signed-off-by: Ma Ke <make24@iscas.ac.cn>
---
Changes in v4:
- modified vulnerability description according to suggestions, making the 
process of static analysis of vulnerabilities clearer. No active research 
on developer behavior.
Changes in v3:
- fixed up the changelog text as suggestions.
Changes in v2:
- added an explanation of how the potential vulnerability was discovered,
but not meet the description specification requirements.
---
 drivers/misc/cxl/of.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/cxl/of.c b/drivers/misc/cxl/of.c
index bcc005dff1c0..d8dbb3723951 100644
--- a/drivers/misc/cxl/of.c
+++ b/drivers/misc/cxl/of.c
@@ -58,7 +58,7 @@ static int read_handle(struct device_node *np, u64 *handle)
 
 	/* Get address and size of the node */
 	prop = of_get_address(np, 0, &size, NULL);
-	if (size)
+	if (!prop || size)
 		return -EINVAL;
 
 	/* Helper to read a big number; size is in cells (not bytes) */
-- 
2.25.1

