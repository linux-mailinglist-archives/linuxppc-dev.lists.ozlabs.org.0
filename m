Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E6647E14
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2019 11:15:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45S5Cb4Vh1zDqQH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2019 19:15:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux-m68k.org
 (client-ip=195.130.137.77; helo=leibniz.telenet-ops.be;
 envelope-from=geert@linux-m68k.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=glider.be
X-Greylist: delayed 373 seconds by postgrey-1.36 at bilbo;
 Mon, 17 Jun 2019 19:13:50 AEST
Received: from leibniz.telenet-ops.be (leibniz.telenet-ops.be [195.130.137.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45S59p6m4HzDqMp
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2019 19:13:49 +1000 (AEST)
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by leibniz.telenet-ops.be (Postfix) with ESMTPS id 45S52L2LbMzMqk7q
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2019 11:07:22 +0200 (CEST)
Received: from ramsan ([84.194.111.163]) by andre.telenet-ops.be with bizsmtp
 id Rl7F2000E3XaVaC01l7FRk; Mon, 17 Jun 2019 11:07:21 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hcnbf-0000nG-Ae; Mon, 17 Jun 2019 11:07:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hcnbf-0002kb-8Q; Mon, 17 Jun 2019 11:07:15 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Geoff Levand <geoff@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] ps3: Use [] to denote a flexible array member
Date: Mon, 17 Jun 2019 11:07:13 +0200
Message-Id: <20190617090713.10532-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Flexible array members should be denoted using [] instead of [0], else
gcc will not warn when they are no longer at the end of the structure.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/powerpc/include/asm/ps3stor.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/ps3stor.h b/arch/powerpc/include/asm/ps3stor.h
index d9f6589bc107bafa..1d8279014f226926 100644
--- a/arch/powerpc/include/asm/ps3stor.h
+++ b/arch/powerpc/include/asm/ps3stor.h
@@ -39,7 +39,7 @@ struct ps3_storage_device {
 	unsigned int num_regions;
 	unsigned long accessible_regions;
 	unsigned int region_idx;		/* first accessible region */
-	struct ps3_storage_region regions[0];	/* Must be last */
+	struct ps3_storage_region regions[];	/* Must be last */
 };
 
 static inline struct ps3_storage_device *to_ps3_storage_device(struct device *dev)
-- 
2.17.1

