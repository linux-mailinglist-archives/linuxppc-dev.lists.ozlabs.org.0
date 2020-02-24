Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1344C16B5A8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 00:33:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RJKm4dBgzDqTg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 10:33:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RJHS4Gn6zDq6Q
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 10:31:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=OlLvd/kh; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 48RJHS2tbYz9sPR; Tue, 25 Feb 2020 10:31:48 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48RJHS1d3Gz9sQt; Tue, 25 Feb 2020 10:31:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1582587108;
 bh=dgwevY/cbVBUKvHBjKo8eRwTGaVpoR07XLgC87drZAs=;
 h=From:To:Cc:Subject:Date:From;
 b=OlLvd/khE22BvAY7FkF1axztd0x6G5QdCblYJx6mhD2FFaXz0Nte1soEfRJvZmUUB
 Tcsm8tmBQq8uY0+8acHI97OQMBfj3nMij37tUBjUUus30ciwBaOCXWNbFltiiZ4fGG
 Itdx7yFMSQb6CwFonqg7wvSKQxqM3W0G0kyoBPrP+IONe8JP+Mj1fcKjHCz3S2Tg+2
 1Nz8t5vLXwmctNMU+Jms2l99/b5nxQ5fBAQJES5+Bcv4QkfNbv2dO/cNXrcJIdLX5C
 OfTMOGfqriVzjaL2WDwrJn72xlGK6AzExIMDEQD9wj8K+bfDNTf8HQAKwRmWdAPAry
 jXRTDNk+j8V4g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 1/8] powerpc: Update MAINTAINERS
Date: Tue, 25 Feb 2020 10:31:39 +1100
Message-Id: <20200224233146.23734-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.21.1
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
Cc: Paul Mackerras <paulus@samba.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A while back Paul pointed out I'd been maintaining the tree more or
less solo for over five years, so perhaps it's time to update the
MAINTAINERS entry.

Ben & Paul still wrote most of the code, so keep them as Reviewers so
they still get Cc'ed on things. But if you're wondering why your patch
hasn't been merged that's my fault.

Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fcd79fc38928..339bc3e53862 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9601,9 +9601,9 @@ F:	arch/powerpc/platforms/powermac/
 F:	drivers/macintosh/
 
 LINUX FOR POWERPC (32-BIT AND 64-BIT)
-M:	Benjamin Herrenschmidt <benh@kernel.crashing.org>
-M:	Paul Mackerras <paulus@samba.org>
 M:	Michael Ellerman <mpe@ellerman.id.au>
+R:	Benjamin Herrenschmidt <benh@kernel.crashing.org>
+R:	Paul Mackerras <paulus@samba.org>
 W:	https://github.com/linuxppc/linux/wiki
 L:	linuxppc-dev@lists.ozlabs.org
 Q:	http://patchwork.ozlabs.org/project/linuxppc-dev/list/
-- 
2.21.1

