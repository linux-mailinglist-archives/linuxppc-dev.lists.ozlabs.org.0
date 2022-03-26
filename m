Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B30B14E838B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Mar 2022 19:50:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KQp1R4nNBz3dN6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Mar 2022 05:50:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256 header.s=mail header.b=quzw4Veq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256 header.s=mail header.b=vaoJWTFz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stuerz.xyz (client-ip=2001:19f0:5:15da:5400:3ff:fecc:7379;
 helo=stuerz.xyz; envelope-from=benni@stuerz.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256
 header.s=mail header.b=quzw4Veq; 
 dkim=pass (2048-bit key) header.d=stuerz.xyz header.i=@stuerz.xyz
 header.a=rsa-sha256 header.s=mail header.b=vaoJWTFz; 
 dkim-atps=neutral
Received: from stuerz.xyz (stuerz.xyz
 [IPv6:2001:19f0:5:15da:5400:3ff:fecc:7379])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KQlm714Jpz30BN
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Mar 2022 04:08:39 +1100 (AEDT)
Received: by stuerz.xyz (Postfix, from userid 114)
 id EC006FB7EB; Sat, 26 Mar 2022 16:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stuerz.xyz; s=mail;
 t=1648313971; bh=h8kNuGjX/tVaFYP7mTBrGXI49VfH81tUX/xpUFBsyPo=;
 h=From:To:Cc:Subject:Date:From;
 b=quzw4Veqn1t75q8i+SwY92Od0H4kbj+Jplj+Hrb9t/pLmlKsT6TJwKYv9o17XTzCA
 3n4+kjK3LG/omELSm+sodJ7uUl4FaExNJQFo4XQbw2amIsW408Doe+3AErNNJZpImZ
 lx7AVbydSYoFr2bJYXUKmyssrinBABDWXfDrQufUX+8e9VArBlaTIJ/bN2K5xyVq+w
 0p7uHbBGHtyMHQgqTwLQnNn16UdQEjGi85LRaznlxiosXx3mrR8DCIsPHQcZtPldiM
 dmTbc/27NaJUevsVWuBjG4Qlevt2k5gOfZ0u7u+jCoIZM3SSZM+fmuEdmLFHsnsnPg
 mGpj42WHbwZ4g==
Received: from benni-fedora.. (unknown
 [IPv6:2a02:8109:a100:1a48:ff0:ef2f:d4da:17d8])
 by stuerz.xyz (Postfix) with ESMTPSA id 06801FB7CA;
 Sat, 26 Mar 2022 16:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stuerz.xyz; s=mail;
 t=1648313967; bh=h8kNuGjX/tVaFYP7mTBrGXI49VfH81tUX/xpUFBsyPo=;
 h=From:To:Cc:Subject:Date:From;
 b=vaoJWTFzm8MRCBX+7S85u4Wohc5rAbjDG2T7E8DUltJLkf/krkoSBna4S3pqS99En
 P3y6O3CiGyfogbGETepdGKzgpDN0QtHf35//97zogTn2Hce6o6WZ17BRWG3tApzQGf
 aNIkiZhaEmddVF8juLhl42fQ5bbgbuzhcq0ukey1NN8t0guq0sCG3i6sPdM3bYC1U6
 aU6BRZFuKP75AmwaGReNRozzsPCzJxq44tCraR+Ll6KCKwir1BEUti16KlHrTphFJy
 +nuQ/wPjFpAX6QV3asHxC7dOJgBXo+wgnEZXWOiibQ9bZKvgZVBmA4ga1hsVtcewJL
 xOc6w0OY3ukmA==
From: =?UTF-8?q?Benjamin=20St=C3=BCrz?= <benni@stuerz.xyz>
To: andrew@lunn.ch
Subject: [PATCH 01/22] orion5x: Replace comments with C99 initializers
Date: Sat, 26 Mar 2022 17:58:48 +0100
Message-Id: <20220326165909.506926-1-benni@stuerz.xyz>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 27 Mar 2022 05:40:34 +1100
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
Cc: linux-atm-general@lists.sourceforge.net, linux-ia64@vger.kernel.org,
 linus.walleij@linaro.org, dave.hansen@linux.intel.com,
 linux-pci@vger.kernel.org, robert.moore@intel.com, laforge@gnumonks.org,
 alim.akhtar@samsung.com, hpa@zytor.com, wcn36xx@lists.infradead.org,
 =?UTF-8?q?Benjamin=20St=C3=BCrz?= <benni@stuerz.xyz>, pkshih@realtek.com,
 linux-samsung-soc@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-edac@vger.kernel.org, dennis.dalessandro@cornelisnetworks.com,
 linux-rdma@vger.kernel.org, gregory.clement@bootlin.com,
 rafael.j.wysocki@intel.com, linux@armlinux.org.uk, krzk@kernel.org,
 jgg@ziepe.ca, mingo@redhat.com, 3chas3@gmail.com, linux-input@vger.kernel.org,
 kuba@kernel.org, pabeni@redhat.com, lenb@kernel.org,
 mike.marciniszyn@cornelisnetworks.com, rric@kernel.org, ajd@linux.ibm.com,
 arnd@arndb.de, kvalo@kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-gpio@vger.kernel.org, loic.poulain@linaro.org, bp@alien8.de,
 bhelgaas@google.com, tglx@linutronix.de, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux@simtec.co.uk,
 linux-arm-kernel@lists.infradead.org, devel@acpica.org, isdn@linux-pingi.de,
 tony.luck@intel.com, nico@fluxnic.net, gregkh@linuxfoundation.org,
 dmitry.torokhov@gmail.com, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, davem@davemloft.net, james.morse@arm.com,
 netdev@vger.kernel.org, fbarrat@linux.ibm.com, sebastian.hesselbarth@gmail.com,
 pali@kernel.org, brgl@bgdev.pl
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This replaces comments with C99's designated
initializers because the kernel supports them now.

Signed-off-by: Benjamin Stürz <benni@stuerz.xyz>
---
 arch/arm/mach-orion5x/dns323-setup.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-orion5x/dns323-setup.c b/arch/arm/mach-orion5x/dns323-setup.c
index 87cb47220e82..d762248c6512 100644
--- a/arch/arm/mach-orion5x/dns323-setup.c
+++ b/arch/arm/mach-orion5x/dns323-setup.c
@@ -61,9 +61,9 @@
 
 /* Exposed to userspace, do not change */
 enum {
-	DNS323_REV_A1,	/* 0 */
-	DNS323_REV_B1,	/* 1 */
-	DNS323_REV_C1,	/* 2 */
+	DNS323_REV_A1 = 0,
+	DNS323_REV_B1 = 1,
+	DNS323_REV_C1 = 2,
 };
 
 
-- 
2.35.1

