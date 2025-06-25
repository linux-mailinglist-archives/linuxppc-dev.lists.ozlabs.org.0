Return-Path: <linuxppc-dev+bounces-9702-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D548AE77DB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 09:10:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRtJ827t0z30Ff;
	Wed, 25 Jun 2025 17:10:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750835432;
	cv=none; b=NUhVRq4PT7FfyY7vAy0FbqRaSSaKtayeTYzsVWSyinf3cfY85gaADZJy2YzHte5JULVv7idf4j8PuZp1QkWHPhOpDomLiNoFx1XVSaKmSLqWGF1fybyRhvDSrtuw3Ee4MICK7Dw0cnsmf6TqmHro6KURqXL0H0PwoS2tlNWN7rBH0+rVqvBWfWRs0FtlbNyxlEDcsf2HDINZ6nshSY3L3q9lfNJ0ElIn9dgi8xzaGn6Vms0t8rahzvzDTTOjm8bGkN2dEmjgYRsZca2swJuBaTmRit9BUnEOdSNIHEuVNemX1sEwy60JNYUu+M1MesDAnwn0EKyCLd80pI5Acl0llQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750835432; c=relaxed/relaxed;
	bh=kt4sp2VhnIWEOeMcH73t899orOG4QC4oYu9cxkK9Ix8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SJkK8YJeN1d14RyDnBixjsD3/ImUKiubCY7SS/eKYo9yt8qREDMwTTDY/B7D9zbiNvVgxNbRXxwvy1xpbeE4brj7dqRYKlb0DNjc0Q+QmEQyA0nAtGTB7ElWerK2ZZu08Yr8X2bckiHKp5lA9JgOFwM5BH8zBcmGPY20BQzfIN/S2L/0vG/lo5bAxIvnbiRWbbiQ/FVekuyEhHpAiCglJ0eAAtsmxqy4PVPqgj5g3IVGX4PTTOuaQE/PgR3qYD+8F1zMA2VzGYXYLrBN25hqUmv16A6nEaAARRj+9Mg0YuCs4FIL/7RNQqrmPkfu1RRVLJTvVswO0Pqfn2yHjWreag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=grOdLOtZ; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=grOdLOtZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRtJ64R3Bz2yKq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 17:10:30 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E38D8A51207;
	Wed, 25 Jun 2025 07:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DC29C4AF09;
	Wed, 25 Jun 2025 07:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750835427;
	bh=oP/HTNYTl9LXpDk4PHssqzdxrIaWg9Dc4X7a2efoHe0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=grOdLOtZgoIKmEWCLoLH/9c0vB0aNmsNV3SxcH0BZP5ljLtkHnx2+AKoNSsaq9vrv
	 DUs8v9tEITVzaIhBG2hZl5pFHjoAU65Vwvo8XLLJNUhLYdlK9SUpvu0gRKUh3lVnmx
	 xe7B9ojnICi0YfGfAQLPYVUBhPYUYbz115fGEy9isHKdHCYMvqY4oW6SNKWv4FJRs2
	 WjGEQ1c2vJ3eCDQIKmq8N+TBXe4uIfevRVsKQTU4aigzoOA6WXabW0iVDnRucYJXPc
	 sldN4RMVz138oOya4ugf0A3vVhvZXhzWJ6hACVLHuujYIZAQvxI5l26FaziMpipYfV
	 E4hbrlgSnTpIg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 01/18] libceph: Rename hmac_sha256() to ceph_hmac_sha256()
Date: Wed, 25 Jun 2025 00:08:02 -0700
Message-ID: <20250625070819.1496119-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250625070819.1496119-1-ebiggers@kernel.org>
References: <20250625070819.1496119-1-ebiggers@kernel.org>
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

Rename hmac_sha256() to ceph_hmac_sha256(), to avoid a naming conflict
with the upcoming hmac_sha256() library function.

This code will be able to use the HMAC-SHA256 library, but that's left
for a later commit.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 net/ceph/messenger_v2.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/net/ceph/messenger_v2.c b/net/ceph/messenger_v2.c
index bd608ffa06279..5483b4eed94e1 100644
--- a/net/ceph/messenger_v2.c
+++ b/net/ceph/messenger_v2.c
@@ -791,12 +791,12 @@ static int setup_crypto(struct ceph_connection *con,
 	       con_secret + CEPH_GCM_KEY_LEN + CEPH_GCM_IV_LEN,
 	       CEPH_GCM_IV_LEN);
 	return 0;  /* auth_x, secure mode */
 }
 
-static int hmac_sha256(struct ceph_connection *con, const struct kvec *kvecs,
-		       int kvec_cnt, u8 *hmac)
+static int ceph_hmac_sha256(struct ceph_connection *con,
+			    const struct kvec *kvecs, int kvec_cnt, u8 *hmac)
 {
 	SHASH_DESC_ON_STACK(desc, con->v2.hmac_tfm);  /* tfm arg is ignored */
 	int ret;
 	int i;
 
@@ -1460,12 +1460,12 @@ static int prepare_auth_signature(struct ceph_connection *con)
 	buf = alloc_conn_buf(con, head_onwire_len(SHA256_DIGEST_SIZE,
 						  con_secure(con)));
 	if (!buf)
 		return -ENOMEM;
 
-	ret = hmac_sha256(con, con->v2.in_sign_kvecs, con->v2.in_sign_kvec_cnt,
-			  CTRL_BODY(buf));
+	ret = ceph_hmac_sha256(con, con->v2.in_sign_kvecs,
+			       con->v2.in_sign_kvec_cnt, CTRL_BODY(buf));
 	if (ret)
 		return ret;
 
 	return prepare_control(con, FRAME_TAG_AUTH_SIGNATURE, buf,
 			       SHA256_DIGEST_SIZE);
@@ -2458,12 +2458,12 @@ static int process_auth_signature(struct ceph_connection *con,
 	if (con->state != CEPH_CON_S_V2_AUTH_SIGNATURE) {
 		con->error_msg = "protocol error, unexpected auth_signature";
 		return -EINVAL;
 	}
 
-	ret = hmac_sha256(con, con->v2.out_sign_kvecs,
-			  con->v2.out_sign_kvec_cnt, hmac);
+	ret = ceph_hmac_sha256(con, con->v2.out_sign_kvecs,
+			       con->v2.out_sign_kvec_cnt, hmac);
 	if (ret)
 		return ret;
 
 	ceph_decode_need(&p, end, SHA256_DIGEST_SIZE, bad);
 	if (crypto_memneq(p, hmac, SHA256_DIGEST_SIZE)) {
-- 
2.50.0


