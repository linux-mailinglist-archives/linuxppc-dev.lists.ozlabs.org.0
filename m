Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB1965B6F6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Jan 2023 20:42:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nm5q51Fgfz3c8J
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Jan 2023 06:42:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=merlin.20170209 header.b=sYEH6nmD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1234::107; helo=merlin.infradead.org; envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=merlin.20170209 header.b=sYEH6nmD;
	dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1234::107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nm5p50X36z2yfq
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Jan 2023 06:41:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=merlin.20170209; h=Date:Cc:To:Subject:From:References:
	In-Reply-To:Message-Id:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=erLhvbjz3HFkIyprrRlitxim1PgUSIS9Xt2ZbuYYmIA=; b=sYEH6nmDJ1qlOk3Fv9wrdImp9j
	/SkBO2s6J9EZgZLgDEcyryLhVrWVZ69gg/4wjXNZ5v0HbdFOkRQV52n4rdWKCARJse9kiSbGdRBKp
	TGEebJlC9/qxLIMWaLcjnpQCSUuAG/FTK8txd/32qaTGS7YFxuwbCdG0xrfOSC7pp5DuuBG/zAu1j
	HwbxoaqbZDl8bTR18bYEV6U9nvI4Wnz4pvbJF0k9bYUk7mxWT+vsr1F5Pj2uRxRgJzlv2qGeExkpV
	o7Tw9V1YWXmvh3uJjSDz6GJksaqSnpV6fxBaebdkiV7te5XaK9SOrQNFxXN0eSM35UgLyG/0yC/uK
	EQ+Imj0Q==;
Received: from geoff by merlin.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCQgE-007Ra6-Te; Mon, 02 Jan 2023 19:41:06 +0000
Message-Id: <f3d97d9426eeda9ee16a0ee6f325fc02fa3a2c57.1672687924.git.geoff@infradead.org>
In-Reply-To: <cover.1672687924.git.geoff@infradead.org>
References: <cover.1672687924.git.geoff@infradead.org>
From: Geoff Levand <geoff@infradead.org>
Patch-Date: Mon, 2 Jan 2023 11:24:20 -0800
Subject: [PATCH v1 1/3] powerpc: Fix processing of CONFIG_CMDLINE
To: Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 02 Jan 2023 19:41:06 +0000
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
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>, linuxppc-dev@lists.ozlabs.org, Rob Herring <robh@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit a7d550f82b445cf218b47a2c1a9c56e97ecb8c7a (of: fdt: Honor CONFIG_CMDLINE*
even without /chosen node) moved the processing of the kernel built-in command
line (CONFIG_CMDLINE) from the early_init_dt_scan_chosen routine to the
early_init_dt_scan_nodes routine.

The current powerpc startup code does not call into early_init_dt_scan_nodes, so
processing of CONFIG_CMDLINE never happens, even if CONFIG_CMDLINE_FORCE=y.
The result is an empty kernel command line, and mounting of the root file system
then fails with a kernel panic (not syncing: VFS: Unable to mount root fs).

The early_init_dt_scan routine calls into early_init_dt_verify and then
early_init_dt_scan_nodes.  The powerpc startup routine early_init_devtree
currently has a call to early_init_dt_verify.  This change replaces that
early_init_dt_verify call to a call to early_init_dt_scan.

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 arch/powerpc/kernel/prom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 4f1c920aa13e..82c9cd3bdbec 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -761,7 +761,7 @@ void __init early_init_devtree(void *params)
 	DBG(" -> early_init_devtree(%px)\n", params);
 
 	/* Too early to BUG_ON(), do it by hand */
-	if (!early_init_dt_verify(params))
+	if (!early_init_dt_scan(params))
 		panic("BUG: Failed verifying flat device tree, bad version?");
 
 	of_scan_flat_dt(early_init_dt_scan_model, NULL);
-- 
2.34.1


