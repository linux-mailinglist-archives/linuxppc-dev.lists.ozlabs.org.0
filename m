Return-Path: <linuxppc-dev+bounces-9432-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A59AEADDEE8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 00:31:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMM4x4dRMz30WQ;
	Wed, 18 Jun 2025 08:30:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750199409;
	cv=none; b=WYv/Rh1KqBvfHnBEz66CguWJuJC5fGvN5MNgeHIZ42EOM0aHZH6/Dq4fuapxOluPBY3PH7wYvTDZ0He83U8xohas537txvG30ElX4ON7vWsgcirCK/Mhaj0lt1CES620/Boeo9HlSfUwLc9m14XuB6HJuqFdAbvqAtnD0ilydoTddDIRWqOlIWPTWb24gZN7TF29EUMZJGCApa+SGtQqYR1Den0wJYRJx9NNxT8rv7IZ68SLWxmbDz8SuRWKpfiUEbWj7L/84TN1Vc+u/voNsw/wP3joKrL5+tTSWGBZB0beyOqiMMLivHGxIcra4pSp8/9I7eE3y7A+iDmPOHW+sg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750199409; c=relaxed/relaxed;
	bh=CtAvNQxfZW26Yah6zEAm9bL8Su++Y6XUEYcAUfHI6hg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LSKHAqvhH1307oS0VfKlLAFVz5mgyQhVndMGaZEnS82GQi+89l4Fp4paWX6Y1EjgDcdAruOowo1nP4HdzVoA9bkeIjJpHnJuuet2uJtcCnWTtMgxKJGsjsZtWCyClmDHfO06n80sUvwRFUN+cr/aW4qOGv45w1dTMlqCBLuh+fM4AxDtdFfywpYkS7GRMvyDvvXu3hJ96Qj142Mct3XHEGls6tQrh7y3tpC8D8/Xsd0xK2uSsasn+oWbdhd9iwbHUbsOjn4JZMiGECUu9tCtg6E8Zp7GC5YMPPloY7mknslQ4Q+lL1xknfMEsCLvTuKSCdhlpRycLENDcJ61U2xC/g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SovLzznF; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SovLzznF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMM4s227hz30PF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jun 2025 08:30:03 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 264994A821;
	Tue, 17 Jun 2025 22:30:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF370C4CEF8;
	Tue, 17 Jun 2025 22:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750199402;
	bh=oGJq6YZzLbO82TcEMZLZBS9E98OIIOd5KDDOCIIYowQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SovLzznFPfIAEgcoGd3wa7ftl9jecC4+XnxcYbmljKPn6KsHB6owxneOsiWiHlnab
	 muiKIw9awT6KzPqUeNlzqPMNRQ6FYy7/UhXGHPM/wLDCfc1FPzhQZtrSQX6W5VQKa4
	 50B2rUTWfZHWORPDSaKSt4nf8HFzuFx1dUcky6sSdjuVTg5jP3l3Ie8z4zoxN0BeIB
	 5vJahEvic3FD72FGGK9qwYIGiNTNyNAnjg9FNwA98XjMM+3bCyH7NImzGI7tl4fW1C
	 By1EilFtNRcoK8uUYNAou3W+ESJ441BuamWF8ppNnSTp3K+Rnnx3FCX2Vt8euhkRiM
	 JB91sT3DxJ9UQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH 9/9] MAINTAINERS: drop arch/*/lib/crypto/ pattern
Date: Tue, 17 Jun 2025 15:27:26 -0700
Message-ID: <20250617222726.365148-10-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617222726.365148-1-ebiggers@kernel.org>
References: <20250617222726.365148-1-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

arch/*/lib/crypto/ will no longer be used, and its contents have been
moved to lib/crypto/.  (Well, except for a few .gitignore files which
are intentionally being kept for a while.)  Therefore, remove the
arch/*/lib/crypto/ pattern from MAINTAINERS.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a92290fffa163..8ca374b24a806 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6408,11 +6408,10 @@ M:	Jason A. Donenfeld <Jason@zx2c4.com>
 M:	Ard Biesheuvel <ardb@kernel.org>
 L:	linux-crypto@vger.kernel.org
 S:	Maintained
 T:	git https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git libcrypto-next
 T:	git https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git libcrypto-fixes
-F:	arch/*/lib/crypto/
 F:	lib/crypto/
 
 CRYPTO SPEED TEST COMPARE
 M:	Wang Jinchao <wangjinchao@xfusion.com>
 L:	linux-crypto@vger.kernel.org
-- 
2.49.0


