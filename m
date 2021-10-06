Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C72BF4248ED
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 23:27:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPnbn5JM1z301F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 08:27:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UBSXKYjm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435;
 helo=mail-pf1-x435.google.com; envelope-from=shorne@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=UBSXKYjm; dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPnY82n5yz3bYD
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Oct 2021 08:25:15 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id 187so3474792pfc.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Oct 2021 14:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=e64UMCL2WVnOr2UI7AUcgF8cpI0jeUTyJjvzOQZ8YrE=;
 b=UBSXKYjm15FEKybh0KfefqRjd/fVs22AWYzwe2iCJvmOHscvoAutQW2HwE99YHZeWu
 vEtNDuMS9d78IGfnBrQ47YiMpXMPPhe6dbQyF9hg/uSAQDApFpiVmZ7RCXYk//sWXr1Q
 0LSfp/P7/3d3pFfamzEH93p+y9SKpm/qjQxtZn4fAQUwleau5VdUB+9jn7Ku+OYnfnmC
 SnnK3Phc97T0RV6YdV7B/6OMV0qq1QjiJmwn6G9SBEM6VpE4qBOh3ESLF6KJAuPLSvNB
 EipYZeSbBljiqKzHr1N+foOdNe3WDWrdfrXbmYefd7v8ToBI7aLskwiFwDPpPQdD6I/S
 LWFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=e64UMCL2WVnOr2UI7AUcgF8cpI0jeUTyJjvzOQZ8YrE=;
 b=wCAvLbxwqvKMAA1PzTIbMdCi7qKrOqLq9On3lkgH28l/0bShFddUUYIimR080O0950
 +TyB3KQcRAMovouVM5bl4FdCU/uHsAFT+i/Wv2O+Z9r10GbnrRBMkQmkhuj52NOPPjED
 vm2vwW4sz7igByS/u0DiwA7YNUZ+UplZRPBIW0YIq0c324W+21VL/VciaMoFC0AdGmoK
 cRP1rumoymsZGwiaw81EdI4yA28dF36xUb1Rz2yjf7pjC19Nw69TQH2NluBcshr4TCnf
 VpHh9bRJI6m54715DL/tAuqXZznIt4dpKsP7IJmWwvnnaS819/hNUYVuFi4+AIqGMP5Y
 HeYA==
X-Gm-Message-State: AOAM530rOdJU2c8ngiL52huQtTVSOHOhzIwsuwNSzcwb8k47s/dPBEHE
 bG8kOSTERz1XvqmMgOKJr4c=
X-Google-Smtp-Source: ABdhPJyKapemGEMJ+oiRHHIk+xiUwqOqgxkK1126yB2yYflqm+sLMNs5knM5JE9Oh1WDASGMBmxR4Q==
X-Received: by 2002:aa7:92d0:0:b0:44c:ab24:cce7 with SMTP id
 k16-20020aa792d0000000b0044cab24cce7mr370069pfa.6.1633555512314; 
 Wed, 06 Oct 2021 14:25:12 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id i9sm18264104pfd.32.2021.10.06.14.25.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 14:25:11 -0700 (PDT)
Date: Thu, 7 Oct 2021 06:25:09 +0900
From: Stafford Horne <shorne@gmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 06/12] openrisc: Use of_get_cpu_hwid()
Message-ID: <YV4UNQg3QROuTfQ/@antec>
References: <20211006164332.1981454-1-robh@kernel.org>
 <20211006164332.1981454-7-robh@kernel.org> <YV4KkAC2p9D4yCnH@antec>
 <CAL_JsqLv+Ym=hxxz2vm0H3pbx1FRkBpHs3V=8DKjG43n+gS+RA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqLv+Ym=hxxz2vm0H3pbx1FRkBpHs3V=8DKjG43n+gS+RA@mail.gmail.com>
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
Cc: Rich Felker <dalias@libc.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Jonas Bonn <jonas@southpole.se>, Florian Fainelli <f.fainelli@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 SH-Linux <linux-sh@vger.kernel.org>, X86 ML <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>,
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Ray Jui <rjui@broadcom.com>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Openrisc <openrisc@lists.librecores.org>, Borislav Petkov <bp@alien8.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Scott Branden <sbranden@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Frank Rowand <frowand.list@gmail.com>, James Morse <james.morse@arm.com>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 06, 2021 at 04:08:38PM -0500, Rob Herring wrote:
> On Wed, Oct 6, 2021 at 3:44 PM Stafford Horne <shorne@gmail.com> wrote:
> >
> > On Wed, Oct 06, 2021 at 11:43:26AM -0500, Rob Herring wrote:
> > > Replace open coded parsing of CPU nodes' 'reg' property with
> > > of_get_cpu_hwid().
> > >
> > > Cc: Jonas Bonn <jonas@southpole.se>
> > > Cc: Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
> > > Cc: Stafford Horne <shorne@gmail.com>
> > > Cc: openrisc@lists.librecores.org
> > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > ---
> > >  arch/openrisc/kernel/smp.c | 6 +-----
> > >  1 file changed, 1 insertion(+), 5 deletions(-)
> > >
> > > diff --git a/arch/openrisc/kernel/smp.c b/arch/openrisc/kernel/smp.c
> > > index 415e209732a3..7d5a4f303a5a 100644
> > > --- a/arch/openrisc/kernel/smp.c
> > > +++ b/arch/openrisc/kernel/smp.c
> > > @@ -65,11 +65,7 @@ void __init smp_init_cpus(void)
> > >       u32 cpu_id;
> > >
> > >       for_each_of_cpu_node(cpu) {
> > > -             if (of_property_read_u32(cpu, "reg", &cpu_id)) {
> > > -                     pr_warn("%s missing reg property", cpu->full_name);
> > > -                     continue;
> > > -             }
> > > -
> > > +             cpu_id = of_get_cpu_hwid(cpu);
> 
> Oops, that should be: of_get_cpu_hwid(cpu, 0);

OK. I checked all other patches in the series, it seems OpenRISC was the only
one missing that.  Sorry I missed it initially.

> I thought I double checked all those...
> 
> > You have defined of_get_cpu_hwid to return u64, will this create compiler
> > warnings when since we are storing a u64 into a u32?
> 
> I'm counting on the caller to know the max size for their platform.

OK.

> >
> > It seems only if we make with W=3.
> >
> > I thought we usually warned on this.  Oh well, for the openrisc bits.
> 
> That's only on ptr truncation I think.

Right, that makes sense.

-Stafford
