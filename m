Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C17B72E7BB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 18:02:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgYGr05Prz3bZ9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 02:02:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgYGL5Hvvz30LQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 02:02:02 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 049A262FB0;
	Tue, 13 Jun 2023 15:52:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D806C433F0;
	Tue, 13 Jun 2023 15:52:48 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 0/3] Move the ARCH_DMA_MINALIGN definition to asm/cache.h
Date: Tue, 13 Jun 2023 16:52:42 +0100
Message-Id: <20230613155245.1228274-1-catalin.marinas@arm.com>
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
Cc: Michal Simek <monstr@monstr.eu>, Rich Felker <dalias@libc.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Linus Torvalds <torvalds@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

The ARCH_KMALLOC_MINALIGN reduction series defines a generic
ARCH_DMA_MINALIGN in linux/cache.h:

https://lore.kernel.org/r/20230612153201.554742-2-catalin.marinas@arm.com/

Unfortunately, this causes a duplicate definition warning for
microblaze, powerpc (32-bit only) and sh as these architectures define
ARCH_DMA_MINALIGN in a different file than asm/cache.h. Move the macro
to asm/cache.h to avoid this issue and also bring them in line with the
other architectures.

Andrew, if the arch maintainers cc'ed are fine with such change, could
you please take these three patches together with the
ARCH_KMALLOC_MINALIGN series?

Thank you.

Catalin Marinas (3):
  powerpc: Move the ARCH_DMA_MINALIGN definition to asm/cache.h
  microblaze: Move the ARCH_{DMA,SLAB}_MINALIGN definitions to
    asm/cache.h
  sh: Move the ARCH_DMA_MINALIGN definition to asm/cache.h

 arch/microblaze/include/asm/cache.h | 5 +++++
 arch/microblaze/include/asm/page.h  | 5 -----
 arch/powerpc/include/asm/cache.h    | 4 ++++
 arch/powerpc/include/asm/page_32.h  | 4 ----
 arch/sh/include/asm/cache.h         | 6 ++++++
 arch/sh/include/asm/page.h          | 6 ------
 6 files changed, 15 insertions(+), 15 deletions(-)

