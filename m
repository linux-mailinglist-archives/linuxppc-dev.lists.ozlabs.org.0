Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13ED2144AAF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2020 05:06:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 482X0G5777zDqQc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2020 15:06:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::344;
 helo=mail-wm1-x344.google.com; envelope-from=f.fainelli@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uhsGKyNy; dkim-atps=neutral
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 482WyT19j3zDqDT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2020 15:05:01 +1100 (AEDT)
Received: by mail-wm1-x344.google.com with SMTP id p9so5350174wmc.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2020 20:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QnP3I9MQH2rjvN4odqaiJfYKIdwE2UEnGytQrH/isCo=;
 b=uhsGKyNygZhXrZu7vjW5rzhzl2zOR80ETGG0fo6Wx++dxDeZPl5EoBK2tzjxMJjxOd
 LeCOLr3vGDWeAVm06DUuLADW5K7S2/+mHDDLpGgRO0THcQL9JHtv7u3BvEBlJr0jP7Ak
 BE0RqXczHjodZn+Vo8L+XL/tls839WQqTk5qM/cWm6LihNu2HGaeeTmQ7BPScl7wWilc
 BaHpHzEbnqUYBFufqdTq8c+gHF7PTC94LXv6YhCXMiIXkJPB8Cb5UrHI5ADMRLjA42zo
 nLMeVAii95vUSkdWBg5b7poNaR1WUrM6yM2b2w7gN2l1Z0s8bZCpIZe+3tTbA8O4xFEI
 DIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QnP3I9MQH2rjvN4odqaiJfYKIdwE2UEnGytQrH/isCo=;
 b=qlZ+jlYcIXLCj+Q6DK75E4AVJXuJvlBHeRwijlwGuvzLdKaqVT1vOXH6X3+XW/imbS
 GntAgYiZRm7G4+yhAO3wWI0Oi/lqnDfhNsZMg+bsTwMKRMhiRYSE0OTsfQ8kxluPd8D/
 JTLkhFHEDN9c1bYezTi4zUPN8HkF248Pbeiop2oowX2B11FBq5GcbLdnqIotnUo7Ht5p
 Lz2US5RHXvZLThbOamr1uzrpr+kZfUk2OgP+LxwfAsSY76z+vRIOG3j3ZfILq+OpWzor
 jcx6Q4fDob4H1YCWKFkoEExFtz/3jQJKL1o7C83KdUsgC4BRG3qduDUeHKci8nQkiajj
 kgtw==
X-Gm-Message-State: APjAAAW4ONbsfAmuce84GcoKgKlMMNYD1EtTykOrLKx/eFiNUowCLyhi
 P8X9Z22PHWRU/sj1HmBYZCk=
X-Google-Smtp-Source: APXvYqy5KkRy1uXxqtjC4MyYoj8JskrPlSRfUong+9Z73j995d4xccxTBqgnHi3V+SoQVsINzFgxaw==
X-Received: by 2002:a05:600c:2959:: with SMTP id
 n25mr481678wmd.185.1579665897027; 
 Tue, 21 Jan 2020 20:04:57 -0800 (PST)
Received: from [10.230.28.123] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id m3sm53812768wrs.53.2020.01.21.20.04.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2020 20:04:55 -0800 (PST)
Subject: Re: [PATCH v2 net-next] net: convert suitable drivers to use
 phy_do_ioctl_running
To: Heiner Kallweit <hkallweit1@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 David Miller <davem@davemloft.net>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Doug Berger <opendmb@gmail.com>,
 Pantelis Antoniou <pantelis.antoniou@gmail.com>,
 Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta
 <salil.mehta@huawei.com>, Vladimir Zapolskiy <vz@mleia.com>,
 Sylvain Lemieux <slemieux.tyco@gmail.com>, Timur Tabi <timur@kernel.org>,
 Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 Steve Glendinning <steve.glendinning@shawell.net>,
 Michal Simek <michal.simek@xilinx.com>,
 Woojung Huh <woojung.huh@microchip.com>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>
References: <2db5d899-a550-456d-a725-f7cf009f53a3@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <9d2dbcc0-7e22-601a-35f6-135f2a9e6f99@gmail.com>
Date: Tue, 21 Jan 2020 20:04:50 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <2db5d899-a550-456d-a725-f7cf009f53a3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Linux USB Mailing List <linux-usb@vger.kernel.org>,
 linux-renesas-soc@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 1/21/2020 1:09 PM, Heiner Kallweit wrote:
> Convert suitable drivers to use new helper phy_do_ioctl_running.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
The vast majority of drivers that you are converting use the following
convention:

- !netif_running -> return -EINVAL
- !dev->phydev -> return -ENODEV

so it may make sense to change the helper to accommodate the majority
here, not that I believe this is going to make much practical
difference, but if there were test cases that were specifically looking
for such an error code, they could be failing after this changeset.

For bgmac.c, bcmgenet.c and cpmac.c:

Acked-by: Florian Fainelli <f.fainelli@gmail.com>

Whether you decide to spin another version or not.
-- 
Florian
