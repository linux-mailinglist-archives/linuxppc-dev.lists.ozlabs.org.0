Return-Path: <linuxppc-dev+bounces-7636-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD4EA870B0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Apr 2025 06:56:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZZymP5mwwz2yrQ;
	Sun, 13 Apr 2025 14:55:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744520149;
	cv=none; b=W/71XeUHElbH2lcOFOLpvvwzxgAyQyrY8xl+JHWId8YgQ2BwlVYE+0Ca6IMu8Sue3Itr+PdPDalAUVjDTl9Fglr6c8pXVhzQb52zJqS0XVts3mq+lUrA3K0FUG1jJZ0pObxCF3+LtrymmlB732J5X5EJyZ0k+Gp/5OaL5e/WIqwHrk01FfXnE6c53I7gjFDHpD9CKLCrqrjU6aK/xtPXH9CCS1a1CMdu00W4DTO1hXLG0W6lz/7tfU2MtOlQI+npyJq8f5TcvcAnLn02x/N92rAulAq3XLdGKDegizDUQV8O9/J0prZpDXp/fwIA7KUUKBc/banY5Rg39M8wWSKg9g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744520149; c=relaxed/relaxed;
	bh=GrhB+kNPtDwcIO4MusPOmHEI+kY9YhdYT3G1lfPHgZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PsXrQ18URbdVYm0E1ayOuGp1E6tQrOrOSsThbcgt4l6yaOJscjZZYaDjuTruKh7/Uigd6qI/aySxVsEGV+nzAv2uKXv66hGCWiZuC08H/H8gx0v4hGKInquIfMSYA94ez1IoKY/PQiunazBG8gLXehvncEk23yiQB60W1zSaE9Hm9F2+MIecUw/biXmxxtbe7b6QYTeANxEJqn/si8Cey10MBqE/TirFgk7EUH50P27looIUO/72QieqoMAJd5IPICLvIyLo29xjKdKnbkAtV26rwUGh3XC98n5GIQBRSD6HGq/S+/SIQMzjbG7QdnyZGvgpCL7R16Qpv3g4jDawOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dQ3TQJtk; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dQ3TQJtk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZZymM4qbMz2yk3
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Apr 2025 14:55:47 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BB8DEA40D19;
	Sun, 13 Apr 2025 04:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8414CC4CEEC;
	Sun, 13 Apr 2025 04:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744520144;
	bh=2gVkbo9MzVz9VvdMrst8TjWJgNjWQ5w/TelaNMUEtGU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dQ3TQJtkQRNwLXjjSV+ZirK4F2x5Ki3Bhv5FTKS0TwurPeEsyoDqm/+11jsc6KW/a
	 sS/UqHVfUu/IOzxUpNwkD1ovfmDwFhEzVnWxOWHFD05K5ZscmwjZU2oMjAfRLzRawn
	 30yLpt4R8qhT7ec13PW04vyT4DaMPls82NRUZ1euqmDGxs8CSb9p5bWhuXdCviGCUc
	 1zRw8fPcXC/Zdg2Lmqm7zA1a+dhQrtO9RiXimZ4QHwMHLCsaPR3Bnik+Zq35FnHVcq
	 lQ9gEU05caDHcf1lX0cxLWbGZOh7IM7YG2I8Vl/U07faajdBK8X4wf5HybE8IpkIAd
	 uhuSffzv6mTwg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org
Subject: [PATCH 9/9] crypto: poly1305 - remove rset and sset fields of poly1305_desc_ctx
Date: Sat, 12 Apr 2025 21:54:21 -0700
Message-ID: <20250413045421.55100-10-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250413045421.55100-1-ebiggers@kernel.org>
References: <20250413045421.55100-1-ebiggers@kernel.org>
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
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,SUSPICIOUS_RECIPS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

These fields are no longer needed, so remove them.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 include/crypto/poly1305.h | 4 ----
 lib/crypto/poly1305.c     | 2 --
 2 files changed, 6 deletions(-)

diff --git a/include/crypto/poly1305.h b/include/crypto/poly1305.h
index 91444965772a..6e21ec2d1dc2 100644
--- a/include/crypto/poly1305.h
+++ b/include/crypto/poly1305.h
@@ -41,14 +41,10 @@ struct poly1305_state {
 struct poly1305_desc_ctx {
 	/* partial buffer */
 	u8 buf[POLY1305_BLOCK_SIZE];
 	/* bytes used in partial buffer */
 	unsigned int buflen;
-	/* how many keys have been set in r[] */
-	unsigned short rset;
-	/* whether s[] has been set */
-	bool sset;
 	/* finalize key */
 	u32 s[4];
 	/* accumulator */
 	struct poly1305_state h;
 	/* key */
diff --git a/lib/crypto/poly1305.c b/lib/crypto/poly1305.c
index 6e80214ebad8..b633b043f0f6 100644
--- a/lib/crypto/poly1305.c
+++ b/lib/crypto/poly1305.c
@@ -20,12 +20,10 @@ void poly1305_init_generic(struct poly1305_desc_ctx *desc,
 	desc->s[1] = get_unaligned_le32(key + 20);
 	desc->s[2] = get_unaligned_le32(key + 24);
 	desc->s[3] = get_unaligned_le32(key + 28);
 	poly1305_core_init(&desc->h);
 	desc->buflen = 0;
-	desc->sset = true;
-	desc->rset = 2;
 }
 EXPORT_SYMBOL_GPL(poly1305_init_generic);
 
 void poly1305_update_generic(struct poly1305_desc_ctx *desc, const u8 *src,
 			     unsigned int nbytes)
-- 
2.49.0


