Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 284D62BE6E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 06:53:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ChM45JDfzDqMb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 14:53:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::143; helo=mail-it1-x143.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Num6bmFJ"; 
 dkim-atps=neutral
Received: from mail-it1-x143.google.com (mail-it1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ChKs4t91zDqGg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2019 14:52:49 +1000 (AEST)
Received: by mail-it1-x143.google.com with SMTP id m141so2166921ita.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 May 2019 21:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wx8LK+FLca8yAW2nEFxWKA0g/8vW4SdgqbZC24puim4=;
 b=Num6bmFJNBol+Kw9ZWhsOFk3l1a6j5lmv9mdFK/gp1Q+kuAErZkGs6tqYGoAjiYdZA
 6MYKsXRWCItoQI/4bW5JoSCuqVREty/c1E5yE5Hagq2y6VX9t/EwxuXHVATT2SFb1c8l
 LvHVuuZindy/bG3VCwtjN9kTQyE8kVpYXEDKbZseeM+8M4MvPhEZJS9RACjMMtBeOJ2/
 NgCzY5BrWv1Uwm33KeWad5xUrwTg/D8+q49095U/M68UNY327ufVLmBSjKw3SWeFRbZL
 HimVw8yhPOVWio6YuUOnj/duE0HnWe3w0kCAKu4oP5BXAoRoFKhJ/1gaywlz7wtmf8b+
 iVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wx8LK+FLca8yAW2nEFxWKA0g/8vW4SdgqbZC24puim4=;
 b=lZT2EEPRSa30xnrUmr40dk4j6N0/6e1qx+QP6T5rphQxiwhZ/oA3awZXEDwHkRp1+R
 dPetZKFgWbqVYd18wuc1g12PP+gYFx72it4YseZl6Y+puDtpNA8FKinpVxA/u2fWQkNi
 9xJtuXnhctKovst1Uiy+KurtKanJNxkw4fiAxmi7KPdCyJ8rmuZ8bnQvqvnZTsreTYKP
 TJ5iKOUf/s/lCYRHhspGg+u70SjfRrNyflR+H+AkrTFzuWDuo3JorB7rdN4KurZL4I6/
 F7xJI9XHMnv4JSYNtWeSqHI0XqWgDkHmOXUXct3EvktjeF4djaCaKRiax1NiruWueeq5
 FIHg==
X-Gm-Message-State: APjAAAWeNKmLwZc7qiDqMD6whqS+Q7iPXA0SrcWYs1pX2TwJWo4VAzgg
 OXNsM1tEilcHYv9IUFMjlM3YVLfHz7DDacXYKjk=
X-Google-Smtp-Source: APXvYqyxyjnf3N3ZuvxwWhdhVBd1O4QLo5brN6e/Y+/Q3kvimE1dHdiSAECEYrRRH1DbQs8Xyg0nj2Nwt2AP+nSbWOg=
X-Received: by 2002:a24:d145:: with SMTP id w66mr1686745itg.71.1559019167176; 
 Mon, 27 May 2019 21:52:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190527225521.5884-1-shawn@anastas.io>
 <CAOSf1CFFyz0YNqdpd5r44MaBV449yoK3WOMBZ1mpgZ=judNfDQ@mail.gmail.com>
 <476555b7-b462-d844-57ea-7ca1c6113d9b@anastas.io>
In-Reply-To: <476555b7-b462-d844-57ea-7ca1c6113d9b@anastas.io>
From: Oliver <oohall@gmail.com>
Date: Tue, 28 May 2019 14:52:35 +1000
Message-ID: <CAOSf1CG9LcxPy9cOk0FeNq=pvMCPKVKYU7=tdrMSO+RiqTWr5A@mail.gmail.com>
Subject: Re: [RESEND PATCH 0/3] Allow custom PCI resource alignment on pseries
To: Shawn Anastasio <shawn@anastas.io>
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>, linux-pci@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, rppt@linux.ibm.com,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Paul Mackerras <paulus@samba.org>,
 Bjorn Helgaas <bhelgaas@google.com>, xyjxie@linux.vnet.ibm.com,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 28, 2019 at 2:09 PM Shawn Anastasio <shawn@anastas.io> wrote:
>
>
>
> On 5/27/19 11:01 PM, Oliver wrote:
> > On Tue, May 28, 2019 at 8:56 AM Shawn Anastasio <shawn@anastas.io> wrote:
> >>
> >> Hello all,
> >>
> >> This patch set implements support for user-specified PCI resource
> >> alignment on the pseries platform for hotplugged PCI devices.
> >> Currently on pseries, PCI resource alignments specified with the
> >> pci=resource_alignment commandline argument are ignored, since
> >> the firmware is in charge of managing the PCI resources. In the
> >> case of hotplugged devices, though, the kernel is in charge of
> >> configuring the resources and should obey alignment requirements.
> >
> > Are you using hotplug to work around SLOF (the OF we use under qemu)
> > not aligning BARs to 64K? It looks like there is a commit in SLOF to
> > fix that (https://git.qemu.org/?p=SLOF.git;a=commit;f=board-qemu/slof/pci-phb.fs;h=1903174472f8800caf50c959b304501b4c01153c).
> >
>
> No, my application actually requires PCI hotplug at run-time.
>
> >> The current behavior of ignoring the alignment for hotplugged devices
> >> results in sub-page BARs landing between page boundaries and
> >> becoming un-mappable from userspace via the VFIO framework.
> >> This issue was observed on a pseries KVM guest with hotplugged
> >> ivshmem devices.
> >
> >> With these changes, users can specify an appropriate
> >> pci=resource_alignment argument on boot for devices they wish to use
> >> with VFIO.
> >>
> >> In the future, this could be extended to provide page-aligned
> >> resources by default for hotplugged devices, similar to what is done
> >> on powernv by commit 382746376993 ("powerpc/powernv: Override
> >> pcibios_default_alignment() to force PCI devices to be page aligned").
> >
> > Can we make aligning the BARs to PAGE_SIZE the default behaviour? The
> > BAR assignment process is complex enough as-is so I'd rather we didn't
> > add another platform hack into the mix.
>
> Absolutely. This will still require the existing changes so that the
> custom alignment isn't flat-out ignored on pseries, but I can set
> it to default to PAGE_SIZE as well, similar to how it's done on PowerNV.
> I've just pushed a v3 to fix a typo and I'll incorporate this change
> in v4.

I was thinking we could get rid of the ppcmd callback and do it in
kernel/pci-common.c. PowerNV is the only platform that implements the
callback and the pseries implementation is going to be identical so I
don't think there's much of point in keeping the callback.

> >> Feedback is appreciated.
> >>
> >> Thanks,
> >> Shawn
> >>
> >> Shawn Anastasio (3):
> >>    PCI: Introduce pcibios_ignore_alignment_request
> >>    powerpc/64: Enable pcibios_after_init hook on ppc64
> >>    powerpc/pseries: Allow user-specified PCI resource alignment after
> >>      init
> >>
> >>   arch/powerpc/include/asm/machdep.h     |  6 ++++--
> >>   arch/powerpc/kernel/pci-common.c       |  9 +++++++++
> >>   arch/powerpc/kernel/pci_64.c           |  4 ++++
> >>   arch/powerpc/platforms/pseries/setup.c | 22 ++++++++++++++++++++++
> >>   drivers/pci/pci.c                      |  9 +++++++--
> >>   5 files changed, 46 insertions(+), 4 deletions(-)
> >>
> >> --
> >> 2.20.1
> >>
