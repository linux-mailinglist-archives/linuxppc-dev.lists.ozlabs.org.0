Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 849BB16B5F8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 00:45:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RJbD5XY2zDqB0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 10:45:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RJHb49BlzDq8X
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 10:31:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=EKKOQ3bB; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 48RJHb2wbvz9sRN; Tue, 25 Feb 2020 10:31:55 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48RJHb119Pz9sRJ; Tue, 25 Feb 2020 10:31:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1582587115;
 bh=wp7h+M9HoWPZWX7BCN8CXFDtNUVtpljsdviaDf+1Kxc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EKKOQ3bBR579xJqEBl/dcm8Lo0JAAfVJCLJiISuRwB6rKkWsE16irKWVwZFJKpW7f
 dW8loKpixifSmErEyk0BBbBNyfapCU9qUK31/Alx4ZVD9hdXnEdZs5CCAB0rGuhBeU
 iKAhV4binLoYtdBAbmSfEejadC8YT3Xpw9Dr5HnOXkPv3DaRti0F5Y2oc1pebAw289
 FR0XU8M+zxb7qVx2fS9Vcn2oPv2FBPAAoq/P17v6hIhJOIvgXz3UsgMUJWjqKeva4t
 1yGKMcZgORwTRwXiDR2sm2XaE2epW3jwTifecU0vFFVSS13sABNcBeajc7Lx8exqUS
 fKg4EFwyck21Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 7/8] powerpc: Update powermac MAINTAINERS entry
Date: Tue, 25 Feb 2020 10:31:45 +1100
Message-Id: <20200224233146.23734-7-mpe@ellerman.id.au>
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

Ben is no longer actively maintaining the powermac code, but we know
where to find him if something really needs attention.

The www.penguinppc.org link is dead so remove it.

Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a46e19aadcbc..febffee28d00 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9594,9 +9594,8 @@ F:	include/uapi/linux/lightnvm.h
 
 LINUX FOR POWER MACINTOSH
 M:	Benjamin Herrenschmidt <benh@kernel.crashing.org>
-W:	http://www.penguinppc.org/
 L:	linuxppc-dev@lists.ozlabs.org
-S:	Maintained
+S:	Odd Fixes
 F:	arch/powerpc/platforms/powermac/
 F:	drivers/macintosh/
 
-- 
2.21.1

