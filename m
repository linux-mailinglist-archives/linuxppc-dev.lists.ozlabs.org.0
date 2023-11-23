Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B82E27F5CDB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 11:49:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=omjmjL6D;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SbZbv4RM9z3dD2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 21:48:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=omjmjL6D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SbZb42f7Vz2xdV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Nov 2023 21:48:16 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id A8542B81A2E;
	Thu, 23 Nov 2023 10:48:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CAF2C433C8;
	Thu, 23 Nov 2023 10:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700736492;
	bh=9yui0R04mhFExuav9xVkKApPeY+JtFqlYoCe4ZrZqok=;
	h=From:To:Cc:Subject:Date:From;
	b=omjmjL6D78vmJrGWDGCkTtHo2/UR2dHGY1OD8YpQcro0vxHo4EmYEo8FtZkQYuXsy
	 QQsfkhP2ASvvH5kSOvqSzdIPlRE0Ozdb0wP8m+/vU55eOzmHDYOVwvfN5f+awoUL6r
	 JGy+H5YeEflDjDnxRiQmnNhn2piGz8L6AhL1djvGA/DlLwM2G/4ztjICm+hr1Dkhbx
	 slID6Dy4qeqEJQU1E6/TmUx3ZfWPLgTPoMRrq4FX9Hi790x9Np+TQ0GV6cBFFRd9PQ
	 3BiJaryxrBmElMfVny2KMzKzkjUAIIryWLXr4lpDtn9UlrGBQHSPU8bb8dsotzRvwl
	 eWUswVhpzLOUA==
From: Arnd Bergmann <arnd@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 0/3] powerpc: -Wmissing-prototypes fixes
Date: Thu, 23 Nov 2023 11:47:58 +0100
Message-Id: <20231123104801.15537-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

Most of the other fixes I sent have been picked up in other trees
in linux-next already, but I saw the powerpc ones were still missing.

I've folded the fixup for the ps3gelic patch in, the other two
patches are unchanged. Please apply, or ignore if you already
have them in some tree.

    Arnd

Arnd Bergmann (3):
  powerpc: ps3: move udbg_shutdown_ps3gelic prototype
  powerpc: pasemi: mark pas_shutdown() static
  powerpc: powermac: mark smp_psurge_{give,take}_timebase static

 arch/powerpc/Kconfig.debug                   |  1 -
 arch/powerpc/include/asm/ps3.h               |  6 ++++++
 arch/powerpc/platforms/pasemi/setup.c        |  2 +-
 arch/powerpc/platforms/powermac/smp.c        |  4 ++--
 arch/powerpc/platforms/ps3/Kconfig           | 12 ------------
 arch/powerpc/platforms/ps3/Makefile          |  2 +-
 arch/powerpc/platforms/ps3/gelic_udbg.c      |  1 +
 drivers/net/ethernet/toshiba/ps3_gelic_net.h |  6 ------
 8 files changed, 11 insertions(+), 23 deletions(-)

-- 
2.39.2

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org
