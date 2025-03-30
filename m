Return-Path: <linuxppc-dev+bounces-7387-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD75A75A7B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Mar 2025 17:08:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZQd2C1TC1z2ySW;
	Mon, 31 Mar 2025 02:08:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1:d65d:64ff:fe57:4e05"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743347331;
	cv=none; b=LeHSckdcPdcAFYxV317yfA13loVoqDrFiSlKT9/hVFalqcv27ot0EqFgpXOmXebQA5NWwf6wvLr2BUtUt4Hyk6B0R5Za4lDx9szAIdKgH5zMau2nUqP9yz8/j/q1/FTLmaZJ+qGbtDS/THVIkOK3vhU5Z9t11lVNCmLPqpMN8Apv3CSgD+6bAPvlSX9fPCMixxYIqjfm7pttNuH5dNUPeDZXii0d+G4OtGEKhmdevGQfobU5Ja+TDwuWbQvgXz4uqIn55TuHLJ6D05w7pmYoJNewFw+1p26ejz4cxYv4ehC6NTFvvcnKeV7YyWe+PZQ0e6qbNiyKCKBKTqzIvIBO7w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743347331; c=relaxed/relaxed;
	bh=3yJoXS3aoVCn5SRdxH72qtXJLR3Q44bN3jSoRVPocdk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TBmULjvL5a554xCp4H8yjnu4yT8YunvpURkh13HZlY5nl8eQ3P5cUvPWzXV7ewzHlR//uTKgVD0P8sGo+MPBd0jWX3bGmkpuCu6DrgFNe8bhU6hekfGM6Z9q19/IerWn7HDx1gWQTZMFjO5whl/1tUN7lE3JZC1tu5VR6eUUpKrQCyhXmm8aI+RxnQufvjF2CE6uOPuK2AJ9IsVuM964txjyFLFD6CSqack+mn0NYCde5nDri/7wh1ngXmOy5uZQsyhT0Pr2cTWmrtoRsf5R8PIXQ+n8IL4j98npjtZIa2IoMQqJ1t13Y9NbT8egmmuLTByf+d2xIwiJteHsw7q6AA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=batv+07442bf8be34e4cbe263+7889+infradead.org+dwmw2@desiato.srs.infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=desiato.srs.infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=batv+07442bf8be34e4cbe263+7889+infradead.org+dwmw2@desiato.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZQd222rNfz2yS4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Mar 2025 02:08:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3yJoXS3aoVCn5SRdxH72qtXJLR3Q44bN3jSoRVPocdk=; b=QN4IF3SSgnWBqSpbejxiqnd0/E
	fXeGCBHfJpUStt9wEbS0sCNgkzHOK4byeQg7TdWDATfLPPTGJBUxr7xdK8J/fQaBquYU2Jzi/VIXW
	UFglLl6KXBMNne0T51xU/ckBAmn0Lp4t9rwucDWk41GYnVeoj4zZ/wrgOOFn5UESYeCRNxEQutm5S
	ESTXR7p0cTu3pnJkLchK1fDz1ewQOxGv85uidxiZ2JRqBgsB/cFw0RGjc92pTH7uFRFZwdSc+sUqT
	PQ7XSy+/6aAHgk0Rt4uaqhODrMEa+tlkEdzJxTHJAAB/1toiaC9TQivieMdtAhqm7RrKLleFmbYor
	xbBtCppg==;
Received: from [172.31.31.145] (helo=u09cd745991455d.ant.amazon.com)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyuGS-00000006Wxz-2VMu;
	Sun, 30 Mar 2025 15:07:56 +0000
Message-ID: <09fc164ebcfd893ffd67d1b224d6e1c5e5772ee0.camel@infradead.org>
Subject: Re: Using Restricted DMA for virtio-pci
From: David Woodhouse <dwmw2@infradead.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Claire Chang <tientzu@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 mpe@ellerman.id.au, Joerg Roedel <joro@8bytes.org>, Will Deacon
 <will@kernel.org>,  Frank Rowand <frowand.list@gmail.com>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>,  boris.ostrovsky@oracle.com,
 jgross@suse.com, Christoph Hellwig <hch@lst.de>,  Marek Szyprowski
 <m.szyprowski@samsung.com>, heikki.krogerus@linux.intel.com,
 peterz@infradead.org,  benh@kernel.crashing.org, grant.likely@arm.com,
 paulus@samba.org, mingo@kernel.org,  sstabellini@kernel.org, Saravana
 Kannan <saravanak@google.com>,  xypron.glpk@gmx.de, "Rafael J . Wysocki"
 <rafael.j.wysocki@intel.com>,  Bartosz Golaszewski
 <bgolaszewski@baylibre.com>, xen-devel@lists.xenproject.org, Thierry Reding
 <treding@nvidia.com>,  linux-devicetree <devicetree@vger.kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Nicolas Boichat <drinkcat@chromium.org>, 
 Dan Williams <dan.j.williams@intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, Jim
 Quinlan <james.quinlan@broadcom.com>,  Robin Murphy <robin.murphy@arm.com>,
 hch@infradead.org, Jason Wang <jasowang@redhat.com>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>, Eugenio =?ISO-8859-1?Q?P=E9rez?=
 <eperezma@redhat.com>, virtualization@lists.linux.dev, graf@amazon.de
Date: Sun, 30 Mar 2025 16:07:56 +0100
In-Reply-To: <20250330093532-mutt-send-email-mst@kernel.org>
References: <20210209062131.2300005-1-tientzu@chromium.org>
	 <979b6a34ca5724ced1d4871b58bf227065d7da57.camel@infradead.org>
	 <20250321142947-mutt-send-email-mst@kernel.org>
	 <d1382a6ee959f22dc5f6628d8648af77f4702418.camel@infradead.org>
	 <8e7084b04e5c0456c0ff32ea131a199c6af763cd.camel@infradead.org>
	 <20250330093532-mutt-send-email-mst@kernel.org>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-mYzUro773zg9T/uQYbOm"
User-Agent: Evolution 3.52.3-0ubuntu1 
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
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.1
	OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--=-mYzUro773zg9T/uQYbOm
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2025-03-30 at 09:42 -0400, Michael S. Tsirkin wrote:
> On Fri, Mar 28, 2025 at 05:40:41PM +0000, David Woodhouse wrote:
> > On Fri, 2025-03-21 at 18:42 +0000, David Woodhouse wrote:
> > > >=20
> > > > I don't mind as such (though I don't understand completely), but si=
nce
> > > > this is changing the device anyway, I am a bit confused why you can=
't
> > > > just set the VIRTIO_F_ACCESS_PLATFORM feature bit?=C2=A0 This force=
s DMA API
> > > > which will DTRT for you, will it not?
> > >=20
> > > That would be necessary but not sufficient. ...
>=20
> could you explain pls?

There was more to that in the previous email which I elided for this
followup.

https://lore.kernel.org/all/d1382a6ee959f22dc5f6628d8648af77f4702418.camel@=
infradead.org/

> > My first cut at a proposed spec change looks something like this. I'll
> > post it to the virtio-comment list once I've done some corporate
> > bureaucracy and when the list stops sending me python tracebacks in
> > response to my subscribe request.
>=20
> the linux foundation one does this? maybe poke at the admins.
>=20
> > In the meantime I'll hack up some QEMU and guest Linux driver support
> > to match.
> >=20
> > diff --git a/content.tex b/content.tex
> > index c17ffa6..1e6e1d6 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -773,6 +773,9 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved =
Feature Bits}
> > =C2=A0Currently these device-independent feature bits are defined:
> > =C2=A0
> > =C2=A0\begin{description}
> > +=C2=A0 \item[VIRTIO_F_SWIOTLB (27)] This feature indicates that the de=
vice
> > +=C2=A0 provides a memory region which is to be used for bounce bufferi=
ng,
> > +=C2=A0 rather than permitting direct memory access to system memory.
> > =C2=A0=C2=A0 \item[VIRTIO_F_INDIRECT_DESC (28)] Negotiating this featur=
e indicates
> > =C2=A0=C2=A0 that the driver can use descriptors with the VIRTQ_DESC_F_=
INDIRECT
> > =C2=A0=C2=A0 flag set, as described in \ref{sec:Basic Facilities of a V=
irtio
> > @@ -885,6 +888,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved=
 Feature Bits}
> > =C2=A0VIRTIO_F_ACCESS_PLATFORM is not offered, then a driver MUST pass =
only physical
> > =C2=A0addresses to the device.
> > =C2=A0
> > +A driver SHOULD accept VIRTIO_F_SWIOTLB if it is offered, and it MUST
> > +then pass only addresses within the Software IOTLB bounce buffer to th=
e
> > +device.
> > +
> > =C2=A0A driver SHOULD accept VIRTIO_F_RING_PACKED if it is offered.
> > =C2=A0
> > =C2=A0A driver SHOULD accept VIRTIO_F_ORDER_PLATFORM if it is offered.
> > @@ -921,6 +928,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved=
 Feature Bits}
> > =C2=A0A device MAY fail to operate further if VIRTIO_F_ACCESS_PLATFORM =
is not
> > =C2=A0accepted.
> > =C2=A0
> > +A device MUST NOT offer VIRTIO_F_SWIOTLB if its transport does not
> > +provide a Software IOTLB bounce buffer.
> > +A device MAY fail to operate further if VIRTIO_F_SWIOTLB is not accept=
ed.
> > +
> > =C2=A0If VIRTIO_F_IN_ORDER has been negotiated, a device MUST use
> > =C2=A0buffers in the same order in which they have been available.
> > =C2=A0
> > diff --git a/transport-pci.tex b/transport-pci.tex
> > index a5c6719..23e0d57 100644
> > --- a/transport-pci.tex
> > +++ b/transport-pci.tex
> > @@ -129,6 +129,7 @@ \subsection{Virtio Structure PCI Capabilities}\labe=
l{sec:Virtio Transport Option
> > =C2=A0\item ISR Status
> > =C2=A0\item Device-specific configuration (optional)
> > =C2=A0\item PCI configuration access
> > +\item SWIOTLB bounce buffer
> > =C2=A0\end{itemize}
> > =C2=A0
> > =C2=A0Each structure can be mapped by a Base Address register (BAR) bel=
onging to
> > @@ -188,6 +189,8 @@ \subsection{Virtio Structure PCI Capabilities}\labe=
l{sec:Virtio Transport Option
> > =C2=A0#define VIRTIO_PCI_CAP_SHARED_MEMORY_CFG 8
> > =C2=A0/* Vendor-specific data */
> > =C2=A0#define VIRTIO_PCI_CAP_VENDOR_CFG=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 9
> > +/* Software IOTLB bounce buffer */
> > +#define VIRTIO_PCI_CAP_SWIOTLB=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 10
> > =C2=A0\end{lstlisting}
> > =C2=A0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Any other value is res=
erved for future use.
> > @@ -744,6 +747,36 @@ \subsubsection{Vendor data capability}\label{sec:V=
irtio
> > =C2=A0The driver MUST qualify the \field{vendor_id} before
> > =C2=A0interpreting or writing into the Vendor data capability.
> > =C2=A0
> > +\subsubsection{Software IOTLB bounce buffer capability}\label{sec:Virt=
io
> > +Transport Options / Virtio Over PCI Bus / PCI Device Layout /
> > +Software IOTLB bounce buffer capability}
> > +
> > +The optional Software IOTLB bounce buffer capability allows the
> > +device to provide a memory region which can be used by the driver
> > +driver for bounce buffering. This allows a device on the PCI
> > +transport to operate without DMA access to system memory addresses.
> > +
> > +The Software IOTLB region is referenced by the
> > +VIRTIO_PCI_CAP_SWIOTLB capability. Bus addresses within the referenced
> > +range are not subject to the requirements of the VIRTIO_F_ORDER_PLATFO=
RM
> > +capability, if negotiated.
>=20
>=20
> why not? an optimization?
> A mix of swiotlb and system memory might be very challenging from POV
> of ordering.

Conceptually, these addresses are *on* the PCI device. If the device is
accessing addresses which are local to it, they aren't subject to IOMMU
translation/filtering because they never even make it to the PCI bus as
memory transactions.

>=20
> > +
> > +\devicenormative{\paragraph}{Software IOTLB bounce buffer capability}{=
Virtio
> > +Transport Options / Virtio Over PCI Bus / PCI Device Layout /
> > +Software IOTLB bounce buffer capability}
> > +
> > +Devices which present the Software IOTLB bounce buffer capability
> > +SHOULD also offer the VIRTIO_F_SWIOTLB feature.
> > +
> > +\drivernormative{\paragraph}{Software IOTLB bounce buffer capability}{=
Virtio
> > +Transport Options / Virtio Over PCI Bus / PCI Device Layout /
> > +Software IOTLB bounce buffer capability}
> > +
> > +The driver SHOULD use the offered buffer in preference to passing syst=
em
> > +memory addresses to the device.
>=20
> Even if not using VIRTIO_F_SWIOTLB? Is that really necessary?

That part isn't strictly necessary, but I think it makes sense, for
cases where the SWIOTLB support is an *optimisation* even if it isn't
strictly necessary.

Why might it be an "optimisation"? Well... if we're thinking of a model
like pKVM where the VMM can't just arbitrarily access guest memory,
using the SWIOTLB is a simple way to avoid that (by using the on-board
memory instead, which *can* be shared with the VMM).

But if we want to go to extra lengths to support unenlightened guests,
an implementation might choose to just *disable* the memory protection
if the guest doesn't negotiate VIRTIO_F_SWIOTLB, instead of breaking
that guest.

Or it might have a complicated emulation/snooping of virtqueues in the
trusted part of the hypervisor so that it knows which addresses the
guest has truly *asked* the VMM to access. (And yes, of course that's
what an IOMMU is for, but when have you seen hardware companies design
a two-stage IOMMU which supports actual PCI passthrough *and* get it
right for the hypervisor to 'snoop' on the stage1 page tables to
support emulated devices too....)

Ultimately I think it was natural to advertise the location of the
buffer with the VIRTIO_PCI_CAP_SWIOTLB capability and then to have the
separate VIRTIO_F_SWIOTLB for negotiation... leaving the obvious
question of what a device should do if it sees one but *not* the other.

Obviously you can't have VIRTIO_F_SWIOTLB *without* there actually
being a buffer advertised with VIRTIO_PCI_CAP_SWIOTLB (or its
equivalent for other transports). But the converse seemed reasonable as
a *hint* even if the use of the SWIOTLB isn't mandatory.

--=-mYzUro773zg9T/uQYbOm
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCD9Aw
ggSOMIIDdqADAgECAhAOmiw0ECVD4cWj5DqVrT9PMA0GCSqGSIb3DQEBCwUAMGUxCzAJBgNVBAYT
AlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xJDAi
BgNVBAMTG0RpZ2lDZXJ0IEFzc3VyZWQgSUQgUm9vdCBDQTAeFw0yNDAxMzAwMDAwMDBaFw0zMTEx
MDkyMzU5NTlaMEExCzAJBgNVBAYTAkFVMRAwDgYDVQQKEwdWZXJva2V5MSAwHgYDVQQDExdWZXJv
a2V5IFNlY3VyZSBFbWFpbCBHMjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMjvgLKj
jfhCFqxYyRiW8g3cNFAvltDbK5AzcOaR7yVzVGadr4YcCVxjKrEJOgi7WEOH8rUgCNB5cTD8N/Et
GfZI+LGqSv0YtNa54T9D1AWJy08ZKkWvfGGIXN9UFAPMJ6OLLH/UUEgFa+7KlrEvMUupDFGnnR06
aDJAwtycb8yXtILj+TvfhLFhafxroXrflspavejQkEiHjNjtHnwbZ+o43g0/yxjwnarGI3kgcak7
nnI9/8Lqpq79tLHYwLajotwLiGTB71AGN5xK+tzB+D4eN9lXayrjcszgbOv2ZCgzExQUAIt98mre
8EggKs9mwtEuKAhYBIP/0K6WsoMnQCcCAwEAAaOCAVwwggFYMBIGA1UdEwEB/wQIMAYBAf8CAQAw
HQYDVR0OBBYEFIlICOogTndrhuWByNfhjWSEf/xwMB8GA1UdIwQYMBaAFEXroq/0ksuCMS1Ri6en
IZ3zbcgPMA4GA1UdDwEB/wQEAwIBhjAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIweQYI
KwYBBQUHAQEEbTBrMCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5kaWdpY2VydC5jb20wQwYIKwYB
BQUHMAKGN2h0dHA6Ly9jYWNlcnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydEFzc3VyZWRJRFJvb3RD
QS5jcnQwRQYDVR0fBD4wPDA6oDigNoY0aHR0cDovL2NybDMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0
QXNzdXJlZElEUm9vdENBLmNybDARBgNVHSAECjAIMAYGBFUdIAAwDQYJKoZIhvcNAQELBQADggEB
ACiagCqvNVxOfSd0uYfJMiZsOEBXAKIR/kpqRp2YCfrP4Tz7fJogYN4fxNAw7iy/bPZcvpVCfe/H
/CCcp3alXL0I8M/rnEnRlv8ItY4MEF+2T/MkdXI3u1vHy3ua8SxBM8eT9LBQokHZxGUX51cE0kwa
uEOZ+PonVIOnMjuLp29kcNOVnzf8DGKiek+cT51FvGRjV6LbaxXOm2P47/aiaXrDD5O0RF5SiPo6
xD1/ClkCETyyEAE5LRJlXtx288R598koyFcwCSXijeVcRvBB1cNOLEbg7RMSw1AGq14fNe2cH1HG
W7xyduY/ydQt6gv5r21mDOQ5SaZSWC/ZRfLDuEYwggWbMIIEg6ADAgECAhAH5JEPagNRXYDiRPdl
c1vgMA0GCSqGSIb3DQEBCwUAMEExCzAJBgNVBAYTAkFVMRAwDgYDVQQKEwdWZXJva2V5MSAwHgYD
VQQDExdWZXJva2V5IFNlY3VyZSBFbWFpbCBHMjAeFw0yNDEyMzAwMDAwMDBaFw0yODAxMDQyMzU5
NTlaMB4xHDAaBgNVBAMME2R3bXcyQGluZnJhZGVhZC5vcmcwggIiMA0GCSqGSIb3DQEBAQUAA4IC
DwAwggIKAoICAQDali7HveR1thexYXx/W7oMk/3Wpyppl62zJ8+RmTQH4yZeYAS/SRV6zmfXlXaZ
sNOE6emg8WXLRS6BA70liot+u0O0oPnIvnx+CsMH0PD4tCKSCsdp+XphIJ2zkC9S7/yHDYnqegqt
w4smkqUqf0WX/ggH1Dckh0vHlpoS1OoxqUg+ocU6WCsnuz5q5rzFsHxhD1qGpgFdZEk2/c//ZvUN
i12vPWipk8TcJwHw9zoZ/ZrVNybpMCC0THsJ/UEVyuyszPtNYeYZAhOJ41vav1RhZJzYan4a1gU0
kKBPQklcpQEhq48woEu15isvwWh9/+5jjh0L+YNaN0I//nHSp6U9COUG9Z0cvnO8FM6PTqsnSbcc
0j+GchwOHRC7aP2t5v2stVx3KbptaYEzi4MQHxm/0+HQpMEVLLUiizJqS4PWPU6zfQTOMZ9uLQRR
ci+c5xhtMEBszlQDOvEQcyEG+hc++fH47K+MmZz21bFNfoBxLP6bjR6xtPXtREF5lLXxp+CJ6KKS
blPKeVRg/UtyJHeFKAZXO8Zeco7TZUMVHmK0ZZ1EpnZbnAhKE19Z+FJrQPQrlR0gO3lBzuyPPArV
hvWxjlO7S4DmaEhLzarWi/ze7EGwWSuI2eEa/8zU0INUsGI4ywe7vepQz7IqaAovAX0d+f1YjbmC
VsAwjhLmveFjNwIDAQABo4IBsDCCAawwHwYDVR0jBBgwFoAUiUgI6iBOd2uG5YHI1+GNZIR//HAw
HQYDVR0OBBYEFFxiGptwbOfWOtMk5loHw7uqWUOnMDAGA1UdEQQpMCeBE2R3bXcyQGluZnJhZGVh
ZC5vcmeBEGRhdmlkQHdvb2Rob3Uuc2UwFAYDVR0gBA0wCzAJBgdngQwBBQEBMA4GA1UdDwEB/wQE
AwIF4DAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQwewYDVR0fBHQwcjA3oDWgM4YxaHR0
cDovL2NybDMuZGlnaWNlcnQuY29tL1Zlcm9rZXlTZWN1cmVFbWFpbEcyLmNybDA3oDWgM4YxaHR0
cDovL2NybDQuZGlnaWNlcnQuY29tL1Zlcm9rZXlTZWN1cmVFbWFpbEcyLmNybDB2BggrBgEFBQcB
AQRqMGgwJAYIKwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmRpZ2ljZXJ0LmNvbTBABggrBgEFBQcwAoY0
aHR0cDovL2NhY2VydHMuZGlnaWNlcnQuY29tL1Zlcm9rZXlTZWN1cmVFbWFpbEcyLmNydDANBgkq
hkiG9w0BAQsFAAOCAQEAQXc4FPiPLRnTDvmOABEzkIumojfZAe5SlnuQoeFUfi+LsWCKiB8Uextv
iBAvboKhLuN6eG/NC6WOzOCppn4mkQxRkOdLNThwMHW0d19jrZFEKtEG/epZ/hw/DdScTuZ2m7im
8ppItAT6GXD3aPhXkXnJpC/zTs85uNSQR64cEcBFjjoQDuSsTeJ5DAWf8EMyhMuD8pcbqx5kRvyt
JPsWBQzv1Dsdv2LDPLNd/JUKhHSgr7nbUr4+aAP2PHTXGcEBh8lTeYea9p4d5k969pe0OHYMV5aL
xERqTagmSetuIwolkAuBCzA9vulg8Y49Nz2zrpUGfKGOD0FMqenYxdJHgDCCBZswggSDoAMCAQIC
EAfkkQ9qA1FdgOJE92VzW+AwDQYJKoZIhvcNAQELBQAwQTELMAkGA1UEBhMCQVUxEDAOBgNVBAoT
B1Zlcm9rZXkxIDAeBgNVBAMTF1Zlcm9rZXkgU2VjdXJlIEVtYWlsIEcyMB4XDTI0MTIzMDAwMDAw
MFoXDTI4MDEwNDIzNTk1OVowHjEcMBoGA1UEAwwTZHdtdzJAaW5mcmFkZWFkLm9yZzCCAiIwDQYJ
KoZIhvcNAQEBBQADggIPADCCAgoCggIBANqWLse95HW2F7FhfH9bugyT/danKmmXrbMnz5GZNAfj
Jl5gBL9JFXrOZ9eVdpmw04Tp6aDxZctFLoEDvSWKi367Q7Sg+ci+fH4KwwfQ8Pi0IpIKx2n5emEg
nbOQL1Lv/IcNiep6Cq3DiyaSpSp/RZf+CAfUNySHS8eWmhLU6jGpSD6hxTpYKye7PmrmvMWwfGEP
WoamAV1kSTb9z/9m9Q2LXa89aKmTxNwnAfD3Ohn9mtU3JukwILRMewn9QRXK7KzM+01h5hkCE4nj
W9q/VGFknNhqfhrWBTSQoE9CSVylASGrjzCgS7XmKy/BaH3/7mOOHQv5g1o3Qj/+cdKnpT0I5Qb1
nRy+c7wUzo9OqydJtxzSP4ZyHA4dELto/a3m/ay1XHcpum1pgTOLgxAfGb/T4dCkwRUstSKLMmpL
g9Y9TrN9BM4xn24tBFFyL5znGG0wQGzOVAM68RBzIQb6Fz758fjsr4yZnPbVsU1+gHEs/puNHrG0
9e1EQXmUtfGn4InoopJuU8p5VGD9S3Ikd4UoBlc7xl5yjtNlQxUeYrRlnUSmdlucCEoTX1n4UmtA
9CuVHSA7eUHO7I88CtWG9bGOU7tLgOZoSEvNqtaL/N7sQbBZK4jZ4Rr/zNTQg1SwYjjLB7u96lDP
sipoCi8BfR35/ViNuYJWwDCOEua94WM3AgMBAAGjggGwMIIBrDAfBgNVHSMEGDAWgBSJSAjqIE53
a4blgcjX4Y1khH/8cDAdBgNVHQ4EFgQUXGIam3Bs59Y60yTmWgfDu6pZQ6cwMAYDVR0RBCkwJ4ET
ZHdtdzJAaW5mcmFkZWFkLm9yZ4EQZGF2aWRAd29vZGhvdS5zZTAUBgNVHSAEDTALMAkGB2eBDAEF
AQEwDgYDVR0PAQH/BAQDAgXgMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEFBQcDBDB7BgNVHR8E
dDByMDegNaAzhjFodHRwOi8vY3JsMy5kaWdpY2VydC5jb20vVmVyb2tleVNlY3VyZUVtYWlsRzIu
Y3JsMDegNaAzhjFodHRwOi8vY3JsNC5kaWdpY2VydC5jb20vVmVyb2tleVNlY3VyZUVtYWlsRzIu
Y3JsMHYGCCsGAQUFBwEBBGowaDAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuZGlnaWNlcnQuY29t
MEAGCCsGAQUFBzAChjRodHRwOi8vY2FjZXJ0cy5kaWdpY2VydC5jb20vVmVyb2tleVNlY3VyZUVt
YWlsRzIuY3J0MA0GCSqGSIb3DQEBCwUAA4IBAQBBdzgU+I8tGdMO+Y4AETOQi6aiN9kB7lKWe5Ch
4VR+L4uxYIqIHxR7G2+IEC9ugqEu43p4b80LpY7M4KmmfiaRDFGQ50s1OHAwdbR3X2OtkUQq0Qb9
6ln+HD8N1JxO5nabuKbymki0BPoZcPdo+FeRecmkL/NOzzm41JBHrhwRwEWOOhAO5KxN4nkMBZ/w
QzKEy4PylxurHmRG/K0k+xYFDO/UOx2/YsM8s138lQqEdKCvudtSvj5oA/Y8dNcZwQGHyVN5h5r2
nh3mT3r2l7Q4dgxXlovERGpNqCZJ624jCiWQC4ELMD2+6WDxjj03PbOulQZ8oY4PQUyp6djF0keA
MYIDuzCCA7cCAQEwVTBBMQswCQYDVQQGEwJBVTEQMA4GA1UEChMHVmVyb2tleTEgMB4GA1UEAxMX
VmVyb2tleSBTZWN1cmUgRW1haWwgRzICEAfkkQ9qA1FdgOJE92VzW+AwDQYJYIZIAWUDBAIBBQCg
ggE3MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1MDMzMDE1MDc1
NlowLwYJKoZIhvcNAQkEMSIEIF3xw9Z4evpIp/lVAcDbFgxbJXuRG0tQFapgel3ylA6MMGQGCSsG
AQQBgjcQBDFXMFUwQTELMAkGA1UEBhMCQVUxEDAOBgNVBAoTB1Zlcm9rZXkxIDAeBgNVBAMTF1Zl
cm9rZXkgU2VjdXJlIEVtYWlsIEcyAhAH5JEPagNRXYDiRPdlc1vgMGYGCyqGSIb3DQEJEAILMVeg
VTBBMQswCQYDVQQGEwJBVTEQMA4GA1UEChMHVmVyb2tleTEgMB4GA1UEAxMXVmVyb2tleSBTZWN1
cmUgRW1haWwgRzICEAfkkQ9qA1FdgOJE92VzW+AwDQYJKoZIhvcNAQEBBQAEggIAW0QSjRaorM1G
6kWlL8kxzKFJBFJSLWTDLAUB1R1hRbODU299NsYz/zc0rEFUknaIVg+2GxOf9JSPoIlLqRf3H9iR
xxSnP9b4i9HzN1+bdaKNVyz+ntkZes8ZfUwgrWHpEviilC8GVpE1iK5i6fqLwDxxbEG/yADer2lf
koxYQjdQig5JWmySbiohsPSJStZVy3nykbqbJ6wmQxiltwrcFY1ItsAOFUfP+zohZ8RggMwL6XQK
QQZGBnsxdb6atYSbRyYdwkl/3qxH+3bpKJYieFHdvxNnAvA0tWWLBmkaV23XjlHUkTFfbjMf1yCl
jeJKQHtfSnbjwoO8YFQHoN2Mxm+QvHgsVFB/6voKjs+JQodg/McB/Dw//XuNJnoeE1fwiHfzV2aJ
riXBYmHQsQOrFTTJmixB/hvi86MgON4yoi6jsUzw7R712UncQvL/y/mNaIPKYxw3vxompof8M6MZ
gdx8hdcssMymr0OIXOvKDfEoGP18D+wGQ6+VXhLI0eS0bF3/7kSBv3T3w14VkuO3uY/Ntg9q65Y0
MiqOA8nHsouy7ibW243/oFbGklh+cHB9ABH8mGo+O2fQK8BLHGdO6bXid4g6ZKSVmOSaMq+9WRZs
G5zTc5JfG1EWKIGXEhTRezVVMcHkaGAarJYtO6FDrvZI03QoayEKx6v+0yrTAwkAAAAAAAA=


--=-mYzUro773zg9T/uQYbOm--

