Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 152896C770E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 06:23:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PjVxB68qmz3fQm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 16:23:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YOWAF5Y1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YOWAF5Y1;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PjVwH4PGkz3cL0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 16:22:55 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CAB0A628FA;
	Fri, 24 Mar 2023 05:22:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64C8CC433EF;
	Fri, 24 Mar 2023 05:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679635371;
	bh=Ul9NMDRbV5/iHtQYX/zkoya3pbJ4hQPwrl+Sd+puRWI=;
	h=From:To:Cc:Subject:Date:From;
	b=YOWAF5Y1n8xRwZo2KFiamdRjZ5Oymm9pNTVZmvxTLEFtRjiGJyX5bQpJPH2G9ZyBj
	 9FJ172ZeQRFnBYVo+m+Sk467H7SJngn6UJDNA6Hp0T+FhNpzS3Z/SBhMOAb08YvDFK
	 G1nbyBtY3Mbn2dDIpGrttvt6YQNyfrPUJXUnUkt1rWguFh2rP4Y0uYD1vzMRq8GlsO
	 JoC0PzPKD2eM6JTUL/CSvgorUZA+UvV7RPxB50cbcRe2Ndltsssf4lqzcLkM5ie6Zz
	 IXZV+vfMatPhD9mjywHGL31LsJqFG+UXBf9UXk1Ogya/h0oVDQ6yJom51rXxP32azh
	 Bzma2/bTVTMpw==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 00/14] arch,mm: cleanup Kconfig entries for ARCH_FORCE_MAX_ORDER
Date: Fri, 24 Mar 2023 08:22:19 +0300
Message-Id: <20230324052233.2654090-1-rppt@kernel.org>
X-Mailer: git-send-email 2.35.1
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Zi Yan <ziy@nvidia.com>, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Mike Rapoport (IBM)" <rppt@kernel.org>

Hi,

Several architectures have ARCH_FORCE_MAX_ORDER in their Kconfig and
they all have wrong and misleading prompt and help text for this option.

Besides, some define insane limits for possible values of
ARCH_FORCE_MAX_ORDER, some carefully define ranges only for a subset of
possible configurations, some make this option configurable by users for no
good reason.

This set updates the prompt and help text everywhere and does its best to
update actual definitions of ranges where applicable.

kbuild generated a bunch of false positives because it assigns -1 to
ARCH_FORCE_MAX_ORDER, hopefully this will be fixed soon.

v2:
* arm64: show prompt for ARCH_FORCE_MAX_ORDER only if EXPERT (Catalin)
* Add Acked- and Reviewed-by tags (thanks Geert, Kirill and Max)

v1: https://lore.kernel.org/all/20230323092156.2545741-1-rppt@kernel.org

Mike Rapoport (IBM) (14):
  arm: reword ARCH_FORCE_MAX_ORDER prompt and help text
  arm64: drop ranges in definition of ARCH_FORCE_MAX_ORDER
  arm64: reword ARCH_FORCE_MAX_ORDER prompt and help text
  csky: drop ARCH_FORCE_MAX_ORDER
  ia64: don't allow users to override ARCH_FORCE_MAX_ORDER
  m68k: reword ARCH_FORCE_MAX_ORDER prompt and help text
  nios2: reword ARCH_FORCE_MAX_ORDER prompt and help text
  nios2: drop ranges for definition of ARCH_FORCE_MAX_ORDER
  powerpc: reword ARCH_FORCE_MAX_ORDER prompt and help text
  powerpc: drop ranges for definition of ARCH_FORCE_MAX_ORDER
  sh: reword ARCH_FORCE_MAX_ORDER prompt and help text
  sh: drop ranges for definition of ARCH_FORCE_MAX_ORDER
  sparc: reword ARCH_FORCE_MAX_ORDER prompt and help text
  xtensa: reword ARCH_FORCE_MAX_ORDER prompt and help text

 arch/arm/Kconfig      | 16 +++++++++-------
 arch/arm64/Kconfig    | 27 ++++++++++++---------------
 arch/csky/Kconfig     |  4 ----
 arch/ia64/Kconfig     |  3 +--
 arch/m68k/Kconfig.cpu | 16 +++++++++-------
 arch/nios2/Kconfig    | 17 +++++++++--------
 arch/powerpc/Kconfig  | 22 +++++++++-------------
 arch/sh/mm/Kconfig    | 19 +++++++++----------
 arch/sparc/Kconfig    | 16 +++++++++-------
 arch/xtensa/Kconfig   | 16 +++++++++-------
 10 files changed, 76 insertions(+), 80 deletions(-)


base-commit: 51551d71edbc998fd8c8afa7312db3d270f5998e
-- 
2.35.1

*** BLURB HERE ***

Mike Rapoport (IBM) (14):
  arm: reword ARCH_FORCE_MAX_ORDER prompt and help text
  arm64: drop ranges in definition of ARCH_FORCE_MAX_ORDER
  arm64: reword ARCH_FORCE_MAX_ORDER prompt and help text
  csky: drop ARCH_FORCE_MAX_ORDER
  ia64: don't allow users to override ARCH_FORCE_MAX_ORDER
  m68k: reword ARCH_FORCE_MAX_ORDER prompt and help text
  nios2: reword ARCH_FORCE_MAX_ORDER prompt and help text
  nios2: drop ranges for definition of ARCH_FORCE_MAX_ORDER
  powerpc: reword ARCH_FORCE_MAX_ORDER prompt and help text
  powerpc: drop ranges for definition of ARCH_FORCE_MAX_ORDER
  sh: reword ARCH_FORCE_MAX_ORDER prompt and help text
  sh: drop ranges for definition of ARCH_FORCE_MAX_ORDER
  sparc: reword ARCH_FORCE_MAX_ORDER prompt and help text
  xtensa: reword ARCH_FORCE_MAX_ORDER prompt and help text

 arch/arm/Kconfig      | 16 +++++++++-------
 arch/arm64/Kconfig    | 26 ++++++++++++--------------
 arch/csky/Kconfig     |  4 ----
 arch/ia64/Kconfig     |  3 +--
 arch/m68k/Kconfig.cpu | 16 +++++++++-------
 arch/nios2/Kconfig    | 17 +++++++++--------
 arch/powerpc/Kconfig  | 22 +++++++++-------------
 arch/sh/mm/Kconfig    | 19 +++++++++----------
 arch/sparc/Kconfig    | 16 +++++++++-------
 arch/xtensa/Kconfig   | 16 +++++++++-------
 10 files changed, 76 insertions(+), 79 deletions(-)


base-commit: 51551d71edbc998fd8c8afa7312db3d270f5998e
-- 
2.35.1

