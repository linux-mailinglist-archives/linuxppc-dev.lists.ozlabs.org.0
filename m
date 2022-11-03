Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 612C0618774
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 19:30:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3C432KCYz3dwn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 05:30:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.182; helo=mail-pf1-f182.google.com; envelope-from=kswilczynski@gmail.com; receiver=<UNKNOWN>)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3C3S3TMCz2ywV
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Nov 2022 05:29:55 +1100 (AEDT)
Received: by mail-pf1-f182.google.com with SMTP id q9so2412177pfg.5
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Nov 2022 11:29:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pZjEyPGh7N/ck24vh/VKMs5s50UIlOa2pgI4ml3dqpA=;
        b=Ob2xtbX+xDiyo4vxdfdrbFefGQA7GLKTDuHHQgXPhIMzhCIs7xjW/VDEtvgZs+32OU
         NOQoKr2SXQZ25t/8vPa9uFzyRgbFg5Sjvl9hyVLKywivY8GLI1vFzTDW7hcAAIMpG0YV
         zH01dhw6sv/3Re5dbMbE4YFOSQ50hSw8Ho4qlZgHKte881EKHUh321MvsWT5Zo/n0yaa
         K4RT67h4xl5zZ1XXUTnDCLsh+kAKGFBy7S4Pr6hXc7/77FCm0net0vum2TmMDZKfCpCJ
         h18NRpEcDjz44VnnuAPzyB98JYH9rvVGm6ndxgxxN9ICD1aQMMQCpEywgtZS+tsOFlmX
         7GUg==
X-Gm-Message-State: ACrzQf2JUX2A8b0yqazeVve+ydj0A96ej9bs3619A4ajPtIWgtN8xYir
	/UCBgUnrn1hHgQsBLJ087nc=
X-Google-Smtp-Source: AMsMyM4MMb94EAGz1kO2Q0DRDyjidkdmznJiyzQZ8JfQK1Y1FbZfy+aOFpE2yYDeDmYpBxRHuxCHKQ==
X-Received: by 2002:aa7:8c15:0:b0:56b:ead2:3950 with SMTP id c21-20020aa78c15000000b0056bead23950mr32086578pfd.77.1667500192405;
        Thu, 03 Nov 2022 11:29:52 -0700 (PDT)
Received: from rocinante (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id o14-20020a170902d4ce00b0018157b415dbsm1034089plg.63.2022.11.03.11.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 11:29:51 -0700 (PDT)
Date: Fri, 4 Nov 2022 03:29:44 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 4/4] pcmcia: Convert to use
 pci_bus_for_each_resource_p()
Message-ID: <Y2QImB0OLakzz1+F@rocinante>
References: <20221103164644.70554-1-andriy.shevchenko@linux.intel.com>
 <20221103164644.70554-5-andriy.shevchenko@linux.intel.com>
 <Y2P0XCNJvTVuziO7@owl.dominikbrodowski.net>
 <Y2P2ja26ikNecTsv@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y2P2ja26ikNecTsv@smile.fi.intel.com>
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
Cc: linux-pci@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>, linux-mips@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, sparclinux@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Russell King <linux@armlinux.org.uk>, Bjorn Helgaas <helgaas@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, xen-devel@lists.xenproject.org, Matt Turner <mattst88@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-kernel@vger.kernel.org, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@
 davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

[...]
> > > -
> > > -	for (i = 0; i < PCI_BRIDGE_RESOURCE_NUM; i++) {
> > > -		res = s->cb_dev->bus->resource[i];
> > > -#else
> > > -	pci_bus_for_each_resource(s->cb_dev->bus, res, i) {
> > >  #endif
> > > +
> > > +	pci_bus_for_each_resource_p(s->cb_dev->bus, res) {
> > >  		if (!res)
> > >  			continue;
> > 
> > Doesn't this remove the proper iterator for X86? Even if that is the right
> > thing to do, it needs an explict explanation.
> 
> I dunno what was in 2010, but reading code now I have found no differences in
> the logic on how resources are being iterated in these two pieces of code.

This code is over a decade old (13 years old to be precise) and there was
something odd between Bjorn's and Jesse's patches, as per:

  89a74ecccd1f ("PCI: add pci_bus_for_each_resource(), remove direct bus->resource[] refs")
  cf26e8dc4194 ("pcmcia: do not autoadd root PCI bus resources")

> But fine, I will add a line to a commit message about this change.

I wouldn't, personally.  The change you are proposing is self-explanatory
and somewhat in-line with what is there already - unless I am also reading
the current implementation wrong.

That said, Dominik is the maintainer of PCMCIA driver, so his is the last
word, so to speak. :)

> Considering this is done, can you issue your conditional tag so I will
> incorporate it in v3?

No need, really.  Again, unless Dominik thinks otherwise.

	Krzysztof
