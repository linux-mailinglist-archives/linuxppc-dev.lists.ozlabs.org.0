Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B15750684E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Apr 2022 12:06:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KjKFM0l95z3c90
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Apr 2022 20:05:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=g8PLhNnH;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=BqbDfFer;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.29; helo=smtp-out2.suse.de;
 envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=g8PLhNnH; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=BqbDfFer; 
 dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KjKCH2sdxz2yZv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Apr 2022 20:04:10 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6FDA91F38D;
 Tue, 19 Apr 2022 10:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650362647; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=N77V+jXr47F61PbQqDhlOrLIprGwDW/pOVFQmREbCJw=;
 b=g8PLhNnHLI91ksistfZBNBf8MO59yBn8DthIgxoVv362YrvNc/gDCF2sCnTRZzT1lv6nQM
 QeftLtHNAFQKA0Sq7wHlKQZP0aVId7Rhu6llhs9N7dtOkti6tTOHWYzP8UaUJuMbiQuHVQ
 hWkbdfVEGyVUqq6BIOSXGFKnleaxmUM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650362647;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=N77V+jXr47F61PbQqDhlOrLIprGwDW/pOVFQmREbCJw=;
 b=BqbDfFerZPlucUA9awbpCZqaq+2h+kFM9Ueuo73fe9t6OsXpIbXciq3sj7eCXqZNuBhs8Y
 MYCy+7MKq9/XZfCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2302B132E7;
 Tue, 19 Apr 2022 10:04:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id jNSVBxeJXmJzJQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 19 Apr 2022 10:04:07 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: robh+dt@kernel.org, frowand.list@gmail.com, daniel@ffwll.ch, deller@gmx.de,
 sam@ravnborg.org, linux@roeck-us.net, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, javierm@redhat.com
Subject: [PATCH v2 0/2] of: Register platform device for each framebuffer
Date: Tue, 19 Apr 2022 12:04:03 +0200
Message-Id: <20220419100405.12600-1-tzimmermann@suse.de>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move the detection of OF framebuffers from fbdev into of platform code
and register a Linux platform device for each framebuffer. Allows for
DRM-based OF drivers and real hot-unplugging of the framebuffer.

This patchset has been tested with qemu's ppc64le emulation, which
provides a framebuffer via OF display node. If someone has an older
32-bit system with BootX available, please test.

v2:
	* integrate PPC code into generic platform setup (Rob)
	* keep !device workaround with a warning (Javier, Daniel)

Thomas Zimmermann (2):
  of: Create platform devices for OF framebuffers
  fbdev: Warn in hot-unplug workaround for framebuffers without device

 drivers/of/platform.c            | 88 +++++++++++++++++++++-------
 drivers/video/fbdev/core/fbmem.c | 10 ++--
 drivers/video/fbdev/offb.c       | 98 +++++++++++++++++++++-----------
 3 files changed, 136 insertions(+), 60 deletions(-)


base-commit: d97978df553d768e457cb68c637b2b0a6188b87c
prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
prerequisite-patch-id: 6e1032c6302461624f33194c8b8f37103a3fa6ef
prerequisite-patch-id: 3f204510fcbf9530d6540bd8e6128cce598988b6
prerequisite-patch-id: ab7611d28d07723ab1dd392dcf9a6345de3b1040
-- 
2.35.1

