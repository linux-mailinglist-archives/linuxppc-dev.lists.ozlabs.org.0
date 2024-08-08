Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4022C94C6C9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 00:09:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gbF7DaBH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wg1Rv1Q54z2xmV
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 08:09:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gbF7DaBH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=gustavoars@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wg1RF0Pyqz2xZK
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2024 08:09:12 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 73642CE1319;
	Thu,  8 Aug 2024 22:09:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C87FAC32782;
	Thu,  8 Aug 2024 22:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723154949;
	bh=icIcJ39Tay+d9YIQF/Wf7xniASP333IDPZk/wyxr3w0=;
	h=Date:From:To:Cc:Subject:From;
	b=gbF7DaBHX2vVnNjwHq5hxp4z+6zAPDIYbuGZuqrawkCbEt31pM+iQ5+zlo5nht8GF
	 AFNHdcQsoP8fWZpd4hNykFJYGPXHkDSSWLaJ4PLzyZahnIK/lysgUvRB5LH5EHC+Y/
	 CxEbspM0RYcUZ09tTN79MpEH+JAh+o6O5D6t7KmYSQGsECeL6N2lJXH0rn9BbeC1NM
	 mBENIKwlHOzjhj2+nsxxDJvDax1iEpwRZPwg316LO+FkwN2WxIJF+cTknEHIopnaw/
	 4TGbcgH5MGRXsPSdGw/jD1ZdYUGQ+qjqudKhDsq0OUB+XDsl0hxSZGpksPXdP5nNfi
	 0/rN7rMr1jZuw==
Date: Thu, 8 Aug 2024 16:09:06 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Haren Myneni <haren@us.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Subject: [PATCH][next] crypto: nx - Use static_assert() to check struct sizes
Message-ID: <ZrVCAqGrl+5prW1Y@cute>
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

Commit 1e6b251ce175 ("crypto: nx - Avoid -Wflex-array-member-not-at-end
warning") introduced tagged `struct nx842_crypto_header_hdr`. We want
to ensure that when new members need to be added to the flexible
structure, they are always included within this tagged struct.

So, we use `static_assert()` to ensure that the memory layout for
both the flexible structure and the tagged struct is the same after
any changes.

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/crypto/nx/nx-842.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/crypto/nx/nx-842.h b/drivers/crypto/nx/nx-842.h
index 25fa70b2112c..887d4ce3cb49 100644
--- a/drivers/crypto/nx/nx-842.h
+++ b/drivers/crypto/nx/nx-842.h
@@ -157,6 +157,7 @@ struct nx842_crypto_header_group {
 } __packed;
 
 struct nx842_crypto_header {
+	/* New members MUST be added within the struct_group() macro below. */
 	struct_group_tagged(nx842_crypto_header_hdr, hdr,
 		__be16 magic;		/* NX842_CRYPTO_MAGIC */
 		__be16 ignore;		/* decompressed end bytes to ignore */
@@ -164,6 +165,8 @@ struct nx842_crypto_header {
 	);
 	struct nx842_crypto_header_group group[];
 } __packed;
+static_assert(offsetof(struct nx842_crypto_header, group) == sizeof(struct nx842_crypto_header_hdr),
+	      "struct member likely outside of struct_group_tagged()");
 
 #define NX842_CRYPTO_GROUP_MAX	(0x20)
 
-- 
2.34.1

