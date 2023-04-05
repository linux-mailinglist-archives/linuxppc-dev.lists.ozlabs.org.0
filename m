Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 774006D8117
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 17:08:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ps7LN22gVz3bNj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 01:08:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=w8tf3DJb;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=NJtJ5rJL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=w8tf3DJb;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=NJtJ5rJL;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ps7HZ4yVJz3cBk
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 01:06:02 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E984822926;
	Wed,  5 Apr 2023 15:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1680707157; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=g5CNiBMyJmGfOboPN85iL6BEAbMbhCK1z8h/E7PJqO8=;
	b=w8tf3DJbATFS2jgiySieo5lgHacr0/X4t8O83kSm+JjUTN7INy+KEE0c6QKy2YQQEG1D51
	ei/9VshpEuJZ8SmDOnR/EjlVwb3io8xNrPAvyiDEaO/puZewQ0rt7tBgAYItRDRs1brqRE
	qzs1tuAkBaBxL74Ueu6ptbgKfBk5KMI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1680707157;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=g5CNiBMyJmGfOboPN85iL6BEAbMbhCK1z8h/E7PJqO8=;
	b=NJtJ5rJLvESSn/PDRi2v9Tc541wLbJpWwnGJQVN5sUOfOKv49P3yAdDLaj2lKracLovScc
	sc9Vq2L2x0GeLvDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 85CA413A10;
	Wed,  5 Apr 2023 15:05:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id aFHUH1WOLWTPIAAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Wed, 05 Apr 2023 15:05:57 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: arnd@arndb.de,
	daniel.vetter@ffwll.ch,
	deller@gmx.de,
	javierm@redhat.com,
	gregkh@linuxfoundation.org
Subject: [PATCH 00/18] arch: Consolidate <asm/fb.h>
Date: Wed,  5 Apr 2023 17:05:36 +0200
Message-Id: <20230405150554.30540-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Various architectures provide <arm/fb.h> with helpers for fbdev
framebuffer devices. Share the contained code where possible. There
is already <asm-generic/fb.h>, which implements generic (as in
'empty') functions of the fbdev helpers. The header was added in
commit aafe4dbed0bf ("asm-generic: add generic versions of common
headers"), but never used.

Each per-architecture header file declares and/or implements fbdev
helpers and defines a preprocessor token for each. The generic
header then provides the remaining helpers. It works like the I/O
helpers in <asm/io.h>.

For PARISC, the architecture helpers are mixed up with helpers
for the system's STI graphics firmware. We first move the STI code
to appropriate locations under video/ and then move the architecture
helper under arch/parisc.

For Sparc, there's an additional patch that moves the implementation
from the header into a source file. This allows to avoid some include
statements in the header file.

Built on arm, arm64, m68k, mips, parisc, powerpc, sparc and x86.

Thomas Zimmermann (18):
  fbdev: Prepare generic architecture helpers
  arch/arc: Implement <asm/fb.h> with generic helpers
  arch/arm: Implement <asm/fb.h> with generic helpers
  arch/arm64: Implement <asm/fb.h> with generic helpers
  arch/ia64: Implement <asm/fb.h> with generic helpers
  arch/loongarch: Implement <asm/fb.h> with generic helpers
  arch/m68k: Implement <asm/fb.h> with generic helpers
  arch/mips: Implement <asm/fb.h> with generic helpers
  video: Remove trailing whitespaces
  video: Move HP PARISC STI core code to shared location
  arch/parisc: Remove trailing whitespaces
  arch/parisc: Implement fb_is_primary_device() under arch/parisc
  arch/parisc: Implement <asm/fb.h> with generic helpers
  arch/powerpc: Implement <asm/fb.h> with generic helpers
  arch/sh: Implement <asm/fb.h> with generic helpers
  arch/sparc: Implement fb_is_primary_device() in source file
  arch/sparc: Implement <asm/fb.h> with generic helpers
  arch/x86: Implement <asm/fb.h> with generic helpers

 arch/arc/include/asm/fb.h                     |  11 +-
 arch/arm/include/asm/fb.h                     |  10 +-
 arch/arm64/include/asm/fb.h                   |  10 +-
 arch/ia64/include/asm/fb.h                    |  11 +-
 arch/loongarch/include/asm/fb.h               |  10 +-
 arch/m68k/include/asm/fb.h                    |  10 +-
 arch/mips/include/asm/fb.h                    |  10 +-
 arch/parisc/Makefile                          |   4 +-
 arch/parisc/include/asm/fb.h                  |  17 +-
 arch/parisc/video/Makefile                    |   3 +
 arch/parisc/video/fbdev.c                     |  27 +++
 arch/powerpc/include/asm/fb.h                 |   8 +-
 arch/sh/include/asm/fb.h                      |  10 +-
 arch/sparc/Makefile                           |   1 +
 arch/sparc/include/asm/fb.h                   |  30 ++--
 arch/sparc/video/Makefile                     |   3 +
 arch/sparc/video/fbdev.c                      |  24 +++
 arch/x86/include/asm/fb.h                     |  11 +-
 drivers/video/Kconfig                         |   7 +
 drivers/video/Makefile                        |   1 +
 drivers/video/console/Kconfig                 |   1 +
 drivers/video/console/Makefile                |   4 +-
 drivers/video/console/sticon.c                |   6 +-
 drivers/video/fbdev/Kconfig                   |   3 +-
 drivers/video/fbdev/stifb.c                   | 158 +++++++++---------
 drivers/video/{console => }/sticore.c         | 123 ++++++--------
 include/asm-generic/fb.h                      |  20 ++-
 .../video/fbdev => include/video}/sticore.h   |  16 +-
 28 files changed, 297 insertions(+), 252 deletions(-)
 create mode 100644 arch/parisc/video/Makefile
 create mode 100644 arch/parisc/video/fbdev.c
 create mode 100644 arch/sparc/video/Makefile
 create mode 100644 arch/sparc/video/fbdev.c
 rename drivers/video/{console => }/sticore.c (95%)
 rename {drivers/video/fbdev => include/video}/sticore.h (99%)


base-commit: a7180debb9c631375684f4d717466cfb9f238660
-- 
2.40.0

