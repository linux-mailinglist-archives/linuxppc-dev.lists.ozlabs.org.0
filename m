Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD2D495A09
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 07:36:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jg8mX1SnVz3cBN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 17:36:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GyeoGBec;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org;
 envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GyeoGBec; 
 dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jg8ls0hG7z3050
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 17:36:08 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 6B275CE22F3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 06:36:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35445C340E9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 06:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642746964;
 bh=OapTYucU006/664lVqAyS8BT5iSkNJKlZLbM69QQ02s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GyeoGBec3Mxxwihc80e8LN96Gzd5XeBsuNCOi7xxq0OUlO7wI66J+kph/004N5YlM
 ZphpsSdABXAW0cGfBs8tDJ2kaQt1QFdvMTjCMTyr6Bg8OcqIWKmeOaRmmnBE13F1EM
 AuEdwDMswd2hT0y57hMztgmKAEzQCaUypXzFkzAxSJ0+w8Q/Xs8m4tpDWn+VYnqnnN
 z9Ejp2Exvg1liCnyEAPgNaaENyPLldmhKZgF1KSYkIDtAxyFKfemjvExbxV5m4Xmou
 +f+05ibW2RAfW0HnazvCqTXvAO8o7EkoN+/B2BScAQl+D+PHtXxrtHd+6loQi9uk+g
 TzEikaKl0BY1Q==
Received: by mail-ua1-f46.google.com with SMTP id p7so7979664uao.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jan 2022 22:36:04 -0800 (PST)
X-Gm-Message-State: AOAM530Cpk7BZA7N6aNE1JEAC9jcZ1iAxKLD/ogxQp07IDsaTcAuhFIj
 WLOTFjWYJ8P08+LzDfKmpWZu6pIY6hobq8axYqc=
X-Google-Smtp-Source: ABdhPJwE7D6l9CEOckPMqifjprc+HPS6gXhdx42Itd64DW8S7D8rq3j2EK3bHxYHAPm3yMKSrqoSRwZpgjSjhZ4KQwc=
X-Received: by 2002:ab0:728c:: with SMTP id w12mr1223277uao.108.1642746963165; 
 Thu, 20 Jan 2022 22:36:03 -0800 (PST)
MIME-Version: 1.0
References: <20220120073911.99857-18-guoren@kernel.org>
 <CAK8P3a1_qwRpfHRyF75WEqfxGxgVnfB15vNS-egQctx7R5-DvA@mail.gmail.com>
In-Reply-To: <CAK8P3a1_qwRpfHRyF75WEqfxGxgVnfB15vNS-egQctx7R5-DvA@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 21 Jan 2022 14:35:52 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTCwOiTPJO1B6Asa2NUNR0D624t26nnA8S4vrSSax8R-Q@mail.gmail.com>
Message-ID: <CAJF2gTTCwOiTPJO1B6Asa2NUNR0D624t26nnA8S4vrSSax8R-Q@mail.gmail.com>
Subject: Re: [PATCH V3 17/17] KVM: compat: riscv: Prevent KVM_COMPAT from
 being selected
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
Cc: linux-s390 <linux-s390@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>,
 gregkh <gregkh@linuxfoundation.org>, Drew Fustini <drew@beagleboard.org>,
 Anup Patel <anup@brainfault.org>, Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, inux-parisc@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 liush <liush@allwinnertech.com>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Wei Fu <wefu@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 20, 2022 at 6:32 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Jan 20, 2022 at 8:39 AM <guoren@kernel.org> wrote:
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Current riscv doesn't support the 32bit KVM/arm API. Let's make it
> > clear by not selecting KVM_COMPAT.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > ---
> >  virt/kvm/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
> > index f4834c20e4a6..a8c5c9f06b3c 100644
> > --- a/virt/kvm/Kconfig
> > +++ b/virt/kvm/Kconfig
> > @@ -53,7 +53,7 @@ config KVM_GENERIC_DIRTYLOG_READ_PROTECT
> >
> >  config KVM_COMPAT
> >         def_bool y
> > -       depends on KVM && COMPAT && !(S390 || ARM64)
> > +       depends on KVM && COMPAT && !(S390 || ARM64 || RISCV)
>
> Maybe this should be flipped around into a positive list now?
I think it's another patch to do that. Not in this series.

> The remaining architectures would be mips, powerpc and x86, but it's unclear
> if this actually meant to work on all of them, or any potential ones
> added in the
Yes, it's unclear and arch maintainers need to confirm that.

> future.
>
>        Arnd



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
