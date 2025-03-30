Return-Path: <linuxppc-dev+bounces-7388-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08638A75B18
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Mar 2025 18:59:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZQgTx0Fq5z2yKq;
	Mon, 31 Mar 2025 03:59:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743353972;
	cv=none; b=PHhYnshUL9rSpRG2zCDUJuHTRBRfAhc18ceeiA3F22uBck2oPInPyD/6xS2C7e9pf1vp6/9RrchnWbDIeFyGkpBrr34z5rnzu2+dLSemmDie2kuKaVKi74We6HPrE+pqWd2Yda7RQGeoAL4DzjLe8qrAqdgF3VkXfIT4ldY4IG58xvBYz4w9Pi+vw9vNxyolMnsPdp4xDMzzTKmCyIgVNt9M3lHkqw3vNPc1r9Bx4/N3ZGY4+8PnomGVRsm4r7VQwGI6LejWeYNZ7SgXLCkjqbxxWtUw+dJhkBOSQcSp4HmwqFcMvcDbsVtm774EqcOKPE2XqBnt+yI28lmS8Sv+dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743353972; c=relaxed/relaxed;
	bh=o3t3cKdFvQ9kSTO6AkCwvmYi+EYplfurO1UOS5Rdldo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=V87P3PksQrbafRzkZTEd35GJmgLknDEliDHtb9vyw+PrDvZYh5XMsFEK9pfp6935o/OR+7oK0G6MmZlSqBGBUb0KuL8etSKa9oYewd4kiZ5Ah/0rwC29wGQ9V6g14WlnQ9xH6CMZmoqa2NUPtrRIBrL9yDSKsuT2kFWulRXrRroOlOEnc3POZgk5dd5n48hr7b5TPMmOQ+R533pafaDyOifjI7FoDJHy5WDVqJsYDf6//5lXI0YK/aKFYk9Ey+CiR+yR09MFh+hrbQZmuy6J7Lr69GNSeHs+uyazalHBrzeywnuWskPtQLxL9mhtZqr6+nMJNBwoxshGG7ogDr1Okg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M/SARuw9; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M/SARuw9; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mst@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M/SARuw9;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M/SARuw9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mst@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZQgTv4SRZz2yDr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Mar 2025 03:59:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743353966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o3t3cKdFvQ9kSTO6AkCwvmYi+EYplfurO1UOS5Rdldo=;
	b=M/SARuw9QBRA+UGAykOCpEyNbDuswnrXndgFFcnkKhs2SzRSkQZZHuiqwKSaeQx3IqcxBp
	K6tHg2EB84LDCEugYNaEESW1944vW2gTP3v68Q9gruHBj17Ci5qPEm6vyov5HiCyoxUrSr
	yTtPmXR6K7emg/fLE/UOFRhKtaMEdmk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743353966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o3t3cKdFvQ9kSTO6AkCwvmYi+EYplfurO1UOS5Rdldo=;
	b=M/SARuw9QBRA+UGAykOCpEyNbDuswnrXndgFFcnkKhs2SzRSkQZZHuiqwKSaeQx3IqcxBp
	K6tHg2EB84LDCEugYNaEESW1944vW2gTP3v68Q9gruHBj17Ci5qPEm6vyov5HiCyoxUrSr
	yTtPmXR6K7emg/fLE/UOFRhKtaMEdmk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-336-15vDD6vHPxOQIYfluos9Lg-1; Sun, 30 Mar 2025 12:59:22 -0400
X-MC-Unique: 15vDD6vHPxOQIYfluos9Lg-1
X-Mimecast-MFC-AGG-ID: 15vDD6vHPxOQIYfluos9Lg_1743353961
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43941ad86d4so18579065e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Mar 2025 09:59:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743353961; x=1743958761;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o3t3cKdFvQ9kSTO6AkCwvmYi+EYplfurO1UOS5Rdldo=;
        b=ZbTtAsGIYY5SEglkXNqR8OjA9Mi0VzQUMNEw69056g2Ur9qD+KmqWJUoWuzKFNgGDV
         Gx7FCOFkW4wyzh0WmlUZCP8bzIdQV8dTLMjDC/rynkXDAPzzpijDTx2K37gXMERy/+Vr
         +cggEHzCTPJIUIZJLKtSXnO+quGNbYxQybgujMYzxMrrGcXm7VHKW5UlrkM2b+tpDYzx
         DJ44mTcGa3AnCb/DsNC7DbPD6WLsrGrTUfoF1oza+fv/zzdeSfH43JLQyqBl4lV8dHxa
         xYBf0YEZ4Dj/f43JLQXU6k9rpI17Rc7jOvUyG2cZqR8AJ1g+RmNF2mawjDSCvo4vRUOP
         L8Bw==
X-Forwarded-Encrypted: i=1; AJvYcCUoZIDQpD8Ynw2Tnx+cUCiK8YQhi0nkfpu9gJpLrMB1qFhuwY+5Qc+Xym3+qQaXpNYehurHnYGhkEK5EYA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyDBFu5Mzuw7Pf5TNQNlD+6MzDnlGHmuJ1I3qYsceTiERueoXp9
	GHJF7ao5xdUn3nBivjrYudRApzy/kwWU14+VBa3mHa+kAMzY+g1B2K5yHYkryogodJ9SwUdsLYY
	PFv6xhMCMrq7kcUNsiOoGzgGVlmOttTg1jrK7bLbqtXoglY/ym4tPN3oFAcqN22A=
X-Gm-Gg: ASbGnctKF/ZngaGX2VL3govsEUK0ssJ9tYCHrFNbeNX48lDT7GggO2gnG7uaz0dOCL8
	VnYvv/sUMYCJmXvCX02XyUlr2JBs0VTefCRWe9fjtjtrYWGD5l2BLpeGKC/cICupMX94//5nuX1
	0FX4x6jxtVb+BPdIxFyjgycgUVHElTW+gM+UiQTOVMi+2tExodrXf+GaAMOkxDSmYzUeGW1SKaR
	Aw15C+T5iDjfAyAGjGRcdnolwKuqDApRQBgR9pMWfKVRHVsP/0iY9kXLenLViClyoiKX2qQ01su
	YRtET86afw==
X-Received: by 2002:a05:600c:3b1a:b0:43c:f16a:641e with SMTP id 5b1f17b1804b1-43db61d774emr47821815e9.6.1743353960945;
        Sun, 30 Mar 2025 09:59:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+p9VLRRjFT3w4qBD/7B0LlHwO9LmFFwBhLcfryqChirTqXeZbU3Dh3SrxX6aYrpGFJgo00w==
X-Received: by 2002:a05:600c:3b1a:b0:43c:f16a:641e with SMTP id 5b1f17b1804b1-43db61d774emr47821495e9.6.1743353960480;
        Sun, 30 Mar 2025 09:59:20 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8ff02f9csm97569695e9.26.2025.03.30.09.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 09:59:18 -0700 (PDT)
Date: Sun, 30 Mar 2025 12:59:13 -0400
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
Message-ID: <20250330125637-mutt-send-email-mst@kernel.org>
References: <20210209062131.2300005-1-tientzu@chromium.org>
 <979b6a34ca5724ced1d4871b58bf227065d7da57.camel@infradead.org>
 <20250321142947-mutt-send-email-mst@kernel.org>
 <d1382a6ee959f22dc5f6628d8648af77f4702418.camel@infradead.org>
 <8e7084b04e5c0456c0ff32ea131a199c6af763cd.camel@infradead.org>
 <20250330093532-mutt-send-email-mst@kernel.org>
 <09fc164ebcfd893ffd67d1b224d6e1c5e5772ee0.camel@infradead.org>
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
In-Reply-To: <09fc164ebcfd893ffd67d1b224d6e1c5e5772ee0.camel@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: c07yrK91DfZsf8YxunVebuGIpvT32sBIzvsK78FAYuI_1743353961
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Mar 30, 2025 at 04:07:56PM +0100, David Woodhouse wrote:
> On Sun, 2025-03-30 at 09:42 -0400, Michael S. Tsirkin wrote:
> > On Fri, Mar 28, 2025 at 05:40:41PM +0000, David Woodhouse wrote:
> > > On Fri, 2025-03-21 at 18:42 +0000, David Woodhouse wrote:
> > > > > 
> > > > > I don't mind as such (though I don't understand completely), but since
> > > > > this is changing the device anyway, I am a bit confused why you can't
> > > > > just set the VIRTIO_F_ACCESS_PLATFORM feature bit?  This forces DMA API
> > > > > which will DTRT for you, will it not?
> > > > 
> > > > That would be necessary but not sufficient. ...
> > 
> > could you explain pls?
> 
> There was more to that in the previous email which I elided for this
> followup.
> 
> https://lore.kernel.org/all/d1382a6ee959f22dc5f6628d8648af77f4702418.camel@infradead.org/
> 
> > > My first cut at a proposed spec change looks something like this. I'll
> > > post it to the virtio-comment list once I've done some corporate
> > > bureaucracy and when the list stops sending me python tracebacks in
> > > response to my subscribe request.
> > 
> > the linux foundation one does this? maybe poke at the admins.
> > 
> > > In the meantime I'll hack up some QEMU and guest Linux driver support
> > > to match.
> > > 
> > > diff --git a/content.tex b/content.tex
> > > index c17ffa6..1e6e1d6 100644
> > > --- a/content.tex
> > > +++ b/content.tex
> > > @@ -773,6 +773,9 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
> > >  Currently these device-independent feature bits are defined:
> > >  
> > >  \begin{description}
> > > +  \item[VIRTIO_F_SWIOTLB (27)] This feature indicates that the device
> > > +  provides a memory region which is to be used for bounce buffering,
> > > +  rather than permitting direct memory access to system memory.
> > >    \item[VIRTIO_F_INDIRECT_DESC (28)] Negotiating this feature indicates
> > >    that the driver can use descriptors with the VIRTQ_DESC_F_INDIRECT
> > >    flag set, as described in \ref{sec:Basic Facilities of a Virtio
> > > @@ -885,6 +888,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
> > >  VIRTIO_F_ACCESS_PLATFORM is not offered, then a driver MUST pass only physical
> > >  addresses to the device.
> > >  
> > > +A driver SHOULD accept VIRTIO_F_SWIOTLB if it is offered, and it MUST
> > > +then pass only addresses within the Software IOTLB bounce buffer to the
> > > +device.
> > > +
> > >  A driver SHOULD accept VIRTIO_F_RING_PACKED if it is offered.
> > >  
> > >  A driver SHOULD accept VIRTIO_F_ORDER_PLATFORM if it is offered.
> > > @@ -921,6 +928,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
> > >  A device MAY fail to operate further if VIRTIO_F_ACCESS_PLATFORM is not
> > >  accepted.
> > >  
> > > +A device MUST NOT offer VIRTIO_F_SWIOTLB if its transport does not
> > > +provide a Software IOTLB bounce buffer.
> > > +A device MAY fail to operate further if VIRTIO_F_SWIOTLB is not accepted.
> > > +
> > >  If VIRTIO_F_IN_ORDER has been negotiated, a device MUST use
> > >  buffers in the same order in which they have been available.
> > >  
> > > diff --git a/transport-pci.tex b/transport-pci.tex
> > > index a5c6719..23e0d57 100644
> > > --- a/transport-pci.tex
> > > +++ b/transport-pci.tex
> > > @@ -129,6 +129,7 @@ \subsection{Virtio Structure PCI Capabilities}\label{sec:Virtio Transport Option
> > >  \item ISR Status
> > >  \item Device-specific configuration (optional)
> > >  \item PCI configuration access
> > > +\item SWIOTLB bounce buffer
> > >  \end{itemize}
> > >  
> > >  Each structure can be mapped by a Base Address register (BAR) belonging to
> > > @@ -188,6 +189,8 @@ \subsection{Virtio Structure PCI Capabilities}\label{sec:Virtio Transport Option
> > >  #define VIRTIO_PCI_CAP_SHARED_MEMORY_CFG 8
> > >  /* Vendor-specific data */
> > >  #define VIRTIO_PCI_CAP_VENDOR_CFG        9
> > > +/* Software IOTLB bounce buffer */
> > > +#define VIRTIO_PCI_CAP_SWIOTLB           10
> > >  \end{lstlisting}
> > >  
> > >          Any other value is reserved for future use.
> > > @@ -744,6 +747,36 @@ \subsubsection{Vendor data capability}\label{sec:Virtio
> > >  The driver MUST qualify the \field{vendor_id} before
> > >  interpreting or writing into the Vendor data capability.
> > >  
> > > +\subsubsection{Software IOTLB bounce buffer capability}\label{sec:Virtio
> > > +Transport Options / Virtio Over PCI Bus / PCI Device Layout /
> > > +Software IOTLB bounce buffer capability}
> > > +
> > > +The optional Software IOTLB bounce buffer capability allows the
> > > +device to provide a memory region which can be used by the driver
> > > +driver for bounce buffering. This allows a device on the PCI
> > > +transport to operate without DMA access to system memory addresses.
> > > +
> > > +The Software IOTLB region is referenced by the
> > > +VIRTIO_PCI_CAP_SWIOTLB capability. Bus addresses within the referenced
> > > +range are not subject to the requirements of the VIRTIO_F_ORDER_PLATFORM
> > > +capability, if negotiated.
> > 
> > 
> > why not? an optimization?
> > A mix of swiotlb and system memory might be very challenging from POV
> > of ordering.
> 
> Conceptually, these addresses are *on* the PCI device. If the device is
> accessing addresses which are local to it, they aren't subject to IOMMU
> translation/filtering because they never even make it to the PCI bus as
> memory transactions.
> 
> > 
> > > +
> > > +\devicenormative{\paragraph}{Software IOTLB bounce buffer capability}{Virtio
> > > +Transport Options / Virtio Over PCI Bus / PCI Device Layout /
> > > +Software IOTLB bounce buffer capability}
> > > +
> > > +Devices which present the Software IOTLB bounce buffer capability
> > > +SHOULD also offer the VIRTIO_F_SWIOTLB feature.
> > > +
> > > +\drivernormative{\paragraph}{Software IOTLB bounce buffer capability}{Virtio
> > > +Transport Options / Virtio Over PCI Bus / PCI Device Layout /
> > > +Software IOTLB bounce buffer capability}
> > > +
> > > +The driver SHOULD use the offered buffer in preference to passing system
> > > +memory addresses to the device.
> > 
> > Even if not using VIRTIO_F_SWIOTLB? Is that really necessary?
> 
> That part isn't strictly necessary, but I think it makes sense, for
> cases where the SWIOTLB support is an *optimisation* even if it isn't
> strictly necessary.
> 
> Why might it be an "optimisation"? Well... if we're thinking of a model
> like pKVM where the VMM can't just arbitrarily access guest memory,
> using the SWIOTLB is a simple way to avoid that (by using the on-board
> memory instead, which *can* be shared with the VMM).
> 
> But if we want to go to extra lengths to support unenlightened guests,
> an implementation might choose to just *disable* the memory protection
> if the guest doesn't negotiate VIRTIO_F_SWIOTLB, instead of breaking
> that guest.
> 
> Or it might have a complicated emulation/snooping of virtqueues in the
> trusted part of the hypervisor so that it knows which addresses the
> guest has truly *asked* the VMM to access. (And yes, of course that's
> what an IOMMU is for, but when have you seen hardware companies design
> a two-stage IOMMU which supports actual PCI passthrough *and* get it
> right for the hypervisor to 'snoop' on the stage1 page tables to
> support emulated devices too....)
> 
> Ultimately I think it was natural to advertise the location of the
> buffer with the VIRTIO_PCI_CAP_SWIOTLB capability and then to have the
> separate VIRTIO_F_SWIOTLB for negotiation... leaving the obvious
> question of what a device should do if it sees one but *not* the other.
> 
> Obviously you can't have VIRTIO_F_SWIOTLB *without* there actually
> being a buffer advertised with VIRTIO_PCI_CAP_SWIOTLB (or its
> equivalent for other transports). But the converse seemed reasonable as
> a *hint* even if the use of the SWIOTLB isn't mandatory.

OK but I feel it's more work than you think, so we really need
a better reason than just "why not".

For example, it's not at all clear to me how the ordering is
going to work if buffers are in memory but the ring is swiotlb
or the reverse. Ordering will all be messed up.

-- 
MST


