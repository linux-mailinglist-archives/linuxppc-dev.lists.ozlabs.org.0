Return-Path: <linuxppc-dev+bounces-7392-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9041A75CC4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Mar 2025 23:49:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZQnvv6zXwz2yGM;
	Mon, 31 Mar 2025 08:48:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743371339;
	cv=none; b=XZhgc9qjGJola2edjAp9GKaKSGc8I5yA4QBazX1uViGsoLs0llxQZBSD2+gYdjsJNTEX1hdLWlZUPFnUcOEPWHkq/IsTk4Up90RaSDt8LJrXXpH8UusmYG4fv8GraeR8iurJI0CwYeXtIKK4V4HH8pPHJmgfbsMQzFeERWbxNDgESV/gjr4sDpE/oe/neSTsnVapD93ejtV00WnFulXsmX0wyq+F3Oir/T9n0OIzZxQcyC3ZMdzjUT/C3GZGUvRQYWw61hAPXkYHcE40wTVrQ7Ao6vdNWGSQM2zN3vlEO4Uv6CTOC/9M2e7y1BCmPPUkrm7495HbD05tedRpwzf9Og==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743371339; c=relaxed/relaxed;
	bh=MRkqFL3NXkPCwg+oa2kxw02pthB6mXCTdemECWhwX84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=PeGwplUcdbCzVSqR3joe9foy+JJpAZWzHG1kJpYuD83L0uXEmI6YjkvM4vYzSIFDKHHLXbovHI3rYeY78Ks9X/G36TOSBm0sOFLirLlhpixDyMbWG+4EL03KkX5Xv+aQaT5LUMcsYvQOkIP/sSE42ufp4NGWsFwym49yLJAsQjC85mGtIt+s9IBDy4PAJwSHOVY0Z/NYJI06B1FEQ52fMG3v0oxYwaZ/f7srPZzmAm+Z+18sBENWZg74xyZKurnkgMaUB5umAhHhuubA9Zuv3TO998OLs99GQnRATfBlCt3hM6Asop0ZQBdvt2O4EP6t6p4Ankl+kvIZ2Kg8WlLAzw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hNpU6pON; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WeSlSjxc; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mst@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hNpU6pON;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WeSlSjxc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=mst@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZQnvt35QGz2yFQ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Mar 2025 08:48:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743371332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MRkqFL3NXkPCwg+oa2kxw02pthB6mXCTdemECWhwX84=;
	b=hNpU6pONKodQd8M3EaFiv2hkW8z9T57xb8mKe/6fwQP4r2uOXMyqo/dfIt+nlnwHmtXVbq
	wQ1vehs87NGYy8Q7MT4LQCIlSRbjYF5CCA/r/K1EJJlhdTm8m3Hk+CthvJvXu8MncyODep
	UN7+vTARjHsksykNsg+mytaw1YWHr/o=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743371333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MRkqFL3NXkPCwg+oa2kxw02pthB6mXCTdemECWhwX84=;
	b=WeSlSjxchfJWofv4M/MyeZNmoHcBef57iP1o6nydHKxp1sGcVJdSExvlsgpTJByNBeAm37
	tQj6qO+yhudRUmsfKvv1WYvG+/6Bv/dBhXGl8R7S+m8qM0Grhm8AqtRE0na2RHfWk7XZPx
	G5I7W5ipiJV4uD2+XnL2qzk9bm94FkI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-1EbEpr_0NIqMRwQx6T7l9A-1; Sun, 30 Mar 2025 17:48:50 -0400
X-MC-Unique: 1EbEpr_0NIqMRwQx6T7l9A-1
X-Mimecast-MFC-AGG-ID: 1EbEpr_0NIqMRwQx6T7l9A_1743371330
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d51bd9b45so24669975e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Mar 2025 14:48:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743371330; x=1743976130;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MRkqFL3NXkPCwg+oa2kxw02pthB6mXCTdemECWhwX84=;
        b=hSNn7sFD4gxsRGBu9jLmzzPhkroY9wnwbY3LMsmQYUkxlcv9F1vpq1BOyTX4atIs1M
         bJfXS4rZgS536vNbI27w7c3urdvzG769iGF5BFj+98WCUxc9zPhCjSUF1B0e8zy9izQ8
         WDxM6NMSVSoXdJ7QVN0VfPRRoXxjxhMTsx3lGPKV7Esthu9R78GJxBWfZpQCdkrvhKJK
         qN9ioAnIveBm8I7cxkAO2KsOP91ly5z/KHvdcZ6i1wrdZcOc6+VHtwLj5cC88gP09Gbu
         AQFU8w8IYwZdqHZGOCjhjFrbhz0bHrCaWtST3Ne25GFLcYhL9CkVgHXt6li49SLZXcqt
         hzxA==
X-Gm-Message-State: AOJu0YwuxBOqBtk9bOg4E661Hot4hJQcVuiRN9HLnIh5GHU724xDTv7P
	LTDkdhcSdr/jMJICcJmW9XoTiMfUs+DX3aVPKhwxjHfHojYGeYwZGEn6OyFhhrgn4ip21HAyiGN
	W1DNjsTqO19yT7FhextSJ1bTR2GEfxuwn/wmgyddetT431RwHyF6Sg7l33pPK46s=
X-Gm-Gg: ASbGncuwr+gC/fI7HyTc/ZlhTFw5N/L3vNPtlBLUhJfFhmfNkUCDcn+hYwmXyzxw2QX
	rtzQrQmvRWJOjXTe3DDpUXZmb42dxyXHjzQ/mm6HBHOfCLNQAGfsI4wYgvFI/5JZ1hATbbDv3Vt
	YfqZrAruU+1t7hz/Sj0PINTwxCN1Eb2EYOJto0LRLrMnKIIBv5Jwv8cxNIyJL0JJjYgnvVjOpbx
	WoQApuLjHd7o9124uHbxjGrMnBH3fCwYx2m1GSoBwxtUZ5DSfaXCJVcXU/6kKq3fBt5xwhYUnrr
	Qk7iPluq8A==
X-Received: by 2002:a05:600c:1d8c:b0:43c:f050:fee8 with SMTP id 5b1f17b1804b1-43db628992cmr52509305e9.20.1743371329771;
        Sun, 30 Mar 2025 14:48:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1kdHHR/M4aOUOFDnZpG/iLLAoqQlqVBS2836/4CKe19RX2SyJrF+xilFjC/1QxsrymXzr6Q==
X-Received: by 2002:a05:600c:1d8c:b0:43c:f050:fee8 with SMTP id 5b1f17b1804b1-43db628992cmr52509055e9.20.1743371329422;
        Sun, 30 Mar 2025 14:48:49 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82e83477sm147882045e9.16.2025.03.30.14.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 14:48:48 -0700 (PDT)
Date: Sun, 30 Mar 2025 17:48:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linuxppc-dev@lists.ozlabs.org, Claire Chang <tientzu@chromium.org>,
	Rob Herring <robh+dt@kernel.org>, mpe@ellerman.id.au,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
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
Message-ID: <20250330173951-mutt-send-email-mst@kernel.org>
References: <20210209062131.2300005-1-tientzu@chromium.org>
 <979b6a34ca5724ced1d4871b58bf227065d7da57.camel@infradead.org>
 <20250321142947-mutt-send-email-mst@kernel.org>
 <d1382a6ee959f22dc5f6628d8648af77f4702418.camel@infradead.org>
 <20250330125929-mutt-send-email-mst@kernel.org>
 <E3EE485D-AD74-457C-BDEC-F8C62DFE4909@infradead.org>
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
In-Reply-To: <E3EE485D-AD74-457C-BDEC-F8C62DFE4909@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uzGAdSGCywfps4YUh6PvhfUGGGQMos7yB5TXJ_cnEVE_1743371330
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Mar 30, 2025 at 10:27:58PM +0100, David Woodhouse wrote:
> On 30 March 2025 18:06:47 BST, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >> It's basically just allowing us to expose through PCI, what I believe
> >> we can already do for virtio in DT.
> >
> >I am not saying I am against this extension.
> >The idea to restrict DMA has a lot of merit outside pkvm.
> >For example, with a physical devices, limiting its DMA
> >to a fixed range can be good for security at a cost of
> >an extra data copy.
> >
> >So I am not saying we have to block this specific hack.
> >
> >what worries me fundamentally is I am not sure it works well
> >e.g. for physical virtio cards.
> 
> Not sure why it doesn't work for physical cards. They don't need to be bus-mastering; they just take data from a buffer in their own RAM.

I mean, it kind of does, it is just that CPU pulling data over the PCI bus
stalls it so is very expensive. It is not by chance people switched to
DMA almost exclusively.


> >Attempts to pass data between devices will now also require
> >extra data copies.
> 
> Yes. I think that's acceptable, but if we really cared we could perhaps extend the capability to refer to a range inside a given BAR on a specific *device*? Or maybe just *function*, and allow sharing of SWIOTLB buffer within a multi-function device?

Fundamentally, this is what dmabuf does.

> I think it's overkill though.
> 
> >Did you think about adding an swiotlb mode to virtio-iommu at all?
> >Much easier than parsing page tables.
> 
> Often the guests which need this will have a real IOMMU for the true
> pass-through devices.

Not sure I understand. You mean with things like stage 2 passthrough?

> Adding a virtio-iommu into the mix (or any other
> system-wide way of doing something different for certain devices) is
> problematic.

OK... but the issue isn't specific to no DMA devices, is it?


> The on-device buffer keeps it nice and simple,

I am not saying it is not.
It's just a little boutique.

> and even allows us to
> do device support for operating systems like Windows where it's a lot
> harder to do anything generic in the core OS.

Well we do need virtio iommu windows support sooner or later, anyway.

-- 
MST


