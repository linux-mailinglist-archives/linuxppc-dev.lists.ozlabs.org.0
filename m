Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9122D27A760
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Sep 2020 08:22:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0C9264fFzDqR7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Sep 2020 16:21:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=ardb@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=fwo2d0hr; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0C7Q1WwnzDqST
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Sep 2020 16:20:34 +1000 (AEST)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com
 [209.85.161.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DDAF821974
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Sep 2020 06:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601274031;
 bh=qGVBcNhDEEBkJu2At1hZbhtzuUFdZojHwVUCzhbrbsk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fwo2d0hrOCh//8fo44sy9fdmRqifZP0dn7TS9wrBuwEgNg5MlIJWliyZ3COaqvDRq
 Al6gDUapZdFQHeUsuQiWLRuB7CwNRayClrz1kiS+eiCc1qavd/xZFUM5X43bej+UrC
 BteFArtTe7jsWqhRcm24zVVoELxeF1RLvsXhf0fo=
Received: by mail-oo1-f42.google.com with SMTP id t3so15695ook.8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Sep 2020 23:20:30 -0700 (PDT)
X-Gm-Message-State: AOAM530oatAffFRGIcUxbrr0sl3tculnccxOtUco+boeMaElFy9a0Sau
 28LWaZi5/J6oSc3mNSn81UmMRhgaqcDpZ9yfiRw=
X-Google-Smtp-Source: ABdhPJya6+NUXngiNKxeosaYSdyZVPk+uYtQRGhgdz0kf1DdRjRrFRW4PGdNv65YNWycBUG1REBKMRMNa4ltvRyBeVk=
X-Received: by 2002:a4a:4910:: with SMTP id z16mr24551ooa.41.1601274030150;
 Sun, 27 Sep 2020 23:20:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200922094128.26245-1-ardb@kernel.org>
 <20200925055626.GC165011@linux.intel.com>
 <CAMj1kXFLWsFz7HV4sHLbwBkuiEu0gT4esSH8umVrvDDrJaOLrQ@mail.gmail.com>
 <20200925102920.GA180915@linux.intel.com> <20200925120018.GH9916@ziepe.ca>
 <20200927234434.GA5283@linux.intel.com>
 <9be9c7e7-c424-d241-2255-ad854221bd2e@csgroup.eu>
In-Reply-To: <9be9c7e7-c424-d241-2255-ad854221bd2e@csgroup.eu>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 28 Sep 2020 08:20:18 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGxNgixUEocma-9F3fYgdJJJADh=bvyrCziXkuArErWdA@mail.gmail.com>
Message-ID: <CAMj1kXGxNgixUEocma-9F3fYgdJJJADh=bvyrCziXkuArErWdA@mail.gmail.com>
Subject: Re: [PATCH] tpm: of: avoid __va() translation for event log address
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Paul Mackerras <paulus@samba.org>,
 linux-integrity <linux-integrity@vger.kernel.org>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>, Peter Huewe <peterhuewe@gmx.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 28 Sep 2020 at 07:56, Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 28/09/2020 =C3=A0 01:44, Jarkko Sakkinen a =C3=A9crit :
> > On Fri, Sep 25, 2020 at 09:00:18AM -0300, Jason Gunthorpe wrote:
> >> On Fri, Sep 25, 2020 at 01:29:20PM +0300, Jarkko Sakkinen wrote:
> >>> On Fri, Sep 25, 2020 at 09:00:56AM +0200, Ard Biesheuvel wrote:
> >>>> On Fri, 25 Sep 2020 at 07:56, Jarkko Sakkinen
> >>>> <jarkko.sakkinen@linux.intel.com> wrote:
> >>>>>
> >>>>> On Tue, Sep 22, 2020 at 11:41:28AM +0200, Ard Biesheuvel wrote:
> >>>>>> The TPM event log is provided to the OS by the firmware, by loadin=
g
> >>>>>> it into an area in memory and passing the physical address via a n=
ode
> >>>>>> in the device tree.
> >>>>>>
> >>>>>> Currently, we use __va() to access the memory via the kernel's lin=
ear
> >>>>>> map: however, it is not guaranteed that the linear map covers this
> >>>>>> particular address, as we may be running under HIGHMEM on a 32-bit
> >>>>>> architecture, or running firmware that uses a memory type for the
> >>>>>> event log that is omitted from the linear map (such as EfiReserved=
).
> >>>>>
> >>>>> Makes perfect sense to the level that I wonder if this should have =
a
> >>>>> fixes tag and/or needs to be backported to the stable kernels?
> >>>>>
> >>>>
> >>>> AIUI, the code was written specifically for ppc64, which is a
> >>>> non-highmem, non-EFI architecture. However, when we start reusing th=
is
> >>>> driver for ARM, this issue could pop up.
> >>>>
> >>>> The code itself has been refactored a couple of times, so I think it
> >>>> will require different versions of the patch for different generatio=
ns
> >>>> of stable kernels.
> >>>>
> >>>> So perhaps just add Cc: <stable@vger.kernel.org>, and wait and see h=
ow
> >>>> far back it applies cleanly?
> >>>
> >>> Yeah, I think I'll cc it with some note before the diffstat.
> >>>
> >>> I'm thinking to cap it to only 5.x kernels (at least first) unless it=
 is
> >>> dead easy to backport below that.
> >>
> >> I have this vauge recollection of pointing at this before and being
> >> told that it had to be __va for some PPC reason?
> >>
> >> Do check with the PPC people first, I see none on the CC list.
> >>
> >> Jason
> >
> > Thanks, added arch/powerpc maintainers.
> >
>
> As far as I can see, memremap() won't work on PPC32 at least:
>
> IIUC, memremap() calls arch_memremap_wb()
> arch_memremap_wb() calls ioremap_cache()
> In case of failure, then ioremap_wt() and ioremap_wc() are tried.
>
> All ioremap calls end up in __ioremap_caller() which will return NULL in =
case you try to ioremap RAM.
>
> So the statement "So instead, use memremap(), which will reuse the linear=
 mapping if
> it is valid, or create another mapping otherwise." seems to be wrong, at =
least for PPC32.
>
> Even for PPC64 which doesn't seem to have the RAM check, I can't see that=
 it will "reuse the linear
> mapping".
>

It is there, please look again. Before any of the above happens,
memremap() will call try_ram_remap() for regions that are covered by a
IORESOURCE_SYSTEM_RAM, and map it using __va() if its PFN is valid and
it is not highmem.

So as far as I can tell, this change has no effect on PPC at all
unless its RAM is not described as IORESOURCE_SYSTEM_RAM.
