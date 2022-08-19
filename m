Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E2B59A627
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Aug 2022 21:17:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M8WjY0jT7z3ccy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Aug 2022 05:17:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=g/yIDSq5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=g/yIDSq5;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M8Whx2JDRz2xJJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Aug 2022 05:17:05 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 85DD961520;
	Fri, 19 Aug 2022 19:17:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8006C433B5;
	Fri, 19 Aug 2022 19:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660936622;
	bh=RoXrwfU/s5vurCwlxvo8Vd+Lw1JXCW4diLyk4VZ6JDI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g/yIDSq5tz/8o9kUNSGR2WjXk99zL+giUdFlfKqysPvpQHpMEpSV4s+340Igg9BCU
	 Pyn24U/6pa4/MiLG4JKW5a0SVYG+x10i+8RBJLh27uC5b9BNjYC/VOrTjItYfycV5I
	 sQS+TZbnbNe8WB2OQBesyRZjgho1h3+ZzVa6QBu+qHLqYP+MA6Yhq3aPgdxNADh8HV
	 3GijZPFm7+cDyjbdBSzbJ4QNll2FugdmTyiS22WvplaPh4nZlj5p1o7neZl/6XAilY
	 QKtIETbODj6FHDXQolqp8v/R0qX6aGiRJMr78uDjn9l11cHqu7bLQUxqxcGR3wncI6
	 yO2X6nIqOhlag==
Received: by pali.im (Postfix)
	id C66E82980; Fri, 19 Aug 2022 21:16:58 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Scott Wood <oss@buserror.net>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Sinan Akman <sinan@writeme.com>
Subject: [PATCH 2/7] powerpc/85xx: Mark mpc85xx_ds_pic_init() as static
Date: Fri, 19 Aug 2022 21:15:52 +0200
Message-Id: <20220819191557.28116-3-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220819191557.28116-1-pali@kernel.org>
References: <20220819191557.28116-1-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Function mpc85xx_ds_pic_init() is not used out of the mpc85xx_ds.c file.

Signed-off-by: Pali Rohár <pali@kernel.org>
---
 arch/powerpc/platforms/85xx/mpc85xx_ds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/85xx/mpc85xx_ds.c b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
index f8d2c97f39bd..9a6d637ef54a 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_ds.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_ds.c
@@ -54,7 +54,7 @@ static void mpc85xx_8259_cascade(struct irq_desc *desc)
 }
 #endif	/* CONFIG_PPC_I8259 */
 
-void __init mpc85xx_ds_pic_init(void)
+static void __init mpc85xx_ds_pic_init(void)
 {
 	struct mpic *mpic;
 #ifdef CONFIG_PPC_I8259
-- 
2.20.1

