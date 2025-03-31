Return-Path: <linuxppc-dev+bounces-7395-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D587A7635A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Mar 2025 11:42:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZR5lF6QTgz2yfx;
	Mon, 31 Mar 2025 20:42:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1:d65d:64ff:fe57:4e05"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743414153;
	cv=none; b=OkTfCAsygLJYHVsXNfqyFRvEDj2h0TtrPAI8iKAUwmIxoQple8kTTJZdFjclxCl7gRKt8dGBshPaETPnnS6ZsoYK7sIEyesPYq+dtzFFf1hu+lDn/jqcfCZ6Iws4KFUGqYzhXleTQTsnb1ehkZz9N7yvJ1UA4GAlhtAFQh3AFVKeC6NJZawur2iUK04dD7z+FcG7OXvWE3z20xkCskiPys/lVo33MNr1VxMyb1cpYq4Zn2gEawRHkdEFlCkhi41O2IG581iJUhdFSlHV5tEolMS231HVqPupEV9vpkzLpg9kENkpNJ4zkSR7m4Qw8GpXSfWPnqi5N621iZXB0sBHQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743414153; c=relaxed/relaxed;
	bh=qSbT7gVhavBqCvnIdHN+SsoJQ8QMGEQtBO+4V3PpiDk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XWminryUkogeQ675dJEpU+Y0RiCkIwgb8iX124+Y+21id84Ko0grAfcvzlNfxSZdXqSHjRiklA+Bj4imAsWc6bkhCk1cFkV2OjFwckyo5tUWVvcPT92CSKoCvrKWfagNp/2K1/MB/u8Qx9DdqaflBCJBHv6nnO+FAdJhRhNfV3kQMGrXMSohRJwxqkLHfENntL+2gkkf8e+Zo3bHJgBTX1MjnJF7nFaP7sZq3KHhwg609MkvKsTcHvt4IGIViYoUERWGmQsOlpf8hBHSk7JWYhi88GsxKQeyx2/VL10L+fjwon4KuLWaydY9YPo7ecraMlsGzbZv5IwPDBaodYW2xg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=TnmWvfnk; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=batv+171935103c4216d80ca0+7890+infradead.org+dwmw2@desiato.srs.infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=TnmWvfnk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=desiato.srs.infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=batv+171935103c4216d80ca0+7890+infradead.org+dwmw2@desiato.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZR5lB1tG0z2ydw
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Mar 2025 20:42:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qSbT7gVhavBqCvnIdHN+SsoJQ8QMGEQtBO+4V3PpiDk=; b=TnmWvfnkBylXteILU+DtV8DBPY
	6sFuBqY6SUlmMSrjsD+vIGgRIPW8XbETQievhQp8PPcpohOYQybmOx6BdGqswLsCpmW6ylWydb8vZ
	Bzbw1TvpcCJkUwn+ZCwSf9mU54/2uA23JhsUflODvDy+Z6xb4KDQvjE+bwxRKVk90tZJyp/ypsn2e
	YUnP+ZdrCMEnKMQ9d7ojUt7l0LYlMa1+ERL6ZiT/zq22aB5o1PSM3DL58pN49v9kv9k7boU5MzRvw
	LQJrX1bW5tO6nZKaQHTHpkL3CMPXm4jYcvMCUzC/qAXib8Br6gfGdXUG2IBqrLPDS+BuD38zA2ITk
	YD9LDtLg==;
Received: from [172.31.31.145] (helo=u09cd745991455d.ant.amazon.com)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzBeq-00000006cS5-3h6m;
	Mon, 31 Mar 2025 09:42:17 +0000
Message-ID: <1ec5a55bdc828aeb17ecba19e50d45e5a0815ae2.camel@infradead.org>
Subject: Re: Using Restricted DMA for virtio-pci
From: David Woodhouse <dwmw2@infradead.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linuxppc-dev@lists.ozlabs.org, Claire Chang <tientzu@chromium.org>, Rob
 Herring <robh+dt@kernel.org>, mpe@ellerman.id.au, Joerg Roedel
 <joro@8bytes.org>, Will Deacon <will@kernel.org>, Frank Rowand
 <frowand.list@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 boris.ostrovsky@oracle.com, jgross@suse.com,  Christoph Hellwig
 <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, 
 heikki.krogerus@linux.intel.com, peterz@infradead.org,
 benh@kernel.crashing.org,  grant.likely@arm.com, paulus@samba.org,
 mingo@kernel.org, sstabellini@kernel.org,  Saravana Kannan
 <saravanak@google.com>, xypron.glpk@gmx.de, "Rafael J . Wysocki"
 <rafael.j.wysocki@intel.com>,  xen-devel@lists.xenproject.org, Thierry
 Reding <treding@nvidia.com>,  linux-devicetree
 <devicetree@vger.kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Dan
 Williams <dan.j.williams@intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>,  Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, Jim
 Quinlan <james.quinlan@broadcom.com>,  Robin Murphy <robin.murphy@arm.com>,
 hch@infradead.org, Jason Wang <jasowang@redhat.com>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>, Eugenio =?ISO-8859-1?Q?P=E9rez?=
 <eperezma@redhat.com>, virtualization@lists.linux.dev, graf@amazon.de
Date: Mon, 31 Mar 2025 10:42:16 +0100
In-Reply-To: <20250330173951-mutt-send-email-mst@kernel.org>
References: <20210209062131.2300005-1-tientzu@chromium.org>
	 <979b6a34ca5724ced1d4871b58bf227065d7da57.camel@infradead.org>
	 <20250321142947-mutt-send-email-mst@kernel.org>
	 <d1382a6ee959f22dc5f6628d8648af77f4702418.camel@infradead.org>
	 <20250330125929-mutt-send-email-mst@kernel.org>
	 <E3EE485D-AD74-457C-BDEC-F8C62DFE4909@infradead.org>
	 <20250330173951-mutt-send-email-mst@kernel.org>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-EfBIpG9vYqSFcVZ1I3yN"
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
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


--=-EfBIpG9vYqSFcVZ1I3yN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2025-03-30 at 17:48 -0400, Michael S. Tsirkin wrote:
> On Sun, Mar 30, 2025 at 10:27:58PM +0100, David Woodhouse wrote:
> > On 30 March 2025 18:06:47 BST, "Michael S. Tsirkin" <mst@redhat.com> wr=
ote:
> > > > It's basically just allowing us to expose through PCI, what I belie=
ve
> > > > we can already do for virtio in DT.
> > >=20
> > > I am not saying I am against this extension.
> > > The idea to restrict DMA has a lot of merit outside pkvm.
> > > For example, with a physical devices, limiting its DMA
> > > to a fixed range can be good for security at a cost of
> > > an extra data copy.
> > >=20
> > > So I am not saying we have to block this specific hack.
> > >=20
> > > what worries me fundamentally is I am not sure it works well
> > > e.g. for physical virtio cards.
> >=20
> > Not sure why it doesn't work for physical cards. They don't need to
> > be bus-mastering; they just take data from a buffer in their own
> > RAM.
>=20
> I mean, it kind of does, it is just that CPU pulling data over the PCI bu=
s
> stalls it so is very expensive. It is not by chance people switched to
> DMA almost exclusively.

Yes. For a physical implementation it would not be the most high-
performance option... unless DMA is somehow blocked as it is in the
pKVM+virt case.

In the case of a virtual implementation, however, the performance is
not an issue because it'll be backed by host memory anyway. (It's just
that because it's presented to the guest and the trusted part of the
hypervisor as PCI BAR space instead of main memory, it's a whole lot
more practical to deal with the fact that it's *shared* with the VMM.)

> > > Attempts to pass data between devices will now also require
> > > extra data copies.
> >=20
> > Yes. I think that's acceptable, but if we really cared we could
> > perhaps extend the capability to refer to a range inside a given
> > BAR on a specific *device*? Or maybe just *function*, and allow
> > sharing of SWIOTLB buffer within a multi-function device?
>=20
> Fundamentally, this is what dmabuf does.

In software, yes. Extending it to hardware is a little harder.

In principle, it might be quite nice to offer a single SWIOTLB buffer
region (in a BAR of one device) and have multiple virtio devices share
it. Not just because of passing data between devices, as you mentioned,
but also because it'll be a more efficient use of memory than each
device having its own buffer and allocation pool.

So how would a device indicate that it can use a SWIOTLB buffer which
is in a BAR of a *different* device?

Not by physical address, because BARs get moved around.
Not even by PCI bus/dev/fn/BAR# because *buses* get renumbered.

You could limit it to sharing within one PCI "bus", and use just
dev/fn/BAR#? Or even within one PCI device and just fn/BAR#? The latter
could theoretically be usable by multi-function physical devices.

The standard struct virtio_pci_cap (which I used for
VIRTIO_PCI_CAP_SWIOTLB) just contains BAR and offset/length. We could
extend it with device + function, using -1 for 'self', to allow for
such sharing?

Still not convinced it isn't overkill, but it's certainly easy enough
to add on the *spec* side. I haven't yet looked at how that sharing
would work in Linux on the guest side; thus far what I'm proposing is
intended to be almost identical to the per-device thing that should
already work with a `restricted-dma-pool' node in device-tree.

> > I think it's overkill though.
> >=20
> > > Did you think about adding an swiotlb mode to virtio-iommu at all?
> > > Much easier than parsing page tables.
> >=20
> > Often the guests which need this will have a real IOMMU for the true
> > pass-through devices.
>=20
> Not sure I understand. You mean with things like stage 2 passthrough?

Yes. AMD's latest IOMMU spec documents it, for example. Exposing a
'vIOMMU' to the guest which handles just stage 1 (IOVA=E2=86=92GPA) while t=
he
hypervisor controls the normal GPA=E2=86=92HPA translation in stage 2.

Then the guest gets an accelerated path *directly* to the hardware for
its IOTLB flushes... which means the hypervisor doesn't get to *see*
those IOTLB flushes so it's a PITA to do device emulation as if it's
covered by that same IOMMU.

(Actually I haven't checked the AMD one in detail for that flaw; most
*other* 2-stage IOMMUs I've seen do have it, and I *bet* AMD does too).

> > Adding a virtio-iommu into the mix (or any other
> > system-wide way of doing something different for certain devices) is
> > problematic.
>=20
> OK... but the issue isn't specific to no DMA devices, is it?

Hm? Allowing virtio devices to operate as "no-DMA devices" is a
*workaround* for the issue.

The issue is that the VMM may not have full access to the guest's
memory for emulating devices. These days, virtio covers a large
proportion of emulated devices.

So I do think the issue is fairly specific to virtio devices, and
suspect that's what you meant to type above?

We pondered teaching the trusted part of the hypervisor (e.g. pKVM) to
snoop on virtqueues enough to 'know' which memory the VMM was genuinely
being *invited* to read/write... and we ran away screaming. (In order
to have sufficient trust, you end up not just snooping but implementing
quite a lot of the emulation on the trusted side. And then complex
enlightenments in the VMM and the untrusted Linux/KVM which hosts it,
to interact with that.)

Then we realised that for existing DT guests it's trivial just to add
the `restricted-dma-pool` node. And wanted to do the same for the
guests who are afflicted with UEFI/ACPI too. So here we are, trying to
add the same capability to virtio-pci.

> > The on-device buffer keeps it nice and simple,
>=20
> I am not saying it is not.
> It's just a little boutique.

Fair. Although with the advent of confidential computing and
restrictions on guest memory access, perhaps becoming less boutique
over time?

And it should also be fairly low-friction; it's a whole lot cleaner in
the spec than the awful VIRTIO_F_ACCESS_PLATFORM legacy, and even in
the Linux guest driver it should work fairly simply given the existing
restricted-dma support (although of course that shouldn't entirely be
our guiding motivation).

> > and even allows us to
> > do device support for operating systems like Windows where it's a lot
> > harder to do anything generic in the core OS.
>=20
> Well we do need virtio iommu windows support sooner or later, anyway.

Heh, good luck with that :)

And actually, doesn't that only support *DMA* remapping? So you still
wouldn't be able to boot a Windows guest with >255 vCPUs without some
further enlightenment (like Windows guests finally supporting the 15-
bit MSI extension that even Hyper-V supports on the host side...)

=20

--=-EfBIpG9vYqSFcVZ1I3yN
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
ggE3MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1MDMzMTA5NDIx
NlowLwYJKoZIhvcNAQkEMSIEIJcN5NIl4yVSF0bj+SQFMx/p6FwYDTZf4b2ZfQZZJwIZMGQGCSsG
AQQBgjcQBDFXMFUwQTELMAkGA1UEBhMCQVUxEDAOBgNVBAoTB1Zlcm9rZXkxIDAeBgNVBAMTF1Zl
cm9rZXkgU2VjdXJlIEVtYWlsIEcyAhAH5JEPagNRXYDiRPdlc1vgMGYGCyqGSIb3DQEJEAILMVeg
VTBBMQswCQYDVQQGEwJBVTEQMA4GA1UEChMHVmVyb2tleTEgMB4GA1UEAxMXVmVyb2tleSBTZWN1
cmUgRW1haWwgRzICEAfkkQ9qA1FdgOJE92VzW+AwDQYJKoZIhvcNAQEBBQAEggIAyvYxp+QlIsNz
Yvz9vEv1VxBd0WQgSyzQFpHD8W7SezYmEahcfap7IdP/EzCbxXVDgXL994pbIl+s69ECFHqNGCrK
liWDtmdC/0sdBfsDt1DpUNIxEfATQslqs45cc62dhL2gkgBtH5ABg28230T/GYMMg8juE+/lH7gB
sn6rFEuylquLSr9Wq/54SyQkFkNZylqB6q90AeZWhetV4Iv+UapP1xzHaiF6sW7m9lnRY/65EmGl
gAXEHLu5nPsadeD2NR/tL2hazmxsRykYa0ig/FlrtoIUV/QryTB1jltI4PCP1Xf6w4ZbH9UyFYMQ
NmH5TOwmzKLOwh4b1uz+P+5ba+RUL2e+MPKAMrkHXbfA6JZzok0UsKm7/Gk7u3/LcySoqGYFjGuT
RmC9Iv5tN8L2Z0x336qX2xKSKKB+192B0WZYpXlx4vsqZki26zwlV4Z981qmaN6DsHLOQVCcAnn6
wczLQ5ifFEI5y591Oxcz8yST7ZfudaNcv+9GwmBbkXlPIGpqdxyUvHBgTuxAhrM85MrNH8ANS4Mt
X4hAa72Qt5OjDaUWDOnktyE4s1iqaVg6I79czrNLGImW6veRpSzsEEy/8Ee2XUfkIlxxWOZZwSlO
dHV1i/aLqqdlLL2rhyU6Y4CDHddGWLCRN1SKYqoRH4uSvpi6yesrra0I8K1F5cIAAAAAAAA=


--=-EfBIpG9vYqSFcVZ1I3yN--

