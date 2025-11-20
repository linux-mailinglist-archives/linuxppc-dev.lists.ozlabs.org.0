Return-Path: <linuxppc-dev+bounces-14376-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47787C7356E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Nov 2025 10:59:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBv2b0QBGz2ypW;
	Thu, 20 Nov 2025 20:59:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763632758;
	cv=none; b=kvM2htc2TS6hp8DoqK4C1iC5o8XFHgkrQ5EE5r61vjUvJN6WO+RQPUQArqCaWQOn+z6d8A6IpHnN/1nDn8PTROo4D8rz5GWgzFhVRxyk4gIhbJsnwerLymsxQ7N1KHtSXOpU6ghwcHuF6M7BOq0Ggn4pPPJmrjdy4syVKxT46JUJYDMPrXhF66MMrTX7bJMa5Y2Yu9tbDtpccxmf8bvxPn1rZY98HorQ6nROIP0dN8xDVQv2w2h7W6pR9/MvX587J5Jxrj13sjsa+ZaaZH8HG0FV0tMvQC8VxM9vDXSRrOfevmKJrKx9a7jPfSO0YM3nVwuyjGROKEmDIffe1EZ2MA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763632758; c=relaxed/relaxed;
	bh=zvIUpsoLZ7xdtMtpTpJeKuy6wYQI8+9FP33pXkKgVbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WDRAinZkNQ3My/VaM0k/vCTpauwfqeIZ0UbmoKKOMfr4o/BLesWkjjRhbbVUpkoGXG9QS08X1CIkYIiqInrn7NQPKi1WKvnLm+HW+jDOrHoHh24i+6MtOeQSPUKKBsimtjresgggoQx8R1qrTakofyy+5Jq2CftqC9MJNQ3yyaWHv7kQpX/1VBpxLfzD9AtHu/UGlgnNT1fQBNxrPJJvnhyflAqfPTRx0dMNmNlqvmvkUTPANuKH1qWGWqGylq7tKu1uuAD4QmHxD57ewkawKQmBHn4mhyaKg9dBzKStE8pU+kcRPgJD24N0Z+uVFx9ggrN/+kI3eeG6L8pv99bkDg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gghxkviy; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gghxkviy; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gghxkviy;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gghxkviy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBv2Y30Vmz2xlK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Nov 2025 20:59:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763632751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zvIUpsoLZ7xdtMtpTpJeKuy6wYQI8+9FP33pXkKgVbw=;
	b=gghxkviyH5lNcThMOmC5nmKphAl0dbUI0ve0grgC5F/YdWbcAajEDzWda4LnjnX5atshA9
	d/C9YB8C0yiM7OqPTA3hg1R6vh5B32hfr4bctBGWjijRQ+zVzfTyk7ryPBZ4Gyd6tDHYiZ
	9wdMvHUNLz8UHaYg6NpxVryfs7yW0gY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763632751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zvIUpsoLZ7xdtMtpTpJeKuy6wYQI8+9FP33pXkKgVbw=;
	b=gghxkviyH5lNcThMOmC5nmKphAl0dbUI0ve0grgC5F/YdWbcAajEDzWda4LnjnX5atshA9
	d/C9YB8C0yiM7OqPTA3hg1R6vh5B32hfr4bctBGWjijRQ+zVzfTyk7ryPBZ4Gyd6tDHYiZ
	9wdMvHUNLz8UHaYg6NpxVryfs7yW0gY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-562-Yej5Cc9sP6qjJ7YJ90kSXA-1; Thu,
 20 Nov 2025 04:59:07 -0500
X-MC-Unique: Yej5Cc9sP6qjJ7YJ90kSXA-1
X-Mimecast-MFC-AGG-ID: Yej5Cc9sP6qjJ7YJ90kSXA_1763632746
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 666E01956094;
	Thu, 20 Nov 2025 09:59:05 +0000 (UTC)
Received: from localhost (unknown [10.72.112.60])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 99C6230044DB;
	Thu, 20 Nov 2025 09:59:01 +0000 (UTC)
Date: Thu, 20 Nov 2025 17:58:56 +0800
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
Subject: Re: [PATCH v6] crash: export crashkernel CMA reservation to userspace
Message-ID: <aR7mYAIBI1zYJ3rg@MiWiFi-R3L-srv>
References: <20251118071023.1673329-1-sourabhjain@linux.ibm.com>
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
In-Reply-To: <20251118071023.1673329-1-sourabhjain@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 11/18/25 at 12:40pm, Sourabh Jain wrote:
> Add a sysfs entry /sys/kernel/kexec_crash_cma_ranges to expose all
> CMA crashkernel ranges.
> 
> This allows userspace tools configuring kdump to determine how much
> memory is reserved for crashkernel. If CMA is used, tools can warn
> users when attempting to capture user pages with CMA reservation.
> 
> The new sysfs hold the CMA ranges in below format:
> 
> cat /sys/kernel/kexec_crash_cma_ranges
> 100000000-10c7fffff
> 
> The reason for not including Crash CMA Ranges in /proc/iomem is to avoid
> conflicts. It has been observed that contiguous memory ranges are sometimes
> shown as two separate System RAM entries in /proc/iomem. If a CMA range
> overlaps two System RAM ranges, adding crashk_res to /proc/iomem can create
> a conflict. Reference [1] describes one such instance on the PowerPC
> architecture.
> 
> Link: https://lore.kernel.org/all/20251016142831.144515-1-sourabhjain@linux.ibm.com/ [1]
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
> 
> Changelog:
> 
> v4 -> v5:
>  https://lore.kernel.org/all/20251114152550.ac2dd5e23542f09c62defec7@linux-foundation.org/
>  - Splitted patch from the above patch series.
>  - Code to create kexec node under /sys/kernel is added, eariler it was
>    done in [02/05] of the above patch series.
> 
> v5 -> v6:
>  - Add Crash CMA Range sysfs interface under /sys/kernel
> 
> Note:
> This patch is dependent on the below patch:
> https://lore.kernel.org/all/20251117035153.1199665-1-sourabhjain@linux.ibm.com/
> 
> ---
>  .../ABI/testing/sysfs-kernel-kexec-kdump      | 10 +++++++++
>  kernel/ksysfs.c                               | 21 +++++++++++++++++++
>  2 files changed, 31 insertions(+)

Acked-by: Baoquan He <bhe@redhat.com>

> 
> diff --git a/Documentation/ABI/testing/sysfs-kernel-kexec-kdump b/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
> index 96b24565b68e..f6089e38de5f 100644
> --- a/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
> +++ b/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
> @@ -41,3 +41,13 @@ Description:	read only
>  		is used by the user space utility kexec to support updating the
>  		in-kernel kdump image during hotplug operations.
>  User:		Kexec tools
> +
> +What:		/sys/kernel/kexec_crash_cma_ranges
> +Date:		Nov 2025
> +Contact:	kexec@lists.infradead.org
> +Description:	read only
> +		Provides information about the memory ranges reserved from
> +		the Contiguous Memory Allocator (CMA) area that are allocated
> +		to the crash (kdump) kernel. It lists the start and end physical
> +		addresses of CMA regions assigned for crashkernel use.
> +User:		kdump service
> diff --git a/kernel/ksysfs.c b/kernel/ksysfs.c
> index eefb67d9883c..0ff2179bc603 100644
> --- a/kernel/ksysfs.c
> +++ b/kernel/ksysfs.c
> @@ -135,6 +135,24 @@ static ssize_t kexec_crash_loaded_show(struct kobject *kobj,
>  }
>  KERNEL_ATTR_RO(kexec_crash_loaded);
>  
> +#ifdef CONFIG_CRASH_RESERVE
> +static ssize_t kexec_crash_cma_ranges_show(struct kobject *kobj,
> +				    struct kobj_attribute *attr, char *buf)
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
> +KERNEL_ATTR_RO(kexec_crash_cma_ranges);
> +#endif /* CONFIG_CRASH_RESERVE */
> +
>  static ssize_t kexec_crash_size_show(struct kobject *kobj,
>  				       struct kobj_attribute *attr, char *buf)
>  {
> @@ -260,6 +278,9 @@ static struct attribute * kernel_attrs[] = {
>  #ifdef CONFIG_CRASH_DUMP
>  	&kexec_crash_loaded_attr.attr,
>  	&kexec_crash_size_attr.attr,
> +#ifdef CONFIG_CRASH_RESERVE
> +	&kexec_crash_cma_ranges_attr.attr,
> +#endif
>  #endif
>  #endif
>  #ifdef CONFIG_VMCORE_INFO
> -- 
> 2.51.1
> 


