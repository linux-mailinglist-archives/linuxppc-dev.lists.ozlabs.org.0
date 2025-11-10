Return-Path: <linuxppc-dev+bounces-14012-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05293C47CB3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Nov 2025 17:10:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d4vkx5lxhz2xqj;
	Tue, 11 Nov 2025 03:10:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762778139;
	cv=none; b=Kk6CNml3XiRGxqbgb0WRcbebG4gQ7HKvndiPiPWFseVx8QM4qlHi7xtBHRIRzhfAqF0zwOgZSVZDwqAqrfeZpwd7k17mejjpIcjKCOEt/2jNaBlYwkayBF09HUoMviUWTjrc8o6ludaLADJfl0rVIcMxoS/pdjPmDmbRbDSD6A2mFzr0a6yh83UFrq638OGAFNppZfOpuyPwhJevpne1fZjoYNYmDHNw/73XQqITovgUYmwkXQiOjAQ68Mlju+rIMx2BlJ3l7XdRNa4h+BVYsHh4yyjDInRRy3jZoJVLLzhROkXaxFvrDL5eLcaNANbdsJ7MybUwpfofi9rD5bhaBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762778139; c=relaxed/relaxed;
	bh=a9yuBGJK7ItWgGt5SCLQHjsgMyP28LPonF6RXSUDMaw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AgY8BRFtIgEPx8MSB+MLtffuJz+8ktKKowAEmhO62cnaq6DgPtqkinjqMQCLGu8f/CeS3sFS/QYy2N/tGQJIZv4SCOYwXk41kOxU3740+CWOTKHXGGTW581oRMR8Vs2qLwqLGZcV5dD9Pj18Xxl5C1B9uJmdqwznKRcPzO4LHjPSi/rbnsKAV8fv/BRz4mJS4sjC9WYneE1oIrAr9uLDZdteQTqOTRDgCjs9Txn5wpGw93BVnVSwy5GZWrKRXz9gq6rPngNt6tzkpGzfHXz2GY3pYeN0aRxOMw0++hCc9bKNQggipICfhj9XHRH88HUrCa5/SIisilIPL5q1pQsBtg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YFQ+69No; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=fuchsfl@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YFQ+69No;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=fuchsfl@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d4pzY6bpkz2xFT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Nov 2025 23:35:37 +1100 (AEDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6407e617ad4so5055284a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Nov 2025 04:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762778128; x=1763382928; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a9yuBGJK7ItWgGt5SCLQHjsgMyP28LPonF6RXSUDMaw=;
        b=YFQ+69No6lemmNIZ5EYfVfMGnq3fW2C2imb7AeKFcph3bNpHVuEvmTPQeobztsvTfH
         WSkGSs0QiVJCgqSMA8X71bzXKOgkEbDgLK/GYBqW9i9W0abJizhm5rCZ8/RXMemh+lWB
         UGPcef8irPTgDdYIO8jZNau+4yXgs/WnSmtq0ZGAKvy/EC/4cluGgOUoS3APWdGgw3uT
         mWPwzqFZCmxTH64r7UWBvGNNqau/BOAtE4yXftq3KJUtsgkyORbH+6V28SzlZXvYA/Ok
         d+4VEXo5vgGOyDsIJKkvn2D8ftUHnuzuaqwTwey2zecwhMPT6KP3qWFBF35OiWeK/3Cs
         jmUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762778128; x=1763382928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9yuBGJK7ItWgGt5SCLQHjsgMyP28LPonF6RXSUDMaw=;
        b=MVSUoVn7IfK0MdIw7xXVRIdZg9hpvtiPlB6RxeHVfgq23kiB52rBgdHab845KUqLXh
         VJWj/ZTsuLLhtyW+iqShIeWnnX2SigQtYYKcUIzBNkCXijF21jpqgcdY8PbZSDTFR/K3
         CHEDgOg+BHQAcgz2VhGY0OLrbL1QCO5QUV+pe9PTH9sjEWRUsY6ccl74RQ6raKSPrl+Q
         0Ve9I0OY6+NA1TqNWxAZyNaBQqh6UmVTy3qalmDJMqMs4Ls9k5E+2BzITl5s8z6FKhlD
         DWhShCS9X4bLECxM8Ot0iWVyVPZZkUlo0yba/Ouz8w3U/GGTaNqvim68PDcrymEh+3Rc
         Xcsw==
X-Forwarded-Encrypted: i=1; AJvYcCWbvpd7M3P4LinoUVerf0lT3BcWHFgbtu+SfzjV1jLJVztu8aGEZO4hdPoEz+ULhlH4iimCRRwpQpt7xnM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YybSQ/Bes3kJI7pU+ngCkgI8MUtJtV6c+09UfMocVhgkSEyGbSK
	sH+79zjGphX5+808Xo13WFeGQgM3Gq9saxIHkcj66dD/bgS8b6k1IXY=
X-Gm-Gg: ASbGncut37WwYYjMPVP/Ryw7HE5l87J8os3sgMjXnjG9JFJ4+EjY0QeTvgmLTstHm8F
	tS63LLiXLq0R7xDRqee+DMWbVFyxH87TMbrKKn1xUD1DAf379arPd5r3yIjDCNdP4rSpiW4bMqQ
	jCpZ3ZMfnbDuWdIMUfbF8blZj6nhLFY78cz1unWQ3e9OnPrYjdPZk3iLAmtmyN+jVEJIhG8O10R
	2PSpMWFkCsG9MA7qva94X8eNVNClyAV9C5c4PGXEAie/uYdZ8LwEkCAnM/jwLTYMD0ylsNyDhzO
	vstUYkbbv0+XO0Wa9CwHugEvrPNBytsDxX5YavAr5T50WsXcCyFb2TxjxuHQpvrXNPsogkkFXmd
	+AEwnrl9+HAbjYNbnyPGfBVqHYrPsJKoLCTkR/ajpmZJ5x9gS66pe08m2xNx7rKNKzn8jAbUGFB
	Lhmd9VnMOLxRPR4psclFKhN3vM/VfmpVIa050sSpl5dlmbCi9UQvOrPZTzVA==
X-Google-Smtp-Source: AGHT+IEpiarrykSHgarbY66mp2ewInXdQS9oj/GI/fOZRk6M3rULM73l5HZ28Hq1eYhWA54E7K5p2A==
X-Received: by 2002:aa7:cfc3:0:b0:641:997e:d53a with SMTP id 4fb4d7f45d1cf-641997edc9bmr1574561a12.2.1762778128212;
        Mon, 10 Nov 2025 04:35:28 -0800 (PST)
Received: from localhost ([2a02:810d:4a94:b300:bca7:1050:d604:3b82])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-6411f86e0cesm11390383a12.33.2025.11.10.04.35.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 04:35:27 -0800 (PST)
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
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	fuchsfl@gmail.com
Subject: [PATCH net] net: ps3_gelic_net: handle skb allocation failures
Date: Mon, 10 Nov 2025 12:45:23 +0100
Message-ID: <20251110114523.3099559-1-fuchsfl@gmail.com>
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

Handle skb allocation failures in RX path, to avoid NULL pointer
dereference and RX stalls under memory pressure. If the refill fails
with -ENOMEM, complete napi polling and wake up later to retry via timer.
Also explicitly re-enable RX DMA after oom, so the dmac doesn't remain
stopped in this situation.

Previously, memory pressure could lead to skb allocation failures and
subsequent Oops like:

	Oops: Kernel access of bad area, sig: 11 [#2]
	Hardware name: SonyPS3 Cell Broadband Engine 0x701000 PS3
	NIP [c0003d0000065900] gelic_net_poll+0x6c/0x2d0 [ps3_gelic] (unreliable)
	LR [c0003d00000659c4] gelic_net_poll+0x130/0x2d0 [ps3_gelic]
	Call Trace:
	  gelic_net_poll+0x130/0x2d0 [ps3_gelic] (unreliable)
	  __napi_poll+0x44/0x168
	  net_rx_action+0x178/0x290

Steps to reproduce the issue:
	1. Start a continuous network traffic, like scp of a 20GB file
	2. Inject failslab errors using the kernel fault injection:
	    echo -1 > /sys/kernel/debug/failslab/times
	    echo 30 > /sys/kernel/debug/failslab/interval
	    echo 100 > /sys/kernel/debug/failslab/probability
	3. After some time, traces start to appear, kernel Oopses
	   and the system stops

Step 2 is not always necessary, as it is usually already triggered by
the transfer of a big enough file.

Fixes: 02c1889166b4 ("ps3: gigabit ethernet driver for PS3, take3")
Signed-off-by: Florian Fuchs <fuchsfl@gmail.com>
---
 drivers/net/ethernet/toshiba/ps3_gelic_net.c | 54 +++++++++++++++-----
 drivers/net/ethernet/toshiba/ps3_gelic_net.h |  1 +
 2 files changed, 42 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/toshiba/ps3_gelic_net.c b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
index 5ee8e8980393..a8121f7583f9 100644
--- a/drivers/net/ethernet/toshiba/ps3_gelic_net.c
+++ b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
@@ -259,6 +259,7 @@ void gelic_card_down(struct gelic_card *card)
 	mutex_lock(&card->updown_lock);
 	if (atomic_dec_if_positive(&card->users) == 0) {
 		pr_debug("%s: real do\n", __func__);
+		timer_delete_sync(&card->rx_oom_timer);
 		napi_disable(&card->napi);
 		/*
 		 * Disable irq. Wireless interrupts will
@@ -970,7 +971,8 @@ static void gelic_net_pass_skb_up(struct gelic_descr *descr,
  * gelic_card_decode_one_descr - processes an rx descriptor
  * @card: card structure
  *
- * returns 1 if a packet has been sent to the stack, otherwise 0
+ * returns 1 if a packet has been sent to the stack, -ENOMEM on skb alloc
+ * failure, otherwise 0
  *
  * processes an rx descriptor by iommu-unmapping the data buffer and passing
  * the packet up to the stack
@@ -981,16 +983,17 @@ static int gelic_card_decode_one_descr(struct gelic_card *card)
 	struct gelic_descr_chain *chain = &card->rx_chain;
 	struct gelic_descr *descr = chain->head;
 	struct net_device *netdev = NULL;
-	int dmac_chain_ended;
+	int dmac_chain_ended = 0;
 
 	status = gelic_descr_get_status(descr);
 
 	if (status == GELIC_DESCR_DMA_CARDOWNED)
 		return 0;
 
-	if (status == GELIC_DESCR_DMA_NOT_IN_USE) {
+	if (status == GELIC_DESCR_DMA_NOT_IN_USE || !descr->skb) {
 		dev_dbg(ctodev(card), "dormant descr? %p\n", descr);
-		return 0;
+		dmac_chain_ended = 1;
+		goto refill;
 	}
 
 	/* netdevice select */
@@ -1048,9 +1051,10 @@ static int gelic_card_decode_one_descr(struct gelic_card *card)
 refill:
 
 	/* is the current descriptor terminated with next_descr == NULL? */
-	dmac_chain_ended =
-		be32_to_cpu(descr->hw_regs.dmac_cmd_status) &
-		GELIC_DESCR_RX_DMA_CHAIN_END;
+	if (!dmac_chain_ended)
+		dmac_chain_ended =
+			be32_to_cpu(descr->hw_regs.dmac_cmd_status) &
+			GELIC_DESCR_RX_DMA_CHAIN_END;
 	/*
 	 * So that always DMAC can see the end
 	 * of the descriptor chain to avoid
@@ -1062,10 +1066,12 @@ static int gelic_card_decode_one_descr(struct gelic_card *card)
 	gelic_descr_set_status(descr, GELIC_DESCR_DMA_NOT_IN_USE);
 
 	/*
-	 * this call can fail, but for now, just leave this
-	 * descriptor without skb
+	 * this call can fail, propagate the error
 	 */
-	gelic_descr_prepare_rx(card, descr);
+	int ret = gelic_descr_prepare_rx(card, descr);
+
+	if (ret)
+		return ret;
 
 	chain->tail = descr;
 	chain->head = descr->next;
@@ -1087,6 +1093,17 @@ static int gelic_card_decode_one_descr(struct gelic_card *card)
 	return 1;
 }
 
+/**
+ *  gelic_rx_oom_timer - Restart napi poll if oom occurred
+ *  @t: timer list
+ */
+static void gelic_rx_oom_timer(struct timer_list *t)
+{
+	struct gelic_card *card = timer_container_of(card, t, rx_oom_timer);
+
+	napi_schedule(&card->napi);
+}
+
 /**
  * gelic_net_poll - NAPI poll function called by the stack to return packets
  * @napi: napi structure
@@ -1099,12 +1116,21 @@ static int gelic_net_poll(struct napi_struct *napi, int budget)
 {
 	struct gelic_card *card = container_of(napi, struct gelic_card, napi);
 	int packets_done = 0;
+	int work_result = 0;
 
 	while (packets_done < budget) {
-		if (!gelic_card_decode_one_descr(card))
-			break;
+		work_result = gelic_card_decode_one_descr(card);
+		if (work_result == 1) {
+			packets_done++;
+			continue;
+		}
+		break;
+	}
 
-		packets_done++;
+	if (work_result == -ENOMEM) {
+		napi_complete_done(napi, packets_done);
+		mod_timer(&card->rx_oom_timer, jiffies + 1);
+		return packets_done;
 	}
 
 	if (packets_done < budget) {
@@ -1576,6 +1602,8 @@ static struct gelic_card *gelic_alloc_card_net(struct net_device **netdev)
 	mutex_init(&card->updown_lock);
 	atomic_set(&card->users, 0);
 
+	timer_setup(&card->rx_oom_timer, gelic_rx_oom_timer, 0);
+
 	return card;
 }
 
diff --git a/drivers/net/ethernet/toshiba/ps3_gelic_net.h b/drivers/net/ethernet/toshiba/ps3_gelic_net.h
index f7d7931e51b7..c10f1984a5a1 100644
--- a/drivers/net/ethernet/toshiba/ps3_gelic_net.h
+++ b/drivers/net/ethernet/toshiba/ps3_gelic_net.h
@@ -268,6 +268,7 @@ struct gelic_vlan_id {
 struct gelic_card {
 	struct napi_struct napi;
 	struct net_device *netdev[GELIC_PORT_MAX];
+	struct timer_list rx_oom_timer;
 	/*
 	 * hypervisor requires irq_status should be
 	 * 8 bytes aligned, but u64 member is

base-commit: 96a9178a29a6b84bb632ebeb4e84cf61191c73d5
-- 
2.43.0


