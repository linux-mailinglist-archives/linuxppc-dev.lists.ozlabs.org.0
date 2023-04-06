Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A934B6D9CC0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 17:52:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PsmH43Mxzz3fVq
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Apr 2023 01:52:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZkW7pc7p;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZkW7pc7p;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZkW7pc7p;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZkW7pc7p;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PsmGB5xy7z3fGQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Apr 2023 01:52:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680796318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rXGtO/ZmgcxJ+0cLf6d2t80Dy16O6Eu74rSJdt26LEE=;
	b=ZkW7pc7pNo/dlO7QBx4P32TuqKNP8zf6eEJ6IE+1MdR8tveiAxWthyFotoyaCz2nXi1AjD
	Wq879Vg8C58sG8tm0ZJlSf4zc6PSGWMXY5Jv451m9F817dX5u5JC21NRrkXeeVtI5KcRNc
	xm8qfY1u2GWD9bmjhlgcxS7Tzfj4iMg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680796318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rXGtO/ZmgcxJ+0cLf6d2t80Dy16O6Eu74rSJdt26LEE=;
	b=ZkW7pc7pNo/dlO7QBx4P32TuqKNP8zf6eEJ6IE+1MdR8tveiAxWthyFotoyaCz2nXi1AjD
	Wq879Vg8C58sG8tm0ZJlSf4zc6PSGWMXY5Jv451m9F817dX5u5JC21NRrkXeeVtI5KcRNc
	xm8qfY1u2GWD9bmjhlgcxS7Tzfj4iMg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-XddSAwtlMgumSRciQ4r35g-1; Thu, 06 Apr 2023 11:51:57 -0400
X-MC-Unique: XddSAwtlMgumSRciQ4r35g-1
Received: by mail-wm1-f71.google.com with SMTP id h22-20020a05600c351600b003ef739416c3so13684750wmq.4
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Apr 2023 08:51:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680796316; x=1683388316;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :content-language:references:cc:to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rXGtO/ZmgcxJ+0cLf6d2t80Dy16O6Eu74rSJdt26LEE=;
        b=07oHRHKRuAiQWzeO6DTM4zi7+hRRkynXlx+By+pT9oiXAHLh3ALBNRvIpRHcC54Ae6
         uNXmrcX4DVCNSMDAiPHMJBy5ERrBSL/+bkO2oJB1PGoA0vTf0XQaoeKCsl5GstIe+GXh
         JLzjIU7vis5Ih/S5LG5EYQU9vhQ7/ky1E4Z3ZUSe2wGtdUbSSelz/VCEZT3L9etkEd+W
         hvwzsmCiCyhISxtZM0UmYnP6aHSruuc3D7DPiMoc2SFF50y4YyE43/P2F9Jwdnq6Bjja
         mf7sVkSBf/UEs8+0As8TnVNpOaE3LEgnlHvsZLUYsRe45Ad7YSgYBMEMuHFfdiA1S7bF
         QB6g==
X-Gm-Message-State: AAQBX9dg6SkcvYgQ9ZDkrxoqMp1GGygDQ2+GUz73IGFMqrQTW8xEmWEr
	9l8y2t0C14cblwFH4X6w3PextjxR6Hy5SGnl5yqxCRcfNoCS4D7C4NqVEjrrZfjO/cjGx2B1mQT
	Z4djpld98zm90l7eML+D8MrBJXA==
X-Received: by 2002:a5d:4b48:0:b0:2c5:5349:22c1 with SMTP id w8-20020a5d4b48000000b002c5534922c1mr4313711wrs.5.1680796315825;
        Thu, 06 Apr 2023 08:51:55 -0700 (PDT)
X-Google-Smtp-Source: AKy350ay4SJLqt5fA44R22zdeLYwjok7IPAqD9HIjt6I2uRSHvro/TvSjV0I+pG8tJTj7AgJtBYNWg==
X-Received: by 2002:a5d:4b48:0:b0:2c5:5349:22c1 with SMTP id w8-20020a5d4b48000000b002c5534922c1mr4313662wrs.5.1680796315457;
        Thu, 06 Apr 2023 08:51:55 -0700 (PDT)
Received: from ?IPV6:2003:cb:c705:6300:a8be:c1ad:41a1:2bf7? (p200300cbc7056300a8bec1ad41a12bf7.dip0.t-ipconnect.de. [2003:cb:c705:6300:a8be:c1ad:41a1:2bf7])
        by smtp.gmail.com with ESMTPSA id l13-20020a5d668d000000b002e61e002943sm2031659wru.116.2023.04.06.08.51.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 08:51:54 -0700 (PDT)
Message-ID: <248392c0-52d1-d09d-75ec-9e930435c053@redhat.com>
Date: Thu, 6 Apr 2023 17:51:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
To: Peter Zijlstra <peterz@infradead.org>,
 Marcelo Tosatti <mtosatti@redhat.com>
References: <20230404134224.137038-1-ypodemsk@redhat.com>
 <20230404134224.137038-4-ypodemsk@redhat.com> <ZC1Q7uX4rNLg3vEg@lothringen>
 <ZC1XD/sEJY+zRujE@lothringen> <ZC3P3Ds/BIcpRNGr@tpad>
 <20230405195226.GB365912@hirez.programming.kicks-ass.net>
 <ZC69Wmqjdwk+I8kn@tpad>
 <20230406132928.GM386572@hirez.programming.kicks-ass.net>
 <20230406140423.GA386634@hirez.programming.kicks-ass.net>
 <20230406150213.GQ386572@hirez.programming.kicks-ass.net>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH 3/3] mm/mmu_gather: send tlb_remove_table_smp_sync IPI
 only to CPUs in kernel mode
In-Reply-To: <20230406150213.GQ386572@hirez.programming.kicks-ass.net>
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
Cc: geert+renesas@glider.be, tony@atomide.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, Yair Podemsky <ypodemsk@redhat.com>, sebastian.reichel@collabora.com, linux-mm@kvack.org, hpa@zytor.com, sparclinux@vger.kernel.org, agordeev@linux.ibm.com, will@kernel.org, ardb@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, vschneid@redhat.com, arnd@arndb.de, paulmck@kernel.org, aneesh.kumar@linux.ibm.com, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, samitolvanen@google.com, borntraeger@linux.ibm.com, hca@linux.ibm.com, keescook@chromium.org, gor@linux.ibm.com, jannh@google.com, Frederic Weisbecker <frederic@kernel.org>, npiggin@gmail.com, rmk+kernel@armlinux.org.uk, Yang Shi <shy828301@gmail.com>, bp@alien8.de, nick.hawkins@hpe.com, tglx@linutronix.de, jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org, alougovs@redhat.com, linux-kernel@vger.kernel.org, juerg.haefliger@canonical.com, svens@linux.ibm.com, dhildenb@redhat.com, akpm@linux-found
 ation.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 06.04.23 17:02, Peter Zijlstra wrote:
> On Thu, Apr 06, 2023 at 04:04:23PM +0200, Peter Zijlstra wrote:
>> On Thu, Apr 06, 2023 at 03:29:28PM +0200, Peter Zijlstra wrote:
>>> On Thu, Apr 06, 2023 at 09:38:50AM -0300, Marcelo Tosatti wrote:
>>>
>>>>> To actually hit this path you're doing something really dodgy.
>>>>
>>>> Apparently khugepaged is using the same infrastructure:
>>>>
>>>> $ grep tlb_remove_table khugepaged.c
>>>> 	tlb_remove_table_sync_one();
>>>> 	tlb_remove_table_sync_one();
>>>>
>>>> So just enabling khugepaged will hit that path.
>>>
>>> Urgh, WTF..
>>>
>>> Let me go read that stuff :/
>>
>> At the very least the one on collapse_and_free_pmd() could easily become
>> a call_rcu() based free.
>>
>> I'm not sure I'm following what collapse_huge_page() does just yet.
> 
> DavidH, what do you thikn about reviving Jann's patches here:
> 
>    https://bugs.chromium.org/p/project-zero/issues/detail?id=2365#c1
> 
> Those are far more invasive, but afaict they seem to do the right thing.
> 

I recall seeing those while discussed on security@kernel.org. What we 
currently have was (IMHO for good reasons) deemed better to fix the 
issue, especially when caring about backports and getting it right.

The alternative that was discussed in that context IIRC was to simply 
allocate a fresh page table, place the fresh page table into the list 
instead, and simply free the old page table (then using common machinery).

TBH, I'd wish (and recently raised) that we could just stop wasting 
memory on page tables for THPs that are maybe never going to get 
PTE-mapped ... and eventually just allocate on demand (with some 
caching?) and handle the places where we're OOM and cannot PTE-map a THP 
in some descend way.

... instead of trying to figure out how to deal with these page tables 
we cannot free but have to special-case simply because of GUP-fast.

-- 
Thanks,

David / dhildenb

