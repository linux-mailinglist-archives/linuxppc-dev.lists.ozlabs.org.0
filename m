Return-Path: <linuxppc-dev+bounces-10215-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 430E2B02DC9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Jul 2025 01:28:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bfl8W6WQdz3brr;
	Sun, 13 Jul 2025 09:26:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752362795;
	cv=none; b=ay6hqwAJIJlcoaVNCVkELk/ciboM1FCYGpgOAgTvC5ayGlcTQbYDbnO4Myj+LbiDo9SJaNBpTZ5rk9eH8JSmAKcsb9NyLQ5GrqgfGSEQZo1LZWTQIQmU3IjuhCxJQQNmgXt5j8RhmMTStJwgdzhYrEw5dOibBEF6CjM/bkttj5otWpOTKr+IxLSJ8wkTOdJu8kKNXpfKp++bbN23MMyLjVmoSGqT3et19z0jHf67/eyOQ4GXj/GuJlQrBhS2miBpMOu2xW2o3AVVRlttg06R1rQKBuQ9XcHZ/5oX/vvK6RWf91hW1KJGN5hWnXKrsAEt2J2/16DgfkzOkQk/qFS2Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752362795; c=relaxed/relaxed;
	bh=jCXigeeWTrQIReJtJOpqtuS2wbvv8dq2DBtYSLrukBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i0RFMVLnBFBg1OdaaxBpVuNxTlbhv7oqd+s3VSaTeOAdBEZ0dCO6xBj87dSBpNdM93JJHxSkxxJNXHIBE0ST1ik1mjl4TQfP8jFHpyP1202u2rUJ+XPPOQrJXbSFY9HsFU8pnvJZbO3CruxSTlOd1TmVxDhInB4za4Kzw64RVv2tD9cwn5hOULIAqQo6f7gDCTFOv7ArGMdmSm6h4cK9BGd8FKgDz18i/xpvNirq4oc5WiGStL7TpzuncV/gMDM/pVBP2r1gCPI67/JM9TKEM7MqagFNn76JhVwE7W2bCHrX3/9Prr+hOWYnxVC40e4EMdP5BQ1HxqogCOLAEWCzBw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dH9DsS2X; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dH9DsS2X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bfl8P50Qbz3bn0
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jul 2025 09:26:29 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 042415C5570;
	Sat, 12 Jul 2025 23:26:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 791B6C4CEEF;
	Sat, 12 Jul 2025 23:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752362787;
	bh=0uuH9SjZ8K8+ACPJuo2m4qDOTTccNZS9uJItjIz8lEA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dH9DsS2Xw3covYFWQE+Ugk+mBSxQ6BXP2pO4QGhLwVyEe44kLlMwoYGDWYEj3LbYU
	 gNdRwNL79zti3WDAQqGT1htMpRbssnwYwxtC6lzR2Z7iMnN/nb5/eKFRmZfAYAyb7V
	 n+j/QkLGWP4ObgYdRFiUCOqHz+h6ker+Ij6lHGSukFAD+bse5ep9FHfZvIUfPLxf24
	 EWrvdOPariUuQs9pPs+WP2TbaKFCh/iYI+jCyHvElw1B3YGPSTjJIys9WkZcYN0Qv9
	 x4K/cOgDkQB3FhwoiAqugSoucfjpSWvoeIMRrzhIV5GFjQ7fRsJv6EFguXNtbqYWBp
	 h+kGyp8qif+ZQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 16/26] bpf: Use sha1() instead of sha1_transform() in bpf_prog_calc_tag()
Date: Sat, 12 Jul 2025 16:23:07 -0700
Message-ID: <20250712232329.818226-17-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250712232329.818226-1-ebiggers@kernel.org>
References: <20250712232329.818226-1-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Now that there's a proper SHA-1 library API, just use that instead of
the low-level SHA-1 compression function.  This eliminates the need for
bpf_prog_calc_tag() to implement the SHA-1 padding itself.  No
functional change.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/linux/filter.h |  6 ------
 kernel/bpf/core.c      | 49 +++++++-----------------------------------
 2 files changed, 8 insertions(+), 47 deletions(-)

diff --git a/include/linux/filter.h b/include/linux/filter.h
index f5cf4d35d83e9..3aa33e904a4ed 100644
--- a/include/linux/filter.h
+++ b/include/linux/filter.h
@@ -995,16 +995,10 @@ void bpf_prog_change_xdp(struct bpf_prog *prev_prog, struct bpf_prog *prog);
 static inline u32 bpf_prog_insn_size(const struct bpf_prog *prog)
 {
 	return prog->len * sizeof(struct bpf_insn);
 }
 
-static inline u32 bpf_prog_tag_scratch_size(const struct bpf_prog *prog)
-{
-	return round_up(bpf_prog_insn_size(prog) +
-			sizeof(__be64) + 1, SHA1_BLOCK_SIZE);
-}
-
 static inline unsigned int bpf_prog_size(unsigned int proglen)
 {
 	return max(sizeof(struct bpf_prog),
 		   offsetof(struct bpf_prog, insns[proglen]));
 }
diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index dae281a1286d5..a1b727ffa4548 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -287,32 +287,23 @@ void __bpf_prog_free(struct bpf_prog *fp)
 	vfree(fp);
 }
 
 int bpf_prog_calc_tag(struct bpf_prog *fp)
 {
-	const u32 bits_offset = SHA1_BLOCK_SIZE - sizeof(__be64);
-	u32 raw_size = bpf_prog_tag_scratch_size(fp);
-	u32 digest[SHA1_DIGEST_WORDS];
-	u32 ws[SHA1_WORKSPACE_WORDS];
-	u32 i, bsize, psize, blocks;
+	size_t size = bpf_prog_insn_size(fp);
+	u8 digest[SHA1_DIGEST_SIZE];
 	struct bpf_insn *dst;
 	bool was_ld_map;
-	u8 *raw, *todo;
-	__be32 *result;
-	__be64 *bits;
+	u32 i;
 
-	raw = vmalloc(raw_size);
-	if (!raw)
+	dst = vmalloc(size);
+	if (!dst)
 		return -ENOMEM;
 
-	sha1_init_raw(digest);
-	memset(ws, 0, sizeof(ws));
-
 	/* We need to take out the map fd for the digest calculation
 	 * since they are unstable from user space side.
 	 */
-	dst = (void *)raw;
 	for (i = 0, was_ld_map = false; i < fp->len; i++) {
 		dst[i] = fp->insnsi[i];
 		if (!was_ld_map &&
 		    dst[i].code == (BPF_LD | BPF_IMM | BPF_DW) &&
 		    (dst[i].src_reg == BPF_PSEUDO_MAP_FD ||
@@ -328,37 +319,13 @@ int bpf_prog_calc_tag(struct bpf_prog *fp)
 			dst[i].imm = 0;
 		} else {
 			was_ld_map = false;
 		}
 	}
-
-	psize = bpf_prog_insn_size(fp);
-	memset(&raw[psize], 0, raw_size - psize);
-	raw[psize++] = 0x80;
-
-	bsize  = round_up(psize, SHA1_BLOCK_SIZE);
-	blocks = bsize / SHA1_BLOCK_SIZE;
-	todo   = raw;
-	if (bsize - psize >= sizeof(__be64)) {
-		bits = (__be64 *)(todo + bsize - sizeof(__be64));
-	} else {
-		bits = (__be64 *)(todo + bsize + bits_offset);
-		blocks++;
-	}
-	*bits = cpu_to_be64((psize - 1) << 3);
-
-	while (blocks--) {
-		sha1_transform(digest, todo, ws);
-		todo += SHA1_BLOCK_SIZE;
-	}
-
-	result = (__force __be32 *)digest;
-	for (i = 0; i < SHA1_DIGEST_WORDS; i++)
-		result[i] = cpu_to_be32(digest[i]);
-	memcpy(fp->tag, result, sizeof(fp->tag));
-
-	vfree(raw);
+	sha1((const u8 *)dst, size, digest);
+	memcpy(fp->tag, digest, sizeof(fp->tag));
+	vfree(dst);
 	return 0;
 }
 
 static int bpf_adj_delta_to_imm(struct bpf_insn *insn, u32 pos, s32 end_old,
 				s32 end_new, s32 curr, const bool probe_pass)
-- 
2.50.1


