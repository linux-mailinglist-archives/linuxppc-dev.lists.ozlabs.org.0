Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D214E8382
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Mar 2022 19:47:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KQnxd0zD6z3f5L
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Mar 2022 05:47:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256 header.s=mail header.b=KUCWUYcN;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256 header.s=mail header.b=xIsbMOdf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stuerz.xyz (client-ip=45.77.206.31; helo=stuerz.xyz;
 envelope-from=benni@stuerz.xyz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stuerz.xyz header.i=@stuerz.xyz header.a=rsa-sha256
 header.s=mail header.b=KUCWUYcN; 
 dkim=pass (2048-bit key) header.d=stuerz.xyz header.i=@stuerz.xyz
 header.a=rsa-sha256 header.s=mail header.b=xIsbMOdf; 
 dkim-atps=neutral
Received: from stuerz.xyz (unknown [45.77.206.31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KQlm34PFGz308F
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Mar 2022 04:08:35 +1100 (AEDT)
Received: by stuerz.xyz (Postfix, from userid 114)
 id 4D2B2FB7E8; Sat, 26 Mar 2022 16:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stuerz.xyz; s=mail;
 t=1648313983; bh=ZCCwstaS3e/RzElmSk6N8DZfvChsgUHfiTuyAGHFjIM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KUCWUYcNFaMgW76g4nXOBA7meDCEvDhK5yUFjx0yT8jLB/t2gcSHEmwdIs3oTNWqy
 qWJPdhDet8ZgrYlUsYPk4MOocPEeUWx5HO8d78rW8ogOg2TfR9V8tjyFfNQe5V45o7
 x9OY2qI4UiQtGfNABOwjQxDl0u/WyN3PckfL4F1j3PlcwM2o1uK49D0FJ/sLoRRdtT
 zZ7yaMiikah8F1WA4l1gn05J+Ke6ps8hY640vv51wWtFfceJdppkxKR6SvAm8YhjPK
 vMbRBEJr1Thmi5EWDR/+rE1Ea76iWdVVZg3Ka/bC629KVvSjd6KcZMWlYac7Dj9mwj
 7+8ivQdnp98Qg==
Received: from benni-fedora.. (unknown
 [IPv6:2a02:8109:a100:1a48:ff0:ef2f:d4da:17d8])
 by stuerz.xyz (Postfix) with ESMTPSA id 2881DFB7D1;
 Sat, 26 Mar 2022 16:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stuerz.xyz; s=mail;
 t=1648313980; bh=ZCCwstaS3e/RzElmSk6N8DZfvChsgUHfiTuyAGHFjIM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xIsbMOdfU0Q/V/noYBJTvzmENKQwr3xdCDopx+KQ13tTLqAWk3SM6OL4hiv3VVsu4
 LZ2+4qV891SizwSAbA9RFdif7Xad8663beBH5K2j13NhHE07xQeDfsOgSqxr/C+za+
 MSb5j7oij2Jd7DfXjOZjPMiCw0Ou7lQ4TQyPva2bjbz9+bFlJyFVO1bNqQWmVvfeza
 iheYS8PB8/Na2CaDqA8T7AYheNWnter0biMGLVSYWwaNejld2sHcJuTOq8NLUVbkAH
 b42QbHz9DPMRS79rba+4qCccBHmJTdFEI0D+LYmCJFkFlO8Nbwc3qJr+SwfiHZOfvp
 PvjA7XiPr1hCQ==
From: =?UTF-8?q?Benjamin=20St=C3=BCrz?= <benni@stuerz.xyz>
To: andrew@lunn.ch
Subject: [PATCH 03/22] ia64: Replace comments with C99 initializers
Date: Sat, 26 Mar 2022 17:58:50 +0100
Message-Id: <20220326165909.506926-3-benni@stuerz.xyz>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220326165909.506926-1-benni@stuerz.xyz>
References: <20220326165909.506926-1-benni@stuerz.xyz>
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
 arch/ia64/kernel/kprobes.c | 64 +++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/arch/ia64/kernel/kprobes.c b/arch/ia64/kernel/kprobes.c
index 1a7bab1c5d7c..2d6a9388201e 100644
--- a/arch/ia64/kernel/kprobes.c
+++ b/arch/ia64/kernel/kprobes.c
@@ -29,38 +29,38 @@ struct kretprobe_blackpoint kretprobe_blacklist[] = {{NULL, NULL}};
 
 enum instruction_type {A, I, M, F, B, L, X, u};
 static enum instruction_type bundle_encoding[32][3] = {
-  { M, I, I },				/* 00 */
-  { M, I, I },				/* 01 */
-  { M, I, I },				/* 02 */
-  { M, I, I },				/* 03 */
-  { M, L, X },				/* 04 */
-  { M, L, X },				/* 05 */
-  { u, u, u },  			/* 06 */
-  { u, u, u },  			/* 07 */
-  { M, M, I },				/* 08 */
-  { M, M, I },				/* 09 */
-  { M, M, I },				/* 0A */
-  { M, M, I },				/* 0B */
-  { M, F, I },				/* 0C */
-  { M, F, I },				/* 0D */
-  { M, M, F },				/* 0E */
-  { M, M, F },				/* 0F */
-  { M, I, B },				/* 10 */
-  { M, I, B },				/* 11 */
-  { M, B, B },				/* 12 */
-  { M, B, B },				/* 13 */
-  { u, u, u },  			/* 14 */
-  { u, u, u },  			/* 15 */
-  { B, B, B },				/* 16 */
-  { B, B, B },				/* 17 */
-  { M, M, B },				/* 18 */
-  { M, M, B },				/* 19 */
-  { u, u, u },  			/* 1A */
-  { u, u, u },  			/* 1B */
-  { M, F, B },				/* 1C */
-  { M, F, B },				/* 1D */
-  { u, u, u },  			/* 1E */
-  { u, u, u },  			/* 1F */
+	[0x00] = { M, I, I },
+	[0x01] = { M, I, I },
+	[0x02] = { M, I, I },
+	[0x03] = { M, I, I },
+	[0x04] = { M, L, X },
+	[0x05] = { M, L, X },
+	[0x06] = { u, u, u },
+	[0x07] = { u, u, u },
+	[0x08] = { M, M, I },
+	[0x09] = { M, M, I },
+	[0x0A] = { M, M, I },
+	[0x0B] = { M, M, I },
+	[0x0C] = { M, F, I },
+	[0x0D] = { M, F, I },
+	[0x0E] = { M, M, F },
+	[0x0F] = { M, M, F },
+	[0x10] = { M, I, B },
+	[0x11] = { M, I, B },
+	[0x12] = { M, B, B },
+	[0x13] = { M, B, B },
+	[0x14] = { u, u, u },
+	[0x15] = { u, u, u },
+	[0x16] = { B, B, B },
+	[0x17] = { B, B, B },
+	[0x18] = { M, M, B },
+	[0x19] = { M, M, B },
+	[0x1A] = { u, u, u },
+	[0x1B] = { u, u, u },
+	[0x1C] = { M, F, B },
+	[0x1D] = { M, F, B },
+	[0x1E] = { u, u, u },
+	[0x1F] = { u, u, u },
 };
 
 /* Insert a long branch code */
-- 
2.35.1

