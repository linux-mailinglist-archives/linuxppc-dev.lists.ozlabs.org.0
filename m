Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CBBC6E243A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 15:27:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PycgR05D1z3fb7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 23:27:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kuPe2YmV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pyccl1hcjz3cMT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 23:24:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kuPe2YmV;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pycck5tQWz4xFm;
	Fri, 14 Apr 2023 23:24:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1681478694;
	bh=L1Z79eLZbhKIj+Ed7xjuZrmNQ+q+ROM2uGM1hcoDLII=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=kuPe2YmVe9vTbfPrXUq5+k9qtXgDepmWn8JFtokGR215Cqpw652Mw3NZoO9jfHpmx
	 Uc29iCQydYfLeWVI54HJrxm7w96d9bkj9m/AxNaNZl+ld/EvCwYz86ro5Xihc5mdYi
	 xvVtd72pzr8Xzl+dpOCJIT6Q84V9fmMX03YBQGQOUopWr47v2FLza3qTAZpn3bo+O/
	 wn+fIZO3gtWzP2XKQcUSJguWq4fBBDuTSpqxaND0isggZLpbNH4yLPE6e9uWuGaI/f
	 72y40Y2Fj/z24py7/A9zvz0l302VWmWSrR2z4tFvepfRzflonjpTALezRPEa2hQgbz
	 gzvef8GWK8Zew==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 04/32] powerpc/configs/6s: Drop obsolete crypto ALGs
Date: Fri, 14 Apr 2023 23:23:47 +1000
Message-Id: <20230414132415.821564-4-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230414132415.821564-1-mpe@ellerman.id.au>
References: <20230414132415.821564-1-mpe@ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These algorithms were marked obsolete in commit 1674aea5f080 ("crypto:
Kconfig - mark unused ciphers as obsolete").

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/ppc64_defconfig | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index c4f3ce96d924..74477f89c108 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -343,9 +343,6 @@ CONFIG_CRYPTO_HMAC=y
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_SHA256=y
 CONFIG_CRYPTO_WP512=m
-CONFIG_CRYPTO_ANUBIS=m
-CONFIG_CRYPTO_KHAZAD=m
-CONFIG_CRYPTO_TEA=m
 CONFIG_CRYPTO_LZO=m
 CONFIG_CRYPTO_CRC32C_VPMSUM=m
 CONFIG_CRYPTO_MD5_PPC=m
-- 
2.39.2

