Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6506A477A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Feb 2023 18:02:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQRcW3vWBz3c38
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 04:02:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MrzMv/us;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MrzMv/us;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MrzMv/us;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MrzMv/us;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQRbV5Cnwz30Kr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 04:01:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677517266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S+gj+IVlpRNML/WhRdwS5WpJ1kIzGGA+IXuZi3TvglQ=;
	b=MrzMv/usUX5QJ7MfXIzP6UasX8styJCjS6RvawQpVwkFJTJOAASaI3SZ5dopTQUIU2Zlwb
	fFv2C5AK3/shy165dPEMHzG5GwjEMDWq1z6CVJqfoEp601rjg1yQUlLqvpWHqkeV+0JXA4
	RoBVkKJCkvGWUQ/safPk0USMCnYoBWc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677517266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S+gj+IVlpRNML/WhRdwS5WpJ1kIzGGA+IXuZi3TvglQ=;
	b=MrzMv/usUX5QJ7MfXIzP6UasX8styJCjS6RvawQpVwkFJTJOAASaI3SZ5dopTQUIU2Zlwb
	fFv2C5AK3/shy165dPEMHzG5GwjEMDWq1z6CVJqfoEp601rjg1yQUlLqvpWHqkeV+0JXA4
	RoBVkKJCkvGWUQ/safPk0USMCnYoBWc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-351-hrsu_jNBNnCGbJfA94p_Xg-1; Mon, 27 Feb 2023 12:01:04 -0500
X-MC-Unique: hrsu_jNBNnCGbJfA94p_Xg-1
Received: by mail-wm1-f69.google.com with SMTP id l20-20020a05600c1d1400b003e10d3e1c23so5614434wms.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Feb 2023 09:01:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+gj+IVlpRNML/WhRdwS5WpJ1kIzGGA+IXuZi3TvglQ=;
        b=z1qcYbkVh0oUfFu5V6KAKL1xHOXpotQ2pdIKLYqtjyIpAtbLHT6AeAJB77wlrOCZyk
         z1kZcohY67N+DjI8wEiMWO8NdW81JtTDw32lFQ5GjBjBRJKeQ4nrwOgvgEIy2yiHEXxZ
         I5I1KTvBehLwK5UnQ/v0/RsUqU1xdluvxzzpWlzWjHN+zaa2EVa/Aa5mDvcQMXQl1hlB
         HBzBuFoSz5GKvD/mCt6ljueuzODgpz+qHu5dJjX0nTuKTBDgPggjRiu/e5/X8kmZ4XQ7
         bKBle72w8H34QTx0zq3tsIpgP4iwvNmNBTRkWe0bhu8hsBjVSoEir8fcknvMcBSnSpE5
         O71g==
X-Gm-Message-State: AO0yUKXkigvbZnXs78ZGsJDSBwSFqAPtA9jDbQsBKQJusBMZSiBpwzZY
	ziQwYQopHRBEsVGKM7MXdYStT0etVbEVdtRkr76OEbbo/EjHh7NRim+of9CBerHi1uzSJJbj48E
	ruJczlDysf9fr+e5IXEzggEyTEg==
X-Received: by 2002:a5d:570e:0:b0:2bf:d940:29b6 with SMTP id a14-20020a5d570e000000b002bfd94029b6mr22317887wrv.54.1677517263063;
        Mon, 27 Feb 2023 09:01:03 -0800 (PST)
X-Google-Smtp-Source: AK7set/UUjV2lk6TzBDGO2RyIGoSkW6MncSJyiWPHsxHHIhpKbsx37PxyO7HkStEnBG5FTknvHrGmg==
X-Received: by 2002:a5d:570e:0:b0:2bf:d940:29b6 with SMTP id a14-20020a5d570e000000b002bfd94029b6mr22317842wrv.54.1677517262720;
        Mon, 27 Feb 2023 09:01:02 -0800 (PST)
Received: from [192.168.3.108] (p5b0c68fb.dip0.t-ipconnect.de. [91.12.104.251])
        by smtp.gmail.com with ESMTPSA id l4-20020a05600c1d0400b003db0ad636d1sm15217382wms.28.2023.02.27.09.01.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 09:01:02 -0800 (PST)
Message-ID: <c145a2db-f92c-65aa-3e68-07dbb2e097a6@redhat.com>
Date: Mon, 27 Feb 2023 18:01:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH mm-unstable v1 11/26] microblaze/mm: support
 __HAVE_ARCH_PTE_SWP_EXCLUSIVE
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20230113171026.582290-1-david@redhat.com>
 <20230113171026.582290-12-david@redhat.com>
 <CAMuHMdX-FDga8w=pgg1myskEx6wp+oyZifhPPPFnWrc1zW7ZpQ@mail.gmail.com>
 <9ed766a6-cf06-535d-3337-ea6ff25c2362@redhat.com>
 <CAMuHMdWSaoKqO1Nx7QMDCcXrRmFbqqX8uwDRezXs8g+HdEFjKA@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <CAMuHMdWSaoKqO1Nx7QMDCcXrRmFbqqX8uwDRezXs8g+HdEFjKA@mail.gmail.com>
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

>>>>    /*
>>>>     * Externally used page protection values.
>>>> diff --git a/arch/microblaze/include/asm/pgtable.h b/arch/microblaze/include/asm/pgtable.h
>>>> index 42f5988e998b..7e3de54bf426 100644
>>>> --- a/arch/microblaze/include/asm/pgtable.h
>>>> +++ b/arch/microblaze/include/asm/pgtable.h
>>>> @@ -131,10 +131,10 @@ extern pte_t *va_to_pte(unsigned long address);
>>>>     * of the 16 available.  Bit 24-26 of the TLB are cleared in the TLB
>>>>     * miss handler.  Bit 27 is PAGE_USER, thus selecting the correct
>>>>     * zone.
>>>> - * - PRESENT *must* be in the bottom two bits because swap cache
>>>> - * entries use the top 30 bits.  Because 4xx doesn't support SMP
>>>> - * anyway, M is irrelevant so we borrow it for PAGE_PRESENT.  Bit 30
>>>> - * is cleared in the TLB miss handler before the TLB entry is loaded.
>>>> + * - PRESENT *must* be in the bottom two bits because swap PTEs use the top
>>>> + * 30 bits.  Because 4xx doesn't support SMP anyway, M is irrelevant so we
>>>> + * borrow it for PAGE_PRESENT.  Bit 30 is cleared in the TLB miss handler
>>>> + * before the TLB entry is loaded.
>>>
>>> So the PowerPC 4xx comment is still here?
>>
>> I only dropped the comment above __swp_type(). I guess you mean that we
>> could also drop the "Because 4xx doesn't support SMP anyway, M is
>> irrelevant so we borrow it for PAGE_PRESENT." sentence, correct? Not
> 
> Yes, that's what I meant.
> 
>> sure about the "Bit 30 is cleared in the TLB miss handler" comment, if
>> that can similarly be dropped.
> 
> No idea, didn't check. But if it was copied from PPC, chances are
> high it's no longer true....

I'll have a look.

> 
>>>>     * - All other bits of the PTE are loaded into TLBLO without
>>>>     *  * modification, leaving us only the bits 20, 21, 24, 25, 26, 30 for
>>>>     * software PTE bits.  We actually use bits 21, 24, 25, and
>>>> @@ -155,6 +155,9 @@ extern pte_t *va_to_pte(unsigned long address);
>>>>    #define _PAGE_ACCESSED 0x400   /* software: R: page referenced */
>>>>    #define _PMD_PRESENT   PAGE_MASK
>>>>
>>>> +/* We borrow bit 24 to store the exclusive marker in swap PTEs. */
>>>> +#define _PAGE_SWP_EXCLUSIVE    _PAGE_DIRTY
>>>
>>> _PAGE_DIRTY is 0x80, so this is also bit 7, thus the new comment is
>>> wrong?
>>
>> In the example, I use MSB-0 bit numbering (which I determined to be
>> correct in microblaze context eventually, but I got confused a couple a
>> times because it's very inconsistent). That should be MSB-0 bit 24.
> 
> Thanks, TIL microblaze uses IBM bit numbering...

I assume IBM bit numbering corresponds to MSB-0 bit numbering, correct?


I recall that I used the comment above "/* Definitions for MicroBlaze. 
*/" as an orientation.

0  1  2  3  4  ... 18 19 20 21 22 23 24 25 26 27 28 29 30 31
RPN.....................  0  0 EX WR ZSEL.......  W  I  M  G


So ... either we adjust both or we leave it as is. (again, depends on 
what the right thing to to is -- which I don't know :) )

-- 
Thanks,

David / dhildenb

