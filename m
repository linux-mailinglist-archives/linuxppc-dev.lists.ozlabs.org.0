Return-Path: <linuxppc-dev+bounces-3115-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF259C56EA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2024 12:48:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xnl6P29qyz2yM6;
	Tue, 12 Nov 2024 22:48:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731412093;
	cv=none; b=FaDRpas9AWbiWzT5OwoI/YBZdyZLklW4YoW/NKhRu/mFmvwOytLL2oGKEBgJufHYu8cZgNl38XeM6zzVQMtGstKM19hyUzPr1RbKitGx1KjFQTqwVO2sK27gYfMzFRoQ/bM/nRFtfleztFdlfdylUacwjMIGs2QxrerLrFFe6nvSy3xFeNypnmiQnva+dqq+XdZh62BQLMPrk3A1DInZRzFZxz3EF/TVZAX7WZzemyrVkAj0c5wZ/6mvHqW8IOsxsGZfqhBVcsrYd0wzLsBockGqlJRZNs/SbuMoBapgrUCF0O89g+RvCzvEbg2q5rxqCh+p/9Ar25FwT0am2kgPqg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731412093; c=relaxed/relaxed;
	bh=H/I12E3oHwaQBbC7umKqatYy5HYeLsllivqH+iXpE0U=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=UxTwzgPKYpBxGNeRMdLENFdkgfNfOHvNEDvZ3Xv3gc44XCk+WDGWSLc0WEd/jJypP0BeXX2RaxFEOC9Gh7faamKcC6nAg8VFIokJqwNDRVX6DwF0peRaAfxFavS4wRY3nkYS8s4f0p8nk0ZsxHFEh9JsCBcorso1UbHAqcFKu6mKchmwX+x8TzLU2NqoAtKFDV2X/gaVw34kASCkshpXUIr6oloDijasUOUxLn6iuK6jSPjGVZGrVZpemilDXgwfClOOlWgAAMlg3kfT9Xznl1zCW2/rSdKfmUSCWnKj0bY1r0OmX3MaZ13MOOITOssNHmIZ64ysmtz5WJfDUH1w3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nIZ3pxGZ; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nIZ3pxGZ;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xnl6M1fxWz2xQD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2024 22:48:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731412088;
	bh=H/I12E3oHwaQBbC7umKqatYy5HYeLsllivqH+iXpE0U=;
	h=From:To:Subject:Date:From;
	b=nIZ3pxGZ4zbpLVm04ybtq3e30GAEF7QOaAlQP/W7MlETNw7jmhYw03bRD47cx26jz
	 kJNvshGyWnrxsCXPATDqGtzsP1rLOsoHjqJLptT3L0bS7mVdE7kiNVXJELg6eNWPgG
	 2fHyloY/nwfMuYuLNpgipFBzL+oOOd+vO6J8NmPEUYAIi7X7XgSnWypFyerD1QUE2a
	 WJOkYyndP5fataYimORf4zjQaIBHLaSAETumSiBEGxDNOqBj4LxEkmntt0U0wBGJfo
	 DqHUUbpoSjTXmEyXH1azxXiESHy+D1mJhpCuptG0+Aout72o1obU/ZB4NZZTSiGXBT
	 s2ckcZ20rN5HQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xnl6J02GMz4wbr;
	Tue, 12 Nov 2024 22:48:07 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/cell: Remove dead extern declaration for spu_priv1_beat_ops
Date: Tue, 12 Nov 2024 22:48:05 +1100
Message-ID: <20241112114805.453894-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.47.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

spu_priv1_beat_ops were removed in commit bf4981a00636 ("powerpc: Remove
the celleb support"), remove the unneeded extern.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/spu_priv1.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/include/asm/spu_priv1.h b/arch/powerpc/include/asm/spu_priv1.h
index 2167d756e6d5..6fee411d973d 100644
--- a/arch/powerpc/include/asm/spu_priv1.h
+++ b/arch/powerpc/include/asm/spu_priv1.h
@@ -216,7 +216,6 @@ spu_disable_spu (struct spu_context *ctx)
  */
 
 extern const struct spu_priv1_ops spu_priv1_mmio_ops;
-extern const struct spu_priv1_ops spu_priv1_beat_ops;
 
 extern const struct spu_management_ops spu_management_of_ops;
 
-- 
2.47.0


