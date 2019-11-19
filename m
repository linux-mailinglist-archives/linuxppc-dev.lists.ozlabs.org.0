Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9548D10129E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 05:43:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HCrX4q5fzDqdk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 15:43:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2607:f8b0:4864:20::243;
 helo=mail-oi1-x243.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="05QWaL6g"; 
 dkim-atps=neutral
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HCpb4tg4zDqc1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 15:41:54 +1100 (AEDT)
Received: by mail-oi1-x243.google.com with SMTP id d22so10726260oic.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Nov 2019 20:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m3MHq1VeKFp127FUICx04ubISK/Dg9APGUYHbc8GCeE=;
 b=05QWaL6gVTbgGCnZuO1yjSnjhWRi3w56l7hdlFSvvB8HiMDjBUO8yQ0RvJvlVo0qrc
 LDTYINUM5Yz7PgMGOy/bFHjxL6KJLqarZnNaOW355ivIXYFifzzcwVSAotpWlAb448cg
 cGiHNiToS3o3BeltrXgUR8vT8b73Tsz627J+9LPszqNyQyTUj33nxl3KHG3AHLooI3Gd
 yVTaO6OHo0EuDIIK5dpNL5RXxotYXkd8Hp4zLWlaTagZrtXbh5DsQV4EK9s/xTexTKeu
 pm4BC3RVxJ3UeExcy4v3Sr3p2qNqBENFM83bjAQnXRlcbCyQKBclbh76qG9xPSZT8Gty
 L9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m3MHq1VeKFp127FUICx04ubISK/Dg9APGUYHbc8GCeE=;
 b=pWQsDvyo9D7NqhvC5phjpyKtchMAswhhjDQ77blc+9ulAnqxAARrmR52DoeSzx6OXn
 ROk3K4S3a8q7Cu1IsR5SX+9vEbPoK1he74AfqIiphfEFogLeNf6gDZhqiBFNgiL5j7ls
 /jZplvrJv8ckh5EjW99N5Gooxx3MYkwtNQASZL1wwCGBf7ngOgZ/gfbQfjrcjw1rr480
 opGERdNXDR5xeuCgt1Q1QxqjRo/f7LdkAK0Kd5aZr/i3STwx4+oUKn6V9igZFifBjxYT
 IVnMwBj7HFmSTZ70Vz8xx92o92ljBiC2fStN8qv8SPMxfouYWWY6WcjMuynTugwyVTVc
 yQTA==
X-Gm-Message-State: APjAAAV8bQJfRm7+NUg2DNdzMYrr3ERD8GDKPUQ7CPIbSU1KqGXzNSQ1
 JX+nJIlEZPn9EEGuXTbHf/XcCHrmDOPgIa+rHyKGZQ==
X-Google-Smtp-Source: APXvYqwaHXiniUcSPs62JothmUuDkzT/zx/0SnTg3vefxzqbvzTfYsTVt7fj8ADLqJF7B6/l1DhnNw4N/Z8KxZnRhnU=
X-Received: by 2002:aca:55c1:: with SMTP id j184mr2403758oib.105.1574138509410; 
 Mon, 18 Nov 2019 20:41:49 -0800 (PST)
MIME-Version: 1.0
References: <20191025044721.16617-1-alastair@au1.ibm.com>
 <20191025044721.16617-9-alastair@au1.ibm.com>
 <8232c1a6-d52a-6c32-6178-de082174a92a@linux.ibm.com>
 <CAPcyv4g9b6PyREurH9NcQf4BO2YcRGJPBZDqGKy-Vz91mBKjew@mail.gmail.com>
 <02374c9a-39fb-5693-3d9c-aa7e7674a6c1@linux.ibm.com>
 <7fd5a4571062a06da8f09f18300794b48ead5dc1.camel@au1.ibm.com>
 <33b6f6b2-5ca1-7c08-01db-6aad73f9a0ec@linux.ibm.com>
In-Reply-To: <33b6f6b2-5ca1-7c08-01db-6aad73f9a0ec@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 18 Nov 2019 20:41:37 -0800
Message-ID: <CAPcyv4gOB3=U_0NU81qr1v8w4rd8i3AMHZuT1hs05sx287YgcA@mail.gmail.com>
Subject: Re: [PATCH 08/10] nvdimm: Add driver for OpenCAPI Storage Class Memory
To: Andrew Donnellan <ajd@linux.ibm.com>
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
Cc: Oscar Salvador <osalvador@suse.com>, Michal Hocko <mhocko@suse.com>,
 David Hildenbrand <david@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Wei Yang <richard.weiyang@gmail.com>, Keith Busch <keith.busch@intel.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Paul Mackerras <paulus@samba.org>, Ira Weiny <ira.weiny@intel.com>,
 Dave Jiang <dave.jiang@intel.com>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 Vishal Verma <vishal.l.verma@intel.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 Qian Cai <cai@lca.pw>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Alastair D'Silva <alastair@au1.ibm.com>, Linux MM <linux-mm@kvack.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 18, 2019 at 7:29 PM Andrew Donnellan <ajd@linux.ibm.com> wrote:
>
> On 19/11/19 1:48 pm, Alastair D'Silva wrote:
> > On Tue, 2019-11-19 at 10:47 +1100, Andrew Donnellan wrote:
> >> On 15/11/19 3:35 am, Dan Williams wrote:
> >>>> Have you discussed with the directory owner if it's ok to split
> >>>> the
> >>>> driver over several files?
> >>>
> >>> My thought is to establish drivers/opencapi/ and move this and the
> >>> existing drivers/misc/ocxl/ bits there.
> >>
> >> Is there any other justification for this we can think of apart from
> >> not
> >> wanting to put this driver in the nvdimm directory? OpenCAPI drivers
> >> aren't really a category of driver unto themselves.
> >>
> >
> > There is a precedent for bus-based dirs, eg. drivers/(ide|w1|spi) all
> > contain drivers for both controllers & connected devices.
> >
> > Fred, how do you feel about moving the generic OpenCAPI driver out of
> > drivers/misc?
>
> Instinctively I don't like the idea of creating a whole opencapi
> directory, as OpenCAPI is a generic bus which is not tightly coupled to
> any particular application area, and drivers for other OpenCAPI devices
> are already spread throughout the tree (e.g. cxlflash in drivers/scsi).

I'm not suggesting all opencapi drivers go there, nor the entirety of
this driver, just common infrastructure. That said, it's hard to talk
about specifics given the current state of the patch set. I have not
even taken a deeper look past the changelog as this 3K lines-of-code
submission needs to be broken up into smaller pieces before we settle
on what pieces belong where.

Just looking at the diffstat, at a minimum it's not appropriate for
them to live in drivers/nvdimm/ directly, drivers/nvdimm/oxcl/ would
be an acceptable starting point.
