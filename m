Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A91F48FF32
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Jan 2022 22:38:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JcT1f6mfqz30K4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 08:38:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=waldekranz-com.20210112.gappssmtp.com header.i=@waldekranz-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=c1jnt9LO;
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
 header.s=20210112 header.b=c1jnt9LO; dkim-atps=neutral
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JcSWV13bTz2x9p
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jan 2022 08:16:05 +1100 (AEDT)
Received: by mail-wm1-x32c.google.com with SMTP id w26so16504537wmi.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Jan 2022 13:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=waldekranz-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version:organization
 :content-transfer-encoding;
 bh=3QZ0N7OQ7WTbnu80qig6uAdTcqYmEl53ggaPSmqUeaw=;
 b=c1jnt9LObMrUYLGaIhqskWoP9sKHKhO+e8vAdgCBxcr97/HMrV89Ugr+xKinTUWW1Q
 aCMIV/0vOiwwwff9ehBOKeh8tnDDIfON/NnPuT/qfWlsWq7iLzgzwN2oBVQpNUmju8n9
 3+MJR/VpDIDJhgL4RcqZ9BC/Hx/Oo1jR/ha2DUZcIuisH5Lc2vhUWSCZbP2TDlFhRpPX
 6B2rWuopCf53HxJNRwMxq0zA5+fJpjnOGopmEmBON88zrY7I6R1qQhC8x4kVGk+DjoX3
 hifRlONifozSxXYF5cK/0Eez/TDiqtSKK+outWw8wDgmQin01ZM3pQLKfFxzjr2qpsfm
 a9Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :organization:content-transfer-encoding;
 bh=3QZ0N7OQ7WTbnu80qig6uAdTcqYmEl53ggaPSmqUeaw=;
 b=Xali+UgeF4Kx6I9/4yDJX8BG4MokpW8Tz55RnGWyLVLV1kILqjmsogRrzrSuhIgN9z
 IC++bbtJZB0wv4os9Y/dcQbOK33J+At5qaxOP0pFnyFEpJo9seP84wT9p1+vVQzi0fQj
 oTjl0YhG8HG/ZHlVZmnKpVrakC+3E+YOtrDdAOkGoZgJ1KFYscSwXsXp0OkWhe1ZaNXF
 UP2jMGzETt+oRtD1BA4VEbp6Zee2TSiJC1jRfZulli9CDCj3f1A5ayxwEnJmfBRgx2J1
 I1svBsOqcRtFvw6DYqOpJNSJaZI0GnU6chTVtgfBlahSbPJwavINpzxZnusfBomwqGRt
 zTsg==
X-Gm-Message-State: AOAM531WFtB0ucffYwKmieXoBk7HN/aX9KJohAtujqdv4b7O5dmuzEJI
 cwvV7Qos7BKTshnlEJV9czSAdg==
X-Google-Smtp-Source: ABdhPJzD1oP97IbwHbToBOTUMnI4ANtJ7cxAwXpeh+t2rnuTEo90nJq02h/TMXpn06Ykp+q1yuQe/Q==
X-Received: by 2002:a1c:f70d:: with SMTP id v13mr17481238wmh.133.1642367757045; 
 Sun, 16 Jan 2022 13:15:57 -0800 (PST)
Received: from veiron.westermo.com (static-193-12-47-89.cust.tele2.se.
 [193.12.47.89])
 by smtp.gmail.com with ESMTPSA id l12sm8820445wrz.15.2022.01.16.13.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 13:15:56 -0800 (PST)
From: Tobias Waldekranz <tobias@waldekranz.com>
To: davem@davemloft.net,
	kuba@kernel.org
Subject: [PATCH net 0/4] net/fsl: xgmac_mdio: Add workaround for erratum
 A-009885
Date: Sun, 16 Jan 2022 22:15:25 +0100
Message-Id: <20220116211529.25604-1-tobias@waldekranz.com>
X-Mailer: git-send-email 2.25.1
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

The individual messages mostly speak for themselves.

It is very possible that there are more chips out there that are
impacted by this, but I only have access to the errata document for
the T1024 family, so I've limited the DT changes to the exact FMan
version used in that device. Hopefully someone from NXP can supply a
follow-up if need be.

The final commit is an unrelated fix that was brought to my attention
by sparse.

Tobias Waldekranz (4):
  net/fsl: xgmac_mdio: Add workaround for erratum A-009885
  dt-bindings: net: Document fsl,erratum-a009885
  powerpc/fsl/dts: Enable WA for erratum A-009885 on fman3l MDIO buses
  net/fsl: xgmac_mdio: Fix incorrect iounmap when removing module

 .../devicetree/bindings/net/fsl-fman.txt      |  9 ++++++
 arch/powerpc/boot/dts/fsl/qoriq-fman3l-0.dtsi |  2 ++
 drivers/net/ethernet/freescale/xgmac_mdio.c   | 28 ++++++++++++++-----
 3 files changed, 32 insertions(+), 7 deletions(-)

-- 
2.25.1

