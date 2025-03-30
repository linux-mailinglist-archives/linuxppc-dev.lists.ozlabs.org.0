Return-Path: <linuxppc-dev+bounces-7386-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B70A75A3B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Mar 2025 15:42:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZQb6V0Xw8z2yFJ;
	Mon, 31 Mar 2025 00:42:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743342145;
	cv=none; b=LacJA33AOdsA0otvkeuo3AFwqSQYjEDBFxawx348Hd8Jy4xtCiIq5Kzq0jfWR0gMJ1Csmes3iFIcTWQmPemqiRvHl59v7jkY/6KUTkIEckvQ5LnGgxKA0L+nVSkJOrJFe5vdy2/z2jwVfGz4bHLNMmUbBXYU2P3s2wSzLjHaA2JUgld56wMNw/aRnRf4RDrCjRKWkSVq4mVMWUrxeWW8UZ8iw3GwRiHYpJNTBDjaKM3gy7zU9U0+wOYYzSAvUhYPiETt5EaSvVYeZ6AZkpSZmSQQL498NNI1ZMTNLh47DeLgrNgILmQCb/Q0VIL/mM2EGeAwqn2v4nhrDdndAaMR+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743342145; c=relaxed/relaxed;
	bh=EVKwqJPfr4QPaIDNGk2hvYA8CboNSIQugm7IZY2L/BA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=X9w5H4bhzoF2m+hihn6KnqqqGsFd1now2Fxgpg5LweNbi+RpPfFx0d/jp53gujSt5vFnT9JLThaAzp56c7/h4tkk68kjLunxZSsbHvBQWs3nOdb1C81R/2THruKjBfaQGg8ZCReOGnLWwD25Fb8UseeCRWKkdKmNKg8nFJ7J4QwKsZkPSt0uuussONXmogO8ip6XkJWxmxzvw4HGVNOe+Tat/oGL2LzJlcKxUyXTF23Lv5qcA+dkNgHQ3B3g14odKTolWDk2teIPcs+mVtv6+ciZcQVe6dR1caPwhAgbKrqoR03j8Aa47YbkjqRcJzWnwugClHRXWtRiRbSekhUiuQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=i3iYYq+D; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=apTelp9U; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mst@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=i3iYYq+D;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=apTelp9U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mst@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZQb6S3lNxz2xsW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Mar 2025 00:42:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743342137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EVKwqJPfr4QPaIDNGk2hvYA8CboNSIQugm7IZY2L/BA=;
	b=i3iYYq+D8iQfEKf3eOyyjTHSLbf/MwxstfT3lB6L53rZC/DiJb86GWxWVEUZtZU+5gvMqQ
	nBdhptl2Bi7ybah62P4Lt0TG4s2sbUfqqB6w+QQgqhvWLRzwEL36tLXO9OgSzbNrrq2BdT
	QfXVn4WAwhbfXBr6+a7dveCMttMtRtc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743342138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EVKwqJPfr4QPaIDNGk2hvYA8CboNSIQugm7IZY2L/BA=;
	b=apTelp9U7lLc3kM4d7/EK6a2qjTv8pzhiTdtP/SPQaDpYBAjOWQzlAb6sGtVgM+kwW69hg
	FbI+dX/DzdFbX3ou4TqDDPt1biTQwxM33geZHlNCaqIThhUXMuVoFsygEHOGNQ4f5cZ0+Q
	WLlG2Z8zF/Nb4ZcTc2P+kSSXAH8oWtc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-290-rD_4rkOLPRGJIn8Y0WqoCQ-1; Sun, 30 Mar 2025 09:42:16 -0400
X-MC-Unique: rD_4rkOLPRGJIn8Y0WqoCQ-1
X-Mimecast-MFC-AGG-ID: rD_4rkOLPRGJIn8Y0WqoCQ_1743342135
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4394c489babso17198795e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Mar 2025 06:42:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743342135; x=1743946935;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EVKwqJPfr4QPaIDNGk2hvYA8CboNSIQugm7IZY2L/BA=;
        b=Xrk75hK3BeFdWPbnpS9A0eCG8c3L2y1vkWAqYXvlFbFHiOneQ+eBlod5zlZ3u4dkD/
         JSWzQhc627uFeJxeMi7VnqjVWmK3VBX9XLih9Ee4wXPH9FgvXDlsaNiHxgvOB7f4IwCI
         hwq7jJB7s0vaSJEGuRMzAbKF82Aq/1mPtPc/MKZkQL+5g2MxWyElOD6Lj+vXMtBc62ld
         dhTpK0H2InbBsA5dvjX/Dm8lhgbB8o/NnEIJsjDTWhIM7IRFAjLmMzjl1zVymtc6nn0A
         ktBfHyXRnHf8FEqdfRaIOi58OJnNjgmcWYey2OPfW90rkoR1h/Hn+3dJjoZqYFLFWTt5
         6UVg==
X-Forwarded-Encrypted: i=1; AJvYcCXUo8TjdoXedtMr3quUqVa3xjGNVZ84I4QXtqNme1GBoHo2eQuag8iax+6NQYvw1gQF9R0GiHzjM+TcFYk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy/LyeY83M12PlSVSq8U7thBXcWjjWVtG+uAcYTNSsvdMl/b1x0
	f4YXdD48pLe1aVTQsI3tjIcOKFSdjjIkK9TvezTsvhJyotQJ1zKn1T3tsa2OGUREMSXuEylsbXI
	6dLPQimtnRqMWUauzAwJAlV6I+knoGKgP/VblAL7o3gKlNtEXR52fOrwkslCeeuQ=
X-Gm-Gg: ASbGncvsC7N0xJ0JLFbmf6SVwfktCKW9k/gOiQVEQZ4p6md7du+oIU2Yx9j0627UVLz
	GaembJvlk9NoVnzi2jF5uRVcfRNBgJcKLG6XaLVV76/9wr3afXm3A9/7n35geqkZP3PhNQ6oGga
	TxjbBCJcwFl3DLG5KxGNKk6MZY3pkU3p1FM6l3yF92TetOS7nz+8FTvmbzGiY6PA1Bo0UAvYEgK
	ZiIq3XM7P4BRUab1RxB8HAfwdgHjlaZhRw2PomyOV7rB0OhbfYw+TDi7oo+Gkiai/lNM2Okl3ZS
	5eREkBVrCA==
X-Received: by 2002:a05:600c:384d:b0:43c:fded:9654 with SMTP id 5b1f17b1804b1-43db62bd0a5mr44135325e9.19.1743342134755;
        Sun, 30 Mar 2025 06:42:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFceVYy8P/4rdEylphWngsUQJtsROJ+u5xjCs5nBFb/+Q+tLCz4LEP8IBXSQxv5v24A9e0nCQ==
X-Received: by 2002:a05:600c:384d:b0:43c:fded:9654 with SMTP id 5b1f17b1804b1-43db62bd0a5mr44134915e9.19.1743342134286;
        Sun, 30 Mar 2025 06:42:14 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d90000f48sm91443025e9.37.2025.03.30.06.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 06:42:12 -0700 (PDT)
Date: Sun, 30 Mar 2025 09:42:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Claire Chang <tientzu@chromium.org>, Rob Herring <robh+dt@kernel.org>,
	mpe@ellerman.id.au, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	boris.ostrovsky@oracle.com, jgross@suse.com,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	heikki.krogerus@linux.intel.com, peterz@infradead.org,
	benh@kernel.crashing.org, grant.likely@arm.com, paulus@samba.org,
	mingo@kernel.org, sstabellini@kernel.org,
	Saravana Kannan <saravanak@google.com>, xypron.glpk@gmx.de,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	xen-devel@lists.xenproject.org, Thierry Reding <treding@nvidia.com>,
	linux-devicetree <devicetree@vger.kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	Nicolas Boichat <drinkcat@chromium.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	lkml <linux-kernel@vger.kernel.org>,
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
	Jim Quinlan <james.quinlan@broadcom.com>,
	Robin Murphy <robin.murphy@arm.com>, hch@infradead.org,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	virtualization@lists.linux.dev, graf@amazon.de
Subject: Re: Using Restricted DMA for virtio-pci
Message-ID: <20250330093532-mutt-send-email-mst@kernel.org>
References: <20210209062131.2300005-1-tientzu@chromium.org>
 <979b6a34ca5724ced1d4871b58bf227065d7da57.camel@infradead.org>
 <20250321142947-mutt-send-email-mst@kernel.org>
 <d1382a6ee959f22dc5f6628d8648af77f4702418.camel@infradead.org>
 <8e7084b04e5c0456c0ff32ea131a199c6af763cd.camel@infradead.org>
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
In-Reply-To: <8e7084b04e5c0456c0ff32ea131a199c6af763cd.camel@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2Ugap6yTBP34ePsZdn31OTdcWaRrqrKv4OB0dkCgg1w_1743342135
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Mar 28, 2025 at 05:40:41PM +0000, David Woodhouse wrote:
> On Fri, 2025-03-21 at 18:42 +0000, David Woodhouse wrote:
> > On Fri, 2025-03-21 at 14:32 -0400, Michael S. Tsirkin wrote:
> > > On Fri, Mar 21, 2025 at 03:38:10PM +0000, David Woodhouse wrote:
> > > > On Tue, 2021-02-09 at 14:21 +0800, Claire Chang wrote:
> > > > > This series implements mitigations for lack of DMA access control on
> > > > > systems without an IOMMU, which could result in the DMA accessing the
> > > > > system memory at unexpected times and/or unexpected addresses, possibly
> > > > > leading to data leakage or corruption.
> > > > 
> > > > Replying to an ancient (2021) thread which has already been merged...
> > > > 
> > > > I'd like to be able to use this facility for virtio devices.
> > > > 
> > > > Virtio already has a complicated relationship with the DMA API, because
> > > > there were a bunch of early VMM bugs where the virtio devices where
> > > > magically exempted from IOMMU protection, but the VMM lied to the guest
> > > > and claimed they weren't.
> > > > 
> > > > With the advent of confidential computing, and the VMM (or whatever's
> > > > emulating the virtio device) not being *allowed* to arbitrarily access
> > > > all of the guest's memory, the DMA API becomes necessary again.
> > > > 
> > > > Either a virtual IOMMU needs to determine which guest memory the VMM
> > > > may access, or the DMA API is wrappers around operations which
> > > > share/unshare (or unencrypt/encrypt) the memory in question.
> > > > 
> > > > All of which is complicated and slow, if we're looking at a minimal
> > > > privileged hypervisor stub like pKVM which enforces the lack of guest
> > > > memory access from VMM.
> > > > 
> > > > I'm thinking of defining a new type of virtio-pci device which cannot
> > > > do DMA to arbitrary system memory. Instead it has an additional memory
> > > > BAR which is used as a SWIOTLB for bounce buffering.
> > > > 
> > > > The driver for it would look much like the existing virtio-pci device
> > > > except that it would register the restricted-dma region first (and thus
> > > > the swiotlb dma_ops), and then just go through the rest of the setup
> > > > like any other virtio device.
> > > > 
> > > > That seems like it ought to be fairly simple, and seems like a
> > > > reasonable way to allow an untrusted VMM to provide virtio devices with
> > > > restricted DMA access.
> > > > 
> > > > While I start actually doing the typing... does anyone want to start
> > > > yelling at me now? Christoph? mst? :)
> > > 
> > > 
> > > I don't mind as such (though I don't understand completely), but since
> > > this is changing the device anyway, I am a bit confused why you can't
> > > just set the VIRTIO_F_ACCESS_PLATFORM feature bit?  This forces DMA API
> > > which will DTRT for you, will it not?
> > 
> > That would be necessary but not sufficient. ...

could you explain pls?

> My first cut at a proposed spec change looks something like this. I'll
> post it to the virtio-comment list once I've done some corporate
> bureaucracy and when the list stops sending me python tracebacks in
> response to my subscribe request.

the linux foundation one does this? maybe poke at the admins.

> In the meantime I'll hack up some QEMU and guest Linux driver support
> to match.
> 
> diff --git a/content.tex b/content.tex
> index c17ffa6..1e6e1d6 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -773,6 +773,9 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>  Currently these device-independent feature bits are defined:
>  
>  \begin{description}
> +  \item[VIRTIO_F_SWIOTLB (27)] This feature indicates that the device
> +  provides a memory region which is to be used for bounce buffering,
> +  rather than permitting direct memory access to system memory.
>    \item[VIRTIO_F_INDIRECT_DESC (28)] Negotiating this feature indicates
>    that the driver can use descriptors with the VIRTQ_DESC_F_INDIRECT
>    flag set, as described in \ref{sec:Basic Facilities of a Virtio
> @@ -885,6 +888,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>  VIRTIO_F_ACCESS_PLATFORM is not offered, then a driver MUST pass only physical
>  addresses to the device.
>  
> +A driver SHOULD accept VIRTIO_F_SWIOTLB if it is offered, and it MUST
> +then pass only addresses within the Software IOTLB bounce buffer to the
> +device.
> +
>  A driver SHOULD accept VIRTIO_F_RING_PACKED if it is offered.
>  
>  A driver SHOULD accept VIRTIO_F_ORDER_PLATFORM if it is offered.
> @@ -921,6 +928,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>  A device MAY fail to operate further if VIRTIO_F_ACCESS_PLATFORM is not
>  accepted.
>  
> +A device MUST NOT offer VIRTIO_F_SWIOTLB if its transport does not
> +provide a Software IOTLB bounce buffer.
> +A device MAY fail to operate further if VIRTIO_F_SWIOTLB is not accepted.
> +
>  If VIRTIO_F_IN_ORDER has been negotiated, a device MUST use
>  buffers in the same order in which they have been available.
>  
> diff --git a/transport-pci.tex b/transport-pci.tex
> index a5c6719..23e0d57 100644
> --- a/transport-pci.tex
> +++ b/transport-pci.tex
> @@ -129,6 +129,7 @@ \subsection{Virtio Structure PCI Capabilities}\label{sec:Virtio Transport Option
>  \item ISR Status
>  \item Device-specific configuration (optional)
>  \item PCI configuration access
> +\item SWIOTLB bounce buffer
>  \end{itemize}
>  
>  Each structure can be mapped by a Base Address register (BAR) belonging to
> @@ -188,6 +189,8 @@ \subsection{Virtio Structure PCI Capabilities}\label{sec:Virtio Transport Option
>  #define VIRTIO_PCI_CAP_SHARED_MEMORY_CFG 8
>  /* Vendor-specific data */
>  #define VIRTIO_PCI_CAP_VENDOR_CFG        9
> +/* Software IOTLB bounce buffer */
> +#define VIRTIO_PCI_CAP_SWIOTLB           10
>  \end{lstlisting}
>  
>          Any other value is reserved for future use.
> @@ -744,6 +747,36 @@ \subsubsection{Vendor data capability}\label{sec:Virtio
>  The driver MUST qualify the \field{vendor_id} before
>  interpreting or writing into the Vendor data capability.
>  
> +\subsubsection{Software IOTLB bounce buffer capability}\label{sec:Virtio
> +Transport Options / Virtio Over PCI Bus / PCI Device Layout /
> +Software IOTLB bounce buffer capability}
> +
> +The optional Software IOTLB bounce buffer capability allows the
> +device to provide a memory region which can be used by the driver
> +driver for bounce buffering. This allows a device on the PCI
> +transport to operate without DMA access to system memory addresses.
> +
> +The Software IOTLB region is referenced by the
> +VIRTIO_PCI_CAP_SWIOTLB capability. Bus addresses within the referenced
> +range are not subject to the requirements of the VIRTIO_F_ORDER_PLATFORM
> +capability, if negotiated.


why not? an optimization?
A mix of swiotlb and system memory might be very challenging from POV
of ordering.


> +
> +\devicenormative{\paragraph}{Software IOTLB bounce buffer capability}{Virtio
> +Transport Options / Virtio Over PCI Bus / PCI Device Layout /
> +Software IOTLB bounce buffer capability}
> +
> +Devices which present the Software IOTLB bounce buffer capability
> +SHOULD also offer the VIRTIO_F_SWIOTLB feature.
> +
> +\drivernormative{\paragraph}{Software IOTLB bounce buffer capability}{Virtio
> +Transport Options / Virtio Over PCI Bus / PCI Device Layout /
> +Software IOTLB bounce buffer capability}
> +
> +The driver SHOULD use the offered buffer in preference to passing system
> +memory addresses to the device.

Even if not using VIRTIO_F_SWIOTLB? Is that really necessary?

> If the driver accepts the VIRTIO_F_SWIOTLB
> +feature, then the driver MUST use the offered buffer and never pass system
> +memory addresses to the device.
> +
>  \subsubsection{PCI configuration access capability}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / PCI configuration access capability}
>  
>  The VIRTIO_PCI_CAP_PCI_CFG capability
> 



