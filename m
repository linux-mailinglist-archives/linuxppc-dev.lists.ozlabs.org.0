Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4E532DB53
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 21:49:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ds2z341V4z3dCg
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 07:49:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport header.b=gzARH/X8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=cisco.com (client-ip=173.37.86.78; helo=rcdn-iport-7.cisco.com;
 envelope-from=danielwa@cisco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256
 header.s=iport header.b=gzARH/X8; dkim-atps=neutral
Received: from rcdn-iport-7.cisco.com (rcdn-iport-7.cisco.com [173.37.86.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ds2yb3pfwz3cb5
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 07:48:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=cisco.com; i=@cisco.com; l=2263; q=dns/txt; s=iport;
 t=1614890919; x=1616100519;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GjLbEy4mzc1GE+5Hnhb3oU35QJXDVH6Er8mIRNVDXJg=;
 b=gzARH/X8XzGi+dqXPnprPCKcW5Hwb/6c7Sq8/oq9+SNQpyvW8A54yhtn
 4Z9JZIblgjei4+7wJVztyEefSQBYi6MzPlGgPupRYNVrIXHAVF4/c8RuD
 P8UHPwdKDtKEn/8miCU0fWkh8XEnyc7BX8dGSXjXjJWgVxGHyzgV/Qk+F w=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0DHAABGRkFg/4wNJK1iHAEBAQEBAQc?=
 =?us-ascii?q?BARIBAQQEAQFAgT4EAQELAYIqgUwBOTGWHY96Fow7CwEBAQ0BATQEAQGETQK?=
 =?us-ascii?q?BegIlNwYOAgMBAQsBAQUBAQECAQYEcYVuhkUBBTo/EAsYLjwbBhOFeK4YdIE?=
 =?us-ascii?q?0iR+BRBQOgRYBjUImHIFJQoQrPoQVhh4EgkAHgQ57gS0Sk3sBii2be4MGgR+?=
 =?us-ascii?q?acjEQo0a2cgIEBgUCFoFqJIFXMxoIGxWDJFAZDY4qF45HIAMvOAIGCgEBAwm?=
 =?us-ascii?q?JT4JEAQE?=
X-IronPort-AV: E=Sophos;i="5.81,223,1610409600"; d="scan'208";a="855671246"
Received: from alln-core-7.cisco.com ([173.36.13.140])
 by rcdn-iport-7.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
 04 Mar 2021 20:48:31 +0000
Received: from zorba ([10.24.1.42])
 by alln-core-7.cisco.com (8.15.2/8.15.2) with ESMTPS id 124KmTRL023920
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 4 Mar 2021 20:48:30 GMT
Date: Thu, 4 Mar 2021 12:48:23 -0800
From: Daniel Walker <danielwa@cisco.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/5] CMDLINE: drivers: of: ifdef out cmdline section
Message-ID: <20210304204823.GI109100@zorba>
References: <20210304044803.812204-2-danielwa@cisco.com>
 <CAL_JsqKnAMp0bkXzU-B8b8xx5fPC1R1NdOBn9Kpk=SONJL5paQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqKnAMp0bkXzU-B8b8xx5fPC1R1NdOBn9Kpk=SONJL5paQ@mail.gmail.com>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.24.1.42, [10.24.1.42]
X-Outbound-Node: alln-core-7.cisco.com
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

On Thu, Mar 04, 2021 at 08:32:37AM -0600, Rob Herring wrote:
> On Wed, Mar 3, 2021 at 10:48 PM Daniel Walker <danielwa@cisco.com> wrote:
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
> >  drivers/of/fdt.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> > index feb0f2d67fc5..cfe4f8d3c9f5 100644
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
> > @@ -1048,8 +1049,18 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
> >
> >         early_init_dt_check_for_initrd(node);
> >
> > +#ifdef CONFIG_GENERIC_CMDLINE
> 
> What I like about Christophe's version is it removes the old DT
> implementation. Who's going to convert the rest of the DT based
> arches? That's arm, arm64, hexagon, microblaze, nios2, openrisc,
> riscv, sh, and xtensa. Either separate the common code from the config
> like Christophe's version or these all need converting. Though it's
> fine to hash out patch 1 with a couple of arches first.
 
I'm limited in what I can test, so I can't know for sure that I have something
which works on those architectures. Even powerpc 64 is part of this series but
I can't really test it at this time. Also Cisco's needs out strip the
implementation of extend or override.

I have un-tested conversions for arm32, arm64, c6x, microblaze, nios2, and
openrisc. These could go into -next and we can see who complains. The
implementation on these architectures isn't all uniform.

> >         /* Retrieve command line */
> >         p = of_get_flat_dt_prop(node, "bootargs", &l);
> 
> This needs to be outside the ifdef.

Ok ..

Daniel
