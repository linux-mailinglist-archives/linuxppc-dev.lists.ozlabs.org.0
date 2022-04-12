Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9CC4FDF5E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 14:21:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kd4bH65Ddz3bYM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 22:21:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YNr2UaIo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::635;
 helo=mail-ej1-x635.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=YNr2UaIo; dkim-atps=neutral
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kd4TJ6Dq5z3bbL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Apr 2022 22:16:36 +1000 (AEST)
Received: by mail-ej1-x635.google.com with SMTP id k23so36918227ejd.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Apr 2022 05:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7YEqjlB8bsXZ45gzNCMwH2JxmTxm4dwtRKumhhyyThw=;
 b=YNr2UaIoVBm1gjKBZcHcnmPhf4WTQeX+rX7KYA5+ykygfZe0kUfdl5DZ3cS5l0wgBw
 b5C/2mpLo9NyroQnIH4jj0COM0U/XUJzVkMf6yzHmOAlPLQY+D8T3Ns1uXB3RSoh47s8
 FIWtZwC0ZV0smMW9eKbW4qXGaDwCpKYfuYhD/8WI9XpXLSSoYmLzS7cqQlVIt3BQ7uw9
 nrTmpUld2SWoVeoG5DBsi11eSd5oX5hdzs1hb7dipWvUak4B1avN0OWnYg6J7VFop52e
 ipeVkFr0FXMa9tYCzTqpGFZctlGojArHmwvUAfBWJiUGaY+G6aQCY+dGaUaZZopbuzl3
 zGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7YEqjlB8bsXZ45gzNCMwH2JxmTxm4dwtRKumhhyyThw=;
 b=5VUO3dBrM9qfa1DhnxiSeYgShZ8mk/XHYAfO8TMZjt6XjSbd9AIBSa7p3fwGxbm3ws
 PgmL0XmYX7GZM5qv8Y+sebRC0dGNL/jcfNwPMAWaK4vXjqB9rQk80zmE9Rcx/N/PVdEB
 lDqi/ADBbcApeo3hmsXmNeQl0Iz99AQIoSKS1vuVJbilrbjxypSy0eY7CYZ7G9HvOKT7
 RHxBI8//EObHTy/UnPHNcYwcsIEx9cPbZdnbeb+SzmOdCB9Lmbiwh+sTQrsUbgqmOwib
 UBQ1wE+zJn4ADnunqJw97dik2sT5rxj1vPVAPlDiS7Zoj6yxfGOzLYOIY7fMH/NccaWp
 xgrw==
X-Gm-Message-State: AOAM533iJHZM13mWbzybxqdzTfmueTmjH8LzTMsWRW3r0tOq4r5Da9Jw
 pI8Xh1fYiDgX7KKtKPBU3j8=
X-Google-Smtp-Source: ABdhPJwUmqeWXtb6lIaaztLs77X2brPeFa6CWYt3mnOHEOfaakHnSMNRhJ62b1XbkIoXgW+njj+NGw==
X-Received: by 2002:a17:907:9805:b0:6db:4c33:7883 with SMTP id
 ji5-20020a170907980500b006db4c337883mr35423908ejc.555.1649765793997; 
 Tue, 12 Apr 2022 05:16:33 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 b5-20020a17090630c500b006e8044fa76bsm8827900ejb.143.2022.04.12.05.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 05:16:33 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH net-next v3 08/18] net: sparx5: Replace usage of found with
 dedicated list iterator variable
Date: Tue, 12 Apr 2022 14:15:47 +0200
Message-Id: <20220412121557.3553555-9-jakobkoschel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412121557.3553555-1-jakobkoschel@gmail.com>
References: <20220412121557.3553555-1-jakobkoschel@gmail.com>
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
 "Bos, H.J." <h.j.bos@vu.nl>, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-arm-kernel@lists.infradead.org, Martin Habets <habetsm.xilinx@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 Bjarni Jonasson <bjarni.jonasson@microchip.com>, Jiri Pirko <jiri@resnulli.us>,
 Arnd Bergmann <arnd@arndb.de>, Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 KP Singh <kpsingh@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Di Zhu <zhudi21@huawei.com>, Lars Povlsen <lars.povlsen@microchip.com>,
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

