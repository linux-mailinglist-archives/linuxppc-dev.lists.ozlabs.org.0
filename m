Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A696286F6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Nov 2022 18:25:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N9x5S46cXz3cV7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Nov 2022 04:25:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YFSnsQf8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=olteanv@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YFSnsQf8;
	dkim-atps=neutral
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N9x4W0WkBz3cGm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Nov 2022 04:24:09 +1100 (AEDT)
Received: by mail-ej1-x62b.google.com with SMTP id f27so30096123eje.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Nov 2022 09:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6TuL0Y+rO9fxtmzmyAVa69XJKRgqWPJ2OfFK7yf03Q8=;
        b=YFSnsQf8sjzTuSTT6mTlCVstF8oHuYZEdzipDMt8cUsFTTqvRZFSEEDVqqDe93TP1S
         K7Kp2QoZllY/I/lJWkF9sz47M/SuWDcqsYQgyIdskdg6U+3HZZNdjYBY2PFoBQ0vV1Ed
         tuxPMDsZKPY4KGox8ZZ49QqlWkf/CN3FKfpDNqpIgzILDUFb4kkTKWqFARtbnyPkxalR
         nDwAZwITlDKr/DOEcSEcgEHbVrdpmkyfakblsTFiwGq59M+SuzWDkT2v9mT93khiUS/O
         IBxgICoguQV8gqLVy2zpi7r0Xy0LF4k4OYZwjEPPsd5nRrE4btcz80oFoTdyMO+VgzJQ
         /PCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6TuL0Y+rO9fxtmzmyAVa69XJKRgqWPJ2OfFK7yf03Q8=;
        b=jd0bnz8Dz1jIR97LtF/ftT7BafkpjeLP1l8LsoMkc8KFXMdh8bX4TPeJ92WEpC63ps
         lKiOHv9DsCqoqBTt8f5MhAvwMw6sZgtV80BrhkBFkiqeNWYWcpYLvZrno+aMMpq1Obv1
         NSi6XjG29R3KBQ0PddJ0QFmtqnkK9vXVbOK9YMHODtDZjk/c1WfzUL8VlZqMoIP9pa3c
         UyTRCQHBL8CqbqBFENJROQKZVEYWv9mPl1kNkxiJoZPYbF92F7SNiR33nK9tDDkdfTfM
         dnyvmBrQdzTI7/29EQIYQVMwr3AyxJxgso7e6BaSmpIgPLi6ixbY0aCdWDBf6AnhdrdZ
         hG3w==
X-Gm-Message-State: ANoB5pnj5zZEaUzv47+JZlAq9WCof81QTauH9Fps03mGjVWoDspxIXv7
	BhkyW76auMerb1SnBpfBiHE=
X-Google-Smtp-Source: AA0mqf5NU+UWrKjaeZ380Kdx+esoqf/0KQ1RMqDlFFH7/GMR4NAoZ9NpbjGL8EabJ5Pb/MYS6M7Qpw==
X-Received: by 2002:a17:906:c1c6:b0:7ad:7e81:1409 with SMTP id bw6-20020a170906c1c600b007ad7e811409mr11094550ejb.326.1668446641117;
        Mon, 14 Nov 2022 09:24:01 -0800 (PST)
Received: from skbuf ([188.25.170.202])
        by smtp.gmail.com with ESMTPSA id de30-20020a1709069bde00b0073d796a1043sm4388883ejc.123.2022.11.14.09.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 09:24:00 -0800 (PST)
Date: Mon, 14 Nov 2022 19:23:57 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH net-next v2 00/11] net: pcs: Add support for devices
 probed in the "usual" manner
Message-ID: <20221114172357.hdzua4xo7wixtbgs@skbuf>
References: <20221103210650.2325784-1-sean.anderson@seco.com>
 <20221109224110.erfaftzja4fybdbc@skbuf>
 <bcb87445-d80d-fea0-82f2-a15b20baaf06@seco.com>
 <20221110152925.3gkkp5opf74oqrxb@skbuf>
 <7b4fb14f-1ca0-e4f8-46ca-3884392627c2@seco.com>
 <20221110160008.6t53ouoxqeu7w7qr@skbuf>
 <ce6d6a26-4867-6385-8c64-0f374d027754@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce6d6a26-4867-6385-8c64-0f374d027754@seco.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Madalin Bucur <madalin.bucur@nxp.com>, Eric Dumazet <edumazet@google.com>, Paul Mackerras <paulus@samba.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, "UNGLinuxDriver@microchip.com" <UNGLinuxDriver@microchip.com>, Frank Rowand <frowand.list@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Saravana Kannan <saravanak@google.com>, Russell King <linux@armlinux.org.uk>, Vladimir Oltean <vladimir.oltean@nxp.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Claudiu Manoil <claudiu.manoil@nxp.com>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "lin
 ux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>, "David S . Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 10, 2022 at 11:56:15AM -0500, Sean Anderson wrote:
> these will probably be in device trees for a year before the kernel
> starts using them. But once that is done, we are free to require them.

Sorry, you need to propose something that is not "we can break compatibility
with today's device trees one year from now".
