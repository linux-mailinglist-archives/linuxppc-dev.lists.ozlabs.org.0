Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1868673343F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 17:07:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=NflyOErm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjMw573ZMz3bsJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 01:07:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=NflyOErm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2001:67c:2178:6::1d; helo=smtp-out2.suse.de; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjMv94Rcbz3bcF
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 01:06:44 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id AAD451F461;
	Fri, 16 Jun 2023 15:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1686927997; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=qZ6VZQS2BN5LQfBVveeEUMRRjzGIEjqa48tMNDm1o3M=;
	b=NflyOErmcWSy+bqbtbwYQTBDVsUvpIBLG317dBlbNwgfNzOSCxizJowUuCAURsAnkD7DwK
	QoPX51bOLIvjmQTV4fFPPqGTczXM60o0DLmH1lfZlAyO1QpZtSAew7zY9nuuVJr4wdEqDU
	xURFTUWprpCM15XrbRool9W6zsGrsJ0=
Received: from alley.suse.cz (unknown [10.100.208.146])
	by relay2.suse.de (Postfix) with ESMTP id 242E32C141;
	Fri, 16 Jun 2023 15:06:36 +0000 (UTC)
From: Petr Mladek <pmladek@suse.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 0/6] watchdog/hardlockup: Cleanup configuration of hardlockup detectors
Date: Fri, 16 Jun 2023 17:06:12 +0200
Message-Id: <20230616150618.6073-1-pmladek@suse.com>
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

Changes against v1:

  + Better explained the C-like ordering in the 1st patch.

  + Squashed patches for splitting and renaming HAVE_NMI_WATCHDOG,
    updated commit message with the history and more facts.

  + Updated comments about the sparc64 variant. It is not handled together
    with the softlockup detector. In fact, it is always build. And it even
    used to be always enabled until the commit 7a5c8b57cec93196b ("sparc:
    implement watchdog_nmi_enable and watchdog_nmi_disable") added in
    v4.10-rc1.

    I realized this when updating the comment for the 4th patch. My original
    statement in v1 patchset was based on code reading. I looked at it from
    a bad side.

  + Removed superfluous "default n"
  + Fixed typos.

Petr Mladek (6):
  watchdog/hardlockup: Sort hardlockup detector related config values a
    logical way
  watchdog/hardlockup: Make the config checks more straightforward
  watchdog/hardlockup: Declare arch_touch_nmi_watchdog() only in
    linux/nmi.h
  watchdog/hardlockup:  Make HAVE_NMI_WATCHDOG sparc64-specific
  watchdog/sparc64: Define HARDLOCKUP_DETECTOR_SPARC64
  watchdog/hardlockup: Define HARDLOCKUP_DETECTOR_ARCH

 arch/Kconfig                   |  17 ++---
 arch/powerpc/Kconfig           |   5 +-
 arch/powerpc/include/asm/nmi.h |   2 -
 arch/sparc/Kconfig             |   2 +-
 arch/sparc/Kconfig.debug       |  14 ++++
 arch/sparc/include/asm/nmi.h   |   1 -
 include/linux/nmi.h            |  14 ++--
 kernel/watchdog.c              |   2 +-
 lib/Kconfig.debug              | 114 ++++++++++++++++++---------------
 9 files changed, 97 insertions(+), 74 deletions(-)

-- 
2.35.3

