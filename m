Return-Path: <linuxppc-dev+bounces-4313-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8899F6431
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2024 11:58:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCrFJ3VP8z30Wg;
	Wed, 18 Dec 2024 21:55:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734519348;
	cv=none; b=Ns3nuYlmfyTcZ3xOfzT8Aqjh3t5FF6ZaMg/+C+/ATPFsI0QqjulgM74lreKa7WP4PP9oJkKcn+Ex0+HCIoZrtWhAcWZ5y1gJlN9TErozdO1Q5qxJUUhpU4ZiLD8MMjgDGVYr1zaV0No3REIBv9DS7wB5AS4fUrJ5S6Jq0DZ1QA42gkNsrvDoAUFcJ8Q6bLt6M0SWzYZ2FoiGAZqdUbFRBvUU4MLnFbPmuRI1wfPbWvkg/y6ysCflVIsgILyYWi0RxMdmeg8LObipcl0EWCuSW9N3HIaWRH7dRWtgI691s2VFY8v10ajW6UBaBtcwnV9fVA6a6vrk4PB28RnpqiqYJA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734519348; c=relaxed/relaxed;
	bh=x2T0i0fMAP+syHBsxpReRreQwOUGgQx/r6av0OknGag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tm9uXDU2zGsfoqSL8+yB+kWl9y3M/yyMTtAHnM+YfhS16dQasFvx52cSvDmVDKsf2zXpYMw6VBbKvqkjvJiT9zpSONkyJ9vD27XOXRqkq320IRQAKdrZ8w/U9En4jEo82tNkh1QmwejajcJrhpDsQGmqx3v8VQ8C/s++unpxWxuEixI9KxE9WgUP6gWcrGB1DhXxMSQVLmRTeywtLSon/TeTTTb7Ydp//MbQuurP0+gYDKdiM78wnS2B76npeGn4+zaaCWZcko12QCu/BIDRXwr5aL6wkOe0IEx+E7puR8KE9SisgoSBOQHjIF+NBacg/Z61/uYpf9vP6Rz8ChDBuw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=WYtlsU6r; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=WYtlsU6r;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCrFG08Thz30fh
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Dec 2024 21:55:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1734519338;
	bh=x2T0i0fMAP+syHBsxpReRreQwOUGgQx/r6av0OknGag=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WYtlsU6rrHaH/FMTfEbB3PpEjneHZ99JBI76qhq0ND7aYlSsxIu6+Ri1/oQRPQoM3
	 2F1R+RR2uPZOffBrSk85pKZ6VMy8Fd2VwL/ihYeNoD+fT1tl5NwyET9scVYEO9mbA8
	 6xQRTGp5TQTawgCh9MXnrp5sBbj1qasP+ZiIlu3g40Dyi9yFkuhXYnRnd4V7zCQBEB
	 I5ghPgLxXEF/wFXHnwIX3QGObA+rMNl7Ja1tGBpXJmL6IW4udSmebzhyc72AMXBtpJ
	 7iTNrs6nCI/9Yxuz6a25QZEKNJ9fEJEtrgnPALQiSfyqXVTrddAeUQppzI3MK8M+fn
	 GlLNZ/zZXnz1A==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4YCrF623RFz4xfj;
	Wed, 18 Dec 2024 21:55:38 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <arnd@arndb.de>,
	<jk@ozlabs.org>,
	<segher@kernel.crashing.org>,
	netdev@vger.kernel.org
Subject: [PATCH v2 25/25] net: toshiba: Remove reference to PPC_IBM_CELL_BLADE
Date: Wed, 18 Dec 2024 21:55:13 +1100
Message-ID: <20241218105523.416573-25-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218105523.416573-1-mpe@ellerman.id.au>
References: <20241218105523.416573-1-mpe@ellerman.id.au>
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
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Remove a reference to PPC_IBM_CELL_BLADE which has been removed.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
v2: Unchanged.

Cc: netdev@vger.kernel.org

 drivers/net/ethernet/toshiba/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/toshiba/Kconfig b/drivers/net/ethernet/toshiba/Kconfig
index 2b1081598284..b1e27e3b99eb 100644
--- a/drivers/net/ethernet/toshiba/Kconfig
+++ b/drivers/net/ethernet/toshiba/Kconfig
@@ -6,7 +6,7 @@
 config NET_VENDOR_TOSHIBA
 	bool "Toshiba devices"
 	default y
-	depends on PCI && (PPC_IBM_CELL_BLADE || MIPS) || PPC_PS3
+	depends on PCI && MIPS || PPC_PS3
 	help
 	  If you have a network (Ethernet) card belonging to this class, say Y.
 
-- 
2.47.1


