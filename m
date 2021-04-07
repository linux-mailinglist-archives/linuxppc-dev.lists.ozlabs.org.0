Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D90D4357820
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 00:59:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FG0G15vnFz3bpy
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 08:59:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.43; helo=mail-ot1-f43.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FG0Fh38mKz2yxn
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Apr 2021 08:59:19 +1000 (AEST)
Received: by mail-ot1-f43.google.com with SMTP id
 w31-20020a9d36220000b02901f2cbfc9743so435578otb.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Apr 2021 15:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QKXgCn18Rr1eqfdzx55WXMaeSuXNDv2BM9yLmUwClbs=;
 b=sRFoW6WIbrafylp4u8YQwmLO2oUI/YE2sHU5+ABsk0/MURj+sZlilEobcMEbGeUqwz
 IRKvY8niNH2hn0VV25DYFtdCEFncflRwCFryIEGm72eaUF8FOh32tTcBzQCmzm9uQosS
 5HOnksz1XFiiwbMbaDuV8dCiNVzlV2urYyhuhcWOzJMgJFdaYgGKCBKXC/fXWfYlg9fA
 GjR/nJtm+uylGi3Mf8dFKIu2ir9ZOa0mm4nGIjScoeYIKOF+NdEkRjKdeoYAs+072AWY
 SCBMqUrcUA1RhwXyIayafu6sTHRahBHp3OLB+IigBBOmYnsJ0bPMhdJofpJwkYz3vmCh
 h3sQ==
X-Gm-Message-State: AOAM530c08PDDetxuNYBqET1sGGxsAAbjf1sRLZVoP2Mcnw2iQpUwF4M
 lB/rwxRdRa9FB0baDl0D5w==
X-Google-Smtp-Source: ABdhPJyvr5jHBGk0riO06gjL1cJLFcP8LjEM1PludhoIvgfnmnAE6t/+wBnt/64MHZhkodj4W6TLdA==
X-Received: by 2002:a05:6830:22c3:: with SMTP id
 q3mr4869906otc.56.1617836356986; 
 Wed, 07 Apr 2021 15:59:16 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id b22sm5786887ots.59.2021.04.07.15.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 15:59:16 -0700 (PDT)
Received: (nullmailer pid 174484 invoked by uid 1000);
 Wed, 07 Apr 2021 22:59:15 -0000
Date: Wed, 7 Apr 2021 17:59:15 -0500
From: Rob Herring <robh@kernel.org>
To: Daniel Walker <danielwa@cisco.com>
Subject: Re: [PATCH 2/8] CMDLINE: drivers: of: ifdef out cmdline section
Message-ID: <20210407225915.GA147338@robh.at.kernel.org>
References: <41021d66db2ab427c14255d2a24bb4517c8b58fd.1617126961.git.danielwa@cisco.com>
 <0c4b839f023f87c451c8aa3c4f7a8d92729c2f02.1617126961.git.danielwa@cisco.com>
 <CAL_Jsq+_gF9Cy7H6ic2q8dxnPf4+FsBa5pFYYRydJsEmDhnNhA@mail.gmail.com>
 <20210330231717.GA2469518@zorba>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210330231717.GA2469518@zorba>
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

On Tue, Mar 30, 2021 at 04:17:53PM -0700, Daniel Walker wrote:
> On Tue, Mar 30, 2021 at 02:49:13PM -0500, Rob Herring wrote:
> > On Tue, Mar 30, 2021 at 12:57 PM Daniel Walker <danielwa@cisco.com> wrote:
> > >
> > > It looks like there's some seepage of cmdline stuff into
> > > the generic device tree code. This conflicts with the
> > > generic cmdline implementation so I remove it in the case
> > > when that's enabled.
> > >
> > > Cc: xe-linux-external@cisco.com
> > > Signed-off-by: Ruslan Ruslichenko <rruslich@cisco.com>
> > > Signed-off-by: Daniel Walker <danielwa@cisco.com>
> > > ---
> > >  drivers/of/fdt.c | 14 ++++++++++++++
> > >  1 file changed, 14 insertions(+)
> > >
> > > diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> > > index dcc1dd96911a..d8805cd9717a 100644
> > > --- a/drivers/of/fdt.c
> > > +++ b/drivers/of/fdt.c
> > > @@ -25,6 +25,7 @@
> > >  #include <linux/serial_core.h>
> > >  #include <linux/sysfs.h>
> > >  #include <linux/random.h>
> > > +#include <linux/cmdline.h>
> > >
> > >  #include <asm/setup.h>  /* for COMMAND_LINE_SIZE */
> > >  #include <asm/page.h>
> > > @@ -1050,6 +1051,18 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
> > >
> > >         /* Retrieve command line */
> > >         p = of_get_flat_dt_prop(node, "bootargs", &l);
> > > +
> > > +#if defined(CONFIG_GENERIC_CMDLINE) && defined(CONFIG_GENERIC_CMDLINE_OF)
> > 
> > Moving in the wrong direction... This code already has too many
> > #ifdef's. I like Christophe's version as it gets rid of all the code
> > here.
>  
> It's temporary .. Notice CONFIG_GENERIC_CMDLINE_OF is only used on PowerPC. I
> experienced doubling on arm64 when this was used (i.e. the append and prepend
> was added twice).
> 
> I don't think there are any other users which can't be moved outside the device
> tree code, but powerpc uses this function three times during boot up plus the
> prom_init user. It's possible to use the generic command line in all four places,
> but it become space inefficient.

What's the 3rd use? I count kaslr code and in 
early_init_dt_scan_chosen_ppc. Do we need to build the command line for 
kaslr seed? Getting any build time value from the kernel is pointless.

Rob
