Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B662BE0E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 06:03:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45CgDM1SvnzDqLf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 14:02:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::143; helo=mail-it1-x143.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dYxqyHL+"; 
 dkim-atps=neutral
Received: from mail-it1-x143.google.com (mail-it1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45CgBr0ZmqzDqJm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2019 14:01:39 +1000 (AEST)
Received: by mail-it1-x143.google.com with SMTP id h20so2047173itk.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 May 2019 21:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zjUv3nPJ7HnSKnPAy37kFrlpSs1ndqPhpkQ4GDIU1O0=;
 b=dYxqyHL+477TUHLXPK+2QfGw9r+JCnOqa53WiAbkxKKaEMeuwCy/UPmSB6nmb1Yj0u
 KYlMf472gcxrD/BVM+E2Fw1j8twcWAr6KH847JOZEM7CdQjxVZqk+UwHwcydvYTQihHw
 1eVUzMCebp70Z3chp9dNlI37XG0C+K6IbUIlCjUErvNo30/rcTpaPWU2X/hepgupxX9v
 eg0qbdtPpVcsCP0ubWSPUBAR9tvlRdwNEOj571H0dbSa9GGc8KLVlmOjHMACTls76zB2
 M/vkSGTkAXLQRonpLVck6/RXxbouWdn+7Hq+OiYEo5bSBMlgnTHA8YBIL2QwuOFKzivq
 aOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zjUv3nPJ7HnSKnPAy37kFrlpSs1ndqPhpkQ4GDIU1O0=;
 b=WJYr3qglLurmm8YYyAqojYm7lhG1MQvH8Pc9n3xUgezsH3Tq3GXvftw5CQiMlDgFYw
 ABX16ADKQ6RHD7J+cSp5PeF4lYjdXC4Ed1rMADttTqntWOKaAEywug1gfTeUEYZLV3PI
 RFf6OKHyUElXkBkPfhcRrRMkinGk1LK5HrflwQxoMffxTfUj54WwY5XdJ+3/isOfBYXw
 c97O2maYTwQ4FpqsFUqOaMSR9MbS8Adp2eEmW4zGPREp3gvoiltLw59pEWjLGj788/MC
 0VD8QikWvxwMRYbmVqnxqNsLBbV03VVswW2WMf1XRCsYLiA4B7Obot2ui1gb8pT+h1YW
 hKNw==
X-Gm-Message-State: APjAAAVNWTDsJzidrIfxI/SPKsHC/UP769/cA2qFo4NdTmfQvSu6tG3/
 W9IUvpRIJuDGI3D6VPGTinWt3v5B8eEkkny5gZo=
X-Google-Smtp-Source: APXvYqy1mxn99so8vKfCz+Sf4gW32dGBxlzGt3ZTO7PZqd3wa9GEtU6jcUUCHFFmtBRz/O38JAC4wzmV/MuC9K94Zcw=
X-Received: by 2002:a24:190e:: with SMTP id b14mr1588278itb.15.1559016096130; 
 Mon, 27 May 2019 21:01:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190527225521.5884-1-shawn@anastas.io>
In-Reply-To: <20190527225521.5884-1-shawn@anastas.io>
From: Oliver <oohall@gmail.com>
Date: Tue, 28 May 2019 14:01:24 +1000
Message-ID: <CAOSf1CFFyz0YNqdpd5r44MaBV449yoK3WOMBZ1mpgZ=judNfDQ@mail.gmail.com>
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

On Tue, May 28, 2019 at 8:56 AM Shawn Anastasio <shawn@anastas.io> wrote:
>
> Hello all,
>
> This patch set implements support for user-specified PCI resource
> alignment on the pseries platform for hotplugged PCI devices.
> Currently on pseries, PCI resource alignments specified with the
> pci=resource_alignment commandline argument are ignored, since
> the firmware is in charge of managing the PCI resources. In the
> case of hotplugged devices, though, the kernel is in charge of
> configuring the resources and should obey alignment requirements.

Are you using hotplug to work around SLOF (the OF we use under qemu)
not aligning BARs to 64K? It looks like there is a commit in SLOF to
fix that (https://git.qemu.org/?p=SLOF.git;a=commit;f=board-qemu/slof/pci-phb.fs;h=1903174472f8800caf50c959b304501b4c01153c).

> The current behavior of ignoring the alignment for hotplugged devices
> results in sub-page BARs landing between page boundaries and
> becoming un-mappable from userspace via the VFIO framework.
> This issue was observed on a pseries KVM guest with hotplugged
> ivshmem devices.

> With these changes, users can specify an appropriate
> pci=resource_alignment argument on boot for devices they wish to use
> with VFIO.
>
> In the future, this could be extended to provide page-aligned
> resources by default for hotplugged devices, similar to what is done
> on powernv by commit 382746376993 ("powerpc/powernv: Override
> pcibios_default_alignment() to force PCI devices to be page aligned").

Can we make aligning the BARs to PAGE_SIZE the default behaviour? The
BAR assignment process is complex enough as-is so I'd rather we didn't
add another platform hack into the mix.

> Feedback is appreciated.
>
> Thanks,
> Shawn
>
> Shawn Anastasio (3):
>   PCI: Introduce pcibios_ignore_alignment_request
>   powerpc/64: Enable pcibios_after_init hook on ppc64
>   powerpc/pseries: Allow user-specified PCI resource alignment after
>     init
>
>  arch/powerpc/include/asm/machdep.h     |  6 ++++--
>  arch/powerpc/kernel/pci-common.c       |  9 +++++++++
>  arch/powerpc/kernel/pci_64.c           |  4 ++++
>  arch/powerpc/platforms/pseries/setup.c | 22 ++++++++++++++++++++++
>  drivers/pci/pci.c                      |  9 +++++++--
>  5 files changed, 46 insertions(+), 4 deletions(-)
>
> --
> 2.20.1
>
