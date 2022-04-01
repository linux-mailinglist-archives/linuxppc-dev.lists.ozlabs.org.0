Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0874EE918
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Apr 2022 09:28:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KVBbR71Yrz3c5Q
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Apr 2022 18:28:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KOJwv85m;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:e::133;
 helo=bombadil.infradead.org;
 envelope-from=batv+d0e8833360852bfe4ee8+6795+infradead.org+hch@bombadil.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=KOJwv85m; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KV7Xr4cqMz2xfN
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Apr 2022 16:10:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=a4BwqPk85GvPQxl/KizQiBDKTaZ08byn7qa3hx7iA34=; b=KOJwv85m6nI+qdKCQfs1p86OPU
 5FGO4RDDxrv9sy1p8lvRJtiwijAhVpxSL9BTzhqne/tfnoBq8NaP95VeLGBWolHJ2TZ+QLu6F8EuE
 Tv4t4+0Itm7WEWNWgDlfdspUCl2Nw3fCn+g8Z7UlFJA1WKtzwrlvYtVuYWfH1f+Elg64l1KozGGQ8
 WO4Dvih0mV6eDMlTyivd5mgpV8JUBTG1dmaTxa1tFf9P1JkD+H1HarQnX1QmjVAsYaZhj8ATcv52h
 HWAJTu2xVXIX9YnJF4PtWohwzxMMxkxqDCv3alWVtz4d3Tg6SBxTnHgtc5GbvN7VoRpsFvVtmG/+V
 VxO044TA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1na9XO-004Vvf-RF; Fri, 01 Apr 2022 05:09:30 +0000
Date: Thu, 31 Mar 2022 22:09:30 -0700
From: Christoph Hellwig <hch@infradead.org>
To: "Moore, Robert" <robert.moore@intel.com>
Subject: Re: [PATCH 05/22] acpica: Replace comments with C99 initializers
Message-ID: <YkaJCjhyrRfAb3by@infradead.org>
References: <20220326165909.506926-1-benni@stuerz.xyz>
 <20220326165909.506926-5-benni@stuerz.xyz>
 <CAHp75VeTXMAueQc_c0Ryj5+a8PrJ7gk-arugiNnxtAm03x7XTg@mail.gmail.com>
 <BYAPR11MB3256D71C02271CD434959E0187E19@BYAPR11MB3256.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR11MB3256D71C02271CD434959E0187E19@BYAPR11MB3256.namprd11.prod.outlook.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Approved-At: Fri, 01 Apr 2022 18:27:09 +1100
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
Cc: Andrew Lunn <andrew@lunn.ch>,
 "open list:ACPI COMPONENT ARCHITECTURE \(ACPICA\)" <devel@acpica.org>,
 "linux-atm-general@lists.sourceforge.net"
 <linux-atm-general@lists.sourceforge.net>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "wcn36xx@lists.infradead.org" <wcn36xx@lists.infradead.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Benjamin =?iso-8859-1?Q?St=FCrz?= <benni@stuerz.xyz>,
 Jason Gunthorpe <jgg@ziepe.ca>, Ping-Ke Shih <pkshih@realtek.com>,
 Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
 "dennis.dalessandro@cornelisnetworks.com"
 <dennis.dalessandro@cornelisnetworks.com>,
 "open list:HFI1 DRIVER" <linux-rdma@vger.kernel.org>,
 Gregory Clement <gregory.clement@bootlin.com>, "Wysocki,
 Rafael J" <rafael.j.wysocki@intel.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Harald Welte <laforge@gnumonks.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Ingo Molnar <mingo@redhat.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 "3chas3@gmail.com" <3chas3@gmail.com>,
 linux-input <linux-input@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Len Brown <lenb@kernel.org>,
 "mike.marciniszyn@cornelisnetworks.com"
 <mike.marciniszyn@cornelisnetworks.com>, Robert Richter <rric@kernel.org>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Kalle Valo <kvalo@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "Luck,
 Tony" <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "linux@simtec.co.uk" <linux@simtec.co.uk>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
 Karsten Keil <isdn@linux-pingi.de>, Loic Poulain <loic.poulain@linaro.org>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
 Nicolas Pitre <nico@fluxnic.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 James Morse <james.morse@arm.com>, netdev <netdev@vger.kernel.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "open list:LINUX FOR POWERPC PA SEMI PWRFICIENT"
 <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Please fix your mailer.  This mail is completely unreadable.
