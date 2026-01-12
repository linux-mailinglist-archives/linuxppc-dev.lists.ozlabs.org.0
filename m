Return-Path: <linuxppc-dev+bounces-15562-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C37D14EEC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 20:24:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqj37193dz2yrt;
	Tue, 13 Jan 2026 06:23:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768245811;
	cv=none; b=hhUF/KerWStkjqCkdBN9HMIHQJnEI5IM5eGR3M5pF5itaysnkp2mJVnrHYSbYVScKy65J7A1zBftpSMoJseM6vOS2UOQZA2ltBa24+ZAa0ukMMNW7lIf+mogQwXyR/ZbXDl3VhAr2RCHAFPf/LLG1/SgzL89bxLgtOr7JjAeLGNCTbxZSEF972Eqn01fJEHi8gpFcn2tt/84sWv5GEWXNIVyY9PZ6Ww4OuFUssJr52xUd70AMkx1jWHrY0XqK1r+FkDy0LRd/Q3UMR0zM9+a0ukrC+Pld4U4oHC39Ur8y4iG6xSbBJTnfGpdq50bbwG1UycCjCPsOPm1NhE/1rJK2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768245811; c=relaxed/relaxed;
	bh=JVQL6ZoUXD09sqmGPMGT50jNWhGdmOWnGCBFfUSlZAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wm+ACOiguQHI7bTdbqJFTTYZi5al2zag4hW2N28mHGmN9MlJXgksv+1G0r3agVa3uhHfmEBkxXaI/fehlqVDk8lIptkjltcLIUoyL7na5rccLV/+q6pdy5y7UJRZmYZulediUmwfLt17O8d/m9lnRfjWsOm5928vc2ba7QkBPvdLvZCCcVOl5MVlW1Q5WEHk1lOU4zKd3kDkF58dH14LflX9fHFMnRn9ciGHIzHp7/l3oMgCY2qhB/IVl8xxTIb8RarD+hKMUhzO8hUWpVYhu50ZVVD7fawBmy/XHbbn7cuZ20kLFZqj8JKbN48gsfPNdbMnVeRvkC+/UcVtRwRMvw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T1GvvbAZ; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T1GvvbAZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqj363cWzz2yft
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 06:23:30 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ACED5600BB;
	Mon, 12 Jan 2026 19:23:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01984C116D0;
	Mon, 12 Jan 2026 19:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768245808;
	bh=/+92A2W8sPhnyqgSvgeYDPLSqRQhqBCuSe5uLYbIIyo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T1GvvbAZd1QxRXqOx3RVwEnT8L6/7in7jYWOmXPjC5hvhKjvhv+Wzfs5/LUMHR8Lc
	 SdGTbOSLXj/2W/iKIhh/AT5PZwYWYZ1BOouRjUMUk2hghvgAR6+JvM8kF0KbCUU7yp
	 puzPO54NzZ3xe7XfNGWN6VWmD3ZkQ+dVaqDcSY/FoA3F/XNqeh1rnjNcSxjRjbPA7/
	 gqecjM8PRPEN29c60wRVNKJHik18bwbo1WjAwXvniH+AS9JnoM0gcQ2DNi5blIsfxI
	 UYBfP/Us7YHO8J9QoEFy1ANvrLWZNZs147dSPjGhBOGui77MkyOPGu0k7NMYzgIM2A
	 bXI6EI75/O3bQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Holger Dengler <dengler@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 19/35] Bluetooth: SMP: Use new AES library API
Date: Mon, 12 Jan 2026 11:20:17 -0800
Message-ID: <20260112192035.10427-20-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112192035.10427-1-ebiggers@kernel.org>
References: <20260112192035.10427-1-ebiggers@kernel.org>
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

Switch from the old AES library functions (which use struct
crypto_aes_ctx) to the new ones (which use struct aes_enckey).  This
eliminates the unnecessary computation and caching of the decryption
round keys.  The new AES en/decryption functions are also much faster
and use AES instructions when supported by the CPU.

Note that in addition to the change in the key preparation function and
the key struct type itself, the change in the type of the key struct
results in aes_encrypt() (which is temporarily a type-generic macro)
calling the new encryption function rather than the old one.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 net/bluetooth/smp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/net/bluetooth/smp.c b/net/bluetooth/smp.c
index 3a1ce04a7a53..bf61e8841535 100644
--- a/net/bluetooth/smp.c
+++ b/net/bluetooth/smp.c
@@ -372,36 +372,36 @@ static int smp_h7(struct crypto_shash *tfm_cmac, const u8 w[16],
  * s1 and ah.
  */
 
 static int smp_e(const u8 *k, u8 *r)
 {
-	struct crypto_aes_ctx ctx;
+	struct aes_enckey aes;
 	uint8_t tmp[16], data[16];
 	int err;
 
 	SMP_DBG("k %16phN r %16phN", k, r);
 
 	/* The most significant octet of key corresponds to k[0] */
 	swap_buf(k, tmp, 16);
 
-	err = aes_expandkey(&ctx, tmp, 16);
+	err = aes_prepareenckey(&aes, tmp, 16);
 	if (err) {
 		BT_ERR("cipher setkey failed: %d", err);
 		return err;
 	}
 
 	/* Most significant octet of plaintextData corresponds to data[0] */
 	swap_buf(r, data, 16);
 
-	aes_encrypt(&ctx, data, data);
+	aes_encrypt(&aes, data, data);
 
 	/* Most significant octet of encryptedData corresponds to data[0] */
 	swap_buf(data, r, 16);
 
 	SMP_DBG("r %16phN", r);
 
-	memzero_explicit(&ctx, sizeof(ctx));
+	memzero_explicit(&aes, sizeof(aes));
 	return err;
 }
 
 static int smp_c1(const u8 k[16],
 		  const u8 r[16], const u8 preq[7], const u8 pres[7], u8 _iat,
-- 
2.52.0


