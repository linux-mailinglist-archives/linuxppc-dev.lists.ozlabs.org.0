Return-Path: <linuxppc-dev+bounces-5654-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6E2A214A5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2025 23:58:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjLKd3F8tz302P;
	Wed, 29 Jan 2025 09:57:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738105077;
	cv=none; b=TVMNYX2d7CcsGQzLzFS/vOyy3ZmjE9IRkOliDOx/iGVcdNvXjrUR7Nnm9aIjExjIKjLhGZsPLrh2e9zUo8oibQtQ2B9mZSwoz2wCtk6kiaqqrn5baT9eXbWpYxkRFavKwK6WUewSOSkbpfVpIJXtSW1CD0dei+aDF1m7XsleiBFEJ2pykuOQb49lEoa3DlSbtD+4WIVj9kvgyQRiP5hKapYCwNrrM7lFaPX7zhu1o+YBD0apFNFBQiOTDJN07pzlgPB9uGc1w1+oyKiF4a9zcZtkzDqkMOtiIYWD5MbaJpqWOyVnfgC7t3i1w320YpD345hgOTFduRZLNTBWkMwrqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738105077; c=relaxed/relaxed;
	bh=OuCkhBjWr9MTbfpWKD5NGYxHAOlVrjks5zt6sl1tJ48=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L3yvaKoPqHmZudAbo0rK78eIXbW77s2lg4lvVLxnK4xGdnG7VsyI634FkuXOwcGW65k9/TVf3H/lTuAsp/JvPo661NOwS093SKYB2U6Wib22ZHF03FX4qUskJBuI85BR3LkfP0bfbVlhBJ2+flQO0K9TYdymyd+Xz/g6DQNvqHFqUzjJSwbbskXIcbUx3+d4bgdRXwZ+pwahCjQjgQLAquENiHTd+u8S25e/IbDGMN07z4vdrBjkF2KcfFt+np87UCz1Rj9pF4sQymbE/NWTZh+Wp506qbNftI8pB081cVdhQmuYhgD17/t4zQr9IlGZAG/I0s3VIiuPC3Fk2EknGQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=wDA/Gn3j; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=wDA/Gn3j;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjLKc0wl6z2yNt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 09:57:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1738105067;
	bh=OuCkhBjWr9MTbfpWKD5NGYxHAOlVrjks5zt6sl1tJ48=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=wDA/Gn3jk8C/R6IB2r5G+VlwB3RfPU0WGE/VkHe3qaoCi+Bd/mrGwqM0PT1ZEj4sd
	 Kr+ruMr04PdiRerzrN53rVVDmjzjsEsWa0gHvvzgzYLOca7sdKB1YFLxR4U1nZyg5c
	 jmZsfN+XWcTYzuzEn57eCw6QJSjxSeYQRAiJWqRKoRm4Sf94IhgL6sC67qRWqzrPMN
	 t3m+P3i82FS04t+OvxApf4IvxBrXjUY3Cg34Z+0XN5J5RzvflLPvBeL7P2yirEhgjs
	 TqbeHUniH0XHszqdLJ3tCs59xxKmWgNr5VVMMvHznPFZ+eCdU1T4UsO5ENWG6yuWtr
	 13mfmiiR7zQ1Q==
Received: by gandalf.ozlabs.org (Postfix, from userid 1003)
	id 4YjLKR2hCQz4x0t; Wed, 29 Jan 2025 09:57:47 +1100 (AEDT)
Date: Wed, 29 Jan 2025 09:51:00 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/5] powerpc/microwatt: Select COMMON_CLK in order to get the
 clock framework
Message-ID: <Z5lfVEMJL5oZOxKo@thinks.paulus.ozlabs.org>
References: <Z5lfDb8wsLlmSLBZ@thinks.paulus.ozlabs.org>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5lfDb8wsLlmSLBZ@thinks.paulus.ozlabs.org>
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This is to allow us to select Litex MMC host controller driver, which
drives the litesdcard gateware.

Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
---
 arch/powerpc/platforms/microwatt/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/microwatt/Kconfig b/arch/powerpc/platforms/microwatt/Kconfig
index 6af443a1db99..5e41adadac1f 100644
--- a/arch/powerpc/platforms/microwatt/Kconfig
+++ b/arch/powerpc/platforms/microwatt/Kconfig
@@ -6,6 +6,7 @@ config PPC_MICROWATT
 	select PPC_ICS_NATIVE
 	select PPC_ICP_NATIVE
 	select PPC_UDBG_16550
+	select COMMON_CLK
 	help
           This option enables support for FPGA-based Microwatt implementations.
 
-- 
2.47.1


