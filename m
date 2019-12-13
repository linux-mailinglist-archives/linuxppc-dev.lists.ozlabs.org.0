Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6349811E898
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 17:43:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ZGhJ4LsHzDrLb
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Dec 2019 03:43:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=arista.com (client-ip=2a00:1450:4864:20::441;
 helo=mail-wr1-x441.google.com; envelope-from=dima@arista.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=arista.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=arista.com header.i=@arista.com header.b="RDZC2Ziu"; 
 dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ZGfR11JjzDrGp
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Dec 2019 03:42:06 +1100 (AEDT)
Received: by mail-wr1-x441.google.com with SMTP id c9so92215wrw.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2019 08:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+Xy8RflunQ2h7lBPgvCLBQe6kC/5oXa7qNJM46i4OvE=;
 b=RDZC2ZiusGEyrtg6BPZpt/3zIXUDvTioxjK9hCuEm49HHbr3H/dAOfWKhTeLkK3Bp5
 mwslCzN5062kRXM1mLfDGyALHEWNTkHjICeOQc11+9KBDd7f19DKdFfeznFmkiP2iu/b
 X4xf0Xn0uq1+4PP0nKj0gPeSALXRk8hr+7z6OQI2nr4636450ZFHJs8VP3HyfFaJsTVP
 HzWknwSfbUCuDOtglpkghgYl1PzBXP2sQbaCvGZ+HwEkO2egA9fVrLSahpKuX/LZCycb
 kC6vC6YhGlL6xoAsu0f2oh+y3zZZpvkht74vL/pO8ENbamlFgdAMQPwCftTj41QI1w5d
 MyeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+Xy8RflunQ2h7lBPgvCLBQe6kC/5oXa7qNJM46i4OvE=;
 b=om+Rb8KG/+4elNX6cT73N6yEJsA+DczzwlTTSWJGRRALgFeIX8pec2t8NFoiX9GXGN
 08w5wPRKfrhbjN5GbEPGWge3MuLQD+0gb/xJgKM1B3kkXYiK7d91DX1JQYWOkvj/PhS5
 gRSnTzXfnhtLlSqU/ARQfe7zoGBDgb5KRsduriEkjg2PLsq3XiHM+U3VSU07MjjzFWT2
 NQGpSnxqJV4gIyL/WZP3xXfBoWwkp8h3Br+YYQztA0Fi7JalCKzAah/Q/wypKx7chPK0
 EzEjwSzMCifCE6mJHvc1lXHMPqJtPtRIFN3w76y1Mfk2VHHL/NLNsYOwicxpW5TOaetk
 1OOA==
X-Gm-Message-State: APjAAAXHK2vgKEz5XbM1DJ/eNsF4faM3eJKfUT6/CspYW8JdRe2a6uMk
 Dq/PhVixcyrN0g1+nmZD4X/DZQ==
X-Google-Smtp-Source: APXvYqzIaw4yXEvzLQQBJqUcuUQde/4MOljSnSzj5+B7FHPM/cAqWL9ZIzlETdg8BqlmTOhn/Pq8vg==
X-Received: by 2002:a5d:4fd0:: with SMTP id h16mr13243381wrw.255.1576255321811; 
 Fri, 13 Dec 2019 08:42:01 -0800 (PST)
Received: from [10.83.36.153] ([217.173.96.166])
 by smtp.gmail.com with ESMTPSA id g69sm11707225wmg.13.2019.12.13.08.41.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Dec 2019 08:42:01 -0800 (PST)
Subject: Re: [PATCH 00/58] serial/sysrq: Cleanup ifdeffery
To: Christophe Leroy <christophe.leroy@c-s.fr>, linux-kernel@vger.kernel.org
References: <20191213000657.931618-1-dima@arista.com>
 <524d9848-28a5-7e65-699b-600c49606487@c-s.fr>
From: Dmitry Safonov <dima@arista.com>
Message-ID: <0e642e4e-7349-3d92-3e54-cbfd8d417fea@arista.com>
Date: Fri, 13 Dec 2019 16:41:53 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <524d9848-28a5-7e65-699b-600c49606487@c-s.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-aspeed@lists.ozlabs.org, Dmitry Safonov <0x7f454c46@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Mackerras <paulus@samba.org>, "Maciej W. Rozycki" <macro@linux-mips.org>,
 sparclinux@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Vasiliy Khoruzhick <vasilykh@arista.com>, Alexander Shiyan <shc_work@mail.ru>,
 Kevin Hilman <khilman@baylibre.com>, Russell King <linux@armlinux.org.uk>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Andy Gross <agross@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Joel Stanley <joel@jms.id.au>, linux-serial@vger.kernel.org,
 Jiri Slaby <jslaby@suse.com>, Orson Zhai <orsonzhai@gmail.com>,
 Iurii Zaikin <yzaikin@google.com>, NXP Linux Team <linux-imx@nxp.com>,
 Michal Simek <michal.simek@xilinx.com>, Kees Cook <keescook@chromium.org>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Johan Hovold <johan@kernel.org>, Baolin Wang <baolin.wang7@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-amlogic@lists.infradead.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Timur Tabi <timur@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org,
 Patrice Chotard <patrice.chotard@st.com>, Tony Prisk <linux@prisktech.co.nz>,
 Richard Genoud <richard.genoud@gmail.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, linux-fsdevel@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

On 12/13/19 5:47 AM, Christophe Leroy wrote:
> Le 13/12/2019 à 01:05, Dmitry Safonov a écrit :
[..]
> 
> powerpc patchwork didn't get the full series, see
> https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=148198

Yes, I was under impression that architecture mail-lists want related
patches. But now I see that from the patchwork point of view it's better
to have the whole series in inbox.

> Can't find them on linux-serial patchwork either
> (https://patches.linaro.org/project/linux-serial/list/)

I'm not sure - maybe the frequency of checking is low?
I see all patches in linux-serial ml:
https://marc.info/?l=linux-serial&r=1&b=201912&w=2

> It is impossible to review/test powerpc bits without the first patches
> of the series, where can the entire series be found ?

Sorry for the inconvenience.
I can resend without Cc'ing all people just to ppc mail-list if that
works for you. Or you can clone it directly from my github:
https://github.com/0x7f454c46/linux/tree/sysrq-serial-seq-v1

Thanks,
          Dmitry
