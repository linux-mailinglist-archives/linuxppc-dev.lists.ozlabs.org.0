Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6848D804FB2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 11:02:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Skx0w5ln1z3cb6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 21:02:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kylinos.cn (client-ip=124.126.103.232; helo=mailgw.kylinos.cn; envelope-from=jiangyunshui@kylinos.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 303 seconds by postgrey-1.37 at boromir; Tue, 05 Dec 2023 20:48:36 AEDT
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Skwhh5NFNz30P0
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Dec 2023 20:48:35 +1100 (AEDT)
X-UUID: 64f505a4db7141c0a6d465b761461b95-20231205
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:c0112fa9-5964-4834-addf-2aecd59a9892,IP:5,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:0
X-CID-INFO: VERSION:1.1.33,REQID:c0112fa9-5964-4834-addf-2aecd59a9892,IP:5,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:37412b96-10ce-4e4b-85c2-c9b5229ff92b,B
	ulkID:231205174325O72Y67N5,BulkQuantity:0,Recheck:0,SF:19|44|66|38|24|72|1
	02,TC:nil,Content:0,EDM:-3,IP:-2,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: 64f505a4db7141c0a6d465b761461b95-20231205
X-User: jiangyunshui@kylinos.cn
Received: from localhost.localdomain [(112.64.161.44)] by mailgw
	(envelope-from <jiangyunshui@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 2082040622; Tue, 05 Dec 2023 17:43:24 +0800
From: jiangyunshui <jiangyunshui@kylinos.cn>
To: linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] ocxl: fix driver function comment typo
Date: Tue,  5 Dec 2023 17:43:19 +0800
Message-Id: <20231205094319.32114-1-jiangyunshui@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 05 Dec 2023 21:01:31 +1100
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
Cc: fbarrat@linux.ibm.com, k2ci <kernel-bot@kylinos.cn>, ajd@linux.ibm.com, jiangyunshui <jiangyunshui@kylinos.cn>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Reported-by: k2ci <kernel-bot@kylinos.cn>
Signed-off-by: yunshui <jiangyunshui@kylinos.cn>
---
 include/misc/ocxl.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/misc/ocxl.h b/include/misc/ocxl.h
index 3ed736da02c8..ef7d26009a36 100644
--- a/include/misc/ocxl.h
+++ b/include/misc/ocxl.h
@@ -324,7 +324,7 @@ int ocxl_global_mmio_clear32(struct ocxl_afu *afu, size_t offset,
 int ocxl_global_mmio_clear64(struct ocxl_afu *afu, size_t offset,
 			     enum ocxl_endian endian, u64 mask);
 
-// Functions left here are for compatibility with the cxlflash driver
+// Functions left here are for compatibility with the ocxlflash driver
 
 /*
  * Read the configuration space of a function for the AFU specified by
-- 
2.25.1

