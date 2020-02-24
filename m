Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D7767169ED3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 07:53:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Qt7R0lpCzDqW9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 17:53:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::142;
 helo=mail-il1-x142.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=r+VFg7nl; dkim-atps=neutral
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Qt5f3KnQzDqSs
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2020 17:51:48 +1100 (AEDT)
Received: by mail-il1-x142.google.com with SMTP id s85so6804900ill.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Feb 2020 22:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t9K0w7u9UlRucKDFse4Bnnz0TkvNHleyC4BCsa1RzrM=;
 b=r+VFg7nlYKjyz4ZE6FQLUysVX5WdvVgRm6WOY41svQjomwf0VXKN3PmH633+9Q2lI7
 rsia25DTZrqeYZUzqIELM0ZPs9xk9RrR1zjvbYreOc8hFnT5pfTuk8+8G3Z3+v2ZKC0g
 3+Uda6+pEZA47fwhjkuOGRiku+Z0p1HVHFqY54Xx1Th+9vhrJ/qnxiXHBlAOCapn0INg
 RIE2UbkfnEyHpOODwAIrese+8kda1BNJDaAH9nXkUn/5vKE97Jm60mZbshpHsb7scDjj
 jyhU99uHJmzK+BJhulAarPgiDvpWVdszTMddDibKFZjPLLrV/FmHpUdCY0G0wQkUeVCh
 oz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t9K0w7u9UlRucKDFse4Bnnz0TkvNHleyC4BCsa1RzrM=;
 b=QyzzGxErrzgBJgQhqJSppFnw65DXdmMQKN9D1/bZOLjybXvWbJXRr2O/Gsk1DixyNL
 JCUXHGBIYIysFcZ4VORWEp82DUEOs7FrD5/LtE68sQy10KHOvc0HgEskPj0Q1ViTZp2i
 72XbNorEPWwMj5Ffq2PY2ITGt7ToTc43Cahlj7lnFV+2hb2Dg2/J21OCxR1il7mXzhbV
 D5tYRSJfQIieaCtysmJAWIbeVNb5+IfMIUMyfWpQdAXunD2jkzV7FfxAdyIzQB1jLAz6
 9OWBIHJKjGCCOOjaNg7ub0MN/9U2gyTnGcuomvh/evh1/D1fCVk3S2MOMhg6odBz+73b
 Hhow==
X-Gm-Message-State: APjAAAU5jVDGqelwfvO/BJoY7idrRsjk7uJjyx3y6C7NX+nKWnIVp2Z0
 Lmg+LWcDZgtH8nCM5LeAm7wO4cmhZ6vEOd1OWjs=
X-Google-Smtp-Source: APXvYqx+mUK6hh9BaSPGa0Msc1oHfQvPgztYvcYPrv+S9n6RraKbcSZyrnA+OcHji1IbgLT+tKjr35qmWcvjk1TYbOw=
X-Received: by 2002:a92:d7c1:: with SMTP id g1mr59552764ilq.192.1582527104859; 
 Sun, 23 Feb 2020 22:51:44 -0800 (PST)
MIME-Version: 1.0
References: <20200221032720.33893-1-alastair@au1.ibm.com>
 <CAPcyv4j2hut1YDrotC=QkcM+S0SZwpd9_4hD2aChn+cKD+62oA@mail.gmail.com>
 <240fbefc6275ac0a6f2aa68715b3b73b0e7a8310.camel@au1.ibm.com>
 <20200224043750.GM24185@bombadil.infradead.org>
 <83034494d5c3da1fa63b172e844f85d0fec7910a.camel@au1.ibm.com>
In-Reply-To: <83034494d5c3da1fa63b172e844f85d0fec7910a.camel@au1.ibm.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Mon, 24 Feb 2020 17:51:33 +1100
Message-ID: <CAOSf1CHYEJf02EV0kYMk+D9s=4PiTXSM1eFcRGYe7XJrHvtAtA@mail.gmail.com>
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
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Matthew Wilcox <willy@infradead.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Dan Williams <dan.j.williams@intel.com>, Hari Bathini <hbathini@linux.ibm.com>,
 Linux MM <linux-mm@kvack.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vishal Verma <vishal.l.verma@intel.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 24, 2020 at 3:43 PM Alastair D'Silva <alastair@au1.ibm.com> wrote:
>
> On Sun, 2020-02-23 at 20:37 -0800, Matthew Wilcox wrote:
> > On Mon, Feb 24, 2020 at 03:34:07PM +1100, Alastair D'Silva wrote:
> > > V3:
> > >   - Rebase against next/next-20200220
> > >   - Move driver to arch/powerpc/platforms/powernv, we now expect
> > > this
> > >     driver to go upstream via the powerpc tree
> >
> > That's rather the opposite direction of normal; mostly drivers live
> > under
> > drivers/ and not in arch/.  It's easier for drivers to get overlooked
> > when doing tree-wide changes if they're hiding.
>
> This is true, however, given that it was not all that desirable to have
> it under drivers/nvdimm, it's sister driver (for the same hardware) is
> also under arch, and that we don't expect this driver to be used on any
> platform other than powernv, we think this was the most reasonable
> place to put it.

Historically powernv specific platform drivers go in their respective
subsystem trees rather than in arch/ and I'd prefer we kept it that
way. When I added the papr_scm driver I put it in the pseries platform
directory because most of the pseries paravirt code lives there for
some reason; I don't know why. Luckily for me that followed the same
model that Dan used when he put the NFIT driver in drivers/acpi/ and
the libnvdimm core in drivers/nvdimm/ so we didn't have anything to
argue about. However, as Matthew pointed out, it is at odds with how
most subsystems operate. Is there any particular reason we're doing
things this way or should we think about moving libnvdimm users to
drivers/nvdimm/?

Oliver
