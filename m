Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9641962B206
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 05:03:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NBqCz3r1pz3f2y
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 15:03:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.216.48; helo=mail-pj1-f48.google.com; envelope-from=kswilczynski@gmail.com; receiver=<UNKNOWN>)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NBqCP6wYpz30Qt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Nov 2022 15:03:12 +1100 (AEDT)
Received: by mail-pj1-f48.google.com with SMTP id w3-20020a17090a460300b00218524e8877so1745776pjg.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Nov 2022 20:03:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1zIzDKHHVNaVurdU/es7VrrKvHMyE/kDIQtf0pEpjIw=;
        b=oDzy/GgHfr0JAJyKvnmd/rSUenjJonezWQLnv8cFRIJuyb+Wza8SQArKiYm4lt4eTA
         XM8nc8ZlUgEoBSBURZ4lkZuFqW+hQO3zCQxqM/4zlyieHEbnA86nrGsUly+MZie1bx+a
         dRk+mjzSxWEPgZDygBmNDd7HyfYWu7UG/jbffwQKAdQSfiaMWoBJwBFFnUooorK6KtKU
         jsTuax3ih7xwJ1aAl4V35/6KRUB2O8SO0WoWjgRy7MFtSDHPZ2KIIbCAjsBaEx391ybq
         7Mvh/TMwTguLonEo0xWdcTaM8ZbWZNlFkL2GO789tmQtW7B6bPpMJkTMFUv0+Ij72nEm
         ekOw==
X-Gm-Message-State: ANoB5pl5BnE8mXntCxNRPMAaH73W/Ka5BJ0cv7EyP8KJ3fZ56efESGEq
	eZzz7hFXNVoYU9SxL0iucVI=
X-Google-Smtp-Source: AA0mqf6hyhoq112sIKQo2v/k51nNvfWIgxwNBEvlAx1Pthk/+MTebE7MSfBKsrWrQE5FLsqcaK8YIQ==
X-Received: by 2002:a17:90a:3f89:b0:217:90e0:3f8c with SMTP id m9-20020a17090a3f8900b0021790e03f8cmr1687555pjc.192.1668571388739;
        Tue, 15 Nov 2022 20:03:08 -0800 (PST)
Received: from rocinante (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id nl8-20020a17090b384800b0020d48bc6661sm390550pjb.31.2022.11.15.20.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 20:03:08 -0800 (PST)
Date: Wed, 16 Nov 2022 13:03:01 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3 0/4] PCI: Add pci_dev_for_each_resource() helper and
Message-ID: <Y3Rg9dGmzZl4GJU5@rocinante>
References: <20221114185822.65038-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221114185822.65038-1-andriy.shevchenko@linux.intel.com>
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
Cc: linux-pci@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>, linux-mips@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, sparclinux@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Russell King <linux@armlinux.org.uk>, Bjorn Helgaas <helgaas@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, xen-devel@lists.xenproject.org, Matt Turner <mattst88@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, linux-kernel@vger.kernel.org, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, linux-alpha@vger.kernel.org, linuxppc-de
 v@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

> Provide two new helper macros to iterate over PCI device resources and
> convert users.
> 
> Looking at it, refactor existing pci_bus_for_each_resource() and convert
> users accordingly.
> 
> This applies on top of this patch Mika sent out earlier:
> https://lore.kernel.org/r/20221114115953.40236-1-mika.westerberg@linux.intel.com
> 
> Changelog v3:
> - rebased on top of v2 by Mika, see above
> - added tag to pcmcia patch (Dominik)
[...]

Thank you Andy for all the improvements and Mika for the idea!

For the whole series:
  Reviewed-by: Krzysztof Wilczyński <kw@linux.com>

Looks very nice!

	Krzysztof
