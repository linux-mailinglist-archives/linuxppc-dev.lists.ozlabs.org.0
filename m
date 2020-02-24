Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1ECB16B5B6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 00:35:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RJMj6CjNzDqWN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 10:35:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RJHT5lZQzDq6Q
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 10:31:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=HJq7+z+Y; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 48RJHT4Lv6z9sPR; Tue, 25 Feb 2020 10:31:49 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48RJHT2jVKz9sRG; Tue, 25 Feb 2020 10:31:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1582587109;
 bh=qAkvkPIb2184/CM7bghWxy4H6X1MMehAVdAaBWnulSc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HJq7+z+Y4dXUOKRfV1sAnSnmjEPJkN9omyF4y9RI0bcVxPFkHbMdNb2ARhO+oLseO
 wHF7L3iO9lc79ThzX4kKY3D0FO2T/pdaD74icIaxqvQDM9TMQ4D24AW+Ojw2+6XrxB
 ek6TGnlL2eOuAORk3XEWZRffU5lvsNBwXB1ICswEIc5TOLda3quw14a9rWHJClBuN7
 mVGN0YSjQj/vRhT0A1yQ5fSuNY3DiN8M4RFk2AxRwFD5AhcD2dU35fm/xY77LPanF4
 r+hzhSyDd5CI1QB//Rj2AVDo1YKt+eIHICqqhLQd4V1tnHReW0womCxGW8D3X6++0m
 3HiXfFGhDKWtg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 2/8] powerpc: Update wiki link in MAINTAINERS
Date: Tue, 25 Feb 2020 10:31:40 +1100
Message-Id: <20200224233146.23734-2-mpe@ellerman.id.au>
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
Cc: linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The wiki has moved, update the link.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 339bc3e53862..435e4efc9a32 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9604,7 +9604,7 @@ LINUX FOR POWERPC (32-BIT AND 64-BIT)
 M:	Michael Ellerman <mpe@ellerman.id.au>
 R:	Benjamin Herrenschmidt <benh@kernel.crashing.org>
 R:	Paul Mackerras <paulus@samba.org>
-W:	https://github.com/linuxppc/linux/wiki
+W:	https://github.com/linuxppc/wiki/wiki
 L:	linuxppc-dev@lists.ozlabs.org
 Q:	http://patchwork.ozlabs.org/project/linuxppc-dev/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
-- 
2.21.1

