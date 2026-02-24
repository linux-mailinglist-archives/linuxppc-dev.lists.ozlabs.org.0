Return-Path: <linuxppc-dev+bounces-17102-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEa0EPt4nWmAQAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17102-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 11:10:03 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 62687185218
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 11:10:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKtkT2ctgz3cMc;
	Tue, 24 Feb 2026 21:09:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771927793;
	cv=none; b=Msox7RzD+IfWm3fxVwDIkUuPORM8KKNEdQ2guTJxA7FBTfNb22Vo0HWCnspEJFJ0OMQUPDEgmHaOCJjbTQ2zTUwmzL7PBKWuP6rK/0CwTOIFjD/pVL3/Ey/m7K6/MD9qPEu2HwEDWIdi4aE1/rXrqsjbjyreDvQUfLJwuYEczQQdmwUGj4ql1XrHsI6RBCETowZgSY41ORb1sjGgN5ZA+WcXn8wbJlymQE8NwNfd1wtewcN+iBbhkdaMFGx/XT/P6fwdLCN5BjvdwtS4k/zSUUrdAglje5ZJbKM8m3lNE0QuM6KLAF1WC08NOJKlwg8yE6C5S1VlXdaCdUJ/AB5TUA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771927793; c=relaxed/relaxed;
	bh=hFegG1SKfblu7TYgB2g2JejJqqd29kwFF2JVZmC5Njg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CWYxhNk8bJU5hVpMUjWV9+fND2hEB7H8RVJuhBAfMPiJ19aoH4aJAKi536bJkDcacAzfCWqY1l5cZbycl7wegLtBBAecHqrTYYdmoKlM2mmLpfx8ff0YWLK6cRk0gVptCFuIjaBH3l2e4YIj0nlEh5YIOnqh3kljtedrjkz2rrhXMHgBB8ejTCKE8zxI/W9cBoFBAzjTGysEe8pyIl9UN6QktkFQGsQCLbT6+VHFPM1I7soujhCFU/CJFabhkNCQhCEvrZkB+fSnbP2mFzsy+BzxousSdu6G6zVIXMOcodFQj1EwCvp0pS7EL9bXPrZaKAvXg1KAaVcdl9Q3to7LoA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u8kbHX3C; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=maz@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u8kbHX3C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=maz@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKtkQ5vbCz3cLN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 21:09:50 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 26A7061335;
	Tue, 24 Feb 2026 10:09:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD161C2BC9E;
	Tue, 24 Feb 2026 10:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771927787;
	bh=YOp56FnQQmNzzQ/Xwi1OTm36PaNCk+5LjoAZScSw1a4=;
	h=From:To:Cc:Subject:Date:From;
	b=u8kbHX3CefvKlWOy/GjXw52JU7MYcfHPOQMj/Fbke9kxopZWST5/f7zklaWHqgigD
	 pKBg5JY9/7jT9w+4XkVUIY6fVcesu+mXZ4P66kmdQ95j21iqZy3PnNPIAyN1fCd4cx
	 mrVVok+ETW3FyxgOpGdZA+DsqScBZ+W96CAgdf2T37tnjNa8MiDk21QPQxbJiXhpB0
	 N87jwGiQw0x+PPWQjItYYj9ywF9LHFf/7CKNeOGiz2bxnYQsYcqmHa6MNhNkeT5YA8
	 jFTxdLyVklfMN2AXakm3U7D9uQuOlzgZs6Sd+xd+0N8YfDRA15Tik6gN4+UaMV63MY
	 W6jUzbgKnLDfw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vupMP-0000000DIa5-2exa;
	Tue, 24 Feb 2026 10:09:45 +0000
From: Marc Zyngier <maz@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Thomas Gleixner <tglx@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/6] fsl-mc: Move over to device MSI infrastructure
Date: Tue, 24 Feb 2026 10:09:30 +0000
Message-ID: <20260224100936.3752303-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: ioana.ciornei@nxp.com, tglx@kernel.org, chleroy@kernel.org, sascha.bischoff@arm.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17102-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ioana.ciornei@nxp.com,m:tglx@kernel.org,m:chleroy@kernel.org,m:sascha.bischoff@arm.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[maz@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maz@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 62687185218
X-Rspamd-Action: no action

This is the second drop of this cleanup series for the fsl-mc MSI
infrastructure, initially posted at [1].

* From v1 [1]:

  - Drop the now unused DOMAIN_BUS_FSL_MC_MSI bus token

  - Tidy-up fsl_mc_write_msi_msg() while removing the legacy helper

  - Fix include ordering in irq-gic-its-msi-parent.c

  - Various commit message cleanups

  - Collected tags from Ioana and Sascha, with thanks

  - Rebased on top of v7.0.rc1

[1] https://lore.kernel.org/r/20260218135203.2267907-1-maz@kernel.org

Marc Zyngier (6):
  fsl-mc: Remove MSI domain propagation to sub-devices
  fsl-mc: Add minimal infrastructure to use platform MSI
  irqchip/gic-v3-its: Add fsl_mc device plumbing to the msi-parent
    handling
  fsl-mc: Switch over to per-device platform MSI
  fsl-mc: Remove legacy MSI implementation
  platform-msi: Remove stale comment

 drivers/base/platform-msi.c                 |   4 -
 drivers/bus/fsl-mc/dprc-driver.c            |  14 +-
 drivers/bus/fsl-mc/fsl-mc-bus.c             |   4 +-
 drivers/bus/fsl-mc/fsl-mc-msi.c             | 166 +++----------------
 drivers/bus/fsl-mc/fsl-mc-private.h         |   2 +-
 drivers/irqchip/Kconfig                     |   6 -
 drivers/irqchip/Makefile                    |   1 -
 drivers/irqchip/irq-gic-its-msi-parent.c    |   7 +-
 drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c | 168 --------------------
 include/linux/fsl/mc.h                      |   6 +-
 include/linux/irqdomain_defs.h              |   1 -
 11 files changed, 39 insertions(+), 340 deletions(-)
 delete mode 100644 drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c

-- 
2.47.3


