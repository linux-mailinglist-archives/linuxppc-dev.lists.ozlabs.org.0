Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C21805D10
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 19:17:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sl7zq0lwrz3dRW
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 05:17:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sl7zL02RJz2yjD
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Dec 2023 05:16:59 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Sl7zC5K8Fz9v73;
	Tue,  5 Dec 2023 19:16:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FUKY1q7eCGHR; Tue,  5 Dec 2023 19:16:55 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Sl7zC4X6Gz9v5V;
	Tue,  5 Dec 2023 19:16:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 96C7E8B773;
	Tue,  5 Dec 2023 19:16:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id f2il9A4FpS-m; Tue,  5 Dec 2023 19:16:55 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.232.2])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4B9038B763;
	Tue,  5 Dec 2023 19:16:55 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jochen Friedrich <jochen@scram.de>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH] i2c: cpm: Fix data type
Date: Tue,  5 Dec 2023 19:16:53 +0100
Message-ID: <de07101166ac0e4649cf3b57fdf960748c9ecc75.1701800124.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701800212; l=868; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=WhGGXCesc3p8fX5FLvMo9W+DZljJMoaQOdx79BxmRAk=; b=CO4bglnbxMhv39ca95NrPFU+DicQ93LONILMMJSk1kQxgbYmqOh6QAP0Mm3kXXNLe4Dfpp2mC D9aDnUklKRdAINE9l6YcvMvR+rg0voOvTrYfQ0hpNGXW1TLJYn4MOo7
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
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
Cc: kernel test robot <lkp@intel.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

sparse reports an error on some data that gets converted from be32.

That's because that data is typed u32 instead of __be32.

Fix it.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202312042210.QL4DA8Av-lkp@intel.com/
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/i2c/busses/i2c-cpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-cpm.c b/drivers/i2c/busses/i2c-cpm.c
index 9a664abf734d..077be367b382 100644
--- a/drivers/i2c/busses/i2c-cpm.c
+++ b/drivers/i2c/busses/i2c-cpm.c
@@ -634,7 +634,7 @@ static int cpm_i2c_probe(struct platform_device *ofdev)
 {
 	int result, len;
 	struct cpm_i2c *cpm;
-	const u32 *data;
+	const __be32 *data;
 
 	cpm = kzalloc(sizeof(struct cpm_i2c), GFP_KERNEL);
 	if (!cpm)
-- 
2.41.0

