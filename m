Return-Path: <linuxppc-dev+bounces-7704-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02115A909BB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Apr 2025 19:15:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zd72L3G9sz3blC;
	Thu, 17 Apr 2025 03:15:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744823722;
	cv=none; b=U3lGVkHbzak0xbRjmwIk6/rbcirpEHxjkj92PC+UT0VL77+CcIfC1pnZXIBrLbBpx4YamUzbEdc2B3Q7+BKKkEr0JuPBBthuak9a0IzlSyzC5T863fPBeClFAtteLH9+wFoTqHedVEsdedmw6oxn3nexfz9P4HUSkY1G8z1KfupdVZr117CNF4YflH+KIdrw8rJwU2i0I4+GEXPMOBxwLK7WmwC6kI9Ze8pZ9qInT7DPq6m/9YQUKd73JVaBqOYft9Z1BQuC9FQK8zrLHPybA1Rgv5LNRsgKVJN/ba2CW+CwXInZCvFrX19L07o5KAeT230L995ieQ1jdxpOOnMGiA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744823722; c=relaxed/relaxed;
	bh=u9eaFAPQWVpPHI3HNxTM8tnlRWJ65b++4ZKSp7OxWd4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n6+MfWYk8PsN/a3CamObLuk+BZ6POiRJEo+ykpEfOPp21ab79kFsyCOrQW81dSf3H3IWsue4wh1C3agzwpwmKnWYq/kxUYz5kjUXirk4QEFLarstRlYHA3gMTH212Lq8Y6ojETefGKCY7NdnTBU5uFzAZyCXMgX1tn4ZX1d/e3+Qz5Df3/NgbtCpcGrTgGaEOzHE7ZkVqqZmllGwG+0ahX1a73bal4iSRdnX5wDEVBqYhwxZ8itUMwmHnSRv5ACZKjRU4PpRnSzVGPcgkiNEFjNe0A9b41vQSfHP/wJYk/KaYKQO7C1C7Mw1opZK3OfJy8GvYSf3kaHj9KEGUfCl4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=n2e8LiJd; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=n2e8LiJd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zd72K5Px5z2yrr
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Apr 2025 03:15:21 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 86C7840BDD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Apr 2025 17:15:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31A4AC4CEE2;
	Wed, 16 Apr 2025 17:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744823719;
	bh=PtS50I1JEx78saTBfrIr2/aVCZOH4dhGGysijRowgC0=;
	h=From:To:Cc:Subject:Date:From;
	b=n2e8LiJdxP35mPYrF33YC5NWI2GA+R0A0NF6IRn0hMETQmeIcY5FFKS3l3Pix3PdO
	 69prvrhfe8abkQ1K2+OlkHPXSW1Fr0fwi7gbZ4s8RXkD3Tz8ldD7QJv/C5tov6JQhN
	 jxXo8hrW5kUdv1jmXLqu4GZ1guwGgx2cxoEFgyoIoGJp0PvhkIKBwRPWV08D5Nm1Ag
	 1hzez+mN7o/2o/9XMYNztpaox4toV76lfYFvc3ppOnJpSU99ucndmkn6fL5Sz1FwVN
	 nLeNWyIzxMc//AEA+yU8Go2QDi8bttOejLpDK0/07/eKo+9rSotdY6cNIoBe0fauhi
	 DRAYJ4ru+k83Q==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH] powerpc/crc: include <linux/uaccess.h>
Date: Wed, 16 Apr 2025 10:14:39 -0700
Message-ID: <20250416171439.226938-1-ebiggers@kernel.org>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

Since <asm/simd.h> no longer transitively includes <linux/uaccess.h>
which provides pagefault_disable() and pagefault_enable(),
<linux/uaccess.h> now needs to be included directly.

Fixes: 7ba8df47810f ("asm-generic: Make simd.h more resilient")
Signed-off-by: Eric Biggers <ebiggers@google.com>
---

I can take this via the crc tree, but it really should go via crypto
since the patch that broke this is in there...

 arch/powerpc/lib/crc-t10dif-glue.c | 1 +
 arch/powerpc/lib/crc32-glue.c      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/powerpc/lib/crc-t10dif-glue.c b/arch/powerpc/lib/crc-t10dif-glue.c
index ddd5c4088f50..c48284f7b582 100644
--- a/arch/powerpc/lib/crc-t10dif-glue.c
+++ b/arch/powerpc/lib/crc-t10dif-glue.c
@@ -11,10 +11,11 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/string.h>
 #include <linux/kernel.h>
 #include <linux/cpufeature.h>
+#include <linux/uaccess.h>
 #include <asm/simd.h>
 #include <asm/switch_to.h>
 
 #define VMX_ALIGN		16
 #define VMX_ALIGN_MASK		(VMX_ALIGN-1)
diff --git a/arch/powerpc/lib/crc32-glue.c b/arch/powerpc/lib/crc32-glue.c
index 42f2dd3c85dd..d7f57576c74e 100644
--- a/arch/powerpc/lib/crc32-glue.c
+++ b/arch/powerpc/lib/crc32-glue.c
@@ -3,10 +3,11 @@
 #include <crypto/internal/simd.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/cpufeature.h>
+#include <linux/uaccess.h>
 #include <asm/simd.h>
 #include <asm/switch_to.h>
 
 #define VMX_ALIGN		16
 #define VMX_ALIGN_MASK		(VMX_ALIGN-1)

base-commit: 5f7325fbb3d416ba66f163a9272e17d70f1d9bf4
-- 
2.49.0


