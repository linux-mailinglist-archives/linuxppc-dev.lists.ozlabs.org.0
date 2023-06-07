Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4838D72645F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 17:25:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbrlT0Rn5z305g
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 01:25:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=B+PBZJXT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2001:67c:2178:6::1c; helo=smtp-out1.suse.de; envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=B+PBZJXT;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QbrkZ50GMz3bdm
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 01:25:09 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 764C421A0A;
	Wed,  7 Jun 2023 15:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1686151501; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=3dXGf7k+4oTYlBaWumJNU4jR3nmmEHJWtnu0vSLVKpY=;
	b=B+PBZJXThYIOntzOMYJN1M7HOWKlcyfHTjqwYAzKeYBeg7N4H53o02U8FpcHbdfxQS/12F
	pD2SxjHz7edW0+GtChSdSrs+u54G5UDKluEkn024K10JO0UxcGtR6rRHIiyWQ7rmD6W5Wk
	GvOPqUkg6P2Kqu+RevoP90n3lOrnJZQ=
Received: from alley.suse.cz (unknown [10.100.201.202])
	by relay2.suse.de (Postfix) with ESMTP id 6C3A12C141;
	Wed,  7 Jun 2023 15:24:59 +0000 (UTC)
From: Petr Mladek <pmladek@suse.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 0/7] watchdog/hardlockup: Cleanup configuration of hardlockup detectors
Date: Wed,  7 Jun 2023 17:24:25 +0200
Message-Id: <20230607152432.5435-1-pmladek@suse.com>
X-Mailer: git-send-email 2.35.3
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
Cc: Petr Mladek <pmladek@suse.com>, kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

this patchset is supposed to replace the last patch in the patchset cleaning
up after introducing the buddy detector, see
https://lore.kernel.org/r/20230526184139.10.I821fe7609e57608913fe05abd8f35b343e7a9aae@changeid

There are four possible variants of hardlockup detectors:

  + buddy: available when SMP is set.

  + perf: available when HAVE_HARDLOCKUP_DETECTOR_PERF is set.

  + arch-specific: available when HAVE_HARDLOCKUP_DETECTOR_ARCH is set.

  + sparc64 special variant: available when HAVE_NMI_WATCHDOG is set
	and HAVE_HARDLOCKUP_DETECTOR_ARCH is not set.

Only one hardlockup detector can be compiled in. The selection is done
using quite complex dependencies between several CONFIG variables.
The following patches will try to make it more straightforward.

Before, the decision was done using the following variables:

	+ HAVE_HARDLOCKUP_DETECTOR_PERF
	+ HAVE_HARDLOCKUP_DETECTOR_BUDDY
	+ HAVE_HARDLOCKUP_DETECTOR_ARCH
	+ HAVE_NMI_WATCHDOG
 
	+ HARDLOCKUP_DETECTOR
	+ HARDLOCKUP_DETECTOR_PREFER_BUDDY

	+ HAVE_HARDLOCKUP_DETECTOR_NON_ARCH
	+ HARDLOCKUP_DETECTOR_NON_ARCH

	+ HARDLOCKUP_DETECTOR_PERF
	+ HARDLOCKUP_DETECTOR_BUDDY

   and the particular watchdog was used when the following variables were set:

	+ perf:		 HARDLOCKUP_DETECTOR_PERF
	+ buddy:	 HARDLOCKUP_DETECTOR_BUDDY
	+ arch-specific: HAVE_HARDLOCKUP_DETECTOR_ARCH
	+ sparc64:	 HAVE_NMI_WATCHDOG && !HAVE_HARDLOCKUP_DETECTOR_ARCH


After, the decision is done using the following variables:

	+ HAVE_HARDLOCKUP_DETECTOR_PERF
	+ HAVE_HARDLOCKUP_DETECTOR_BUDDY
	+ HAVE_HARDLOCKUP_DETECTOR_ARCH
	+ HAVE_HARDLOCKUP_DETECTOR_SPARC64
 
	+ HARDLOCKUP_DETECTOR
	+ HARDLOCKUP_DETECTOR_PREFER_BUDDY

	+ HARDLOCKUP_DETECTOR_PERF
	+ HARDLOCKUP_DETECTOR_BUDDY
	+ HARDLOCKUP_DETECTOR_ARCH
	+ HARDLOCKUP_DETECTOR_SPARC64

   and the particular watchdog is used when one of these variables is set:

	+ perf:		 HARDLOCKUP_DETECTOR_PERF
	+ buddy:	 HARDLOCKUP_DETECTOR_BUDDY
	+ arch-specific: HARDLOCKUP_DETECTOR_ARCH
	+ sparc64:	 HARDLOCKUP_DETECTOR_SPARC64


Plus, many checks are more straightforward and even self-explanatory.

I build and run tested it on x86_64. I only checked the generated
.config after using sparc_defconfig, sparc64_defconfig, ppc64_defconfig,
and ppc40x_defconfig.

Best Regards,
Petr

Petr Mladek (7):
  watchdog/hardlockup: Sort hardlockup detector related config values a
    logical way
  watchdog/hardlockup: Make the config checks more straightforward
  watchdog/hardlockup: Declare arch_touch_nmi_watchdog() only in
    linux/nmi.h
  watchdog/hardlockup: Enable HAVE_NMI_WATCHDOG only on sparc64
  watchdog/sparc64: Rename HAVE_NMI_WATCHDOG to
    HAVE_HARDLOCKUP_WATCHDOG_SPARC64
  watchdog/sparc64: Define HARDLOCKUP_DETECTOR_SPARC64
  watchdog/hardlockup: Define HARDLOCKUP_DETECTOR_ARCH

 arch/Kconfig                   |  17 ++---
 arch/powerpc/Kconfig           |   5 +-
 arch/powerpc/include/asm/nmi.h |   2 -
 arch/sparc/Kconfig             |   2 +-
 arch/sparc/Kconfig.debug       |  20 ++++++
 arch/sparc/include/asm/nmi.h   |   1 -
 include/linux/nmi.h            |  14 ++--
 kernel/watchdog.c              |   2 +-
 lib/Kconfig.debug              | 115 +++++++++++++++++++--------------
 9 files changed, 104 insertions(+), 74 deletions(-)

-- 
2.35.3

