Return-Path: <linuxppc-dev+bounces-7949-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 00190A99CD9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Apr 2025 02:24:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZjcBf1Fxpz3byh;
	Thu, 24 Apr 2025 10:23:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745454185;
	cv=none; b=AySy0EhUc18uvcWI1VdmEGEo9KQB7MFfjh3VACRBP+cBPNlqlMrU69DuTyBmd40ERuJBPMiQk0afelYH0dcqlnAfkjrbb/H8wxzB2UGREcsYUEh8W2hNKVI3MJyyqn4hid2jwp1pcu5MRYvupsYMIo/8i76RiUptH30jECDVKdlOz+pxYzbI3M2+S284isH+ffxgk0mBMFBGnWeGliCpVcCJr0jLHFzkAqPJ9Fsqx6Xu/rQLLGb4YKuF1m9rqazzb+k0ApLfaWTEwcrhU0z54pVRfvGdHev6ABbjKbeQsmI3KDtJmL/8mYxKrREB9qGXxQgMEgANdbUs0cOw/Pg5PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745454185; c=relaxed/relaxed;
	bh=12OeSWqSAxkWwPFRfLXJ/k5srnZM/lbZzG65vpCKYYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZxUP064VhEjO0q+B6vEAFgg9mrELUYwBbsjymTweha4k1nckdf4eh1BN6D7By/5NM5JXwS9nJzLZLqZFS1U+m/hnh6sfDVNWIdxmKgBe1HiJf2qbV7X/Zf3471PazxR5xIHlqfhDXMbqbIca7hY1ilexC+tNLuGEu0JnpCO//koU/7pX8ZCp8HCzWcsZ5oP/e4ub83ixcP/CZDjD+s2m+RlmB5kcQObJiEBERGkMHaUqPSamAE04Zwvjbbw9VU1h3Rd5fYtM8N7Eode4uH76CC35GCkfMCljUzwZHXIk/h2nS9pRUrna/4FGjjIRfvRWTPql9j8Ow2icT+4spd2Juw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZjLHst4b; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZjLHst4b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZjcBb4c41z3bpS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Apr 2025 10:23:03 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CAEDD6845A;
	Thu, 24 Apr 2025 00:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2374C4CEEF;
	Thu, 24 Apr 2025 00:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745454179;
	bh=bmNtnPkT7vfqz7VYymkCYs+RWq0I1HO9RIQ1+wDAdb0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZjLHst4bVDcbmK2s/0yw9jwnVejn2n2RNgkYtDcj19TnSrcTNR941Nezg68ow3IGG
	 OWWvyd7GLInEMusl4tIdEBgGWvnXyC7jS/KhbQLMmxwkmC4mNAzxsnou9OH8/Rhaeo
	 yorikXu6NekPONq5K0lpepo2u9ToPhVacC0I61FsEwFspybjF+wEG4KGGqEzjivZNE
	 NDEnU7QcaQu3to8MPi6vph/yjuH35LTnDR8OtP+RRMx0Gas4KpaHV+j2zXwJ1Mcf5Z
	 jkP4vvkXCfBanEugjydAu4QeBrQbhkac5HveHAp4hgDpO3wbrngz0kXqgz19nTpu3V
	 axl/ON8oAh5Uw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH 5/7] s390/crc: drop "glue" from filenames
Date: Wed, 23 Apr 2025 17:20:36 -0700
Message-ID: <20250424002038.179114-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424002038.179114-1-ebiggers@kernel.org>
References: <20250424002038.179114-1-ebiggers@kernel.org>
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

The use of the term "glue" in filenames is a Crypto API-ism that does
not show up elsewhere in lib/.  I think adopting it there was a mistake.
The library just uses standard functions, so the amount of code that
could be considered "glue" is quite small.  And while often the C
functions just wrap the assembly functions, there are also cases like
crc32c_arch() in arch/x86/lib/crc32-glue.c that blur the line by
in-lining the actual implementation into the C function.  That's not
"glue code", but rather the actual code.

Therefore, let's drop "glue" from the filenames and instead use e.g.
crc32.c instead of crc32-glue.c.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/s390/lib/Makefile                  | 2 +-
 arch/s390/lib/{crc32-glue.c => crc32.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename arch/s390/lib/{crc32-glue.c => crc32.c} (100%)

diff --git a/arch/s390/lib/Makefile b/arch/s390/lib/Makefile
index 14bbfe50033c7..271a1c407121c 100644
--- a/arch/s390/lib/Makefile
+++ b/arch/s390/lib/Makefile
@@ -24,6 +24,6 @@ obj-$(CONFIG_S390_MODULES_SANITY_TEST_HELPERS) += test_modules_helpers.o
 lib-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
 
 obj-$(CONFIG_EXPOLINE_EXTERN) += expoline.o
 
 obj-$(CONFIG_CRC32_ARCH) += crc32-s390.o
-crc32-s390-y := crc32-glue.o crc32le-vx.o crc32be-vx.o
+crc32-s390-y := crc32.o crc32le-vx.o crc32be-vx.o
diff --git a/arch/s390/lib/crc32-glue.c b/arch/s390/lib/crc32.c
similarity index 100%
rename from arch/s390/lib/crc32-glue.c
rename to arch/s390/lib/crc32.c
-- 
2.49.0


