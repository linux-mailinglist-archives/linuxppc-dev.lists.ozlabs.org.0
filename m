Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 788944FDD0A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 13:08:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kd2yC3VhHz3fGj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 21:08:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=k5d4BJQU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52c;
 helo=mail-ed1-x52c.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=k5d4BJQU; dkim-atps=neutral
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kd2m12z0wz3bYy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Apr 2022 20:59:13 +1000 (AEST)
Received: by mail-ed1-x52c.google.com with SMTP id w18so21825982edi.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Apr 2022 03:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8gQ6t5VVe/uNOUtGlR6al3lXmeQqaLcWf63crRRXcTk=;
 b=k5d4BJQUWbrYgrpJj8fdrxKNd0SI1t4byvzs/kLRovHkFvzheN5XoaJeUSmHWy1z5+
 G5Fpiiu7ef/yCnHOJCUGJ93cYOMzvJZCfQcdNPi2YUOXnEzwFzLdtHS0aPhTyP+HiK0p
 LcCWd8b64+3PZ9IObEW24vfr+j+6g4i3Mg5tyJAbWPKYFLQ0dgfDkcX5nYmdcL1jK8By
 fmb57i3fnbHVMC5wHmqvjwCJQQKg1xDyFVmdP4ZGibnbuCaQdiTxPNIBt7ezZ/pRk7K7
 UcXXoKdJ8izMDX11hccsEj1VbMT8BwF3B+E7x9H2s+/iFGjafwGZcTND1RR9vqNiPJw9
 gwNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8gQ6t5VVe/uNOUtGlR6al3lXmeQqaLcWf63crRRXcTk=;
 b=K7yyOr+4hStrowLBBOsluvdtJIp2YkyRlgobyvgfTRBo2NmwAK/RfbU+NjZiZYgn9P
 ereuLJMfkU0ZueUkkQNXA3ETp0A5uwodp5T0FlqSFKjF5XLfutPdCGa5Mjn8J4xvSJ2i
 Ihdfz7+9O3GDWwfUCvrGWuUjDZiowLX52BTzhu/2sBfUjo08D7XEK7wCIcgf3h8fblAW
 480xxpE/y5evQC/mxQohdjXhxf54K4dx6iXDzGMKUKEQMeTGhyT9g1CKGG1rWR3DQeqx
 h3lznfViyL6IriqCFaB48aLSuptIWYKEeg9H6Nxxm3LItpxyxl4sCySe/navKSH+Q79I
 P81Q==
X-Gm-Message-State: AOAM533ZeUWZDXxMcrKA3GIZPgdd9KBvKXSQVBbR5gzV1VmmZDQhB255
 6MQa+WV3jb5/cEyqZV6u0Fo=
X-Google-Smtp-Source: ABdhPJz//QqFUOZQmqJ6nLmpzZRJxNW+5wj6QSPtLJAJrD0qf6F3toSCEta4MTg4CC0fCCaAdc6EzQ==
X-Received: by 2002:aa7:d39a:0:b0:41d:828d:c75 with SMTP id
 x26-20020aa7d39a000000b0041d828d0c75mr7570738edq.27.1649761150095; 
 Tue, 12 Apr 2022 03:59:10 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 f1-20020a056402194100b00416b174987asm16986370edz.35.2022.04.12.03.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 03:59:09 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH net-next v2 14/18] sfc: Remove usage of list iterator for
 list_add() after the loop body
Date: Tue, 12 Apr 2022 12:58:26 +0200
Message-Id: <20220412105830.3495846-15-jakobkoschel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412105830.3495846-1-jakobkoschel@gmail.com>
References: <20220412105830.3495846-1-jakobkoschel@gmail.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Song Liu <songliubraving@fb.com>,
 Alexei Starovoitov <ast@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Paul Mackerras <paulus@samba.org>, Ariel Elior <aelior@marvell.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 "Bos, H.J." <h.j.bos@vu.nl>, linux-arm-kernel@lists.infradead.org,
 Martin Habets <habetsm.xilinx@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Vivien Didelot <vivien.didelot@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
 Arnd Bergmann <arnd@arndb.de>, KP Singh <kpsingh@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Colin Ian King <colin.king@intel.com>, Manish Chopra <manishc@marvell.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 UNGLinuxDriver@microchip.com, Yonghong Song <yhs@fb.com>,
 Edward Cree <ecree.xilinx@gmail.com>, Michael Walle <michael@walle.cc>,
 Casper Andersson <casper.casan@gmail.com>, Xu Wang <vulab@iscas.ac.cn>,
 Cristiano Giuffrida <c.giuffrida@vu.nl>, bpf@vger.kernel.org,
 Vladimir Oltean <olteanv@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Martin KaFai Lau <kafai@fb.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In preparation to limit the scope of a list iterator to the list
traversal loop, use a dedicated pointer pointing to the location
where the element should be inserted [1].

Before, the code implicitly used the head when no element was found
when using &new->list. The new 'pos' variable is set to the list head
by default and overwritten if the list exits early, marking the
insertion point for list_add().

Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/ [1]
Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 drivers/net/ethernet/sfc/rx_common.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/sfc/rx_common.c b/drivers/net/ethernet/sfc/rx_common.c
index 1b22c7be0088..80894a35ea79 100644
--- a/drivers/net/ethernet/sfc/rx_common.c
+++ b/drivers/net/ethernet/sfc/rx_common.c
@@ -555,7 +555,7 @@ efx_rx_packet_gro(struct efx_channel *channel, struct efx_rx_buffer *rx_buf,
  */
 struct efx_rss_context *efx_alloc_rss_context_entry(struct efx_nic *efx)
 {
-	struct list_head *head = &efx->rss_context.list;
+	struct list_head *head = *pos = &efx->rss_context.list;
 	struct efx_rss_context *ctx, *new;
 	u32 id = 1; /* Don't use zero, that refers to the master RSS context */
 
@@ -563,8 +563,10 @@ struct efx_rss_context *efx_alloc_rss_context_entry(struct efx_nic *efx)
 
 	/* Search for first gap in the numbering */
 	list_for_each_entry(ctx, head, list) {
-		if (ctx->user_id != id)
+		if (ctx->user_id != id) {
+			pos = &ctx->list;
 			break;
+		}
 		id++;
 		/* Check for wrap.  If this happens, we have nearly 2^32
 		 * allocated RSS contexts, which seems unlikely.
@@ -582,7 +584,7 @@ struct efx_rss_context *efx_alloc_rss_context_entry(struct efx_nic *efx)
 
 	/* Insert the new entry into the gap */
 	new->user_id = id;
-	list_add_tail(&new->list, &ctx->list);
+	list_add_tail(&new->list, pos);
 	return new;
 }
 
-- 
2.25.1

