Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D976236B0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 23:42:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N70Mg4PGkz3blY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 09:42:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ibl7hcVB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com; envelope-from=olteanv@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ibl7hcVB;
	dkim-atps=neutral
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N70Ll0Txhz2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 09:41:18 +1100 (AEDT)
Received: by mail-wm1-x335.google.com with SMTP id fn7-20020a05600c688700b003b4fb113b86so68994wmb.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Nov 2022 14:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=72SRA5lrKUs0W8xkTsquem3V1Ku1VH8DVJEO2i+3wLM=;
        b=ibl7hcVB2q3N30mwPYiDyU2n2efcA2mhjwKrEycsn2/uMV/RxGxZgN0FaG/Z+5ON/s
         7d6Vl01KgwNOhgBbfOcX83aLRUItOmOcU225DWB2BsI8I31zEEYbtzFvsCq5/IAIEPZb
         8nLhQvLIh+XpFiyuynQpceqBKuIGkcgca38Id1BucEBQvqSNvpIcHmZJQT/IxXaBE1FI
         vYjjYKYLJlJfsJqKyUxlbHRswqSQUcDJkMnQvUXAahhDWVsmCBmNHUA5Wh3q8/D9CJr3
         jUW7Imnz0cdeUQuIzxmcp+qMjz5p3LUdmqGZjMkvBbLDa5e+XBhPtXLMIimTFGHjshTk
         n49g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=72SRA5lrKUs0W8xkTsquem3V1Ku1VH8DVJEO2i+3wLM=;
        b=GNLkR8l6lGCAB3FJriIYYVsWaqBdroJ6cjadFih5POyxwMLIAoxslve507oIEguzb8
         QdIRhKdkoq7S/BD2G70O6Nj7VTzLeH2dIebX+ojHrwUbF4JwplqSGhq2QmafWnOD0z6B
         2OrUR0ixA4vodGA5SlJz/Twkb5HZjmO+Oy3EsjuN9GyoUf+B/RpPfxRuSTe1JRh+ZHJ7
         amFurgw3J3RSg0cPhhyhtS8+xrGmiPPMQiloam04jCT6Jgabj+dBGfT2CQJxzYdSsDER
         Yu22F7xKAuxAsfjzm5xIa1qyEo1GBscFAAVny5Ycdkud6c/yLc75whurvoPIJ5Ugi+mw
         qbrw==
X-Gm-Message-State: ACrzQf3eeV6tr09g34Gj/6etmzBnU0+e9bEVVjATTnmM+bIMzH+vm/Vs
	H2lQWxm5FO2aS4wQjUgmsb0=
X-Google-Smtp-Source: AMsMyM5R51wkRbWukTP527Ud/KNaaX7vPG9ioje5356mfGLpTU0MufKXFd6OipCgf3slypg5cLb5gg==
X-Received: by 2002:a7b:cb8d:0:b0:3cf:4969:9bc7 with SMTP id m13-20020a7bcb8d000000b003cf49699bc7mr53086243wmi.71.1668033673843;
        Wed, 09 Nov 2022 14:41:13 -0800 (PST)
Received: from skbuf ([188.27.184.197])
        by smtp.gmail.com with ESMTPSA id h8-20020a05600c2ca800b003b4a699ce8esm3166923wmc.6.2022.11.09.14.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 14:41:13 -0800 (PST)
Date: Thu, 10 Nov 2022 00:41:10 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH net-next v2 00/11] net: pcs: Add support for devices
 probed in the "usual" manner
Message-ID: <20221109224110.erfaftzja4fybdbc@skbuf>
References: <20221103210650.2325784-1-sean.anderson@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221103210650.2325784-1-sean.anderson@seco.com>
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

On Thu, Nov 03, 2022 at 05:06:39PM -0400, Sean Anderson wrote:
> Several (later) patches in this series cannot be applied until a stable
> release has occured containing the dts updates.

New kernels must remain compatible with old device trees.
