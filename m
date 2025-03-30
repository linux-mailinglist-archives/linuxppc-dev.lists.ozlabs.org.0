Return-Path: <linuxppc-dev+bounces-7391-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C31DA75CB6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Mar 2025 23:28:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZQnS70p52z2yDD;
	Mon, 31 Mar 2025 08:28:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1:d65d:64ff:fe57:4e05"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743370103;
	cv=none; b=Fmj5DX7w05wGIwsAePhmfGRTiw1jgyYKj4zc69p4wmxMH5O/o/j/AlN1JzLYIAOULDQw8C4ARChN+snNLihuLTyt2sMHLA23yBD1JhXZoAJrcKTvN/5weCqDV17oCTS/AEov9uSVbnNPzDKL/Gt0bWsLC+zbsS7TdCDNK1lGC7aFxAte8pG4Qk1vJRabDIV94I/zNxc1+9JcdlxWkTL7qcIzbnAKUroOAnPx95pFqvX40rDoNc8f4oDwGUIWOwNAdB2xUV6PTsGLJErrclLueH9nofwxiaAP6Oe0kv55KhOOj1OBvFx2Xg1DaK7mkAgLxCrvh64cMvCXzzYHeOfZ6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743370103; c=relaxed/relaxed;
	bh=HIpM9hYzjP/g9i1cY/OEycnx2DC+LjHysGz3lE5EyQg=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=H0h2xnMY/lI/helKyKWJSQGWNfY9+9sJ7/FCHTD0ilPwLqemX7eSn/L6xAdWMDcDaL6La+S1W8r7+Z9BRvAHMssURT+FACDwIBanBgbA/TGgAWA8mviP1vDpBBy9dy4HsZQdDSNMy/Tc+Z/ue9e+7MSv7HwD2bB6+mE9AmJ1VhUP4vCGsNRKgITg4ABskJU6QKG2jyLpLO0GoSt2A8iJQyS1JF5Emcr0gCjrZ5uPLGKaTPA8cruDQ2le/3pRsIrS42hinW+5o2l94CkGnUuQoBtwwp8bmm7ZcoAQcytq2zVM0S0C+E0PlIfMjwuFleo9jFYES3yqnZX8F6d0oWgOLQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Q/hhRpya; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=batv+07442bf8be34e4cbe263+7889+infradead.org+dwmw2@desiato.srs.infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Q/hhRpya;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=desiato.srs.infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=batv+07442bf8be34e4cbe263+7889+infradead.org+dwmw2@desiato.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZQnS350sjz2xpn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Mar 2025 08:28:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=HIpM9hYzjP/g9i1cY/OEycnx2DC+LjHysGz3lE5EyQg=; b=Q/hhRpyamRXibNzigh2wG8/crc
	ROYh6p8GREOUEHn5tPI/fG9G8DE4L8N1epcO9IHxApYf/rGNhQ3VmRGxA6UzdctKclKmGUTgNIzsC
	76m1acHpB5W5m9TMue6N9Qra6ijIlHpw8lJLREto9is2YXLk+ebNigSoN5LCAytBqNH9COzHnEqeH
	z1RG3qddVWELJ3MWgOm3zk7kzSlb42TVr24uisl6/2Gmh4Hjf4XnKxoRmOv+ohFZkgIi/mZunziCi
	icx4CajoRfo+cML2Jfz1BONBydD5a/3hHnRie4i4JSIt5cdyrz/xRYarmiddiPFVCBqgWkFiu7Oce
	KThu+WDA==;
Received: from [172.31.31.142] (helo=[127.0.0.1])
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz0CE-00000006YmG-0vmx;
	Sun, 30 Mar 2025 21:27:58 +0000
Date: Sun, 30 Mar 2025 22:27:58 +0100
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
In-Reply-To: <20250330125929-mutt-send-email-mst@kernel.org>
References: <20210209062131.2300005-1-tientzu@chromium.org> <979b6a34ca5724ced1d4871b58bf227065d7da57.camel@infradead.org> <20250321142947-mutt-send-email-mst@kernel.org> <d1382a6ee959f22dc5f6628d8648af77f4702418.camel@infradead.org> <20250330125929-mutt-send-email-mst@kernel.org>
Message-ID: <E3EE485D-AD74-457C-BDEC-F8C62DFE4909@infradead.org>
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

On 30 March 2025 18:06:47 BST, "Michael S=2E Tsirkin" <mst@redhat=2Ecom> wr=
ote:
>> It's basically just allowing us to expose through PCI, what I believe
>> we can already do for virtio in DT=2E
>
>I am not saying I am against this extension=2E
>The idea to restrict DMA has a lot of merit outside pkvm=2E
>For example, with a physical devices, limiting its DMA
>to a fixed range can be good for security at a cost of
>an extra data copy=2E
>
>So I am not saying we have to block this specific hack=2E
>
>what worries me fundamentally is I am not sure it works well
>e=2Eg=2E for physical virtio cards=2E

Not sure why it doesn't work for physical cards=2E They don't need to be b=
us-mastering; they just take data from a buffer in their own RAM=2E

>Attempts to pass data between devices will now also require
>extra data copies=2E

Yes=2E I think that's acceptable, but if we really cared we could perhaps =
extend the capability to refer to a range inside a given BAR on a specific =
*device*? Or maybe just *function*, and allow sharing of SWIOTLB buffer wit=
hin a multi-function device?

I think it's overkill though=2E

>Did you think about adding an swiotlb mode to virtio-iommu at all?
>Much easier than parsing page tables=2E

Often the guests which need this will have a real IOMMU for the true pass-=
through devices=2E Adding a virtio-iommu into the mix (or any other system-=
wide way of doing something different for certain devices) is problematic=
=2E

The on-device buffer keeps it nice and simple, and even allows us to do de=
vice support for operating systems like Windows where it's a lot harder to =
do anything generic in the core OS=2E


