Return-Path: <linuxppc-dev+bounces-3738-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF2B9E2645
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 17:11:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2lyF67Brz2yNP;
	Wed,  4 Dec 2024 03:11:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:c010:41de::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733242277;
	cv=none; b=jcbXCo5Hx9Ppw/fGVYRpR9/1xYKzFmrlIbaMyClahmju8nFScTI3uwaNiGrFt6m44yoKonG8h/SKqL2myPBnSW8U7BGOQR7X7Jmu9pGnhCjcQTEfRpU9gynqqHchlN43qab9t8HhlA45hXtLQjR95PasKlOlmvFbNRwiFeDxXuNdr0Kl1aPVzOLbkdLj0sqKBzYzQ8ImTMEC/S2/FsYvZA+2cb1FbvDiwgyCIGr7PC7BYWVnW5zwvxmLqPuMo+7gHwDQGpXI/sLTfb+JlPZ2InjVk6stCnRASuTDT/64K9xjAU5D7wtuP67MMVGk2gG9TQignR+T+0IL9tW0oGgP5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733242277; c=relaxed/relaxed;
	bh=6rxHQsmz5zwvAKnyisgpB+3YqVco6PRDBzoyvfc033s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T3A0uBRRPmZz84P6zUG89giB8L/QMwdd/0easYHmwIgJolcDcYEjscBausQqA2mee5h7fxA53QXiGKGhNqA55NrJd094E9baTKELL3am6S2+nu1Zw0iRJddpJUS5LH3pZ42sGicjP+sdf1teDrtbI61jkTdj1wTCGh2SDKdb3oyEHimT+f7ZG9Zct7mJ+nTewCMz6yy6BU5CjBui0KvMB6CyWCc63lIu/88+3VjgYdaVWBKXIs+sohOnNAlZsEs1eUBdH9l4JBEd7rcuRnkN12OT+H0hduVWl/XH/jsoXzcKNfXZTD2yU0IKYjjlgXs2vnjKRpgpQLDldREfVeUhsA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=sizE5QoI; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=sizE5QoI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2lyB58hMz2yHT
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 03:11:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1733242270;
	bh=277NQChdWnV4HacrcegFUWzVRwOH48nxQcs2AvUWU/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sizE5QoIfdIYrqxRdwX94ZC/agXw0pa0PTSsY+EhiaHK9ZyNdezGC3st3dTpS0o5y
	 8J4Rum3nNJJc9R7oV79zFn2aPNNgOgAo2+kTKS3uiDI40pDCkYOi6LivymYIQUOLVi
	 Vh/4iUKA2LVrdrQMyxIcCg+a3+hHswgOA9DOmlgg=
Date: Tue, 3 Dec 2024 17:11:10 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Xinhui.Pan@amd.com, airlied@gmail.com, ajd@linux.ibm.com, 
	alexander.deucher@amd.com, alison.schofield@intel.com, amd-gfx@lists.freedesktop.org, 
	arnd@arndb.de, bhelgaas@google.com, carlos.bilbao.osdev@gmail.com, 
	christian.koenig@amd.com, dan.j.williams@intel.com, dave.jiang@intel.com, 
	dave@stgolabs.net, david.e.box@linux.intel.com, decui@microsoft.com, 
	dennis.dalessandro@cornelisnetworks.com, dri-devel@lists.freedesktop.org, fbarrat@linux.ibm.com, 
	gregkh@linuxfoundation.org, haiyangz@microsoft.com, hdegoede@redhat.com, 
	ilpo.jarvinen@linux.intel.com, ira.weiny@intel.com, jgg@ziepe.ca, jonathan.cameron@huawei.com, 
	kys@microsoft.com, leon@kernel.org, linux-alpha@vger.kernel.org, 
	linux-cxl@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-pci@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	logang@deltatee.com, martin.petersen@oracle.com, mattst88@gmail.com, 
	miquel.raynal@bootlin.com, mwalle@kernel.org, naveenkrishna.chatradhi@amd.com, 
	platform-driver-x86@vger.kernel.org, pratyush@kernel.org, rafael@kernel.org, 
	richard.henderson@linaro.org, richard@nod.at, simona@ffwll.ch, srinivas.kandagatla@linaro.org, 
	tudor.ambarus@linaro.org, vigneshr@ti.com, vishal.l.verma@intel.com, wei.liu@kernel.org
Subject: Re: [PATCH v2 09/10] sysfs: bin_attribute: add const read/write
 callback variants
Message-ID: <5b589ddb-e3c9-40e1-987f-30ba81dc8ace@t-8ch.de>
References: <20241103-sysfs-const-bin_attr-v2-9-71110628844c@weissschuh.net>
 <7ed3b713f8901398f52d7485d59613c19ea0e752.camel@HansenPartnership.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ed3b713f8901398f52d7485d59613c19ea0e752.camel@HansenPartnership.com>
X-Spam-Status: No, score=2.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2024-12-03 11:06:16-0500, James Bottomley wrote:
> > diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
> > index
> > d17c473c1ef292875475bf3bdf62d07241c13882..d713a6445a6267145a7014f308d
> > f3bb25b8c3287 100644
> > --- a/include/linux/sysfs.h
> > +++ b/include/linux/sysfs.h
> > @@ -305,8 +305,12 @@ struct bin_attribute {
> >  	struct address_space *(*f_mapping)(void);
> >  	ssize_t (*read)(struct file *, struct kobject *, struct
> > bin_attribute *,
> >  			char *, loff_t, size_t);
> > +	ssize_t (*read_new)(struct file *, struct kobject *, const
> > struct bin_attribute *,
> > +			    char *, loff_t, size_t);
> >  	ssize_t (*write)(struct file *, struct kobject *, struct
> > bin_attribute *,
> >  			 char *, loff_t, size_t);
> > +	ssize_t (*write_new)(struct file *, struct kobject *,
> > +			     const struct bin_attribute *, char *,
> > loff_t, size_t);
> >  	loff_t (*llseek)(struct file *, struct kobject *, const
> > struct bin_attribute *,
> >  			 loff_t, int);
> >  	int (*mmap)(struct file *, struct kobject *, const struct
> > bin_attribute *attr,
> > @@ -325,11 +329,28 @@ struct bin_attribute {
> >   */
> >  #define sysfs_bin_attr_init(bin_attr) sysfs_attr_init(&(bin_attr)-
> > >attr)
> >  
> > +typedef ssize_t __sysfs_bin_rw_handler_new(struct file *, struct
> > kobject *,
> > +					   const struct
> > bin_attribute *, char *, loff_t, size_t);
> > +
> >  /* macros to create static binary attributes easier */
> >  #define __BIN_ATTR(_name, _mode, _read, _write, _size)
> > {		\
> >  	.attr = { .name = __stringify(_name), .mode = _mode
> > },		\
> > -	.read	=
> > _read,						\
> > -	.write	=
> > _write,						\
> > +	.read =
> > _Generic(_read,						\
> > +		__sysfs_bin_rw_handler_new * :
> > NULL,			\
> > +		default :
> > _read						\
> > +	),							
> > 	\
> > +	.read_new =
> > _Generic(_read,					\
> > +		__sysfs_bin_rw_handler_new * :
> > _read,			\
> > +		default :
> > NULL						\
> > +	),							
> > 	\
> > +	.write =
> > _Generic(_write,					\
> > +		__sysfs_bin_rw_handler_new * :
> > NULL,			\
> > +		default :
> > _write					\
> > +	),							
> > 	\
> > +	.write_new =
> > _Generic(_write,					\
> > +		__sysfs_bin_rw_handler_new * :
> > _write,			\
> > +		default :
> > NULL						\
> > +	),							
> > 	\
> >  	.size	=
> > _size,						\
> >  }
> 
> It's probably a bit late now, but you've done this the wrong way
> around.  What you should have done is added the const to .read/.write
> then added a .read_old/.write_old with the original function prototype
> and used _Generic() to switch between them.  Then when there are no
> more non const left, you can simply remove .read_old and .write_old
> without getting Linus annoyed by having to do something like this:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e70140ba0d2b1a30467d4af6bcfe761327b9ec95

Not all users are using the macros to define their attributes.
(Nor do they want to)

These users would break with your suggestion.
Otherwise I agree.


Thomas

