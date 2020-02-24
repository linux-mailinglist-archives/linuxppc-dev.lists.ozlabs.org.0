Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE6F16B5EB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 00:43:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RJY64BGDzDqKj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 10:43:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RJHZ1vfpzDqB0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 10:31:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=aDw4Utfh; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 48RJHY6nxXz9sRl; Tue, 25 Feb 2020 10:31:53 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48RJHY3J95z9sQx; Tue, 25 Feb 2020 10:31:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1582587113;
 bh=eU9PRGdwkqGR+XaxfNgvc4i2nXKN+QYEl3ouFzBRDbU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aDw4UtfhFG6qv243lzcRBOUEyawDqK8JQT0PoAmzWj2xLYda6U2gHJTQJxFZw5+af
 Ob0oWDBa4owzV9XVP4vVbJDMY5uVniDVn8wiVmZXD1aVlx0INVZhEWVsXFeeC5lKoP
 KQE9Mo0HkNJp7E7mGwcahgz0vvsjnrvF6t6YVjYbCfmjAVktC4DqfaT6zpjdONjT4r
 bbLrhNNurvRv8QiU/38xvRwgECTZoq7WDnu7BN3AVVlMO0Tjx/WzWYR1Gnoy6u57z1
 gL+NVpCoTyoM71QhSqBjsavrqbig+hbjJH1pK3vDVfBK3L8ZwxpH0/KGzXhfeXOpQz
 45SQ7Lzyjd6pw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 6/8] powerpc: Update MPC5XXX MAINTAINERS entry
Date: Tue, 25 Feb 2020 10:31:44 +1100
Message-Id: <20200224233146.23734-6-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200224233146.23734-1-mpe@ellerman.id.au>
References: <20200224233146.23734-1-mpe@ellerman.id.au>
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
Cc: Anatolij Gustschin <agust@denx.de>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It's several years since the last commit from Anatolij, so mark
MPC5XXX as "Odd Fixes" rather than "Maintained".

Also the git link no longer works so remove it.

Cc: Anatolij Gustschin <agust@denx.de>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d5db5cac5a39..a46e19aadcbc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9639,8 +9639,7 @@ N:	pseries
 LINUX FOR POWERPC EMBEDDED MPC5XXX
 M:	Anatolij Gustschin <agust@denx.de>
 L:	linuxppc-dev@lists.ozlabs.org
-T:	git git://git.denx.de/linux-denx-agust.git
-S:	Maintained
+S:	Odd Fixes
 F:	arch/powerpc/platforms/512x/
 F:	arch/powerpc/platforms/52xx/
 
-- 
2.21.1

