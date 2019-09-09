Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFD0ADAB7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Sep 2019 16:06:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46RqhN3rCmzDqNp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 00:06:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d41; helo=mail-io1-xd41.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="eeHn9BXh"; 
 dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46RqcN0r2QzDqNp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 00:02:43 +1000 (AEST)
Received: by mail-io1-xd41.google.com with SMTP id k5so3595358iol.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Sep 2019 07:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8i5dkStrabNHsl7KV3zOIJ5RJgzj90AK9sxoEEJihIo=;
 b=eeHn9BXhrxmfX9aye2EW2AnRlwbqWsP/9UGyIoyui1PwsLNVui38+z8yNFWGuXNTqu
 5DlQJlAfRtR0zTYXc+rsc4XI6CfPNhE9/z7AUsVOQNcRVNG8hPcI+Dma0zWlEef0Kda5
 YmZY1EnK9sf10kNt5oWN1BKtN3GZs3eyExgE3MFlb3ZZUJIklI76U4vYu8upWGzb84cx
 ErpoYjOaD6//OdfwiefUwm5NTEWEi1GRCjyDIELHtp1VGYtZZV/US5AxH68IWdwBPYn2
 7JhSBdpIlpO7vsaPsH0l45+XaG7HyGzH6yYDOU7fUx5bNM1tkUN6StJQcJNtlubK1EM4
 6eKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8i5dkStrabNHsl7KV3zOIJ5RJgzj90AK9sxoEEJihIo=;
 b=ppOoTjvEXycqZUV5B+ei0b8vyxWj2lZCeZu4E3DnnBenkmJkmiVemHxKyfMZqiQG37
 zzymrg5D30lVZrdSDRkW7FUY/Of8FHe4bORUXuIIyXX3LxPWwuXtTqUfz/bRGHKp1HZ7
 vAAYc56DiNc1JLQKzdUfriaIZQTX8TVXKIGkCG7FhpY/t81PTplTP73kl3MMAPNUJQP+
 E/2CAu88juuluZ0fRJc0Xy1iADkNYzaqy1zgG2unDsnAYPtUFrYUWJv2bbizAZmbLTFs
 8JZcn+afCqQNIue2xW/3rDniBGS7jZYPAPBoc4q/hYyC3qO/8CdxQXDzQ/wLOgt1t6RE
 x1zQ==
X-Gm-Message-State: APjAAAVExeFktCX9PAsMDiJAZvs217562ow44GP6unTOxK9GPWBqrj+G
 J1JeYdLDa9sT4aARbIOq1vphStLUy8X7C3ay2Mc=
X-Google-Smtp-Source: APXvYqyL386XCzrPyKA6S2bjdTj5LdfIJF3K+CS7kEa0ci3Yw2WTxtOi9ty8C8PnCPAwjUejB3RRqqLbCMNixIljCqU=
X-Received: by 2002:a6b:bb86:: with SMTP id l128mr18026803iof.18.1568037761702; 
 Mon, 09 Sep 2019 07:02:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190816165101.911-1-s.miroshnichenko@yadro.com>
 <20190816165101.911-19-s.miroshnichenko@yadro.com>
 <026a6bfbfd8268c5158bc48fb43907cc13442561.camel@gmail.com>
 <7af3d4cd-b786-19b1-1ddf-b93f9875976d@yadro.com>
In-Reply-To: <7af3d4cd-b786-19b1-1ddf-b93f9875976d@yadro.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Tue, 10 Sep 2019 00:02:30 +1000
Message-ID: <CAOSf1CG-oaKazKzZCULUjntc+3-dztiQ3U=6tcWu+OGer_77Ag@mail.gmail.com>
Subject: Re: [PATCH v5 18/23] powerpc/pci: Handle BAR movement
To: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
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
Cc: linux-pci@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux@yadro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Sep 7, 2019 at 2:25 AM Sergey Miroshnichenko
<s.miroshnichenko@yadro.com> wrote:
>
> Hi Oliver,
>
> On 9/4/19 8:37 AM, Oliver O'Halloran wrote:
> > On Fri, 2019-08-16 at 19:50 +0300, Sergey Miroshnichenko wrote:
> >> Add pcibios_rescan_prepare()/_done() hooks for the powerpc platform. Now if
> >> the device's driver supports movable BARs, pcibios_rescan_prepare() will be
> >> called after the device is stopped, and pcibios_rescan_done() - before it
> >> resumes. There are no memory requests to this device between the hooks, so
> >> it it safe to rebuild the EEH address cache during that.
> >>
> >> CC: Oliver O'Halloran <oohall@gmail.com>
> >> Signed-off-by: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
> >> ---
> >>  arch/powerpc/kernel/pci-hotplug.c | 10 ++++++++++
> >>  1 file changed, 10 insertions(+)
> >>
> >> diff --git a/arch/powerpc/kernel/pci-hotplug.c b/arch/powerpc/kernel/pci-hotplug.c
> >> index 0b0cf8168b47..18cf13bba228 100644
> >> --- a/arch/powerpc/kernel/pci-hotplug.c
> >> +++ b/arch/powerpc/kernel/pci-hotplug.c
> >> @@ -144,3 +144,13 @@ void pci_hp_add_devices(struct pci_bus *bus)
> >>      pcibios_finish_adding_to_bus(bus);
> >>  }
> >>  EXPORT_SYMBOL_GPL(pci_hp_add_devices);
> >> +
> >> +void pcibios_rescan_prepare(struct pci_dev *pdev)
> >> +{
> >> +    eeh_addr_cache_rmv_dev(pdev);
> >> +}
> >> +
> >> +void pcibios_rescan_done(struct pci_dev *pdev)
> >> +{
> >> +    eeh_addr_cache_insert_dev(pdev);
> >> +}
> >
> > Is this actually sufficent? The PE number for a device is largely
> > determined by the location of the MMIO BARs. If you move a BAR far
> > enough the PE number stored in the eeh_pe would need to be updated as
> > well.
> >
>
> Thanks for the hint! I've checked on our PowerNV: for bridges with MEM
> only it allocates PE numbers starting from 0xff down, and when there
> are MEM64 - starting from 0 up, one PE number per 4GiB.
>
> PEs are allocated during call to pnv_pci_setup_bridge(), and the I've
> added invocation of pci_setup_bridge() after a hotplug event in the
> "Recalculate all bridge windows during rescan" patch of this series.

Sort of.

On PHB3 both the 32bit and the 64bit MMIO windows are split into 256
segments each of which is mapped to a PE number. For the 32bit space
there's a remapping table in hardware that allows arbitrary mapping of
segments to PE numbers, but in the 64bit space the mapping is fixed
with the first segment being PE0, etc. If there's a 64 bit BAR under a
bridge the PE is really "allocated" during the BAR assignment process,
and the setup_bridge() step sets up the EEH state based on that.

It's worth pointing out that this is why the 64bit window is usually
4GB. Bridge windows need to be aligned to a segment boundary to ensure
the devices under them are placed into a unique PE.

> Currently, if a bus already has a PE, pnv_ioda_setup_bus_PE() takes it
> and returns. I can see two ways to change it, both are not difficult to
> implement:
>
>  a.1) check if MEM64 BARs appeared below the bus - allocate and assign
>       a new master PE with required number of slave PEs;
>
>  a.2) if the bus now has more MEM64 than before - check if more slave
>       PEs must be reserved;
>
>  b) release all the PEs before a PCI rescan and allocate+assign them
>     again after - with this approach the "Hook up the writes to
>     PCI_SECONDARY_BUS register" patch may be eliminated.
>
> Do you find any of these suitable?

I'm not sure a) would work, but even if it does b) is preferable.
There's a lot of strangeness in the powerpc PCI code as-is without
adding extra code paths to deal with. Keeping what happens at hotplug
consistent with what happens at boot will help keep things sane.

FYI in the next few days I'm going to post a series that rips out the
use of pci_dn in powernv and the generic parts of EEH (pseries still
uses it). Assuming Bjorn isn't picking this up for 5.4 you might want
to wait for that before getting too deep into this.

Oliver
