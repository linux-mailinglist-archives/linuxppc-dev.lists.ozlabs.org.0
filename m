Return-Path: <linuxppc-dev+bounces-7278-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 749A8A6C2B4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Mar 2025 19:43:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZKBCQ5gYxz30Tm;
	Sat, 22 Mar 2025 05:42:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1:d65d:64ff:fe57:4e05"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742582578;
	cv=none; b=HBVFbH4BEJkE5sFHC9CpZnbMsH0mY2URcoTszFxACL5xJpQW2bdiwKIygj4r34/W34svwqRVm3lR2MGMI3j2cDV8Fop7c96HQaSLVQZyMIpKAiSnXzlVHQhNsOM+Kuca0kRA4BsWL2ShWqQKr1tQ7sn8xOiKTeF5euv0iPGFjM36PzLNYdxaySVtCDanfF0wZTd7Kg1nzt3RLv2y//KqmKGRURE0mAgxrc/DU87Ui5P6zGBaAIhk9ixoS5dTLD9nMwVf+fbZbiELlAjps0OkQtx509AO0M4YHLHYwRObose3KddXa7Mf1lvJ1pvL+207ViTzbhEup1mQSyUyrnDifw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742582578; c=relaxed/relaxed;
	bh=6p9/xCFwuiZLdlnx3CHna7SmFJBXvkdGfKbhrFQIG0k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EeJEOfVAMKO6Z2pWcKm9Dacoi7EaoAFUdS20qhpQRcY0fREQ9RMc+IcTCZpC1XbG/I8kc9UuPp799H5oBYVGyri588+8J+wi8bIIwyitsjJQhixHLUNgIrtIS462iKIyeERjJTKiMiLTHIF3nsigLI5ajplTy+bsb/9uh72uuZ0+0wpI4DpeJ13oPfw0GY9sGhJC+nK5VxCgumxM6FVO6n/MNShuhoGWoNd6BR9FJcBFchHntErP6S2IQhqp0CsX7FEOWhMIXDw+3zRWsd9V1JzFnb7istAX++9bf5IrHJIE5Vl4qN6qZin0oQXaUJ65HNYkIja9jfPJeDFRjZ9Pqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ZM2XwXtA; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=batv+37f7f3dffb3293675570+7880+infradead.org+dwmw2@desiato.srs.infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ZM2XwXtA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=desiato.srs.infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=batv+37f7f3dffb3293675570+7880+infradead.org+dwmw2@desiato.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZKBCM18Wnz30Tf
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Mar 2025 05:42:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6p9/xCFwuiZLdlnx3CHna7SmFJBXvkdGfKbhrFQIG0k=; b=ZM2XwXtAnlCfsKo0XNxstP2jSG
	U865vPXju9/sBv+RnSL1oLUhFaTt2GFwko2fe13ZTxN5XgbKStRgAAR78S0c8riUBjLDHxGGFTN5Q
	IQA4Yi+4+rZ1VNApBOPqo7TyG2AJozAp9crvsFlBasJmN1P5+A7mtenETUUxqwfBL+zH+cZmbIYLr
	z7cSt9GR1dDsUHs+EJK9M+UxkQ6+mlITOdRL0A3LxKgHPzuJ5TZVQYJ/rn2uCfWHQp3OCwzyzp8bt
	Ww29Q/jlsLm3WtWuqretBM4DoH7lfYgqvIceQ+Kh7p6DoVlSSAYtY5sYDJJFhZ6ik+JXg10G+yCzE
	Wt0j8Uxw==;
Received: from [172.31.31.145] (helo=u09cd745991455d.ant.amazon.com)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tvhK0-00000004VRm-4BjR;
	Fri, 21 Mar 2025 18:42:21 +0000
Message-ID: <d1382a6ee959f22dc5f6628d8648af77f4702418.camel@infradead.org>
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
Date: Fri, 21 Mar 2025 18:42:20 +0000
In-Reply-To: <20250321142947-mutt-send-email-mst@kernel.org>
References: <20210209062131.2300005-1-tientzu@chromium.org>
	 <979b6a34ca5724ced1d4871b58bf227065d7da57.camel@infradead.org>
	 <20250321142947-mutt-send-email-mst@kernel.org>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-9um69C3QOUe8WBwkTdXa"
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


--=-9um69C3QOUe8WBwkTdXa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2025-03-21 at 14:32 -0400, Michael S. Tsirkin wrote:
> On Fri, Mar 21, 2025 at 03:38:10PM +0000, David Woodhouse wrote:
> > On Tue, 2021-02-09 at 14:21 +0800, Claire Chang wrote:
> > > This series implements mitigations for lack of DMA access control on
> > > systems without an IOMMU, which could result in the DMA accessing the
> > > system memory at unexpected times and/or unexpected addresses, possib=
ly
> > > leading to data leakage or corruption.
> >=20
> > Replying to an ancient (2021) thread which has already been merged...
> >=20
> > I'd like to be able to use this facility for virtio devices.
> >=20
> > Virtio already has a complicated relationship with the DMA API, because
> > there were a bunch of early VMM bugs where the virtio devices where
> > magically exempted from IOMMU protection, but the VMM lied to the guest
> > and claimed they weren't.
> >=20
> > With the advent of confidential computing, and the VMM (or whatever's
> > emulating the virtio device) not being *allowed* to arbitrarily access
> > all of the guest's memory, the DMA API becomes necessary again.
> >=20
> > Either a virtual IOMMU needs to determine which guest memory the VMM
> > may access, or the DMA API is wrappers around operations which
> > share/unshare (or unencrypt/encrypt) the memory in question.
> >=20
> > All of which is complicated and slow, if we're looking at a minimal
> > privileged hypervisor stub like pKVM which enforces the lack of guest
> > memory access from VMM.
> >=20
> > I'm thinking of defining a new type of virtio-pci device which cannot
> > do DMA to arbitrary system memory. Instead it has an additional memory
> > BAR which is used as a SWIOTLB for bounce buffering.
> >=20
> > The driver for it would look much like the existing virtio-pci device
> > except that it would register the restricted-dma region first (and thus
> > the swiotlb dma_ops), and then just go through the rest of the setup
> > like any other virtio device.
> >=20
> > That seems like it ought to be fairly simple, and seems like a
> > reasonable way to allow an untrusted VMM to provide virtio devices with
> > restricted DMA access.
> >=20
> > While I start actually doing the typing... does anyone want to start
> > yelling at me now? Christoph? mst? :)
>=20
>=20
> I don't mind as such (though I don't understand completely), but since
> this is changing the device anyway, I am a bit confused why you can't
> just set the VIRTIO_F_ACCESS_PLATFORM feature bit?=C2=A0 This forces DMA =
API
> which will DTRT for you, will it not?

That would be necessary but not sufficient. The question is *what* does
the DMA API do?

For a real passthrough PCI device, perhaps we'd have a vIOMMU exposed
to the guest so that it can do real protection with two-stage page
tables (IOVA=E2=86=92GPA under control of the guest, GPA=E2=86=92HPA under =
control of
the hypervisor). For that to work in the pKVM model though, you'd need
pKVM to be talking the guest's stage1 I/O page tables to see if a given
access from the VMM ought to be permitted?

Or for confidential guests there could be DMA ops which are an
'enlightenment'; a hypercall into pKVM to share/unshare pages so that
the VMM can actually access them, or SEV-SNP guests might mark pages
unencrypted to have the same effect with hardware protection.

Doing any of those dynamically to allow the VMM to access buffers in
arbitrary guest memory (when it wouldn't normally have access to
arbitrary guest memory) is complex and doesn't perform very well. And
exposes a full 4KiB page for any byte that needs to be made available.

Thus the idea of having a fixed range of memory to use for a SWIOTLB,
which is fairly much what the restricted DMA setup is all about.

We're just proposing that we build it in to a virtio-pci device model,
which automatically uses the extra memory BAR instead of the
restricted-dma-pool DT node.

It's basically just allowing us to expose through PCI, what I believe
we can already do for virtio in DT.

--=-9um69C3QOUe8WBwkTdXa
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
ggE3MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1MDMyMTE4NDIy
MFowLwYJKoZIhvcNAQkEMSIEIGcyYTz0b1vuiH1kWWxvYDxf5DNV/dQ7A75n0iBOd8eNMGQGCSsG
AQQBgjcQBDFXMFUwQTELMAkGA1UEBhMCQVUxEDAOBgNVBAoTB1Zlcm9rZXkxIDAeBgNVBAMTF1Zl
cm9rZXkgU2VjdXJlIEVtYWlsIEcyAhAH5JEPagNRXYDiRPdlc1vgMGYGCyqGSIb3DQEJEAILMVeg
VTBBMQswCQYDVQQGEwJBVTEQMA4GA1UEChMHVmVyb2tleTEgMB4GA1UEAxMXVmVyb2tleSBTZWN1
cmUgRW1haWwgRzICEAfkkQ9qA1FdgOJE92VzW+AwDQYJKoZIhvcNAQEBBQAEggIARn19baiF2SH2
Qb9UeIoovp68Lz+c9QM1LVM2qfpB5Vd0Mo6gccUM+8DiDyJMxYXZYd+Ib/AHhooSjCJ7Vd+x1jd/
eE2BveuRvzQsn0gH191zw8awf3fPMrbOk3llDZYRVLcacd7BN4nPbidbrJoba0bd+Jae2M/3XhTl
3HaAW+ipsj4grnoF8FHOYmjFh1S1ck7PIW6ktorhKEm172YFUTt2cX/R6v+CBBdCOxLtolCNEAFW
hXXC+4TAFIm4oOHe739VwqO5ZmeggeWlRL9obSOFMKFoSKP0oE/Uad1ix97JVg0Q1rtKNONJOr5B
XSKJ94cbE6IidFlzqYP+yCv4MnkcV5FAI3Rqbsn4lHPBQDkE455yrBp0B4p0D4pVh2if7/EDc1rm
UBXYoQaZCOeKwmmI6oP1OSRG1NVAy6ocmiVmdMoSERlcn4xl91AdRWa4VYi8zku3lBXBMc+P3015
DJUkXfrC+CPC+xcubKPvGF8gEOm0eQquHCBVzBnkp+BFkoAYyjAwZ44Qj2OCSacwvkEnqVmFO3BZ
HopfPoXAIL3bQEYPdQMQ0xN945VVQvkv0cAfQShC7INrjhQSVFFN5FkLEXhcdDDEYdajiVk4KP3I
Q3tytvpDIY7DQy7Ps1tS5IPFaTquT8yBCWN7DBonmrigS/kpax+uh53Ph5AVDcQAAAAAAAA=


--=-9um69C3QOUe8WBwkTdXa--

