Return-Path: <linuxppc-dev+bounces-14553-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4942C95440
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Nov 2025 20:52:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dKHjx25Pmz2yvV;
	Mon, 01 Dec 2025 06:52:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::332"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764532325;
	cv=none; b=YyogiLE2ifAsdOMNfk40f7wq1Xriz/ESIm7I40FgZk/7HmaJG4fndvtLokMO317ccl0uQ9JldH1QQO/PfZGSW3wWVD5n3/Bcu6NdnC9p/VHN5yyJpFyhRBjnGlOJgeY/5W7EXCh4APFRAHxTY9wM2/cJqTEzm81VEB7nPhOdv8Wext1VBputRcmIETGVaza8PTQBGQgZtc8rHE8yjJm/nXLHF+0NiRis+svA9I9RBlfSUQ2IHxelbYeQJPP0IcEg4ogHRTy3Jxud4DMJF0NBNH9ZHNMgpIMGN5PmeEDNkHyDyUbzJDvgOnKYF0+ZNArXEH4d2nVJzQLtunPvUxHWZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764532325; c=relaxed/relaxed;
	bh=/DEo1+0Da+YijlU/Zfn1c1EqlK38ud5yDKP0+nxdYn8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KNoUSTmgkYiJslDxbJ9CHef6zPrQCaTt6hHDMNkkvaVEInlwjZSecLEa4ev1FK6ivgoK3nwR3I1y4T4DgngNPSKCFBQ5W7De6fsYbvSrzdZ2xsazDKrNFw90yzn+HnsGu8Hm0t/o1m9Y7vO7ExXy4iFxQnAG0AFO9GyDYZrWohwbQQXQOX5aYaWcy8fJRU0TPl9XDaTYZzrAPvBdBAZzP5sv2yJcap4RksSODbOQAegBfF7c+YKReoi6wqLERjfT1zX6BXA5A09awazFspJx2AmJAKZcgxyOO+rf9ZBbn4VUi4FdlmJ3/NelLjqWx56hQu9SuKDvMCK8eSDYPI+J2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iwzEVREI; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=fuchsfl@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iwzEVREI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=fuchsfl@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dKHjt6B3mz2yqP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Dec 2025 06:52:01 +1100 (AEDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so34014005e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Nov 2025 11:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764532318; x=1765137118; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/DEo1+0Da+YijlU/Zfn1c1EqlK38ud5yDKP0+nxdYn8=;
        b=iwzEVREIdTmMuZejo3yEGsri+2PpXN7wGHtak5jL1ahr8E2nzHaNw+rxw56kCtKwiF
         gynpr969lfC5e+waFTIgWTHhMer9XCaA9DSQQUdswL6Qzp+ToXYIXcDDnwS9G3gH0sHF
         RytGCuGisSvrodfxKuG6O5rVAp25W9V0K3on40yxydnzNQyd6DHK3mDwWZhmm9GXdY4m
         MZ8X2jz/ng0qgbToN825JpVty2tfM63lLqGbfMIM2i8uF6mv8ey/QJx9p5RcuRDB2T8Y
         ejOy1992S3dych4B/Gnt2wZ80xGSEoGbwFIdyz5SNwGzGfdEdq08n5DOMREuBo+kt9cl
         1mag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764532318; x=1765137118;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/DEo1+0Da+YijlU/Zfn1c1EqlK38ud5yDKP0+nxdYn8=;
        b=HWQBY/b5+C5SlYq9nYWcbD4ayChPrIAkavaePsZdvqr53gzVSyCA0PTswzkJuHspzH
         3WT9FQbXWR82Gxt/vJG3SXOPir5rEfk/I4MmlXB50VBqLLAdsNEKbQ6+ACIFYMN22X9Q
         XV0ZemPs5IwpXjbOgDKPBPAm9VLnSJMhontKlLZ3wNXrXvOUmWvo2xn01mfEUt8JZDi8
         i0fYNJduk0FPMRCW6vwWQiz+2r0fgIgue3F9VqXcHv2F7Ixy4gUaWCoj8vbgfYLwsXCT
         HmpNjuxcsCi4eKDhB1JxEPgg7p1bNdMdju45wL4qCsaf+gHIft+phgf8+BcuxtZU32Gr
         3xHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWenvmKp7V0iCXoxfavp3cVh97PYUq0yvZ0wVwBdsvSRsZuX5Z42bIvKAmdM8n3PoXaAXjYUDCc9duNh4M=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwJwW6INN0uHYet8A2GdTKEYQ70dgH8eZriO+D7J5BD6AdVzcDx
	nu4s0TKWNhtxyPrFC0gs3pzA0XcV2O8nmkShZRLuePwafR5CJkJoMmw=
X-Gm-Gg: ASbGncsGvgVXzblYR8/BBx2mWbGqWWRAKpxhQHEv/6LW1HQHEiBRIELFkfpmsh0y+W8
	fNBezAIo/Eth34FeaLWigq3SuOKhrGti9ykyS0ssTqXvfLbi3uJ7ZbQiyjL4KpD2LIaAngeCSWe
	QzQNWKENhYtVdcsWtiU8kd+p3jRQcpn82V+mjpK3nZfDhyx/Lf+dSL6x0DD2kC1HZT9R2trWhvs
	e9ELxjOkQ+Eo1sjxxNgi/DJhBmHPcF03WoSGFhYTZkYNFP1zHgqHbZU7Mzwgx3m/KcOYP7rk+yY
	Aeo2PgZxYZtcRpxA8UONh1XqRl7cstepnEuad/xf2le1slwGFUdYipckNHdwcgnxaCm1MTUQVTD
	+KGY8mszrkBQmSK8wy4uyua84PwS2u85vzSuB3geWB0awT6bKJdLcKfifK19vkM07+FgQijnWLH
	l1P9ej8PC//EEbr9p59yG3jjQU7i5xXQ+eNP5SjMKEY0c72OHnxlcFmdbpUz0Dg//IyA9h
X-Google-Smtp-Source: AGHT+IHpMEnKorixDu8qIt6p2z3sKWM6DYKhdWytPD6KeENQCqF5f7FvWF1BtO+epXxKsRq5U6IKMw==
X-Received: by 2002:a05:600c:3543:b0:477:1ae1:fa5d with SMTP id 5b1f17b1804b1-477c1142268mr303410735e9.20.1764532317801;
        Sun, 30 Nov 2025 11:51:57 -0800 (PST)
Received: from localhost ([2a02:810d:4a94:b300:c379:32d5:1107:4f59])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4790b0cc1d6sm258597365e9.12.2025.11.30.11.51.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Nov 2025 11:51:57 -0800 (PST)
From: Florian Fuchs <fuchsfl@gmail.com>
To: Geoff Levand <geoff@infradead.org>,
	netdev@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	fuchsfl@gmail.com
Subject: [PATCH net-next] net: ps3_gelic_net: Use napi_alloc_skb() and napi_gro_receive()
Date: Sun, 30 Nov 2025 20:41:55 +0100
Message-ID: <20251130194155.1950980-1-fuchsfl@gmail.com>
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
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Use the napi functions napi_alloc_skb() and napi_gro_receive() instead
of netdev_alloc_skb() and netif_receive_skb() for more efficient packet
receiving. The switch to napi aware functions increases the RX
throughput, reduces the occurrence of retransmissions and improves the
resilience against SKB allocation failures.

Signed-off-by: Florian Fuchs <fuchsfl@gmail.com>
---
Note: This change has been tested on real hardware Sony PS3 (CECHL04 PAL),
the patch was tested for many hours, with continuous system load, high
network transfer load and injected failslab errors.

In my tests, the RX throughput increased up to 100% and reduced the
occurrence of retransmissions drastically, with GRO enabled:

iperf3 before and after the commit, where PS3 (with this driver) is on
the receiving side:
Before: [  5]   0.00-10.00  sec   551 MBytes   462 Mbits/sec receiver
After:  [  5]   0.00-10.00  sec  1.09 GBytes   939 Mbits/sec receiver

stats from the sending client to the PS3:
Before: [  5]   0.00-10.00  sec   552 MBytes   463 Mbits/sec  3151 sender
After:  [  5]   0.00-10.00  sec  1.09 GBytes   940 Mbits/sec   37  sender

 drivers/net/ethernet/toshiba/ps3_gelic_net.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/toshiba/ps3_gelic_net.c b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
index 591866fc9055..d35d1f3c10a1 100644
--- a/drivers/net/ethernet/toshiba/ps3_gelic_net.c
+++ b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
@@ -364,6 +364,7 @@ static int gelic_card_init_chain(struct gelic_card *card,
  * gelic_descr_prepare_rx - reinitializes a rx descriptor
  * @card: card structure
  * @descr: descriptor to re-init
+ * @napi_mode: is it running in napi poll
  *
  * return 0 on success, <0 on failure
  *
@@ -374,7 +375,8 @@ static int gelic_card_init_chain(struct gelic_card *card,
  * must be a multiple of GELIC_NET_RXBUF_ALIGN.
  */
 static int gelic_descr_prepare_rx(struct gelic_card *card,
-				  struct gelic_descr *descr)
+				  struct gelic_descr *descr,
+				  bool napi_mode)
 {
 	static const unsigned int rx_skb_size =
 		ALIGN(GELIC_NET_MAX_FRAME, GELIC_NET_RXBUF_ALIGN) +
@@ -392,7 +394,10 @@ static int gelic_descr_prepare_rx(struct gelic_card *card,
 	descr->hw_regs.payload.dev_addr = 0;
 	descr->hw_regs.payload.size = 0;
 
-	descr->skb = netdev_alloc_skb(*card->netdev, rx_skb_size);
+	if (napi_mode)
+		descr->skb = napi_alloc_skb(&card->napi, rx_skb_size);
+	else
+		descr->skb = netdev_alloc_skb(*card->netdev, rx_skb_size);
 	if (!descr->skb) {
 		descr->hw_regs.payload.dev_addr = 0; /* tell DMAC don't touch memory */
 		return -ENOMEM;
@@ -464,7 +469,7 @@ static int gelic_card_fill_rx_chain(struct gelic_card *card)
 
 	do {
 		if (!descr->skb) {
-			ret = gelic_descr_prepare_rx(card, descr);
+			ret = gelic_descr_prepare_rx(card, descr, false);
 			if (ret)
 				goto rewind;
 		}
@@ -964,7 +969,7 @@ static void gelic_net_pass_skb_up(struct gelic_descr *descr,
 	netdev->stats.rx_bytes += skb->len;
 
 	/* pass skb up to stack */
-	netif_receive_skb(skb);
+	napi_gro_receive(&card->napi, skb);
 }
 
 /**
@@ -1069,7 +1074,7 @@ static int gelic_card_decode_one_descr(struct gelic_card *card)
 	/*
 	 * this call can fail, propagate the error
 	 */
-	prepare_rx_ret = gelic_descr_prepare_rx(card, descr);
+	prepare_rx_ret = gelic_descr_prepare_rx(card, descr, true);
 	if (prepare_rx_ret)
 		return prepare_rx_ret;
 

base-commit: ff736a286116d462a4067ba258fa351bc0b4ed80
-- 
2.43.0


