Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EE24FA070
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Apr 2022 02:09:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZwTB24x0z3bZ2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Apr 2022 10:09:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Hf3GAkOQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62d;
 helo=mail-ej1-x62d.google.com; envelope-from=olteanv@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Hf3GAkOQ; dkim-atps=neutral
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZwSZ3vgmz2xCB
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Apr 2022 10:08:29 +1000 (AEST)
Received: by mail-ej1-x62d.google.com with SMTP id bq8so20186337ejb.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 08 Apr 2022 17:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RvZAa7SKDRUob+n4fTMpikTEqqS+v/QxENsH8RtzPww=;
 b=Hf3GAkOQzv9e8PvaX4T37CgoPYyjwun300cYmypPebz99NbqI5XWgZUUr/cRfgCQ0q
 yEyPv3iui1C1/grSAXRrWRuN8dbz6cBQEpg3lM9C37EBvM5sQDouUxhFabNcQizQcdU8
 1s+r7XOnue2u+UMcpKJu/o5yZnpvCQoIqy1MlxgC7F/5F2fvQ+eQEk2tTjLrTRaQwq71
 fGM/L62bKnVvaOGDbo+8C5lRYbmkPMu3xXTxHpTBlvwi8Nl0ZlKE28458OZhFawR3t/T
 U/DFqLcUt7Ns/zgPRVKNPT4qAkIRo6ipV/fvzLQk22ztkCl4kIxx7nuo9Oa47HrHOD0G
 Hjmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RvZAa7SKDRUob+n4fTMpikTEqqS+v/QxENsH8RtzPww=;
 b=Gv4LzjhuNWV2b8HEAsUsB9ACdmpQU74BmvGPo9Oz4T8jtsxv5T0MrpImtGGy33tS8F
 I3Pe5ZzNJ1n6uIIpAx37uQL1Jn/SOGkkulFevXmG/mvMIAbc7wpHrR36dm5WM4Ua/3Af
 5yujJ3KCiRe5y729tBo4qAgOBzCkJox3rO3/MTBlFjBg+7mtMtDKo+qSp1b6YNz+n+Vp
 liJ9ZubWOk/xoFq1Cqw5iXppwHTmXA6TijN4rqIpIuZKMFgy3YF7MWtEBY6VGYSM2NLb
 Hqmz82oiqSbtLY5A9NEoPVNE4DeQ6PRuD6s8gLrcwkiqbvQr4kV3ykAS590BojBjEZw0
 UPeA==
X-Gm-Message-State: AOAM5310JhB1w20/dGVH8kW/5M6BtVHq2MHUbw7ogIY/Y+r6cENcgB3L
 Ip2WvlqEk3FcB5zx2LdfuQox2UHZO4s=
X-Google-Smtp-Source: ABdhPJxa+uwu4gunlQPwRdiolDxha0utOQH8M/7X9mDxxlHZQFL3dCLpiHOPKltrB32NP/LUIeS0CA==
X-Received: by 2002:a17:907:6e04:b0:6e0:95c0:47b8 with SMTP id
 sd4-20020a1709076e0400b006e095c047b8mr20688094ejc.483.1649462905357; 
 Fri, 08 Apr 2022 17:08:25 -0700 (PDT)
Received: from skbuf ([188.26.57.45]) by smtp.gmail.com with ESMTPSA id
 v2-20020a509d02000000b00412d53177a6sm11146780ede.20.2022.04.08.17.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 17:08:24 -0700 (PDT)
Date: Sat, 9 Apr 2022 03:08:22 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Jakob Koschel <jakobkoschel@gmail.com>
Subject: Re: [PATCH net-next 02/15] net: dsa: sja1105: Remove usage of
 iterator for list_add() after loop
Message-ID: <20220409000822.mbz34qevh7babqo5@skbuf>
References: <20220407102900.3086255-1-jakobkoschel@gmail.com>
 <20220407102900.3086255-3-jakobkoschel@gmail.com>
 <20220407205426.6a31e4b2@kernel.org>
 <AAB64C72-5B45-4BA1-BB48-106F08BDFF1B@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AAB64C72-5B45-4BA1-BB48-106F08BDFF1B@gmail.com>
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

On Sat, Apr 09, 2022 at 01:58:29AM +0200, Jakob Koschel wrote:
> Hello Jakub,
> > Also the list_add() could be converted to list_add_tail().
> 
> Good point, I wasn't sure if that's considered as something that should be
> done as a separate change. I'm happy to include it in v2.

By now you probably studied more list access patterns than I did,
but I wrote that deliberately using list_add(..., pos->prev) rather than
list_add_tail(), because even though the code is the same, I tend to
think of the "head" argument of list_add_tail() as being the actual head
of the list, and therefore the head->prev being the tail of the list
(hence the name), something which doesn't hold true here where we're
inserting in the middle of the list. Anyway it's just a name and that's
what felt natural to me at the time, I won't oppose the change, but do
make it a separate change and not clump it together with the unrelated
list_for_each_entry() -> list_for_each() change.
