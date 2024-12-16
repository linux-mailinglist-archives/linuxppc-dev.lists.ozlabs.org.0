Return-Path: <linuxppc-dev+bounces-4164-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB1A9F2F59
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 12:33:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBd9F6yWSz2yvk;
	Mon, 16 Dec 2024 22:33:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:c010:41de::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734348785;
	cv=none; b=F0iZMT+5XhxqWDqq8Vf5v/bIQU25dq6BfILDJ50qJ5w+eabL7dmE1SMOKj8aDJ0nuZ+OesygkhTCATMuR52mD2MWdvFZaNVKTnwpCpmzGxqdvE1sNjXC6yCfeVo8SCtmAi1rxx6RzkbAoNAe9TF5fZfHxRDQcn0QcD+rbnIi5tBfdQHPYWA2Yp+X4Uipv27SoraIERYL1b2KGHQ2Lx9bsoTP8XlD8gNLbdcuDdib0G3gsgpjCFerfbx90GaxbEF6rj0+Nl9TP8pTvPhY22HSj4AxocVvN6x/nUg/kRHjKEPR+IdV8UfFqNPmUqb7B13zCv7XWLwsrToMc4mfb9ogow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734348785; c=relaxed/relaxed;
	bh=PDkfLIMmeqjyslZadYjhXjectYQdyHRR2rb7Oo0gHdU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aIzjRKyaY7hAh+VvG1QCUAuhozNj2x5EwJbRZNHmrcPv14w3RthU4pJRdmMthbK/RhOKC2zzjTXbdkMQxTDe9GvUULztEP37BOeYp/LvfNXOrnZMGQPk5KBbqx44qbw0jPpGZsfL7oyzdrZIi8DcL88kUYyLkJuQYyy6WvS7ojNIXW72E7cFMgP54GpKvOKlGQXkYxRwiZ/oxFRRox8gsW5JrBSbTJZr6MSKonbb3isS8p6zoyHFA4/jXGgv/fDitvBQD21IMDanOaVo4A4uAMRjCJGsvYECTe/mMN9+wuUU5s7N9KeB205ed7y+0OMbpSVTLjZI4iqOxCHiEX3yWQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=VJYpRBf/; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=VJYpRBf/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBd9D6xCzz2yb9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2024 22:33:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734348781;
	bh=t7pJU+zOrMxzGznZZK6jgbYcDt86FBsy6BKBXTbxQIE=;
	h=From:Subject:Date:To:Cc:From;
	b=VJYpRBf/mX/RFpDGf4XRAp1JTtLOGdmhT2o6UYgpZOzzA7Cqn7c7htV0UJc8Hwtww
	 XKcH2ceS4A34mCOKimcheEJi6JAdcVAUZ04t3x2+boN0vifXz21EZ2b+NdfvBb6L9H
	 y+SUyVU3+8Ate1SDLIZM1NBTL+dvL1qN3Aa6QzZo=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 0/9] misc: constify 'struct bin_attribute'
Date: Mon, 16 Dec 2024 12:32:55 +0100
Message-Id: <20241216-sysfs-const-bin_attr-misc-drivers-v1-0-d50ff7b21367@weissschuh.net>
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
X-B4-Tracking: v=1; b=H4sIAOcPYGcC/x3NQQqDQAxA0atI1g00URF6lVLKOBM1i44lGaRFv
 LuDy7f5fwcXU3F4NDuYbOq65gq6NRCXkGdBTdXAd+6IqUf/++QY1+wFR83vUIrhRz1iMt3EHAc
 moi7w2KYWaudrMunvejxfx3EC1Jd04nMAAAA=
X-Change-ID: 20241215-sysfs-const-bin_attr-misc-drivers-721114a2b3d3
To: Frederic Barrat <fbarrat@linux.ibm.com>, 
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734348781; l=1424;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=t7pJU+zOrMxzGznZZK6jgbYcDt86FBsy6BKBXTbxQIE=;
 b=pU7PD+Em4rbI5+JAE+WiwYi6iWtXa2pUQImMJ077OagtWFVOYt1hDrO/5tWFOC+dXBky41atT
 lxw8VskRN1KCt53uR9b6JUCxs97fEorX+/8M3HgSmCOLbquDKf3bWmd
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

 drivers/misc/c2port/core.c        | 27 +++++++++++++++++++--------
 drivers/misc/cxl/sysfs.c          |  8 ++++----
 drivers/misc/ds1682.c             |  8 ++++----
 drivers/misc/eeprom/idt_89hpesx.c |  6 +++---
 drivers/misc/eeprom/max6875.c     |  4 ++--
 drivers/misc/ocxl/sysfs.c         |  4 ++--
 drivers/misc/pch_phub.c           |  8 ++++----
 drivers/misc/sram.c               |  8 ++++----
 8 files changed, 42 insertions(+), 31 deletions(-)
---
base-commit: 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8
change-id: 20241215-sysfs-const-bin_attr-misc-drivers-721114a2b3d3

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


