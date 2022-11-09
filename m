Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFC1623731
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 00:00:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N70n60C1Tz3dv7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 10:00:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qgV5InPt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=olteanv@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qgV5InPt;
	dkim-atps=neutral
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N70m83hC9z303m
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 09:59:51 +1100 (AEDT)
Received: by mail-wm1-x32d.google.com with SMTP id v124-20020a1cac82000000b003cf7a4ea2caso2246720wme.5
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Nov 2022 14:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=swcrtWEk/pjEDFJKOi6muSLrFWlp8giizOyeDdjr3QI=;
        b=qgV5InPtVbonJaw0kv4ZbCSPNUG0xf4Pn9GME0tsiZ0IUqaOWghUYHueI4ljO6Po1T
         o4irPUC5EKmGrtN2mrzJF2gFRCiwSyOxJRriuGI96ZjO5Siks+qR8efhjNt9GRubLaik
         KgyWYE447kS3+rmtz5QuDgEmy7LzOQ50dH7ns8itJ5M8mT+n1FVvbR33jD+XIU9TNOlR
         6VD7WdQkVPWhcqH4M7OEaadnw9LR+yTrKE3XVtepyRZ82Ph4VacvfwmoWmnn0zcDYlFi
         1plh0u6lKqfAeTB/C4spDO4eqcFBbGJWFcJNDntsA8fgeO2LE7GOoSgCfo3oKvVar0q1
         xTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=swcrtWEk/pjEDFJKOi6muSLrFWlp8giizOyeDdjr3QI=;
        b=tXtHn71M/oy8Rkasl817mQ0OQkJ5CmIOpfgfwhV+X+P+Gp/CfCNNAITlZN4JRFTyIv
         LOcqbVMZUUVi4UwXC5aiUXO9aT9FJwjPRFCFXr97AZU2uhgvCVHzAoZiJCvfeLXHyl8F
         AAkxSzh18rzhkRraG40Dk0jRc7pg/zIWh8/I9tMbs9np/XkilWONrtPGCIrV5xQviZMS
         DpJbTeJhOAjGtPUhyb6aBWOEZAqn8io+9HuK4RPrX7kbRNIxjPzzCjnu/ZIIJYl7au4x
         hB6OzgZzb2t/g7W2lsaeUVLUAfIm2Y7XdIqTMd0Dp3muvK+r03JVSXJCOFizaioNTLhY
         4Qhg==
X-Gm-Message-State: ANoB5pkhbqTwFUADqaYpw2FFevdMhZDRD3Eg0Hgq/Obevyz23abacc3I
	Ujio3nll1RBwnwX1AhHB/bfILGyC5YDFtg==
X-Google-Smtp-Source: AA0mqf79cVkwjf7QQCHzuNa6IK4Sqr+HRH2GA9ig8lczx/Yt8P39Cw2PM+3pWIS8kfcqXPHw8pEUMQ==
X-Received: by 2002:a05:600c:3393:b0:3cf:b30a:e202 with SMTP id o19-20020a05600c339300b003cfb30ae202mr9650192wmp.91.1668034787609;
        Wed, 09 Nov 2022 14:59:47 -0800 (PST)
Received: from skbuf ([188.27.184.197])
        by smtp.gmail.com with ESMTPSA id q10-20020adff94a000000b0022e035a4e93sm13982413wrr.87.2022.11.09.14.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 14:59:47 -0800 (PST)
Date: Thu, 10 Nov 2022 00:59:44 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH net-next v2 00/11] net: pcs: Add support for devices
 probed in the "usual" manner
Message-ID: <20221109225944.n5pisgdytex5s6yk@skbuf>
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
> For a long time, PCSs have been tightly coupled with their MACs. For
> this reason, the MAC creates the "phy" or mdio device, and then passes
> it to the PCS to initialize. This has a few disadvantages:
> 
> - Each MAC must re-implement the same steps to look up/create a PCS
> - The PCS cannot use functions tied to device lifetime, such as devm_*.
> - Generally, the PCS does not have easy access to its device tree node

Is there a clear need to solve these disadvantages? There comes extra
runtime complexity with the PCS-as-device scheme (plus the extra
complexity needed to address the DT backwards compatibility problems
it causes; not addressed here).
