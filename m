Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 378461C285C
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 23:25:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49F2Fr3VlRzDrDf
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 May 2020 07:25:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=wsa@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=VuZJ008I; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49DrzD32MrzDrPS
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 May 2020 00:26:47 +1000 (AEST)
Received: from localhost (p5486C608.dip0.t-ipconnect.de [84.134.198.8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 18B4524956;
 Sat,  2 May 2020 14:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588429605;
 bh=T0uL7V2GxJ0KJIHLBXzdJDnKFjm8L8mFABZiFNKziDU=;
 h=From:To:Cc:Subject:Date:From;
 b=VuZJ008ICcBXi2Tm2+47iUxfEea/DDJ+rsQD3+xPlTdIxcA4IqqyHf9dYliblLjab
 A1Acz9u65OBVklKBX9ZoicrngiiTKuBkugOThjDOqK59Oox2OTyQWg5o3e8bA4OcEy
 157taWykCJ0zb37pEb51W8zXAk5zfJJWmmZRG2Zc=
From: Wolfram Sang <wsa@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/5200: update contact email
Date: Sat,  2 May 2020 16:26:42 +0200
Message-Id: <20200502142642.18979-1-wsa@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 03 May 2020 07:22:35 +1000
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
Cc: devicetree@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 kernel@pengutronix.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

My 'pengutronix' address is defunct for years. Merge the entries and use
the proper contact address.

Signed-off-by: Wolfram Sang <wsa@kernel.org>
---
 arch/powerpc/boot/dts/pcm032.dts | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/boot/dts/pcm032.dts b/arch/powerpc/boot/dts/pcm032.dts
index c259c6b3ac5a..780e13d99e7b 100644
--- a/arch/powerpc/boot/dts/pcm032.dts
+++ b/arch/powerpc/boot/dts/pcm032.dts
@@ -3,9 +3,7 @@
  * phyCORE-MPC5200B-IO (pcm032) board Device Tree Source
  *
  * Copyright (C) 2006-2009 Pengutronix
- * Sascha Hauer <s.hauer@pengutronix.de>
- * Juergen Beisert <j.beisert@pengutronix.de>
- * Wolfram Sang <w.sang@pengutronix.de>
+ * Sascha Hauer, Juergen Beisert, Wolfram Sang <kernel@pengutronix.de>
  */
 
 /include/ "mpc5200b.dtsi"
-- 
2.20.1

