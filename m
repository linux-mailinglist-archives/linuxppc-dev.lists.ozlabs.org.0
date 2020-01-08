Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F7D133D00
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 09:20:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47t2HV0KWFzDqQw
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 19:20:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=krzk@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="pn06NSI7"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47t2F83f4mzDqQn
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2020 19:18:20 +1100 (AEDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8D8AE2070E
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2020 08:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578471498;
 bh=Z+jGQWUGpMpq9vf6wICls0VYN115AefgvIu/HhdePHk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=pn06NSI7Ir5OnmdjGDe1ZZs8uvRLbmNf62zCTi54jJrOzyxoGTISihthnCAX9q8xg
 z2BXei01n/ZVHrua5xRHyktYGZF3mgEnti4aQbpjZ7W/vJ6qlENTDWwISRIRYQULts
 AiY8Hq7axL/OES2MscCawqq6MZXgX4ObvpqvLmx8=
Received: by mail-lf1-f43.google.com with SMTP id 15so1770240lfr.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jan 2020 00:18:18 -0800 (PST)
X-Gm-Message-State: APjAAAUP6xKiwMHPr9ip46R6coP9UGN0AI7l8wMmgG3NG+zvwChpZG+N
 v1Qnat6wENYAghivXkRVwH53xTClUFHB+nXdxQk=
X-Google-Smtp-Source: APXvYqx8IW0ef6AILrjgFsz/NHkZ5FGyNdGBP6B08f+N/XjPZn0ZxJlQUXcofSfQagLulZJ9S0pCznJIj3of888Ak8k=
X-Received: by 2002:ac2:51de:: with SMTP id u30mr2081225lfm.69.1578471494464; 
 Wed, 08 Jan 2020 00:18:14 -0800 (PST)
MIME-Version: 1.0
References: <1578415992-24054-1-git-send-email-krzk@kernel.org>
 <CAMuHMdW4ek0OYQDrrbcpZjNUTTP04nSbwkmiZvBmKcU=PQM9qA@mail.gmail.com>
 <CAMuHMdUBmYtJKtSYzS_5u67hVZOqcKSgFY1rDGme6gLNRBJ_gA@mail.gmail.com>
In-Reply-To: <CAMuHMdUBmYtJKtSYzS_5u67hVZOqcKSgFY1rDGme6gLNRBJ_gA@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 8 Jan 2020 09:18:03 +0100
X-Gmail-Original-Message-ID: <CAJKOXPfq9vS4kSyx1jOPHBvi9_HjviRv0LU2A8ZwdmqgUuebHQ@mail.gmail.com>
Message-ID: <CAJKOXPfq9vS4kSyx1jOPHBvi9_HjviRv0LU2A8ZwdmqgUuebHQ@mail.gmail.com>
Subject: Re: [RFT 00/13] iomap: Constify ioreadX() iomem argument
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
Cc: Rich Felker <dalias@libc.org>, Jiri Slaby <jirislaby@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Jason Wang <jasowang@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 netdev <netdev@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 Linux-Arch <linux-arch@vger.kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Alexey Brodkin <abrodkin@synopsys.com>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 Matt Turner <mattst88@gmail.com>, arcml <linux-snps-arc@lists.infradead.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, alpha <linux-alpha@vger.kernel.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Richard Henderson <rth@twiddle.net>,
 Parisc List <linux-parisc@vger.kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Jon Mason <jdmason@kudzu.us>, linux-ntb@googlegroups.com,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 8 Jan 2020 at 09:13, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Krzysztof,
>
> On Wed, Jan 8, 2020 at 9:07 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, Jan 7, 2020 at 5:53 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > The ioread8/16/32() and others have inconsistent interface among the
> > > architectures: some taking address as const, some not.
> > >
> > > It seems there is nothing really stopping all of them to take
> > > pointer to const.
> >
> > Shouldn't all of them take const volatile __iomem pointers?
> > It seems the "volatile" is missing from all but the implementations in
> > include/asm-generic/io.h.
>
> As my "volatile" comment applies to iowrite*(), too, probably that should be
> done in a separate patch.
>
> Hence with patches 1-5 squashed, and for patches 11-13:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

I'll add to this one also changes to ioreadX_rep() and add another
patch for volatile for reads and writes. I guess your review will be
appreciated once more because of ioreadX_rep()

Thanks,
Krzysztof
