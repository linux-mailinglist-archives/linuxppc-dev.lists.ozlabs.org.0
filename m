Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 390096E78B3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 13:34:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1dxS6z0Yz3g0W
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 21:34:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VdVAsM9S;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VdVAsM9S;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VdVAsM9S;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VdVAsM9S;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q1ds82xWpz3gsD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Apr 2023 21:31:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681903863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dPuQPsleEjjBeSq0BvDdXkwF3D8bnmU80K+kHEWN1i0=;
	b=VdVAsM9SDIMFVlFaiTV21FNVdvlixn938MmjFMpgbc9vO0rU69SNTb7DmrWj/7/JLV46YU
	ha17LGPDrMFu7XqCp6UAbboHtSqv2+qfPmJFwE0FprNhOPZbw+KnF8Z298JC3anoobeNnb
	O/A4QfJH/k69P5OTAb3glI5hHMHpSH8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681903863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dPuQPsleEjjBeSq0BvDdXkwF3D8bnmU80K+kHEWN1i0=;
	b=VdVAsM9SDIMFVlFaiTV21FNVdvlixn938MmjFMpgbc9vO0rU69SNTb7DmrWj/7/JLV46YU
	ha17LGPDrMFu7XqCp6UAbboHtSqv2+qfPmJFwE0FprNhOPZbw+KnF8Z298JC3anoobeNnb
	O/A4QfJH/k69P5OTAb3glI5hHMHpSH8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-30-rnemUtw-P3Sr-rhCwL2wLA-1; Wed, 19 Apr 2023 07:31:01 -0400
X-MC-Unique: rnemUtw-P3Sr-rhCwL2wLA-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-2f43679bcf5so1853610f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Apr 2023 04:31:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681903860; x=1684495860;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dPuQPsleEjjBeSq0BvDdXkwF3D8bnmU80K+kHEWN1i0=;
        b=iqbz/zQW13GHTCoU1vOwIwrMUOL6VFvebsAqzuej4Si6IX1aoV2o72A3/2dU++wX/G
         IKglFoEFC+4lHPE6Tdt1O/xvd6DsBNYmr1I7C07Wn64DZfrQBblNBpG/L5dXeeLw1KhU
         fFuNMkd65ofr9GmMsO6jqSN2gX1q5wZiRj0mSM3qB11UgaiYK3BfNYJkXbf2f2hRTe1f
         unDjhA0PEDq92EdPhlfBF3H1pXfT/3l3oQm9rRfs/YVmzr1IkWRGqmbvkwlS5mRr8uTR
         u3FIKj4LOLtnd+4yfERUzwY4o15pZziwv3xx1CnOmDT0pj46lalRRIkWrbiJsQbI06/O
         TvzA==
X-Gm-Message-State: AAQBX9fS7Ad1V2Xlj7Gr98Mi22LnD9a3XPrLXe8zdZ6ULXsIZvgZLrK4
	0WsPqouRmlk7tfz75Et+CHWdStF4vFvTLoC2ugB32CuntVdgweF6wr7u2e5cGdbIKorSxOUgDVU
	zEQ7ylxCm8jbLqXFFx6c2fa1vgA==
X-Received: by 2002:a5d:69d0:0:b0:2fe:c0ea:18ad with SMTP id s16-20020a5d69d0000000b002fec0ea18admr1723965wrw.47.1681903860469;
        Wed, 19 Apr 2023 04:31:00 -0700 (PDT)
X-Google-Smtp-Source: AKy350bzhkcwsfhrSQkvGUIm/JW8RoVL0p90cvfrRI4bamTYUVPg7DxfHt0wqA8rK9Mz1QlqY1RVnA==
X-Received: by 2002:a5d:69d0:0:b0:2fe:c0ea:18ad with SMTP id s16-20020a5d69d0000000b002fec0ea18admr1723910wrw.47.1681903860074;
        Wed, 19 Apr 2023 04:31:00 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70b:7b00:7c52:a5fa:8004:96fd? (p200300cbc70b7b007c52a5fa800496fd.dip0.t-ipconnect.de. [2003:cb:c70b:7b00:7c52:a5fa:8004:96fd])
        by smtp.gmail.com with ESMTPSA id v17-20020a1cf711000000b003f16fdc6233sm1880494wmh.47.2023.04.19.04.30.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 04:30:59 -0700 (PDT)
Message-ID: <914e826e-3fab-4540-d3a1-24ca39b1cf0a@redhat.com>
Date: Wed, 19 Apr 2023 13:30:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: Peter Zijlstra <peterz@infradead.org>
References: <20230404134224.137038-4-ypodemsk@redhat.com>
 <ZC1Q7uX4rNLg3vEg@lothringen> <ZC1XD/sEJY+zRujE@lothringen>
 <ZC3P3Ds/BIcpRNGr@tpad>
 <20230405195226.GB365912@hirez.programming.kicks-ass.net>
 <ZC69Wmqjdwk+I8kn@tpad>
 <20230406132928.GM386572@hirez.programming.kicks-ass.net>
 <20230406140423.GA386634@hirez.programming.kicks-ass.net>
 <20230406150213.GQ386572@hirez.programming.kicks-ass.net>
 <248392c0-52d1-d09d-75ec-9e930435c053@redhat.com>
 <20230406182749.GA405948@hirez.programming.kicks-ass.net>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH 3/3] mm/mmu_gather: send tlb_remove_table_smp_sync IPI
 only to CPUs in kernel mode
In-Reply-To: <20230406182749.GA405948@hirez.programming.kicks-ass.net>
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
Cc: geert+renesas@glider.be, tony@atomide.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, Yair Podemsky <ypodemsk@redhat.com>, sebastian.reichel@collabora.com, linux-mm@kvack.org, hpa@zytor.com, sparclinux@vger.kernel.org, agordeev@linux.ibm.com, will@kernel.org, ardb@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, vschneid@redhat.com, arnd@arndb.de, paulmck@kernel.org, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, samitolvanen@google.com, borntraeger@linux.ibm.com, hca@linux.ibm.com, keescook@chromium.org, gor@linux.ibm.com, jannh@google.com, Frederic Weisbecker <frederic@kernel.org>, npiggin@gmail.com, rmk+kernel@armlinux.org.uk, Yang Shi <shy828301@gmail.com>, bp@alien8.de, nick.hawkins@hpe.com, tglx@linutronix.de, jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org, alougovs@redhat.com, Marcelo Tosatti <mtosatti@redhat.com>, linux-kernel@vger.kernel.org, juerg.haefliger@canonical.com, svens@linux.ibm.com, aneesh.kumar@linux.ibm.com
 , dhildenb@redhat.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 06.04.23 20:27, Peter Zijlstra wrote:
> On Thu, Apr 06, 2023 at 05:51:52PM +0200, David Hildenbrand wrote:
>> On 06.04.23 17:02, Peter Zijlstra wrote:
> 
>>> DavidH, what do you thikn about reviving Jann's patches here:
>>>
>>>     https://bugs.chromium.org/p/project-zero/issues/detail?id=2365#c1
>>>
>>> Those are far more invasive, but afaict they seem to do the right thing.
>>>
>>
>> I recall seeing those while discussed on security@kernel.org. What we
>> currently have was (IMHO for good reasons) deemed better to fix the issue,
>> especially when caring about backports and getting it right.
> 
> Yes, and I think that was the right call. However, we can now revisit
> without having the pressure of a known defect and backport
> considerations.
> 
>> The alternative that was discussed in that context IIRC was to simply
>> allocate a fresh page table, place the fresh page table into the list
>> instead, and simply free the old page table (then using common machinery).
>>
>> TBH, I'd wish (and recently raised) that we could just stop wasting memory
>> on page tables for THPs that are maybe never going to get PTE-mapped ... and
>> eventually just allocate on demand (with some caching?) and handle the
>> places where we're OOM and cannot PTE-map a THP in some descend way.
>>
>> ... instead of trying to figure out how to deal with these page tables we
>> cannot free but have to special-case simply because of GUP-fast.
> 
> Not keeping them around sounds good to me, but I'm not *that* familiar
> with the THP code, most of that happened after I stopped tracking mm. So
> I'm not sure how feasible is it.
> 
> But it does look entirely feasible to rework this page-table freeing
> along the lines Jann did.

It's most probably more feasible, although the easiest would be to just 
allocate a fresh page table to deposit and free the old one using the 
mmu gatherer.

This way we can avoid the khugepaged of tlb_remove_table_smp_sync(), but 
not the tlb_remove_table_one() usage. I suspect khugepaged isn't really 
relevant in RT kernels (IIRC, most of RT setups disable THP completely).

tlb_remove_table_one() only triggers if __get_free_page(GFP_NOWAIT | 
__GFP_NOWARN); fails. IIUC, that can happen easily under memory pressure 
because it doesn't wait for direct reclaim.

I don't know much about RT workloads (so I'd appreciate some feedback), 
but I guess we can run int memory pressure as well due to some !rt 
housekeeping task on the system?

-- 
Thanks,

David / dhildenb

