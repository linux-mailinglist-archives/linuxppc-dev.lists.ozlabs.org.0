Return-Path: <linuxppc-dev+bounces-8559-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C7DAB6236
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 May 2025 07:19:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zy1qL0bxQz2yqk;
	Wed, 14 May 2025 15:19:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747199966;
	cv=none; b=FH8b5qHdxrttpt+Wf2E4sToSuun6mBz4mGmf4JFc3ZIZIqs7rLTjNWa2DABwcltaLHz/Q1tZHAYvWmB7O0AgG6ysQuNSo2utEUU+7qETsafGxJjBrKDOpCdk3+RTV1ecx/KSkm9wVVIEL7fDVjmYm92vjTK9tjrzaRF16TxGFzOgbHuj5NvX+I2zDLrOF/MibR3c/YWUeRGjO5yyDcz6Ha0rveUja/JFGVdDuZXjnvKJND4dqXwB2QByylNOeY5ed5dhswORwT2oTDf24KtVktPHZeGdIYXZ4UeLyGa8/kDvV/J4KBb7CTXWPfSI/OAXDe4KixtuUaYTXo4pPmm3lg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747199966; c=relaxed/relaxed;
	bh=0hoTD8e8xNTcWE3Y1FtjMw+yrHY7MuTeNsfC1G/0KA8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zo1Dgr8rgkrZBFY3DKv1hoSVps5b3It86TWdrCNtVwy+5AzZsxOo3QplTE5Pl09PQzfz/z+WOh5JgsBGaN7jkH9c6/KAHzukeWPisi0e+/yZ++yL1TQ1nWeM15XE9Ub/zX1ubG5+HcELb7JBsM582mR/fdyz0NiC6bSCOExlJQrw3RMv9uUnnesCQpB4dBUsDbZNAZwEYJsiWuBHK76o4Tvxd+Ym6sptZIRn06DVs6Z4wZJhBgHHHcKBJW4bfKFrWiPrwjAuOR4vHMHQy2vLDQ/cbAast6kp7Ajixd66Nxm+cI4Ajzqro8qqJGAU0x5wOhZv97XchKgfeGP+lodIjA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dEn/m2PK; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dEn/m2PK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zy1qK1s69z2ySg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 15:19:25 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 59BB2A4CADB;
	Wed, 14 May 2025 05:19:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A890FC4CEEB;
	Wed, 14 May 2025 05:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747199962;
	bh=xmNb52zrG4E27ByLWoVRVDykaFQ8CdtLS6iK9Dk3nV8=;
	h=From:To:Cc:Subject:Date:From;
	b=dEn/m2PKu0tjxDilPRowrR7HMf0oYqZe39uyPMbSUvqjkiVI3mIfiOAba5z35V6R7
	 q9rfm89UvZjqHoXTT2VKbF6LZzpabQJeObboHdsKFfxu3UGqhVxUmUzpi96w334kS+
	 dY2zcD10zKalVpMAfB4LWdqPksIuy+HJroF8eCKKcamuOtb4xkcY088r1/RjXu7vcf
	 gA6xSBxpMiPWLKUkVoYmgHBR4KwzSUyAPcH1qmpOTneyKjGzW8epFTbRaLi4R7NTp0
	 9iHiVJlmeaVwtvJBhTUmPoKhm5J4uVb2lLX3D5f6RcCz2VH4A+5LDXuSFrEmf21ucF
	 Nb6+Rgu+oWTkw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Danny Tsen <dtsen@linux.ibm.com>,
	Segher Boessenkool <segher@kernel.crashing.org>,
	stable@vger.kernel.org
Subject: [PATCH] crypto: powerpc/poly1305 - add depends on BROKEN for now
Date: Tue, 13 May 2025 22:18:47 -0700
Message-ID: <20250514051847.193996-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
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
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

As discussed in the thread containing
https://lore.kernel.org/linux-crypto/20250510053308.GB505731@sol/, the
Power10-optimized Poly1305 code is currently not safe to call in softirq
context.  Disable it for now.  It can be re-enabled once it is fixed.

Fixes: ba8f8624fde2 ("crypto: poly1305-p10 - Glue code for optmized Poly1305 implementation for ppc64le")
Cc: stable@vger.kernel.org
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/powerpc/lib/crypto/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/lib/crypto/Kconfig b/arch/powerpc/lib/crypto/Kconfig
index ffa541ad6d5da..3f9e1bbd9905b 100644
--- a/arch/powerpc/lib/crypto/Kconfig
+++ b/arch/powerpc/lib/crypto/Kconfig
@@ -8,10 +8,11 @@ config CRYPTO_CHACHA20_P10
 	select CRYPTO_ARCH_HAVE_LIB_CHACHA
 
 config CRYPTO_POLY1305_P10
 	tristate
 	depends on PPC64 && CPU_LITTLE_ENDIAN && VSX
+	depends on BROKEN # Needs to be fixed to work in softirq context
 	default CRYPTO_LIB_POLY1305
 	select CRYPTO_ARCH_HAVE_LIB_POLY1305
 	select CRYPTO_LIB_POLY1305_GENERIC
 
 config CRYPTO_SHA256_PPC_SPE

base-commit: 57999ed153ed7e651afecbabe0e998e75cf2d798
-- 
2.49.0


