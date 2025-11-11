Return-Path: <linuxppc-dev+bounces-14021-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B01DAC4A4B1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Nov 2025 02:15:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d57rl1jH6z2yvK;
	Tue, 11 Nov 2025 12:15:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762823751;
	cv=none; b=dF7kMh6UhtuxApzydpJl/PQgtlcPcaA9dqSQhM0NczZ08PKC+lbZ7oBDFn1OIUoJScIAMpMoIvNZuxZPhSPVPR1HfNKyoQ33aYApi4/8WMXc+m4DhHoiT1eJ80Br6Z01FVGK5mmTD6HLfl3wu+6uTqJ9A+QkvG0NDPCsdylkK6HBgS9RmIcaWe1A/eZWmtBgBy7maWMUQYp07UXM8/LPjgFZBHdlOTde7pk1xr0KCEEYczAOtClwqbkKvqNA/mdsR6qlLR+VR/JF/USqmfej+5LHSCmazPm8kdKGldSJtQvc/oue7ZN78OytPEK9gGrriWyKY/xh0LydrMmBJQ1e+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762823751; c=relaxed/relaxed;
	bh=lFuNMW6QorcHfFRhlUpmszpPvplH5exAgJCXldoReDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fz8NoDIpqyGmm/32BySADjfoRnSZPqjES5rBB9th/0SCwK7KR7hvjPdk3pe2cUG3xNIQrSIT6iFjBktAZsTi+0cGPvxn5yiefsahhbJczCKX/N2fMQRkRl9jhUdP3rgnf+A9Ow494HqXmFBbtVQqnY13qB7zIGODjAGY+CazpLMmYSusE7ae4ZOq2B6JqDGvIAY2Gm9cSozJpxRlVfXDgl0qM3f6+WVn6piGdP28GZmbS8qEc374fM79CyYjtbj0ZFeyN+PjxPSed9eU/M66zyGN/CNlxXU3vq4X3nyqAO4NMPH0QDkhSZcswUMWVYaE/Rh8PJHCmtkabWTbuZ49DQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aX+jBUk+; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aX+jBUk+; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aX+jBUk+;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aX+jBUk+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d57rj6pFhz2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 12:15:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762823744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lFuNMW6QorcHfFRhlUpmszpPvplH5exAgJCXldoReDA=;
	b=aX+jBUk+jOoxB/DiGQOXdiGb4vtkzHAxXDid9N7eFS0BRBt8QfVZSa0BUzBNMf09JeKxQg
	mgoilU2KMV3omTA7yfh3RowsADL6lzgVWv4P0hr3x43zSBpCCADche8oYpSdzkqbJLRFRB
	fkRMLylVcn1hf1sHut1s8rP/d3Xzd9E=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762823744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lFuNMW6QorcHfFRhlUpmszpPvplH5exAgJCXldoReDA=;
	b=aX+jBUk+jOoxB/DiGQOXdiGb4vtkzHAxXDid9N7eFS0BRBt8QfVZSa0BUzBNMf09JeKxQg
	mgoilU2KMV3omTA7yfh3RowsADL6lzgVWv4P0hr3x43zSBpCCADche8oYpSdzkqbJLRFRB
	fkRMLylVcn1hf1sHut1s8rP/d3Xzd9E=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-213-dxEhYB_gNzeGhPkRGAx9IQ-1; Mon,
 10 Nov 2025 20:15:40 -0500
X-MC-Unique: dxEhYB_gNzeGhPkRGAx9IQ-1
X-Mimecast-MFC-AGG-ID: dxEhYB_gNzeGhPkRGAx9IQ_1762823738
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5A91B19560A2;
	Tue, 11 Nov 2025 01:15:37 +0000 (UTC)
Received: from localhost (unknown [10.72.112.59])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2CF2F30044E0;
	Tue, 11 Nov 2025 01:15:33 +0000 (UTC)
Date: Tue, 11 Nov 2025 09:15:23 +0800
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
Message-ID: <aRKOK7ZQ5mOUBzvK@MiWiFi-R3L-srv>
References: <20251110043143.484408-1-sourabhjain@linux.ibm.com>
 <20251110043143.484408-6-sourabhjain@linux.ibm.com>
 <aRGPee9izxWPRHj5@MiWiFi-R3L-srv>
 <09c4c181-eb4b-43ea-a439-04b83f4c20ba@linux.ibm.com>
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
In-Reply-To: <09c4c181-eb4b-43ea-a439-04b83f4c20ba@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 11/10/25 at 02:09pm, Sourabh Jain wrote:
> 
> 
> On 10/11/25 12:38, Baoquan he wrote:
> > On 11/10/25 at 10:01am, Sourabh Jain wrote:
> > > Add a sysfs entry /sys/kernel/kexec/crash_cma_ranges to expose all
> > > CMA crashkernel ranges.
> > I am not against this way. While wondering if it's more appropriate to
> > export them into iomem_resource just like crashk_res and crashk_low_res
> > doing.
> 
> Handling conflict is challenging. Hence we don't export crashk_res and
> crashk_low_res to iomem on powerpc. Checkout [1]
> 
> And I think conflicts can occur regardless of the order in which System RAM
> and
> Crash CMA ranges are added to iomem.
> 
> [1] https://lore.kernel.org/all/20251016142831.144515-1-sourabhjain@linux.ibm.com/

Then I would suggest you add this reason and the link into patch log
to keep a record. One day people may post patch to 'optimize' this.

> 
> > 
> > > This allows userspace tools configuring kdump to determine how much
> > > memory is reserved for crashkernel. If CMA is used, tools can warn
> > > users when attempting to capture user pages with CMA reservation.
> > > 
> > > The new sysfs hold the CMA ranges in below format:
> > > 
> > > cat /sys/kernel/kexec/crash_cma_ranges
> > > 100000000-10c7fffff
> > > 
> > > Cc: Aditya Gupta <adityag@linux.ibm.com>
> > > Cc: Andrew Morton <akpm@linux-foundation.org>
> > > Cc: Baoquan he <bhe@redhat.com>
> > > Cc: Dave Young <dyoung@redhat.com>
> > > Cc: Hari Bathini <hbathini@linux.ibm.com>
> > > Cc: Jiri Bohac <jbohac@suse.cz>
> > > Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> > > Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
> > > Cc: Pingfan Liu <piliu@redhat.com>
> > > Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> > > Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
> > > Cc: Vivek Goyal <vgoyal@redhat.com>
> > > Cc: linuxppc-dev@lists.ozlabs.org
> > > Cc: kexec@lists.infradead.org
> > > Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> > > ---
> > > Changelog:
> > >   - Add the missing hunk to export crash_cma_ranges sysfs
> > > 
> > > ---
> > >   .../ABI/testing/sysfs-kernel-kexec-kdump        | 10 ++++++++++
> > >   kernel/kexec_core.c                             | 17 +++++++++++++++++
> > >   2 files changed, 27 insertions(+)
> > > 
> > > diff --git a/Documentation/ABI/testing/sysfs-kernel-kexec-kdump b/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
> > > index 00c00f380fea..f59051b5d96d 100644
> > > --- a/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
> > > +++ b/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
> > > @@ -49,3 +49,13 @@ Description:	read only
> > >   		is used by the user space utility kexec to support updating the
> > >   		in-kernel kdump image during hotplug operations.
> > >   User:		Kexec tools
> > > +
> > > +What:		/sys/kernel/kexec/crash_cma_ranges
> > > +Date:		Nov 2025
> > > +Contact:	kexec@lists.infradead.org
> > > +Description:	read only
> > > +		Provides information about the memory ranges reserved from
> > > +		the Contiguous Memory Allocator (CMA) area that are allocated
> > > +		to the crash (kdump) kernel. It lists the start and end physical
> > > +		addresses of CMA regions assigned for crashkernel use.
> > > +User:		kdump service
> > > diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
> > > index 7476a46de5d6..da6ff72b4669 100644
> > > --- a/kernel/kexec_core.c
> > > +++ b/kernel/kexec_core.c
> > > @@ -1271,6 +1271,22 @@ static ssize_t crash_size_store(struct kobject *kobj,
> > >   }
> > >   static struct kobj_attribute crash_size_attr = __ATTR_RW(crash_size);
> > > +static ssize_t crash_cma_ranges_show(struct kobject *kobj,
> > > +				     struct kobj_attribute *attr, char *buf)
> > > +{
> > > +
> > > +	ssize_t len = 0;
> > > +	int i;
> > > +
> > > +	for (i = 0; i < crashk_cma_cnt; ++i) {
> > > +		len += sysfs_emit_at(buf, len, "%08llx-%08llx\n",
> > > +				     crashk_cma_ranges[i].start,
> > > +				     crashk_cma_ranges[i].end);
> > > +	}
> > > +	return len;
> > > +}
> > > +static struct kobj_attribute crash_cma_ranges_attr = __ATTR_RO(crash_cma_ranges);
> > > +
> > >   #ifdef CONFIG_CRASH_HOTPLUG
> > >   static ssize_t crash_elfcorehdr_size_show(struct kobject *kobj,
> > >   			       struct kobj_attribute *attr, char *buf)
> > > @@ -1289,6 +1305,7 @@ static struct attribute *kexec_attrs[] = {
> > >   #ifdef CONFIG_CRASH_DUMP
> > >   	&crash_loaded_attr.attr,
> > >   	&crash_size_attr.attr,
> > > +	&crash_cma_ranges_attr.attr,
> > >   #ifdef CONFIG_CRASH_HOTPLUG
> > >   	&crash_elfcorehdr_size_attr.attr,
> > >   #endif
> > > -- 
> > > 2.51.1
> > > 
> 


