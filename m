Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D35FB22A112
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 23:08:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBp2l2pDZzDr2p
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 07:07:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=atishpatra.org (client-ip=2a00:1450:4864:20::344;
 helo=mail-wm1-x344.google.com; envelope-from=atishp@atishpatra.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=atishpatra.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=atishpatra.org header.i=@atishpatra.org header.a=rsa-sha256
 header.s=google header.b=DtMjrfPK; dkim-atps=neutral
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBp0m1GmdzDqyl
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 07:06:11 +1000 (AEST)
Received: by mail-wm1-x344.google.com with SMTP id c80so3130976wme.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 14:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pUykGa+mtQ5qLEJzpM6lTm4DyeH44yHQyhTxXONta+M=;
 b=DtMjrfPK33UpsHV7ieVtBoXhLIYg/jlJtL/BwT+t06XPoZuxolm3MZwCr//MnlAhv7
 olpqshFL30eLQy1W2/XqwGp6TQ4RerXlU6stdyUroQWPo3+FNPAxh8fnNdtX7F+nvEDT
 VJ2MTsTfnTkK/RixP0LCc4xF2mzNoGq5Ig8To=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pUykGa+mtQ5qLEJzpM6lTm4DyeH44yHQyhTxXONta+M=;
 b=W9mjUKwof3kS6yZjKzwu0yEnORLukAL1XOYSxil1F8FUrSGctb8rsKz8oO85DqkFD9
 us++W0jeX6darT+5zfVZHIGDwmrSbmbcQ0DnjSISjhQq9kEvQ+nrurAbcvgVCnNbsPiK
 8zQqjq4oLtRrNcKfxHMZRgXvRudkdJ7B0g2I0Mdxy9bDXPk4x1yB2PBrkmKEdGsJ6UGE
 yM8XM9PXkKuXf7AGcvUB2T2bzzgamNZvynaIPUGbiGM4Ii4FocrUCt05POG3u47r11B1
 kSHcj78OLQtKkSgVH5TmgXhttCtCARuX+cDJi5DrliRVeNxFlJzW0l7Tm1DbgblvbN8q
 +xOw==
X-Gm-Message-State: AOAM530wpV7hve761noC6rkMdfyontWz6kkzVRtHci+f+3Ddz/bXW1o8
 5A9q2gw36a1UBfeNSrFAXHxaCRyoHZV3m5aatM5F
X-Google-Smtp-Source: ABdhPJwhNpZUdU/OnWtik2XTzTS4UMH8jcwWO9Hxmgqgvl3smhQmAYatCRp4hQfaVCyVsPrlT6KIYfciVm1lrAWgeu4=
X-Received: by 2002:a1c:dc02:: with SMTP id t2mr1223465wmg.55.1595451967050;
 Wed, 22 Jul 2020 14:06:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a34sT2bQbkZUjaxaShzCkn+s35pXxS0UNhqGFu+t2hZYw@mail.gmail.com>
 <mhng-820ebe55-b4a3-4ab3-b848-6d3551b43091@palmerdabbelt-glaptop1>
 <CAK8P3a2VHXDLK6iba=NxSQ-t=9P7LSwzwx3XrK=N=M+qoX_oeQ@mail.gmail.com>
In-Reply-To: <CAK8P3a2VHXDLK6iba=NxSQ-t=9P7LSwzwx3XrK=N=M+qoX_oeQ@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 22 Jul 2020 14:05:55 -0700
Message-ID: <CAOnJCULmX+vUcpEmBd5w7xjtZSFk=Ju2V=wBJCOXHQ8m9yG9-Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] riscv: Move kernel mapping to vmalloc zone
To: Arnd Bergmann <arnd@arndb.de>
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Linux-MM <linux-mm@kvack.org>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Paul Mackerras <paulus@samba.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 22, 2020 at 1:23 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Wed, Jul 22, 2020 at 9:52 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> > On Wed, 22 Jul 2020 02:43:50 PDT (-0700), Arnd Bergmann wrote:
> > > On Tue, Jul 21, 2020 at 9:06 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> > > The eventual goal is to have a split of 3840MB for either user or linear map
> > > plus and 256MB for vmalloc, including the kernel. Switching between linear
> > > and user has a noticeable runtime overhead, but it relaxes both the limits
> > > for user memory and lowmem, and it provides a somewhat stronger
> > > address space isolation.
> >
> > Ya, I think we decided not to do that, at least for now.  I guess the right
> > answer there will depend on what 32-bit systems look like, and since we don't
> > have any I'm inclined to just stick to the fast option.
>
> Makes sense. Actually on 32-bit Arm we see fewer large-memory
> configurations in new machines than we had in the past before 64-bit
> machines were widely available at low cost, so I expect not to see a
> lot new hardware with more than 1GB of DDR3 (two 256Mbit x16 chips)
> for cost reasons, and rv32 is likely going to be similar, so you may never
> really see a need for highmem or the above hack to increase the
> size of the linear mapping.
>
> I just noticed that rv32 allows 2GB of lowmem rather than just the usual
> 768MB or 1GB, at the expense of addressable user memory. This seems
> like an unusual choice, but I also don't see any reason to change this
> or make it more flexible unless actual users appear.
>

I am a bit confused here. As per my understanding, RV32 supports 1GB
of lowmem only
as the page offset is set to 0xC0000000. The config option
MAXPHYSMEM_2GB is misleading
as RV32 actually allows 1GB of physical memory only. Any memory blocks beyond
DRAM + 1GB are removed in setup_bootmem. IMHO, The current config
should clarify that.

Moreover, we should add 2G split under a separate configuration if we
want to support that.

>        Arnd
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish
