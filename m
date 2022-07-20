Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2150457B7F9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 15:53:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lnxxx14tVz3c9Z
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 23:53:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Nmbr0Ft+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com; envelope-from=olteanv@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Nmbr0Ft+;
	dkim-atps=neutral
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LnxxK1nFyz2xjS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jul 2022 23:53:24 +1000 (AEST)
Received: by mail-ed1-x532.google.com with SMTP id g1so23815107edb.12
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jul 2022 06:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=v7Ua7Pjztqwug82UBS8PZqoIQdh5WrByyVymA7qNXfY=;
        b=Nmbr0Ft+AJ1qLYlMHWEXMpaR4XELHNyQAwZbdBWe8fGQhHqGPd1gD6d1KCMogKEBpz
         Bm7n5gTDnNsGpTpIkaOZ/zXnhVIirBjmDIiHPfE54B8fs3L0ulH52s18KafGlgDihKqD
         PaL3yw6KG6rnj0ZvTD+0rKFVYgv6JFRs8QlaCeMNV8thMquMeGmS7cdhhzAbqDi04V1y
         bqXgezBmXgeiTzanu4P8w270e0fjtnEJ0Rdb5mMCD7nIRDUxtqJ86WODqq6wl3rOeexs
         MpaGTPLcOKjG1JGubt82XE2ZHtNLyqAR7dQDQ01s94CBo8rkf6vBBE6N47hf84cFcPIX
         X2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=v7Ua7Pjztqwug82UBS8PZqoIQdh5WrByyVymA7qNXfY=;
        b=SW69QH/RbpvNz4EYT41CrgFTo+VdxOBNlk6QPQK7iRMlfu1JdSvXJhCp+paXagtgsn
         GCE2Qed65uCnD/qATJjSqH1wVrTU1MTosHC/6P43YzbRDZmJDAE7laxeREnBxEjb5P9x
         DzkzS0zyv0F8DDFPZHWX+V0Udvlytw17UCBeQ/G4TeFOodXadMUJUzCWbJm+t/ceWrh/
         rYfXTWwZU2g+Py2Oacm8PnaHqUhryvpiJFi5B4P26hXg7ZXFlvEOuo8URIzUMLX+Yzu6
         J8hKw3jZuBeXybfV2AbK5IqESC0vkyUnuKrGLDpjVkl66EcEF8COREH9ZL53VGO/yCFg
         O88w==
X-Gm-Message-State: AJIora/8S64HmgqcqFObmKMVuGY6NdgVmVcuWztw5sUaweN4yRFAkVRd
	BwXQs81djWkiy8B+LWSnKRE=
X-Google-Smtp-Source: AGRyM1tM9Guy5xL3TVWbHbE/7jg1cpe+wU1P3TJ2yS6onGuYZEUFHUh9quYHkm8PmlmdDbV86wGfEA==
X-Received: by 2002:aa7:d788:0:b0:43b:bcbe:64d3 with SMTP id s8-20020aa7d788000000b0043bbcbe64d3mr1108303edq.15.1658325198189;
        Wed, 20 Jul 2022 06:53:18 -0700 (PDT)
Received: from skbuf ([188.25.231.115])
        by smtp.gmail.com with ESMTPSA id h10-20020a170906718a00b00718e4e64b7bsm7934599ejk.79.2022.07.20.06.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 06:53:17 -0700 (PDT)
Date: Wed, 20 Jul 2022 16:53:14 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [RFC PATCH net-next 0/9] net: pcs: Add support for devices
 probed in the "usual" manner
Message-ID: <20220720135314.5cjxiifrq5ig4vjb@skbuf>
References: <2d028102-dd6a-c9f6-9e18-5abf84eb37a1@seco.com>
 <20220719181113.q5jf7mpr7ygeioqw@skbuf>
 <20220711160519.741990-1-sean.anderson@seco.com>
 <20220719152539.i43kdp7nolbp2vnp@skbuf>
 <bec4c9c3-e51b-5623-3cae-6df1a8ce898f@seco.com>
 <20220719153811.izue2q7qff7fjyru@skbuf>
 <2d028102-dd6a-c9f6-9e18-5abf84eb37a1@seco.com>
 <20220719181113.q5jf7mpr7ygeioqw@skbuf>
 <c0a11900-5a31-ca90-220f-74e3380cef8c@seco.com>
 <c0a11900-5a31-ca90-220f-74e3380cef8c@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0a11900-5a31-ca90-220f-74e3380cef8c@seco.com>
 <c0a11900-5a31-ca90-220f-74e3380cef8c@seco.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Madalin Bucur <madalin.bucur@nxp.com>, Eric Dumazet <edumazet@google.com>, Paul Mackerras <paulus@samba.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, UNGLinuxDriver@microchip.com, Frank Rowand <frowand.list@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Saravana Kannan <saravanak@google.com>, Russell King <linux@armlinux.org.uk>, Vladimir Oltean <vladimir.oltean@nxp.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Claudiu Manoil <claudiu.manoil@nxp.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "David S . Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.c
 om>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 19, 2022 at 03:34:45PM -0400, Sean Anderson wrote:
> We could do it, but it'd be a pretty big hack. Something like the
> following. Phylink would need to be modified to grab the lock before
> every op and check if the PCS is dead or not. This is of course still
> not optimal, since there's no way to re-attach a PCS once it goes away.

You assume it's just phylink who operates on a PCS structure, but if you
include your search pool to also cover include/linux/pcs/pcs-xpcs.h,
you'll see a bunch of exported functions which are called directly by
the client drivers (stmmac, sja1105). At this stage it gets pretty hard
to validate that drivers won't attempt from any code path to do
something stupid with a dead PCS. All in all it creates an environment
with insanely weak guarantees; that's pretty hard to get behind IMO.

> IMO a better solution is to use devlink and submit a patch to add
> notifications which the MAC driver can register for. That way it can
> find out when the PCS goes away and potentially do something about it
> (or just let itself get removed).

Not sure I understand what connection there is between devlink (device
links) and PCS {de}registration notifications. We could probably add those
notifications without any intervention from the device core: we would
just need to make this new PCS "core" to register an blocking_notifier_call_chain
to which interested drivers could add their notifier blocks. How a
certain phylink user is going to determine that "hey, this PCS is
definitely mine and I can use it" is an open question. In any case, my
expectation is that we have a notifier chain, we can at least continue
operating (avoid unbinding the struct device), but essentially move our
phylink_create/phylink_destroy calls to within those notifier blocks.

Again, retrofitting this model to existing drivers, phylink API (and
maybe even its internal structure) is something that's hard to hop on
board of; I think it's a solution waiting for a problem, and I don't
have an interest to develop or even review it.
