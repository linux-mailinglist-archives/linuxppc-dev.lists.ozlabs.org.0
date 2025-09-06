Return-Path: <linuxppc-dev+bounces-11844-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D04B4779E
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Sep 2025 23:38:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cK64Q5WY2z3dBb;
	Sun,  7 Sep 2025 07:37:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757194630;
	cv=none; b=lJpV9PdSYTaTcpYBWvKj5daYW43OGe1XPIjINf4AvsLlJmx5RSFUSA2w6vorExNHRoFjShuTy4uL1eKgZ/Wo6zi36vncPNqzTyooOg+t38kpSq3aqAoMtx9+9SvHCY2QV6JSB/4/ncywqh8W2B1wjV5uZlcb+NUNcfXsWu8bQbseM3FncSxycalyDnb9EsDnls+JnkmsRiDnF4ybpe/DuIrk9PCuncN1z2sp9ZgRvFtXUXxQr66TAKNdE4vKXgGDxRCLKpLoxxFHDCCKk66bXyoVd40waTr+rPFZP/pZl7ezhTOgdseS7spF09nIdAGPMusIKCb0ITFOBk5dXg4c9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757194630; c=relaxed/relaxed;
	bh=orrZV8BgljpRok2XNuKDuddPobJ4kJErV/0v8tbU/Sg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U4GWwixT1VuGIn8fQSth3pfYY+8556lenVFQKCTtgZlMRkaJaSgC2nb3HlWp5yAtMCf/gBtc0N5+HXueMvL17px427q7YljcBt1dOXm4Z8P4OLp4wwpf2GeOR7G4+ZTRCYy72moIMi/P/tnr+LK1OURuJ/xzDS/A1orkgc4D1OSbQdopf+McoO4WgnvCHxTfLEqF2mxFzBAjM8gfrPsI09OWxegaAYxXjdj5lo0TcTvdAOmQuhC6aHFapF1HlUJn05Qo6d91px5J9C6Pqz9Knm3OQcSZ7B8YnHrhak5Wa4gTHIXStIF9GKxDVGtL4yPxc671jq1QKdM+S9Pwihmeew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eIjnKxH0; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eIjnKxH0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cK64P6tNTz3d96
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Sep 2025 07:37:09 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4796544A89;
	Sat,  6 Sep 2025 21:37:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79D6FC4CEE7;
	Sat,  6 Sep 2025 21:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757194628;
	bh=JTwVCxO7VQKt0pRSCgeHeHvmX5quhsNXXzZV2f26Bs0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eIjnKxH09OTN1s3TO5OkyZTYLxVqeC7VxU8nQKQBpGN/Fp3rPUrW0n+2bbZB8zzHO
	 AM3Jbi3sTFeW+TtxRT/DDlpUtp2nU3AsNxgqi3J9QOr95cH4ApNZisj4U8uyWcTX9J
	 oIUv1b9OFpCv+lF6lcDbX7MRLUeU9QQQf3jMAwVmuUuVNZ4nBBi2E9UrIgfPoWqKks
	 rp25asjGBdt0WoQPVjykGqKwMURs6fc94N8vFJE6fVqLvc6WjT4BBmwHtxgcDe8YcQ
	 6/frNrko95cghzRkUomIuPn5fGIpDZcwvymzk8m+EMawZ4vDT4WQb8PO0vmvXDURHL
	 twswbfGWpHfKw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Zhiqi Song <songzhiqi1@huawei.com>,
	Longfang Liu <liulongfang@huawei.com>,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 12/12] wireguard: kconfig: Simplify crypto kconfig selections
Date: Sat,  6 Sep 2025 14:35:23 -0700
Message-ID: <20250906213523.84915-13-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250906213523.84915-1-ebiggers@kernel.org>
References: <20250906213523.84915-1-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Simplify the kconfig entry for WIREGUARD:

- Drop the selections of the arch-optimized ChaCha20, Poly1305, BLAKE2s,
  and Curve25519 code.  These options no longer exist, as lib/crypto/
  now enables the arch-optimized code automatically.

- Drop the selection of CRYPTO.  This was needed only to make the
  arch-optimized options visible.  lib/crypto/ now handles these options
  internally, without any dependency on CRYPTO.

- Drop the dependency on !KMSAN.  This was needed only to avoid
  selecting arch-optimized code that isn't compatible with KMSAN.
  lib/crypto/ now handles the !KMSAN dependencies internally.

- Add a selection of CRYPTO_LIB_UTILS, since WireGuard directly calls
  crypto_memneq().  This gets selected indirectly by
  CRYPTO_LIB_CURVE25519 and CRYPTO_LIB_CHACHA20POLY1305 anyway, but it's
  best to make this dependency explicit.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 drivers/net/Kconfig | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/net/Kconfig b/drivers/net/Kconfig
index b29628d46be9b..ac12eaf11755d 100644
--- a/drivers/net/Kconfig
+++ b/drivers/net/Kconfig
@@ -74,28 +74,15 @@ config DUMMY
 
 config WIREGUARD
 	tristate "WireGuard secure network tunnel"
 	depends on NET && INET
 	depends on IPV6 || !IPV6
-	depends on !KMSAN # KMSAN doesn't support the crypto configs below
 	select NET_UDP_TUNNEL
 	select DST_CACHE
-	select CRYPTO
 	select CRYPTO_LIB_CURVE25519
 	select CRYPTO_LIB_CHACHA20POLY1305
-	select CRYPTO_CHACHA20_X86_64 if X86 && 64BIT
-	select CRYPTO_POLY1305_X86_64 if X86 && 64BIT
-	select CRYPTO_BLAKE2S_X86 if X86 && 64BIT
-	select CRYPTO_CURVE25519_X86 if X86 && 64BIT
-	select CRYPTO_CHACHA20_NEON if ARM || (ARM64 && KERNEL_MODE_NEON)
-	select CRYPTO_POLY1305_NEON if ARM64 && KERNEL_MODE_NEON
-	select CRYPTO_POLY1305_ARM if ARM
-	select CRYPTO_BLAKE2S_ARM if ARM
-	select CRYPTO_CURVE25519_NEON if ARM && KERNEL_MODE_NEON
-	select CRYPTO_CHACHA_MIPS if CPU_MIPS32_R2
-	select CRYPTO_POLY1305_MIPS if MIPS
-	select CRYPTO_CHACHA_S390 if S390
+	select CRYPTO_LIB_UTILS
 	help
 	  WireGuard is a secure, fast, and easy to use replacement for IPSec
 	  that uses modern cryptography and clever networking tricks. It's
 	  designed to be fairly general purpose and abstract enough to fit most
 	  use cases, while at the same time remaining extremely simple to
-- 
2.50.1


