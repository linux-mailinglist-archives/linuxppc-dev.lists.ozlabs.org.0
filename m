Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 645A23CC9D2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Jul 2021 18:10:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GSVM23Ds4z3bWX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jul 2021 02:10:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=nDjh27Ek;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::834;
 helo=mail-qt1-x834.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nDjh27Ek; dkim-atps=neutral
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GSVLS2TsMz2xyG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jul 2021 02:10:07 +1000 (AEST)
Received: by mail-qt1-x834.google.com with SMTP id r17so11243147qtp.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Jul 2021 09:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QkTXEObmutr68IWcNIV9tCbj7lXflMOhhNgNvZVkDI4=;
 b=nDjh27EkGaosIWAJ+UPvTPC1JVUoewykDFtyqC7eqoQ87MxJFli1DO9/amqUX/BBcB
 xF/gh5lUToGbtVK9Iq1S6JCNMXAxtiS9W9VuXOY+ZxOw4glLbKIhSzqn30Mv9hYsQi6k
 EByV8hvQxpov0HnULnXXat9fxVO3IxRbSPs1xCPgXxfYZZ1kSM6XrOs9o+Y06CRUrKfe
 DEP2yX1yaOML6GrCPw9nODAjmfchCEY1snePJi9Xtyli8EnZdVKzuX1VkYo5bidT/z/F
 p8cp8zxp16TaSMhutp7phoP+mlaocAtirkA2Nkhl8S+XN55eg+wNCp1JskPv+REsAtBO
 5CHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QkTXEObmutr68IWcNIV9tCbj7lXflMOhhNgNvZVkDI4=;
 b=DkxDHKuZssljWuq/myVeXvYCmBXcUQrmRKyneD0uEi/18H/wqE7J6j3nCnlWKG2v9b
 B5Th71dcgXq2zOqMnCufD605s0jphSCeJ3uv3SUk5M0vsJzBZm1P3OBDWEm3n5iNdj0M
 h5ae6BgYVI0ES1g3v6oLAUivSmxmpHrH9Y1xopcoETQYc82LnHMe1HVgVoQwUb1Uy5ET
 Po6HfDlZsuiiOPNBq1jSrsx0ERImMsicl+AztVDG/Np5StsxBWpSOldqiT8PWmIBCrGP
 gFI579QBqW3e25QoVPuDlIXB0uGAlneAN9bdo/29BwYCfPyoqTopYWGOhtnb4x4Ntuhd
 mrNw==
X-Gm-Message-State: AOAM531J6dGDOsbDGmaFYlQ87N98KVybmVMeadVE9bCCtePHmuBgQLeB
 H5njoW6MiFR4cfhlJgWXaB6Au9Y17BZ/egJLpIo=
X-Google-Smtp-Source: ABdhPJyNTKo2iDf4gdlx3AQLGgfrGu2Zd+DR9nj9vuu0fbDqvnaCxv1t66htCEbkTeTXzMzYR5IGL0bJZ4Vpjxmnazk=
X-Received: by 2002:ac8:5ac7:: with SMTP id d7mr18733586qtd.240.1626624601244; 
 Sun, 18 Jul 2021 09:10:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210716221159.3587039-1-linux@roeck-us.net>
 <20210717175750.Horde.TLZWyADKWFGAyFWIYtmglA2@messagerie.c-s.fr>
 <20210717162359.GA3130272@roeck-us.net>
In-Reply-To: <20210717162359.GA3130272@roeck-us.net>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Mon, 19 Jul 2021 02:09:50 +1000
Message-ID: <CAOSf1CGxp2xuEgR=Fb2AL+Ra5owqdN5=MtK6o_MCYqp=+P9arw@mail.gmail.com>
Subject: Re: [PATCH] powerpc/chrp: Revert "Move PHB discovery" and "Make
 hydra_init() static"
To: Guenter Roeck <linux@roeck-us.net>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jul 18, 2021 at 2:24 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Sat, Jul 17, 2021 at 05:57:50PM +0200, Christophe Leroy wrote:
> > Guenter Roeck <linux@roeck-us.net> a =C3=A9crit :
> >
> > > This patch reverts commit 407d418f2fd4 ("powerpc/chrp: Move PHB
> > > discovery") and commit 9634afa67bfd ("powerpc/chrp: Make hydra_init()
> > > static").
> > >
> > > Running the upstream kernel on Qemu's brand new "pegasos2" emulation
> > > results in a variety of backtraces such as
> > >
> > > Kernel attempted to write user page (a1) - exploit attempt? (uid: 0)
> > > ------------[ cut here ]------------
> > > Bug: Write fault blocked by KUAP!
> > > WARNING: CPU: 0 PID: 0 at arch/powerpc/mm/fault.c:230
> > > do_page_fault+0x4f4/0x920
> > > CPU: 0 PID: 0 Comm: swapper Not tainted 5.13.2 #40
> > > NIP:  c0021824 LR: c0021824 CTR: 00000000
> > > REGS: c1085d50 TRAP: 0700   Not tainted  (5.13.2)
> > > MSR:  00021032 <ME,IR,DR,RI>  CR: 24042254  XER: 00000000
> > >
> > > GPR00: c0021824 c1085e10 c0f8c520 00000021 3fffefff c1085c60 c1085c58
> > > 00000000
> > > GPR08: 00001032 00000000 00000000 c0ffb3ec 44042254 00000000 00000000
> > > 00000004
> > > GPR16: 00000000 ffffffff 000000c4 000000d0 0188c6e0 01006000 00000001
> > > 40b14000
> > > GPR24: c0ec000c 00000300 02000000 00000000 42000000 000000a1 00000000
> > > c1085e60
> > > NIP [c0021824] do_page_fault+0x4f4/0x920
> > > LR [c0021824] do_page_fault+0x4f4/0x920
> > > Call Trace:
> > > [c1085e10] [c0021824] do_page_fault+0x4f4/0x920 (unreliable)
> > > [c1085e50] [c0004254] DataAccess_virt+0xd4/0xe4
> > >
> > > and the system fails to boot. Bisect points to commit 407d418f2fd4
> > > ("powerpc/chrp: Move PHB discovery"). Reverting this patch together w=
ith
> > > commit 9634afa67bfd ("powerpc/chrp: Make hydra_init() static") fixes
> > > the problem.
> >
> > Isn't there more than that in the backtrace ? If there is a fault block=
ed by
> > Kuap, it means there is a fault. It should be visible in the traces.
> >
> > Should we fix the problem instead of reverting the commit that made the
> > problem visible ?
> >
>
> I do not think the patch reverted here made the problem visible. I am
> quite sure that it introduced it. AFAIS the problem is that the new code
> initializes and remaps PCI much later, after it is being used.

Right. The bug is that on 32bit platforms the PHB setup also maps one
of the PHB's IO space as "ISA IO space" as a side effect. There's a
handful of platforms (pegasos2 is one) which use an i8259 interrupt
controller and configuring that requires access to IO / ISA space. The
KUAP faults we're setting are because isa_io_base is still set to zero
so outb() and friends are accessing the zero page.

I don't think there's any real reason why we need to have PCI fully
set up to handle that situation. A few platforms already have early
fixup code which parses the DT directly rather than using the fields
of pci_controller (which are parsed from the DT anyway) and I'm pretty
sure we can do something similar.

> Also, the
> patch introducing the problem was never tested on real hardware (it even
> says so in the patch comments). That by itself seems to be quite
> problematic for such an invasive patch, and makes me wonder if some of
> the other PHB discovery related patches introduced similar problems.

The legacy platforms are maintained on a best-effort basis. Ellerman's
CI farm covers most of the powerpc CPU types, but there's no real way
to test the bulk of the platforms in the tree since most of the
hardware is currently in landfill.

> Anyway, I do not use or have that hardware. I was just playing with the
> latest version of qemu and ended up tracking down why its brand new
> pegasos2 emulation no longer boots with the latest Linux kernel.
> I personally don't care too much if ppc/chrp support is broken in the
> upstream kernel or not. Please take this patch as problem report,
> and feel free to do with it whatever you like, including ignoring it.

Problem reports are fine and appreciated. I'd be less cranky if you
included the kernel config you used in the initial report since I
wasted an hour of my saturday trying to replicate it with various
kernel configs that had SMP enabled since that's what the
chrp_defconfig uses.

Oliver
