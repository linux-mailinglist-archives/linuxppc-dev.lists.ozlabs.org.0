Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 949A72EE8E6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jan 2021 23:40:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DBh5w0jfHzDqvg
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jan 2021 09:40:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::d29;
 helo=mail-io1-xd29.google.com; envelope-from=tientzu@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=SoKXOKPj; dkim-atps=neutral
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DBYZf2Nb1zDqVm
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Jan 2021 04:46:46 +1100 (AEDT)
Received: by mail-io1-xd29.google.com with SMTP id z5so6928367iob.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Jan 2021 09:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lmRpyU02tzYzNNegjIihcCxZyXW1d2vZ/GdMFK5mnJk=;
 b=SoKXOKPjPIj0bNZqjL8jd3g1x++IpRUGavBgQZB48yjMr3FErg0/LB8QoBzIcQt/ka
 3uw3LzC05V0NXsnGkX2E/jViOUmBeqfz+Dm7BPkaUOwck9GE68NEStaDUzo2Ps4jBT44
 o0xJvs9naSndqu5VCEiuqFkwP8CanbrdeGCSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lmRpyU02tzYzNNegjIihcCxZyXW1d2vZ/GdMFK5mnJk=;
 b=cX2pDJtqmmj+Sj+cjZKvxYKkbEK7DLrX5aGOeWx/BZVpFtH+tt1u0d23ldTjHT1t5G
 Prsychf+hX0jUGlnu3KfueyViDnVLab70KzbfCP+RMVIqXKGBhHIiixIjS+X35mDrLdg
 xhEoAZdPhQHrMyl2SF1OY+V0WMQusNKuYogJftumv1HQu7OhlC3kKqnMMece0TDzF7nq
 GyKCbUD/+2BhET9kOqWnt4L7R2ub/uAG8NeXB6MLhDGpF0HgZ48ncdg2KMxiQDI9lfm/
 2SPOmrRC+dk0SV8nMe6KqVqwobCKk1590LKP+PMUtCkFmSEq5c4RLcYwP7nxyhKjaSx5
 6LmA==
X-Gm-Message-State: AOAM532zlqBQHfwrNGfGr1ImBSQHvWCLwmDqM4lvGFE4FRR6cia7rVWI
 BNCLuklxweNHRFZjD6/mTtG1CODRM6OwuDGG
X-Google-Smtp-Source: ABdhPJwKeaJAG/JXBq6iIl6+81OOKPLNhuo1RjIMcJ+dZTX4dgxygSxAEpmRiMLh1q4Ouy75Yv5Gqg==
X-Received: by 2002:a05:6638:83:: with SMTP id
 v3mr8910297jao.106.1610041603062; 
 Thu, 07 Jan 2021 09:46:43 -0800 (PST)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com.
 [209.85.166.54])
 by smtp.gmail.com with ESMTPSA id f20sm4938002ilr.85.2021.01.07.09.46.42
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 09:46:42 -0800 (PST)
Received: by mail-io1-f54.google.com with SMTP id o6so6931176iob.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Jan 2021 09:46:42 -0800 (PST)
X-Received: by 2002:a02:b709:: with SMTP id g9mr9101800jam.90.1610041143173;
 Thu, 07 Jan 2021 09:39:03 -0800 (PST)
MIME-Version: 1.0
References: <20210106034124.30560-1-tientzu@chromium.org>
 <d7043239-12cf-3636-4726-2e3b90917dc6@gmail.com>
In-Reply-To: <d7043239-12cf-3636-4726-2e3b90917dc6@gmail.com>
From: Claire Chang <tientzu@chromium.org>
Date: Fri, 8 Jan 2021 01:38:51 +0800
X-Gmail-Original-Message-ID: <CALiNf2_stqoY_wKXNgXFOcoSMkjpFhs5ZsM+jr27Z9pgDSJH_A@mail.gmail.com>
Message-ID: <CALiNf2_stqoY_wKXNgXFOcoSMkjpFhs5ZsM+jr27Z9pgDSJH_A@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/6] Restricted DMA
To: Florian Fainelli <f.fainelli@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000006a175905b852ea63"
X-Mailman-Approved-At: Fri, 08 Jan 2021 09:39:06 +1100
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
Cc: heikki.krogerus@linux.intel.com, peterz@infradead.org, grant.likely@arm.com,
 paulus@samba.org, Frank Rowand <frowand.list@gmail.com>, mingo@kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <joro@8bytes.org>,
 rafael.j.wysocki@intel.com, Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 xen-devel@lists.xenproject.org, Thierry Reding <treding@nvidia.com>,
 linux-devicetree <devicetree@vger.kernel.org>, will@kernel.org,
 konrad.wilk@oracle.com, dan.j.williams@intel.com,
 linuxppc-dev@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>,
 boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
 rdunlap@infradead.org, lkml <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, xypron.glpk@gmx.de,
 Robin Murphy <robin.murphy@arm.com>, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--0000000000006a175905b852ea63
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 7, 2021 at 2:48 AM Florian Fainelli <f.fainelli@gmail.com>
wrote:
>
> Hi,
>
> First of all let me say that I am glad that someone is working on a
> upstream solution for this issue, would appreciate if you could CC and
> Jim Quinlan on subsequent submissions.

Sure!

>
>
> On 1/5/21 7:41 PM, Claire Chang wrote:
> > This series implements mitigations for lack of DMA access control on
> > systems without an IOMMU, which could result in the DMA accessing the
> > system memory at unexpected times and/or unexpected addresses, possibly
> > leading to data leakage or corruption.
> >
> > For example, we plan to use the PCI-e bus for Wi-Fi and that PCI-e bus
is
> > not behind an IOMMU. As PCI-e, by design, gives the device full access
to
> > system memory, a vulnerability in the Wi-Fi firmware could easily
escalate
> > to a full system exploit (remote wifi exploits: [1a], [1b] that shows a
> > full chain of exploits; [2], [3]).
> >
> > To mitigate the security concerns, we introduce restricted DMA.
Restricted
> > DMA utilizes the existing swiotlb to bounce streaming DMA in and out of
a
> > specially allocated region and does memory allocation from the same
region.
> > The feature on its own provides a basic level of protection against the
DMA
> > overwriting buffer contents at unexpected times. However, to protect
> > against general data leakage and system memory corruption, the system
needs
> > to provide a way to restrict the DMA to a predefined memory region
(this is
> > usually done at firmware level, e.g. in ATF on some ARM platforms).
>
> Can you explain how ATF gets involved and to what extent it does help,
> besides enforcing a secure region from the ARM CPU's perpsective? Does
> the PCIe root complex not have an IOMMU but can somehow be denied access
> to a region that is marked NS=0 in the ARM CPU's MMU? If so, that is
> still some sort of basic protection that the HW enforces, right?

We need the ATF support for memory MPU (memory protection unit).
Restricted DMA (with reserved-memory in dts) makes sure the predefined
memory
region is for PCIe DMA only, but we still need MPU to locks down PCIe
access to
that specific regions.

>
> On Broadcom STB SoCs we have had something similar for a while however
> and while we don't have an IOMMU for the PCIe bridge, we do have a a
> basic protection mechanism whereby we can configure a region in DRAM to
> be PCIe read/write and CPU read/write which then gets used as the PCIe
> inbound region for the PCIe EP. By default the PCIe bridge is not
> allowed access to DRAM so we must call into a security agent to allow
> the PCIe bridge to access the designated DRAM region.
>
> We have done this using a private CMA area region assigned via Device
> Tree, assigned with a and requiring the PCIe EP driver to use
> dma_alloc_from_contiguous() in order to allocate from this device
> private CMA area. The only drawback with that approach is that it
> requires knowing how much memory you need up front for buffers and DMA
> descriptors that the PCIe EP will need to process. The problem is that
> it requires driver modifications and that does not scale over the number
> of PCIe EP drivers, some we absolutely do not control, but there is no
> need to bounce buffer. Your approach scales better across PCIe EP
> drivers however it does require bounce buffering which could be a
> performance hit.

Only the streaming DMA (map/unmap) needs bounce buffering.
I also added alloc/free support in this series
(https://lore.kernel.org/patchwork/patch/1360995/), so dma_direct_alloc()
will
try to allocate memory from the predefined memory region.

As for the performance hit, it should be similar to the default swiotlb.
Here are my experiment results. Both SoCs lack IOMMU for PCIe.

PCIe wifi vht80 throughput -

  MTK SoC                  tcp_tx     tcp_rx    udp_tx   udp_rx
  w/o Restricted DMA  244.1     134.66   312.56   350.79
  w/ Restricted DMA    246.95   136.59   363.21   351.99

  Rockchip SoC           tcp_tx     tcp_rx    udp_tx   udp_rx
  w/o Restricted DMA  237.87   133.86   288.28   361.88
  w/ Restricted DMA    256.01   130.95   292.28   353.19

The CPU usage doesn't increase too much either.
Although I didn't measure the CPU usage very precisely, it's ~3% with a
single
big core (Cortex-A72) and ~5% with a single small core (Cortex-A53).

Thanks!
>
> Thanks!


On Thu, Jan 7, 2021 at 2:48 AM Florian Fainelli <f.fainelli@gmail.com>
wrote:

> Hi,
>
> First of all let me say that I am glad that someone is working on a
> upstream solution for this issue, would appreciate if you could CC and
> Jim Quinlan on subsequent submissions.
>
> On 1/5/21 7:41 PM, Claire Chang wrote:
> > This series implements mitigations for lack of DMA access control on
> > systems without an IOMMU, which could result in the DMA accessing the
> > system memory at unexpected times and/or unexpected addresses, possibly
> > leading to data leakage or corruption.
> >
> > For example, we plan to use the PCI-e bus for Wi-Fi and that PCI-e bus is
> > not behind an IOMMU. As PCI-e, by design, gives the device full access to
> > system memory, a vulnerability in the Wi-Fi firmware could easily
> escalate
> > to a full system exploit (remote wifi exploits: [1a], [1b] that shows a
> > full chain of exploits; [2], [3]).
> >
> > To mitigate the security concerns, we introduce restricted DMA.
> Restricted
> > DMA utilizes the existing swiotlb to bounce streaming DMA in and out of a
> > specially allocated region and does memory allocation from the same
> region.
> > The feature on its own provides a basic level of protection against the
> DMA
> > overwriting buffer contents at unexpected times. However, to protect
> > against general data leakage and system memory corruption, the system
> needs
> > to provide a way to restrict the DMA to a predefined memory region (this
> is
> > usually done at firmware level, e.g. in ATF on some ARM platforms).
>
> Can you explain how ATF gets involved and to what extent it does help,
> besides enforcing a secure region from the ARM CPU's perpsective? Does
> the PCIe root complex not have an IOMMU but can somehow be denied access
> to a region that is marked NS=0 in the ARM CPU's MMU? If so, that is
> still some sort of basic protection that the HW enforces, right?
>
> On Broadcom STB SoCs we have had something similar for a while however
> and while we don't have an IOMMU for the PCIe bridge, we do have a a
> basic protection mechanism whereby we can configure a region in DRAM to
> be PCIe read/write and CPU read/write which then gets used as the PCIe
> inbound region for the PCIe EP. By default the PCIe bridge is not
> allowed access to DRAM so we must call into a security agent to allow
> the PCIe bridge to access the designated DRAM region.
>
> We have done this using a private CMA area region assigned via Device
> Tree, assigned with a and requiring the PCIe EP driver to use
> dma_alloc_from_contiguous() in order to allocate from this device
> private CMA area. The only drawback with that approach is that it
> requires knowing how much memory you need up front for buffers and DMA
> descriptors that the PCIe EP will need to process. The problem is that
> it requires driver modifications and that does not scale over the number
> of PCIe EP drivers, some we absolutely do not control, but there is no
> need to bounce buffer. Your approach scales better across PCIe EP
> drivers however it does require bounce buffering which could be a
> performance hit.
>
> Thanks!
> --
> Florian
>

--0000000000006a175905b852ea63
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Thu, Jan 7, 2021 at 2:48 AM Florian Fainelli &lt;<a hre=
f=3D"mailto:f.fainelli@gmail.com">f.fainelli@gmail.com</a>&gt; wrote:<br>&g=
t;<br>&gt; Hi,<br>&gt;<br>&gt; First of all let me say that I am glad that =
someone is working on a<br>&gt; upstream solution for this issue, would app=
reciate if you could CC and<br>&gt; Jim Quinlan on subsequent submissions.<=
br><br>Sure!<br><br>&gt;<br>&gt;<br>&gt; On 1/5/21 7:41 PM, Claire Chang wr=
ote:<br>&gt; &gt; This series implements mitigations for lack of DMA access=
 control on<br>&gt; &gt; systems without an IOMMU, which could result in th=
e DMA accessing the<br>&gt; &gt; system memory at unexpected times and/or u=
nexpected addresses, possibly<br>&gt; &gt; leading to data leakage or corru=
ption.<br>&gt; &gt;<br>&gt; &gt; For example, we plan to use the PCI-e bus =
for Wi-Fi and that PCI-e bus is<br>&gt; &gt; not behind an IOMMU. As PCI-e,=
 by design, gives the device full access to<br>&gt; &gt; system memory, a v=
ulnerability in the Wi-Fi firmware could easily escalate<br>&gt; &gt; to a =
full system exploit (remote wifi exploits: [1a], [1b] that shows a<br>&gt; =
&gt; full chain of exploits; [2], [3]).<br>&gt; &gt;<br>&gt; &gt; To mitiga=
te the security concerns, we introduce restricted DMA. Restricted<br>&gt; &=
gt; DMA utilizes the existing swiotlb to bounce streaming DMA in and out of=
 a<br>&gt; &gt; specially allocated region and does memory allocation from =
the same region.<br>&gt; &gt; The feature on its own provides a basic level=
 of protection against the DMA<br>&gt; &gt; overwriting buffer contents at =
unexpected times. However, to protect<br>&gt; &gt; against general data lea=
kage and system memory corruption, the system needs<br>&gt; &gt; to provide=
 a way to restrict the DMA to a predefined memory region (this is<br>&gt; &=
gt; usually done at firmware level, e.g. in ATF on some ARM platforms).<br>=
&gt;<br>&gt; Can you explain how ATF gets involved and to what extent it do=
es help,<br>&gt; besides enforcing a secure region from the ARM CPU&#39;s p=
erpsective? Does<br>&gt; the PCIe root complex not have an IOMMU but can so=
mehow be denied access<br>&gt; to a region that is marked NS=3D0 in the ARM=
 CPU&#39;s MMU? If so, that is<br>&gt; still some sort of basic protection =
that the HW enforces, right?<br><font face=3D"arial, sans-serif"><br>We nee=
d the ATF support for memory MPU (memory protection unit).<br>Restricted DM=
A (with reserved-memory in dts) makes sure the predefined memory</font><div=
><font face=3D"arial, sans-serif">region is for PCIe DMA only, but we still=
 need MPU to locks down PCIe access to</font></div><div><font face=3D"arial=
, sans-serif">that specific regions.<br><br>&gt;<br>&gt; On Broadcom STB So=
Cs we have had something similar for a while however<br>&gt; and while we d=
on&#39;t have an IOMMU for the PCIe bridge, we do have a a<br>&gt; basic pr=
otection mechanism whereby we can configure a region in DRAM to<br>&gt; be =
PCIe read/write and CPU read/write which then gets used as the PCIe<br>&gt;=
 inbound region for the PCIe EP. By default the PCIe bridge is not<br>&gt; =
allowed access to DRAM so we must call into a security agent to allow<br>&g=
t; the PCIe bridge to access the designated DRAM region.<br>&gt;<br>&gt; We=
 have done this using a private CMA area region assigned via Device<br>&gt;=
 Tree, assigned with a and requiring the PCIe EP driver to use<br>&gt; dma_=
alloc_from_contiguous() in order to allocate from this device<br>&gt; priva=
te CMA area. The only drawback with that approach is that it<br>&gt; requir=
es knowing how much memory you need up front for buffers and DMA<br>&gt; de=
scriptors that the PCIe EP will need to process. The problem is that<br>&gt=
; it requires driver modifications and that does not scale over the number<=
br>&gt; of PCIe EP drivers, some we absolutely do not control, but there is=
 no<br>&gt; need to bounce buffer. Your approach scales better across PCIe =
EP<br>&gt; drivers however it does require bounce buffering which could be =
a<br>&gt; performance hit.<br><br>Only the streaming DMA (map/unmap) needs =
bounce buffering.<br>I also added alloc/free support in this series<br>(<a =
href=3D"https://lore.kernel.org/patchwork/patch/1360995/">https://lore.kern=
el.org/patchwork/patch/1360995/</a>), so dma_direct_alloc() will</font></di=
v><div><font face=3D"arial, sans-serif">try to allocate memory from the pre=
defined memory region.<br><br>As for the performance hit, it should be simi=
lar to the default swiotlb.<br>Here are my experiment results. Both SoCs la=
ck IOMMU for PCIe.<br><br>PCIe wifi vht80 throughput -<br><br>=C2=A0 MTK So=
C =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcp_tx =C2=
=A0 =C2=A0 tcp_rx =C2=A0 =C2=A0udp_tx =C2=A0 udp_rx<br>=C2=A0 w/o Restricte=
d DMA =C2=A0244.1 =C2=A0 =C2=A0 134.66 =C2=A0 312.56 =C2=A0 350.79<br>=C2=
=A0 w/ Restricted DMA =C2=A0 =C2=A0246.95 =C2=A0 136.59 =C2=A0 363.21 =C2=
=A0 351.99<br><br>=C2=A0 Rockchip SoC =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tc=
p_tx =C2=A0 =C2=A0 tcp_rx =C2=A0 =C2=A0udp_tx =C2=A0 udp_rx<br>=C2=A0 w/o R=
estricted DMA =C2=A0237.87 =C2=A0 133.86 =C2=A0 288.28 =C2=A0 361.88<br>=C2=
=A0 w/ Restricted DMA =C2=A0 =C2=A0256.01 =C2=A0 130.95 =C2=A0 292.28 =C2=
=A0 353.19<br><br>The CPU usage doesn&#39;t increase too much either.<br>Al=
though I didn&#39;t measure the CPU usage very precisely, it&#39;s ~3% with=
 a single</font></div><div><font face=3D"arial, sans-serif">big core (Corte=
x-A72) and ~5% with a single small core (Cortex-A53).<br><br>Thanks!<br>&gt=
;<br>&gt; Thanks!</font></div></div><br><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 7, 2021 at 2:48 AM Florian Fa=
inelli &lt;<a href=3D"mailto:f.fainelli@gmail.com">f.fainelli@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<=
br>
<br>
First of all let me say that I am glad that someone is working on a<br>
upstream solution for this issue, would appreciate if you could CC and<br>
Jim Quinlan on subsequent submissions.<br>
<br>
On 1/5/21 7:41 PM, Claire Chang wrote:<br>
&gt; This series implements mitigations for lack of DMA access control on<b=
r>
&gt; systems without an IOMMU, which could result in the DMA accessing the<=
br>
&gt; system memory at unexpected times and/or unexpected addresses, possibl=
y<br>
&gt; leading to data leakage or corruption.<br>
&gt; <br>
&gt; For example, we plan to use the PCI-e bus for Wi-Fi and that PCI-e bus=
 is<br>
&gt; not behind an IOMMU. As PCI-e, by design, gives the device full access=
 to<br>
&gt; system memory, a vulnerability in the Wi-Fi firmware could easily esca=
late<br>
&gt; to a full system exploit (remote wifi exploits: [1a], [1b] that shows =
a<br>
&gt; full chain of exploits; [2], [3]).<br>
&gt; <br>
&gt; To mitigate the security concerns, we introduce restricted DMA. Restri=
cted<br>
&gt; DMA utilizes the existing swiotlb to bounce streaming DMA in and out o=
f a<br>
&gt; specially allocated region and does memory allocation from the same re=
gion.<br>
&gt; The feature on its own provides a basic level of protection against th=
e DMA<br>
&gt; overwriting buffer contents at unexpected times. However, to protect<b=
r>
&gt; against general data leakage and system memory corruption, the system =
needs<br>
&gt; to provide a way to restrict the DMA to a predefined memory region (th=
is is<br>
&gt; usually done at firmware level, e.g. in ATF on some ARM platforms).<br=
>
<br>
Can you explain how ATF gets involved and to what extent it does help,<br>
besides enforcing a secure region from the ARM CPU&#39;s perpsective? Does<=
br>
the PCIe root complex not have an IOMMU but can somehow be denied access<br=
>
to a region that is marked NS=3D0 in the ARM CPU&#39;s MMU? If so, that is<=
br>
still some sort of basic protection that the HW enforces, right?<br>
<br>
On Broadcom STB SoCs we have had something similar for a while however<br>
and while we don&#39;t have an IOMMU for the PCIe bridge, we do have a a<br=
>
basic protection mechanism whereby we can configure a region in DRAM to<br>
be PCIe read/write and CPU read/write which then gets used as the PCIe<br>
inbound region for the PCIe EP. By default the PCIe bridge is not<br>
allowed access to DRAM so we must call into a security agent to allow<br>
the PCIe bridge to access the designated DRAM region.<br>
<br>
We have done this using a private CMA area region assigned via Device<br>
Tree, assigned with a and requiring the PCIe EP driver to use<br>
dma_alloc_from_contiguous() in order to allocate from this device<br>
private CMA area. The only drawback with that approach is that it<br>
requires knowing how much memory you need up front for buffers and DMA<br>
descriptors that the PCIe EP will need to process. The problem is that<br>
it requires driver modifications and that does not scale over the number<br=
>
of PCIe EP drivers, some we absolutely do not control, but there is no<br>
need to bounce buffer. Your approach scales better across PCIe EP<br>
drivers however it does require bounce buffering which could be a<br>
performance hit.<br>
<br>
Thanks!<br>
-- <br>
Florian<br>
</blockquote></div>

--0000000000006a175905b852ea63--
