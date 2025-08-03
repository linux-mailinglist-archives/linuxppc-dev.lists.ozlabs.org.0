Return-Path: <linuxppc-dev+bounces-10537-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DB3B19537
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 Aug 2025 22:45:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwBXb1dmXz2xnM;
	Mon,  4 Aug 2025 06:45:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754253935;
	cv=none; b=KHSUhOR49RNYTJZTOdmtbZSot8R4hbrHamdcZiL7JIenvzF+XH+5GkNIHHl5MB0guBiAOIWHv+3M/9grTnPFO7UEqUNFr8baKdA6Dmp9r0GPg9/o1KDBpqrHvnlJFHZlu1oN4e7i1cCIaeW7U/uf16ZfAWsy82gYNJtdSrv2NjbLAsjB6H9Ogi+36q7N6OrLf+Lo33dWagvYo/OlGOcotUoA2gt6qFJbPlND7S0/62I5EwTxQoNm2jqStCJqGoWZtwQIRRP0CEw4LKQcXdphsFzLiBfcjSbV4fYVEJoCD7FsLYwk8XnylIZdpEfyhivnT2m3qAQOol0OhVIyz3kEEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754253935; c=relaxed/relaxed;
	bh=KR8tJYulY2d08m4FZpEvsSmEV84go/5qVLMyGP7Jh+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lr2KDBRDC6fqcvRQa/Lwh22isil3zXK5ynqJzCAPFA7BZTb8aQpXPdxyKarfQ2QcskKqZWf3FXX9c6WC/cLj87XO/1t0C+uFUZ8pxwfufyySfVYSB4dhWGvfeGFdu1O+E2Jg7H6NksN5NmfIy57lCF3Qp9hAQyCaA27sZPVMu7Mjg6QpNcm64VDX0VKw3RS1NAq705thaGmzCUV1GjtTYOky3X+EzWRcKtjKYvK2pJjbuJ10hbWkkWk4uQtX+Z+V52BV5rXJqcIeH+fDolX/+XZsa40dZPn6DQ0vDjbPrrP/Zc9I4ONFlwfH/5OYP8lMvmpf0xgrJ8rIVIheMt+K2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N+KsnGpw; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N+KsnGpw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwBXZ0w2gz2xWc
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Aug 2025 06:45:33 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DB273A549BA;
	Sun,  3 Aug 2025 20:45:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E213FC4CEF8;
	Sun,  3 Aug 2025 20:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754253931;
	bh=VRc4KV6AcWRLoeXQnbyPvjrtyrIbJyC0ogU8BITtRHo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N+KsnGpwwuxsYDM6Sea4+60NJiUpAY1xBL7i4Ncuh9/IGMN+PP98T5E33HylbqP5x
	 ywCULf8wxqBHVYCyozXKT5KtiYKzTnv6N2133o0uDoVwjmQAZ0g7ISNmkU7ynDCy0u
	 Z3AbK/lF0H4tUAlfc/8/8EXgbifVXGEzY1sT7mFWbjeWMNlnFb/aIdS5hLN1Dqj2PB
	 SC/MQLHXzpVPseIOmW/BdQitYsHQbMCgpSg1DmhcS/w6aQ/UiRww15xIqbPCEC21Qt
	 auxAaPZr3YaHE+cATbrrESlpIvPJSquumBHOI/8luwN/6JuUf77351xY1YfZ/qoJEU
	 lsW4TtCEcyKYA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 2/7] mips: cavium-octeon: Move octeon-crypto.c into parent dir
Date: Sun,  3 Aug 2025 13:44:28 -0700
Message-ID: <20250803204433.75703-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803204433.75703-1-ebiggers@kernel.org>
References: <20250803204433.75703-1-ebiggers@kernel.org>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Since octeon-crypto.c is the only remaining source file in
arch/mips/cavium-octeon/crypto/, move it into its parent directory
arch/mips/cavium-octeon/.  Then remove the directory
arch/mips/cavium-octeon/crypto/, including its Makefile.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/mips/cavium-octeon/Makefile                     | 2 +-
 arch/mips/cavium-octeon/crypto/Makefile              | 6 ------
 arch/mips/cavium-octeon/{crypto => }/octeon-crypto.c | 0
 3 files changed, 1 insertion(+), 7 deletions(-)
 delete mode 100644 arch/mips/cavium-octeon/crypto/Makefile
 rename arch/mips/cavium-octeon/{crypto => }/octeon-crypto.c (100%)

diff --git a/arch/mips/cavium-octeon/Makefile b/arch/mips/cavium-octeon/Makefile
index 2a59265788413..ab84ede0cbe0e 100644
--- a/arch/mips/cavium-octeon/Makefile
+++ b/arch/mips/cavium-octeon/Makefile
@@ -9,12 +9,12 @@
 # Copyright (C) 2005-2009 Cavium Networks
 #
 
 obj-y := cpu.o setup.o octeon-platform.o octeon-irq.o csrc-octeon.o
 obj-y += dma-octeon.o
+obj-y += octeon-crypto.o
 obj-y += octeon-memcpy.o
 obj-y += executive/
-obj-y += crypto/
 
 obj-$(CONFIG_MTD)		      += flash_setup.o
 obj-$(CONFIG_SMP)		      += smp.o
 obj-$(CONFIG_OCTEON_ILM)	      += oct_ilm.o
diff --git a/arch/mips/cavium-octeon/crypto/Makefile b/arch/mips/cavium-octeon/crypto/Makefile
deleted file mode 100644
index b7d03e8a03187..0000000000000
--- a/arch/mips/cavium-octeon/crypto/Makefile
+++ /dev/null
@@ -1,6 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-#
-# OCTEON-specific crypto modules.
-#
-
-obj-y += octeon-crypto.o
diff --git a/arch/mips/cavium-octeon/crypto/octeon-crypto.c b/arch/mips/cavium-octeon/octeon-crypto.c
similarity index 100%
rename from arch/mips/cavium-octeon/crypto/octeon-crypto.c
rename to arch/mips/cavium-octeon/octeon-crypto.c
-- 
2.50.1


