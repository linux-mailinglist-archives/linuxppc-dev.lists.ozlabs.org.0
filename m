Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1197FD7D3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 14:21:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=jP+FQJcU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SgKhy2Xrwz3dSf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 00:21:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=jP+FQJcU;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SgKg859rbz3cWs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Nov 2023 00:19:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1701263988;
	bh=pPH9vlEbtDSzlhunReOlH3NqC609B+YljB8JndroG/M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jP+FQJcUTrLqzHuz3w33YFCrrQ9tO27NPcCrt2Fmq7SKA3c6IZuFgUfEZT0hZBRrg
	 urGdkDXWWJFaictxb4Jpmy8jw9XStPmk+uJIBlls+G5MgAFxsbXI8Nvh/RvICpG7M+
	 D0/8WaS+3XD057S8iUthXXo/jZFtopwkQ0+aeeQshA55m/6so8fa4C9gXYi+17F+k4
	 H+mLr7rgaijahtORkA+bPR0/rKStIZ5tqnDjwmbj75xiZbXVV2uRuEmb01WtE0a01r
	 GxzH9aZR632DGcCei9OoidHLHx1LNkki7w350CDb2D69XU+NRA9CWQm0T3fQX6/jbL
	 BtLJduBSJ+BnQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SgKg83tHYz4wcM;
	Thu, 30 Nov 2023 00:19:48 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 2/5] powerpc/512x:  Make pdm360ng_init() static
Date: Thu, 30 Nov 2023 00:19:16 +1100
Message-ID: <20231129131919.2528517-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231129131919.2528517-1-mpe@ellerman.id.au>
References: <20231129131919.2528517-1-mpe@ellerman.id.au>
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
Cc: arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The mpc512x_defconfig config fails with:

  arch/powerpc/platforms/512x/pdm360ng.c:104:13: error: no previous prototype for ‘pdm360ng_init’ [-Werror=missing-prototypes]
  104 | void __init pdm360ng_init(void)
      |             ^~~~~~~~~~~~~

Fix it by making pdm360ng_init() static.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/512x/pdm360ng.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/512x/pdm360ng.c b/arch/powerpc/platforms/512x/pdm360ng.c
index ce51cfeeb066..8bbbf78bb42b 100644
--- a/arch/powerpc/platforms/512x/pdm360ng.c
+++ b/arch/powerpc/platforms/512x/pdm360ng.c
@@ -101,7 +101,7 @@ static inline void __init pdm360ng_touchscreen_init(void)
 }
 #endif /* CONFIG_TOUCHSCREEN_ADS7846 */
 
-void __init pdm360ng_init(void)
+static void __init pdm360ng_init(void)
 {
 	mpc512x_init();
 	pdm360ng_touchscreen_init();
-- 
2.41.0

