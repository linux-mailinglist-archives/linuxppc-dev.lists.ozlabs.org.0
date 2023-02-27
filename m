Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 320616A42AD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Feb 2023 14:32:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQLyv0JmDz3cS4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 00:32:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ex46fXXr;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ex46fXXr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ex46fXXr;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ex46fXXr;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQLxw5gJmz3bY0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 00:31:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677504702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V+6qFC7OXniFoFqHVWKESI1xjQfVcOUspp9yumvENXI=;
	b=ex46fXXrhKmDPYEWGcB+af8vCe1J2IzZwA/e2KmgnAYszjSYEeJRhD0SpcUuO1qPy3fF9X
	XAUmcoTTxXm+25+CGrHsNBZUTmHTyITfycVgVEzyB9To6mrfHrZuTHv/h//7qCbivgE7jW
	G/8xMJixjPXbKePOGt18zoDHMoIkxVA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677504702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V+6qFC7OXniFoFqHVWKESI1xjQfVcOUspp9yumvENXI=;
	b=ex46fXXrhKmDPYEWGcB+af8vCe1J2IzZwA/e2KmgnAYszjSYEeJRhD0SpcUuO1qPy3fF9X
	XAUmcoTTxXm+25+CGrHsNBZUTmHTyITfycVgVEzyB9To6mrfHrZuTHv/h//7qCbivgE7jW
	G/8xMJixjPXbKePOGt18zoDHMoIkxVA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-235-yVqJUXnaOrmC2oNMDk3AIw-1; Mon, 27 Feb 2023 08:31:41 -0500
X-MC-Unique: yVqJUXnaOrmC2oNMDk3AIw-1
Received: by mail-wm1-f69.google.com with SMTP id x18-20020a1c7c12000000b003e1e7d3cf9fso5347464wmc.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Feb 2023 05:31:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V+6qFC7OXniFoFqHVWKESI1xjQfVcOUspp9yumvENXI=;
        b=0PjQw1bMZ2QU/dDqxaPy2SEQNygJqbBpFCyMK5QoOqHUYFdY+rq5khc13ydabxCrYi
         X44DkUhgCniJlbMR0DYota6RdBzXHyPfZ6zlJKGipZzqeO50kWdcBMfj51+R5SdF/eaP
         9kMLMt2dzVpvSaLQkDY0jNvlrG2DMEzDprkdjcHvl9bVvzdS+cY7yYSsnPeKqdTZ/Lxd
         7TmOyEH7o/neUnvP+411lx5PAwA0Qz9W3BaaUG1AJvBleJn5ALvViY6h457jjNTgp2qZ
         6NBBlT/A31kKsG0yumxOg+HUy01pF1wmeddeWHO6480cCVMseY94LFzIonu94iSd4+fv
         DYFA==
X-Gm-Message-State: AO0yUKWUMhHCx4hz6rAUmdvT1vHz6j6vgckl770fvv8NtG2NI52e52mM
	yroO6AWs1xsmQzp5yJCzQhBd8ZCZUh/uAmWDdpUserevTT/mqWtS/5AzrEdVXiZYZ3+ZA6puwAo
	eBdKy48ZeWXf/YEmDViIE6tpvjw==
X-Received: by 2002:a05:600c:3d9b:b0:3ea:f6c4:5f2a with SMTP id bi27-20020a05600c3d9b00b003eaf6c45f2amr11631389wmb.17.1677504699854;
        Mon, 27 Feb 2023 05:31:39 -0800 (PST)
X-Google-Smtp-Source: AK7set9k8OE3X06H0t6ffblDghDw4p6MluetLQ2Nt3K/GymnPq5PiNVd71t1cUTwSWsd1hBXO2jKVw==
X-Received: by 2002:a05:600c:3d9b:b0:3ea:f6c4:5f2a with SMTP id bi27-20020a05600c3d9b00b003eaf6c45f2amr11631342wmb.17.1677504699482;
        Mon, 27 Feb 2023 05:31:39 -0800 (PST)
Received: from ?IPV6:2003:cb:c703:1f00:7816:2307:5967:2228? (p200300cbc7031f007816230759672228.dip0.t-ipconnect.de. [2003:cb:c703:1f00:7816:2307:5967:2228])
        by smtp.gmail.com with ESMTPSA id m34-20020a05600c3b2200b003df5be8987esm14091432wms.20.2023.02.27.05.31.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 05:31:38 -0800 (PST)
Message-ID: <9ed766a6-cf06-535d-3337-ea6ff25c2362@redhat.com>
Date: Mon, 27 Feb 2023 14:31:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20230113171026.582290-1-david@redhat.com>
 <20230113171026.582290-12-david@redhat.com>
 <CAMuHMdX-FDga8w=pgg1myskEx6wp+oyZifhPPPFnWrc1zW7ZpQ@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH mm-unstable v1 11/26] microblaze/mm: support
 __HAVE_ARCH_PTE_SWP_EXCLUSIVE
In-Reply-To: <CAMuHMdX-FDga8w=pgg1myskEx6wp+oyZifhPPPFnWrc1zW7ZpQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-mips@vger.kernel.org, linux-mm@kvack.org, Nadav Amit <namit@vmware.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org, Hugh Dickins <hughd@google.com>, linux-csky@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>, Vlastimil Babka <vbabka@suse.cz>, Jason Gunthorpe <jgg@nvidia.com>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, John Hubbard <jhubbard@nvidia.com>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 26.02.23 21:13, Geert Uytterhoeven wrote:
> Hi David,

Hi Geert,

> 
> On Fri, Jan 13, 2023 at 6:16 PM David Hildenbrand <david@redhat.com> wrote:
>> Let's support __HAVE_ARCH_PTE_SWP_EXCLUSIVE by stealing one bit
>> from the type. Generic MM currently only uses 5 bits for the type
>> (MAX_SWAPFILES_SHIFT), so the stolen bit is effectively unused.
>>
>> The shift by 2 when converting between PTE and arch-specific swap entry
>> makes the swap PTE layout a little bit harder to decipher.
>>
>> While at it, drop the comment from paulus---copy-and-paste leftover
>> from powerpc where we actually have _PAGE_HASHPTE---and mask the type in
>> __swp_entry_to_pte() as well.
>>
>> Cc: Michal Simek <monstr@monstr.eu>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> Thanks for your patch, which is now commit b5c88f21531c3457
> ("microblaze/mm: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE") in
> 

Right, it went upstream, so we can only fixup.

>>   arch/m68k/include/asm/mcf_pgtable.h   |  4 +--
> 
> What is this m68k change doing here?
> Sorry for not noticing this earlier.

Thanks for the late review, still valuable :)

That hunk should have gone into the previous patch, looks like I messed 
that up when reworking.

> 
> Furthermore, several things below look strange to me...
> 
>>   arch/microblaze/include/asm/pgtable.h | 45 +++++++++++++++++++++------
>>   2 files changed, 37 insertions(+), 12 deletions(-)
>>
>> diff --git a/arch/m68k/include/asm/mcf_pgtable.h b/arch/m68k/include/asm/mcf_pgtable.h
>> index 3f8f4d0e66dd..e573d7b649f7 100644
>> --- a/arch/m68k/include/asm/mcf_pgtable.h
>> +++ b/arch/m68k/include/asm/mcf_pgtable.h
>> @@ -46,8 +46,8 @@
>>   #define _CACHEMASK040          (~0x060)
>>   #define _PAGE_GLOBAL040                0x400   /* 68040 global bit, used for kva descs */
>>
>> -/* We borrow bit 7 to store the exclusive marker in swap PTEs. */
>> -#define _PAGE_SWP_EXCLUSIVE    0x080
>> +/* We borrow bit 24 to store the exclusive marker in swap PTEs. */
>> +#define _PAGE_SWP_EXCLUSIVE    CF_PAGE_NOCACHE
> 
> CF_PAGE_NOCACHE is 0x80, so this is still bit 7, thus the new comment
> is wrong?

You're right, it's still bit 7 (and we use LSB-0 bit numbering in that 
file). I'll send a fixup.

> 
>>
>>   /*
>>    * Externally used page protection values.
>> diff --git a/arch/microblaze/include/asm/pgtable.h b/arch/microblaze/include/asm/pgtable.h
>> index 42f5988e998b..7e3de54bf426 100644
>> --- a/arch/microblaze/include/asm/pgtable.h
>> +++ b/arch/microblaze/include/asm/pgtable.h
>> @@ -131,10 +131,10 @@ extern pte_t *va_to_pte(unsigned long address);
>>    * of the 16 available.  Bit 24-26 of the TLB are cleared in the TLB
>>    * miss handler.  Bit 27 is PAGE_USER, thus selecting the correct
>>    * zone.
>> - * - PRESENT *must* be in the bottom two bits because swap cache
>> - * entries use the top 30 bits.  Because 4xx doesn't support SMP
>> - * anyway, M is irrelevant so we borrow it for PAGE_PRESENT.  Bit 30
>> - * is cleared in the TLB miss handler before the TLB entry is loaded.
>> + * - PRESENT *must* be in the bottom two bits because swap PTEs use the top
>> + * 30 bits.  Because 4xx doesn't support SMP anyway, M is irrelevant so we
>> + * borrow it for PAGE_PRESENT.  Bit 30 is cleared in the TLB miss handler
>> + * before the TLB entry is loaded.
> 
> So the PowerPC 4xx comment is still here?

I only dropped the comment above __swp_type(). I guess you mean that we 
could also drop the "Because 4xx doesn't support SMP anyway, M is 
irrelevant so we borrow it for PAGE_PRESENT." sentence, correct? Not 
sure about the "Bit 30 is cleared in the TLB miss handler" comment, if 
that can similarly be dropped.

> 
>>    * - All other bits of the PTE are loaded into TLBLO without
>>    *  * modification, leaving us only the bits 20, 21, 24, 25, 26, 30 for
>>    * software PTE bits.  We actually use bits 21, 24, 25, and
>> @@ -155,6 +155,9 @@ extern pte_t *va_to_pte(unsigned long address);
>>   #define _PAGE_ACCESSED 0x400   /* software: R: page referenced */
>>   #define _PMD_PRESENT   PAGE_MASK
>>
>> +/* We borrow bit 24 to store the exclusive marker in swap PTEs. */
>> +#define _PAGE_SWP_EXCLUSIVE    _PAGE_DIRTY
> 
> _PAGE_DIRTY is 0x80, so this is also bit 7, thus the new comment is
> wrong?

In the example, I use MSB-0 bit numbering (which I determined to be 
correct in microblaze context eventually, but I got confused a couple a 
times because it's very inconsistent). That should be MSB-0 bit 24.

Thanks!

-- 
Thanks,

David / dhildenb

