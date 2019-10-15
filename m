Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E3679D6D52
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 04:50:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46sg0Z1bdmzDqxB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 13:50:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=ebiggers@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="rc211AtR"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46sftd1pJbzDqv5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2019 13:45:44 +1100 (AEDT)
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6091321835;
 Tue, 15 Oct 2019 02:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571107542;
 bh=b9t/PEM8kykRb6AqiN9m37toQH0deHlrIEKOykM8kG4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rc211AtRPSUzku8e49PNFzwwot4Tm23WfXUPJzqotc/sebJSCvD8cv8IGFH5JrOft
 xAIfmZEcnQRkpsVEbmRyhtgp3Wq4RB95Z3wrpxonzcmMbTH++IXaigcBhd9Fvt3g6t
 r1Wz7POUgM7vuvvLQ9y4WtvuSoAYa5FDv8iG0b/A=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: [PATCH v2 2/3] crypto: powerpc - don't set ivsize for AES-ECB
Date: Mon, 14 Oct 2019 19:45:16 -0700
Message-Id: <20191015024517.52790-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015024517.52790-1-ebiggers@kernel.org>
References: <20191015024517.52790-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Markus Stockhausen <stockhausen@collogia.de>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Eric Biggers <ebiggers@google.com>

Set the ivsize for the "ecb-ppc-spe" algorithm to 0, since ECB mode
doesn't take an IV.

This fixes a failure in the extra crypto self-tests:

	alg: skcipher: ivsize for ecb-ppc-spe (16) doesn't match generic impl (0)

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/powerpc/crypto/aes-spe-glue.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/crypto/aes-spe-glue.c b/arch/powerpc/crypto/aes-spe-glue.c
index 319f1dbb3a70..4189d2644f74 100644
--- a/arch/powerpc/crypto/aes-spe-glue.c
+++ b/arch/powerpc/crypto/aes-spe-glue.c
@@ -415,7 +415,6 @@ static struct crypto_alg aes_algs[] = { {
 		.blkcipher = {
 			.min_keysize		=	AES_MIN_KEY_SIZE,
 			.max_keysize		=	AES_MAX_KEY_SIZE,
-			.ivsize			=	AES_BLOCK_SIZE,
 			.setkey			=	ppc_aes_setkey,
 			.encrypt		=	ppc_ecb_encrypt,
 			.decrypt		=	ppc_ecb_decrypt,
-- 
2.23.0

