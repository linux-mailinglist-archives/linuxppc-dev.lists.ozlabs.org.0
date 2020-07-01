Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35221210B5F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 14:56:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xh7h2l3zzDr3l
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 22:56:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xh4P2FzczDqvP
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jul 2020 22:53:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Z2hcAuh5; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 49xh4N6Tjbz8tZ6
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jul 2020 22:53:56 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 49xh4N5Wqtz9sTY; Wed,  1 Jul 2020 22:53:56 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=piliu@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Z2hcAuh5; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 49xh4N0h2Gz9sTV
 for <linuxppc-dev@ozlabs.org>; Wed,  1 Jul 2020 22:53:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593608033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ylks6ZC4AGq74KjZ8OmBYSrj4mT7YR7HWbuFUZxGUUk=;
 b=Z2hcAuh5S1d+NzeYJ57I4yR1CWN8N/+ZOOEZNlGCYuklhQbDInoPPtGaOfYZQw0CDt/lsX
 /uYsob+kXwayzXRO7uzVwOiG2lLnabQe6kqURoqh/JPW7LJJzLZhDrN0yC7fUTinTzrs+4
 mNGGkkvwh8Dp6lTJPrfH5ax26ScwhfI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-c3-vNlfMNbWRmerX0_OETA-1; Wed, 01 Jul 2020 08:53:49 -0400
X-MC-Unique: c3-vNlfMNbWRmerX0_OETA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD95DBFC1;
 Wed,  1 Jul 2020 12:53:47 +0000 (UTC)
Received: from [10.72.8.21] (ovpn-8-21.pek2.redhat.com [10.72.8.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A72A10013C0;
 Wed,  1 Jul 2020 12:53:37 +0000 (UTC)
Subject: Re: [PATCH 04/11] ppc64/kexec_file: avoid stomping memory used by
 special regions
To: Dave Young <dyoung@redhat.com>, Hari Bathini <hbathini@linux.ibm.com>
References: <159319825403.16351.7253978047621755765.stgit@hbathini.in.ibm.com>
 <159319831192.16351.17443438699302756548.stgit@hbathini.in.ibm.com>
 <20200701074012.GA4496@dhcp-128-65.nay.redhat.com>
From: piliu <piliu@redhat.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <bc8fe308-5ce9-1ca6-c832-7c3a75a732d2@redhat.com>
Date: Wed, 1 Jul 2020 20:53:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20200701074012.GA4496@dhcp-128-65.nay.redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: Kexec-ml <kexec@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 Petr Tesarik <ptesarik@suse.cz>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, Vivek Goyal <vgoyal@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 07/01/2020 03:40 PM, Dave Young wrote:
> Hi Hari,
> On 06/27/20 at 12:35am, Hari Bathini wrote:
>> crashkernel region could have an overlap with special memory regions
>> like  opal, rtas, tce-table & such. These regions are referred to as
>> exclude memory ranges. Setup this ranges during image probe in order
>> to avoid them while finding the buffer for different kdump segments.
>> Implement kexec_locate_mem_hole_ppc64() that locates a memory hole
>> accounting for these ranges. Also, override arch_kexec_add_buffer()
>> to locate a memory hole & later call __kexec_add_buffer() function
>> with kbuf->mem set to skip the generic locate memory hole lookup.
>>
>> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
>> ---
>>  arch/powerpc/include/asm/crashdump-ppc64.h |   10 +
>>  arch/powerpc/include/asm/kexec.h           |    7 -
>>  arch/powerpc/kexec/elf_64.c                |    7 +
>>  arch/powerpc/kexec/file_load_64.c          |  292 ++++++++++++++++++++++++++++
>>  4 files changed, 312 insertions(+), 4 deletions(-)
>>  create mode 100644 arch/powerpc/include/asm/crashdump-ppc64.h
>>
> [snip]
>>  /**
>> + * get_exclude_memory_ranges - Get exclude memory ranges. This list includes
>> + *                             regions like opal/rtas, tce-table, initrd,
>> + *                             kernel, htab which should be avoided while
>> + *                             setting up kexec load segments.
>> + * @mem_ranges:                Range list to add the memory ranges to.
>> + *
>> + * Returns 0 on success, negative errno on error.
>> + */
>> +static int get_exclude_memory_ranges(struct crash_mem **mem_ranges)
>> +{
>> +	int ret;
>> +
>> +	ret = add_tce_mem_ranges(mem_ranges);
>> +	if (ret)
>> +		goto out;
>> +
>> +	ret = add_initrd_mem_range(mem_ranges);
>> +	if (ret)
>> +		goto out;
>> +
>> +	ret = add_htab_mem_range(mem_ranges);
>> +	if (ret)
>> +		goto out;
>> +
>> +	ret = add_kernel_mem_range(mem_ranges);
>> +	if (ret)
>> +		goto out;
>> +
>> +	ret = add_rtas_mem_range(mem_ranges, false);
>> +	if (ret)
>> +		goto out;
>> +
>> +	ret = add_opal_mem_range(mem_ranges, false);
>> +	if (ret)
>> +		goto out;
>> +
>> +	ret = add_reserved_ranges(mem_ranges);
>> +	if (ret)
>> +		goto out;
>> +
>> +	/* exclude memory ranges should be sorted for easy lookup */
>> +	sort_memory_ranges(*mem_ranges);
>> +out:
>> +	if (ret)
>> +		pr_err("Failed to setup exclude memory ranges\n");
>> +	return ret;
>> +}
> 
> I'm confused about the "overlap with crashkernel memory", does that mean
> those normal kernel used memory could be put in crashkernel reserved
> memory range?  If so why can't just skip those areas while crashkernel
> doing the reservation?
I raised the same question in another mail. As Hari's answer, "kexec -p"
skips these ranges in user space. And the same logic should be done in
"kexec -s -p"

Regards,
Pingfan

