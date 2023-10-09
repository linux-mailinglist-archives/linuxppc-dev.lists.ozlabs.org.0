Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0217BECE0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 23:20:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AR02btZ4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4Bkm5xXQz3cl3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 08:20:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AR02btZ4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4Bjs0dsHz300f
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 08:19:13 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 10131B81719;
	Mon,  9 Oct 2023 21:19:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1D85C433C8;
	Mon,  9 Oct 2023 21:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696886348;
	bh=TSGItzmReuXxWm++8av4ew2EUzZA35IjrSGdiAa7ie8=;
	h=From:To:Cc:Subject:Date:From;
	b=AR02btZ4mgp9dab3ACYI6igrBGiVFEQdmNWNcxHdD8UJq1EhYHaLIGjb3Cwv4s+g+
	 mmathlc5Veu0bcn46YVnxKQY9ABGfLimELcNw0klUlNtKHXpOmX5SgqRxTUCkLFS3o
	 ZS0Ueu7JemOZJOGzANL0FRGqVPg0BpVr9dfyhsQ5nDwbUv63LLomoFEIvX/7i3O4Bj
	 U55wVSdhQ8c2iMBNqigs0yUvbVUtg7hwnPp/Vnt3CUqJhGNKIVOsAVmLVPmdhMkwyJ
	 uLzJxnSI5zcAdgJpatcdE4e1r1jp90wyIblBOJG7uZmhXO5MwaO5T8h/WirbhImG9y
	 IaGxkq1DM1dMw==
From: Arnd Bergmann <arnd@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/9] video: screen_info cleanups
Date: Mon,  9 Oct 2023 23:18:36 +0200
Message-Id: <20231009211845.3136536-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Dave Hansen <dave.hansen@linux.intel.com>, Russell King <linux@armlinux.org.uk>, Max Filippov <jcmvbkbc@gmail.com>, Will Deacon <will@kernel.org>, linux-efi@vger.kernel.org, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, "K. Y. Srinivasan" <kys@microsoft.com>, David Airlie <airlied@gmail.com>, Ard Biesheuvel <ardb@kernel.org>, Wei Liu <wei.liu@kernel.org>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Dexuan Cui <decui@microsoft.com>, Javier Martinez Canillas <javierm@redhat.com>, Deepak Rawat <drawat.floss@gmail.com>, Ingo Molnar <mingo@redhat.com>, Matt Turner <mattst88@gmail.com>, linux-mips@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Haiyang Zhang <haiyangz@microsoft.co
 m>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Khalid Aziz <khalid@gonehiking.org>, Brian Cain <bcain@quicinc.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Daniel Vetter <daniel@ffwll.ch>, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

v3 changelog

No real changes, just rebased for context changes, and picked up the Acks.

This now conflicts with the ia64 removal and introduces one new dependency
on IA64, but that is harmless and trivial to deal with later.

Link: https://lore.kernel.org/lkml/20230719123944.3438363-1-arnd@kernel.org/
---
v2 changelog

I refreshed the first four patches that I sent before with very minor
updates, and then added some more to further disaggregate the use
of screen_info:

 - I found that powerpc wasn't using vga16fb any more

 - vgacon can be almost entirely separated from the global
   screen_info, except on x86

 - similarly, the EFI framebuffer initialization can be
   kept separate, except on x86.

I did extensive build testing on arm/arm64/x86 and the normal built bot
testing for the other architectures.

Which tree should this get merged through?

Link: https://lore.kernel.org/lkml/20230707095415.1449376-1-arnd@kernel.org/


Arnd Bergmann (9):
  vgacon: rework Kconfig dependencies
  vgacon: rework screen_info #ifdef checks
  dummycon: limit Arm console size hack to footbridge
  vgacon, arch/*: remove unused screen_info definitions
  vgacon: remove screen_info dependency
  vgacon: clean up global screen_info instances
  vga16fb: drop powerpc support
  hyperv: avoid dependency on screen_info
  efi: move screen_info into efi init code

 arch/alpha/kernel/proto.h                     |  2 +
 arch/alpha/kernel/setup.c                     |  8 +--
 arch/alpha/kernel/sys_sio.c                   |  8 ++-
 arch/arm/include/asm/setup.h                  |  5 ++
 arch/arm/kernel/atags_parse.c                 | 20 +++---
 arch/arm/kernel/efi.c                         |  6 --
 arch/arm/kernel/setup.c                       | 11 +--
 arch/arm64/kernel/efi.c                       |  4 --
 arch/arm64/kernel/image-vars.h                |  2 +
 arch/csky/kernel/setup.c                      | 12 ----
 arch/hexagon/kernel/Makefile                  |  2 -
 arch/hexagon/kernel/screen_info.c             |  3 -
 arch/ia64/kernel/setup.c                      | 53 ++++++++-------
 arch/loongarch/kernel/efi.c                   |  3 +-
 arch/loongarch/kernel/image-vars.h            |  2 +
 arch/loongarch/kernel/setup.c                 |  3 -
 arch/mips/jazz/setup.c                        |  9 ---
 arch/mips/kernel/setup.c                      | 11 ---
 arch/mips/mti-malta/malta-setup.c             |  4 +-
 arch/mips/sibyte/swarm/setup.c                | 26 ++++---
 arch/mips/sni/setup.c                         | 18 ++---
 arch/nios2/kernel/setup.c                     |  5 --
 arch/powerpc/kernel/setup-common.c            | 16 -----
 arch/riscv/kernel/image-vars.h                |  2 +
 arch/riscv/kernel/setup.c                     | 12 ----
 arch/sh/kernel/setup.c                        |  5 --
 arch/sparc/kernel/setup_32.c                  | 13 ----
 arch/sparc/kernel/setup_64.c                  | 13 ----
 arch/x86/kernel/setup.c                       |  2 +-
 arch/xtensa/kernel/setup.c                    | 12 ----
 drivers/firmware/efi/efi-init.c               | 14 +++-
 drivers/firmware/efi/libstub/efi-stub-entry.c |  8 ++-
 drivers/firmware/pcdp.c                       |  1 -
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c       |  7 +-
 drivers/hv/vmbus_drv.c                        |  6 +-
 drivers/video/console/Kconfig                 | 11 +--
 drivers/video/console/dummycon.c              |  2 +-
 drivers/video/console/vgacon.c                | 68 +++++++++++--------
 drivers/video/fbdev/Kconfig                   |  2 +-
 drivers/video/fbdev/hyperv_fb.c               |  8 +--
 drivers/video/fbdev/vga16fb.c                 |  9 +--
 include/linux/console.h                       |  7 ++
 42 files changed, 183 insertions(+), 252 deletions(-)
 delete mode 100644 arch/hexagon/kernel/screen_info.c

-- 
2.39.2

Cc: "David S. Miller" <davem@davemloft.net>
Cc: "K. Y. Srinivasan" <kys@microsoft.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Brian Cain <bcain@quicinc.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Deepak Rawat <drawat.floss@gmail.com>
Cc: Dexuan Cui <decui@microsoft.com>
Cc: Dinh Nguyen <dinguyen@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Guo Ren <guoren@kernel.org>
Cc: Haiyang Zhang <haiyangz@microsoft.com>
Cc: Helge Deller <deller@gmx.de>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Khalid Aziz <khalid@gonehiking.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Matt Turner <mattst88@gmail.com>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: WANG Xuerui <kernel@xen0n.name>
Cc: Wei Liu <wei.liu@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: x86@kernel.org
Cc: linux-alpha@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-efi@vger.kernel.org
Cc: linux-csky@vger.kernel.org
Cc: linux-hexagon@vger.kernel.org
Cc: linux-ia64@vger.kernel.org
Cc: loongarch@lists.linux.dev
Cc: linux-mips@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-sh@vger.kernel.org
Cc: sparclinux@vger.kernel.org
Cc: linux-hyperv@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org

