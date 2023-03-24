Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E769B6C7AA0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 10:01:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PjbmB4KX7z3fT5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 20:01:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=a1FBd8hd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=philmd@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=a1FBd8hd;
	dkim-atps=neutral
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PjblF4Fbbz3f8t
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 20:00:22 +1100 (AEDT)
Received: by mail-wm1-x330.google.com with SMTP id i5-20020a05600c354500b003edd24054e0so2684459wmq.4
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 02:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679648415;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5xxjybCBQ7FBka5nE6E8+uHXCIz/6b/SCGTHJfPcbCM=;
        b=a1FBd8hdYt0yM0X/QMw5JK93/6fmZkvcvOaCpGAhllGD9kZY3ocWprh/fBfy2T2rod
         YkjH4UdxH2uedUuCvo+EkF57N3c7HVf3QBOceSd07Mza5R+OpESBolPUbeS2d8fEsBnh
         OQSDXwfd2956PoRvrlESlWmo04/2c61Xl/bDa7ICS7G31P3ZvNNxX5D0+ZOcZrZ5tdVJ
         2S9NsPv6/2vlegpFew239TZL4Ndvj2ZSLHjydzAhHLKc0SUYXBptCAACw1ytjJlvXLD2
         ngcfW35TYBHM51xRfg++jvURD69Dmc0jU2GT+32k16t0vBRoghLroNVWI9Q6WKBRZRnc
         Sc/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679648415;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5xxjybCBQ7FBka5nE6E8+uHXCIz/6b/SCGTHJfPcbCM=;
        b=OZHlNxDF+nB1uxK/qXnKJK7Dg5sIBd/H5UGihtkEL/YKdVYTDTIGTtwiT0Afhslg99
         bTIzzUmsHByPbt9/UaU/boGmJvjcYE5BmqSue7Yg7Srtwt4DMyLyo0EjgYf1WjnFDxKf
         l/bZ7W/ZWeENOD3LnSeHClSec6C8k1GdG5AooalWPdk/5mnAHNav85jjBjemrd7jW3Tk
         hhxtyB7wU90zdQvQgha1e5BlrdH474M0g+HKSOYBOKU7HD4sO5mjbcjniklXsFywfGR4
         cnl0PG68asLOhNXO7BKi14fgFc2ak07xHAexNHZ27aM/Tlimt+engccbVwhdtdiAFyiO
         1yVg==
X-Gm-Message-State: AO0yUKXNJJDgM1oRHaj0/VvZoAlQK1AQGL8iTScmg8IDl398jHRcCYSQ
	Kf4/yaoTtOAXIyhEQgmFQKuGpQ==
X-Google-Smtp-Source: AK7set/G+BrnIBHzdKAcJLIchyTJ1+8LJ+VqEzbQ4F0KmkhucSNebeQVHkqJ+K4tuv21EwA1IHVe7Q==
X-Received: by 2002:a7b:c459:0:b0:3eb:a4e:a2b2 with SMTP id l25-20020a7bc459000000b003eb0a4ea2b2mr1815337wmi.4.1679648415689;
        Fri, 24 Mar 2023 02:00:15 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.152.149])
        by smtp.gmail.com with ESMTPSA id n20-20020a7bc5d4000000b003ee10fb56ebsm4302953wmk.9.2023.03.24.02.00.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Mar 2023 02:00:15 -0700 (PDT)
Message-ID: <78a9e002-ba18-c580-fe89-46f5653ea49d@linaro.org>
Date: Fri, 24 Mar 2023 10:00:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH v7 3/6] PCI: Allow pci_bus_for_each_resource() to take
 less arguments
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Randy Dunlap <rdunlap@infradead.org>,
 Arnd Bergmann <arnd@arndb.de>, Niklas Schnelle <schnelle@linux.ibm.com>,
 Bjorn Helgaas <helgaas@kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>, Juergen Gross <jgross@suse.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org
References: <20230323173610.60442-1-andriy.shevchenko@linux.intel.com>
 <20230323173610.60442-4-andriy.shevchenko@linux.intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230323173610.60442-4-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Andrew Lunn <andrew@lunn.ch>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Stefano Stabellini <sstabellini@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Gregory Clement <gregory.clement@bootlin.com>, Richard Henderson <richard.henderson@linaro.org>, Russell King <linux@armlinux.org.uk>, Nicholas Piggin <npiggin@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Rich Felker <dalias@libc.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Miguel Ojeda <ojeda@kernel.org>, Matt Turner <mattst88@gmail.com>, Anatolij Gustschin <agust@denx.de>, "David S. Miller" <davem@davemloft.net>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 23/3/23 18:36, Andy Shevchenko wrote:
> Refactor pci_bus_for_each_resource() in the same way as it's done in
> pci_dev_for_each_resource() case. This will allow to hide iterator
> inside the loop, where it's not used otherwise.
> 
> No functional changes intended.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Krzysztof Wilczyński <kw@linux.com>
> ---
>   drivers/pci/bus.c                  |  7 +++----
>   drivers/pci/hotplug/shpchp_sysfs.c |  8 ++++----
>   drivers/pci/pci.c                  |  3 +--
>   drivers/pci/probe.c                |  2 +-
>   drivers/pci/setup-bus.c            | 10 ++++------
>   include/linux/pci.h                | 17 +++++++++++++----
>   6 files changed, 26 insertions(+), 21 deletions(-)

Nice.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

