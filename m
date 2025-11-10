Return-Path: <linuxppc-dev+bounces-13988-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 690A2C452C2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Nov 2025 08:09:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d4gkq26HRz2xqM;
	Mon, 10 Nov 2025 18:09:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762758547;
	cv=none; b=CgWhB0TmU7vCQdXT+Mdk+LJxbx7ycVj944TBcxlU+HvCTlRXLAHKYYJIf66RqruJpUr3Qw/LUPoVZXIBVgEAPWAqYD3oFbxHcTss0P3X5o5QEn+aR5f9sH6CZSC5PcKB288DgXhXVzFypafSjaEPXLBGdxFNvW81aQ12DIxgwH3aX4E4tQQ9XA1IOXE2216EfpoBRYMShVqCRuBEidNREEvNx3D5CRzJJGj8safEZ4OE/xllZxvPOKfw/f4+DYCIa4oxZ84gwdLsKoWH4HAFY65gOrVDT/dp4lfps380xcOpHO4gTD2owdkpvLj0T4NltmDh0taYBfJejb4J/Y7v3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762758547; c=relaxed/relaxed;
	bh=FQeFfemk8R9pFVPJVE7vGo0yI2GmBM6W7T4hZkmc8fU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TO3l8aNE7z2t4DHJnP+yz97i5d6to3gWsg3U/F/nuMO7zRFOHpOSRwe9oqohFnrj24IBIZ8TKunDL/Puqk7GizAlmZlzwOutCzzn2KWY0T3cL+LY3OWB5zU7sTcxVg6/1A90Y9uW/twQz5goGi1h0smiFfDpOEpL9w8J8qIBDk+ggKw7VA2/j7g1o9y8evd3ohIb3g6XnIUGQ7+C0lKSDKpkvIZbwjoe6pZVjUz8IpWLhUaXl6tfufeC4vC4jptWKjgqJoo2CRkM/gkdxEaF8N/GFYBciHBYh1aXgo2wovpIiTSRhRi6Ws6Se2P7cHo1Acf8t7X9OIKv5FBYHZ8TJA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e5j6NzLA; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e5j6NzLA; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e5j6NzLA;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e5j6NzLA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d4gkn753Nz2xSY
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Nov 2025 18:09:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762758535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FQeFfemk8R9pFVPJVE7vGo0yI2GmBM6W7T4hZkmc8fU=;
	b=e5j6NzLAlnjTVlcUIKBz4MU24DJT0yNMSiZgU4qfa4TFL83gAEvIfK4w3a20DxvNxdROac
	yTT+RvAwW7X4pfb1Twi1hBV8A0FutIn8c7Q8PdYsK6ZZePt8Xze59gbcP70nOwBEbY+XFX
	0aG1HL4dcRqiuPHAB3+DWp02XkY4pAU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762758535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FQeFfemk8R9pFVPJVE7vGo0yI2GmBM6W7T4hZkmc8fU=;
	b=e5j6NzLAlnjTVlcUIKBz4MU24DJT0yNMSiZgU4qfa4TFL83gAEvIfK4w3a20DxvNxdROac
	yTT+RvAwW7X4pfb1Twi1hBV8A0FutIn8c7Q8PdYsK6ZZePt8Xze59gbcP70nOwBEbY+XFX
	0aG1HL4dcRqiuPHAB3+DWp02XkY4pAU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-37-eeRdVSlDPZqYg8Icnng9Iw-1; Mon,
 10 Nov 2025 02:08:53 -0500
X-MC-Unique: eeRdVSlDPZqYg8Icnng9Iw-1
X-Mimecast-MFC-AGG-ID: eeRdVSlDPZqYg8Icnng9Iw_1762758531
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 65A95195608F;
	Mon, 10 Nov 2025 07:08:50 +0000 (UTC)
Received: from localhost (unknown [10.72.112.59])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B262E19560A7;
	Mon, 10 Nov 2025 07:08:47 +0000 (UTC)
Date: Mon, 10 Nov 2025 15:08:41 +0800
From: Baoquan he <bhe@redhat.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, Aditya Gupta <adityag@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dave Young <dyoung@redhat.com>,
	Hari Bathini <hbathini@linux.ibm.com>, Jiri Bohac <jbohac@suse.cz>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Pingfan Liu <piliu@redhat.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shivang Upadhyay <shivangu@linux.ibm.com>,
	Vivek Goyal <vgoyal@redhat.com>, linuxppc-dev@lists.ozlabs.org,
	kexec@lists.infradead.org
Subject: Re: [PATCH v3 5/5] crash: export crashkernel CMA reservation to
 userspace
Message-ID: <aRGPee9izxWPRHj5@MiWiFi-R3L-srv>
References: <20251110043143.484408-1-sourabhjain@linux.ibm.com>
 <20251110043143.484408-6-sourabhjain@linux.ibm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110043143.484408-6-sourabhjain@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 11/10/25 at 10:01am, Sourabh Jain wrote:
> Add a sysfs entry /sys/kernel/kexec/crash_cma_ranges to expose all
> CMA crashkernel ranges.

I am not against this way. While wondering if it's more appropriate to
export them into iomem_resource just like crashk_res and crashk_low_res
doing.

> 
> This allows userspace tools configuring kdump to determine how much
> memory is reserved for crashkernel. If CMA is used, tools can warn
> users when attempting to capture user pages with CMA reservation.
> 
> The new sysfs hold the CMA ranges in below format:
> 
> cat /sys/kernel/kexec/crash_cma_ranges
> 100000000-10c7fffff
> 
> Cc: Aditya Gupta <adityag@linux.ibm.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Baoquan he <bhe@redhat.com>
> Cc: Dave Young <dyoung@redhat.com>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Jiri Bohac <jbohac@suse.cz>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
> Cc: Pingfan Liu <piliu@redhat.com>
> Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
> Cc: Vivek Goyal <vgoyal@redhat.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: kexec@lists.infradead.org
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
> Changelog:
>  - Add the missing hunk to export crash_cma_ranges sysfs
> 
> ---
>  .../ABI/testing/sysfs-kernel-kexec-kdump        | 10 ++++++++++
>  kernel/kexec_core.c                             | 17 +++++++++++++++++
>  2 files changed, 27 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-kernel-kexec-kdump b/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
> index 00c00f380fea..f59051b5d96d 100644
> --- a/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
> +++ b/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
> @@ -49,3 +49,13 @@ Description:	read only
>  		is used by the user space utility kexec to support updating the
>  		in-kernel kdump image during hotplug operations.
>  User:		Kexec tools
> +
> +What:		/sys/kernel/kexec/crash_cma_ranges
> +Date:		Nov 2025
> +Contact:	kexec@lists.infradead.org
> +Description:	read only
> +		Provides information about the memory ranges reserved from
> +		the Contiguous Memory Allocator (CMA) area that are allocated
> +		to the crash (kdump) kernel. It lists the start and end physical
> +		addresses of CMA regions assigned for crashkernel use.
> +User:		kdump service
> diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
> index 7476a46de5d6..da6ff72b4669 100644
> --- a/kernel/kexec_core.c
> +++ b/kernel/kexec_core.c
> @@ -1271,6 +1271,22 @@ static ssize_t crash_size_store(struct kobject *kobj,
>  }
>  static struct kobj_attribute crash_size_attr = __ATTR_RW(crash_size);
>  
> +static ssize_t crash_cma_ranges_show(struct kobject *kobj,
> +				     struct kobj_attribute *attr, char *buf)
> +{
> +
> +	ssize_t len = 0;
> +	int i;
> +
> +	for (i = 0; i < crashk_cma_cnt; ++i) {
> +		len += sysfs_emit_at(buf, len, "%08llx-%08llx\n",
> +				     crashk_cma_ranges[i].start,
> +				     crashk_cma_ranges[i].end);
> +	}
> +	return len;
> +}
> +static struct kobj_attribute crash_cma_ranges_attr = __ATTR_RO(crash_cma_ranges);
> +
>  #ifdef CONFIG_CRASH_HOTPLUG
>  static ssize_t crash_elfcorehdr_size_show(struct kobject *kobj,
>  			       struct kobj_attribute *attr, char *buf)
> @@ -1289,6 +1305,7 @@ static struct attribute *kexec_attrs[] = {
>  #ifdef CONFIG_CRASH_DUMP
>  	&crash_loaded_attr.attr,
>  	&crash_size_attr.attr,
> +	&crash_cma_ranges_attr.attr,
>  #ifdef CONFIG_CRASH_HOTPLUG
>  	&crash_elfcorehdr_size_attr.attr,
>  #endif
> -- 
> 2.51.1
> 


