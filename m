Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D8B4FAD9E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Apr 2022 13:05:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kbq0d5mGxz3bdB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Apr 2022 21:05:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Ob9fiGsJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62b;
 helo=mail-ej1-x62b.google.com; envelope-from=olteanv@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Ob9fiGsJ; dkim-atps=neutral
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kbpzw2R5Pz2xvW
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Apr 2022 21:05:16 +1000 (AEST)
Received: by mail-ej1-x62b.google.com with SMTP id s18so2991328ejr.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Apr 2022 04:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=adPV1zp7diLsWHqzN1lHL+GqEnUieJZSmVlsIsbWwpE=;
 b=Ob9fiGsJykZtGsN1gXjaquKw6PFzWg+nAC9wYYAAVm0T+7rjzmVd4fHgzvgdWUEzE1
 IzoRprgjKGaibtKOR665kPTiuHm4XaxNgyFazf8YgKAK/IP73v+DzQ9p/9sh3tAXtUp3
 fSvOPsGAiCEXj8kfK6ZpEEOqRvKA6JpNLDs/TXeIGKtbEvHSJDJ3lBcY2OjMaLZ/3qBw
 ZYBRe93+F621m3Wlc6m530Qtchr9gPxYQTkWNjE+hv98s2zySf8n2Jznue1L++edra3l
 t1DI8PV5QY21yYt4rCT9hZZ3r5xoUfsk89RMCNA8/UiMOtJuiuny0aHB3XvgCf0D9aZ3
 hwuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=adPV1zp7diLsWHqzN1lHL+GqEnUieJZSmVlsIsbWwpE=;
 b=Hkt6lsItpwBzEM86feaq2WHNciRIUtcOfyMF1GNXo3fV+5qrwK0agkxDYFD9F1pQAD
 /IjskdZfPCHLn0C4OZa0OskHkdEPSn1T3ob44XwUOKJc45SeDN+v6ZVpyyxyNRIEHwa8
 H5JY+5U9J1TckQuLnyGoKyYz05S6zFrvbiOODXQKPQQysbWPINmfXwLkbAgPF1FhOPRl
 eTyl/sRp9gCtkAr8LMfLd8bP5cmEhPP0br6WYueJIlxcWV0nfxQunl+WaKJrdT9GlXGV
 cr7SkGK5aeLldztVqpCkOQBKHM6qGBkaJeGLaGUXMl4m+1Fmj8oh7V5bjKdQ8UKXE3aC
 tLZQ==
X-Gm-Message-State: AOAM533VHX+S4eGh4Bitf2cP/0Z1rQHsKppgBNwaDx9/4QVPqPLOntR4
 6Yo0Oq6BdhTg1RwDHq87Dew=
X-Google-Smtp-Source: ABdhPJy4CfP6h/f6jEve+JMMd5M6e84ocjd2vq2qNBHY+zBvxrBpJzRN/enhyyp3MUEvPBoaqyEshQ==
X-Received: by 2002:a17:907:7e82:b0:6e8:92eb:2858 with SMTP id
 qb2-20020a1709077e8200b006e892eb2858mr300803ejc.443.1649588711789; 
 Sun, 10 Apr 2022 04:05:11 -0700 (PDT)
Received: from skbuf ([188.26.57.45]) by smtp.gmail.com with ESMTPSA id
 c5-20020a170906d18500b006ce371f09d4sm10596141ejz.57.2022.04.10.04.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Apr 2022 04:05:11 -0700 (PDT)
Date: Sun, 10 Apr 2022 14:05:08 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Jakob Koschel <jakobkoschel@gmail.com>
Subject: Re: [PATCH net-next 02/15] net: dsa: sja1105: Remove usage of
 iterator for list_add() after loop
Message-ID: <20220410110508.em3r7z62ufqcbrfm@skbuf>
References: <20220407102900.3086255-1-jakobkoschel@gmail.com>
 <20220407102900.3086255-3-jakobkoschel@gmail.com>
 <20220408114120.tvf2lxvhfqbnrlml@skbuf>
 <FA317E17-3B09-411B-9DF6-05BDD320D988@gmail.com>
 <C9081CE3-B008-48DA-A97C-76F51D4F189F@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <C9081CE3-B008-48DA-A97C-76F51D4F189F@gmail.com>
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
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Martin Habets <habetsm.xilinx@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Bjarni Jonasson <bjarni.jonasson@microchip.com>, Jiri Pirko <jiri@resnulli.us>,
 Arnd Bergmann <arnd@arndb.de>, Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jakub Kicinski <kuba@kernel.org>, Di Zhu <zhudi21@huawei.com>,
 Lars Povlsen <lars.povlsen@microchip.com>, Netdev <netdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, UNGLinuxDriver@microchip.com,
 Edward Cree <ecree.xilinx@gmail.com>, Michael Walle <michael@walle.cc>,
 Xu Wang <vulab@iscas.ac.cn>, Colin Ian King <colin.king@intel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Casper Andersson <casper.casan@gmail.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Apr 10, 2022 at 12:51:56PM +0200, Jakob Koschel wrote:
> I've just looked at this again in a bit more detail while integrating it into the patch series.
> 
> I realized that this just shifts the 'problem' to using the 'pos' iterator variable after the loop.
> If the scope of the list iterator would be lowered to the list traversal loop it would also make sense
> to also do it for list_for_each().

Yes, but list_for_each() was never formulated as being problematic in
the same way as list_for_each_entry(), was it? I guess I'm starting to
not understand what is the true purpose of the changes.

> What do you think about doing it this way:
> 
> diff --git a/drivers/net/dsa/sja1105/sja1105_vl.c b/drivers/net/dsa/sja1105/sja1105_vl.c
> index b7e95d60a6e4..f5b0502c1098 100644
> --- a/drivers/net/dsa/sja1105/sja1105_vl.c
> +++ b/drivers/net/dsa/sja1105/sja1105_vl.c
> @@ -28,6 +28,7 @@ static int sja1105_insert_gate_entry(struct sja1105_gating_config *gating_cfg,
>                 list_add(&e->list, &gating_cfg->entries);
>         } else {
>                 struct sja1105_gate_entry *p;
> +               struct list_head *pos = NULL;
> 
>                 list_for_each_entry(p, &gating_cfg->entries, list) {
>                         if (p->interval == e->interval) {
> @@ -37,10 +38,14 @@ static int sja1105_insert_gate_entry(struct sja1105_gating_config *gating_cfg,
>                                 goto err;
>                         }
> 
> -                       if (e->interval < p->interval)
> +                       if (e->interval < p->interval) {
> +                               pos = &p->list;
>                                 break;
> +                       }
>                 }
> -               list_add(&e->list, p->list.prev);
> +               if (!pos)
> +                       pos = &gating_cfg->entries;
> +               list_add(&e->list, pos->prev);
>         }
> 
>         gating_cfg->num_entries++;
> --
> 
> > 
> > Thanks for the suggestion.
> > 
> >> 	}
> >> 
> >> 	gating_cfg->num_entries++;
> >> -----------------------------[ cut here ]-----------------------------
> > 
> > [1] https://lore.kernel.org/linux-kernel/20220407102900.3086255-12-jakobkoschel@gmail.com/
> > 
> > 	Jakob
> 
> Thanks,
> Jakob
