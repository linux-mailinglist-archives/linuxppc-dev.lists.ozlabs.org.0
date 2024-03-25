Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D84188B238
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 22:02:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FBgTU9iN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3QPD0Z4Fz3vXf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 08:02:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FBgTU9iN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=gustavoars@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3QNW2X9Cz2yt0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 08:02:03 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 61113CE1D5F;
	Mon, 25 Mar 2024 21:02:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E9D7C433F1;
	Mon, 25 Mar 2024 21:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711400519;
	bh=QD9mCtSDgTE2JsbSwKtRCG1cdUsU99jd/s3QwXZpqus=;
	h=Date:From:To:Cc:Subject:From;
	b=FBgTU9iNOaz8qPBzGSWWoDVReoNp0jN5qTpOswGPS4eGm651fe0T54SFbWjY+owWY
	 BpnOpx4XS3msKcfrWN2y9C2nwABMQnB0oQ2GRnZ6E1Sn2bC+UDSi29eWBYaiLP+NiP
	 IeHCPcKrRb3eIokeKlPugwlb57toS3+9YXL3BPxjcQlNszVNqN6A9lrZbHKAF9IPcV
	 SWIibznPWrHgBxhG+vxRdwAcyHW+jgmoM1XrEOI5ooX1PlODH9qJxNGMaztuFaZ8IT
	 flwhznFsFZLp7osHcRoElffSsnQPPEen/7rhBVRT5LnHMwXpyF2+H2RsRPp3MO972S
	 im2fvCsWO6q6Q==
Date: Mon, 25 Mar 2024 15:01:56 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Haren Myneni <haren@us.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Subject: [PATCH][next] crypto/nx: Avoid potential
 -Wflex-array-member-not-at-end warning
Message-ID: <ZgHmRNcR+a4EJX94@neat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-hardening@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-Wflex-array-member-not-at-end is coming in GCC-14, and we are getting
ready to enable it globally.

Use the `__struct_group()` helper to separate the flexible array
from the rest of the members in flexible `struct nx842_crypto_header`,
through tagged `struct nx842_crypto_header_hdr`, and avoid embedding
the flexible-array member in the middle of `struct nx842_crypto_ctx`.

Also, use `container_of()` whenever we need to retrieve a pointer to
the flexible structure.

This code was detected with the help of Coccinelle, and audited and
modified manually.

Link: https://github.com/KSPP/linux/issues/202
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/crypto/nx/nx-842.c |  6 ++++--
 drivers/crypto/nx/nx-842.h | 11 +++++++----
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/nx/nx-842.c b/drivers/crypto/nx/nx-842.c
index 2ab90ec10e61..82214cde2bcd 100644
--- a/drivers/crypto/nx/nx-842.c
+++ b/drivers/crypto/nx/nx-842.c
@@ -251,7 +251,9 @@ int nx842_crypto_compress(struct crypto_tfm *tfm,
 			  u8 *dst, unsigned int *dlen)
 {
 	struct nx842_crypto_ctx *ctx = crypto_tfm_ctx(tfm);
-	struct nx842_crypto_header *hdr = &ctx->header;
+	struct nx842_crypto_header *hdr =
+				container_of(&ctx->header,
+					     struct nx842_crypto_header, hdr);
 	struct nx842_crypto_param p;
 	struct nx842_constraints c = *ctx->driver->constraints;
 	unsigned int groups, hdrsize, h;
@@ -490,7 +492,7 @@ int nx842_crypto_decompress(struct crypto_tfm *tfm,
 	}
 
 	memcpy(&ctx->header, src, hdr_len);
-	hdr = &ctx->header;
+	hdr = container_of(&ctx->header, struct nx842_crypto_header, hdr);
 
 	for (n = 0; n < hdr->groups; n++) {
 		/* ignore applies to last group */
diff --git a/drivers/crypto/nx/nx-842.h b/drivers/crypto/nx/nx-842.h
index 7590bfb24d79..1f42c83d2683 100644
--- a/drivers/crypto/nx/nx-842.h
+++ b/drivers/crypto/nx/nx-842.h
@@ -157,9 +157,12 @@ struct nx842_crypto_header_group {
 } __packed;
 
 struct nx842_crypto_header {
-	__be16 magic;		/* NX842_CRYPTO_MAGIC */
-	__be16 ignore;		/* decompressed end bytes to ignore */
-	u8 groups;		/* total groups in this header */
+	/* New members must be added within the __struct_group() macro below. */
+	__struct_group(nx842_crypto_header_hdr, hdr, __packed,
+		__be16 magic;		/* NX842_CRYPTO_MAGIC */
+		__be16 ignore;		/* decompressed end bytes to ignore */
+		u8 groups;		/* total groups in this header */
+	);
 	struct nx842_crypto_header_group group[];
 } __packed;
 
@@ -171,7 +174,7 @@ struct nx842_crypto_ctx {
 	u8 *wmem;
 	u8 *sbounce, *dbounce;
 
-	struct nx842_crypto_header header;
+	struct nx842_crypto_header_hdr header;
 	struct nx842_crypto_header_group group[NX842_CRYPTO_GROUP_MAX];
 
 	struct nx842_driver *driver;
-- 
2.34.1

