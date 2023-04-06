Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3948E6D9B18
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 16:49:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pskt80G3Lz3ftS
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Apr 2023 00:49:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MFH7ILfx;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MFH7ILfx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MFH7ILfx;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MFH7ILfx;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pskjc5XKvz3ftK
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Apr 2023 00:42:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680792128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gj/7YiiNEEJ4+hsVKCJkj1HvadHLyL0uUxvEtZRASmc=;
	b=MFH7ILfxbxZqwO0kUF9n0x6w2yOBze1MxGq/VEeatz4ioSpLISS87DxB3FDvicAARR+9QA
	s51Ge5pm9TdLPJglEADJtgBgdA4ozmMs2yKsILr6cyhqVmd86lXUWM4E+u/lLbT2p3E3tI
	QkYVLP3BjATwNTZLVt1NF8ymBEekAZo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680792128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gj/7YiiNEEJ4+hsVKCJkj1HvadHLyL0uUxvEtZRASmc=;
	b=MFH7ILfxbxZqwO0kUF9n0x6w2yOBze1MxGq/VEeatz4ioSpLISS87DxB3FDvicAARR+9QA
	s51Ge5pm9TdLPJglEADJtgBgdA4ozmMs2yKsILr6cyhqVmd86lXUWM4E+u/lLbT2p3E3tI
	QkYVLP3BjATwNTZLVt1NF8ymBEekAZo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-41-vD8i_iG6OdCaRYx-N_0JXg-1; Thu, 06 Apr 2023 10:42:07 -0400
X-MC-Unique: vD8i_iG6OdCaRYx-N_0JXg-1
Received: by mail-wr1-f69.google.com with SMTP id b14-20020a05600003ce00b002cfefd8e637so4981675wrg.15
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Apr 2023 07:42:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680792126; x=1683384126;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gj/7YiiNEEJ4+hsVKCJkj1HvadHLyL0uUxvEtZRASmc=;
        b=bdPW2mW9gIgVKc8DHul5hnh9z5wzNSw0tX08QoD9uMbtChBVMukt0wESE2cfXuCyv+
         RwavrOcooVPB60OrZrqaNx9/jCsUEiwZrdc42D5bi1I6D67CsGwu1+ur3tzYIKYOetQK
         T0dbYoENy9ffCj6IGvof3R+zmCh4VvGqfj2oF6+Jz2OQ8wRy2hNCKcUnrTZijW/GHI4e
         PLT82ROQVdT8wLFpH/daFkIo/OspR/jCh0xdXJGTwgPh+B+5Y+9pgcUYEODaDb8iXH8d
         S7uWj1n0SchbsKv0Zto2FkAgX8w4E+dEGcEvJITyF97W5Z4NnZiZXmSJkNBI1xL2ajyL
         xTyg==
X-Gm-Message-State: AAQBX9e96qa7ipsvAdt9+d4kdIUD4oHdPmriFSMNMflZvuvgN7Wf+S1t
	CzBGFor+cRIfQklNin7ncDsuo49ejIVl1dC1Etfdr5Y32ReVYx1pnorZr3VmqjrhfJWMo+NRF00
	f4AEm56iDhJXAAX5JFJ1jRvizHQ==
X-Received: by 2002:adf:edd1:0:b0:2cf:e436:f722 with SMTP id v17-20020adfedd1000000b002cfe436f722mr7362259wro.64.1680792125941;
        Thu, 06 Apr 2023 07:42:05 -0700 (PDT)
X-Google-Smtp-Source: AKy350aYtbTmofQf/bI+zulYGKU6rzEaLaSQD1iMgTDT9wELk7OW8105qv2TVrk0E+k02OOZTiYupA==
X-Received: by 2002:adf:edd1:0:b0:2cf:e436:f722 with SMTP id v17-20020adfedd1000000b002cfe436f722mr7362204wro.64.1680792125568;
        Thu, 06 Apr 2023 07:42:05 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id m8-20020adffe48000000b002c55521903bsm1942945wrs.51.2023.04.06.07.42.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 07:42:04 -0700 (PDT)
Message-ID: <1654e2d5-5a32-a253-e335-0ee42f69f5ef@redhat.com>
Date: Thu, 6 Apr 2023 16:42:02 +0200
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
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH 3/3] mm/mmu_gather: send tlb_remove_table_smp_sync IPI
 only to CPUs in kernel mode
In-Reply-To: <20230406140423.GA386634@hirez.programming.kicks-ass.net>
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
Cc: geert+renesas@glider.be, tony@atomide.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, Yair Podemsky <ypodemsk@redhat.com>, sebastian.reichel@collabora.com, linux-mm@kvack.org, hpa@zytor.com, sparclinux@vger.kernel.org, agordeev@linux.ibm.com, will@kernel.org, ardb@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, vschneid@redhat.com, arnd@arndb.de, paulmck@kernel.org, aneesh.kumar@linux.ibm.com, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, samitolvanen@google.com, borntraeger@linux.ibm.com, hca@linux.ibm.com, keescook@chromium.org, gor@linux.ibm.com, jannh@google.com, Frederic Weisbecker <frederic@kernel.org>, npiggin@gmail.com, rmk+kernel@armlinux.org.uk, bp@alien8.de, nick.hawkins@hpe.com, tglx@linutronix.de, jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org, alougovs@redhat.com, linux-kernel@vger.kernel.org, juerg.haefliger@canonical.com, svens@linux.ibm.com, dhildenb@redhat.com, akpm@linux-foundation.org, linuxppc-dev@lists.oz
 labs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 06.04.23 16:04, Peter Zijlstra wrote:
> On Thu, Apr 06, 2023 at 03:29:28PM +0200, Peter Zijlstra wrote:
>> On Thu, Apr 06, 2023 at 09:38:50AM -0300, Marcelo Tosatti wrote:
>>
>>>> To actually hit this path you're doing something really dodgy.
>>>
>>> Apparently khugepaged is using the same infrastructure:
>>>
>>> $ grep tlb_remove_table khugepaged.c
>>> 	tlb_remove_table_sync_one();
>>> 	tlb_remove_table_sync_one();
>>>
>>> So just enabling khugepaged will hit that path.
>>
>> Urgh, WTF..
>>
>> Let me go read that stuff :/
> 
> At the very least the one on collapse_and_free_pmd() could easily become
> a call_rcu() based free.
> 
> I'm not sure I'm following what collapse_huge_page() does just yet.

It wants to replace a leaf page table by a THP (Transparent Huge Page 
mapped by a PMD). So we want to rip out a leaf page table while other 
code (GUP-fast) might still be walking it. In contrast to freeing the 
page table, we put it into a list where it can be reuse when having to 
PTE-map a THP again.

Now, similar to after freeing the page table, someone else could reuse 
that page table and modify it.

If we have GUP-fast walking the page table while that is happening, 
we're in trouble. So we have to make sure GUP-fast is done before 
enqueuing the now-free page table.

That's why the tlb_remove_table_sync_one() was recently added (by Jann 
IIRC).

-- 
Thanks,

David / dhildenb

