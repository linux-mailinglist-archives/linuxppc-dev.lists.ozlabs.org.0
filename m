Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8CB502A59
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Apr 2022 14:40:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KfwsK2gYzz3fFX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Apr 2022 22:40:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=J29YX3EE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::634;
 helo=mail-ej1-x634.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=J29YX3EE; dkim-atps=neutral
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kfwfj3ZZ4z3bZY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Apr 2022 22:31:09 +1000 (AEST)
Received: by mail-ej1-x634.google.com with SMTP id i27so15132636ejd.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Apr 2022 05:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=woYPht1iAY/ITrpUe+WmESGMoM6pZPj3PA3p1Q9RO1s=;
 b=J29YX3EEMEL7T374lnld4XKuYjiGeeoVO1klWLUIkfZJQeL2lLiOJu41mh8Mlrt/vB
 0hc1mDL5NN2TTVjsBWWdsfB0RlH9u8WpBKvaSwodSk+R4GZNluAP3ZKaTkkPMlIbNlTk
 w9cBhCyuJv+3wLIzF/9Kc7oQdcKK/rIIWAVsgeZIVRYleGEFkaYTlnrjHromHPnbM1/7
 3lP8wZeKMpEF3W4eWzvgySheAoJ/fSA4dloEVHWMNtpL4XJqAwi6ktnNLBkPCF3RqAtL
 FfsqZ0RtqT0it3Iyvym50ZYXeiMDeI0khBXLATZMg661vZKB6wij6XlgY68sJ/G4H+3v
 pltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=woYPht1iAY/ITrpUe+WmESGMoM6pZPj3PA3p1Q9RO1s=;
 b=h+6+OX9RmxsZcif/dWYX7vrEDqHU+ckv/tDGt4uVjqKICrh4jJZFf1Y0A5dRa4xp0Y
 qkXlWvQsfjITvRCiJmjP3F8bTivh+QdRapCZEDKM8WQvNDoCr1vkQcje9ncjiz5Ywao2
 c2uwgFZSWhGo8qimPNaS/L3DB8YfDtj9DM9ncbl/f2ruS/AgE4Bs39R/MImajQ/2AusJ
 dQF5F5TyjT8kiUGrZAuO9Er6k6GRVLt47uPHzZrgzZARQ/I8RG4cAaxbIn5q4QsAIK25
 AfHS3UUpORIJAo23mnh3zmW+pn05djI4Oz+0duXBef1QFhM60jAY0BibbsokL3yX5nKH
 l4YQ==
X-Gm-Message-State: AOAM530yxELsN1s7hkeZHTh+lOunZsmWoEqcCyLmXNhOb3ePP+xtOZlv
 tPT8+4RdarvReRqLb+F+3oc=
X-Google-Smtp-Source: ABdhPJyYIoFdAFzmkkdjuJw1d5/znELShtA1rZkNdZGQuvIqYGA+O8h6GmIux5FiMuA0sKmX8w24Kg==
X-Received: by 2002:a17:907:6d9b:b0:6db:8eab:94e0 with SMTP id
 sb27-20020a1709076d9b00b006db8eab94e0mr5947836ejc.687.1650025866683; 
 Fri, 15 Apr 2022 05:31:06 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl.
 [62.195.130.160]) by smtp.googlemail.com with ESMTPSA id
 bo14-20020a170906d04e00b006ce98d9c3e3sm1649533ejb.194.2022.04.15.05.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 05:31:06 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH net-next v4 15/18] net: netcp: Remove usage of list iterator
 for list_add() after loop body
Date: Fri, 15 Apr 2022 14:29:44 +0200
Message-Id: <20220415122947.2754662-16-jakobkoschel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220415122947.2754662-1-jakobkoschel@gmail.com>
References: <20220415122947.2754662-1-jakobkoschel@gmail.com>
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
 Vivien Didelot <vivien.didelot@gmail.com>,
 Bjarni Jonasson <bjarni.jonasson@microchip.com>, Jiri Pirko <jiri@resnulli.us>,
 Arnd Bergmann <arnd@arndb.de>, KP Singh <kpsingh@kernel.org>,
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
when using &next->list. The new 'pos' variable is set to the list head
by default and overwritten if the list exits early, marking the
insertion point for list_add().

Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/ [1]
Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 drivers/net/ethernet/ti/netcp_core.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/ti/netcp_core.c b/drivers/net/ethernet/ti/netcp_core.c
index 16507bff652a..f25104b5a31b 100644
--- a/drivers/net/ethernet/ti/netcp_core.c
+++ b/drivers/net/ethernet/ti/netcp_core.c
@@ -471,6 +471,7 @@ struct netcp_hook_list {
 int netcp_register_txhook(struct netcp_intf *netcp_priv, int order,
 			  netcp_hook_rtn *hook_rtn, void *hook_data)
 {
+	struct list_head *pos = &netcp_priv->txhook_list_head;
 	struct netcp_hook_list *entry;
 	struct netcp_hook_list *next;
 	unsigned long flags;
@@ -485,10 +486,12 @@ int netcp_register_txhook(struct netcp_intf *netcp_priv, int order,
 
 	spin_lock_irqsave(&netcp_priv->lock, flags);
 	list_for_each_entry(next, &netcp_priv->txhook_list_head, list) {
-		if (next->order > order)
+		if (next->order > order) {
+			pos = &next->list;
 			break;
+		}
 	}
-	__list_add(&entry->list, next->list.prev, &next->list);
+	list_add_tail(&entry->list, pos);
 	spin_unlock_irqrestore(&netcp_priv->lock, flags);
 
 	return 0;
@@ -520,6 +523,7 @@ EXPORT_SYMBOL_GPL(netcp_unregister_txhook);
 int netcp_register_rxhook(struct netcp_intf *netcp_priv, int order,
 			  netcp_hook_rtn *hook_rtn, void *hook_data)
 {
+	struct list_head *pos = &netcp_priv->rxhook_list_head;
 	struct netcp_hook_list *entry;
 	struct netcp_hook_list *next;
 	unsigned long flags;
@@ -534,10 +538,12 @@ int netcp_register_rxhook(struct netcp_intf *netcp_priv, int order,
 
 	spin_lock_irqsave(&netcp_priv->lock, flags);
 	list_for_each_entry(next, &netcp_priv->rxhook_list_head, list) {
-		if (next->order > order)
+		if (next->order > order) {
+			pos = &next->list;
 			break;
+		}
 	}
-	__list_add(&entry->list, next->list.prev, &next->list);
+	list_add_tail(&entry->list, pos);
 	spin_unlock_irqrestore(&netcp_priv->lock, flags);
 
 	return 0;
-- 
2.25.1

