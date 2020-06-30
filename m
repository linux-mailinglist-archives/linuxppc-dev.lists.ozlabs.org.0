Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D6120F03A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 10:15:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wxx93zRgzDqk5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 18:15:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wxvK4kG0zDqgl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 18:13:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=BXvz/3eW; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 49wxvK0Zg1z8tWK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 18:13:33 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 49wxvK0LFNz9sRN; Tue, 30 Jun 2020 18:13:33 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=piliu@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=BXvz/3eW; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 49wxvJ3WFFz9sR4
 for <linuxppc-dev@ozlabs.org>; Tue, 30 Jun 2020 18:13:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593504805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HTOMqbVijE1+7ERZjjkGYdaILglmW0FhOih0WPQ8e80=;
 b=BXvz/3eWoVLFAUlxK/4+/YEANc72Wv8V9RRPWkKuXPLIYi4c1DORJ65AtgCZRO6uRgDYt2
 a0q6gbSXjLVctAJ3goMfY4pU3+vw4mRCa9gMmkZum14DwNzPYB9qI1NrgA0dULvD+/10u5
 cXzyiJC20C3tNSKordwZoUw/S12yZD4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-loft5Z2bOUSG5zxBFP8RYQ-1; Tue, 30 Jun 2020 04:13:17 -0400
X-MC-Unique: loft5Z2bOUSG5zxBFP8RYQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C44311883623;
 Tue, 30 Jun 2020 08:13:15 +0000 (UTC)
Received: from [10.72.8.19] (ovpn-8-19.pek2.redhat.com [10.72.8.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7197860BF3;
 Tue, 30 Jun 2020 08:13:07 +0000 (UTC)
Subject: Re: [PATCH 04/11] ppc64/kexec_file: avoid stomping memory used by
 special regions
To: Hari Bathini <hbathini@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>
References: <159319825403.16351.7253978047621755765.stgit@hbathini.in.ibm.com>
 <159319831192.16351.17443438699302756548.stgit@hbathini.in.ibm.com>
 <9cfda789-0747-a67a-b825-5ea6f15099b8@redhat.com>
 <f745de42-297e-6eed-d25b-ea21d6000dc5@linux.ibm.com>
 <283fc181-2331-7c2f-db66-5e02e5ffb2e4@redhat.com>
 <cca6a693-a77f-885e-8ccc-967953f53800@linux.ibm.com>
From: piliu <piliu@redhat.com>
Message-ID: <aa6d91e7-b7c2-0e46-f446-a065d2db4b52@redhat.com>
Date: Tue, 30 Jun 2020 16:13:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <cca6a693-a77f-885e-8ccc-967953f53800@linux.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
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
Cc: Kexec-ml <kexec@lists.infradead.org>, Petr Tesarik <ptesarik@suse.cz>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, lkml <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, Dave Young <dyoung@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 06/30/2020 02:10 PM, Hari Bathini wrote:
> 
> 
> On 30/06/20 9:00 am, piliu wrote:
>>
>>
>> On 06/29/2020 01:55 PM, Hari Bathini wrote:
>>>
>>>
>>> On 28/06/20 7:44 am, piliu wrote:
>>>> Hi Hari,
>>>
>>> Hi Pingfan,
>>>
>>>>
>>>> After a quick through for this series, I have a few question/comment on
>>>> this patch for the time being. Pls see comment inline.
>>>>
>>>> On 06/27/2020 03:05 AM, Hari Bathini wrote:
>>>>> crashkernel region could have an overlap with special memory regions
>>>>> like  opal, rtas, tce-table & such. These regions are referred to as
>>>>> exclude memory ranges. Setup this ranges during image probe in order
>>>>> to avoid them while finding the buffer for different kdump segments.
>>>
>>> [...]
>>>
>>>>> +	/*
>>>>> +	 * Use the locate_mem_hole logic in kexec_add_buffer() for regular
>>>>> +	 * kexec_file_load syscall
>>>>> +	 */
>>>>> +	if (kbuf->image->type != KEXEC_TYPE_CRASH)
>>>>> +		return 0;
>>>> Can the ranges overlap [crashk_res.start, crashk_res.end]?  Otherwise
>>>> there is no requirement for @exclude_ranges.
>>>
>>> The ranges like rtas, opal are loaded by f/w. They almost always overlap with
>>> crashkernel region. So, @exclude_ranges is required to support kdump.
>> f/w passes rtas/opal as service, then must f/w mark these ranges as
>> fdt_reserved_mem in order to make kernel aware not to use these ranges?
> 
> It does. Actually, reserve_map + reserved-ranges are reserved as soon as
> memblock allocator is ready but not before crashkernel reservation.
> Check early_reserve_mem() call in kernel/prom.c
> 
>> Otherwise kernel memory allocation besides kdump can also overwrite
>> these ranges.> 
>> Hmm, revisiting reserve_crashkernel(). It seems not to take any reserved
>> memory into consider except kernel text. Could it work based on memblock
>> allocator?
> 
> So, kdump could possibly overwrite these regions which is why an exclude
> range list is needed. Same thing was done in kexec-tools as well.
OK, got it.

Thanks,
Pingfan
> 
> Thanks
> Hari
> 
> _______________________________________________
> kexec mailing list
> kexec@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kexec
> 

