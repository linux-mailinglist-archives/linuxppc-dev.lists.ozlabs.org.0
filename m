Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E95D634E3B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 04:17:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NH5s51GWbz2xGv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 14:17:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=GZ2/OsZp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=GZ2/OsZp;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NH5r56QKVz2xGv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Nov 2022 14:16:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=XplI+geP46DYtWKfitoXrwKXFvO9E8ewRJGSG7yitzM=; b=GZ2/OsZp+Fy3h9ep3ygIVEgC88
	fW9vkQjgEXLFIxHH92x5HX4AEvdufiaxtG+ylyJFXqyHpHKuBKz+HOjEy+H/B3WDXvJ3PSmS20AWk
	Ezefu5K4MHaRICK6ZOVkuHcqVw6mm6jgNygD+Ks47tlreyn7EwQ+0gVBDY/0g+ZufZr0+MOavYXL3
	uvEE28zbcgtKOnkr5eTCSlwgjEiH7cOz6t8q1CijBSLXuTHu5w+4PoXQF/WDm0fww4JJv8JZzvN7U
	tm8jP0Tc3v5s/2LziH178aNzWl09w4LTr/LbzHkE0QDaeIMfx1Q5ZDHXzkDQEEqmB9wZydflEbJ0J
	Gx6gsAsg==;
Received: from [2601:1c2:d80:3110::a2e7] (helo=casper.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxgFF-0073HC-FQ; Wed, 23 Nov 2022 03:16:17 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH -next] fbdev: offb: allow build when DRM_OFDRM=m
Date: Tue, 22 Nov 2022 19:16:05 -0800
Message-Id: <20221123031605.16680-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.38.1
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, Masahiro Yamada <masahiroy@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org, Helge Deller <deller@gmx.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix build when CONFIG_FB_OF=y and CONFIG_DRM_OFDRM=m.
When the latter symbol is =m, kconfig downgrades (limits) the 'select's
under FB_OF to modular (=m). This causes undefined symbol references:

powerpc64-linux-ld: drivers/video/fbdev/offb.o:(.data.rel.ro+0x58): undefined reference to `cfb_fillrect'
powerpc64-linux-ld: drivers/video/fbdev/offb.o:(.data.rel.ro+0x60): undefined reference to `cfb_copyarea'
powerpc64-linux-ld: drivers/video/fbdev/offb.o:(.data.rel.ro+0x68): undefined reference to `cfb_imageblit'

Fix this by allowing FB_OF any time that DRM_OFDRM != y so that the
selected FB_CFB_* symbols will become =y instead of =m.

In tristate logic (for DRM_OFDRM), this changes the dependency from
    !DRM_OFDRM	== 2 - 1 == 1 => modular only (or disabled)
to (boolean)
    DRM_OFDRM != y == y, allowing the 'select's to cause the
FB_CFB_* symbols to =y instead of =m.

Fixes: c8a17756c425 ("drm/ofdrm: Add ofdrm for Open Firmware framebuffers")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Michal Suchánek <msuchanek@suse.de>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/video/fbdev/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -- a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -455,7 +455,7 @@ config FB_ATARI
 config FB_OF
 	bool "Open Firmware frame buffer device support"
 	depends on (FB = y) && PPC && (!PPC_PSERIES || PCI)
-	depends on !DRM_OFDRM
+	depends on DRM_OFDRM != y
 	select APERTURE_HELPERS
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
