Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C676816F461
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 01:34:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RxdG6PrSzDqNT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 11:34:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::342;
 helo=mail-ot1-x342.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=1rFC1q7e; dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RxbM3yHPzDqLV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 11:32:45 +1100 (AEDT)
Received: by mail-ot1-x342.google.com with SMTP id b3so1350246otp.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 16:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f70455Z6ta/EJCB61dHVpdnNh4osTmAbssLK2ZDouI8=;
 b=1rFC1q7eiqEoo/Ct8CLTc8uB6k3LoZ19oRJxA++l0zQgLc/UuThtXzQMgIWfj0sABp
 Tu/rBPamdN1eVJvSLzs32HeQA4BVe2YUCQ1Tn2metD9qEWM0OzwmfiMBaESZbeWmVueY
 31XvzUzGzkYQ+M5LGVFUZzc+9QGaHPlVPsaxO62G1PTIwMacG1h2AXJ7RsfUhr9pAPYS
 pAFjp6krJgYzuaxPTz+vUaSvelbdMaNAu5U4sM+5GFJ8T583/KnVxZ7l59pGq8Zx1N55
 /0KS/3htbv5/xl4ByvCEOahacZfCCi1uloIgUD+0kK2IgnIpjShkvcodpT/EheCpFi3J
 eEMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f70455Z6ta/EJCB61dHVpdnNh4osTmAbssLK2ZDouI8=;
 b=Lef82tUUnUci0jdxRHDamp7wP1NKwTQ19HX01617jm285IV5mI7A7KGQmYsFIojxzt
 HJodwbcxu3eNiHYeltUfsnSAzoRoESUJXMTZcg7TasbTA7GZJBccNgce/S425gtXyJO3
 5l+hKokvVn00kMVUAiOhnfSkd3WtawwEFHUTzJP0erfdOoKA6FTTeW0gdR7Dj9/MDHNX
 OwzltEvJzAWFiWjejwd7/blOULm7kIV3ZPVYXowDGlShBgK2bPv8aCMvnl5NS3cQ5lkD
 aLD61UreN7n0tQWCRTyIaOT6fv2OsZOMs7YX2oDVbSMt8O5EZSv7IIJMZfzTh4okLjGg
 Ig6Q==
X-Gm-Message-State: APjAAAXYVUzLpToCM1BpSS+ATBnZJ4/w8oYPbmGI7YBqsFnTTeaSYDo3
 vMhEuh00fpZc22lof4L+MQk2JnY91GMEmnlFldkMHQ==
X-Google-Smtp-Source: APXvYqyAsJnZlWJOpclJB6h8LyKxIkm6H51Qk8MIk/UhPC9KtK1RQif8usKO+skdYm0o9lQhxq1Hc5Wd2TvdmbQAZxU=
X-Received: by 2002:a9d:64d8:: with SMTP id n24mr886741otl.71.1582677162325;
 Tue, 25 Feb 2020 16:32:42 -0800 (PST)
MIME-Version: 1.0
References: <20200221032720.33893-1-alastair@au1.ibm.com>
 <CAPcyv4j2hut1YDrotC=QkcM+S0SZwpd9_4hD2aChn+cKD+62oA@mail.gmail.com>
 <240fbefc6275ac0a6f2aa68715b3b73b0e7a8310.camel@au1.ibm.com>
 <20200224043750.GM24185@bombadil.infradead.org>
 <83034494d5c3da1fa63b172e844f85d0fec7910a.camel@au1.ibm.com>
 <CAOSf1CHYEJf02EV0kYMk+D9s=4PiTXSM1eFcRGYe7XJrHvtAtA@mail.gmail.com>
 <b981f4e6cc308a617e7944e3ce23009e804cfdbf.camel@au1.ibm.com>
In-Reply-To: <b981f4e6cc308a617e7944e3ce23009e804cfdbf.camel@au1.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 25 Feb 2020 16:32:31 -0800
Message-ID: <CAPcyv4g_762vho=L21BuO=97zr9Cq14np88bnFieiYN25BvJtA@mail.gmail.com>
Subject: Re: [PATCH v3 00/27] Add support for OpenCAPI Persistent Memory
 devices
To: "Alastair D'Silva" <alastair@au1.ibm.com>
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Paul Mackerras <paulus@samba.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Rob Herring <robh@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Matthew Wilcox <willy@infradead.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>,
 Linux MM <linux-mm@kvack.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vishal Verma <vishal.l.verma@intel.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 25, 2020 at 4:14 PM Alastair D'Silva <alastair@au1.ibm.com> wrote:
>
> On Mon, 2020-02-24 at 17:51 +1100, Oliver O'Halloran wrote:
> > On Mon, Feb 24, 2020 at 3:43 PM Alastair D'Silva <
> > alastair@au1.ibm.com> wrote:
> > > On Sun, 2020-02-23 at 20:37 -0800, Matthew Wilcox wrote:
> > > > On Mon, Feb 24, 2020 at 03:34:07PM +1100, Alastair D'Silva wrote:
> > > > > V3:
> > > > >   - Rebase against next/next-20200220
> > > > >   - Move driver to arch/powerpc/platforms/powernv, we now
> > > > > expect
> > > > > this
> > > > >     driver to go upstream via the powerpc tree
> > > >
> > > > That's rather the opposite direction of normal; mostly drivers
> > > > live
> > > > under
> > > > drivers/ and not in arch/.  It's easier for drivers to get
> > > > overlooked
> > > > when doing tree-wide changes if they're hiding.
> > >
> > > This is true, however, given that it was not all that desirable to
> > > have
> > > it under drivers/nvdimm, it's sister driver (for the same hardware)
> > > is
> > > also under arch, and that we don't expect this driver to be used on
> > > any
> > > platform other than powernv, we think this was the most reasonable
> > > place to put it.
> >
> > Historically powernv specific platform drivers go in their respective
> > subsystem trees rather than in arch/ and I'd prefer we kept it that
> > way. When I added the papr_scm driver I put it in the pseries
> > platform
> > directory because most of the pseries paravirt code lives there for
> > some reason; I don't know why. Luckily for me that followed the same
> > model that Dan used when he put the NFIT driver in drivers/acpi/ and
> > the libnvdimm core in drivers/nvdimm/ so we didn't have anything to
> > argue about. However, as Matthew pointed out, it is at odds with how
> > most subsystems operate. Is there any particular reason we're doing
> > things this way or should we think about moving libnvdimm users to
> > drivers/nvdimm/?
> >
> > Oliver
>
>
> I'm not too fussed where it ends up, as long as it ends up somewhere :)
>
> From what I can tell, the issue is that we have both "infrastructure"
> drivers, and end-device drivers. To me, it feels like drivers/nvdimm
> should contain both, and I think this feels like the right approach.
>
> I could move it back to drivers/nvdimm/ocxl, but I felt that it was
> only tolerated there, not desired. This could be cleared up with a
> response from Dan Williams, and if it is indeed dersired, this is my
> preferred location.

Apologies if I gave the impression it was only tolerated. I'm ok with
drivers/nvdimm/ocxl/, and to the larger point I'd also be ok with a
drivers/{acpi => nvdimm}/nfit and {arch/powerpc/platforms/pseries =>
drivers/nvdimm}/papr_scm.c move as well to keep all the consumers of
the nvdimm related code together with the core.
