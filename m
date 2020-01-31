Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B46E514E82A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2020 06:16:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48856Z3zqBzDqdm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2020 16:16:22 +1100 (AEDT)
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
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=YB4BUNeP; dkim-atps=neutral
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48854v09lGzDqcq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2020 16:14:48 +1100 (AEDT)
Received: by mail-oi1-x243.google.com with SMTP id c16so6134695oic.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jan 2020 21:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PMcuS4LHry0i7DZ7ldtekzqzj8KrQxFLARw5rUFC3dY=;
 b=YB4BUNePIM6enPmASfYT3cwjHuMA+cOwjd5AU1JFMP5dn8Yq9YXqx0L53gjl6Gyzkl
 5kG1BNLepiYkWJbao814Aj5KzNKw/SxFciSCG9pAPQ1Vl31Lb+FRijSu2RlvWwqxmz1V
 t5OFCVsaMUxgTHH27jx3c7DfQTOYiNeCNZHhh4U1dkxfAuDoeJ0RoCD5pWybXaXBKCgR
 5lg6a4vN6IMCyAVqu8i3QQhIjzPPi0qOUgutCMcqCoyTr/+f3QgmReQ1QgRvUUQDoQAM
 nEeQT5nqUOxl1z7kuLI9kthwhBXP3Zyf9wOXQ/9C1+PkspbY4Qep23XKZEohNh4rbaAF
 79HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PMcuS4LHry0i7DZ7ldtekzqzj8KrQxFLARw5rUFC3dY=;
 b=n7m/caC5M8bPdiBd1SymCKsTOfjAq8mmRhVf6BQU+aKfENV7DZiALs7XTVdpl6Ecws
 XZNq7zOdqpZXnkmJBXcAsrp+Bnbde/ua7W10XtubFZzMaB+dZnkx/uvUkxFUzRAFdv7o
 JCKfqXcERXDBSmRozvarNLopdl/nnXDrZS8BkDw9uVRQ4p47ICBVfGRmI3n+VRu5WklN
 Zz5NVAKRQkuw1crP3654zjQuJxchAGq1lzJkPJp7QLRwKWR4Zs1ljFT2NGyDMdAmOK7U
 +4S6APH0JiQCD39yssE9aGXqa6yKKQsXlzOZrF525cAqtkK0039i4K9rNmLFgj4Yiu9U
 ev9A==
X-Gm-Message-State: APjAAAVoVr+o8LR+NF1351Fd/F3Te4c9XTsN9UUbD5jMltebAvcdx32y
 Ptz+LDjDiwVzQoqYuImQz59IqVRL6/6/2s0aF6irwg==
X-Google-Smtp-Source: APXvYqxj9SjLEO7AhYfAHVo9xLBu9Nup8mW6BzzYMbNeUvMlioFhNe3oNXeD4an0sNTe/yFKjrfStHsB04BMKeaIBuc=
X-Received: by 2002:a05:6808:a83:: with SMTP id q3mr5446118oij.0.1580447684795; 
 Thu, 30 Jan 2020 21:14:44 -0800 (PST)
MIME-Version: 1.0
References: <20191025044721.16617-1-alastair@au1.ibm.com>
 <20191025044721.16617-10-alastair@au1.ibm.com>
 <3ba57ce6-9135-0d83-b99d-1c5b0c744855@linux.ibm.com>
 <df24e47c2bd9472c7be06c6c266b2a250c30068f.camel@au1.ibm.com>
In-Reply-To: <df24e47c2bd9472c7be06c6c266b2a250c30068f.camel@au1.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 30 Jan 2020 21:14:33 -0800
Message-ID: <CAPcyv4iwiMS6VZLvJad-Z9Psu9LRwfhqO643EzVRsk89qy6dwA@mail.gmail.com>
Subject: Re: [PATCH 09/10] powerpc: Enable OpenCAPI Storage Class Memory
 driver on bare metal
To: "Alastair D'Silva" <alastair@au1.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Oscar Salvador <osalvador@suse.com>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 David Hildenbrand <david@redhat.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Wei Yang <richard.weiyang@gmail.com>, Keith Busch <keith.busch@intel.com>,
 Linux MM <linux-mm@kvack.org>, Michal Hocko <mhocko@suse.com>,
 Paul Mackerras <paulus@samba.org>, Ira Weiny <ira.weiny@intel.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Dave Jiang <dave.jiang@intel.com>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 Vishal Verma <vishal.l.verma@intel.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Qian Cai <cai@lca.pw>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vasant Hegde <hegdevasant@linux.vnet.ibm.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 30, 2020 at 8:57 PM Alastair D'Silva <alastair@au1.ibm.com> wro=
te:
>
> On Fri, 2019-11-08 at 08:10 +0100, Frederic Barrat wrote:
> >
> > Le 25/10/2019 =C3=A0 06:47, Alastair D'Silva a =C3=A9crit :
> > > From: Alastair D'Silva <alastair@d-silva.org>
> > >
> > > Enable OpenCAPI Storage Class Memory driver on bare metal
> > >
> > > Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> > > ---
> > >   arch/powerpc/configs/powernv_defconfig | 4 ++++
> > >   1 file changed, 4 insertions(+)
> > >
> > > diff --git a/arch/powerpc/configs/powernv_defconfig
> > > b/arch/powerpc/configs/powernv_defconfig
> > > index 6658cceb928c..45c0eff94964 100644
> > > --- a/arch/powerpc/configs/powernv_defconfig
> > > +++ b/arch/powerpc/configs/powernv_defconfig
> > > @@ -352,3 +352,7 @@ CONFIG_KVM_BOOK3S_64=3Dm
> > >   CONFIG_KVM_BOOK3S_64_HV=3Dm
> > >   CONFIG_VHOST_NET=3Dm
> > >   CONFIG_PRINTK_TIME=3Dy
> > > +CONFIG_OCXL_SCM=3Dm
> > > +CONFIG_DEV_DAX=3Dy
> > > +CONFIG_DEV_DAX_PMEM=3Dy

This specific line is not needed since DEV_DAX_PMEM already defaults to DEV=
_DAX.

> > > +CONFIG_FS_DAX=3Dy
> >
> > If this really the intent or do we want to activate DAX only if
> > CONFIG_OCXL_SCM is enabled?
> >
> >    Fred
>
> We had a bit of a play around with reworking this the other day.
>
> Putting them in as depends didn't make sense, as they are "soft"
> dependancies - the driver works and you can do some things without DAX.
>
> Adding them as selects was rejected as selecting symbols that can also
> be manually select is discouraged.
>
> We ended up going full circle and adding them back to the defconfig.

This dovetails with a suggestion Dave made a while back [1]. Given all
the pieces that need to be turned on to have a "feature complete"
persistent memory enabled build it would be nice to have general
config symbols that go and select all the necessary dependencies for
DAX, and let the rest happen by default.

[1]: https://lore.kernel.org/lkml/20161129021052.GF28177@dastard/
