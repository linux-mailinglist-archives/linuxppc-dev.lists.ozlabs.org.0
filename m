Return-Path: <linuxppc-dev+bounces-3739-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE1F9E2679
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 17:13:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2m0y5jRqz2ypP;
	Wed,  4 Dec 2024 03:13:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=96.44.175.130
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733242418;
	cv=none; b=bvZhrHIJIGEr7E2N+dgI5ZjQWAxH+wia8Ve0GSsEQ8VCZo4dp74dMtY+Q5QCbV/oS08+pCss8l4J4iBOhn9xUcQHyJkmOSviCNJZSReqYEzd+PMF4dqZQwYbflLuVReclESfF/HdoOIROSzo96VGZ8eJtz2ZaZ/bHy3mLUU8PANDLqyJq8XgK6MPH00x9RI2qgb6xwjevzRWUf/7llmRRVgKigR9VsH+bsXcAIYC00fAwNJGwL7DdayLtQZM3DFS21ldZvh6XQmTwVWXMfdzGDd2y4LJ/RiFhoLTEjCuqnKp4MBhcE8Q4NGU71OVp2o7heO1kQFPN+H1PE6xoWsnPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733242418; c=relaxed/relaxed;
	bh=LTLwNnafXPKj3Qp8SIQOa/jtQanddT7GeRij0TH2434=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:Content-Type:
	 MIME-Version; b=Swkcs8bTxyueru7uIZo2Z94v3kRW4xApPgp4jokVkiSvH3zS5DSeUHXhskZ0lrAYkU02fnfqjBX2Znikj3jXQuNSnIFxy2UHtjNZr0LMDrNlDwugqL4Nu5Gu0TLK9S8heUD/y4p+7EFtsiCavSQe2IDo8t2ralNa1Fo272va/6/ReOdTPFZ4p/0HDx5ofWJnDqBqR7rSTRtra0yMXTj0tpZQnPnuZvpPDqT0IvTSYC7BO/ASjLFR7SCeAxMDrtoi3nM/nTwyMOtGUFjlSGlcqyrpX0s25z2ccC5ZAcnNn5TRL8IQpgImX5a9WpioxUnmcTZ17O36XCPCq7TgEU4Hxg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com; dkim=pass (1024-bit key; secure) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.a=rsa-sha256 header.s=20151216 header.b=lHnQZbqT; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.a=rsa-sha256 header.s=20151216 header.b=lHnQZbqT; dkim-atps=neutral; spf=pass (client-ip=96.44.175.130; helo=bedivere.hansenpartnership.com; envelope-from=james.bottomley@hansenpartnership.com; receiver=lists.ozlabs.org) smtp.mailfrom=hansenpartnership.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.a=rsa-sha256 header.s=20151216 header.b=lHnQZbqT;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.a=rsa-sha256 header.s=20151216 header.b=lHnQZbqT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hansenpartnership.com (client-ip=96.44.175.130; helo=bedivere.hansenpartnership.com; envelope-from=james.bottomley@hansenpartnership.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 423 seconds by postgrey-1.37 at boromir; Wed, 04 Dec 2024 03:13:34 AEDT
Received: from bedivere.hansenpartnership.com (unknown [96.44.175.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2m0t2Zvkz2yVG
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 03:13:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1733241982;
	bh=VBBfv3eA4AsVsLgBF8VnP+EajJe1ALpu2GW7YHfiN/w=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:From;
	b=lHnQZbqTPw8lccD9LZoQTnjENuqFmq3M4qdXn9YwdcXuh8kaYOH60UbGnuArtEJoE
	 Px4kL7hmZa2/uxmjqmqHUiq2gnIFhqP/9JNM4Zxjm340Kjh3IenF17vJPycyc5doEz
	 9qzMTvJH2/Dq+wqAj7McqxgXVZICR0uf3Mza6cXQ=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id A277A128793E;
	Tue, 03 Dec 2024 11:06:22 -0500 (EST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id Kttl9qoRVbVg; Tue,  3 Dec 2024 11:06:22 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1733241982;
	bh=VBBfv3eA4AsVsLgBF8VnP+EajJe1ALpu2GW7YHfiN/w=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:From;
	b=lHnQZbqTPw8lccD9LZoQTnjENuqFmq3M4qdXn9YwdcXuh8kaYOH60UbGnuArtEJoE
	 Px4kL7hmZa2/uxmjqmqHUiq2gnIFhqP/9JNM4Zxjm340Kjh3IenF17vJPycyc5doEz
	 9qzMTvJH2/Dq+wqAj7McqxgXVZICR0uf3Mza6cXQ=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::a774])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 1133D128718C;
	Tue, 03 Dec 2024 11:06:17 -0500 (EST)
Message-ID: <7ed3b713f8901398f52d7485d59613c19ea0e752.camel@HansenPartnership.com>
Subject: Re: [PATCH v2 09/10] sysfs: bin_attribute: add const read/write
 callback variants
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: linux@weissschuh.net
Cc: James.Bottomley@HansenPartnership.com, Xinhui.Pan@amd.com, 
 airlied@gmail.com, ajd@linux.ibm.com, alexander.deucher@amd.com, 
 alison.schofield@intel.com, amd-gfx@lists.freedesktop.org, arnd@arndb.de, 
 bhelgaas@google.com, carlos.bilbao.osdev@gmail.com,
 christian.koenig@amd.com,  dan.j.williams@intel.com, dave.jiang@intel.com,
 dave@stgolabs.net,  david.e.box@linux.intel.com, decui@microsoft.com, 
 dennis.dalessandro@cornelisnetworks.com, dri-devel@lists.freedesktop.org, 
 fbarrat@linux.ibm.com, gregkh@linuxfoundation.org, haiyangz@microsoft.com, 
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, ira.weiny@intel.com, 
 jgg@ziepe.ca, jonathan.cameron@huawei.com, kys@microsoft.com,
 leon@kernel.org,  linux-alpha@vger.kernel.org, linux-cxl@vger.kernel.org, 
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, linux-pci@vger.kernel.org, 
 linux-rdma@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 logang@deltatee.com,  martin.petersen@oracle.com, mattst88@gmail.com,
 miquel.raynal@bootlin.com,  mwalle@kernel.org,
 naveenkrishna.chatradhi@amd.com,  platform-driver-x86@vger.kernel.org,
 pratyush@kernel.org, rafael@kernel.org,  richard.henderson@linaro.org,
 richard@nod.at, simona@ffwll.ch,  srinivas.kandagatla@linaro.org,
 tudor.ambarus@linaro.org, vigneshr@ti.com,  vishal.l.verma@intel.com,
 wei.liu@kernel.org
Date: Tue, 03 Dec 2024 11:06:16 -0500
In-Reply-To: <20241103-sysfs-const-bin_attr-v2-9-71110628844c@weissschuh.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
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
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RDNS_NONE,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

> diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
> index
> d17c473c1ef292875475bf3bdf62d07241c13882..d713a6445a6267145a7014f308d
> f3bb25b8c3287 100644
> --- a/include/linux/sysfs.h
> +++ b/include/linux/sysfs.h
> @@ -305,8 +305,12 @@ struct bin_attribute {
>  	struct address_space *(*f_mapping)(void);
>  	ssize_t (*read)(struct file *, struct kobject *, struct
> bin_attribute *,
>  			char *, loff_t, size_t);
> +	ssize_t (*read_new)(struct file *, struct kobject *, const
> struct bin_attribute *,
> +			    char *, loff_t, size_t);
>  	ssize_t (*write)(struct file *, struct kobject *, struct
> bin_attribute *,
>  			 char *, loff_t, size_t);
> +	ssize_t (*write_new)(struct file *, struct kobject *,
> +			     const struct bin_attribute *, char *,
> loff_t, size_t);
>  	loff_t (*llseek)(struct file *, struct kobject *, const
> struct bin_attribute *,
>  			 loff_t, int);
>  	int (*mmap)(struct file *, struct kobject *, const struct
> bin_attribute *attr,
> @@ -325,11 +329,28 @@ struct bin_attribute {
>   */
>  #define sysfs_bin_attr_init(bin_attr) sysfs_attr_init(&(bin_attr)-
> >attr)
>  
> +typedef ssize_t __sysfs_bin_rw_handler_new(struct file *, struct
> kobject *,
> +					   const struct
> bin_attribute *, char *, loff_t, size_t);
> +
>  /* macros to create static binary attributes easier */
>  #define __BIN_ATTR(_name, _mode, _read, _write, _size)
> {		\
>  	.attr = { .name = __stringify(_name), .mode = _mode
> },		\
> -	.read	=
> _read,						\
> -	.write	=
> _write,						\
> +	.read =
> _Generic(_read,						\
> +		__sysfs_bin_rw_handler_new * :
> NULL,			\
> +		default :
> _read						\
> +	),							
> 	\
> +	.read_new =
> _Generic(_read,					\
> +		__sysfs_bin_rw_handler_new * :
> _read,			\
> +		default :
> NULL						\
> +	),							
> 	\
> +	.write =
> _Generic(_write,					\
> +		__sysfs_bin_rw_handler_new * :
> NULL,			\
> +		default :
> _write					\
> +	),							
> 	\
> +	.write_new =
> _Generic(_write,					\
> +		__sysfs_bin_rw_handler_new * :
> _write,			\
> +		default :
> NULL						\
> +	),							
> 	\
>  	.size	=
> _size,						\
>  }

It's probably a bit late now, but you've done this the wrong way
around.  What you should have done is added the const to .read/.write
then added a .read_old/.write_old with the original function prototype
and used _Generic() to switch between them.  Then when there are no
more non const left, you can simply remove .read_old and .write_old
without getting Linus annoyed by having to do something like this:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e70140ba0d2b1a30467d4af6bcfe761327b9ec95

Regards,

James


