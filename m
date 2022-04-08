Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E96B54FA047
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Apr 2022 01:51:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZw4y0KLJz3bgV
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Apr 2022 09:51:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nJriARLQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::636;
 helo=mail-ej1-x636.google.com; envelope-from=olteanv@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=nJriARLQ; dkim-atps=neutral
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZw4L4GDFz2xCB
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Apr 2022 09:50:58 +1000 (AEST)
Received: by mail-ej1-x636.google.com with SMTP id a6so20291969ejk.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Apr 2022 16:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=SUqMtItyQZq0VImWzHlQNyf9xOR5YZgjl7HG7ggaASA=;
 b=nJriARLQYTMhH8chWXt44TKYI93PSDPUJtZYNgzWWUVvzVxPGiCZEEj1or0iOTefo6
 cFscWaA85nZ2Y/kClhUqsgDfbrhKPUZDkkzyM5PK+amxjD4B9bkaMfh3UvILoEcBIGVp
 pD9y/wuXRsQe30azkivrcgDlMms0jSrgpc0B4YRML0nOkZ8W8oa2xa3dmJEJI48q7Lph
 hERaCN4LvyngWLcE/nNTdaJoURQxBLZ0UWrRoEU5cNkW9BTCN6Tydlp6kYyBV95RnXZw
 p2O6zP4x77KUbOQ1olKZSBNoc7+rWVjcHZXqzKdeMH9GniNs2g4IkkVS8/3XGbjIDWwo
 0yJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SUqMtItyQZq0VImWzHlQNyf9xOR5YZgjl7HG7ggaASA=;
 b=zLljWjzmNvXtalDLuhgpBV3/UcYEdmZ4DmqbSSxJwK4njeUy9Y6ruv2Qdl7xZxMoj2
 MiC+29mFfrHKnvavBr0x1Kp39DVTuymuOXhIzGDSxQrgiTbJ6NNBhhS1wZVxAbK8E3Cb
 6QHdMN6hnLXpinRXyyDp9/dcvMF7sXzcTjWnVT2axXveIMejPl8p6auBHMGZQj7qGnXb
 MoDDjYF8vsOWcB2Hro71RgyFrRF7pjEtEali33jYESqkTTcgojD6Odn6saQ1hz5Y4LUW
 nTZtyPrqETxM8jpvCd7epYsBHrJXFu2VYas7reG/2yhbsKkp0TkTo6u05/x8jWFsR6RX
 l2uw==
X-Gm-Message-State: AOAM533JHw0B1omCx4pdh3RyhqF00DE0S+WYpdmlx926/2FXf0iYgVh+
 sGPC39wG0suzxNvHXeyLbag=
X-Google-Smtp-Source: ABdhPJx48I6qNVXy5JRlDDppagH8Z8UT68EDC0Z1VNqIiGnngdmjei8lBxcmBqvnL8jnUCdrueVd4Q==
X-Received: by 2002:a17:906:9c82:b0:6df:baa2:9f75 with SMTP id
 fj2-20020a1709069c8200b006dfbaa29f75mr20667399ejc.762.1649461854531; 
 Fri, 08 Apr 2022 16:50:54 -0700 (PDT)
Received: from skbuf ([188.26.57.45]) by smtp.gmail.com with ESMTPSA id
 w14-20020a509d8e000000b0041cd217726dsm7443672ede.4.2022.04.08.16.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 16:50:54 -0700 (PDT)
Date: Sat, 9 Apr 2022 02:50:51 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Jakob Koschel <jakobkoschel@gmail.com>
Subject: Re: [PATCH net-next 03/15] net: dsa: mv88e6xxx: Replace usage of
 found with dedicated iterator
Message-ID: <20220408235051.2a4hh7p3lee3a3xv@skbuf>
References: <20220407102900.3086255-1-jakobkoschel@gmail.com>
 <20220407102900.3086255-4-jakobkoschel@gmail.com>
 <20220408123101.p33jpynhqo67hebe@skbuf>
 <C2AFC0FB-08EC-4421-AF44-8C485BF48879@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <C2AFC0FB-08EC-4421-AF44-8C485BF48879@gmail.com>
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

On Sat, Apr 09, 2022 at 01:44:00AM +0200, Jakob Koschel wrote:
> > Let's try to not make convoluted code worse. Do the following 2 patches
> > achieve what you are looking for? Originally I had a single patch (what
> > is now 2/2) but I figured it would be cleaner to break out the unrelated
> > change into what is now 1/2.
> 
> I do agree with not making convoluted code worse, but I was reluctant with
> e.g. introducing new functions for this because others essentially
> have the opposite opinion on this.
> 
> I however like solving it that way, it makes it a lot cleaner.

Yeah, I think 'just adapt to the context and style and intentions of the
code you're changing and don't try to push a robotic one-size-fits-all
solution' is sensible enough for an initial guiding principle.

> > If you want I can submit these changes separately.
> 
> Sure if you want to submit them separately, go ahead. Otherwise I can
> integrate it into a v2, whatever you prefer essentially.

If you're moving quickly feel free to pick them up. I have lots of other
things on my backlog so it won't be until late next week until I even
consider submitting these.
