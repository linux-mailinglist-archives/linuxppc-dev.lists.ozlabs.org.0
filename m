Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4C72717D8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Sep 2020 22:28:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BvfJy5XZtzDqlw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Sep 2020 06:28:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=krzk@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=vVR7pUBw; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BvfHG6JxKzDqgb
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Sep 2020 06:26:34 +1000 (AEST)
Received: from localhost.localdomain (unknown [194.230.155.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 34E9820795;
 Sun, 20 Sep 2020 20:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600633592;
 bh=1JV3U23S6iZWo8OyR5/6orDz5B/HTrg7u+h7fk4d768=;
 h=From:To:Cc:Subject:Date:From;
 b=vVR7pUBwadaWytc2eZco2+SI+iPTDuCKlO1vZSpr/8fTQOG4LdvdM9ZCx5Ln+/3tV
 gXlwDb7IZiYOuSaFOiaMtzriIHOBzlkFc9IA/NAy0XE+sd1Q7TWhmGsH7ejmUSqtTR
 daa/9GqU08lnb9I7v703avdtxdZsUWHyq2XvorJU=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Li Yang <leoyang.li@nxp.com>, Roy Pledge <roy.pledge@nxp.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] soc: fsl: qbman: Fix return value on success
Date: Sun, 20 Sep 2020 22:26:25 +0200
Message-Id: <20200920202625.11377-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On error the function was meant to return -ERRNO.  This also fixes
compile warning:

  drivers/soc/fsl/qbman/bman.c:640:6: warning: variable 'err' set but not used [-Wunused-but-set-variable]

Fixes: 0505d00c8dba ("soc/fsl/qbman: Cleanup buffer pools if BMan was initialized prior to bootup")
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/soc/fsl/qbman/bman.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/qbman/bman.c b/drivers/soc/fsl/qbman/bman.c
index f4fb527d8301..c5dd026fe889 100644
--- a/drivers/soc/fsl/qbman/bman.c
+++ b/drivers/soc/fsl/qbman/bman.c
@@ -660,7 +660,7 @@ int bm_shutdown_pool(u32 bpid)
 	}
 done:
 	put_affine_portal();
-	return 0;
+	return err;
 }
 
 struct gen_pool *bm_bpalloc;
-- 
2.17.1

