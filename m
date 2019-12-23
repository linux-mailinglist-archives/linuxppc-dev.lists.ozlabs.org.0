Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E3C12968D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Dec 2019 14:35:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47hL2q4S4wzDqMp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 00:35:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=zx2c4.com (client-ip=192.95.5.64; helo=frisell.zx2c4.com;
 envelope-from=jason@zx2c4.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.b="ZzLpjE7U"; 
 dkim-atps=neutral
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47hKyx521HzDqLf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 00:32:23 +1100 (AEDT)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f2bb46f5;
 Mon, 23 Dec 2019 12:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=from:to:cc
 :subject:date:message-id:mime-version:content-type
 :content-transfer-encoding; s=mail; bh=mmYcYH4LHMbEDE4plGTi5YEIo
 M4=; b=ZzLpjE7U0SsNe56JmUu5gMqPyUB/KF/esW1Y6mi0V74n92J0SsHe6Ra0Z
 NV3N0Yute+5hFoRjc1irW89o83BeyxPb9ph830CkmtjJgi4lyKfC/UKfVveCHo6W
 c4g4PrZKrFye+HqTCvuTA7jAZf71BVN8WShgCvayOeGF/qMILKi6Pzh+E8UqCEvJ
 PluzOfT3kjHdSE97ADU3wSVqPDDmCnffPGn1ZUZQDvqEfRl4YcnkXxd2mvhZqD9H
 1P+44O5ZI8mKlLsd3MoPo+r8W93B0Brnj0IHyFf3co4XuLlE/b+1U9N4PKM7LCSS
 qghCpKAHmg/AphSeJs/Ln/FlAan/Q==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 12bd8740
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO); 
 Mon, 23 Dec 2019 12:35:04 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: pauld@redhat.com, longman@redhat.com, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/shared: include correct header for static key
Date: Mon, 23 Dec 2019 14:31:47 +0100
Message-Id: <20191223133147.129983-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Recently, the spinlock implementation grew a static key optimization,
but the jump_label.h header include was left out, leading to build
errors:

linux/arch/powerpc/include/asm/spinlock.h:44:7: error: implicit declaration of function ‘static_branch_unlikely’ [-Werror=implicit-function-declaration]
   44 |  if (!static_branch_unlikely(&shared_processor))

This commit adds the missing header.

Fixes: 656c21d6af5d ("powerpc/shared: Use static key to detect shared processor")
Cc: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 arch/powerpc/include/asm/spinlock.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/include/asm/spinlock.h b/arch/powerpc/include/asm/spinlock.h
index 1b55fc08f853..860228e917dc 100644
--- a/arch/powerpc/include/asm/spinlock.h
+++ b/arch/powerpc/include/asm/spinlock.h
@@ -15,6 +15,7 @@
  *
  * (the type definitions are in asm/spinlock_types.h)
  */
+#include <linux/jump_label.h>
 #include <linux/irqflags.h>
 #ifdef CONFIG_PPC64
 #include <asm/paca.h>
-- 
2.24.1

