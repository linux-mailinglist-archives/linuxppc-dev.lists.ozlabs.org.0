Return-Path: <linuxppc-dev+bounces-10203-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD62B02D96
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Jul 2025 01:26:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bfl8K2GJnz2xCd;
	Sun, 13 Jul 2025 09:26:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752362785;
	cv=none; b=bsAxMDHtaJ1nL7ixcEvNK/LLLh7D2EAhkpk3bZbdVKU8Rn/jkBYz2DxAKtq3+ws4DCX6BiM5hwr4fH51D3GEUwH6JM1xWfXMC2CPhtNPwIizZvH4i8HvkcgTShR0+K2aMmIDnona+FlqFJqDuwNRRk6J9oVMrkkL03Ez3daAk4Sv8Yf+52OOfu+qVrCNvxCsc+PN3MRl+72e7Ucn1uMR4NkpYQTofP4sXDtO+4X0aBAj3qZDT8jenRY4J/9Cna8/f1woFXPpgjEfOcWzXBMVYC7b4nl81Gt3lxplaCTvagaIBhKPMUpi3MEDMnBCPFfvpVTCiiyjPmUxobyxrVXVMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752362785; c=relaxed/relaxed;
	bh=QfGb++iyqZlDvhqlROnQtUURr27G9aCS+kWzxTx8Tu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZCZYTjNskFmytHYD/Ou5rQZ4BHqf4gKmXdEGnGOqBBY+zHQI4v+MdF9VmzTQfgF+a0fUj2esSux7Mg2UT388XRWXoJ9fmXF/Lm7KflIWzXJHH7uaVx6LM4h/SuGtEk3sLt/P/lNzFx6xxd4f41hrBNvDPaI7MyKBRASlIQHWfSrvJyIBXLr/0dNxbRXE471pQUPNejei+nvAP+tR4kajR0IVtsmToiva/LX9oVwXpbAb+c8h3j/0eQ4rBrbRDkRlMqerxYj0rn7+XpFSahYQog8OSWJVDjFY8EjiLn81fndpZpDFbec6Ekq2sMwooOJCYx+4Yws67/UgQrTzY3EmqA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cmmwf+fA; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cmmwf+fA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bfl8H5PcLz2yPS
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jul 2025 09:26:23 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 59078468EE;
	Sat, 12 Jul 2025 23:26:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E19DEC4CEF8;
	Sat, 12 Jul 2025 23:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752362781;
	bh=E22JI/nh2KoyIuwx+c+Le9v+4pE3ucXhZL4d/YBdz7g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cmmwf+fAlxfZeUlUdvV1RStLqLkPiW2zfJ2zBPrVlnr7L04CcfPF3I/ZY61mhxqzF
	 UmqYAUQ4svnDAjD64/qd2nbDs5VfdmZ+Wdl6axs+Pp2dBobCdfzKvfiUfyjWyV0Emu
	 bnFJy4JMfW/NLQp1h1EAuLTEdvJJVjXcMFnzNKc2usi851QxfTu1Eem5KjkNwGll5f
	 lgQrbXzEIq4c4ZedmXzCDpa9WeJNZgMl9S3h/6kVtOWN5EVdkv3MDG/a3Oum868UU6
	 SfJiyW/fELObXrfYbVzrJFLlz3eNbYdmWQXsdfzTPEmjVRv+y4B1yYLAvoaYPKAIou
	 1xYQp8kEh20rg==
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
Subject: [PATCH 02/26] lib/crypto: sha1: Rename sha1_init() to sha1_init_raw()
Date: Sat, 12 Jul 2025 16:22:53 -0700
Message-ID: <20250712232329.818226-3-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Rename the existing sha1_init() to sha1_init_raw(), since it conflicts
with the upcoming library function.  This will later be removed, but
this keeps the kernel building for the introduction of the library.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/sha1.h | 2 +-
 kernel/bpf/core.c     | 2 +-
 lib/crypto/sha1.c     | 6 +++---
 net/ipv6/addrconf.c   | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/crypto/sha1.h b/include/crypto/sha1.h
index f48230b1413c3..d853d3b931699 100644
--- a/include/crypto/sha1.h
+++ b/include/crypto/sha1.h
@@ -31,9 +31,9 @@ struct sha1_state {
  * You shouldn't be using SHA-1, and even if you *have* to use SHA-1, this isn't
  * the correct way to hash something with SHA-1 (use crypto_shash instead).
  */
 #define SHA1_DIGEST_WORDS	(SHA1_DIGEST_SIZE / 4)
 #define SHA1_WORKSPACE_WORDS	16
-void sha1_init(__u32 *buf);
+void sha1_init_raw(__u32 *buf);
 void sha1_transform(__u32 *digest, const char *data, __u32 *W);
 
 #endif /* _CRYPTO_SHA1_H */
diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index c20babbf998f4..dae281a1286d5 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -302,11 +302,11 @@ int bpf_prog_calc_tag(struct bpf_prog *fp)
 
 	raw = vmalloc(raw_size);
 	if (!raw)
 		return -ENOMEM;
 
-	sha1_init(digest);
+	sha1_init_raw(digest);
 	memset(ws, 0, sizeof(ws));
 
 	/* We need to take out the map fd for the digest calculation
 	 * since they are unstable from user space side.
 	 */
diff --git a/lib/crypto/sha1.c b/lib/crypto/sha1.c
index 6d809c3088be3..813ad96daa25a 100644
--- a/lib/crypto/sha1.c
+++ b/lib/crypto/sha1.c
@@ -122,20 +122,20 @@ void sha1_transform(__u32 *digest, const char *data, __u32 *array)
 	digest[4] += E;
 }
 EXPORT_SYMBOL(sha1_transform);
 
 /**
- * sha1_init - initialize the vectors for a SHA1 digest
+ * sha1_init_raw - initialize the vectors for a SHA1 digest
  * @buf: vector to initialize
  */
-void sha1_init(__u32 *buf)
+void sha1_init_raw(__u32 *buf)
 {
 	buf[0] = 0x67452301;
 	buf[1] = 0xefcdab89;
 	buf[2] = 0x98badcfe;
 	buf[3] = 0x10325476;
 	buf[4] = 0xc3d2e1f0;
 }
-EXPORT_SYMBOL(sha1_init);
+EXPORT_SYMBOL(sha1_init_raw);
 
 MODULE_DESCRIPTION("SHA-1 Algorithm");
 MODULE_LICENSE("GPL");
diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index ba2ec7c870ccb..d0e5b94c10af4 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -3365,11 +3365,11 @@ static int ipv6_generate_stable_address(struct in6_addr *address,
 		return -1;
 
 retry:
 	spin_lock_bh(&lock);
 
-	sha1_init(digest);
+	sha1_init_raw(digest);
 	memset(&data, 0, sizeof(data));
 	memset(workspace, 0, sizeof(workspace));
 	memcpy(data.hwaddr, idev->dev->perm_addr, idev->dev->addr_len);
 	data.prefix[0] = address->s6_addr32[0];
 	data.prefix[1] = address->s6_addr32[1];
-- 
2.50.1


