Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7EF6685DF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 22:49:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NtJ9P43HRz3gXy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 08:49:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CLGQjrQB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e2e; helo=mail-vs1-xe2e.google.com; envelope-from=f.fainelli@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CLGQjrQB;
	dkim-atps=neutral
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NtHNr39K5z3fN4;
	Fri, 13 Jan 2023 08:14:19 +1100 (AEDT)
Received: by mail-vs1-xe2e.google.com with SMTP id i188so20347406vsi.8;
        Thu, 12 Jan 2023 13:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9G8E/pbF0yCVEwppEfeZ3APRR94ekY7sl663Hc09EMo=;
        b=CLGQjrQB/cXT4ivLFkBZ2uFfRzV2B4EuZw/fwRZDs/OamGqTfErZRyoEF5zSftNssA
         aXo/J943u3z52xiiyn9ozbhsyoQruIu2fecHP/z+SDB5JICNMpxq0KcptZnYMIhrShBM
         YfC96q6zTGqcqq9hX2DPYulrMchhsuMtmAzxE/31s8E9O7Mmo6W9CLXhI76inUfSWyDe
         +cHCugoc13oZ7d5vWOFEfSgOP8LUmFvg/dNuqBbCgACKDXztYEDpxaveJOoNssA3MPUw
         vfhD6ahNx593rmXHQEFQIlfxRB/Tly17byXrAoAyTruXS4oWhtjl0KJfWf3LFxNyESR/
         QMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9G8E/pbF0yCVEwppEfeZ3APRR94ekY7sl663Hc09EMo=;
        b=xldH3DA7DrdztDDTAkJvGSzWOfta4gVE0zT3SWsaUM9rLYmsL2GcaXDKh7A8j2b1q1
         ezJXyrIHpGFSHudZR1hS89uFOMuAduZ/zZygIY3/iHMta+lJ0gIYBBKPbj0Lb9tArk2z
         QuLvv6suJvsQJaJGTQ+9zfDISW3MVTBT8gBD/s3rT0mvnGLRXB+GspYiSrG/hrHlOkRN
         jM2J7RYl4KOn6u7rURrW48YG6xYZw6mShF/X4uQnZvvfG8mbFVPkRBU9sd0iRl5bBQPW
         iAq+cMoPD3V/9UXDLbqzkr0HYwzoxG2QXkeqNglwpRyDmC/SYLHyO5x43XcqjSq8px2Z
         etqA==
X-Gm-Message-State: AFqh2kr6UrQkWJQxhI2Nc1UEVqaW5aflgxFkZDDeF4rJi5b9kIOilX9t
	MwO2eEFoRvk9h88yDYgANAI=
X-Google-Smtp-Source: AMrXdXvqOpDKUMfAeRKnyAEn0jSg0Xdln+Y3NUo/FVdyWNh9GqqApDbAMshix//ZhSV0K8IXOyErgA==
X-Received: by 2002:a05:6102:32d3:b0:3d1:657e:39ff with SMTP id o19-20020a05610232d300b003d1657e39ffmr335281vss.30.1673558054609;
        Thu, 12 Jan 2023 13:14:14 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id u15-20020a37ab0f000000b006f9c2be0b4bsm11202593qke.135.2023.01.12.13.13.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 13:14:14 -0800 (PST)
Message-ID: <2fd5c783-94f1-1896-c6b9-431a754aec14@gmail.com>
Date: Thu, 12 Jan 2023 13:13:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH net-next 03/10] net: mdio: mux-bcm-iproc: Separate C22 and
 C45 transactions
Content-Language: en-US
To: Michael Walle <michael@walle.cc>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Felix Fietkau <nbd@nbd.name>,
 John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 UNGLinuxDriver@microchip.com, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Li Yang <leoyang.li@nxp.com>
References: <20230112-net-next-c45-seperation-part-2-v1-0-5eeaae931526@walle.cc>
 <20230112-net-next-c45-seperation-part-2-v1-3-5eeaae931526@walle.cc>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20230112-net-next-c45-seperation-part-2-v1-3-5eeaae931526@walle.cc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-aspeed@lists.ozlabs.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/12/23 07:15, Michael Walle wrote:
> From: Andrew Lunn <andrew@lunn.ch>
> 
> The MDIO mux broadcom iproc can perform both C22 and C45 transfers.
> Create separate functions for each and register the C45 versions using
> the new API calls.
> 
> Signed-off-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
> Apparently, in the c45 case, the reg value including the MII_ADDR_C45
> bit is written to the hardware. Looks weird, that a "random" software
> bit is written to a register. Florian is that correct? Also, with this
> patch this flag isn't set anymore.

We should be masking the MII_ADDR_C45 bit because the MDIO_ADDR_OFFSET 
only defines bits 0 through 20 as being read/write and bits above being 
read-only. In practice, this is probably not making any difference or harm.
-- 
Florian

