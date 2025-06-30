Return-Path: <linuxppc-dev+bounces-9920-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E55AEE390
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 18:09:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bWB1d3VKVz3bV6;
	Tue,  1 Jul 2025 02:09:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751299765;
	cv=none; b=DR3U2r5IBsZonOX6XAHzjzkEdfPcfqxWMayvI0Xc4tiPoyE+kdca/2iXtR/7dM4SE+sUr5+tYQWUGOoWfdvsKopweAD2CQYV5PGdQx6SvDgvbHTLu08BcvkjEprRGWrcAkH2pAJDVGjRMobg15Jb0S/73OneB1aXaRL42m82mE635EhOkCYJLJJGMUMB/j+CHMbmtoOeR2dFlV1Jc54s+7jSBiyAvAavq0bg1vSWe11+UEepXrUtka5EwJvJMO8QYgfTHVTziLzy2qReDGHQQvvhY6SpvHwbRTsxebonwUsekmUnrwiu60wPn7+6ArBWI1HEgmW7mq0JrUV1dgb+yg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751299765; c=relaxed/relaxed;
	bh=kt4sp2VhnIWEOeMcH73t899orOG4QC4oYu9cxkK9Ix8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fWQDh+PKk98eMoIDFuKz4ksg/Ewq4NGzIxIWSjktQ9uri9SuXLGdt6gF5MuysBtdzw0jjUUrYqbbaP69Ro9Le/DFhpRjisIGqbs92lq0efCs8Y612+SW2GL0a368jIwU+ualXtQ1b7b2T7sJExf1jZ070FJQuMqvYQfPf44eaACrc9gQQgdJYtgQ7PgRXExuAiJ1fQj9/TTq8dnnvdmfpvFBgiFFmY0lc1ZKXqCJC2ugTZWTt9yikPapqtPJTUXKeLrBoTO5HXCml2xdgovSMH8eFPBIeK+v3EefxCAQxY9CzfTGvEi/VtIZOK6Hgo9AAlSUvg5PlavjwJekL+AIkA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i1sDTgEL; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i1sDTgEL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bWB1c14fRz2xd4
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jul 2025 02:09:24 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 545B7A4F86A;
	Mon, 30 Jun 2025 16:09:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BAC1C4CEF1;
	Mon, 30 Jun 2025 16:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751299761;
	bh=oP/HTNYTl9LXpDk4PHssqzdxrIaWg9Dc4X7a2efoHe0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i1sDTgELYRSRNAFZVOP1NxIWH+kNYmHvowh3XGVDACcMSCP75QQyHveAF+wOTzgst
	 bFgOJEykz/D+oYZczddK0gK0qHnZKTS3SdS+6yNsW99rAfIg7ExwcjIc629lG8uUzP
	 6RXbIgB0Lnq7FEpxdAwuJhnZsIxN1JnlOiPjIAhce93Tzmp0yCX5ze/tBjdO9hEM93
	 5It48cSTjDq/iAFNIdf91pghNIg9JiVU9THkutS5boFEIvhgmKf0YpmHF2ztLN5r8o
	 j+IAjk5UtyQtYisGd3wBItTS2GoyKfYlW/lLBDrXq+RrsTLZZMh9UJ5AHTpPPhc3H7
	 WnO7/m1FYmYwA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 01/14] libceph: Rename hmac_sha256() to ceph_hmac_sha256()
Date: Mon, 30 Jun 2025 09:06:32 -0700
Message-ID: <20250630160645.3198-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250630160645.3198-1-ebiggers@kernel.org>
References: <20250630160645.3198-1-ebiggers@kernel.org>
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
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
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


