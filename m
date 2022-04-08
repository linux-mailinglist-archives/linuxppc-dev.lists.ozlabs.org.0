Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B658E4F945D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 13:42:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZbvG4ZMXz3bYS
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 21:42:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AJg0uFFw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62a;
 helo=mail-ej1-x62a.google.com; envelope-from=olteanv@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=AJg0uFFw; dkim-atps=neutral
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZbtc6hXrz2xVY
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Apr 2022 21:41:27 +1000 (AEST)
Received: by mail-ej1-x62a.google.com with SMTP id bh17so16736392ejb.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Apr 2022 04:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=oOLkJ7c4AnZzlwaZhpGpMRHcIgXhaokY4dCFfnVK8ik=;
 b=AJg0uFFwQge4JGuOOuXx8CRkZnu1ZXDnzVzYyDLWHmvIU38NMZoqu0q4pVe158Dkgn
 /eBGcEWGk1BeH46V8704WX2v2KXvFfp8vmK2QWBZU86JD8zqVMh6WPg5JLEG+MOHz132
 joX/LTo9GNjQ/PHxRdkig9FP8sCB1PK8s/CVdG9aD27OA02ni/wYOQv2VKyManpb4r2V
 l+NyhY4mu+ntHubH7dA6jGBBg6Rw6LlWbypc/PJx+kXrgjcCC5HTa5lEjYMn4vqquVmu
 OjghRQ+Tl9pBKfNcLM6JX8eao7netCFmQK+me98hABNrns/o3jeMpBRevLlGuLTg9CDP
 8pvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oOLkJ7c4AnZzlwaZhpGpMRHcIgXhaokY4dCFfnVK8ik=;
 b=2rlcKhFo7lpGKbXLRgRFvB2ecupGwjuz9iH7woA+UCKowh4Ad7fKnqOeKnOIX9jf0h
 ZVmRumvrRTks/Kw3rJVpedTfF+/FB+ahNKO+Oq4RY/os+FP7kzVROtag8CBOpQ0JaeZD
 RuMjefRg3pKTIWyIJQZDCWszjgdNeObbO7Gyoy3zGoUKUM28H684Azwut5jdfgEzG/W/
 9A6byAalfQA9R3t/1DDEKzI4jh3TP8H9MnMKum87aFG54bVBUGTEFxfM7cOC7gXhWdWp
 +6NgqgFYDzB/URhkhDlOYLVDcKYX5yIKGPJC+0aRcG4L+Ld8+REkhaQrhM2y83V0lwNe
 f2TQ==
X-Gm-Message-State: AOAM532xlO68SHF40HlZtKf/R+AUXmhbceuDEH16Fsb3tTSbDcHD2ogy
 I3aceJARU5bAaSeyCmeczkE=
X-Google-Smtp-Source: ABdhPJxeGaH+7ttKQKVamBraqnau+HZGtwku7UJ842hOx0+3i3iRgWvMoiWyLlCCBLIqlNq60ltPnQ==
X-Received: by 2002:a17:907:2d92:b0:6e8:4b2a:e41f with SMTP id
 gt18-20020a1709072d9200b006e84b2ae41fmr3203383ejc.124.1649418083561; 
 Fri, 08 Apr 2022 04:41:23 -0700 (PDT)
Received: from skbuf ([188.26.57.45]) by smtp.gmail.com with ESMTPSA id
 e11-20020a50becb000000b0041b64129200sm10750300edk.50.2022.04.08.04.41.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 04:41:23 -0700 (PDT)
Date: Fri, 8 Apr 2022 14:41:20 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Jakob Koschel <jakobkoschel@gmail.com>
Subject: Re: [PATCH net-next 02/15] net: dsa: sja1105: Remove usage of
 iterator for list_add() after loop
Message-ID: <20220408114120.tvf2lxvhfqbnrlml@skbuf>
References: <20220407102900.3086255-1-jakobkoschel@gmail.com>
 <20220407102900.3086255-3-jakobkoschel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220407102900.3086255-3-jakobkoschel@gmail.com>
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
 Manish Chopra <manishc@marvell.com>, "David S. Miller" <davem@davemloft.net>,
 Steen Hegelund <Steen.Hegelund@microchip.com>, "Bos, H.J." <h.j.bos@vu.nl>,
 linux-arm-kernel@lists.infradead.org, Martin Habets <habetsm.xilinx@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 Bjarni Jonasson <bjarni.jonasson@microchip.com>, Jiri Pirko <jiri@resnulli.us>,
 Arnd Bergmann <arnd@arndb.de>, Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakub Kicinski <kuba@kernel.org>, Di Zhu <zhudi21@huawei.com>,
 Lars Povlsen <lars.povlsen@microchip.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com,
 Edward Cree <ecree.xilinx@gmail.com>, Michael Walle <michael@walle.cc>,
 Xu Wang <vulab@iscas.ac.cn>, Colin Ian King <colin.king@intel.com>,
 linuxppc-dev@lists.ozlabs.org, Casper Andersson <casper.casan@gmail.com>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Jakob,

On Thu, Apr 07, 2022 at 12:28:47PM +0200, Jakob Koschel wrote:
> In preparation to limit the scope of a list iterator to the list
> traversal loop, use a dedicated pointer to point to the found element [1].
> 
> Before, the code implicitly used the head when no element was found
> when using &pos->list. Since the new variable is only set if an
> element was found, the list_add() is performed within the loop
> and only done after the loop if it is done on the list head directly.
> 
> Link: https://lore.kernel.org/all/CAHk-=wgRr_D8CB-D9Kg-c=EHreAsk5SqXPwr9Y7k9sA6cWXJ6w@mail.gmail.com/ [1]
> Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
> ---
>  drivers/net/dsa/sja1105/sja1105_vl.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/dsa/sja1105/sja1105_vl.c b/drivers/net/dsa/sja1105/sja1105_vl.c
> index b7e95d60a6e4..cfcae4d19eef 100644
> --- a/drivers/net/dsa/sja1105/sja1105_vl.c
> +++ b/drivers/net/dsa/sja1105/sja1105_vl.c
> @@ -27,20 +27,24 @@ static int sja1105_insert_gate_entry(struct sja1105_gating_config *gating_cfg,
>  	if (list_empty(&gating_cfg->entries)) {
>  		list_add(&e->list, &gating_cfg->entries);
>  	} else {
> -		struct sja1105_gate_entry *p;
> +		struct sja1105_gate_entry *p = NULL, *iter;
>  
> -		list_for_each_entry(p, &gating_cfg->entries, list) {
> -			if (p->interval == e->interval) {
> +		list_for_each_entry(iter, &gating_cfg->entries, list) {
> +			if (iter->interval == e->interval) {
>  				NL_SET_ERR_MSG_MOD(extack,
>  						   "Gate conflict");
>  				rc = -EBUSY;
>  				goto err;
>  			}
>  
> -			if (e->interval < p->interval)
> +			if (e->interval < iter->interval) {
> +				p = iter;
> +				list_add(&e->list, iter->list.prev);
>  				break;
> +			}
>  		}
> -		list_add(&e->list, p->list.prev);
> +		if (!p)
> +			list_add(&e->list, gating_cfg->entries.prev);
>  	}
>  
>  	gating_cfg->num_entries++;
> -- 
> 2.25.1
> 

I apologize in advance if I've misinterpreted the end goal of your patch.
I do have a vague suspicion I understand what you're trying to achieve,
and in that case, would you mind using this patch instead of yours?
I think it still preserves the intention of the code in a clean manner.

-----------------------------[ cut here ]-----------------------------
From 7aed740750d1bc3bff6e85fd33298f5905bb4e01 Mon Sep 17 00:00:00 2001
From: Vladimir Oltean <vladimir.oltean@nxp.com>
Date: Fri, 8 Apr 2022 13:55:14 +0300
Subject: [PATCH] net: dsa: sja1105: avoid use of type-confused pointer in
 sja1105_insert_gate_entry()

It appears that list_for_each_entry() leaks a type-confused pointer when
the iteration loop ends with no early break, since "*p" will no longer
point to a "struct sja1105_gate_entry", but rather to some memory in
front of "gating_cfg->entries".

This isn't actually a problem here, because if the element we insert has
the highest interval, therefore we never exit the loop early, "p->list"
(which is all that we use outside the loop) will in fact point to
"gating_cfg->entries" even though "p" itself is invalid.

Nonetheless, there are preparations to increase the safety of
list_for_each_entry() by making it impossible to use the encapsulating
structure of the iterator element outside the loop. So something needs
to change here before those preparations go in, even though this
constitutes legitimate use.

Make it clear that we are not dereferencing members of the encapsulating
"struct sja1105_gate_entry" outside the loop, by using the regular
list_for_each() iterator, and dereferencing the struct sja1105_gate_entry
only within the loop.

With list_for_each(), the iterator element at the end of the loop does
have a sane value in all cases, and we can just use that as the "head"
argument of list_add().

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 drivers/net/dsa/sja1105/sja1105_vl.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/sja1105/sja1105_vl.c b/drivers/net/dsa/sja1105/sja1105_vl.c
index c0e45b393fde..fe93c80fe5ef 100644
--- a/drivers/net/dsa/sja1105/sja1105_vl.c
+++ b/drivers/net/dsa/sja1105/sja1105_vl.c
@@ -27,9 +27,15 @@ static int sja1105_insert_gate_entry(struct sja1105_gating_config *gating_cfg,
 	if (list_empty(&gating_cfg->entries)) {
 		list_add(&e->list, &gating_cfg->entries);
 	} else {
-		struct sja1105_gate_entry *p;
+		struct list_head *pos;
+
+		/* We cannot safely use list_for_each_entry()
+		 * because we dereference "pos" after the loop
+		 */
+		list_for_each(pos, &gating_cfg->entries) {
+			struct sja1105_gate_entry *p;
 
-		list_for_each_entry(p, &gating_cfg->entries, list) {
+			p = list_entry(pos, struct sja1105_gate_entry, list);
 			if (p->interval == e->interval) {
 				NL_SET_ERR_MSG_MOD(extack,
 						   "Gate conflict");
@@ -40,7 +46,7 @@ static int sja1105_insert_gate_entry(struct sja1105_gating_config *gating_cfg,
 			if (e->interval < p->interval)
 				break;
 		}
-		list_add(&e->list, p->list.prev);
+		list_add(&e->list, pos->prev);
 	}
 
 	gating_cfg->num_entries++;
-----------------------------[ cut here ]-----------------------------
