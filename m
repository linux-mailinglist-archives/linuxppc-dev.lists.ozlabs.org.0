Return-Path: <linuxppc-dev+bounces-16591-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCf+H5Z0g2mFmwMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16591-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 17:32:22 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5DAEA475
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 17:32:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f5m8z1n3Yz2xpk;
	Thu, 05 Feb 2026 03:32:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::431"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770222739;
	cv=none; b=mRn6RD5x5f7LPrNakXmfcSsqap4ob3+P/oKxOBE1sVTs9opdM3kUss6kTM7ho5NJeSx0lnXvvrf8TzTWeMFY9vxSph31dgEd7jo0XhqYyEkJM0XBfsWlAMYhTlrvv3cE7CO88utEklFN06Jg47g3Y6ee79woB9h3K2WTHhpmNWK9x7KhHYO5j2TlDF8Z9ANgVPz8y+hukYMNzS+HxzI01AuN/yiZniVVBb87rqoRLqNjtyenbFdnkI0TfKJzoovpngL+vVmVueod3p1fwm4cV6bRukaE608wTyD80yCP0JJl/o/CoWp2yj7YQn429i5kf8rQLg5SbS5jzMzTtAfGVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770222739; c=relaxed/relaxed;
	bh=FhzKPlo/o1GqrY1Xo5QLsYHf6TE8sJz/yK5MOWUEpRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hBsBN87c+0bmuFH+eJjLIB3hHSM5rL01jgcwtZdGtWcV28Dr/4f4lj3miK1SNetPJyRW+XCeCUq2cFVtmnoqzeuA4VuQifFD3Ma/dKVkAoy5C2JC30UQYaFfGPQcusKcQtYzBS9fzzhW5yEfFgbrI4aUivGpoqBysfNRzI0qzFJnJ5jVKkqfkdA/vkSDqCSu2OqUxFeZGlfyfaDymQqWxrL+MuSxuJ6vcK47OldbasIg/WOnkz8VDjFVgOrWTfVzZ/KQ6lrw7PzMol2g2TkiJZENe54BscSFX558pIcUbJZml47F9BMPanbcqbx4xBW/8q9RG9lWh+ftLxkpG6ASKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=H8vRK7BR; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com; envelope-from=fourier.thomas@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=H8vRK7BR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com; envelope-from=fourier.thomas@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f5m8x3PM7z2xJ5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Feb 2026 03:32:17 +1100 (AEDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-43590a7115aso9130f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Feb 2026 08:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770222733; x=1770827533; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FhzKPlo/o1GqrY1Xo5QLsYHf6TE8sJz/yK5MOWUEpRg=;
        b=H8vRK7BRbk7JCO7VtQrvOM9Gn5jhxUWTX83Fyb5WBNMWw0i2GBALlC3QTqnf/msqS7
         er8XY5qxMcTKDOtKTXeOiYi2b0bBMPPEJAaLcLHWUFYBG14f6jeVIIj+cCoOKw5sWrQe
         xTbV/8A3OG0PNRCoxh0i7q97zrBjREOG8X5PG7fLYQGcWxZqdfNv5b7CB/y3433y3nuN
         NdIpURKsdpA9+lB7UlIx3QzDLnJXFQlxgyxC/GAa57BHJP2/tBH62VL1Il3QFxsDXzwi
         SjNCsR9dertov5aeBXshuDBUFSxSnWgi6qcsOTOGtoxuJLklmm5o0YBcTEAssDIXY+sA
         atfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770222733; x=1770827533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FhzKPlo/o1GqrY1Xo5QLsYHf6TE8sJz/yK5MOWUEpRg=;
        b=O4udP8EiYaa6ZNg0/SbkshKQSF1jf+VDs43CAB+/qagyRqv1aJkSP5GSRZ+BEwhDe9
         UkFhIsXJEBFXPjyw9qs4cI/+I9mqvRczRI65n15s03AnUXzRiInQ/yUYS2SKCF8igYD8
         Amvqciu4hKI94Db9jyqEY1CKPNor3+eohQmNGT57EPQ9LjgDedcs89QxwpvfArxBfgtd
         FvGoL3yl/FlSIS4Rg+cuI3hSI3OyVXhfArLf1IMby2fwEgMCMDkbGoH+rBIuXvqaYpfr
         Ix6KXhbIltihawjuZKetkHnH4EpVpn/aPvou9rUCFaXpoyPIPniJ8l9cuEUkZYZtSzwc
         Q9nw==
X-Forwarded-Encrypted: i=1; AJvYcCXcdhQzt5n7FVNQZb0zMKto/X0JuEYIo06HGpfw7ZILI6xB8R3tfdWTf4ftWoC2KjfCnR/MoMzqWuDpb0Y=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxd1mP5TpdC7+0x1SYekTo+dfXDybRMHlp/HKDW9BkHNz40RkYu
	+mTakhyreYyW+QxCRxkczAq3zNSzd8Lvm3Bz0RjWsXOftt/R7PCPKYhs
X-Gm-Gg: AZuq6aL9vRHAyC9hLdD6M9R4QcG0FKfgyei8Yb4T/AcTCsjBRLXIx3F/vNaUdE25Kf5
	gdsOP/CSToqIhBbq23apxSn/pPuE/U12lY6ORYLL/vdpZ87tSHycdyS5n32ddu4P4MqxGRAM7r0
	ahv2ZMEmfni1OAJDgAKhvFJkiREwe93SOPhoREn6LYKFZVnXcNMw0ELEFzpQrHh6uXrs8mjaICG
	svUhKNK6XP57q7Q/pBztM+YlJrsru4l4xeg53T31WHNaCR+tqjtUcvxasFB/7TWSy42p4WRvalM
	AtejrFCIgnf0pdaUnEtZSBFcnhOgIexYFCxv9G/sOk8aL7FKp+bmR7OX6wFw51xC6V43C9x7FS0
	kYL7ZN3zkuA0KSDmO5fyo6XZaSCvJY6tuAXbSQ5zl0lhhPpcvOZPWt7UJ3V8KI5jc4XUDT/tFnT
	T6SoHQL0WxTPy/1Ru50s6wUoK91vJsuJDyW4CDTSJkB+rJE/TutVc57YbxA4dyka1uZAjQdAqvp
	0Xkbtk=
X-Received: by 2002:a05:6000:4205:b0:435:91a5:1325 with SMTP id ffacd0b85a97d-43619405830mr2296210f8f.7.1770222733044;
        Wed, 04 Feb 2026 08:32:13 -0800 (PST)
Received: from thomas-precision3591.paris.inria.fr (wifi-pro-83-213.paris.inria.fr. [128.93.83.213])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-43617e25683sm7377005f8f.6.2026.02.04.08.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 08:32:12 -0800 (PST)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	stable@vger.kernel.org,
	Zhao Qiang <qiang.zhao@nxp.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net: wan/fsl_ucc_hdlc: Fix dma_free_coherent() in uhdlc_memclean()
Date: Wed,  4 Feb 2026 17:25:47 +0100
Message-ID: <20260204162548.94160-3-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.43.0
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,nxp.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16591-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[fourierthomas@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:fourier.thomas@gmail.com,m:stable@vger.kernel.org,m:qiang.zhao@nxp.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:netdev@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:fourierthomas@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fourierthomas@gmail.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 8D5DAEA475
X-Rspamd-Action: no action

The priv->rx_buffer and priv->dma_rx_addr are alloc'd together as
contiguous buffers in uhdlc_init() but freed as two buffers in
uhdlc_memclean().

Change the cleanup to only call dma_free_coherent() once on the whole
buffer.

Fixes: c19b6d246a35 ("drivers/net: support hdlc function for QE-UCC")
Cc: <stable@vger.kernel.org>
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/net/wan/fsl_ucc_hdlc.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/net/wan/fsl_ucc_hdlc.c b/drivers/net/wan/fsl_ucc_hdlc.c
index f999798a5612..59cd861d13d6 100644
--- a/drivers/net/wan/fsl_ucc_hdlc.c
+++ b/drivers/net/wan/fsl_ucc_hdlc.c
@@ -790,19 +790,11 @@ static void uhdlc_memclean(struct ucc_hdlc_private *priv)
 
 	if (priv->rx_buffer) {
 		dma_free_coherent(priv->dev,
-				  RX_BD_RING_LEN * MAX_RX_BUF_LENGTH,
+				  (RX_BD_RING_LEN + TX_BD_RING_LEN) * MAX_RX_BUF_LENGTH,
 				  priv->rx_buffer, priv->dma_rx_addr);
 		priv->rx_buffer = NULL;
 		priv->dma_rx_addr = 0;
 	}
-
-	if (priv->tx_buffer) {
-		dma_free_coherent(priv->dev,
-				  TX_BD_RING_LEN * MAX_RX_BUF_LENGTH,
-				  priv->tx_buffer, priv->dma_tx_addr);
-		priv->tx_buffer = NULL;
-		priv->dma_tx_addr = 0;
-	}
 }
 
 static int uhdlc_close(struct net_device *dev)
-- 
2.43.0


