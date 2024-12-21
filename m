Return-Path: <linuxppc-dev+bounces-4381-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F739FA11D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2024 15:48:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YFnGJ0BScz2xpf;
	Sun, 22 Dec 2024 01:48:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:c010:41de::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734792503;
	cv=none; b=opqimVGNJTjUiiZ3RhpPVYVAb/F6NwwfPz1O43Tm8Y+CP208qIO90TQp4niCYZ8foLm+/zLSzGc+vpwh9J1KRsEmiiAOLgabxN5mxsD0dGyl8TxUv3ddMVcKOnESWbQ01nWMNZac/urPd9W7+zOU7+Pphua1vRN9Xsrl/Y+Djje0MUhV7IUbVl+0KkFESI3pbY9qUskHDAibxCnmlf/ka4/Qh+N+MX0oF3cohQMVmi/OiYpRR8pCakYX+fjfL4kCGTvpkXqOYtQQe1ivoRnMkTIURKgPap00AOmeBaHuqhyJ7fYvh3iFgempRdstQHhCVW0TPbfbKeg9eIgv7eVkNg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734792503; c=relaxed/relaxed;
	bh=YKeF9vNtIZ1D8XbLVrqRui2bldvKxUYQvTXZqM+qoG0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YwPI/i2v/rFlSqM77h2XSpyTEEfUWNUk9xJUlKuJNXqWFNo8iuCfIh8b8pHJvNcpbgOkuMOswrlX07sD4gv200/hFd414pRIbWeJ5Pw25zCRLlN3vS9KVjqBeYwul5OK0Px0hiziYXs8HeexkUYxwaBw6BaL4LZTahaQttrhKJPoYEEWEp0Gzat8iV/eNU69bkIeTELWZCXbM/4BcYmdB9svRPZseq80bMhQGZX6yF/V9xsuPRiZj3t5U45DKE6gnrIH3dkf9HfURF5ZlWYT88AmopICIHDfphmJINtMvEaXi3xl8S3GILAx/lo/9BeCZ+zLZbbq47HeyNsUClsQdA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=Rv1BScQp; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=Rv1BScQp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YFnGD6fHJz2xgQ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Dec 2024 01:48:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734792491;
	bh=9HW4PB3G8e3OnJQ95ej+0zc3cjvog55LMvuAHYhMtQw=;
	h=From:Subject:Date:To:Cc:From;
	b=Rv1BScQprHb5qHUhAjug1GIKRU/XeOjmcefyVINbRaYKsiNQIVHkh+aCXkkQmRudg
	 HrcFdZkta8D7GjbKeY9Nwo2+gynNfHCmjeF6qh/XKEFlbtLpGLx32A0IAoXetR32vX
	 IEiiMCEf1RxipZ1Vluxsy6ETkb96KuploqpQKHKs=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v2 0/9] misc: constify 'struct bin_attribute'
Date: Sat, 21 Dec 2024 15:48:06 +0100
Message-Id: <20241221-sysfs-const-bin_attr-misc-drivers-v2-0-ba5e79fe8771@weissschuh.net>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACbVZmcC/42NywrCMBAAf6Xk7Eo3fYEn/0OKtMnG7sFUsjFaS
 v/dWPDuceYwsyqhwCTqVKwqUGLh2WfQh0KZafA3AraZlS51jRobkEWcgJm9RBjZX4cYA9xZDNj
 AiYJApxGxHvRY2UrlziOQ4/f+uPSZJ5Y4h2VfJvzaX739o54QSrBN6Vw3aqza7vwiFhEzPaejp
 6j6bds+VKoK2tcAAAA=
X-Change-ID: 20241215-sysfs-const-bin_attr-misc-drivers-721114a2b3d3
To: Frederic Barrat <fbarrat@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734792490; l=1652;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=9HW4PB3G8e3OnJQ95ej+0zc3cjvog55LMvuAHYhMtQw=;
 b=8OJjRly4Go5i1jBBTIkc9Vokm4Pt9NOuHoby3kQ4Gq/8hvQpRhKgRKDhAgy18wiaCuQhwiLNE
 b6eUrLd5GTEArsc++uJJoM0MKTeVLz6nxcTljjMhU7k/QfbM+bSEzQ5
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The sysfs core now allows instances of 'struct bin_attribute' to be
moved into read-only memory. Make use of that to protect them against
accidental or malicious modifications.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes in v2:
- Fix NULL deref in c2port_bin_attr_size() (0day CI)
- Add Ack for cxl/ocxl changes
- Link to v1: https://lore.kernel.org/r/20241216-sysfs-const-bin_attr-misc-drivers-v1-0-d50ff7b21367@weissschuh.net

---
Thomas Weißschuh (9):
      ocxl: Constify 'struct bin_attribute'
      cxl: Constify 'struct bin_attribute'
      misc: sram: constify 'struct bin_attribute'
      misc: c2port: Calculate bin_attribute size through group callback
      misc: c2port: Constify 'struct bin_attribute'
      misc: pch_phub: Constify 'struct bin_attribute'
      misc: eeprom/idt_89hpesx: Constify 'struct bin_attribute'
      misc: eeprom/max6875: Constify 'struct bin_attribute'
      misc: ds1682: Constify 'struct bin_attribute'

 drivers/misc/c2port/core.c        | 29 ++++++++++++++++++++---------
 drivers/misc/cxl/sysfs.c          |  8 ++++----
 drivers/misc/ds1682.c             |  8 ++++----
 drivers/misc/eeprom/idt_89hpesx.c |  6 +++---
 drivers/misc/eeprom/max6875.c     |  4 ++--
 drivers/misc/ocxl/sysfs.c         |  4 ++--
 drivers/misc/pch_phub.c           |  8 ++++----
 drivers/misc/sram.c               |  8 ++++----
 8 files changed, 43 insertions(+), 32 deletions(-)
---
base-commit: 499551201b5f4fd3c0618a3e95e3d0d15ea18f31
change-id: 20241215-sysfs-const-bin_attr-misc-drivers-721114a2b3d3

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


