Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7975C34F4F5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 01:18:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F953S3J9tz3c6B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 10:18:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=bXWTzX36;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cisco.com (client-ip=173.37.86.76; helo=rcdn-iport-5.cisco.com;
 envelope-from=danielwa@cisco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256
 header.s=iport header.b=bXWTzX36; dkim-atps=neutral
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F953150kKz30QX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 10:18:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=2382; q=dns/txt; s=iport;
 t=1617146285; x=1618355885;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NpSwJ7/ClV0xFgdKaewj2fSc7O+l5AnknwUQGTToK+Y=;
 b=bXWTzX36xf1xWz+/CgSU1MODb7wl85cLiXxFH9hoSD0FFabnveDKgfy6
 JIl0YrxdJM4xvjy9dW3MtZlb1SErblrbYI3XLCkh91svwcys+CnV3+qQJ
 zKUZbLUJ8+4RirKQOXoKq3BJ4laZkP4GLYK50DU483hKNlX5KPsUEOJN5 0=;
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AEC8CkK39bx9e2WH6V837awqjBelyeYIsi2?=
 =?us-ascii?q?QD101hICF9WMbwra+Ttd4c0gL5jytUdXE7gNabOLSBR3S0z+8R3aA6O7C+UA?=
 =?us-ascii?q?76/Fa5NY0K1/qB/xTMEzDzn9Q26Y5OaK57YeecMXFbioLA7BC8A5IcxrC8gc?=
 =?us-ascii?q?SVrMP/61socg1wcaFn6G5Ce2WmO2l7XhNPC5Z8NLf03Kt6jgGtc3gWcci3b0?=
 =?us-ascii?q?NtN4P+jubGm578bRkNCwRP0mmzpAm14733GQXw5Hkjeg5IqI1PzUH11yTk+6?=
 =?us-ascii?q?PmiP2g0xnazWOW1YhOgcDs0MErPr3qtuElbhPxlw2veINtH5qFsTxdmpDX1H?=
 =?us-ascii?q?8a1P/RvhwnI8N/r0n0Q1jwix7s1w78uQxejUPf9Q=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BTAAAHsWNg/5tdJa1aHAEBAQEBAQc?=
 =?us-ascii?q?BARIBAQQEAQFAgTwHAQELAYIqgUwBOTGMZYkrA5AIFopFgXwLAQEBDQEBNAQ?=
 =?us-ascii?q?BAYRQAoF6AiU0CQ4CAwEBDAEBBQEBAQIBBgRxhW6GRQEFOj8QCxguPBsGE4V?=
 =?us-ascii?q?4qxR1gTSJDIFEFA6BFwGNSSYcgUlChC4+iAuCKwSCQAcxXYIoEjcCk2kBiky?=
 =?us-ascii?q?cIoMRgSOVGoYcMRCDdaBNuBICBAYFAhaBVDqBWTMaCBsVgyRQGQ2OKxaORiE?=
 =?us-ascii?q?DLzgCBgoBAQMJjDQsghkBAQ?=
X-IronPort-AV: E=Sophos;i="5.81,291,1610409600"; d="scan'208";a="609596927"
Received: from rcdn-core-4.cisco.com ([173.37.93.155])
 by rcdn-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 30 Mar 2021 23:17:55 +0000
Received: from zorba ([10.24.9.230])
 by rcdn-core-4.cisco.com (8.15.2/8.15.2) with ESMTPS id 12UNHrtN009883
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 30 Mar 2021 23:17:54 GMT
Date: Tue, 30 Mar 2021 16:17:53 -0700
From: Daniel Walker <danielwa@cisco.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/8] CMDLINE: drivers: of: ifdef out cmdline section
Message-ID: <20210330231717.GA2469518@zorba>
References: <41021d66db2ab427c14255d2a24bb4517c8b58fd.1617126961.git.danielwa@cisco.com>
 <0c4b839f023f87c451c8aa3c4f7a8d92729c2f02.1617126961.git.danielwa@cisco.com>
 <CAL_Jsq+_gF9Cy7H6ic2q8dxnPf4+FsBa5pFYYRydJsEmDhnNhA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+_gF9Cy7H6ic2q8dxnPf4+FsBa5pFYYRydJsEmDhnNhA@mail.gmail.com>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.9.230, [10.24.9.230]
X-Outbound-Node: rcdn-core-4.cisco.com
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

On Tue, Mar 30, 2021 at 02:49:13PM -0500, Rob Herring wrote:
> On Tue, Mar 30, 2021 at 12:57 PM Daniel Walker <danielwa@cisco.com> wrote:
> >
> > It looks like there's some seepage of cmdline stuff into
> > the generic device tree code. This conflicts with the
> > generic cmdline implementation so I remove it in the case
> > when that's enabled.
> >
> > Cc: xe-linux-external@cisco.com
> > Signed-off-by: Ruslan Ruslichenko <rruslich@cisco.com>
> > Signed-off-by: Daniel Walker <danielwa@cisco.com>
> > ---
> >  drivers/of/fdt.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> > index dcc1dd96911a..d8805cd9717a 100644
> > --- a/drivers/of/fdt.c
> > +++ b/drivers/of/fdt.c
> > @@ -25,6 +25,7 @@
> >  #include <linux/serial_core.h>
> >  #include <linux/sysfs.h>
> >  #include <linux/random.h>
> > +#include <linux/cmdline.h>
> >
> >  #include <asm/setup.h>  /* for COMMAND_LINE_SIZE */
> >  #include <asm/page.h>
> > @@ -1050,6 +1051,18 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
> >
> >         /* Retrieve command line */
> >         p = of_get_flat_dt_prop(node, "bootargs", &l);
> > +
> > +#if defined(CONFIG_GENERIC_CMDLINE) && defined(CONFIG_GENERIC_CMDLINE_OF)
> 
> Moving in the wrong direction... This code already has too many
> #ifdef's. I like Christophe's version as it gets rid of all the code
> here.
 
It's temporary .. Notice CONFIG_GENERIC_CMDLINE_OF is only used on PowerPC. I
experienced doubling on arm64 when this was used (i.e. the append and prepend
was added twice).

I don't think there are any other users which can't be moved outside the device
tree code, but powerpc uses this function three times during boot up plus the
prom_init user. It's possible to use the generic command line in all four places,
but it become space inefficient.

So the plan would be make the other architectures call the generic cmdline
directly without this code, then powerpc would need to be reworked to call the
generic commandline in it's own code hopefully just once.

The end results would be this section would reduce down to one string copy and
no command line stuff.

Maybe you would rather I just use the generic command line in those three place
and reduce this at the space code of powerpc ?

Daniel
