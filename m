Return-Path: <linuxppc-dev+bounces-10227-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6995BB02DF6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Jul 2025 01:29:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bfl8f0Nnzz3bTf;
	Sun, 13 Jul 2025 09:26:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752362802;
	cv=none; b=Yva+E6lxED0E/feIkA8sN0qDCmqlcq3QbKgUUpo81PPvNx8eS8aOqAXdlyneSzNyik+bvASnucefcVWJ82r3PTFs90BDE5VpG3F7LUwwZ3YqL2W00N7YAmX+zkB1nmT/cv7jgHinqd/7Tp8MSjQJ/uEJxZrwURk9ypqP/9X+mRKFov42DBVAAxuIMS6RBSlZgxPjK9fPZjYvaKoe7c3UapZ18D5BicxfdJlaYOFT1goaxU3xx4KTxGsLTaJK8XUepLw9sLxeEZfOA3yrop6dmMxMApqYYbtHAtUlR8DlDfsxAh90DK8auec2FZvDpudbOm9Opb8ud9kpSm4OfQBGPg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752362802; c=relaxed/relaxed;
	bh=Mtm5lo+g8ZX2LiJ5ezp1zW6EHD2ya7LYJDCuds37EjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IovTyul5F4ajm/22vd6Wll7KKUrTytsDMQV8u554oU5DY1Iss6M7WTfMDi9SjjEDgNiYqB138FjfXWXXVAS67Rr3/2S2oKZwW9kRnjPkYzci3cEF/Q6VPJ05UAw096G0Nxcc1t/99QEUtbOoqvyQ3jHWwraItpg73Rr88QYRNPeumxBgtyP+zCwDyU3rLkmqIfrR3SwGJLMGjE4YbQhTsZKsHpQjQx3kefm7z4vE8JHX5c0bDuWKeynM4L8bfTfIJn0sYgqeE6GI2EV9ATUshOhDVq8cOCC/QJzAIe5eA38HQ1KbqBOmHN64SYrfhKf+BSStr8fEST3H+DBukNwGsQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Zj8p+TOd; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Zj8p+TOd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bfl8W1y0Bz3blg
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jul 2025 09:26:34 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4FA385C556E;
	Sat, 12 Jul 2025 23:26:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7C7AC4CEF1;
	Sat, 12 Jul 2025 23:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752362792;
	bh=oVRGZdE8JlbqTZ+/Vc8lJfxP7t8h25c1QhOzJeVqedA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zj8p+TOdVPu5lLHwjDdEJchVLZkO8F/qQjiyuD+eFQGiCyDQXvpReA3aDYR+mQdXN
	 KP5SpOK4fB3lqKTD1miviKDDEE0Rh1/t2wj68FTUNFC3sg/5fiECZziA+PJrcihbcg
	 EO2THy+IhzDgyjilv+vvjzNXCOgoFE/oeN39RE/9xR7cJuXS8JgPpnNegYYtrAHJn/
	 BP8LivY5YkQlIiBVMIrbibin415AHX10jV1s3KUYIvwDc/U1pvHnZVHEgqZskmXPls
	 60wYxMyihVBMQ31CfcCFnnUSBzCLxCm2+RHUrC7Fd2ORRkenalB5pgZEw3rJ9WKA4R
	 jV4MTcMcL6DBQ==
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
Subject: [PATCH 25/26] ipv6: Switch to higher-level SHA-1 functions
Date: Sat, 12 Jul 2025 16:23:16 -0700
Message-ID: <20250712232329.818226-26-ebiggers@kernel.org>
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

There's now a proper SHA-1 API that follows the usual conventions for
hash function APIs: sha1_init(), sha1_update(), sha1_final(), sha1().
The only remaining user of the older low-level SHA-1 API,
sha1_init_raw() and sha1_transform(), is ipv6_generate_stable_address().
I'd like to remove this older API, which is too low-level.

Unfortunately, ipv6_generate_stable_address() does in fact skip the
SHA-1 finalization for some reason.  So the values it computes are not
standard SHA-1 values, and it sort of does want the low-level API.

Still, it's still possible to use the higher-level functions sha1_init()
and sha1_update() to get the same result, provided that the resulting
state is used directly, skipping sha1_final().

So, let's do that instead.  This will allow removing the low-level API.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 net/ipv6/addrconf.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index d0e5b94c10af4..a4d47044f4557 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -3336,12 +3336,11 @@ static bool ipv6_reserved_interfaceid(struct in6_addr address)
 static int ipv6_generate_stable_address(struct in6_addr *address,
 					u8 dad_count,
 					const struct inet6_dev *idev)
 {
 	static DEFINE_SPINLOCK(lock);
-	static __u32 digest[SHA1_DIGEST_WORDS];
-	static __u32 workspace[SHA1_WORKSPACE_WORDS];
+	static struct sha1_ctx sha_ctx;
 
 	static union {
 		char __data[SHA1_BLOCK_SIZE];
 		struct {
 			struct in6_addr secret;
@@ -3353,36 +3352,40 @@ static int ipv6_generate_stable_address(struct in6_addr *address,
 
 	struct in6_addr secret;
 	struct in6_addr temp;
 	struct net *net = dev_net(idev->dev);
 
-	BUILD_BUG_ON(sizeof(data.__data) != sizeof(data));
-
 	if (idev->cnf.stable_secret.initialized)
 		secret = idev->cnf.stable_secret.secret;
 	else if (net->ipv6.devconf_dflt->stable_secret.initialized)
 		secret = net->ipv6.devconf_dflt->stable_secret.secret;
 	else
 		return -1;
 
 retry:
 	spin_lock_bh(&lock);
 
-	sha1_init_raw(digest);
+	sha1_init(&sha_ctx);
+
 	memset(&data, 0, sizeof(data));
-	memset(workspace, 0, sizeof(workspace));
 	memcpy(data.hwaddr, idev->dev->perm_addr, idev->dev->addr_len);
 	data.prefix[0] = address->s6_addr32[0];
 	data.prefix[1] = address->s6_addr32[1];
 	data.secret = secret;
 	data.dad_count = dad_count;
+	sha1_update(&sha_ctx, (const u8 *)&data, sizeof(data));
 
-	sha1_transform(digest, data.__data, workspace);
-
+	/*
+	 * Note that the SHA-1 finalization is omitted here, and the digest is
+	 * pulled directly from the internal SHA-1 state (making it incompatible
+	 * with standard SHA-1).  Unusual, but technically okay since the data
+	 * length is fixed and is a multiple of the SHA-1 block size.
+	 */
+	static_assert(sizeof(data) % SHA1_BLOCK_SIZE == 0);
 	temp = *address;
-	temp.s6_addr32[2] = (__force __be32)digest[0];
-	temp.s6_addr32[3] = (__force __be32)digest[1];
+	temp.s6_addr32[2] = (__force __be32)sha_ctx.state.h[0];
+	temp.s6_addr32[3] = (__force __be32)sha_ctx.state.h[1];
 
 	spin_unlock_bh(&lock);
 
 	if (ipv6_reserved_interfaceid(temp)) {
 		dad_count++;
-- 
2.50.1


