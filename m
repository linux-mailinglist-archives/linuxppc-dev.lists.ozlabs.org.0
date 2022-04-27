Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92904511C4F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Apr 2022 18:16:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpP572wwTz3dpy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 02:16:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Hkxy0IEK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::634;
 helo=mail-ej1-x634.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Hkxy0IEK; dkim-atps=neutral
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpNtx47qrz3bbb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Apr 2022 02:07:37 +1000 (AEST)
Received: by mail-ej1-x634.google.com with SMTP id g6so4402393ejw.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Apr 2022 09:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V+mtTmsePMUlrvbA5Gxvy5O64p/39QZZ8B6LTk09adM=;
 b=Hkxy0IEKCInDQhIHwWszLgmHYH27wUiu5nhfHuSds0ny6zxcsjzJuFYvcasAraAcXK
 XharPWt16KsV4QDb7JrdvuM+8RmU4T647/y4Q7CWjLDD3mAEnFszewgn03OsKGZqTGdZ
 dtOQrwcZI0OESJSOMYKI2hNrmU3D7pbiUhKIbTR4NH+J1DfH4RABBaFqwCQIYrJsN1if
 YK4UXm1CsKw+Ez+Pa7EFZlXghqP7Pn9WA+VKpmdLvuXvhIgkfSips9y75xTHfdoIGsty
 RcwT9fu+KvxsSkFr+hi488HDN0jqDbibcol5pUUb1ymbFcQ9cJxycGmwzR0BEKkWZSDO
 uidA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V+mtTmsePMUlrvbA5Gxvy5O64p/39QZZ8B6LTk09adM=;
 b=vbEolTFwNI0PwW4qc4Ju36dS8emzLOqd3yJ5jvT4UE+8rICzBRXSvB/38ddhznvKEI
 GqEYVgOyFOd7uO4UTNCr2asG33hHwbdZpJq4l+p6ytgLhfZJcUIgrO2YAn+0P58SnKSh
 v7ArEydHT8bDPDW9LvIVAQwl+OX1SyaV7a1CTGjBVMVvzFC5UqjY2HKr+bqHKV3D0Ugu
 ZryFpKPKA6i8q4iqR8HWzycsiM/DuJgUKRCxLCZhCPNPsjvkE0NaTb96fgzMfYFxelgR
 bpeCif3+f6yz6WxwwZ5x2wJ+6SA5Stg1uQHAyDCGf2pS7FnoD2FwgCg1PMzxSYznAqav
 3DFQ==
X-Gm-Message-State: AOAM5326uTt/1FCoskHCZWF4bJvdD3ejrispzskf9cifk+3ZuSRsfdFM
 d2lzOYIiUh+DLK459SmQWKQ=
X-Google-Smtp-Source: ABdhPJzxa9+NcJtLVPAcuSDhYJGek9dFCba/k1LpR14Atj5Kkk4JNNCxTqiszf04IOdTXlAqnpMKBQ==
X-Received: by 2002:a17:907:3e92:b0:6f3:8ff4:66b2 with SMTP id
 hs18-20020a1709073e9200b006f38ff466b2mr16219496ejc.697.1651075653001; 
 Wed, 27 Apr 2022 09:07:33 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 n5-20020a170906378500b006efb4ab6f59sm6984098ejc.86.2022.04.27.09.07.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 09:07:32 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH net-next v5 14/18] sfc: Remove usage of list iterator for
 list_add() after the loop body
Date: Wed, 27 Apr 2022 18:06:31 +0200
Message-Id: <20220427160635.420492-15-jakobkoschel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220427160635.420492-1-jakobkoschel@gmail.com>
References: <20220427160635.420492-1-jakobkoschel@gmail.com>
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
 Jiri Pirko <jiri@resnulli.us>, Arnd Bergmann <arnd@arndb.de>,
 KP Singh <kpsingh@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakob Koschel <jakobkoschel@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Colin Ian King <colin.king@intel.com>, Manish Chopra <manishc@marvell.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 UNGLinuxDriver@microchip.com, Yonghong Song <yhs@fb.com>,
 Edward Cree <ecree.xilinx@gmail.com>,
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
 drivers/net/ethernet/sfc/rx_common.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/sfc/rx_common.c b/drivers/net/ethernet/sfc/rx_common.c
index fa8b9aacca11..74c056210e0b 100644
--- a/drivers/net/ethernet/sfc/rx_common.c
+++ b/drivers/net/ethernet/sfc/rx_common.c
@@ -560,14 +560,17 @@ struct efx_rss_context *efx_alloc_rss_context_entry(struct efx_nic *efx)
 {
 	struct list_head *head = &efx->rss_context.list;
 	struct efx_rss_context *ctx, *new;
+	struct list_head *pos = head;
 	u32 id = 1; /* Don't use zero, that refers to the master RSS context */
 
 	WARN_ON(!mutex_is_locked(&efx->rss_lock));
 
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
@@ -585,7 +588,7 @@ struct efx_rss_context *efx_alloc_rss_context_entry(struct efx_nic *efx)
 
 	/* Insert the new entry into the gap */
 	new->user_id = id;
-	list_add_tail(&new->list, &ctx->list);
+	list_add_tail(&new->list, pos);
 	return new;
 }
 
-- 
2.25.1

