Return-Path: <linuxppc-dev+bounces-7276-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FF2A6C26B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Mar 2025 19:33:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZK9zw1rmRz30T0;
	Sat, 22 Mar 2025 05:33:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742581980;
	cv=none; b=dudOa6lzWGpUfuSJ2VpzJQKQO4NYtCA7JiW6Vh9pJDuifIfZjioo10M55s8jSoxrtZm1cKlTGKRry133nLMOeqeYLScKXhrSxkaBCUdiv6KD18LOXwJCMQRCdDk6FNL7FwhIWfvHIUqMUxdWlUZUqxl8ROGvN3kZQTXK6a+M8q9u0p7GWNXdlZ2hzS7yHSdknTmby+oVOfc7RBN865V6TxF1FC5+MAhZq+uN31dt4zPLLHiMo55D6wI4VbQL50BX+efyQmYBrhMArEtcPAfn9jEg3fLoeyHCJA9Z/0rRL2CXTbGy1AVx54Uy0AMPKsjC/w18CZHdlV3CLy5dcIgFVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742581980; c=relaxed/relaxed;
	bh=x6Pr4yNEy0Ee63hyTGb7eb9xdvxKn8eEKjzFLCkdY+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ij7Kx1DHVe23WV/25mFbcavEMdOVuTXPQQsaQQw8lPdz6MsAxoTj0CSZaZx0QAZ72G18YkDZXzmb8iqS9LrYnK3ISESuuQKCxv6O4x4GAuohTZEnGDWjIyeTQgIXImbtEd/yy8G1duFxyKiHnBqPMGbQFI34pmSzMGpxpFhSce0QU96+z4IGp80g/JVzkQ4Hqp4Q3D1wis+ZXcqrXtCudeFMXdkictH+eQ194CT6ovR9HAyrLGLVgzX30xLCZTmuA8Fe7yZKySmDcQVFaWKSTD8OGg6ejxcGnoZpbccyiQbk+gZ7tWDRh+93n7c9O+35jbv5OZVTrXyGRN8slHz8Zg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GbFIe3ee; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GbFIe3ee; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mst@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GbFIe3ee;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GbFIe3ee;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mst@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZK9zt6XfQz30Ql
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Mar 2025 05:32:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742581973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x6Pr4yNEy0Ee63hyTGb7eb9xdvxKn8eEKjzFLCkdY+o=;
	b=GbFIe3eewwO4mimRQyeW99aNfI8k9tqqKB7QUWZMfBoHoWKxG9fAla7lkdFUCbqMY0IRMm
	aTi1GsVenFgZVo98Gv7xsxh0ydLLDv++sLalWKwLG3j6CsXGsSkjS/0jH7bsAI6m6KxD10
	18ZuhJ6C/CvknLsRki4p7Zietn2Nrxk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742581973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x6Pr4yNEy0Ee63hyTGb7eb9xdvxKn8eEKjzFLCkdY+o=;
	b=GbFIe3eewwO4mimRQyeW99aNfI8k9tqqKB7QUWZMfBoHoWKxG9fAla7lkdFUCbqMY0IRMm
	aTi1GsVenFgZVo98Gv7xsxh0ydLLDv++sLalWKwLG3j6CsXGsSkjS/0jH7bsAI6m6KxD10
	18ZuhJ6C/CvknLsRki4p7Zietn2Nrxk=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-378-kNMZBkICPs-a5ddnVbhrAA-1; Fri, 21 Mar 2025 14:32:36 -0400
X-MC-Unique: kNMZBkICPs-a5ddnVbhrAA-1
X-Mimecast-MFC-AGG-ID: kNMZBkICPs-a5ddnVbhrAA_1742581955
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-224191d9228so44899555ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 11:32:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742581955; x=1743186755;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x6Pr4yNEy0Ee63hyTGb7eb9xdvxKn8eEKjzFLCkdY+o=;
        b=h8E1HzXqmJZ6YHpKTN7b46/vcBZJNwwUHn/2XwqOBzMTMoqN9u2bdT3RGzr40NwZrg
         wXzyGwHEis10kBcVOrTNNjO2EkjCkXC+8WRlmVjFW+kuDAMM+7ZBitQPiplS3xTDuHPv
         cI2JlSNvG8FPwkskuIBcpA37HIpWEVcWCUrcTSdZKzeO2iSt2AFLYsQV5aFPl4ZwGBIv
         pfuDdlLUOR6kuo1dXFUE5GyNWi1bfprzasQFUt+OPZWud9fPmxDH1ktvIrBmKRDGupoD
         r0PthlJwLvoc8L81dPvDzOZDiT5xKdwp12xrxk7MB4h1OoENelfGqqy/q5bVA+xRcgx3
         KU8g==
X-Forwarded-Encrypted: i=1; AJvYcCUoZhU1ftZ8hPBEpixEoUM4w08Oio6t+c4LKRcOebNhvyF2Cu87Sc/Qfly4yHnf5pIHUSojzLujrbXdQQE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz812MP4G7eVn5kQRpEF9GB+kW6nSmZV//r414qfs5q57L/3AG1
	Qi6IQVCptYqU436Bip4ia2BzTlcKsNx5oQpN7yr82M4trpZYtbno9nHPwYJxtFhrzmmxyTozxeT
	cRAFagmD0Semw52n5BwwpV4dRnfPNGN2KtSfnME/2t/NLLwVZXOjXcN2NIOahiHo=
X-Gm-Gg: ASbGncuGrCOYCLLA8NAM+Cbm72RW/vRK9l1LQ/vjuVf7LNsWZBH0uEGlncsJxxOGtEm
	nNxDE/IrBaPVyDVgAKASZycxBOLAZFKNVzDEb57AAo378aCkhBAWbjeYZ8pmqHm7cIrU0VQk0Ik
	NjnSXF4wkrIKsZ+owQnRl7wvuVrljUO4CEtJTE5Fx7LcdYwloaV3IeVoIqA0TYHA/S+H7Iw/3TA
	jUcfKGCeELiT1AwbPA3ak7FcDN1zqdQq01u00kVgFKhndCdJ6m1a2CNFDieWFV7xbKD3eckkVG+
	U0l+2NR+
X-Received: by 2002:a05:6a00:3d49:b0:736:592e:795f with SMTP id d2e1a72fcca58-7390598e637mr6094593b3a.9.1742581954609;
        Fri, 21 Mar 2025 11:32:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgvI4Fq7PhyVG2/6UfPhY7tEePZCtkHS/CCaoQm+lEN40XhsJxvkXhRtIdT7ONaz8I8Nvvbw==
X-Received: by 2002:a05:6a00:3d49:b0:736:592e:795f with SMTP id d2e1a72fcca58-7390598e637mr6094532b3a.9.1742581953971;
        Fri, 21 Mar 2025 11:32:33 -0700 (PDT)
Received: from redhat.com ([195.133.138.172])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390618e08esm2305706b3a.169.2025.03.21.11.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 11:32:33 -0700 (PDT)
Date: Fri, 21 Mar 2025 14:32:24 -0400
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
Message-ID: <20250321142947-mutt-send-email-mst@kernel.org>
References: <20210209062131.2300005-1-tientzu@chromium.org>
 <979b6a34ca5724ced1d4871b58bf227065d7da57.camel@infradead.org>
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
In-Reply-To: <979b6a34ca5724ced1d4871b58bf227065d7da57.camel@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1D0TGb4GnNK3fLAMV1r3OS7-u1s_FpOh50meTEjTtkw_1742581955
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Mar 21, 2025 at 03:38:10PM +0000, David Woodhouse wrote:
> On Tue, 2021-02-09 at 14:21 +0800, Claire Chang wrote:
> > This series implements mitigations for lack of DMA access control on
> > systems without an IOMMU, which could result in the DMA accessing the
> > system memory at unexpected times and/or unexpected addresses, possibly
> > leading to data leakage or corruption.
> 
> Replying to an ancient (2021) thread which has already been merged...
> 
> I'd like to be able to use this facility for virtio devices.
> 
> Virtio already has a complicated relationship with the DMA API, because
> there were a bunch of early VMM bugs where the virtio devices where
> magically exempted from IOMMU protection, but the VMM lied to the guest
> and claimed they weren't.
> 
> With the advent of confidential computing, and the VMM (or whatever's
> emulating the virtio device) not being *allowed* to arbitrarily access
> all of the guest's memory, the DMA API becomes necessary again.
> 
> Either a virtual IOMMU needs to determine which guest memory the VMM
> may access, or the DMA API is wrappers around operations which
> share/unshare (or unencrypt/encrypt) the memory in question.
> 
> All of which is complicated and slow, if we're looking at a minimal
> privileged hypervisor stub like pKVM which enforces the lack of guest
> memory access from VMM.
> 
> I'm thinking of defining a new type of virtio-pci device which cannot
> do DMA to arbitrary system memory. Instead it has an additional memory
> BAR which is used as a SWIOTLB for bounce buffering.
> 
> The driver for it would look much like the existing virtio-pci device
> except that it would register the restricted-dma region first (and thus
> the swiotlb dma_ops), and then just go through the rest of the setup
> like any other virtio device.
> 
> That seems like it ought to be fairly simple, and seems like a
> reasonable way to allow an untrusted VMM to provide virtio devices with
> restricted DMA access.
> 
> While I start actually doing the typing... does anyone want to start
> yelling at me now? Christoph? mst? :)


I don't mind as such (though I don't understand completely), but since
this is changing the device anyway, I am a bit confused why you can't
just set the VIRTIO_F_ACCESS_PLATFORM feature bit?  This forces DMA API
which will DTRT for you, will it not?

-- 
MST


