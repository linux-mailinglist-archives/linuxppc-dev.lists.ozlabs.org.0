Return-Path: <linuxppc-dev+bounces-8009-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 942F2A9D887
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Apr 2025 08:51:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zl0k92prXz2y06;
	Sat, 26 Apr 2025 16:51:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745650305;
	cv=none; b=ZDqHI/vD1jEbcBZ+87lTj1WrIMmoVjCVSCxfbuq32eQu8iWFNb/Lfohp5G3b0zyY4xNzsZyU9vEvGAqvA0To8UJRggmTmFHEEkm4VLVlUmA4k3mo8gB8XWaTghd5hhoqaFrPMs7WKq+UBpajyJrhWIMm8Yu6NMi515hzRjvubXIkBzjX2hycqV+/7QpXZOUUwwgkLxswP4RCpIx6TdiDza2RykfFwPmidrl1mRZhOAlrKYfkMQrZcTF74Pm1z9bJCK666DgsNm5Kn7g+zGRtvi6l7J/9fm1jUh8nWuQ7S6cjnAw+OPdaapR3LT3+hcJYqXcdjD5v0l4bBzxDHfpilA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745650305; c=relaxed/relaxed;
	bh=Sn8BpMssSvvurki76bvPAsXXKeoGRKsVHzy1bYbUjUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gVTa3UWTP+MSC6tNTPU+uPPxGvyujw5fhfq87EVYO4TuXX1S7g8kUH/y8SqnNO6+9QA2Yr01iH2NxSJSNxzUYlDgmg7WicXpZ6QFR3DedWMGVfInH3xMYmvVtPIfCmteFDgZd+tMLUbOxJAM15X0ENuXN0Et9jRXWLTOX5QZESSMigQE1xrTjKeFq4RvH/2rug/MZ2Q57jeH0b3EJlISx/nq4z82MFIwLNeYovJbC4iCd1PrWs3BwvlSM0nvT70ooPdYcCUAK28ZVcfpikEAWA6ck7X7Fhx43HGlaVXgINYxbkMokgAvnZbuHEJrFb4zwIozJxdjhZ6aTif1P8ASDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Lcsr7CT6; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Lcsr7CT6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zl0k71sntz2xmZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Apr 2025 16:51:43 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 589675C290D;
	Sat, 26 Apr 2025 06:49:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB467C4CEEB;
	Sat, 26 Apr 2025 06:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745650301;
	bh=tT7xHizMSeBb7KvPb+oh3/Ig96zej6yrrgzCapsgU4A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Lcsr7CT6H9XpOvDDW/C83SMoazZN1PRVMrqjz50cIA8jvmCUTp4hbSP/O3xWDYddd
	 YZ0Ca/KBHzX6l/dLL8hxBuVetdDeZw6hpcDAZ35cOMN09OfSLYS0ycv+SBXsap2x9T
	 nYa388Rpg9JgkkRno5+iBFIWegN8KKu5pmrB5RAANFCP2wNWIJ8cg4uo4UGSC1YmXX
	 3PyA35KurVu6MUW3T2QiEAViSJb9VVp4oVLGMgGOqouczpABo7xEpnV5PbcofFOcyJ
	 SrKpi4wF6nF6wj1xAmeQyg10nxHDcqBjKLSEqqQyHj2PlfzO/+3AwSUvpeth2rtySI
	 75WbMMZSzlWhA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	sparclinux@vger.kernel.org,
	linux-s390@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 03/13] crypto: arm64/sha256 - remove obsolete chunking logic
Date: Fri, 25 Apr 2025 23:50:29 -0700
Message-ID: <20250426065041.1551914-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250426065041.1551914-1-ebiggers@kernel.org>
References: <20250426065041.1551914-1-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

Since kernel-mode NEON sections are now preemptible on arm64, there is
no longer any need to limit the length of them.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm64/crypto/sha256-glue.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/crypto/sha256-glue.c b/arch/arm64/crypto/sha256-glue.c
index 26f9fdfae87bf..d63ea82e1374e 100644
--- a/arch/arm64/crypto/sha256-glue.c
+++ b/arch/arm64/crypto/sha256-glue.c
@@ -84,27 +84,12 @@ static struct shash_alg algs[] = { {
 } };
 
 static int sha256_update_neon(struct shash_desc *desc, const u8 *data,
 			      unsigned int len)
 {
-	do {
-		unsigned int chunk = len;
-
-		/*
-		 * Don't hog the CPU for the entire time it takes to process all
-		 * input when running on a preemptible kernel, but process the
-		 * data block by block instead.
-		 */
-		if (IS_ENABLED(CONFIG_PREEMPTION))
-			chunk = SHA256_BLOCK_SIZE;
-
-		chunk -= sha256_base_do_update_blocks(desc, data, chunk,
-						      sha256_neon_transform);
-		data += chunk;
-		len -= chunk;
-	} while (len >= SHA256_BLOCK_SIZE);
-	return len;
+	return sha256_base_do_update_blocks(desc, data, len,
+					    sha256_neon_transform);
 }
 
 static int sha256_finup_neon(struct shash_desc *desc, const u8 *data,
 			     unsigned int len, u8 *out)
 {
-- 
2.49.0


