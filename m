Return-Path: <linuxppc-dev+bounces-7389-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C397A75B44
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Mar 2025 19:07:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZQgfY67pBz2yLJ;
	Mon, 31 Mar 2025 04:07:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743354421;
	cv=none; b=JefsFnj1XxQ+duGw4Y+A/lJ5sJ3bIAUuycuPRBVgJA6qJQmif0kuld2nAUVemPegVgO9ixuRTacvx4+FVZtW/AFPk22Y8c5YbK/fncvUJrOVXtvNTXEW+J3ZJju86RxFcVNJVJxBlzBABJp7/ld/2jiFJv317phYHROLgt/1RpfrKJEosxMgdTn/dYHPmSkjrKbT5rXQJ8EYCzuG8Fb06kPmV5rRZqyTq/+oDEodsFfqTv5bUDjtqsAFRkbOtQgKjwcJfsfOPNWeV+EFSIocUKSoKCxx2PYVdwItsoBYxZ4mU7KITohoGXvjWrIlc3oMctWvB8J6jsnqtfSKYGViqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743354421; c=relaxed/relaxed;
	bh=Q3mk6TbPcxIg/goVXurjT8cjd9wFt7uMusUUceOMSw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=c+H6vTSZ/7gvmNzmfzLo1+kw+tjsGfeF0hjvJHEMUNAa/5uRuVi6hTNkNWOrLYD0icE3HdP3gYjmn4fuDOKqbGzs0Ei01c1cjcYoP5kHIw4ePAkYnZ74Zssl+MDF3SKITwOa74YRLvxF+bN5B8DS2cvnc7xYc+UpDYCgJIVcl1S66kxmb4Si2Ytjj9Kgkb3T9MhDB1HMqESUkV0MAwgroVyy55FbC0XnX7pdmH1gcizgVEtYX4MOzDpXE/Ao4fbxNO3AZJ7uWtDqSxPT3PlVztDqvrwbzURQypFm6lCffeeJTsKap8sqyh5zSzHSyDP3CyWWbPZtxwZo/CyNj+UINw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gnsH83w+; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gnsH83w+; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mst@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gnsH83w+;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gnsH83w+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mst@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZQgfX6qZfz2yDH
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Mar 2025 04:07:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743354416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q3mk6TbPcxIg/goVXurjT8cjd9wFt7uMusUUceOMSw4=;
	b=gnsH83w+LEvnz/9UzYJxOSwl0DD3U4YQF62i+QZPC3hocp/LTC5bu5oMMAiWKKf3auiR5M
	SOybO3X3P5MLBzWwLubmq/5bZB5tTHSEGiMj2hsfC2fXyPQbZuAtjqeu1U6nzZdq7CPyWA
	mmdqmcvS7lkNSuVxJ/T3JfoEEIzoeQU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743354416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q3mk6TbPcxIg/goVXurjT8cjd9wFt7uMusUUceOMSw4=;
	b=gnsH83w+LEvnz/9UzYJxOSwl0DD3U4YQF62i+QZPC3hocp/LTC5bu5oMMAiWKKf3auiR5M
	SOybO3X3P5MLBzWwLubmq/5bZB5tTHSEGiMj2hsfC2fXyPQbZuAtjqeu1U6nzZdq7CPyWA
	mmdqmcvS7lkNSuVxJ/T3JfoEEIzoeQU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-145-Zk-M6RRPNIyalbgwcqGPYw-1; Sun, 30 Mar 2025 13:06:55 -0400
X-MC-Unique: Zk-M6RRPNIyalbgwcqGPYw-1
X-Mimecast-MFC-AGG-ID: Zk-M6RRPNIyalbgwcqGPYw_1743354414
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3913aaf1e32so2134087f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Mar 2025 10:06:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743354414; x=1743959214;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q3mk6TbPcxIg/goVXurjT8cjd9wFt7uMusUUceOMSw4=;
        b=aLNR+CMOSP6kKcnshCJ8QvE2urrSGeqcpgRkklYeHs+v0nOuYiHTgL0/vILaQzC/6a
         J3i6kq/u7+mM8l0hgEcufNzcFFe/Qh1Lpg8hOEyTiz1oNzjY/D8bU85YMxVyfqjVGirh
         NBZRLkMjs+8HSKpH+5N0RCn8opNcW1KH7efZPXWuN0VhqbOo3XBNRuMmsQuex2OveXML
         64pumUad9Bu6Drt1pQ6H/66KCg6086WwaofNsCsl9wBW9J6QLCo77JtUQSWHyOQme0/Y
         PClg3MBx4ppYt9wztagBbsbhhGhyKsbaj2oSoCPnY5+CAGka4wXQRJkXoBUtn73SJT17
         gaCw==
X-Forwarded-Encrypted: i=1; AJvYcCXJEYL16giwvxisbIQWThqhbauJYHqwHQaujIRbad+j3FJGBi1Da/LbBOE0gfASHZ3yHXgme1WrMzd0WEg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyVdOTs5If+xGJyVL1QPKPSFYh6+FMYo8aXsKpgBqN/vjj28Adi
	CtpGaaMqIM911JCKTRYOHFbXiWGmYi3hXfL7CuBu/fjPJmhVfYvXRbBvL+YenilsdM2gv4Jp1Dd
	QI8l9TfSc1pVUo71DJA73nkOX0W2IHoFbtbSh/QkztbXcjrZD454x8uZVgyl0mKA=
X-Gm-Gg: ASbGncskGEoTNcA6Lw9F85dAr8bIwj8TU3bCvqW3I8twDUYtBVO0FOG2onr7KyjNAqb
	t5CbUam1PebeuI54UQXqZDvEfaIrddbWSVmsH+DPn0uTMdpXbsD7qVrIR0GKzaCI4GHFr1H2xMv
	emmeqxOR5bhSV4Ewnx6eX4KpKD4VC6D4s7EapiLfL2er84VFWc93s/+todMHgN16HZpYaE48WzA
	qKSp+5spsRuUQoZuK/m6NQWaleVEpb6RP0gQpMWfhfus8xuoRxpzOI9PqZD9JeTvS3vNxjaO3YW
	PzBbWpyVVA==
X-Received: by 2002:a05:6000:290f:b0:390:f552:d291 with SMTP id ffacd0b85a97d-39c120dc53emr6045360f8f.22.1743354413867;
        Sun, 30 Mar 2025 10:06:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHnojfMbGERAUL3k9pGdjXNeKSJM3z6oVNts7beynMJRyZ4qGr50Up8p35T+/D9THLJjAJmw==
X-Received: by 2002:a05:6000:290f:b0:390:f552:d291 with SMTP id ffacd0b85a97d-39c120dc53emr6045310f8f.22.1743354413473;
        Sun, 30 Mar 2025 10:06:53 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8ff02e75sm96683605e9.30.2025.03.30.10.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 10:06:52 -0700 (PDT)
Date: Sun, 30 Mar 2025 13:06:47 -0400
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
Message-ID: <20250330125929-mutt-send-email-mst@kernel.org>
References: <20210209062131.2300005-1-tientzu@chromium.org>
 <979b6a34ca5724ced1d4871b58bf227065d7da57.camel@infradead.org>
 <20250321142947-mutt-send-email-mst@kernel.org>
 <d1382a6ee959f22dc5f6628d8648af77f4702418.camel@infradead.org>
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
In-Reply-To: <d1382a6ee959f22dc5f6628d8648af77f4702418.camel@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JOeNCSSQIvnJNIa6gq53cFwb3aIO-lqHUqATOWgCM0o_1743354414
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Mar 21, 2025 at 06:42:20PM +0000, David Woodhouse wrote:
> On Fri, 2025-03-21 at 14:32 -0400, Michael S. Tsirkin wrote:
> > On Fri, Mar 21, 2025 at 03:38:10PM +0000, David Woodhouse wrote:
> > > On Tue, 2021-02-09 at 14:21 +0800, Claire Chang wrote:
> > > > This series implements mitigations for lack of DMA access control on
> > > > systems without an IOMMU, which could result in the DMA accessing the
> > > > system memory at unexpected times and/or unexpected addresses, possibly
> > > > leading to data leakage or corruption.
> > > 
> > > Replying to an ancient (2021) thread which has already been merged...
> > > 
> > > I'd like to be able to use this facility for virtio devices.
> > > 
> > > Virtio already has a complicated relationship with the DMA API, because
> > > there were a bunch of early VMM bugs where the virtio devices where
> > > magically exempted from IOMMU protection, but the VMM lied to the guest
> > > and claimed they weren't.
> > > 
> > > With the advent of confidential computing, and the VMM (or whatever's
> > > emulating the virtio device) not being *allowed* to arbitrarily access
> > > all of the guest's memory, the DMA API becomes necessary again.
> > > 
> > > Either a virtual IOMMU needs to determine which guest memory the VMM
> > > may access, or the DMA API is wrappers around operations which
> > > share/unshare (or unencrypt/encrypt) the memory in question.
> > > 
> > > All of which is complicated and slow, if we're looking at a minimal
> > > privileged hypervisor stub like pKVM which enforces the lack of guest
> > > memory access from VMM.
> > > 
> > > I'm thinking of defining a new type of virtio-pci device which cannot
> > > do DMA to arbitrary system memory. Instead it has an additional memory
> > > BAR which is used as a SWIOTLB for bounce buffering.
> > > 
> > > The driver for it would look much like the existing virtio-pci device
> > > except that it would register the restricted-dma region first (and thus
> > > the swiotlb dma_ops), and then just go through the rest of the setup
> > > like any other virtio device.
> > > 
> > > That seems like it ought to be fairly simple, and seems like a
> > > reasonable way to allow an untrusted VMM to provide virtio devices with
> > > restricted DMA access.
> > > 
> > > While I start actually doing the typing... does anyone want to start
> > > yelling at me now? Christoph? mst? :)
> > 
> > 
> > I don't mind as such (though I don't understand completely), but since
> > this is changing the device anyway, I am a bit confused why you can't
> > just set the VIRTIO_F_ACCESS_PLATFORM feature bit?  This forces DMA API
> > which will DTRT for you, will it not?
> 
> That would be necessary but not sufficient. The question is *what* does
> the DMA API do?
> 
> For a real passthrough PCI device, perhaps we'd have a vIOMMU exposed
> to the guest so that it can do real protection with two-stage page
> tables (IOVA→GPA under control of the guest, GPA→HPA under control of
> the hypervisor). For that to work in the pKVM model though, you'd need
> pKVM to be talking the guest's stage1 I/O page tables to see if a given
> access from the VMM ought to be permitted?
> 
> Or for confidential guests there could be DMA ops which are an
> 'enlightenment'; a hypercall into pKVM to share/unshare pages so that
> the VMM can actually access them, or SEV-SNP guests might mark pages
> unencrypted to have the same effect with hardware protection.
> 
> Doing any of those dynamically to allow the VMM to access buffers in
> arbitrary guest memory (when it wouldn't normally have access to
> arbitrary guest memory) is complex and doesn't perform very well. And
> exposes a full 4KiB page for any byte that needs to be made available.
> 
> Thus the idea of having a fixed range of memory to use for a SWIOTLB,
> which is fairly much what the restricted DMA setup is all about.
> 
> We're just proposing that we build it in to a virtio-pci device model,
> which automatically uses the extra memory BAR instead of the
> restricted-dma-pool DT node.
> 
> It's basically just allowing us to expose through PCI, what I believe
> we can already do for virtio in DT.

I am not saying I am against this extension.
The idea to restrict DMA has a lot of merit outside pkvm.
For example, with a physical devices, limiting its DMA
to a fixed range can be good for security at a cost of
an extra data copy.

So I am not saying we have to block this specific hack.

what worries me fundamentally is I am not sure it works well
e.g. for physical virtio cards.
Attempts to pass data between devices will now also require
extra data copies.


Did you think about adding an swiotlb mode to virtio-iommu at all?
Much easier than parsing page tables.



-- 
MST


