Return-Path: <linuxppc-dev+bounces-3643-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B509DF7E9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2024 02:11:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y1m0T42SBz2yyb;
	Mon,  2 Dec 2024 12:09:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733101785;
	cv=none; b=GteY3Uy6FNVBcJV7w4QvUOchqQgRVMYUYGen1Tb2Ku3jMuTEPeZdoA29IzrBxLVTVomZJVlRpa+KI5x04Bl4sS0mmUgxhdOO482pb3lSCzUi8+m+VkKhRJcqE8jwLo/LsaSM6g5u/rIv6UId39lKyR0TZ6dQZvKR5d3xx7a1GHQ309l0NAV9B3qGC60a9DsA2inJsWP3Pd/BzpUGY1g1YVISxaH/fpnCU+VTSw61EiD+vaifEe+Av+kNEpQ5gk8Vb12Hkx/yMIY+VrZM+DE77mkT2lGdlsia67ttVZwDRGmHYpv99ceLcyupmc3hXCTfFUgHm+D4IwB+4asKkdF4lA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733101785; c=relaxed/relaxed;
	bh=u4zKKihD/i6qJFYYj+uDjT4cXnxBWrrZolbSrdlui6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hFVPDr6wBD1StmagYCESoRLaELA+6EeBsBJwDp7UWhzQkn4MIb8fXgJYT7yRF2GtxOlb7pNl9sSK6W/g/yc43PRuyYSyKm6I2sa5zzUOuRPpyk2uxK0ABvOINsX2Dm6rj1vTjYdb8RjrwWvmRTmbBtGc85MHvd9Hl5bqccOXRR7nylGN2PH8f0/tFkQsNc3U7Az+W5X0E4RjkHOKxbc+Me/xEoeZyE7aBxhc1teuVWmefuGzCxk3AUJ7ce+ZqA/RMhOPnyP1W8rLodULS1I0K8bb6LuK3j2WHIGcwpUNgxtLoHX+zkM/jbXp2NZ21draf/+nM7R+LaqqHGYh30BRVw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VKU68uRv; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VKU68uRv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y1m0N3CTlz2yRd
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Dec 2024 12:09:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 00D88A40C18;
	Mon,  2 Dec 2024 01:07:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFA70C4CEDB;
	Mon,  2 Dec 2024 01:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733101777;
	bh=sAzD90I338AaM/8blk/uCSyjht7bgmdBUwOqBKuzNIc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VKU68uRvYLBaRovzroTHtIutPCgKC6QkWzoPlcXn8VLM2AALjN1tsYCrjDYauffPh
	 vV6r/DOWuGw63oGNuEpGfQeGp7R9lS7LFFszoCHGml3UntRKROIAqiRLuW7StNARAh
	 0Ci9DWmxpBAX6yOIkEhsEz/hYmPWznYUul/CrbWG5pymjMcUeQP7p/YkmMyjb5GzJK
	 39oZsqc7xqfpiGZ3M6uxZoPUSFSrArat5L/oUnvlg0O/o//5/6kQMa9L/3ikiS0It+
	 vQmd5gbRiBDmGq+W6WGs4X/oXNr4Sn9tEdFlgPqNpLYdtbNGTsCzwXVjggoYAnUbKy
	 F6ON4jIkYHO3Q==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [PATCH v4 14/19] bcachefs: Explicitly select CRYPTO from BCACHEFS_FS
Date: Sun,  1 Dec 2024 17:08:39 -0800
Message-ID: <20241202010844.144356-15-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241202010844.144356-1-ebiggers@kernel.org>
References: <20241202010844.144356-1-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,SUSPICIOUS_RECIPS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

Explicitly select CRYPTO from BCACHEFS_FS, so that this dependency of
CRYPTO_SHA256, CRYPTO_CHACHA20, and CRYPTO_POLY1305 (which are also
selected) is satisfied.  Currently this dependency is satisfied
indirectly via LIBCRC32C, but this is fragile and is planned to change
(https://lore.kernel.org/r/20241021002935.325878-13-ebiggers@kernel.org).

Acked-by: Kent Overstreet <kent.overstreet@linux.dev>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/bcachefs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/bcachefs/Kconfig b/fs/bcachefs/Kconfig
index ab6c95b895b3..971ea505e7b0 100644
--- a/fs/bcachefs/Kconfig
+++ b/fs/bcachefs/Kconfig
@@ -13,10 +13,11 @@ config BCACHEFS_FS
 	select LZ4HC_DECOMPRESS
 	select ZLIB_DEFLATE
 	select ZLIB_INFLATE
 	select ZSTD_COMPRESS
 	select ZSTD_DECOMPRESS
+	select CRYPTO
 	select CRYPTO_SHA256
 	select CRYPTO_CHACHA20
 	select CRYPTO_POLY1305
 	select KEYS
 	select RAID6_PQ
-- 
2.47.1


