Return-Path: <linuxppc-dev+bounces-7390-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F22DA75C1C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Mar 2025 22:08:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZQlgn509zz2yMF;
	Mon, 31 Mar 2025 07:08:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1:d65d:64ff:fe57:4e05"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743365301;
	cv=none; b=V2TN3aNyV+ZPhZrDRxSzBnfLMbnO/tGcLK9wXR65dXhLTXKALz4KpRQ5Y7OpauL0stnl+h09vB3i8aO60GUvcJEOHDoXW0LYnRD1dwWwDVRIGpe2NTRAz/WebIDthT86X5a4wyX5HKgB22MhcCJU7aPozAF5IC4szzBE8hj/oHX55BkN7qEcfC9KCDmrM3YN7IW2+9ybD+GfAhu3ypFQxgpvRwdJYT7KolVYZ5zSAWx0dpi66F7RJ1kC0eIW2tPlgAWJouFp7Uxq5WK2JB+bbnqGzSF/zwG+sS1BR/OE1WEHBS4hV3kx+b1NgZXxBm3YK6WCG+EAmmRoXPizZ1LGng==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743365301; c=relaxed/relaxed;
	bh=S3gcKsBiQT1kzFJwB2tZ1/M+Cre0DyC/LdUvo66QFrU=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=OPRxGG2oqApk9N/PJ0OprJyyblCGVhWGXzJsjCeZA8H9CFnvAHySEllOjtke7pEkJyAle7Oza9oHQJJL0YoCd6bB0OqNhRvXq2I9qeFnBB38GZUS6e1Nb3XUp1RRDbfgskuGd0jRL13edHcG3B+JIaOGrmLskR3nkFc7ZJM8SjGaUOQJtWsxzKVMSkFaJvf7iNRdcNguz+VNf6V0letQ/F2yh2M1CvbaK9APU2vh9NOBvY6N3HDqIBs0S/ug81bVPSjWEYzz3bmXRl+PEHxY+VpsPgWLrdYd8aH0rTRjbse9okHjaoUhjLUQ/Wqbi97SQ3O0Bg9l3qpu1zeAMtKe9A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=NyU9U1Ea; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=batv+07442bf8be34e4cbe263+7889+infradead.org+dwmw2@desiato.srs.infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=NyU9U1Ea;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=desiato.srs.infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=batv+07442bf8be34e4cbe263+7889+infradead.org+dwmw2@desiato.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZQlgj1WmRz2yGM
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Mar 2025 07:08:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=S3gcKsBiQT1kzFJwB2tZ1/M+Cre0DyC/LdUvo66QFrU=; b=NyU9U1EaUuVnxvHkZUIJg+dn3Q
	iphTWNVHpmIirhtFC3wci7jMyQJ6sFBjLs2WOHYIXi0f4o4QQ/ZQZpXpFHypCCe0g7xehARLIw4rJ
	9hywBKQ+X5QIzeDy7XdLRb7oJMLGd6eGwnn8L9UdVS25PI7HvmfYZXX0deS0jR23UUeV3NXmsMApI
	+ehvnqOWluZv5G48sOrrTzaWFNF6Flk+KGoutnVO324SmPbDXHuS9VHmFgiueaXZrA1kPce1PujLI
	729y4032fWcrQ0zzXeu6qph/ZRJpP5MjljQWhhUukl0S2KbnhUEuIE3I2fmsmZ/D55zHl1FOSXb+6
	TjF7oIGw==;
Received: from [172.31.31.142] (helo=[127.0.0.1])
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyywj-00000006YOK-0o2k;
	Sun, 30 Mar 2025 20:07:58 +0000
Date: Sun, 30 Mar 2025 21:07:52 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: linuxppc-dev@lists.ozlabs.org, "Michael S. Tsirkin" <mst@redhat.com>
CC: Claire Chang <tientzu@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 mpe@ellerman.id.au, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, heikki.krogerus@linux.intel.com,
 peterz@infradead.org, benh@kernel.crashing.org, grant.likely@arm.com,
 paulus@samba.org, mingo@kernel.org, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>, xypron.glpk@gmx.de,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 xen-devel@lists.xenproject.org, Thierry Reding <treding@nvidia.com>,
 linux-devicetree <devicetree@vger.kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>,
 Robin Murphy <robin.murphy@arm.com>, hch@infradead.org,
 Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 =?ISO-8859-1?Q?Eugenio_P=E9rez?= <eperezma@redhat.com>,
 virtualization@lists.linux.dev, graf@amazon.de
Subject: Re: Using Restricted DMA for virtio-pci
User-Agent: K-9 Mail for Android
In-Reply-To: <20250330125637-mutt-send-email-mst@kernel.org>
References: <20210209062131.2300005-1-tientzu@chromium.org> <979b6a34ca5724ced1d4871b58bf227065d7da57.camel@infradead.org> <20250321142947-mutt-send-email-mst@kernel.org> <d1382a6ee959f22dc5f6628d8648af77f4702418.camel@infradead.org> <8e7084b04e5c0456c0ff32ea131a199c6af763cd.camel@infradead.org> <20250330093532-mutt-send-email-mst@kernel.org> <09fc164ebcfd893ffd67d1b224d6e1c5e5772ee0.camel@infradead.org> <20250330125637-mutt-send-email-mst@kernel.org>
Message-ID: <2C097209-A7C1-4B0B-A505-3B32BE21505A@infradead.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 30 March 2025 17:59:13 BST, "Michael S=2E Tsirkin" <mst@redhat=2Ecom> wr=
ote:
>On Sun, Mar 30, 2025 at 04:07:56PM +0100, David Woodhouse wrote:
>> On Sun, 2025-03-30 at 09:42 -0400, Michael S=2E Tsirkin wrote:
>> > On Fri, Mar 28, 2025 at 05:40:41PM +0000, David Woodhouse wrote:
>> > > On Fri, 2025-03-21 at 18:42 +0000, David Woodhouse wrote:
>> > > > >=20
>> > > > > I don't mind as such (though I don't understand completely), bu=
t since
>> > > > > this is changing the device anyway, I am a bit confused why you=
 can't
>> > > > > just set the VIRTIO_F_ACCESS_PLATFORM feature bit?=C2=A0 This f=
orces DMA API
>> > > > > which will DTRT for you, will it not?
>> > > >=20
>> > > > That would be necessary but not sufficient=2E =2E=2E=2E
>> >=20
>> > could you explain pls?
>>=20
>> There was more to that in the previous email which I elided for this
>> followup=2E
>>=20
>> https://lore=2Ekernel=2Eorg/all/d1382a6ee959f22dc5f6628d8648af77f470241=
8=2Ecamel@infradead=2Eorg/
>>=20
>> > > My first cut at a proposed spec change looks something like this=2E=
 I'll
>> > > post it to the virtio-comment list once I've done some corporate
>> > > bureaucracy and when the list stops sending me python tracebacks in
>> > > response to my subscribe request=2E
>> >=20
>> > the linux foundation one does this? maybe poke at the admins=2E
>> >=20
>> > > In the meantime I'll hack up some QEMU and guest Linux driver suppo=
rt
>> > > to match=2E
>> > >=20
>> > > diff --git a/content=2Etex b/content=2Etex
>> > > index c17ffa6=2E=2E1e6e1d6 100644
>> > > --- a/content=2Etex
>> > > +++ b/content=2Etex
>> > > @@ -773,6 +773,9 @@ \chapter{Reserved Feature Bits}\label{sec:Reser=
ved Feature Bits}
>> > > =C2=A0Currently these device-independent feature bits are defined:
>> > > =C2=A0
>> > > =C2=A0\begin{description}
>> > > +=C2=A0 \item[VIRTIO_F_SWIOTLB (27)] This feature indicates that th=
e device
>> > > +=C2=A0 provides a memory region which is to be used for bounce buf=
fering,
>> > > +=C2=A0 rather than permitting direct memory access to system memor=
y=2E
>> > > =C2=A0=C2=A0 \item[VIRTIO_F_INDIRECT_DESC (28)] Negotiating this fe=
ature indicates
>> > > =C2=A0=C2=A0 that the driver can use descriptors with the VIRTQ_DES=
C_F_INDIRECT
>> > > =C2=A0=C2=A0 flag set, as described in \ref{sec:Basic Facilities of=
 a Virtio
>> > > @@ -885,6 +888,10 @@ \chapter{Reserved Feature Bits}\label{sec:Rese=
rved Feature Bits}
>> > > =C2=A0VIRTIO_F_ACCESS_PLATFORM is not offered, then a driver MUST p=
ass only physical
>> > > =C2=A0addresses to the device=2E
>> > > =C2=A0
>> > > +A driver SHOULD accept VIRTIO_F_SWIOTLB if it is offered, and it M=
UST
>> > > +then pass only addresses within the Software IOTLB bounce buffer t=
o the
>> > > +device=2E
>> > > +
>> > > =C2=A0A driver SHOULD accept VIRTIO_F_RING_PACKED if it is offered=
=2E
>> > > =C2=A0
>> > > =C2=A0A driver SHOULD accept VIRTIO_F_ORDER_PLATFORM if it is offer=
ed=2E
>> > > @@ -921,6 +928,10 @@ \chapter{Reserved Feature Bits}\label{sec:Rese=
rved Feature Bits}
>> > > =C2=A0A device MAY fail to operate further if VIRTIO_F_ACCESS_PLATF=
ORM is not
>> > > =C2=A0accepted=2E
>> > > =C2=A0
>> > > +A device MUST NOT offer VIRTIO_F_SWIOTLB if its transport does not
>> > > +provide a Software IOTLB bounce buffer=2E
>> > > +A device MAY fail to operate further if VIRTIO_F_SWIOTLB is not ac=
cepted=2E
>> > > +
>> > > =C2=A0If VIRTIO_F_IN_ORDER has been negotiated, a device MUST use
>> > > =C2=A0buffers in the same order in which they have been available=
=2E
>> > > =C2=A0
>> > > diff --git a/transport-pci=2Etex b/transport-pci=2Etex
>> > > index a5c6719=2E=2E23e0d57 100644
>> > > --- a/transport-pci=2Etex
>> > > +++ b/transport-pci=2Etex
>> > > @@ -129,6 +129,7 @@ \subsection{Virtio Structure PCI Capabilities}\=
label{sec:Virtio Transport Option
>> > > =C2=A0\item ISR Status
>> > > =C2=A0\item Device-specific configuration (optional)
>> > > =C2=A0\item PCI configuration access
>> > > +\item SWIOTLB bounce buffer
>> > > =C2=A0\end{itemize}
>> > > =C2=A0
>> > > =C2=A0Each structure can be mapped by a Base Address register (BAR)=
 belonging to
>> > > @@ -188,6 +189,8 @@ \subsection{Virtio Structure PCI Capabilities}\=
label{sec:Virtio Transport Option
>> > > =C2=A0#define VIRTIO_PCI_CAP_SHARED_MEMORY_CFG 8
>> > > =C2=A0/* Vendor-specific data */
>> > > =C2=A0#define VIRTIO_PCI_CAP_VENDOR_CFG=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 9
>> > > +/* Software IOTLB bounce buffer */
>> > > +#define VIRTIO_PCI_CAP_SWIOTLB=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 10
>> > > =C2=A0\end{lstlisting}
>> > > =C2=A0
>> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Any other value is=
 reserved for future use=2E
>> > > @@ -744,6 +747,36 @@ \subsubsection{Vendor data capability}\label{s=
ec:Virtio
>> > > =C2=A0The driver MUST qualify the \field{vendor_id} before
>> > > =C2=A0interpreting or writing into the Vendor data capability=2E
>> > > =C2=A0
>> > > +\subsubsection{Software IOTLB bounce buffer capability}\label{sec:=
Virtio
>> > > +Transport Options / Virtio Over PCI Bus / PCI Device Layout /
>> > > +Software IOTLB bounce buffer capability}
>> > > +
>> > > +The optional Software IOTLB bounce buffer capability allows the
>> > > +device to provide a memory region which can be used by the driver
>> > > +driver for bounce buffering=2E This allows a device on the PCI
>> > > +transport to operate without DMA access to system memory addresses=
=2E
>> > > +
>> > > +The Software IOTLB region is referenced by the
>> > > +VIRTIO_PCI_CAP_SWIOTLB capability=2E Bus addresses within the refe=
renced
>> > > +range are not subject to the requirements of the VIRTIO_F_ORDER_PL=
ATFORM
>> > > +capability, if negotiated=2E
>> >=20
>> >=20
>> > why not? an optimization?
>> > A mix of swiotlb and system memory might be very challenging from POV
>> > of ordering=2E
>>=20
>> Conceptually, these addresses are *on* the PCI device=2E If the device =
is
>> accessing addresses which are local to it, they aren't subject to IOMMU
>> translation/filtering because they never even make it to the PCI bus as
>> memory transactions=2E
>>=20
>> >=20
>> > > +
>> > > +\devicenormative{\paragraph}{Software IOTLB bounce buffer capabili=
ty}{Virtio
>> > > +Transport Options / Virtio Over PCI Bus / PCI Device Layout /
>> > > +Software IOTLB bounce buffer capability}
>> > > +
>> > > +Devices which present the Software IOTLB bounce buffer capability
>> > > +SHOULD also offer the VIRTIO_F_SWIOTLB feature=2E
>> > > +
>> > > +\drivernormative{\paragraph}{Software IOTLB bounce buffer capabili=
ty}{Virtio
>> > > +Transport Options / Virtio Over PCI Bus / PCI Device Layout /
>> > > +Software IOTLB bounce buffer capability}
>> > > +
>> > > +The driver SHOULD use the offered buffer in preference to passing =
system
>> > > +memory addresses to the device=2E
>> >=20
>> > Even if not using VIRTIO_F_SWIOTLB? Is that really necessary?
>>=20
>> That part isn't strictly necessary, but I think it makes sense, for
>> cases where the SWIOTLB support is an *optimisation* even if it isn't
>> strictly necessary=2E
>>=20
>> Why might it be an "optimisation"? Well=2E=2E=2E if we're thinking of a=
 model
>> like pKVM where the VMM can't just arbitrarily access guest memory,
>> using the SWIOTLB is a simple way to avoid that (by using the on-board
>> memory instead, which *can* be shared with the VMM)=2E
>>=20
>> But if we want to go to extra lengths to support unenlightened guests,
>> an implementation might choose to just *disable* the memory protection
>> if the guest doesn't negotiate VIRTIO_F_SWIOTLB, instead of breaking
>> that guest=2E
>>=20
>> Or it might have a complicated emulation/snooping of virtqueues in the
>> trusted part of the hypervisor so that it knows which addresses the
>> guest has truly *asked* the VMM to access=2E (And yes, of course that's
>> what an IOMMU is for, but when have you seen hardware companies design
>> a two-stage IOMMU which supports actual PCI passthrough *and* get it
>> right for the hypervisor to 'snoop' on the stage1 page tables to
>> support emulated devices too=2E=2E=2E=2E)
>>=20
>> Ultimately I think it was natural to advertise the location of the
>> buffer with the VIRTIO_PCI_CAP_SWIOTLB capability and then to have the
>> separate VIRTIO_F_SWIOTLB for negotiation=2E=2E=2E leaving the obvious
>> question of what a device should do if it sees one but *not* the other=
=2E
>>=20
>> Obviously you can't have VIRTIO_F_SWIOTLB *without* there actually
>> being a buffer advertised with VIRTIO_PCI_CAP_SWIOTLB (or its
>> equivalent for other transports)=2E But the converse seemed reasonable =
as
>> a *hint* even if the use of the SWIOTLB isn't mandatory=2E
>
>OK but I feel it's more work than you think, so we really need
>a better reason than just "why not"=2E
>
>For example, it's not at all clear to me how the ordering is
>going to work if buffers are in memory but the ring is swiotlb
>or the reverse=2E Ordering will all be messed up=2E

Maybe=2E Although by the time the driver has *observed* the data written t=
o the swiotlb on the device's BAR, it has had to cross the same PCI bus=2E

But sure, we could require all-or-nothing=2E Or require that the SWIOTLB o=
nly be used if the driver negotiates VIRTIO_F_SWIOTLB=2E

Even in the latter case we can still allow for SWIOTLB to either be a requ=
irement or a hint, purely down to whether the device *allows* the driver no=
t to negotiate `VIRTIO_F_SWIOTLB`=2E


