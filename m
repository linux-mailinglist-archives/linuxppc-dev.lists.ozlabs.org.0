Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C5E474560
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 15:40:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JD1Jl6VpMz3c57
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 01:40:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DEk9lHeW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DEk9lHeW; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JD1J537Llz2xtC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 01:40:21 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A57DE61524
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Dec 2021 14:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14D63C34607
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Dec 2021 14:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639492817;
 bh=ZsV7vgxPngHOT7KypBEabGUnzoS988RDkMy+GfbQz5k=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DEk9lHeW4hwiaZLjPTt7Uc1cptM17Ov0+NsM6bhU4LiI//GPvobyXJoBCiW9S4dF/
 OReBLXH4E90RJYGzpp/+tJ9ERkzS7RFhDYW2ME6QjJuoUNis7M+4XpD7r0pg5z8Nmx
 cKcnofKDQhYytgZBnUQ49vx4/PCZh+xekN9naH1FqLdx9G0sh26AFfh8LwEZzGltbl
 ETFEJfnkFVhWU5+bdgUz3314Eahw+5wMST9UXEdQSPqMU0kcDMsUidpADbC4y1i9ht
 2UA6ByU0F+OuHVYfpGQmKk63vajy5tyctQoCyq7ckY6+kySqHgV/1ZehWyRdaj/zS0
 HWmEi/IJCNzaA==
Received: by mail-ed1-f44.google.com with SMTP id x15so64701184edv.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Dec 2021 06:40:16 -0800 (PST)
X-Gm-Message-State: AOAM5315Z3cEYPbY8riimaWMSYneFUyf+21GYT6xDHS+0F9D8Vvo3IW3
 0NvG4iHtPkYJjVeLlVPDSS1VVnm+itBzq7HGog==
X-Google-Smtp-Source: ABdhPJzb2kFsttfkp1wodLWs1+u9g7X0Osm0q69CwVTGT2N2fa1Xsg4NpUSIZpuN1tuA7JavfOna2VbIWMjOqcHj4o8=
X-Received: by 2002:a17:907:9256:: with SMTP id
 kb22mr5778005ejb.423.1639492814393; 
 Tue, 14 Dec 2021 06:40:14 -0800 (PST)
MIME-Version: 1.0
References: <20211208155839.4084795-1-robh@kernel.org>
 <87fsqwn03o.fsf@mpe.ellerman.id.au>
 <CAL_JsqLpq7fx0pyQiJFa0P5C3JXijiVe_fr84x9RML1aDJ7vDQ@mail.gmail.com>
 <877dc7mo3o.fsf@mpe.ellerman.id.au>
In-Reply-To: <877dc7mo3o.fsf@mpe.ellerman.id.au>
From: Rob Herring <robh@kernel.org>
Date: Tue, 14 Dec 2021 08:40:02 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKbaRgivZMxEj6Mjdny2LNeSA1GQyDW-nQe7E2irPc-Fw@mail.gmail.com>
Message-ID: <CAL_JsqKbaRgivZMxEj6Mjdny2LNeSA1GQyDW-nQe7E2irPc-Fw@mail.gmail.com>
Subject: Re: [PATCH v2] of/fdt: Rework early_init_dt_scan_memory() to call
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
 Frank Rowand <frowand.list@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Dec 14, 2021 at 5:18 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Rob Herring <robh@kernel.org> writes:
> > On Mon, Dec 13, 2021 at 6:47 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
> >> Rob Herring <robh@kernel.org> writes:
> >> > Use of the of_scan_flat_dt() function predates libfdt and is discouraged
> >> > as libfdt provides a nicer set of APIs. Rework
> >> > early_init_dt_scan_memory() to be called directly and use libfdt.
> >> ...
> >> > diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> >> > index 6e1a106f02eb..63762a3b75e8 100644
> >> > --- a/arch/powerpc/kernel/prom.c
> >> > +++ b/arch/powerpc/kernel/prom.c
> >> > @@ -532,19 +532,19 @@ static int  __init early_init_drmem_lmb(struct drmem_lmb *lmb,
> >> >  }
> >> >  #endif /* CONFIG_PPC_PSERIES */
> >> >
> >> > -static int __init early_init_dt_scan_memory_ppc(unsigned long node,
> >> > -                                             const char *uname,
> >> > -                                             int depth, void *data)
> >> > +static int __init early_init_dt_scan_memory_ppc(void)
> >> >  {
> >> >  #ifdef CONFIG_PPC_PSERIES
> >> > -     if (depth == 1 &&
> >> > -         strcmp(uname, "ibm,dynamic-reconfiguration-memory") == 0) {
> >> > +     const void *fdt = initial_boot_params;
> >> > +     int node = fdt_path_offset(fdt, "/ibm,dynamic-reconfiguration-memory");
> >> > +
> >> > +     if (node > 0) {
> >> >               walk_drmem_lmbs_early(node, NULL, early_init_drmem_lmb);
> >> >               return 0;
> >> >       }
>
> It's that return that is the problem.
>
> Now that early_init_dt_scan_memory_ppc() is only called once, that
> return causes us to skip scanning regular memory nodes if there is an
> "ibm,dynamic-reconfiguration-memory" property present.
>
> So the fix is just:
>
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index 1098de3b172f..125661e5fcf3 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -538,10 +538,8 @@ static int __init early_init_dt_scan_memory_ppc(void)
>         const void *fdt = initial_boot_params;
>         int node = fdt_path_offset(fdt, "/ibm,dynamic-reconfiguration-memory");
>
> -       if (node > 0) {
> +       if (node > 0)
>                 walk_drmem_lmbs_early(node, NULL, early_init_drmem_lmb);
> -               return 0;
> -       }
>  #endif
>
>         return early_init_dt_scan_memory();

Thanks! I've rolled that in.

> > The only thing I see is now there is an assumption that 'memory' nodes
> > are off the root node only. Before they could be anywhere.
>
> I don't know of any machines where that would be a problem. But given
> all the wild and wonderful device trees out there, who really knows :)
>
> Maybe we should continue to allow memory nodes to be anywhere, and print
> a warning for any that aren't at the root. Then if no one reports any
> hits for the warning we could switch to only allowing them at the root?

I really doubt there's any case. I just have the least visibility into
what IBM DTs look like. I checked some old DT files I have and also
u-boot only supports off the root node.


Rob
