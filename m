Return-Path: <linuxppc-dev+bounces-16867-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GJnHod/kmmTuQEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16867-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Feb 2026 03:23:03 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E24A1409FE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Feb 2026 03:23:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fDmlQ6Q2pz2ySS;
	Mon, 16 Feb 2026 13:22:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771208578;
	cv=none; b=df1jAK+k13reuPnl4SyyQHiUFa7xY1tSXXU7acvR/OOMlQpmHgIxFHnLTHWZgTzJU4X2ddeP3+9esi/20Lm1RXUVuW8Fpxsqf4TYlFJ/DLvzV6mRdeDLYC59aUB90u3JmZUNIivCSt3yjz/fWNtB3kRdgMOdxrNRP+zi77GXkY9LrCj/VPfF9+M6cAQQ811xAsD3w2Kd6R7cpak5t9J3Z71trqhjlHNUAj1crI3pqVU9PlBHYFvTIlfUgdL7T3473mam87VENrBh2D5UtLc/V9URM1NiX/oRtlL6KZkGCHXhV9xYhapRng6zlM2Ff5yE5Kfml7zf2aJNSw6uOYyX+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771208578; c=relaxed/relaxed;
	bh=q4DT/Ux0h5KNZF+hmPOlF9o2j6Ns0DoHyIcIkmOSZwY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gs6eUjL+mV2g28cZiDgWUJ81Z5p8IEjEd44RCHVzJ40wqaXMA1cpq7qIDouMoleyVGGIdxDgbbSTWYNzJuH+DFX8ekvR203/dQGnpnp2TDJflVdW/H30YbgXofRqym9XZyG1FF4oDcUsAEYkUzgtu1QYWN1GQUP07fGo8Rf1Sk7MITjfNCCERncyYpRGKz6BMGFonH3+/Nc4DAWI8g0+tqZNX/c1gGAEOdnDfNz6/MqZq8xOIayC0CjOySgsgXEMTk//t7RdjULvsNxwdlwyQ1831VddyqxclthH1iIt/RtUg/7ctf73naud13uw0hpgI6JiLp153IndYyfTldY5iw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=guWfMa7d; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=guWfMa7d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fDmlP5lfjz2xN4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Feb 2026 13:22:57 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9420D43B97;
	Mon, 16 Feb 2026 02:22:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F95CC4CEF7;
	Mon, 16 Feb 2026 02:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771208574;
	bh=9PcyAaYKWFup8CH5YLUPtBnRj9L9MKnKJpJNN19ck64=;
	h=From:To:Cc:Subject:Date:From;
	b=guWfMa7dytMR+iBG6TVwpD+VfoIj72cYrSdhs9HGklYk+K5HOu5/wX+3Tn9BUcJSj
	 9BOxXBS+ZS/ShSqympgLhvLXKpgrhcL7uXKtzXde1gDo+pb/yxckRhItAneLQo77pG
	 YejxMkHQ1Axereq9F8XqNfwkOMdAIEGw8QAP+kzoA/tolWRk7xK4C7xwLCDQTOmLUD
	 QIz3aXCL2bOR/C9zl3KSJslQsWknCFZdulSAOoVReTEZbo9U7gZE4uBmPxqn2+Zq0Y
	 tXbFoKSCUEuyeZ9V1W5RM2q1K4iC0JJe2uWMI5difhR3e4l3AzEgevvfe1Mh2dJdeh
	 Bp/tgu54UydYQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linuxppc-dev@lists.ozlabs.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH] lib/crypto: powerpc/aes: Fix rndkey_from_vsx() on big endian CPUs
Date: Sun, 15 Feb 2026 18:21:04 -0800
Message-ID: <20260216022104.332991-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.53.0
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16867-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[ebiggers@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:linux-crypto@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ardb@kernel.org,m:Jason@zx2c4.com,m:herbert@gondor.apana.org.au,m:linuxppc-dev@lists.ozlabs.org,m:ebiggers@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ebiggers@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 8E24A1409FE
X-Rspamd-Action: no action

I finally got a big endian PPC64 kernel to boot in QEMU.  The PPC64 VSX
optimized AES library code does work in that case, with the exception of
rndkey_from_vsx() which doesn't take into account that the order in
which the VSX code stores the round key words depends on the endianness.
So fix rndkey_from_vsx() to do the right thing on big endian CPUs.

Fixes: 7cf2082e74ce ("lib/crypto: powerpc/aes: Migrate POWER8 optimized code into library")
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/powerpc/aes.h | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/lib/crypto/powerpc/aes.h b/lib/crypto/powerpc/aes.h
index 42e0a993c619..f8cbd3c7578f 100644
--- a/lib/crypto/powerpc/aes.h
+++ b/lib/crypto/powerpc/aes.h
@@ -93,22 +93,24 @@ static inline bool is_vsx_format(const struct p8_aes_key *key)
 {
 	return key->nrounds != 0;
 }
 
 /*
- * Convert a round key from VSX to generic format by reflecting the 16 bytes,
- * and (if apply_inv_mix=true) applying InvMixColumn to each column.
+ * Convert a round key from VSX to generic format by reflecting all 16 bytes (if
+ * little endian) or reflecting each 4-byte word (if big endian), and (if
+ * apply_inv_mix=true) applying InvMixColumn to each column.
  *
  * It would be nice if the VSX and generic key formats would be compatible.  But
  * that's very difficult to do, with the assembly code having been borrowed from
  * OpenSSL and also targeted to POWER8 rather than POWER9.
  *
  * Fortunately, this conversion should only be needed in extremely rare cases,
  * possibly not at all in practice.  It's just included for full correctness.
  */
 static void rndkey_from_vsx(u32 out[4], const u32 in[4], bool apply_inv_mix)
 {
+	const bool be = IS_ENABLED(CONFIG_CPU_BIG_ENDIAN);
 	u32 k0 = swab32(in[0]);
 	u32 k1 = swab32(in[1]);
 	u32 k2 = swab32(in[2]);
 	u32 k3 = swab32(in[3]);
 
@@ -116,14 +118,14 @@ static void rndkey_from_vsx(u32 out[4], const u32 in[4], bool apply_inv_mix)
 		k0 = inv_mix_columns(k0);
 		k1 = inv_mix_columns(k1);
 		k2 = inv_mix_columns(k2);
 		k3 = inv_mix_columns(k3);
 	}
-	out[0] = k3;
-	out[1] = k2;
-	out[2] = k1;
-	out[3] = k0;
+	out[0] = be ? k0 : k3;
+	out[1] = be ? k1 : k2;
+	out[2] = be ? k2 : k1;
+	out[3] = be ? k3 : k0;
 }
 
 static void aes_preparekey_arch(union aes_enckey_arch *k,
 				union aes_invkey_arch *inv_k,
 				const u8 *in_key, int key_len, int nrounds)

base-commit: 64275e9fda3702bfb5ab3b95f7c2b9b414667164
-- 
2.53.0


