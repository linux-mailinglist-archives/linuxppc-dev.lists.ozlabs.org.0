Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3DC475644
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 11:26:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDWc959yyz3c8K
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 21:26:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SPtvvB0B;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDWbX4wx8z2yyf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 21:25:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=SPtvvB0B; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JDWbX2KXKz4xd4;
 Wed, 15 Dec 2021 21:25:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1639563928;
 bh=3R0VgynKtNl3FLsyWItoiGw25E6Vy04chDcTc/NGlg8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=SPtvvB0BjYtARgDX1GdEqbbXC2ovev5L20lmyq1pTMPVdvAWwdtO/FD105XhIfPNj
 4es7LLBLVQZpmAj0QuzGrbhHMkkwyIMi+eulT/fDTgmA1n32zj1TKlnTLNLsSH76XX
 JFyrNVESVX7+Pdh09WdJ0jQfxqgwoc/uOlWj1N30VuczpSHfYlcDd3GMtKbtwwGIGD
 yPG6lb+e5gh4uHPspHvU2eWgNv7kwMCp4VBmA1nrzACJw+JSsG6eq8k8DBsyN9rZM0
 wYynB2nHbNTI3vAdVoqOzOJPBiAucmDIBdxHhOYQnsoBHSJSFXSt13tlzZHSHgamE9
 wSbOYR2T2ldiQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] of/fdt: Rework early_init_dt_scan_memory() to call
 directly
In-Reply-To: <CAL_JsqKbaRgivZMxEj6Mjdny2LNeSA1GQyDW-nQe7E2irPc-Fw@mail.gmail.com>
References: <20211208155839.4084795-1-robh@kernel.org>
 <87fsqwn03o.fsf@mpe.ellerman.id.au>
 <CAL_JsqLpq7fx0pyQiJFa0P5C3JXijiVe_fr84x9RML1aDJ7vDQ@mail.gmail.com>
 <877dc7mo3o.fsf@mpe.ellerman.id.au>
 <CAL_JsqKbaRgivZMxEj6Mjdny2LNeSA1GQyDW-nQe7E2irPc-Fw@mail.gmail.com>
Date: Wed, 15 Dec 2021 21:25:27 +1100
Message-ID: <87zgp2kvvs.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

Rob Herring <robh@kernel.org> writes:
> On Tue, Dec 14, 2021 at 5:18 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> Rob Herring <robh@kernel.org> writes:
>> > On Mon, Dec 13, 2021 at 6:47 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>> >> Rob Herring <robh@kernel.org> writes:
>> >> > Use of the of_scan_flat_dt() function predates libfdt and is discouraged
>> >> > as libfdt provides a nicer set of APIs. Rework
>> >> > early_init_dt_scan_memory() to be called directly and use libfdt.
>> >> ...
>> >> > diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
>> >> > index 6e1a106f02eb..63762a3b75e8 100644
>> >> > --- a/arch/powerpc/kernel/prom.c
>> >> > +++ b/arch/powerpc/kernel/prom.c
>> >> > @@ -532,19 +532,19 @@ static int  __init early_init_drmem_lmb(struct drmem_lmb *lmb,
>> >> >  }
>> >> >  #endif /* CONFIG_PPC_PSERIES */
>> >> >
>> >> > -static int __init early_init_dt_scan_memory_ppc(unsigned long node,
>> >> > -                                             const char *uname,
>> >> > -                                             int depth, void *data)
>> >> > +static int __init early_init_dt_scan_memory_ppc(void)
>> >> >  {
>> >> >  #ifdef CONFIG_PPC_PSERIES
>> >> > -     if (depth == 1 &&
>> >> > -         strcmp(uname, "ibm,dynamic-reconfiguration-memory") == 0) {
>> >> > +     const void *fdt = initial_boot_params;
>> >> > +     int node = fdt_path_offset(fdt, "/ibm,dynamic-reconfiguration-memory");
>> >> > +
>> >> > +     if (node > 0) {
>> >> >               walk_drmem_lmbs_early(node, NULL, early_init_drmem_lmb);
>> >> >               return 0;
>> >> >       }
>>
>> It's that return that is the problem.
>>
>> Now that early_init_dt_scan_memory_ppc() is only called once, that
>> return causes us to skip scanning regular memory nodes if there is an
>> "ibm,dynamic-reconfiguration-memory" property present.
>>
>> So the fix is just:
>>
>> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
>> index 1098de3b172f..125661e5fcf3 100644
>> --- a/arch/powerpc/kernel/prom.c
>> +++ b/arch/powerpc/kernel/prom.c
>> @@ -538,10 +538,8 @@ static int __init early_init_dt_scan_memory_ppc(void)
>>         const void *fdt = initial_boot_params;
>>         int node = fdt_path_offset(fdt, "/ibm,dynamic-reconfiguration-memory");
>>
>> -       if (node > 0) {
>> +       if (node > 0)
>>                 walk_drmem_lmbs_early(node, NULL, early_init_drmem_lmb);
>> -               return 0;
>> -       }
>>  #endif
>>
>>         return early_init_dt_scan_memory();
>
> Thanks! I've rolled that in.
>
>> > The only thing I see is now there is an assumption that 'memory' nodes
>> > are off the root node only. Before they could be anywhere.
>>
>> I don't know of any machines where that would be a problem. But given
>> all the wild and wonderful device trees out there, who really knows :)
>>
>> Maybe we should continue to allow memory nodes to be anywhere, and print
>> a warning for any that aren't at the root. Then if no one reports any
>> hits for the warning we could switch to only allowing them at the root?
>
> I really doubt there's any case. I just have the least visibility into
> what IBM DTs look like. I checked some old DT files I have and also
> u-boot only supports off the root node.

The IBM ones are pretty standard, it's other embedded things I'd be more
worried about.

I have a collection of device trees, but they were given to me by
various random people over the years and I'm not comfortable putting
them up in public. I looked through those and didn't see anything odd.

I'll try and get a collection of device trees from machines of mine and
put them somewhere public.

cheers
