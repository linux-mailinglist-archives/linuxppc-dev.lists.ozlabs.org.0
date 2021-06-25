Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A1B3B3BD3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 06:54:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GB4R20qsNz3c0C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 14:54:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=k4z+F3x9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=k4z+F3x9; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GB4Qb5nf6z2yxX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Jun 2021 14:53:43 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GB4QZ4yYJz9sWw; Fri, 25 Jun 2021 14:53:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1624596822;
 bh=dEupDSAwuPNMCZzUvYkQRGZAyHhg5WOzxnq46XgZLJs=;
 h=From:To:Cc:Subject:Date:From;
 b=k4z+F3x925zCX1m1y0XokZzls0op/wWzy6l7OBqWLg61sS2QB8qMT+zu2YCjcxvZ1
 LpSH91Q2KadxW5+FJAF4O/c3Z3GlhXuwU3KGqmJo5XK2zjSRgRKou73rdMtud/2nPz
 R2g2b3AGXOTvOvQVV6TAFHsBP65F1MIfuZR45I/8MueGTPeGOFc3DYW+rz0VhMYmhU
 O2/AcouJ3SvKMfdymRKc+fsw/8a56FIZOIpKvkpGt88H3Djra1NoFQcadMK1ikKK0c
 iV8gYldVsD0smZErroIG+As4P+eqwdAsnJYYOB4hj/DGIe6E47Be4OjE8dBudXWgoF
 XUdlg3hUO+Tig==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/pseries/vas: Include irqdomain.h
Date: Fri, 25 Jun 2021 14:53:37 +1000
Message-Id: <20210625045337.3197833-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
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
Cc: sfr@canb.auug.org.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are patches in flight to break the dependency between asm/irq.h
and linux/irqdomain.h, which would break compilation of vas.c because it
needs the declaration of irq_create_mapping() etc.

So add an explicit include of irqdomain.h to avoid that becoming a
problem in future.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/pseries/vas.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index 3385b5400cc6..b5c1cf1bc64d 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -12,6 +12,7 @@
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/interrupt.h>
+#include <linux/irqdomain.h>
 #include <asm/machdep.h>
 #include <asm/hvcall.h>
 #include <asm/plpar_wrappers.h>
-- 
2.25.1

