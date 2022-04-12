Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1084FDC33
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 13:04:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kd2sn5z7cz3bxC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 21:04:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JuhzPZfb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62e;
 helo=mail-ej1-x62e.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=JuhzPZfb; dkim-atps=neutral
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kd2ls5Mqtz3bZp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Apr 2022 20:59:05 +1000 (AEST)
Received: by mail-ej1-x62e.google.com with SMTP id p15so36531372ejc.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Apr 2022 03:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7YEqjlB8bsXZ45gzNCMwH2JxmTxm4dwtRKumhhyyThw=;
 b=JuhzPZfbHNp8KzizpUd3npS/c+avk0cNSWxtttmDVRhdog+mWS5PTWORph9Q/qUAoM
 8keJvj9dv/yXVqmRWakr4m/xQNHJeKAi56tBJb3u/jJ19GjNaDhLDPUv3qF/6xu4bFfc
 MwZ9KLk6mOmN9CZCuDK1qaSrOu4h7B6TnvJxk+iJzbX6esKmylO5Kk+omrDNnYoOEyoq
 tymNsbhCDPqH6T97QNozKI1EtoPpIylEEuvUVbarJM6bYztq55mxIufOYzJPwjcnpBkR
 OxEgQOgUI44VTnd4XOSko8dEfDEyBNc4ttZuNXmLYcBc3CoaDYnAkUBH24mpRu3FH6KP
 in4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7YEqjlB8bsXZ45gzNCMwH2JxmTxm4dwtRKumhhyyThw=;
 b=qM10NJcfd6E5PZHTcufT1GejNiIkn2zeyRHtIbWp0fIAdmQT+8OfKzmTjv1WXQKqgz
 3HVJJ4PBmayvmvRgCFq5OMQxnNM/ak0jNfYTMsf1vvq8lmK2D4HErAxRmOVVrXHBihEk
 uWCo6ZG9DFHeDlS4bFcsgL8i957kH+VqEryduhLWeHsm7AxMVtYKXvKAWYO0lEx+J1qn
 BOcIDwNF9DSfEfMVamWNr0+Sj+C2BSfuSwaXiyIcdcT0IdJMB5HhwLog2okylDAjaarj
 gICAUhZFyiDcKnsJUqGCTI3cnVrHXlU/O/gzsQavlcI3NXTnJZP+ePdGNIjEd/FL7Caq
 VUhQ==
X-Gm-Message-State: AOAM531sX/Qbh1m/96cNxcsDd2k/X4aPHyWKCPRwosc1j+8XwpcPksfR
 6ser/1ojzzg8olM47HOc1bU=
X-Google-Smtp-Source: ABdhPJwpRCnjai5W8v005CZLTr1aIkVLB+F4ssfjX6q45t2wD7P05QaD6epkKRe/5eyzU02wYUaN9A==
X-Received: by 2002:a17:907:7f1b:b0:6e8:558c:5ba with SMTP id
 qf27-20020a1709077f1b00b006e8558c05bamr18626088ejc.522.1649761142286; 
 Tue, 12 Apr 2022 03:59:02 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 f1-20020a056402194100b00416b174987asm16986370edz.35.2022.04.12.03.59.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 03:59:01 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH net-next v2 08/18] net: sparx5: Replace usage of found with
 dedicated list iterator variable
Date: Tue, 12 Apr 2022 12:58:20 +0200
Message-Id: <20220412105830.3495846-9-jakobkoschel@gmail.com>
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

To move the list iterator variable into the list_for_each_entry_*()
macro in the future it should be avoided to use the list iterator
variable after the loop body.

To *never* use the list iterator variable after the loop it was
concluded to use a separate iterator variable instead of a
found boolean [1].

This removes the need to use a found variable and simply checking if
the variable was set, can determine if the break/goto was hit.

Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/ [1]
Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 .../microchip/sparx5/sparx5_mactable.c        | 25 +++++++++----------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_mactable.c b/drivers/net/ethernet/microchip/sparx5/sparx5_mactable.c
index a5837dbe0c7e..bb8d9ce79ac2 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_mactable.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_mactable.c
@@ -362,8 +362,7 @@ static void sparx5_mact_handle_entry(struct sparx5 *sparx5,
 				     unsigned char mac[ETH_ALEN],
 				     u16 vid, u32 cfg2)
 {
-	struct sparx5_mact_entry *mact_entry;
-	bool found = false;
+	struct sparx5_mact_entry *mact_entry = NULL, *iter;
 	u16 port;
 
 	if (LRN_MAC_ACCESS_CFG_2_MAC_ENTRY_ADDR_TYPE_GET(cfg2) !=
@@ -378,28 +377,28 @@ static void sparx5_mact_handle_entry(struct sparx5 *sparx5,
 		return;
 
 	mutex_lock(&sparx5->mact_lock);
-	list_for_each_entry(mact_entry, &sparx5->mact_entries, list) {
-		if (mact_entry->vid == vid &&
-		    ether_addr_equal(mac, mact_entry->mac)) {
-			found = true;
-			mact_entry->flags |= MAC_ENT_ALIVE;
-			if (mact_entry->port != port) {
+	list_for_each_entry(iter, &sparx5->mact_entries, list) {
+		if (iter->vid == vid &&
+		    ether_addr_equal(mac, iter->mac)) {
+			iter->flags |= MAC_ENT_ALIVE;
+			if (iter->port != port) {
 				dev_warn(sparx5->dev, "Entry move: %d -> %d\n",
-					 mact_entry->port, port);
-				mact_entry->port = port;
-				mact_entry->flags |= MAC_ENT_MOVED;
+					 iter->port, port);
+				iter->port = port;
+				iter->flags |= MAC_ENT_MOVED;
 			}
 			/* Entry handled */
+			mact_entry = iter;
 			break;
 		}
 	}
 	mutex_unlock(&sparx5->mact_lock);
 
-	if (found && !(mact_entry->flags & MAC_ENT_MOVED))
+	if (mact_entry && !(mact_entry->flags & MAC_ENT_MOVED))
 		/* Present, not moved */
 		return;
 
-	if (!found) {
+	if (!mact_entry) {
 		/* Entry not found - now add */
 		mact_entry = alloc_mact_entry(sparx5, mac, vid, port);
 		if (!mact_entry)
-- 
2.25.1

