Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E84A48FF2C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Jan 2022 22:37:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JcT0D3l2kz30QR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 08:37:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=waldekranz-com.20210112.gappssmtp.com header.i=@waldekranz-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=AeFRxDPo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=waldekranz.com (client-ip=2a00:1450:4864:20::32c;
 helo=mail-wm1-x32c.google.com; envelope-from=tobias@waldekranz.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=waldekranz-com.20210112.gappssmtp.com
 header.i=@waldekranz-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=AeFRxDPo; dkim-atps=neutral
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JcSWV1T5Jz2xCy
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jan 2022 08:16:05 +1100 (AEDT)
Received: by mail-wm1-x32c.google.com with SMTP id
 ay4-20020a05600c1e0400b0034a81a94607so17329216wmb.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Jan 2022 13:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=waldekranz-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:organization:content-transfer-encoding;
 bh=mhkaL5juH4guy48KuGF+fYnZTlI1q0boY2IwcDBWEPQ=;
 b=AeFRxDPoC2zhcdlERdxoTZs/hjLPyAaR4LmBcGv+bnERRK1afCv7/Jb83hAm2MxNvF
 gUjoSiL49a55oqlWGKn+yHqb3uG3uySVzV+VOVSnptDokuyAvAKBrlVBftHHfobqOn19
 lwJ4g2GuC1VGFmfPJeYMur91L8yO1AdMJpx8GwxAVLXzZ9Hhg0COy+GlVMGW/s1Dsjc5
 jDHu17OnNA9+IRP5fNQlNabpSZy/StlcQ3BSuDqoYLR5ObxkWXnmK1JJtBMzahs00pNi
 0qk5jyVvU7EQ8DoV1VbYVh6s7FdS6lCKclPiLmUHP09NNb3M0jXBAzZ6AZ6I3OnAR27h
 HesA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:organization:content-transfer-encoding;
 bh=mhkaL5juH4guy48KuGF+fYnZTlI1q0boY2IwcDBWEPQ=;
 b=0KhNfXc9s7yeHfenaXwIRhNLzJFtkNKyd6XJF+IK4KGdrIWk6OA/sjsMf9DifV+r0/
 gS4fPwTRnrCX/z1ruRLMgWJhBTdU6XKJ72fPjkMz29uSpTcuKrJgsT6tXwP58iOpgIiu
 2X7cAi2pf/FwyLZiL/9uNGSncNxhS9UdY4DHaOC734sagAWdaazZtt6420heVIKYPFx1
 AHYShLQAArOj7ciR0/fyIk7xSv0kLrX4uETo8XDPkkY8mb3YhK6tKfQKUrSmmzZfvmbR
 XquY2+502GR5AHIOFDowc2vQRakZlwGpW46N1UvvSlCiIiFIocHQTXAC62TrGDHmIYM4
 4S4w==
X-Gm-Message-State: AOAM532eJsUyusrLwC0GRHjeEIldkulvH7NuDo+Yb7cr4+0tFXEN9mrM
 zPTOchutsViPh3ZxP52mCAks2g==
X-Google-Smtp-Source: ABdhPJyl6EaOH2pNOGinkeqLhxtw/E//xARDY73P8G8xmFz/3e3RakxjgzdvwghHMOymGyyM/lgBAg==
X-Received: by 2002:adf:eec9:: with SMTP id a9mr16478793wrp.178.1642367761748; 
 Sun, 16 Jan 2022 13:16:01 -0800 (PST)
Received: from veiron.westermo.com (static-193-12-47-89.cust.tele2.se.
 [193.12.47.89])
 by smtp.gmail.com with ESMTPSA id l12sm8820445wrz.15.2022.01.16.13.16.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 13:16:01 -0800 (PST)
From: Tobias Waldekranz <tobias@waldekranz.com>
To: davem@davemloft.net,
	kuba@kernel.org
Subject: [PATCH net 4/4] net/fsl: xgmac_mdio: Fix incorrect iounmap when
 removing module
Date: Sun, 16 Jan 2022 22:15:29 +0100
Message-Id: <20220116211529.25604-5-tobias@waldekranz.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220116211529.25604-1-tobias@waldekranz.com>
References: <20220116211529.25604-1-tobias@waldekranz.com>
MIME-Version: 1.0
Organization: Westermo
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 17 Jan 2022 08:35:45 +1100
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
Cc: devicetree@vger.kernel.org, madalin.bucur@nxp.com, robh+dt@kernel.org,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As reported by sparse: In the remove path, the driver would attempt to
unmap its own priv pointer - instead of the io memory that it mapped
in probe.

Fixes: 9f35a7342cff ("net/fsl: introduce Freescale 10G MDIO driver")
Signed-off-by: Tobias Waldekranz <tobias@waldekranz.com>
---
 drivers/net/ethernet/freescale/xgmac_mdio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/xgmac_mdio.c b/drivers/net/ethernet/freescale/xgmac_mdio.c
index bf566ac3195b..266e562bd67a 100644
--- a/drivers/net/ethernet/freescale/xgmac_mdio.c
+++ b/drivers/net/ethernet/freescale/xgmac_mdio.c
@@ -331,9 +331,10 @@ static int xgmac_mdio_probe(struct platform_device *pdev)
 static int xgmac_mdio_remove(struct platform_device *pdev)
 {
 	struct mii_bus *bus = platform_get_drvdata(pdev);
+	struct mdio_fsl_priv *priv = bus->priv;
 
 	mdiobus_unregister(bus);
-	iounmap(bus->priv);
+	iounmap(priv->mdio_base);
 	mdiobus_free(bus);
 
 	return 0;
-- 
2.25.1

