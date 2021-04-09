Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C284435916E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 03:27:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGgV659cFz3btK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 11:27:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=DKeaA4F6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cisco.com (client-ip=173.37.86.80; helo=rcdn-iport-9.cisco.com;
 envelope-from=danielwa@cisco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256
 header.s=iport header.b=DKeaA4F6; dkim-atps=neutral
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGgTh1xBmz301k
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 11:27:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=3696; q=dns/txt; s=iport;
 t=1617931624; x=1619141224;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zMAEQSGGxAXPhVbwdo8g6BKr75SG96pClPfZ618q3KM=;
 b=DKeaA4F63TAfN68dX2VvdfuHSU4L1tiXwxIS10xb1phQag8SVt9hUU03
 seMWFx3wth3C8SjB+xxUHjSy1s25d9t1U769rBYzKdbiBCbY/GXAfjHYr
 D3+orHV46jtaNBc4X7/UOPmh+BedwvEqvOkg9f/Atqlu26tnt+3p/512F 0=;
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AzTkORKl6L0U17Sf68XftOckLpnPpDfN3im?=
 =?us-ascii?q?dD5ilNYBxZY6Wkvuql9c516TbfjjENVHY83f2BIrCHW3PA9ZhziLNhWIuKdg?=
 =?us-ascii?q?/gpWeuMcVe/ZLvqgeQeRHW2+ZB2c5bGZRWJ8b3CTFB4PrSwA79KNo4xcnCza?=
 =?us-ascii?q?bAv5a7815IbSVHL55t9B14DAHzKDwUeCBjCYAiHJSRouprzgDARV0tYs62Bm?=
 =?us-ascii?q?YIUoH4zrWhqLvcbRELHBIh4gWV5AnJ1JfBDxOa0h0COgkg/Z4e9wH+/zDR1+?=
 =?us-ascii?q?GKr+y8jiTRzXbU6I5b3OH808JZCNaX4/JlTQnEu0KPeJlrXaGEsXQTpuyigW?=
 =?us-ascii?q?xa6eXkklMHI9l57W/XcyWOhSbVnyPk0Doo9hbZuDmlvUc=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AEAABOrG9g/4ENJK1aGQEBAQEBAQE?=
 =?us-ascii?q?BAQEBAQEBAQEBARIBAQEBAQEBAQEBAQFAgT4EAQEBAQELAYIqgU0BOTGMZok?=
 =?us-ascii?q?xA5ANilyBfAsBAQENAQE0BAEBhFACgXcCJTQJDgIDAQEMAQEFAQEBAgEGBHE?=
 =?us-ascii?q?ThV2GRQEFHhw/EAsSBi48DQ4GE4V5qjx1gTSBAYgUgUQUDoEXAY1MJxyBSUK?=
 =?us-ascii?q?ENT6KOQSCQAeBDoIoEjcCk3MBilucKYMVgSaVJYYiMhCDeqBnuD4CBAYFAha?=
 =?us-ascii?q?BVDqBWTMaCBsVgyRQGQ6OKxaORyEDLzgCBgoBAQMJikwsghkBAQ?=
X-IronPort-AV: E=Sophos;i="5.82,208,1613433600"; d="scan'208";a="789889986"
Received: from alln-core-9.cisco.com ([173.36.13.129])
 by rcdn-iport-9.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 09 Apr 2021 01:26:59 +0000
Received: from zorba ([10.24.9.242])
 by alln-core-9.cisco.com (8.15.2/8.15.2) with ESMTPS id 1391Qv7b032706
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 9 Apr 2021 01:26:58 GMT
Date: Thu, 8 Apr 2021 18:26:57 -0700
From: Daniel Walker <danielwa@cisco.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/8] CMDLINE: drivers: of: ifdef out cmdline section
Message-ID: <20210409012657.GH3981976@zorba>
References: <41021d66db2ab427c14255d2a24bb4517c8b58fd.1617126961.git.danielwa@cisco.com>
 <0c4b839f023f87c451c8aa3c4f7a8d92729c2f02.1617126961.git.danielwa@cisco.com>
 <CAL_Jsq+_gF9Cy7H6ic2q8dxnPf4+FsBa5pFYYRydJsEmDhnNhA@mail.gmail.com>
 <20210330231717.GA2469518@zorba>
 <20210407225915.GA147338@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210407225915.GA147338@robh.at.kernel.org>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.9.242, [10.24.9.242]
X-Outbound-Node: alln-core-9.cisco.com
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
Cc: devicetree@vger.kernel.org, Ruslan Ruslichenko <rruslich@cisco.com>,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 Frank Rowand <frowand.list@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, X86 ML <x86@kernel.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 xe-linux-external@cisco.com, Andrew Morton <akpm@linux-foundation.org>,
 Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 07, 2021 at 05:59:15PM -0500, Rob Herring wrote:
> On Tue, Mar 30, 2021 at 04:17:53PM -0700, Daniel Walker wrote:
> > On Tue, Mar 30, 2021 at 02:49:13PM -0500, Rob Herring wrote:
> > > On Tue, Mar 30, 2021 at 12:57 PM Daniel Walker <danielwa@cisco.com> wrote:
> > > >
> > > > It looks like there's some seepage of cmdline stuff into
> > > > the generic device tree code. This conflicts with the
> > > > generic cmdline implementation so I remove it in the case
> > > > when that's enabled.
> > > >
> > > > Cc: xe-linux-external@cisco.com
> > > > Signed-off-by: Ruslan Ruslichenko <rruslich@cisco.com>
> > > > Signed-off-by: Daniel Walker <danielwa@cisco.com>
> > > > ---
> > > >  drivers/of/fdt.c | 14 ++++++++++++++
> > > >  1 file changed, 14 insertions(+)
> > > >
> > > > diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> > > > index dcc1dd96911a..d8805cd9717a 100644
> > > > --- a/drivers/of/fdt.c
> > > > +++ b/drivers/of/fdt.c
> > > > @@ -25,6 +25,7 @@
> > > >  #include <linux/serial_core.h>
> > > >  #include <linux/sysfs.h>
> > > >  #include <linux/random.h>
> > > > +#include <linux/cmdline.h>
> > > >
> > > >  #include <asm/setup.h>  /* for COMMAND_LINE_SIZE */
> > > >  #include <asm/page.h>
> > > > @@ -1050,6 +1051,18 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
> > > >
> > > >         /* Retrieve command line */
> > > >         p = of_get_flat_dt_prop(node, "bootargs", &l);
> > > > +
> > > > +#if defined(CONFIG_GENERIC_CMDLINE) && defined(CONFIG_GENERIC_CMDLINE_OF)
> > > 
> > > Moving in the wrong direction... This code already has too many
> > > #ifdef's. I like Christophe's version as it gets rid of all the code
> > > here.
> >  
> > It's temporary .. Notice CONFIG_GENERIC_CMDLINE_OF is only used on PowerPC. I
> > experienced doubling on arm64 when this was used (i.e. the append and prepend
> > was added twice).
> > 
> > I don't think there are any other users which can't be moved outside the device
> > tree code, but powerpc uses this function three times during boot up plus the
> > prom_init user. It's possible to use the generic command line in all four places,
> > but it become space inefficient.
> 
> What's the 3rd use? I count kaslr code and in 
> early_init_dt_scan_chosen_ppc. Do we need to build the command line for 
> kaslr seed? Getting any build time value from the kernel is pointless.

I think I may have been mistaken. I added a dump_stack() , but there may have
been other stack traces during bootup on prior -rcX's I was testing.

I re-ran the test and I only see one user on powerpc and powerpc64,

powerpc64,

[    T0] Call Trace:
[    T0] [c000000001517d00] [c00000000077e910] dump_stack+0xc4/0x114 (unreliable)
[    T0] [c000000001517d50] [c000000001186fb4] early_init_dt_scan_chosen+0x238/0x324
[    T0] [c000000001517de0] [c000000001138b00] early_init_dt_scan_chosen_ppc+0x20/0x194
[    T0] [c000000001517e10] [c000000001186ae0] of_scan_flat_dt+0xc8/0x130
[    T0] [c000000001517e70] [c000000001139404] early_init_devtree+0xa4/0x48c
[    T0] [c000000001517f10] [c00000000113ac90] early_setup+0xc8/0x254
[    T0] [c000000001517f90] [000000000000c754] 0xc754

powerpc32,

Call Trace:
[c06bbee0] [c067e334] early_init_dt_scan_chosen+0xf8/0x1dc (unreliable)
[c06bbf10] [c0666ec4] early_init_dt_scan_chosen_ppc+0x18/0x6c
[c06bbf30] [c067e048] of_scan_flat_dt+0x98/0xf4
[c06bbf70] [c0667234] early_init_devtree+0x48/0x2d0
[c06bbfb0] [c06679cc] machine_init+0x98/0xcc
[c06bbff0] [c0000398] set_ivor+0x114/0x154

I think it would be possible to just move the generic handling entire into
architecture code.

Daniel
