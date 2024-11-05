Return-Path: <linuxppc-dev+bounces-2877-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D20D9BD1E6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2024 17:13:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XjYKL17vKz2yYd;
	Wed,  6 Nov 2024 03:13:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730823190;
	cv=none; b=bkQTSgNah87rtzAnCvzWC5ba5/ZVqZ+UZFp4kQ4lAY+YACnSmgyXT2NQkH8uAw2XlEGTKWmMtN8kFekoD75qNrrVj7gCcdoOEON9qJYS956ppDfMkgaw76tfeeoTOQsiMTnv50yhNK7ajlH2oLtY+mYOtNcQ1HfdHSDlVRO4eOAUgziE4fLdehKfxgQby0eKm7GtY/dGETCKlqeuQWGi17SW7xUQaL259V/k7J2jqBglHPA7S9aYxhXAoy5XP57OP46O7y4rmLtp4VSJQbs026oDWP8IK70z50aYgrSQaUcQmP8mlZcJkwA51G2tQhDFw5AzxD8G1BIvu5denee7dw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730823190; c=relaxed/relaxed;
	bh=EHL63gdHUkXpJTXbF8J6+zIWG4f0LboayALv4s7xJ6w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=JcjrLKd/+IZ71Qew+gLLz4U+crGsU3q0CAdxXUmtr+xAdI0UDEuzud/9fH01Mt6TvtB5hgG+ixSKf18deN8YpF7klF15muDiRFnkFXO3wtxqJZR6nZN+bI8NOx+67shQi3OcSxr8Ma4gLWRrZBtk0a0Bsa3axeE5SNbQAWr0VfUWEGOLEgGRbI6WiPGtgDtN/FJFmKPP9Ay4dAgqrVJvnqQscmC8bKAj27+EHKUB/E6+2bhPp0zqc4Cm9jSnPuW3QgkvF3v+5e+FreV+IyIGLMeXC4GYANpT+Q9tKOKWp0C9TJbDb4J4bb9msTuClKXpOOLfJRu6xM33kc0Ihro8EQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=efs34y0V; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=efs34y0V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XjYKG57rMz2yY9
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2024 03:13:06 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6071E5C059B;
	Tue,  5 Nov 2024 16:11:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8613AC4CECF;
	Tue,  5 Nov 2024 16:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730823151;
	bh=8/GSV8GjyuHHKyHHms4DjtgdqoFellDpxdUEvj3z83A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=efs34y0VYNy9NICKxDgpHWgWNpydYg8Tg/7PuvZuy2HdJlAJM2Wjn9AMK+WfyNfd+
	 7abvMe9SP08cQSEfsedYIjbzbOK2HzqelNIN1eKQJb9dubjDgUeEe44eKLRszA/SBn
	 nb9DNpWDqli9kXtJhYGlrQ+wcOJcWmGk+D6NJdtQ/BluOlyFP/kZ0k6ogG2Z8VfR3e
	 TipHX84n4i9fBO5KBUgA0squnAzLiwW8/u6O0HLF/ocdo7anV/39ecQXgA1ti0hB1Y
	 AZeDZrlMW5tONNXXXOITCRG5wfOpNUwxWenVlcsrkD1ZymopQmBpIRzF50+TKr03+b
	 CkD8zUyzmxghw==
Date: Tue, 5 Nov 2024 10:12:30 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
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
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
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
Message-ID: <20241105161230.GA1473411@bhelgaas>
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
In-Reply-To: <20241103-sysfs-const-bin_attr-v2-2-71110628844c@weissschuh.net>
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Nov 03, 2024 at 05:03:31PM +0000, Thomas Weißschuh wrote:
> Several drivers need to dynamically calculate the size of an binary
> attribute. Currently this is done by assigning attr->size from the
> is_bin_visible() callback.

s/an binary/a binary/

> This has drawbacks:
> * It is not documented.
> * A single attribute can be instantiated multiple times, overwriting the
>   shared size field.
> * It prevents the structure to be moved to read-only memory.
> 
> Introduce a new dedicated callback to calculate the size of the
> attribute.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---
>  fs/sysfs/group.c      | 2 ++
>  include/linux/sysfs.h | 8 ++++++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/fs/sysfs/group.c b/fs/sysfs/group.c
> index 45b2e92941da1f49dcc71af3781317c61480c956..8b01a7eda5fb3239e138372417d01967c7a3f122 100644
> --- a/fs/sysfs/group.c
> +++ b/fs/sysfs/group.c
> @@ -98,6 +98,8 @@ static int create_files(struct kernfs_node *parent, struct kobject *kobj,
>  				if (!mode)
>  					continue;
>  			}
> +			if (grp->bin_size)
> +				size = grp->bin_size(kobj, *bin_attr, i);
>  
>  			WARN(mode & ~(SYSFS_PREALLOC | 0664),
>  			     "Attribute %s: Invalid permissions 0%o\n",
> diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
> index c4e64dc112063f7cb89bf66059d0338716089e87..4746cccb95898b24df6f53de9421ea7649b5568f 100644
> --- a/include/linux/sysfs.h
> +++ b/include/linux/sysfs.h
> @@ -87,6 +87,11 @@ do {							\
>   *		SYSFS_GROUP_VISIBLE() when assigning this callback to
>   *		specify separate _group_visible() and _attr_visible()
>   *		handlers.
> + * @bin_size:
> + *		Optional: Function to return the size of a binary attribute
> + *		of the group. Will be called repeatedly for each binary
> + *		attribute in the group. Overwrites the size field embedded
> + *		inside the attribute itself.

"Overwrites" suggests that we write over the size field in the single
shared attribute.  But that's not what create_files() does.

create_files() instantiates sysfs files from the attribute template.
Previously each instance used the size from the shared attribute.
With this patch, if ->bin_size() exists, its return value is the size
of this particular instance, over*riding* the default size from the
shared attribute.

This description follows the language of other function pointers,
which was the right approach.  But I think the existing language would
be more helpful if it called out the difference between the attribute
itself (a potentially read-only singleton structure shared by all
kobjects with this attribute) and the instantiation of that attribute
for each kobject.

For example,

  @bin_size:
	      Optional: Function to return the size of this kobject's
	      instantiation of a binary attribute.  If present, it is
	      called for each bin_attribute in the group and overrides
	      the default size from the bin_attribute template.

This is nice work, thanks for doing it!

>   * @attrs:	Pointer to NULL terminated list of attributes.
>   * @bin_attrs:	Pointer to NULL terminated list of binary attributes.
>   *		Either attrs or bin_attrs or both must be provided.
> @@ -97,6 +102,9 @@ struct attribute_group {
>  					      struct attribute *, int);
>  	umode_t			(*is_bin_visible)(struct kobject *,
>  						  struct bin_attribute *, int);
> +	size_t			(*bin_size)(struct kobject *,
> +					    const struct bin_attribute *,
> +					    int);
>  	struct attribute	**attrs;
>  	struct bin_attribute	**bin_attrs;
>  };
> 
> -- 
> 2.47.0
> 

