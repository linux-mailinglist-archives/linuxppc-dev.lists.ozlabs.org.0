Return-Path: <linuxppc-dev+bounces-14154-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B7BC59623
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Nov 2025 19:10:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d6pGt3mh2z2yvX;
	Fri, 14 Nov 2025 05:10:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763057446;
	cv=none; b=XeIXs9wAVHRP6XJwhXfIuGNwe5TeBu65Zn2OS4WQoMVfYq2QSGM0p2FnwK2RE7LZrgdAIzQ1lUJwbZLEAD0cqqu4yXNFy5V77EhFuvlWIbC+QwTaNROgQt7CG4xq5pLB3Kl5QE/34G8aiIpLJ5umdcwkErKhxG2KP+vHXZvVXCrIsZfFxGa+APhgtS0zd/9hmGiicRfcDZZCOiKjAYu9Q/bV510mRETRGtnTg4493e6+mrsiY76nSq6bQKDYCi//QDlt2r4yvNgbDitf2wC+4dot9NidpI4Yr7Fez1rNkKT1da6g/TnJV0ljvZeY9fHUcjxYDmjmTCmeIvhWnUvX+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763057446; c=relaxed/relaxed;
	bh=87BEAOUBPph3TzBH1vV5g7Ztob9f0IjgY5bWUM5E6Ww=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I+gijsCNi7kyc8JK4LyZC/j2+ty2y62l6ASPUy8vU1pEsWx19uBWz4J9y7E+ZmB+FVcm+PbghjUfKfLy6Q+2G7KNdO7k+TTye6SnmvGWLzGTX0f6DpCBXjBmg5nbvgVuvQYTLlzQ0a5U0Jmm4X2OmGgJdDtD1WziFgKa8ryH7EwlIhjQrwqPhYSxj79fDo690W/c7YniNMyG7jXKTeDJ15+9r2uWABfggC+Zc9N9t7Gl4TW0r0tftGLMntMSIaXLBjpYxxHUtwOBRH/8Vg2wPaCJaxLp2pTlgh62Tftwu5tzccrbhk9znrMe23/5RPOcPjrKrDjYuTHzBYuNODpvhA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fsvGYUnh; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=fuchsfl@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fsvGYUnh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=fuchsfl@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d6pGr0Rtxz2yvJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Nov 2025 05:10:42 +1100 (AEDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-640b06fa959so2061151a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Nov 2025 10:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763057434; x=1763662234; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=87BEAOUBPph3TzBH1vV5g7Ztob9f0IjgY5bWUM5E6Ww=;
        b=fsvGYUnhZ59Xs2bt2/2A1bM1sdqHQJxIEWOhDQZ69EgRjREedVC6xUFEWxzjTys6nk
         MDNgpz+dhsIc88MeghIQk0caIcdhc1A5pOHr1Cm3SI6mUVXvM25iEz2wYBAe2z2XHdNQ
         hfzZmUPuk7H8pcLsbMCKgnnrHj+UsyXIxC2kkmMeoPm4Knw7uGFru5JvktTVGRjhygLZ
         BVPcdoRj3yEmsNE0u9VgRqaMIydqgc6R8/0wAddcumJmUFuXzfso+1qIEnngFOkZSqBm
         lt21q3fymXE+eldqJWmIwOKcjb46vZNO/AeZASYV/6Q6085GTjY4rX9iccEsPaQ3dIC2
         D4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763057434; x=1763662234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=87BEAOUBPph3TzBH1vV5g7Ztob9f0IjgY5bWUM5E6Ww=;
        b=n2lka+ZMq1WyFnW8iF7lVt5w8sllEqJu8VEFTzpR6nkykRFO/9I8bB5nmJeQsW16Rm
         1FErQAJOyJ09Dx2QFdR1MM5l3+V26LmLykdD0Ha0g3tOem1a4hQ9bHsHv/EFOmn460u9
         0HClO6CFBMV1B1x53JPt6IJBTJoTSa196ljbcN050k636FEo+M+hh92uSQVp5HiYOO0r
         CkjWIgK6erPc3FfnJwUXBswU9xGhiP5ny702w9LPL2XEBFT9LIVlibgax5C47lDMxMnr
         N7yCgEvS+O45YKVfJAOZv2CtQsaLP06phWugZDuo9/3o2yr4QP58wo9y8DhEI9S8e5Hq
         JMwg==
X-Forwarded-Encrypted: i=1; AJvYcCUORzm4QFD5OEPfGMA9bnwX3t3ZGgKwouUyUUK+NN5JxERjypIWBxyD199dhhAsAObmTuWumpWEcqHg23I=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yylbvgp1etVUWgT1cq15lj5CNbzDuY8G2+tJVb2L7tiLsM0gcJB
	ZASR3Md+mr9nwQsfAGRTdR0N9UH4+xp/NSdYvCVjvHAy+Mzv+ttleCc=
X-Gm-Gg: ASbGncu1Rvp3ZbsN/zwYnkwG76AAdTsozUZFeZ7K6Bon0bZHAW+0wxZEu+5KNFPgH+t
	Rdb022+/oo2+ppAfX8Q6sbnW+LNDPq7iGsG+GCBN+IVd87mwv28R+0/L1ZJgT7Xzxs1lBbP7D8t
	0xDT1T/z7EuxMHmuH2GoJozAzuzoajwg8bAFv1BiPavZHiKAkhzl8qwlMTVKJzsoLpmTFpFJN8L
	n8dGm2Lvu+03IGo+OnpPbvbBI71jKUCe4v/hWSfjZW0WGiYbE3qqRfOKBWj1SZEwJ553lmu1XTT
	Sm5iRDfY35Ie9e3Cq5BtVi50XAA2Vgh38EwNhH003AztOGahOGPc/3FCfMXO4k3aHyXzAGHn/ZX
	zqngz7yc4roWm0g87ej9Qpa17Qcc0ZfeMI+PS1s2fpUjVvukoyLr942cjPaT/Xn4NTt4yPoVoI8
	PsCOZxBVEDR6VH5tuB5quEEotMQeBZs6njIZ22gLVBKZz1SjdEhafcYjQtAMDvMQNCNb7D
X-Google-Smtp-Source: AGHT+IGz29WAKXKe+U4nMt5douwl+2MqO7amrWJcnBL9iYqpI8wTmeKa4ANLVfbfh8GHVmaNVscELw==
X-Received: by 2002:a17:907:78d:b0:b71:cec2:d54 with SMTP id a640c23a62f3a-b736796a61amr13099066b.57.1763057433996;
        Thu, 13 Nov 2025 10:10:33 -0800 (PST)
Received: from localhost ([2a02:810d:4a94:b300:bb0e:996a:397f:d689])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b734fd809fasm211020266b.45.2025.11.13.10.10.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 10:10:33 -0800 (PST)
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
	Masakazu Mokuno <mokuno@sm.sony.co.jp>,
	Jeff Garzik <jeff@garzik.org>,
	fuchsfl@gmail.com
Subject: [PATCH net v2] net: ps3_gelic_net: handle skb allocation failures
Date: Thu, 13 Nov 2025 19:10:00 +0100
Message-ID: <20251113181000.3914980-1-fuchsfl@gmail.com>
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
Changes v1->v2:
- Rename and declare return value of gelic_descr_prepare_rx() in the top
  of gelic_card_decode_one_descr() ret -> prepare_rx_ret
- Invert the order of calls in gelic_card_down() run napi_disable()
  first, then timer_delete_sync()
- Remove useless kdoc from gelic_rx_oom_timer()
- Fix gelic_net_poll() to reduce indentation level of success path

v1: https://lore.kernel.org/linuxppc-dev/20251110114523.3099559-1-fuchsfl@gmail.com/

Note: This change has been tested on real hardware Sony PS3 (CECHL04 PAL),
the patch was tested for many hours, with continuous system load, high
network transfer load and injected failslab errors.

 drivers/net/ethernet/toshiba/ps3_gelic_net.c | 45 +++++++++++++++-----
 drivers/net/ethernet/toshiba/ps3_gelic_net.h |  1 +
 2 files changed, 35 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/toshiba/ps3_gelic_net.c b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
index 5ee8e8980393..591866fc9055 100644
--- a/drivers/net/ethernet/toshiba/ps3_gelic_net.c
+++ b/drivers/net/ethernet/toshiba/ps3_gelic_net.c
@@ -260,6 +260,7 @@ void gelic_card_down(struct gelic_card *card)
 	if (atomic_dec_if_positive(&card->users) == 0) {
 		pr_debug("%s: real do\n", __func__);
 		napi_disable(&card->napi);
+		timer_delete_sync(&card->rx_oom_timer);
 		/*
 		 * Disable irq. Wireless interrupts will
 		 * be disabled later if any
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
@@ -981,16 +983,18 @@ static int gelic_card_decode_one_descr(struct gelic_card *card)
 	struct gelic_descr_chain *chain = &card->rx_chain;
 	struct gelic_descr *descr = chain->head;
 	struct net_device *netdev = NULL;
-	int dmac_chain_ended;
+	int dmac_chain_ended = 0;
+	int prepare_rx_ret;
 
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
@@ -1048,9 +1052,10 @@ static int gelic_card_decode_one_descr(struct gelic_card *card)
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
@@ -1062,10 +1067,11 @@ static int gelic_card_decode_one_descr(struct gelic_card *card)
 	gelic_descr_set_status(descr, GELIC_DESCR_DMA_NOT_IN_USE);
 
 	/*
-	 * this call can fail, but for now, just leave this
-	 * descriptor without skb
+	 * this call can fail, propagate the error
 	 */
-	gelic_descr_prepare_rx(card, descr);
+	prepare_rx_ret = gelic_descr_prepare_rx(card, descr);
+	if (prepare_rx_ret)
+		return prepare_rx_ret;
 
 	chain->tail = descr;
 	chain->head = descr->next;
@@ -1087,6 +1093,13 @@ static int gelic_card_decode_one_descr(struct gelic_card *card)
 	return 1;
 }
 
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
@@ -1099,14 +1112,22 @@ static int gelic_net_poll(struct napi_struct *napi, int budget)
 {
 	struct gelic_card *card = container_of(napi, struct gelic_card, napi);
 	int packets_done = 0;
+	int work_result = 0;
 
 	while (packets_done < budget) {
-		if (!gelic_card_decode_one_descr(card))
+		work_result = gelic_card_decode_one_descr(card);
+		if (work_result != 1)
 			break;
 
 		packets_done++;
 	}
 
+	if (work_result == -ENOMEM) {
+		napi_complete_done(napi, packets_done);
+		mod_timer(&card->rx_oom_timer, jiffies + 1);
+		return packets_done;
+	}
+
 	if (packets_done < budget) {
 		napi_complete_done(napi, packets_done);
 		gelic_card_rx_irq_on(card);
@@ -1576,6 +1597,8 @@ static struct gelic_card *gelic_alloc_card_net(struct net_device **netdev)
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

base-commit: fe82c4f8a228d3b3ec2462ea2d43fa532a20ac67
-- 
2.43.0


