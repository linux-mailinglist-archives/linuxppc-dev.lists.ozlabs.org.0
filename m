Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC934FB02F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Apr 2022 22:35:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kc3f36rsLz3bcn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Apr 2022 06:35:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fJz20MHN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::536;
 helo=mail-ed1-x536.google.com; envelope-from=olteanv@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=fJz20MHN; dkim-atps=neutral
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kc3dP0fhJz2yJF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Apr 2022 06:35:04 +1000 (AEST)
Received: by mail-ed1-x536.google.com with SMTP id z99so7422268ede.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Apr 2022 13:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dCmksJmPxgakgPcETkyiMkdEpAIfPO8dTB6JgwQ/+0c=;
 b=fJz20MHNwDvsBXdmgdMPNyq04BZ5BUG60QpxolftSlFksOd7su6HQLoU6Ym3gzUS9Z
 1HOHAI1W86fYaCzaxUN5sXZRzTzF/FgAhUMtk7w7n4SKYTDfggk4U2NXEHuuhBg5bOQj
 7AmYBCt6RZKmk/JrDlUwsJpoUULpi+QFAllfEIz2JBYO/eXqDK3Iev7FQY9dKcvA4Mmi
 tQGnUFhaplfYowHS0ggxLJH7BKaETYZLgXmFDsdvnDdMysaS0fSWOExFy96UIba2+vWu
 mz4aSQmoRlql8Scvd4xNgNcCvlcKYqi0CPXxIMHdzILmeexpscOm7rOOgg8pNpvJhqYL
 im3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dCmksJmPxgakgPcETkyiMkdEpAIfPO8dTB6JgwQ/+0c=;
 b=PKW/2AFywYGPk++JOO5JyYalhbjkJtcmd6HwijkHVvFC9eZDx3yg+7P4Ql+/rPuwDT
 nJk90Sc+sqNPRmHBbYyfh9dVbQB3SjD7V0Yg7mI0sZyfJpDc/Rq5AMiL3ep75sasSGQr
 27pn8IecOe1uMmVjeD3B+vj+mkB7EHbT50ooNHZH+zcgghD8zeFTykpIJMBocGwcmQx+
 gIlY6f7cx5GrfOB8+BFwiJBWe2/21ef02AP03r+v4ONuhqbM0dJwxvlx6CiBjRfy9kA7
 Nct8RE7/6KWt2VrnsiUDp2iRS6pIVFYKyCyf74szVK97V6xACWT7FWHMQJPOPbKJW55y
 ip4Q==
X-Gm-Message-State: AOAM530ixCD5YUuXxfRDqdCketBcZVGRRbgXj19Cl01rHosqPP7VC2Sa
 ldOFTmt2bxTLmlatiGV5KlI=
X-Google-Smtp-Source: ABdhPJwZznt2lJwO+hf+ALxhFuyiAjJq2pf8wY+nER92urPfEHHhtB2vyJZ36qkUOAwve20Kv235ZQ==
X-Received: by 2002:a05:6402:34b:b0:41d:7026:d9e3 with SMTP id
 r11-20020a056402034b00b0041d7026d9e3mr7280900edw.168.1649622900513; 
 Sun, 10 Apr 2022 13:35:00 -0700 (PDT)
Received: from skbuf ([188.26.57.45]) by smtp.gmail.com with ESMTPSA id
 u25-20020a170906b11900b006e08588afedsm11183676ejy.132.2022.04.10.13.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Apr 2022 13:35:00 -0700 (PDT)
Date: Sun, 10 Apr 2022 23:34:57 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Jakob Koschel <jakobkoschel@gmail.com>
Subject: Re: [PATCH net-next 02/15] net: dsa: sja1105: Remove usage of
 iterator for list_add() after loop
Message-ID: <20220410203457.3las4i3qcmaitsjt@skbuf>
References: <20220407102900.3086255-1-jakobkoschel@gmail.com>
 <20220407102900.3086255-3-jakobkoschel@gmail.com>
 <20220408114120.tvf2lxvhfqbnrlml@skbuf>
 <FA317E17-3B09-411B-9DF6-05BDD320D988@gmail.com>
 <C9081CE3-B008-48DA-A97C-76F51D4F189F@gmail.com>
 <20220410110508.em3r7z62ufqcbrfm@skbuf>
 <935062D0-C657-4C79-A0BE-70141D052EC0@gmail.com>
 <C88FE232-417C-4029-A79E-9A7E807D2FE7@gmail.com>
 <20220410200235.6mtdkd2f73ijxknn@skbuf>
 <A8286EF1-4C38-4ACD-884A-6D1C64769DAE@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <A8286EF1-4C38-4ACD-884A-6D1C64769DAE@gmail.com>
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
 Jakub Kicinski <kuba@kernel.org>, Lars Povlsen <lars.povlsen@microchip.com>,
 Netdev <netdev@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 UNGLinuxDriver@microchip.com, Edward Cree <ecree.xilinx@gmail.com>,
 Michael Walle <michael@walle.cc>, Xu Wang <vulab@iscas.ac.cn>,
 Colin Ian King <colin.king@intel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Casper Andersson <casper.casan@gmail.com>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Apr 10, 2022 at 10:30:31PM +0200, Jakob Koschel wrote:
> > On 10. Apr 2022, at 22:02, Vladimir Oltean <olteanv@gmail.com> wrote:
> > 
> > On Sun, Apr 10, 2022 at 08:24:37PM +0200, Jakob Koschel wrote:
> >> Btw, I just realized that the if (!pos) is not necessary. This should simply do it:
> >> 
> >> diff --git a/drivers/net/dsa/sja1105/sja1105_vl.c b/drivers/net/dsa/sja1105/sja1105_vl.c
> >> index b7e95d60a6e4..2d59e75a9e3d 100644
> >> --- a/drivers/net/dsa/sja1105/sja1105_vl.c
> >> +++ b/drivers/net/dsa/sja1105/sja1105_vl.c
> >> @@ -28,6 +28,7 @@ static int sja1105_insert_gate_entry(struct sja1105_gating_config *gating_cfg,
> >> 		list_add(&e->list, &gating_cfg->entries);
> >> 	} else {
> >> +		struct list_head *pos = &gating_cfg->entries;
> >> 		struct sja1105_gate_entry *p;
> >> 
> >> 		list_for_each_entry(p, &gating_cfg->entries, list) {
> >> 			if (p->interval == e->interval) {
> >> @@ -37,10 +38,12 @@ static int sja1105_insert_gate_entry(struct sja1105_gating_config *gating_cfg,
> >> 				goto err;
> >> 			}
> >> 
> >> -			if (e->interval < p->interval)
> >> +			if (e->interval < p->interval) {
> >> +				pos = &p->list;
> >> 				break;
> >> +			}
> >> 		}
> >> -		list_add(&e->list, p->list.prev);
> >> +		list_add(&e->list, pos->prev);
> >> 	}
> >> 
> >> 	gating_cfg->num_entries++;
> >> -- 
> >> 2.25.1
> > 
> > I think we can give this a turn that is actually beneficial for the driver.
> > I've prepared and tested 3 patches on this function, see below.
> > Concrete improvements:
> > - that thing with list_for_each_entry() and list_for_each()
> > - no more special-casing of an empty list
> > - simplifying the error path
> > - that thing with list_add_tail()
> > 
> > What do you think about the changes below?
> 
> Thanks for all the good cooperation and help. The changes look great.
> I'll include them in v2 unless you want to do that separately, then I'll
> just remove them from the patch series.

I think it's less of a synchronization hassle if you send them along
with your list of others. Good luck.
