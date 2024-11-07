Return-Path: <linuxppc-dev+bounces-2951-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E85E9BFD98
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 06:21:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkVmS07MLz3bj8;
	Thu,  7 Nov 2024 16:21:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730956887;
	cv=none; b=GTDYGmLxfwexnvwZLoVu1CgrGJPEvA45cwQnMTRBAsYaAYq7GnkElaRdma4t3tKow87KKQLWCXZL/CrLBioDLf+7espsR9k/NLGRq+y98PcSSAskOOcm8pKbfl22PCHoLw/8vJvgNuFayd7qAVYtYnZ6AImFo265ok9h7ZgjMqv3SWLMhq0Esj2RPjuOXHBLyPIkfRyqDJAKKMvT2mFsq51j4+taVCcCHr4tfYRo2Yd3nCFn9rNs1S13FrQTfNKTyg/1nq2x9nOpk777x2zGW4XFPcrHoTZYJ87glhBBQIGBB/N1Fj6ZGGR20rjNUvt51CXsJbTcc8GYVbSGCSEGeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730956887; c=relaxed/relaxed;
	bh=kgzRFu3klWODAYQgqoVl6fVeHZ2OwXmFslcqdohwb/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jNNlmwFwzfyuY9FmUZo/WLKHBd0BHYo8Y2k+f/WO2Rrl+tNl/nKN38KOZhMYNlvkmXUbsR8oa4QK24LTjEwRsU77scLBPz1srYVsQah3vvqjTUsXTKOOPwwL3EuhIiaJ57OyMvlob1Xz3KoluTamH4bVRBKNC2NMAkqrufiyqdx9eIqJ7n6XLKXm/+GWyNvf0upLf7dl/+AQhmTVN3egzHBRGESaRrnrRX3Ex/AbVQWHjU4pq+cVb9BRiBN74+hxEVIO6PbDGREMaatVAIYHlMu/JEYxYTOaSRla7UT+LNe9EBbGqmBTijtjbwxVbqpKZcNOZiFUKpg0y6VZHrfEqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=LqZ6urMl; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=LqZ6urMl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkVmP5QKKz3bby
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 16:21:24 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EE2BCA4218F;
	Thu,  7 Nov 2024 05:19:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 064BBC4CECC;
	Thu,  7 Nov 2024 05:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730956880;
	bh=LcTJNuAS+0u64bln2s0a89deCwW+g5Nrojs1Slddt/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LqZ6urMldxlvEBhdUM/g9ay6JBw8MxGPCgUReHarZ5Rrrup6qtaAMbkDd8Ut3yIvJ
	 TB3aWEUF8ij6xyiKo01mFPXSemUmYSpWT2Gfca8HAeh7vk2NMp5wXiqsR3jTvujmXl
	 Vml1yQf1y5lU0zvuowqmi415BENx3kOsFR8a5uB8=
Date: Thu, 7 Nov 2024 06:21:00 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
	Carlos Bilbao <carlos.bilbao.osdev@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"David E. Box" <david.e.box@linux.intel.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Frederic Barrat <fbarrat@linux.ibm.com>,
	Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
	Logan Gunthorpe <logang@deltatee.com>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Dan Williams <dan.j.williams@intel.com>,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-cxl@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
	linux-mtd@lists.infradead.org, platform-driver-x86@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-hyperv@vger.kernel.org
Subject: Re: [PATCH v2 02/10] sysfs: introduce callback
 attribute_group::bin_size
Message-ID: <2024110726-hasty-obsolete-3780@gregkh>
References: <20241103-sysfs-const-bin_attr-v2-0-71110628844c@weissschuh.net>
 <20241103-sysfs-const-bin_attr-v2-2-71110628844c@weissschuh.net>
 <20241106200513.GB174958@rocinante>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241106200513.GB174958@rocinante>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Nov 07, 2024 at 05:05:13AM +0900, Krzysztof Wilczyński wrote:
> Hello,
> 
> > Several drivers need to dynamically calculate the size of an binary
> > attribute. Currently this is done by assigning attr->size from the
> > is_bin_visible() callback.
> > 
> > This has drawbacks:
> > * It is not documented.
> > * A single attribute can be instantiated multiple times, overwriting the
> >   shared size field.
> > * It prevents the structure to be moved to read-only memory.
> > 
> > Introduce a new dedicated callback to calculate the size of the
> > attribute.
> 
> Would it be possible to have a helper that when run against a specific
> kobject reference, then it would refresh or re-run the size callbacks?
> 
> We have an use case where we resize BARs on demand via sysfs, and currently
> the only way to update the size of each resource sysfs object is to remove
> and added them again, which is a bit crude, and can also be unsafe.

How is it unsafe?

> Hence the question.
> 
> There exist the sysfs_update_groups(), but the BAR resource sysfs objects
> are currently, at least not yet, added to any attribute group.

then maybe they should be added to one :)

thanks,

greg k-h

