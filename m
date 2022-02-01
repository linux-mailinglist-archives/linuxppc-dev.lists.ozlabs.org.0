Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 399074A613E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 17:17:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jp97y0rNlz3cGl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Feb 2022 03:17:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WJwwKHQP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=guoren@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WJwwKHQP; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jp97G6w5Nz2xWd
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Feb 2022 03:17:13 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 24FEB6171B
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 16:17:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 891A9C340F1
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 16:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643732229;
 bh=tXC6QnhULfDX3AZU8FS9vMXtAGqHkE62Trq7DiDQG+g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WJwwKHQP2bQp4H+CbO5qOL36XV8TdcUQG/3UyMIqqA9B0Hwm4ETCJEY3lHVClFDXF
 TLDjmG25OjAf2nWbeEIBc7t8N6VE6PYypR1RiqaNALAFRjmNGja8nlfdih+bKRqoXa
 6iwO5cLgem5/buaDb/tp+Lpy7o2qEqI1/UGsUQSKfz+TMPo3z+mSnz3cG8BYoXAAbi
 +TGuHLaymkpv5tyOnUYoe58IArN1k0mbH+FEHC5NNnewgR/sbHx2qa2lZX/kI6lLTq
 KC7FQoHP9N2fB3arkAzwfzPk2f0PAVZIsC9IjuCJdCCr1g3uteH/QlaN158hB2ZU0/
 Ol0fY9iB4pcnw==
Received: by mail-lj1-f180.google.com with SMTP id z20so24846410ljo.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Feb 2022 08:17:09 -0800 (PST)
X-Gm-Message-State: AOAM530kZrRjPH7jCn/459DUPxKUoE4plCYnzR3bYikWEN+FBbL0aDvo
 E31ai8xSEOBxYYtgt9qTGpi30o0rNy6S2JJjrIU=
X-Google-Smtp-Source: ABdhPJxXcBxe7hc9p5AvEq+x7+VhWiTcTDw0Bpv+4IzlGIScnrvZJUOiEvnRa3Lc9ryY4B1x/+EnE7mJkMbtxGuSWBE=
X-Received: by 2002:a2e:bd82:: with SMTP id o2mr1407770ljq.454.1643732227579; 
 Tue, 01 Feb 2022 08:17:07 -0800 (PST)
MIME-Version: 1.0
References: <20220201150545.1512822-1-guoren@kernel.org>
 <20220201150545.1512822-22-guoren@kernel.org>
 <CAAhSdy27nVvh9F08kPgffJe-Y-gOOc9cnQtCLFAE0GbDhHVbiQ@mail.gmail.com>
 <f8359e15-412a-03d6-1b0c-a9f253816497@redhat.com>
 <CAAhSdy0U+41OWG_0C=820U+07accLsHxNYENtp=ZZsy6K4mJ0g@mail.gmail.com>
In-Reply-To: <CAAhSdy0U+41OWG_0C=820U+07accLsHxNYENtp=ZZsy6K4mJ0g@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 2 Feb 2022 00:16:55 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQj2vE-1LC5iUa594zSqBt1yMFjiw8pBPTbWVYp7YoitA@mail.gmail.com>
Message-ID: <CAJF2gTQj2vE-1LC5iUa594zSqBt1yMFjiw8pBPTbWVYp7YoitA@mail.gmail.com>
Subject: Re: [PATCH V5 21/21] KVM: compat: riscv: Prevent KVM_COMPAT from
 being selected
To: Anup Patel <anup@brainfault.org>
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
Cc: Guo Ren <guoren@linux.alibaba.com>, KVM General <kvm@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Christoph Hellwig <hch@lst.de>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>, linux-csky@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Drew Fustini <drew@beagleboard.org>, liush <liush@allwinnertech.com>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Wei Fu <wefu@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 2, 2022 at 12:11 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Tue, Feb 1, 2022 at 9:31 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
> >
> > On 2/1/22 16:44, Anup Patel wrote:
> > > +Paolo
> > >
> > > On Tue, Feb 1, 2022 at 8:38 PM <guoren@kernel.org> wrote:
> > >>
> > >> From: Guo Ren <guoren@linux.alibaba.com>
> > >>
> > >> Current riscv doesn't support the 32bit KVM API. Let's make it
> > >> clear by not selecting KVM_COMPAT.
> > >>
> > >> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > >> Signed-off-by: Guo Ren <guoren@kernel.org>
> > >> Cc: Arnd Bergmann <arnd@arndb.de>
> > >> Cc: Anup Patel <anup@brainfault.org>
> > >
> > > This looks good to me.
> > >
> > > Reviewed-by: Anup Patel <anup@brainfault.org>
> >
> > Hi Anup,
> >
> > feel free to send this via a pull request (perhaps together with Mark
> > Rutland's entry/exit rework).
>
> Sure, I will do like you suggested.
Great, thx.

>
> Regards,
> Anup
>
> >
> > Paolo
> >



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
