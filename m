Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFBE34563E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 04:28:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4Gzc2ZWYz30Gp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 14:28:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=evWkzPLo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=evWkzPLo; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4GxS2cNwz30CG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 14:26:36 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4F4GxR6y4kz9sWC; Tue, 23 Mar 2021 14:26:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1616469995;
 bh=oCVP83reXY5CqSeSdxhQL70bGsRVlM/e497ho1J4FF0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=evWkzPLotTXfeJJL/8pnTrk8j8+qXOmddh2ne8LPYkfGrMGwSlUXdULaaK/PVBVcx
 CYrmvJ9fcvJ/hPoJcEU4qBaEznNIAPRwkLfVlfBujIXY4Pwck8bJ3mcK+r3TRFxRYY
 8wndNrheP07HpfMNnudVOD+F91Q2DbrZUPS28byCGw/PjLRPThqzXCLELjn9rx4umD
 rrPlmwqrJLSIfenfHGnqrxbXlz7Kg1CO9gXFa1dfX1f/TuqnBXYfn1iyEnfS4YCfTk
 gkEN5Jqh9yk0outp6JXC/6gIV41Mmv04OXXlAfknXnnZVt3Wt/pKm77G/Hc6QohybM
 /HeMcQz0LlD9Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: rust-for-linux@vger.kernel.org
Subject: [PATCH 4/4] rust: Enable for ppc64le
Date: Tue, 23 Mar 2021 14:26:24 +1100
Message-Id: <20210323032624.1039422-5-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210323032624.1039422-1-mpe@ellerman.id.au>
References: <20210323032624.1039422-1-mpe@ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

All the pieces are in place now for us to enable building rust support
on ppc64le.

Only works with clang for now.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 init/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/init/Kconfig b/init/Kconfig
index d73ac9de186d..ddc2fda1a22c 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -58,7 +58,7 @@ config LLD_VERSION
 	default 0
 
 config HAS_RUST
-	depends on ARM64 || X86_64
+	depends on ARM64 || X86_64 || (PPC64 && CPU_LITTLE_ENDIAN && CC_IS_CLANG)
 	def_bool $(success,$(RUSTC) --version)
 
 config RUSTC_VERSION
-- 
2.25.1

