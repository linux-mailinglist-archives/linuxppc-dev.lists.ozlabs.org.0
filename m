Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A06807B4E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 23:24:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlsQb2N1lz3dBr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 09:24:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlsQ659j8z3bTN
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Dec 2023 09:24:13 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4SlsQ11z96z9vCD;
	Wed,  6 Dec 2023 23:24:09 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kE8Ud0EzoCD3; Wed,  6 Dec 2023 23:24:09 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4SlsQ114zRz9vCC;
	Wed,  6 Dec 2023 23:24:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 212368B774;
	Wed,  6 Dec 2023 23:24:09 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id e_urxSmvSke5; Wed,  6 Dec 2023 23:24:09 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.233.67])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D30B78B768;
	Wed,  6 Dec 2023 23:24:08 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jochen Friedrich <jochen@scram.de>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v2] i2c: cpm: Remove linux,i2c-index conversion from be32
Date: Wed,  6 Dec 2023 23:24:03 +0100
Message-ID: <460afa20784a445dff05b552ebb8c6a389d9de85.1701901105.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701901442; l=1142; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=AbB+dbMx4HU5AvTnNlYtCM6jkLY0EwXMarDUyPFbLic=; b=y/PdN+/KvCr7mrD+I6N56Yd6xNUvph00KdvH/w9ujSvwme01OU8fIwptkgvJ/N960OH3yoWyW aw+SgltocrLAHit+cRgeD7bZpD3uAlnrBYNIsCx3hVdfy9SyBTEAw6T
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

The type is correct, the be32_to_cpu() conversion is not.

Remove the conversion.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202312042210.QL4DA8Av-lkp@intel.com/
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Use u32 directly, remove be32_to_cpu().
---
 drivers/i2c/busses/i2c-cpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-cpm.c b/drivers/i2c/busses/i2c-cpm.c
index 9a664abf734d..771d60bc8d71 100644
--- a/drivers/i2c/busses/i2c-cpm.c
+++ b/drivers/i2c/busses/i2c-cpm.c
@@ -658,7 +658,7 @@ static int cpm_i2c_probe(struct platform_device *ofdev)
 	/* register new adapter to i2c module... */
 
 	data = of_get_property(ofdev->dev.of_node, "linux,i2c-index", &len);
-	cpm->adap.nr = (data && len == 4) ? be32_to_cpup(data) : -1;
+	cpm->adap.nr = (data && len == 4) ? *data : -1;
 	result = i2c_add_numbered_adapter(&cpm->adap);
 
 	if (result < 0)
-- 
2.41.0

