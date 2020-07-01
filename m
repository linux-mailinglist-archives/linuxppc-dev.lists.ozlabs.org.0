Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A175A21056C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 09:51:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xYMg02rBzDqtp
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 17:51:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xY6l6C2RzDqFt
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jul 2020 17:40:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=aoeciW3X; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 49xY6k4czDz9CmT
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jul 2020 17:40:30 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 49xY6k2Mj4z9sTY; Wed,  1 Jul 2020 17:40:30 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=dyoung@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=aoeciW3X; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 49xY6j3nsLz9sTV
 for <linuxppc-dev@ozlabs.org>; Wed,  1 Jul 2020 17:40:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593589226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=izZP1MGTnUa71zOMjrTosKXYO8Y0RHaKMcIyCK6vJao=;
 b=aoeciW3XXeqzgmmMaBn2EoXw8cdNsQc0IanygYTAmQOIhESaG3m21Mu02X9S+6IeAXy46o
 S0osVo/2HmAZEJ+uHh0u6B02chLh0Kojsbbng42ODQOl3mUnKYb5+9R1rEMyLFscovv28G
 2Ce7iJk53NgQROzdb01Yxx/Lzg6zndI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-MtDWQ3oVPeK49MAHXPiNSA-1; Wed, 01 Jul 2020 03:40:23 -0400
X-MC-Unique: MtDWQ3oVPeK49MAHXPiNSA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F29A2CCC;
 Wed,  1 Jul 2020 07:40:21 +0000 (UTC)
Received: from dhcp-128-65.nay.redhat.com (ovpn-12-207.pek2.redhat.com
 [10.72.12.207])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E639060FC2;
 Wed,  1 Jul 2020 07:40:15 +0000 (UTC)
Date: Wed, 1 Jul 2020 15:40:12 +0800
From: Dave Young <dyoung@redhat.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH 04/11] ppc64/kexec_file: avoid stomping memory used by
 special regions
Message-ID: <20200701074012.GA4496@dhcp-128-65.nay.redhat.com>
References: <159319825403.16351.7253978047621755765.stgit@hbathini.in.ibm.com>
 <159319831192.16351.17443438699302756548.stgit@hbathini.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <159319831192.16351.17443438699302756548.stgit@hbathini.in.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Pingfan Liu <piliu@redhat.com>, Kexec-ml <kexec@lists.infradead.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Petr Tesarik <ptesarik@suse.cz>,
 lkml <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, Vivek Goyal <vgoyal@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Hari,
On 06/27/20 at 12:35am, Hari Bathini wrote:
> crashkernel region could have an overlap with special memory regions
> like  opal, rtas, tce-table & such. These regions are referred to as
> exclude memory ranges. Setup this ranges during image probe in order
> to avoid them while finding the buffer for different kdump segments.
> Implement kexec_locate_mem_hole_ppc64() that locates a memory hole
> accounting for these ranges. Also, override arch_kexec_add_buffer()
> to locate a memory hole & later call __kexec_add_buffer() function
> with kbuf->mem set to skip the generic locate memory hole lookup.
> 
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/crashdump-ppc64.h |   10 +
>  arch/powerpc/include/asm/kexec.h           |    7 -
>  arch/powerpc/kexec/elf_64.c                |    7 +
>  arch/powerpc/kexec/file_load_64.c          |  292 ++++++++++++++++++++++++++++
>  4 files changed, 312 insertions(+), 4 deletions(-)
>  create mode 100644 arch/powerpc/include/asm/crashdump-ppc64.h
> 
[snip]
>  /**
> + * get_exclude_memory_ranges - Get exclude memory ranges. This list includes
> + *                             regions like opal/rtas, tce-table, initrd,
> + *                             kernel, htab which should be avoided while
> + *                             setting up kexec load segments.
> + * @mem_ranges:                Range list to add the memory ranges to.
> + *
> + * Returns 0 on success, negative errno on error.
> + */
> +static int get_exclude_memory_ranges(struct crash_mem **mem_ranges)
> +{
> +	int ret;
> +
> +	ret = add_tce_mem_ranges(mem_ranges);
> +	if (ret)
> +		goto out;
> +
> +	ret = add_initrd_mem_range(mem_ranges);
> +	if (ret)
> +		goto out;
> +
> +	ret = add_htab_mem_range(mem_ranges);
> +	if (ret)
> +		goto out;
> +
> +	ret = add_kernel_mem_range(mem_ranges);
> +	if (ret)
> +		goto out;
> +
> +	ret = add_rtas_mem_range(mem_ranges, false);
> +	if (ret)
> +		goto out;
> +
> +	ret = add_opal_mem_range(mem_ranges, false);
> +	if (ret)
> +		goto out;
> +
> +	ret = add_reserved_ranges(mem_ranges);
> +	if (ret)
> +		goto out;
> +
> +	/* exclude memory ranges should be sorted for easy lookup */
> +	sort_memory_ranges(*mem_ranges);
> +out:
> +	if (ret)
> +		pr_err("Failed to setup exclude memory ranges\n");
> +	return ret;
> +}

I'm confused about the "overlap with crashkernel memory", does that mean
those normal kernel used memory could be put in crashkernel reserved
memory range?  If so why can't just skip those areas while crashkernel
doing the reservation?

Thanks
Dave

