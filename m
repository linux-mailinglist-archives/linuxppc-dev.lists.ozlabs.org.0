Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1A4B406
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 18:58:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44rxv903TpzDqJj
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Apr 2019 02:58:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=f.fainelli@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="oY1Z64Kc"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rxsl00kBzDqdf
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Apr 2019 02:56:54 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id d9so3024988pls.8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2019 09:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Hvtq7zNAnrPZFqg7B9biXnElsoCmOPrVGVZCJ5gJhp4=;
 b=oY1Z64KccFbyy0wq9QVwJe0jyd7/RsnZQ/RB8ENhLnlCZjeajuJNoHTIn7SX0vVdqi
 LrjUFiFbUCa4YxtQMvMdljRqdgTGgHHDLQHj1H0QA9OyD05A3DqADEj8/N1oJhoproXe
 y/9kGhYlwLp4EsGsStj0io0eywSB1DQAT/MNckNred9ws5HfIqcstfSMDAPbD8MvPnJX
 2J5O4rkODzSg+rHTATqNxgK3wELuL9CMGwJhxNvPTwUcOewrX3KyYIsv9M0jMOJs122I
 lwv9AJyObKXTquKg208AUDBouu50hh5Yb0ErQ0TMHegRiHTmh4VYhwlqWwTjE8E8Ev7q
 0hPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Hvtq7zNAnrPZFqg7B9biXnElsoCmOPrVGVZCJ5gJhp4=;
 b=o8UNYj2bcvrlAjbSeODQUssfujW4VMpZdeQK+LZm98bmWtdGivJdNfeQFtggmdvAGu
 su2udYnrdk9yyIoNanlD1J46xTaDjY6nFkyxdeOeLvSNqRHuMLwqH0EWD25f4J8M649v
 LdoDgtkdDiUvxRNY6GLtB2lbq8RSgPMGnEFgLjEsEX4geiaVxLZ9nWXLwjmUvfYayP2f
 cTLqU433DCkvc+fOO9/ekmqpGIMAob7fg/tM3NDUqerlOfv/5SFJPSjQKjk+szoXFEuc
 iZzU6C1ys9ICSFcYdd4CnOkLcP6FSwCXfx0+Ifz9bUAnBqLhQHK/c9MZnGbj5w1V3qTw
 JpSw==
X-Gm-Message-State: APjAAAXf41NJrFeK89cY2Ywgyarwysx+Yb9x9WtTg3nYhy9TYq1VnMsH
 T0oj3B6yIwuM2Jj4/ZURf5tQHbqx
X-Google-Smtp-Source: APXvYqwSU6ZbpDR62x+bxBE8Veh7kQjbUVRkiAHr91sHGmJIgIdCZpoTZH34EFyaTXPIL5o++jb2hg==
X-Received: by 2002:a17:902:2b87:: with SMTP id
 l7mr53015721plb.130.1556384211138; 
 Sat, 27 Apr 2019 09:56:51 -0700 (PDT)
Received: from [10.230.28.107] ([192.19.223.250])
 by smtp.gmail.com with ESMTPSA id w65sm473514pfb.59.2019.04.27.09.56.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 27 Apr 2019 09:56:49 -0700 (PDT)
Subject: Re: [PATCH 2/4] dt-bindings: doc: Reflect new NVMEM
 of_get_mac_address behaviour
To: =?UTF-8?Q?Petr_=c5=a0tetiar?= <ynezz@true.cz>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Fugang Duan <fugang.duan@nxp.com>, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta
 <salil.mehta@huawei.com>, Woojung Huh <woojung.huh@microchip.com>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Kalle Valo
 <kvalo@codeaurora.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Li Yang <leoyang.li@nxp.com>
References: <1556320002-26213-1-git-send-email-ynezz@true.cz>
 <1556320002-26213-3-git-send-email-ynezz@true.cz>
From: Florian Fainelli <f.fainelli@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <f335fb31-ed1b-efd1-9cd3-a88b4a7fadf0@gmail.com>
Date: Sat, 27 Apr 2019 09:56:35 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1556320002-26213-3-git-send-email-ynezz@true.cz>
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, linuxppc-dev@lists.ozlabs.org,
 linux-wireless@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Alban Bedel <albeu@free.fr>, linux-oxnas@groups.io,
 Frank Rowand <frowand.list@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 4/26/2019 4:06 PM, Petr Štetiar wrote:
> As of_get_mac_address now supports NVMEM under the hood, we should
> update the bindings documentation with the new nvmem-cell* properties.
> While at it, fix also other missing properties supported by
> of_get_mac_address.
> 
> Signed-off-by: Petr Štetiar <ynezz@true.cz>

While I appreciate your effort in making the bindings up to date and
consistent, this does really scale well and is an error prone exercise,
how about consolidating all MAC address related properties into the
ethernet.txt document like you just did and update all bindings to
indicate something along the lines of:

For all other standard Ethernet related properties, please refer to
ethernet.txt or something like that?
-- 
Florian
