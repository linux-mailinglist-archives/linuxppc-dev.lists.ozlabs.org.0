Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1041563927D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 01:05:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NJsST6vv7z3f7R
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 11:05:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=EsUHG75+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NJsRH74Qzz3f4J
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Nov 2022 11:04:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=fCEpozuQZzSMlmSX68RJLiCk4zrpL6chfzTq9T/Cx5k=; b=EsUHG75+oID3GB27Y6g35LNJqk
	uHV7H16V2AyNE9Jjrx5LcQPqA/7lRSatnFyjSsmv79n+xloLV5EdP5ct+xZ8ruRygleiDumHWKfzK
	S+rH5/exa9VjcJqkwLGnH5bXeUy2Ml//sDH2MHlDC/gr7vmLxer2HPFg8MXv0UNcqlpjPLnuXG6r7
	7fSvb5ynnF2yi9bVA3b4w+xqb27ZKPhojSap/CmdWytflOHw1QyNS2X8mSUzNBne+FEZPapvec5ZE
	dVG2zaTgtidnqvc9J5awYuFTWkQ10LI6xLfBytJmpKoTvn4L6ytYKPXLHHkIXFvDSUoAb3Lru3zad
	ll2nv8yA==;
Received: from [2601:1c2:d80:3110::a2e7] (helo=casper.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyig1-00A0ud-R3; Sat, 26 Nov 2022 00:04:14 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] fbdev: make offb driver tristate
Date: Fri, 25 Nov 2022 16:04:01 -0800
Message-Id: <20221126000401.25302-1-rdunlap@infradead.org>
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <masahiroy@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>, =?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org, Helge Deller <deller@gmx.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Make the offb (Open Firmware frame buffer) driver tristate,
i.e., so that it can be built as a loadable module.

However, it still depends on the setting of DRM_OFDRM
so that both of these drivers cannot be builtin at the same time
nor can one be builtin and the other one a loadable module.

Build-tested successfully with all combination of DRM_OFDRM and FB_OF.

This fixes a build issue that Michal reported when FB_OF=y and
DRM_OFDRM=m:

powerpc64-linux-ld: drivers/video/fbdev/offb.o:(.data.rel.ro+0x58): undefined reference to `cfb_fillrect'
powerpc64-linux-ld: drivers/video/fbdev/offb.o:(.data.rel.ro+0x60): undefined reference to `cfb_copyarea'
powerpc64-linux-ld: drivers/video/fbdev/offb.o:(.data.rel.ro+0x68): undefined reference to `cfb_imageblit'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Michal Suchánek <msuchanek@suse.de>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org

---
 drivers/video/fbdev/Kconfig |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -- a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -456,8 +456,8 @@ config FB_ATARI
 	  chipset found in Ataris.
 
 config FB_OF
-	bool "Open Firmware frame buffer device support"
-	depends on (FB = y) && PPC && (!PPC_PSERIES || PCI)
+	tristate "Open Firmware frame buffer device support"
+	depends on FB && PPC && (!PPC_PSERIES || PCI)
 	depends on !DRM_OFDRM
 	select APERTURE_HELPERS
 	select FB_CFB_FILLRECT
