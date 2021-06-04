Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 401A539BC67
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jun 2021 17:59:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FxS9y0ClDz3bs6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Jun 2021 01:59:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=merlin.20170209 header.b=3bDYYMfH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1234::107; helo=merlin.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=merlin.20170209 header.b=3bDYYMfH; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1234::107])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FxS9R6WpPz2yYK
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Jun 2021 01:58:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Date:Cc:To:Subject:From:References:
 In-Reply-To:Message-Id:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=daDjuKp3v3AZM2+NFJem86trbpyHiWImyVHebGvZ5qw=; b=3bDYYMfHUoAzBYrbGN3kr4YyXq
 X2kKy+ONxz2G98pE0F+mmzafC3/mtRjrhSEi0/whspajM0ETllrVGf7qbfbcaDGxEuwxhp4GzhozH
 pc2w8QHXPytDrKIyItA6eKApCjGsLWI1rgI334FGaqdXDoQMeNrX6CqPBcQ/M5DNeus+feajL0LBl
 HIZW0ZmckChofp7r6ihiVQ7h7qtSXeuZ0HZDjymdoX8189vkNXnb697baoN4IRO2Bq3WDSpSbhwde
 9OmOWcZSEcClWzAeUqEmIaOHIQW5MQHxHsoObmrRnto3oFSa9NVi0ZfhGdpdm5v2k82S/AIQmRix/
 PnvdegBQ==;
Received: from geoff by merlin.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1lpCDJ-001R9M-O6; Fri, 04 Jun 2021 15:58:25 +0000
Message-Id: <245897ed65e402686a4b114ba618e935cb5c6506.1622822173.git.geoff@infradead.org>
In-Reply-To: <cover.1622822173.git.geoff@infradead.org>
References: <cover.1622822173.git.geoff@infradead.org>
From: Geoff Levand <geoff@infradead.org>
Patch-Date: Fri, 4 Jun 2021 08:35:45 -0700
Subject: [PATCH v2 2/2] powerpc/ps3: Re-align DTB in image
To: Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 04 Jun 2021 15:58:25 +0000
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Change the PS3 linker script to align the DTB at 8 bytes,
the same alignment as that of the of the 'generic' powerpc
linker script.

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 arch/powerpc/boot/zImage.ps3.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/boot/zImage.ps3.lds.S b/arch/powerpc/boot/zImage.ps3.lds.S
index 7b2ff2eaa73a..d0ffb493614d 100644
--- a/arch/powerpc/boot/zImage.ps3.lds.S
+++ b/arch/powerpc/boot/zImage.ps3.lds.S
@@ -8,7 +8,7 @@ SECTIONS
   .kernel:vmlinux.bin : { *(.kernel:vmlinux.bin) }
   _vmlinux_end =  .;
 
-  . = ALIGN(4096);
+  . = ALIGN(8);
   _dtb_start = .;
   .kernel:dtb : { *(.kernel:dtb) }
   _dtb_end = .;
-- 
2.25.1

