Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D1C88D131
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 23:39:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pGx4NCTG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V44Vk6vQdz3vd6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 09:39:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pGx4NCTG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V44Tb3nvjz3vXJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 09:38:43 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D65A8CE246F;
	Tue, 26 Mar 2024 22:38:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C948DC433C7;
	Tue, 26 Mar 2024 22:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711492718;
	bh=SPB6L/ctChhLveaXdYBbCjCt9oobwLX1bdGDBwGOoO0=;
	h=From:To:Cc:Subject:Date:From;
	b=pGx4NCTG2LWhkmyMjnIr7QzormuwKJKb8jduPcvEr9fHh9kO7VEnTBmioJRHspeDT
	 H5YNlaoP6D7Q2ZgNhshKsS/BmV6fY0stqvvKrjUKukKt4t3PljRcdOcYW/I+80sDbg
	 R89SGRiBcBON/LwB2ujoF+tWhQ32eqIRVBcCpCVeYkax6D8uqqRGex5bSxoqmAZeGP
	 jXOGpr6Ob6HCEsFvy948o0gSqCxIS6NpNrU2aJMXy9NSc5Ih2WSgU5M/QN5d0Wk4Em
	 AUaltyTlXALh0GnoMXcZLFVs6K3I9Nov1ese+LhHwPhrOpJpNBoK+83Fr966hvuTK7
	 Zkic1AdBfrkmw==
From: Arnd Bergmann <arnd@kernel.org>
To: llvm@lists.linux.dev
Subject: [PATCH 0/9] enabled -Wformat-truncation for clang
Date: Tue, 26 Mar 2024 23:37:59 +0100
Message-Id: <20240326223825.4084412-1-arnd@kernel.org>
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
Cc: Hannes Reinecke <hare@kernel.org>, Vladimir Oltean <vladimir.oltean@nxp.com>, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>, netdev@vger.kernel.org, Bill Wendling <morbo@google.com>, linux-scsi@vger.kernel.org, Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org, Helge Deller <deller@gmx.de>, linux-input@vger.kernel.org, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Ariel Elior <aelior@marvell.com>, Nicolas Schier <nicolas@fjasle.eu>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-sound@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, Jakub Kicinski <kuba@kernel.org>, platform-driver-x86@vger.kernel.org, Manish Chopra <manishc@marvell.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Saeed Mahameed <saeedm@nvidia.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
 , Nick Desaulniers <ndesaulniers@google.com>, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org, Justin Stitt <justinstitt@google.com>, Johannes Berg <johannes@sipsolutions.net>, alsa-devel@alsa-project.org, Maximilian Luz <luzmaximilian@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

With randconfig build testing, I found only eight files that produce
warnings with clang when -Wformat-truncation is enabled. This means
we can just turn it on by default rather than only enabling it for
"make W=1".

Unfortunately, gcc produces a lot more warnings when the option
is enabled, so it's not yet possible to turn it on both both
compilers.

I hope that the patches can get picked up by platform maintainers
directly, so the final patch can go in later on.

     Arnd

Arnd Bergmann (9):
  fbdev: shmobile: fix snprintf truncation
  enetc: avoid truncating error message
  qed: avoid truncating work queue length
  mlx5: avoid truncating error message
  surface3_power: avoid format string truncation warning
  Input: IMS: fix printf string overflow
  scsi: mylex: fix sysfs buffer lengths
  ALSA: aoa: avoid false-positive format truncation warning
  kbuild: enable -Wformat-truncation on clang

 drivers/input/misc/ims-pcu.c                  |  4 ++--
 drivers/net/ethernet/freescale/enetc/enetc.c  |  2 +-
 .../ethernet/mellanox/mlx5/core/esw/bridge.c  |  2 +-
 drivers/net/ethernet/qlogic/qed/qed_main.c    |  9 ++++---
 drivers/platform/surface/surface3_power.c     |  2 +-
 drivers/scsi/myrb.c                           | 20 ++++++++--------
 drivers/scsi/myrs.c                           | 24 +++++++++----------
 drivers/video/fbdev/sh_mobile_lcdcfb.c        |  2 +-
 scripts/Makefile.extrawarn                    |  2 ++
 sound/aoa/soundbus/i2sbus/core.c              |  2 +-
 10 files changed, 35 insertions(+), 34 deletions(-)

-- 
2.39.2

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Saeed Mahameed <saeedm@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>
Cc: Ariel Elior <aelior@marvell.com>
Cc: Manish Chopra <manishc@marvell.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
Cc: Maximilian Luz <luzmaximilian@gmail.com>
Cc: Hannes Reinecke <hare@kernel.org>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Helge Deller <deller@gmx.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas@fjasle.eu>
Cc: Johannes Berg <johannes@sipsolutions.net>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Bill Wendling <morbo@google.com>
Cc: Justin Stitt <justinstitt@google.com>
Cc: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: netdev@vger.kernel.org
Cc: linux-rdma@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org
Cc: linux-scsi@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kbuild@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: alsa-devel@alsa-project.org
Cc: linux-sound@vger.kernel.org
Cc: llvm@lists.linux.dev

