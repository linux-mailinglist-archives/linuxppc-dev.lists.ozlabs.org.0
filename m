Return-Path: <linuxppc-dev+bounces-1372-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F40B978F11
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Sep 2024 10:18:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X5PFv6Zwyz2y8h;
	Sat, 14 Sep 2024 18:18:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.70.183.194
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726301923;
	cv=none; b=XWv4LF3VoZZUr/MqIDMeIWtZD5mlYEOidGsCRdX+sRyS+hrT51WtCnNMPbksaKmUqkPmfmcXppuhi8lmYdrEOM3911lr8MFh4NNs3bqDkCOyITAWC1vCDfTmXESNkG4F6Q9u6RGNiwkgUuEGX/EXFsjrNVIzhWxTWYO774c/LCDu4MoT/aWyi+8MoYMtxKk2Ba5hVUYFjFFp6lB/vffXbWEmAJj1xVw00pBieSvCCM2SZU0U1vcSq506UO9Z9IBEDDV1JZ1fl00jkY7MC0I4Ty+U/KsxLATv+FbNWYMHnAt/05oF0ygEpsUkCvwc+4Sf4k9worffrro1Hu6psXFshQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726301923; c=relaxed/relaxed;
	bh=A/NMzLz8Tuxq/gt5dPNpj6i4kHuPhRrw0hNedu0YR04=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MWZshff09h0rOOhVaE05K70hfdrDe9AOWRs4RCZpA0hcZ3UP5Vdgbx1dRY/fbTW0zEmv6zLexmKP/BHHHeplQG3TRFnjUMqUczd65o+tPXJUb92XjeUNmSKJQ+/zbak28XL45fFUOVRQGEELWYKOawz0gMXiCr5Euso8wdhTR8g6e9iZYAUHoLtBChSjOktYCUduzcsSFXp8Bh86F2Z2Ig8cFXfHyYvvcUZNSpfw0mBkAhDNi2FhXLzdiHTzOM4Hkz36j9+hAws2IEURGy1atAx4V3yOYSwGfEq8OXxuO0o1bj9DNpC0oi5XUVWPWfhGpJHM+C/49zYDLFvlZ8NBrA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=ImkbUKGP; dkim-atps=neutral; spf=pass (client-ip=217.70.183.194; helo=relay2-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=ImkbUKGP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.194; helo=relay2-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X5PFv2nb7z2y8d
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2024 18:18:42 +1000 (AEST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7A35D40007;
	Sat, 14 Sep 2024 08:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726301917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=A/NMzLz8Tuxq/gt5dPNpj6i4kHuPhRrw0hNedu0YR04=;
	b=ImkbUKGPiXQbqZnvZeefqE2T+XlO2xqBLvMzz3ERKEgEJWWoHmlKvoBW5skj91waHHidgv
	/FEQzgtpvoMZo9T9Y/V8u2LGvlhVQ8CBI5nRGcqIGG123RU7DDzNtE9duTZAzHcZ6LjHcW
	pvwxS/OWtZG0Q+LQWyRytZcmvrkqz6gD9g3V8QyOCRBvhOuCGo91vV0VsPF9nNui35p1+V
	Sg8y37iBy4OrvXlaocl4HH5SR84ftgMrzCvg7zLObpdybaqRVTZw8E9MvL9E2yuosmMkrM
	5Vp7tkKhRk4v3TSskKkYMqjYQPbhneUaoRT9obs82MhbcvNie6V96euuw9LBdw==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: davem@davemloft.net,
	Pantelis Antoniou <pantelis.antoniou@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	thomas.petazzoni@bootlin.com,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH net-next] net: ethernet: fs_enet: Make the per clock optional
Date: Sat, 14 Sep 2024 10:18:20 +0200
Message-ID: <20240914081821.209130-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.46.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: maxime.chevallier@bootlin.com

Some platforms that use fs_enet don't have the PER register clock. This
optional dependency on the clock was incorrectly made mandatory when
switching to devm_ accessors.

Reported-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Closes: https://lore.kernel.org/netdev/4e4defa9-ef2f-4ff1-95ca-6627c24db20c@wanadoo.fr/
Fixes: c614acf6e8e1 ("net: ethernet: fs_enet: simplify clock handling with devm accessors")
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
This patch fixes a commit in net-next.

 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
index d300b01859a1..3425c4a6abcb 100644
--- a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
+++ b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
@@ -895,7 +895,7 @@ static int fs_enet_probe(struct platform_device *ofdev)
 	 * but require enable to succeed when a clock was specified/found,
 	 * keep a reference to the clock upon successful acquisition
 	 */
-	clk = devm_clk_get_enabled(&ofdev->dev, "per");
+	clk = devm_clk_get_optional_enabled(&ofdev->dev, "per");
 	if (IS_ERR(clk))
 		goto out_free_fpi;
 
-- 
2.46.0


