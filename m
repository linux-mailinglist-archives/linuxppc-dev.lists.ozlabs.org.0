Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A62634BC36
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Mar 2021 13:37:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F7YbV4Lfmz30G4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Mar 2021 22:37:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DugdbpT4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=guoren@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DugdbpT4; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F7Yb4373Wz2yZ0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Mar 2021 22:37:04 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A05E461971
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Mar 2021 11:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616931420;
 bh=8r+E9jML76H0gCn8zByIpf9ts7froA6i3yzLNHuBvN4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DugdbpT4GDM1HZeaem5soSAi/FHElDFHhmz2xIpsZJUkasWv28ZB3zgK93tR/c1EG
 Wg6UZIL/32OGSKHjIL7I3TejYIFIJatZ2S0hfZTZhMaw3y2P3h3z4TJdRouH33c2P4
 a0vFE4t1YxIuiIc5HdVc8iBz2z/pz1daXtvTbooBxBTN2T1IZ64j2pxee2ABx/u+UN
 R9Tpd5W1OnKdE7r9gQzXgqssvnkZagFrOM0DWS5GTeRlV6XS25xWzL3c0iO1XPbWAb
 sCLOKxIHwnhTcR+YQphOeEdtMjQrjqZYOIz3pgbUdAYY8+PAy495HKeu1P90Dt67iE
 cgL/CGET6Tr6g==
Received: by mail-lf1-f47.google.com with SMTP id a198so14221706lfd.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Mar 2021 04:37:00 -0700 (PDT)
X-Gm-Message-State: AOAM531eVRA+pQBs2ZUPG+gZrVyBi/FAuKVwdakN2LUrPQFxiQsm3Ht0
 8ByMiDlDFdbjMwcHEySGxTtRa1ZBzzS+K+SoYyA=
X-Google-Smtp-Source: ABdhPJyj9o7D6hGhD+tmVxlzoBXg46BNhDKM+Nvrw+oWgxcsNgQKl214mB8IGaefEjDYpDQx2VSVsVg9V+sA7ebVJIA=
X-Received: by 2002:a19:f501:: with SMTP id j1mr14083138lfb.231.1616931418962; 
 Sun, 28 Mar 2021 04:36:58 -0700 (PDT)
MIME-Version: 1.0
References: <1616913028-83376-1-git-send-email-guoren@kernel.org>
 <1616913028-83376-5-git-send-email-guoren@kernel.org>
 <e27af5e0-a462-cb75-6311-1b5a6b4ee4f1@csgroup.eu>
In-Reply-To: <e27af5e0-a462-cb75-6311-1b5a6b4ee4f1@csgroup.eu>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 28 Mar 2021 19:36:47 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQvPOZ6aWxof66gzOBfia5mAV0=3pxO+QPdW8xpQrz3aA@mail.gmail.com>
Message-ID: <CAJF2gTQvPOZ6aWxof66gzOBfia5mAV0=3pxO+QPdW8xpQrz3aA@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] powerpc/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-arch <linux-arch@vger.kernel.org>, linux-xtensa@linux-xtensa.org,
 Guo Ren <guoren@linux.alibaba.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, openrisc@lists.librecores.org,
 Paul Mackerras <paulus@samba.org>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Mar 28, 2021 at 7:14 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 28/03/2021 =C3=A0 08:30, guoren@kernel.org a =C3=A9crit :
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > We don't have native hw xchg16 instruction, so let qspinlock
> > generic code to deal with it.
>
> We have lharx/sthcx pair on some versions of powerpc.
>
> See https://patchwork.ozlabs.org/project/linuxppc-dev/patch/2020110703232=
8.2454582-1-npiggin@gmail.com/
Got it, thx for the information.

>
> Christophe
>
> >
> > Using the full-word atomic xchg instructions implement xchg16 has
> > the semantic risk for atomic operations.
> >
> > This patch cancels the dependency of on qspinlock generic code on
> > architecture's xchg16.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > Cc: Paul Mackerras <paulus@samba.org>
> > ---
> >   arch/powerpc/Kconfig | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > index 386ae12d8523..69ec4ade6521 100644
> > --- a/arch/powerpc/Kconfig
> > +++ b/arch/powerpc/Kconfig
> > @@ -151,6 +151,7 @@ config PPC
> >       select ARCH_USE_CMPXCHG_LOCKREF         if PPC64
> >       select ARCH_USE_QUEUED_RWLOCKS          if PPC_QUEUED_SPINLOCKS
> >       select ARCH_USE_QUEUED_SPINLOCKS        if PPC_QUEUED_SPINLOCKS
> > +     select ARCH_USE_QUEUED_SPINLOCKS_XCHG32 if PPC_QUEUED_SPINLOCKS
> >       select ARCH_WANT_IPC_PARSE_VERSION
> >       select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
> >       select ARCH_WANT_LD_ORPHAN_WARN
> >



--=20
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/
