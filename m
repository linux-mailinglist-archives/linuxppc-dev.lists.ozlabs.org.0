Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFCD7DC1F1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Oct 2023 22:32:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SK61K5nWlz3cZy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Oct 2023 08:32:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.180; helo=mail-oi1-f180.google.com; envelope-from=robherring2@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SK60m6kRWz2ys9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Oct 2023 08:31:51 +1100 (AEDT)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3b2f5aed39cso3076748b6e.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Oct 2023 14:31:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698701508; x=1699306308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OuBaURUuWJkEQpbZhWeSxspKPPb+Lr69ekE2ADTt8Wc=;
        b=p31cTEkvQ855SjhqJM5IbPZ9Yp2HYknnJCydMRAJ5K+dZymBe/3vwofIjw7GGQv70o
         D1Km/bkihHOkG3Ca3bjm4FWG6rZSvcZG0l9czX+qd5i8hMCRHb+EAhu1/1U2FYSFRpMH
         sm9NS41vZs24lwoAeK6q4ExTFv0V2YtZOvS3gk7oBPAh3nWlFYgRKhfjLF37vkzlZqAJ
         Gh/M0J/46WScP7bsGEDK9dCi/T8uuKFW+ozyAyDwZf1dIcWYTRsIS8+SARhR6WBnZtRp
         glOu9j9qEkWdbUsPT7Bba2Mg4xY8e9xSf6mruOHcpaBh2b/9pboqwyoj0VzVQs0c9rE1
         38FA==
X-Gm-Message-State: AOJu0YzMkeDi6mOVt0x3x2DT5pxZ4rEp5cSV9O2XBt8PjCq5tPfefMPq
	3qKnfP70jvFfvBK4IPJXzQ==
X-Google-Smtp-Source: AGHT+IGKuby//PdBhTBpw28HsYfEui30ghahooRRo1gU9DZgJ7OM+SQsCkxRsIdIYwyzeeSbhBnk8w==
X-Received: by 2002:a05:6808:1789:b0:3ae:554b:9c97 with SMTP id bg9-20020a056808178900b003ae554b9c97mr14084990oib.37.1698701508322;
        Mon, 30 Oct 2023 14:31:48 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id e22-20020a05680809b600b003afc33bf048sm1518710oig.2.2023.10.30.14.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 14:31:47 -0700 (PDT)
Received: (nullmailer pid 2495794 invoked by uid 1000);
	Mon, 30 Oct 2023 21:31:46 -0000
Date: Mon, 30 Oct 2023 16:31:46 -0500
From: Rob Herring <robh@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH v8 00/30] Add support for QMC HDLC, framer infrastructure
 and PEF2256 framer
Message-ID: <20231030213146.GA2490536-robh@kernel.org>
References: <20231011061437.64213-1-herve.codina@bootlin.com>
 <20231013164647.7855f09a@kernel.org>
 <20231025170051.27dc83ea@bootlin.com>
 <20231025123215.5caca7d4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025123215.5caca7d4@kernel.org>
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org, Herve Codina <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Jaroslav Kysela <perex@perex.cz>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Lee Jones <lee@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>, linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Li Yang <leoyang.li@nxp.com>, Simon Horman <horms@kernel.or
 g>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 25, 2023 at 12:32:15PM -0700, Jakub Kicinski wrote:
> On Wed, 25 Oct 2023 17:00:51 +0200 Herve Codina wrote:
> > > Which way will those patches go? Via some FSL SoC tree?  
> > 
> > This series seems mature now.
> > What is the plan next in order to have it applied ?
> > 
> > Don't hesitate to tell me if you prefer split series.
> 
> FWIW we are happy to take the drivers/net/ parts if there is no hard
> dependency. But there's no point taking that unless the SoC bits
> also go in for 6.7.
> 
> Li Yang, what are your expectations WRT merging this series?

I think it is too late for SoC stuff for 6.7. 

I picked up binding patches 6, 7, and 8 because 6 and 7 are the same as 
an additionalProperties fix I have in my tree. As 8 depends on them, I 
just picked it up too.

Rob
