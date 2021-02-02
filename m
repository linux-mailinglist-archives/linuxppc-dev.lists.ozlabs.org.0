Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8F430B5C4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Feb 2021 04:22:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DV99m53qdzDr27
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Feb 2021 14:22:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.44;
 helo=out30-44.freemail.mail.aliyun.com;
 envelope-from=yang.lee@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-44.freemail.mail.aliyun.com
 (out30-44.freemail.mail.aliyun.com [115.124.30.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DV93x64FqzDqx6
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 14:17:48 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04420; MF=yang.lee@linux.alibaba.com;
 NM=1; PH=DS; RN=9; SR=0; TI=SMTPD_---0UNdkwIN_1612235852; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0UNdkwIN_1612235852) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 02 Feb 2021 11:17:32 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: herbert@gondor.apana.org.au
Subject: [PATCH] crypto: powerpc: remove unneeded semicolon
Date: Tue,  2 Feb 2021 11:17:30 +0800
Message-Id: <1612235850-87446-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
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
Cc: linux-kernel@vger.kernel.org, paulus@samba.org,
 linux-crypto@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Eliminate the following coccicheck warning:
./arch/powerpc/crypto/sha256-spe-glue.c:132:2-3: Unneeded
semicolon

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 arch/powerpc/crypto/sha256-spe-glue.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/crypto/sha256-spe-glue.c b/arch/powerpc/crypto/sha256-spe-glue.c
index a6e650a..ffedea7 100644
--- a/arch/powerpc/crypto/sha256-spe-glue.c
+++ b/arch/powerpc/crypto/sha256-spe-glue.c
@@ -129,7 +129,7 @@ static int ppc_spe_sha256_update(struct shash_desc *desc, const u8 *data,
 
 		src += bytes;
 		len -= bytes;
-	};
+	}
 
 	memcpy((char *)sctx->buf, src, len);
 	return 0;
-- 
1.8.3.1

