Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B2327698D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 08:53:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bxm2r5x3YzDqbl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 16:53:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=a6QwynBA; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxlkP2WXZzDqbp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 16:38:52 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id 7so1281637pgm.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Sep 2020 23:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aAdrOeUATeOYY9F0WJM+M2LaFIVjxmx3q+en/nm6b5o=;
 b=a6QwynBAY8seXIC4TgBOYSmwphiRJfjGQz1vbZ6ohlFDhfJVbFcnvqj0YWsO2kYf4O
 zDAY+pYoW2Lw7T/rhusETTaKvxe+gwmEy8mgr+9xHfRXKMYLAat63cYGFQHkX7Shl7NN
 RF0JxMWMveQQeJUSVOl9QGquDWxz+ceJ+x49IH1RA76LnCL2MJAkNapbfj6geHmj7dYf
 bWip5gTBVEk65Fw/2DTtgAd1StOG5WOnJtkWPvBww2zcw+G6BGKmYtmLKAbjcHuR+qSz
 lI5Say5kuKAb/WQEBYrtAS9U9g142DJeS2/IhQ9ohEQKWlHyOvMHmS+o3q9LFllfbey1
 xLzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aAdrOeUATeOYY9F0WJM+M2LaFIVjxmx3q+en/nm6b5o=;
 b=DNVhVlbdwfvzVh5GeCvap8ich//gioqfuiWnJcd5EzfIaVd+EO7pTLEjd6cUgzZ6lW
 YEEG+yQS9jjNgEBHwwcC0HnqbPkwZIc+mmgfXSDMSEldZvmW9JWh52K+iNuS2bnjWGrR
 qBU3O0r0xU3Sf3y57FWGkfdQX9QyNiCQ0NRD8Ak93u5D1i3Z1vXClHUgzBtHRDgYV3um
 j4AkUx7jbJKPJZPKk6kAOu+TpEut7gmPQ2mnDe2Dig+t1mWzzYIbXm2dgJO+P7WGUTvF
 Ep/IMoNdRRkJbIGhWWKv5ZRcgpY4ruX0dflldEA3hiX1n8mZFZ5qHovGVTTZwNmtULkn
 ALxw==
X-Gm-Message-State: AOAM530kkMIUzrDoHiIekfpsYnBVEYkIdHAWaTj8ubzeaqavldD0gKHt
 g+hOjeIeaIcMeO4lMfgy6hAtyX6QnMjlIg==
X-Google-Smtp-Source: ABdhPJw/EFE6FnoLe+zqzmhe5A7SH78G1UvwksaXc2cI8v8NkzVGlwCW20/Z4RNM3bNDcHb9wJutDA==
X-Received: by 2002:a63:43c6:: with SMTP id q189mr2900373pga.63.1600929529625; 
 Wed, 23 Sep 2020 23:38:49 -0700 (PDT)
Received: from localhost.ibm.com (194-193-34-182.tpgi.com.au. [194.193.34.182])
 by smtp.gmail.com with ESMTPSA id y1sm1662930pgr.3.2020.09.23.23.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 23:38:49 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 08/18] powerpc/52xx/mpc5200_simple: Move PHB discovery
Date: Thu, 24 Sep 2020 16:38:09 +1000
Message-Id: <20200924063819.262830-8-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200924063819.262830-1-oohall@gmail.com>
References: <20200924063819.262830-1-oohall@gmail.com>
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
Cc: Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/52xx/mpc5200_simple.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/52xx/mpc5200_simple.c b/arch/powerpc/platforms/52xx/mpc5200_simple.c
index 2d01e9b2e779..b9f5675b0a1d 100644
--- a/arch/powerpc/platforms/52xx/mpc5200_simple.c
+++ b/arch/powerpc/platforms/52xx/mpc5200_simple.c
@@ -40,8 +40,6 @@ static void __init mpc5200_simple_setup_arch(void)
 
 	/* Some mpc5200 & mpc5200b related configuration */
 	mpc5200_setup_xlb_arbiter();
-
-	mpc52xx_setup_pci();
 }
 
 /* list of the supported boards */
@@ -73,6 +71,7 @@ define_machine(mpc5200_simple_platform) {
 	.name		= "mpc5200-simple-platform",
 	.probe		= mpc5200_simple_probe,
 	.setup_arch	= mpc5200_simple_setup_arch,
+	.discover_phbs	= mpc52xx_setup_pci,
 	.init		= mpc52xx_declare_of_platform_devices,
 	.init_IRQ	= mpc52xx_init_irq,
 	.get_irq	= mpc52xx_get_irq,
-- 
2.26.2

