Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 334BC6C7AB3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 10:03:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PjbpV0s54z3fRJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 20:03:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WdoFuibS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=philmd@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WdoFuibS;
	dkim-atps=neutral
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PjbnX2KYzz3f7T
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 20:02:24 +1100 (AEDT)
Received: by mail-wr1-x434.google.com with SMTP id e18so978466wra.9
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 02:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679648540;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n243IrPXTdbsIKu5fMm4CD6r1EOzF5PeneoBpB/y4a4=;
        b=WdoFuibSoYq7PItUra7h1o7dNN+dLoO5akaOdiXzNB0GAE6fZrgXjLHEQ59DSfNlbF
         cgR9upm2UnMKp/K2iMTwYQO21eNLlcZA3VTjTQNcOKl6oB0YptTJSukTiMpZuSldqpht
         hT88zEf4E+gJCKG8bgBmZ3XtNmerD2XLEjORhA0Q/BXrUscdTef1dpRx9JDa6Bv504ko
         b2kwoYvEBcdXwhSFs2mCJx6XhNHoIVhKWvY4ugN0Krhnhx9JD7Gr1ZRwtzNsp6GxXu5W
         oQsFCmuvbtw0zcJ+Dg4t9K3RUmnMmVMxySl96IxGJYoNSUSPaDNY3cwVaR2TYMM/uF88
         /2CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679648540;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n243IrPXTdbsIKu5fMm4CD6r1EOzF5PeneoBpB/y4a4=;
        b=npfii1baGcTf6qvtDgDGgf06owJA8+rYISC2r9YeCACgFmbUwyWcJy68UKDxSaVTYu
         PKjboOHBXPr/qklNCJ4scPFAjERpq2TQrwrlULYoTdNQA+KCOw9lXKxgzhE4R4AF4pHB
         80JOFl5kEsQ75eeEPjxTZoXS4kz0SNe2VtVIfeBevGzEJuKXk1J4fO0BcyjgjBrTLadB
         CaBIoNAjChc2MQ/hoeRA03Irm7sNuUmspKF2Bn/pqEM6YlQ+0iXxpKEBlEKGRJqE8q5f
         Bf54VGLZuSADJArCWiGbqGVZG1FszQXhcOrxoIpqI28c2++n7/hbL/jUSQj4Wo72BxMm
         OjuQ==
X-Gm-Message-State: AAQBX9c/KtkBaAvZTZPtEVVlLWJ2hbISdP4BXwVm4SGPVcQHRdf1PeRo
	0XWYBD6XeCJZzeXkH8aLZqZWpQ==
X-Google-Smtp-Source: AKy350aF129LEbgPcrIERVDHzRV5kt9ClGRmiJzKHj2gDZXa1XzF6XQWfa0OQK6y0J9EwCOi2YJQVA==
X-Received: by 2002:a05:6000:1192:b0:2c7:17a4:4ece with SMTP id g18-20020a056000119200b002c717a44ecemr1496737wrx.26.1679648540094;
        Fri, 24 Mar 2023 02:02:20 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.152.149])
        by smtp.gmail.com with ESMTPSA id t6-20020adff606000000b002d828a9f9ddsm9869841wrp.115.2023.03.24.02.02.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Mar 2023 02:02:19 -0700 (PDT)
Message-ID: <43e7ef6d-6248-4ee5-7144-70809e5c93e0@linaro.org>
Date: Fri, 24 Mar 2023 10:02:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH v7 4/6] EISA: Convert to use less arguments in
 pci_bus_for_each_resource()
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
 <20230323173610.60442-5-andriy.shevchenko@linux.intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230323173610.60442-5-andriy.shevchenko@linux.intel.com>
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
> The pci_bus_for_each_resource() can hide the iterator loop since
> it may be not used otherwise. With this, we may drop that iterator
> variable definition.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Krzysztof Wilczyński <kw@linux.com>
> ---
>   drivers/eisa/pci_eisa.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/eisa/pci_eisa.c b/drivers/eisa/pci_eisa.c

Since this is *PCI* EISA, could be squashed into previous patch.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

