Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2864F7D24
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 12:38:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYyXC3zRrz3cd5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Apr 2022 20:38:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NcLD8mHa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62c;
 helo=mail-ej1-x62c.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=NcLD8mHa; dkim-atps=neutral
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYyN6019Xz3bYF
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Apr 2022 20:31:17 +1000 (AEST)
Received: by mail-ej1-x62c.google.com with SMTP id bq8so9852219ejb.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Apr 2022 03:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k+AveRuUfZMS7nrLE2qCYNI1T96Mx5+XYDPrjV8syDQ=;
 b=NcLD8mHaR4qaNPR6BVkLI8cR0N9faisH5bqM+PPDilSapF2TaoYIOm6cL6AzD7IbWj
 CBshM5QiBxeaw54xMXgap91pls2Kb5DPu5mg9Xg/5UAIUU4gW1w0pOZS0KeKNWr/kVJ3
 BrDl1iS2myhrhLtoREcwcpaaioyTRJl8NPRjZxfUF6qzcfXh3RzU4tevnL07WCFfBVV3
 PcqElTxD9nGyEUKAvM6/iFJitBW2/ljIDlNeUUcU2bf2uYx9XQVu+BmitEAqntOci0IY
 KMSBsY+JaFePOA6R2px14qoCJFT2c6j5LEg2gkuS+B04U9JJfAQVgVh381Rebhkj3RMz
 Z+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k+AveRuUfZMS7nrLE2qCYNI1T96Mx5+XYDPrjV8syDQ=;
 b=Kvi7g65F44QJictc8IchBcqu/x59uCYqncyO9s/SbPi0ovwDgDArojLpm0bLWVqoS/
 O55ZAKRHEuKNQ79HbBVUZW8lWvQALJ8++O2on0Du08QRjIs6Tj9MShbavC9IoARnC5Ok
 P53faXgdPMOGUEWUpY0RbT1WOJ/veeAbeCt88GKDvOrMj49RJFwLWGZH8P58kbymf4r3
 0GhFRKv40OnG6ixr2ORArvik31pToz5AjipVXfczYP9ZQkyjCMGK9OyXrGe/PopL90oQ
 KmdA8KPNMxnDFGj5gjeWLKXFyDnO0Ck5dsnHFCkU/pxCsBSdRaI3Px5oo+fPGJ0ZSBY5
 gzOA==
X-Gm-Message-State: AOAM531yhzTR5rNJj+r3Kw7RFDCMnxm/yS6KFS1FksyheBty27TPMqC5
 FQGoj+ckZDeCMVMf8cXZJQud9dz0aaPL3HTC
X-Google-Smtp-Source: ABdhPJyUMk7P7yhyEFZWum6NOrzRuYQhvq6Vl8oB+OA51dwydUryDEsWaJ7QTxbXBBuOO2+NpgZo8A==
X-Received: by 2002:a17:906:5d14:b0:6e8:3897:9ec2 with SMTP id
 g20-20020a1709065d1400b006e838979ec2mr2114089ejt.708.1649327474884; 
 Thu, 07 Apr 2022 03:31:14 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 c5-20020a170906d18500b006ce371f09d4sm7413573ejz.57.2022.04.07.03.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 03:31:14 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH net-next 11/15] sfc: Remove usage of list iterator for
 list_add() after the loop body
Date: Thu,  7 Apr 2022 12:28:56 +0200
Message-Id: <20220407102900.3086255-12-jakobkoschel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220407102900.3086255-1-jakobkoschel@gmail.com>
References: <20220407102900.3086255-1-jakobkoschel@gmail.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Cristiano Giuffrida <c.giuffrida@vu.nl>,
 Eric Dumazet <edumazet@google.com>, Paul Mackerras <paulus@samba.org>,
 Ariel Elior <aelior@marvell.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Manish Chopra <manishc@marvell.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>, "Bos, H.J." <h.j.bos@vu.nl>,
 linux-arm-kernel@lists.infradead.org, Martin Habets <habetsm.xilinx@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 Bjarni Jonasson <bjarni.jonasson@microchip.com>, Jiri Pirko <jiri@resnulli.us>,
 Arnd Bergmann <arnd@arndb.de>, Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Di Zhu <zhudi21@huawei.com>, Lars Povlsen <lars.povlsen@microchip.com>,
 Colin Ian King <colin.king@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com,
 Edward Cree <ecree.xilinx@gmail.com>, Michael Walle <michael@walle.cc>,
 Xu Wang <vulab@iscas.ac.cn>, Vladimir Oltean <olteanv@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Casper Andersson <casper.casan@gmail.com>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In preparation to limit the scope of a list iterator to the list
traversal loop, use a dedicated pointer to point to the found element [1].

Before, the code implicitly used the head when no element was found
when using &pos->list. Since the new variable is only set if an
element was found, the list_add() is performed within the loop
and only done after the loop if it is done on the list head directly.

Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/ [1]
Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 drivers/net/ethernet/sfc/rx_common.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/sfc/rx_common.c b/drivers/net/ethernet/sfc/rx_common.c
index 1b22c7be0088..a8822152ff83 100644
--- a/drivers/net/ethernet/sfc/rx_common.c
+++ b/drivers/net/ethernet/sfc/rx_common.c
@@ -563,8 +563,10 @@ struct efx_rss_context *efx_alloc_rss_context_entry(struct efx_nic *efx)
 
 	/* Search for first gap in the numbering */
 	list_for_each_entry(ctx, head, list) {
-		if (ctx->user_id != id)
+		if (ctx->user_id != id) {
+			head = &ctx->list;
 			break;
+		}
 		id++;
 		/* Check for wrap.  If this happens, we have nearly 2^32
 		 * allocated RSS contexts, which seems unlikely.
@@ -582,7 +584,7 @@ struct efx_rss_context *efx_alloc_rss_context_entry(struct efx_nic *efx)
 
 	/* Insert the new entry into the gap */
 	new->user_id = id;
-	list_add_tail(&new->list, &ctx->list);
+	list_add_tail(&new->list, head);
 	return new;
 }
 
-- 
2.25.1

