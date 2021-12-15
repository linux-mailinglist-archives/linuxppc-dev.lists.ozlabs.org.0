Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C361475A76
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 15:17:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDcl60Sx9z3cP7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 01:17:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Uy0w2LK8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Uy0w2LK8; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDckR1PPtz2ywt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 01:16:47 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A9CCB618FF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 14:16:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BEE0C3460C
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 14:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639577803;
 bh=+nz7RZhA7PNYQ3kHJ5aSxlmtw3+mRphPVl6qCtqz4g8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Uy0w2LK8RsK4PS+aCX5onDL3FQKhf9z+rGPP6P2FnY7TbI4w9bnecbn4tECUFyyoD
 xVL9h+y29Yo+O+U4dynSa0K0xYmmT0z/VMSIvB260pyNEktMtGGu70lw3hSfOf+Ujj
 z5wcKBvjcoMhhQGim17/1j1TufkPPDgCIb9lSQ5KnUMyywdF6XGEb4s0CfV3jzwQIa
 ulpjgnrbhqzTjajkt7qKAT60jnB6u6Etr5L6AjJz2IRnxV7l60AqWSpZFwUc5ysAeG
 DtNnVCnCssoB6HebqwmEZcPPpLZxfukTS5bJvczhDBDL5Al3mDdgFP3szKw0/Yz9lM
 5L/ShbYI4feqw==
Received: by mail-ed1-f47.google.com with SMTP id x15so76255144edv.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 06:16:43 -0800 (PST)
X-Gm-Message-State: AOAM532uanzvzaFLDa+HgEFy/Vm05iqw/hyd6f3OlgZuyFpa5pT6S2g9
 nVIuzLQwiO3E+4UAEN12mzHTNUJSNtmYpUTK9A==
X-Google-Smtp-Source: ABdhPJy5cKCi6PavSzQ3HfyWq+w3HuOgZ4cI+2hIjfFBbkxg5Vxy0bdMbVrRZj4aBX6HGwMRz8xJYLa8EKkug7BCiHM=
X-Received: by 2002:a17:907:94c2:: with SMTP id
 dn2mr10770171ejc.325.1639577800600; 
 Wed, 15 Dec 2021 06:16:40 -0800 (PST)
MIME-Version: 1.0
References: <20211214202652.3894707-1-robh@kernel.org>
 <871r2emazp.fsf@mpe.ellerman.id.au>
In-Reply-To: <871r2emazp.fsf@mpe.ellerman.id.au>
From: Rob Herring <robh@kernel.org>
Date: Wed, 15 Dec 2021 08:16:28 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+gFrL1EjjTEYAtk=XHXPBWn070n7CjycULx2tG987oGw@mail.gmail.com>
Message-ID: <CAL_Jsq+gFrL1EjjTEYAtk=XHXPBWn070n7CjycULx2tG987oGw@mail.gmail.com>
Subject: Re: [PATCH v3] of/fdt: Rework early_init_dt_scan_memory() to call
 directly
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: devicetree@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, John Crispin <john@phrozen.org>,
 Frank Rowand <frowand.list@gmail.com>, Frank Rowand <frank.rowand@sony.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Dec 15, 2021 at 4:13 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Rob Herring <robh@kernel.org> writes:
> > diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> > index 5e216555fe4f..97d7607625ec 100644
> > --- a/drivers/of/fdt.c
> > +++ b/drivers/of/fdt.c
> > @@ -1078,49 +1078,50 @@ u64 __init dt_mem_next_cell(int s, const __be32 **cellp)
> >  /*
> >   * early_init_dt_scan_memory - Look for and parse memory nodes
> >   */
> > -int __init early_init_dt_scan_memory(unsigned long node, const char *uname,
> > -                                  int depth, void *data)
> > +int __init early_init_dt_scan_memory(void)
> >  {
> > -     const char *type = of_get_flat_dt_prop(node, "device_type", NULL);
> > -     const __be32 *reg, *endp;
> > -     int l;
> > -     bool hotpluggable;
> > -
> > -     /* We are scanning "memory" nodes only */
> > -     if (type == NULL || strcmp(type, "memory") != 0)
> > -             return 0;
> > +     int node;
> > +     const void *fdt = initial_boot_params;
> >
> > -     reg = of_get_flat_dt_prop(node, "linux,usable-memory", &l);
> > -     if (reg == NULL)
> > -             reg = of_get_flat_dt_prop(node, "reg", &l);
> > -     if (reg == NULL)
> > -             return 0;
> > +     for (node = fdt_node_offset_by_prop_value(fdt, -1, "device_type", "memory", 6);
> > +          node != -FDT_ERR_NOTFOUND;
> > +          node = fdt_node_offset_by_prop_value(fdt, node, "device_type", "memory", 6)) {
>
> The 6 there doesn't work on my machines.

Crap! I meant to keep the original version and just fix the return.

>
> It needs to match the trailing NULL, so 7 or sizeof("memory") works.

That's what I get for trying to look thru libfdt to see what it wants.
Seems to be strlen() on property names and strlen()+1 on values.

Rob
