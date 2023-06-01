Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D5D719AD6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 13:18:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QX3Xb1cnfz3dxB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 21:18:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=MeUm9Ydy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=jonas.gorski@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=MeUm9Ydy;
	dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QX3Wk0Zccz3cC5
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 21:17:36 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-25673e8c464so217160a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Jun 2023 04:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685618253; x=1688210253;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3KLMivggFERHTUQ4oKDCdCn/4yto409QZ31zuIfVcxw=;
        b=MeUm9YdyFvQ+EmzMauQm3DwWlQ0uGm51kMyqs4PhBgH/mijyrQiG2NopdYymwRbJxY
         WBb3Tf1Ln6XZqKWhH5S7yQhGi9LLiabQOTeQ8Pbm6c1NX2Xy4WY3/v4jgXe5Wm7qcbDH
         yEY3HNSHJGimYiFdpPz7nmg67nUmGWb4PamYB7ge/Vdfq0ytqPkY0wlqmD8GxJ3QU2ha
         YMgYHSJ7Qpd2tGHgPxbotFgYnGiJWb6n/hwdCwf80mscrhqXd4SxH5LEbISu95zojTnv
         WNtxh7RS0s5xKaXlqlboISfHSVYLF8kc+uAACZeNu+Oizk+CGC+kRe6EXEKAHfyfkH5e
         ZLFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685618253; x=1688210253;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3KLMivggFERHTUQ4oKDCdCn/4yto409QZ31zuIfVcxw=;
        b=WIRGlJJ5EB55UWAR0dJhpE4TLDqx7qyOq5Aijwu+ZKNaO++Pb5NG7218P6OfAfDjak
         YzkgTvt6IkdV/o1aG0zRf5q2ajb64fiwMHRojdGWotXENnHkN4bPa0GpcONdgbi3CDw1
         7gEpGQv5xDcAqudVJaHeIoTcDOkoyILcRg+W0oJRBouL7WnHUi2OXq7qZOtgPdHUoGy0
         4sd2+mI2MW0Fq/yGzVAXk0gqVDsmPL4lJewl0lU83uVqjwjqbUA/IEte3nQYCgUrXdq2
         vmr5MdFTKIHWvwSubZU7bqU9tQsGfgz2yOkYcCopkgzAXRPI0afmo4Vw71RU4z1yvpfJ
         rl+A==
X-Gm-Message-State: AC+VfDygM9OD3Y+xqXyQxUBnC5Ni47YiLIjHUh2NnEPfqM9HNcR9t0rR
	Ukr9D3f21f1D6CcRbO77mYVngYYJ0xdvsX6zUdE=
X-Google-Smtp-Source: ACHHUZ7nalKosql0wqoA6eLZQyCHzFFB2nLyOpniZjsGzpomunYZZ7UC7Kcp/mX27yNINR6qH69ddmRyUjrovwtppOk=
X-Received: by 2002:a17:90a:9f01:b0:253:50d0:a39d with SMTP id
 n1-20020a17090a9f0100b0025350d0a39dmr5508485pjp.48.1685618252985; Thu, 01 Jun
 2023 04:17:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAOiHx==5YWhDiZP2PyHZiJrmtqRzvqCqoSO59RwuYuR85BezBg@mail.gmail.com>
 <ZHe8dKb3f392MfBO@bhelgaas>
In-Reply-To: <ZHe8dKb3f392MfBO@bhelgaas>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Thu, 1 Jun 2023 13:17:21 +0200
Message-ID: <CAOiHx=nTgtnfUqRDJR0yFP0du3Yvs73PkEUR_1eb+1gtbDBM-g@mail.gmail.com>
Subject: Re: [PATCH v8 0/7] Add pci_dev_for_each_resource() helper and update users
To: Bjorn Helgaas <helgaas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, linux-pci@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>, linux-mips@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Andrew Lunn <andrew@lunn.ch>, sparclinux@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Gregory Clement <gregory.clement@bootlin.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Russell King <linux@armlinux.org.uk>, linux-acpi@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, xen-devel@lists.xenproject.org, Matt Turner <mattst88@gmail.com>, Anatolij Gustschin <agust@denx.de>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Niklas Schnelle <schnelle@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, John Paul Adrian Glaubitz <glaubitz@
 physik.fu-berlin.de>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 31 May 2023 at 23:30, Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Wed, May 31, 2023 at 08:48:35PM +0200, Jonas Gorski wrote:
> > ...
>
> > Looking at the code I understand where coverity is coming from:
> >
> > #define __pci_dev_for_each_res0(dev, res, ...)                         \
> >        for (unsigned int __b = 0;                                      \
> >             res = pci_resource_n(dev, __b), __b < PCI_NUM_RESOURCES;   \
> >             __b++)
> >
> >  res will be assigned before __b is checked for being less than
> > PCI_NUM_RESOURCES, making it point to behind the array at the end of
> > the last loop iteration.
> >
> > Rewriting the test expression as
> >
> > __b < PCI_NUM_RESOURCES && (res = pci_resource_n(dev, __b));
> >
> > should avoid the (coverity) warning by making use of lazy evaluation.
> >
> > It probably makes the code slightly less performant as res will now be
> > checked for being not NULL (which will always be true), but I doubt it
> > will be significant (or in any hot paths).
>
> Thanks a lot for looking into this!  I think you're right, and I think
> the rewritten expression is more logical as well.  Do you want to post
> a patch for it?

Not sure when I'll come around to, so I have no strong feeling here.
So feel free to just borrow my suggestion, especially since I won't be
able to test it (don't have a kernel tree ready I can build and boot).

Also looking more closely at the Coverity output, I think it might not
handle the comma operator well in the loop condition:

>          11. incr: Incrementing __b. The value of __b may now be up to 17.
>          12. alias: Assigning: r = &pdev->resource[__b]. r may now point to as high as element 17 of pdev->resource (which consists of 17 64-byte elements).
>          13. Condition __b < PCI_NUM_RESOURCES, taking true branch.
>          14. Condition (r = &pdev->resource[__b]) , (__b < PCI_NUM_RESOURCES), taking true branch.

13 If __b is 17 ( = PCI_NUM_RESOURCES) we wouldn't taking the true
branch, but somehow Coverity thinks that we do. No idea if it is worth
reporting to Coverity.

The changed condition statement should hopefully silence the warning though.

Regards
Jonas
