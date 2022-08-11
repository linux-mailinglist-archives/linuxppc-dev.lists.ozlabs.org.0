Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D3C590238
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Aug 2022 18:07:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M3Wsq26Bsz3c6q
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Aug 2022 02:07:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s/nq0Mf/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s/nq0Mf/;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M3WsF3WMlz2xrj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Aug 2022 02:06:57 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DFE9FB821A0;
	Thu, 11 Aug 2022 16:06:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61860C433C1;
	Thu, 11 Aug 2022 16:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660234014;
	bh=uKwMLGgnt8uS0p5ebOQ23qe32Pedis/Xf8xFcNBy+Dg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s/nq0Mf/2N5Kvhj2/KUv3OpuxIDDJm7aHpK9+Mg3bwUydzDTyUZh7vXQ8Zfh7qDKf
	 pTsxidSMjmQiBHAofJq37J5SgTHBJcK0KhBMJLoWB9HUqTplJon45IvmzansyUHZLf
	 YCsjQQ90/7xFBkERfswx95URVs26OMJw0gtjHThq6evsvh86OxBaPTD5v4gPLF+7bB
	 5UYq+6jJaCloN0mA0b49I64O3bCETpws3v7IvqZT8DWSxQ05u/i70CszpORdRyzvRk
	 6DUu+LjI14TVmatJbk1ueUk6gd63WgfMCN7XtrgnNweWtGK2C4JIt3/KmUOog9cgwY
	 NsDHVV/4zw+6w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 30/46] crypto: vmx - Fix warning on p8_ghash_alg
Date: Thu, 11 Aug 2022 12:03:54 -0400
Message-Id: <20220811160421.1539956-30-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220811160421.1539956-1-sashal@kernel.org>
References: <20220811160421.1539956-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, nayna@linux.ibm.com, pfsmorigo@gmail.com, linux-crypto@vger.kernel.org, Breno Leitao <leitao@debian.org>, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Herbert Xu <herbert@gondor.apana.org.au>

[ Upstream commit cc8166bfc829043020b5cc3b7cdba02a17d03b6d ]

The compiler complains that p8_ghash_alg isn't declared which is
because the header file aesp8-ppc.h isn't included in ghash.c.
This patch fixes the warning.

Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
Acked-by: Breno Leitao <leitao@debian.org>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/crypto/vmx/ghash.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/crypto/vmx/ghash.c b/drivers/crypto/vmx/ghash.c
index 14807ac2e3b9..e419be7381c9 100644
--- a/drivers/crypto/vmx/ghash.c
+++ b/drivers/crypto/vmx/ghash.c
@@ -23,6 +23,7 @@
 #include <crypto/internal/hash.h>
 #include <crypto/internal/simd.h>
 #include <crypto/b128ops.h>
+#include "aesp8-ppc.h"
 
 void gcm_init_p8(u128 htable[16], const u64 Xi[2]);
 void gcm_gmult_p8(u64 Xi[2], const u128 htable[16]);
-- 
2.35.1

