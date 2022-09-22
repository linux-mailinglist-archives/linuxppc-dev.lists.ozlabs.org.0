Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5095E64D7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 16:13:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYHLM478nz3cBS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 00:12:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hxa2U1mg;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HlA9aPEY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hxa2U1mg;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HlA9aPEY;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYHKc1dnFz3bkG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 00:12:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663855932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y/iFP6H1ozi01zUaORnvK3MXE2O4OXdY0B940ZuFJpQ=;
	b=hxa2U1mgy5hJm1GBmlCAe5wlkVYMwhzgpqrYa3ICKN0CjmQaNQDktu09pUWJwhO0g2GvEw
	MZAAqcr2fyMb3ie9AtNKdB9u4DpJbMLqumXS/t3YfIarsK8KOqwgGkzh+JQ2ptpzNUVR0o
	yhTyRWkTf6ffgjXo0yzZ1sbb4WnnTok=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663855933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y/iFP6H1ozi01zUaORnvK3MXE2O4OXdY0B940ZuFJpQ=;
	b=HlA9aPEYz6HkxkCczKPaTOTAu1NqcT4rE3IIOy1bzVxHJrqSTLJLXif+MFdBPrFkOlgUIG
	US3F/XBf3PfWpDezuBqnycym1P+L1vdMgmf0+AkWBdyP89L8FvEPp8D3aJpGTRFgHpHiBu
	jaDRV84nRwhfzZ+5bmA31fPcFrb1mHw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-522-QAe93pmKMxu-rUHtxkldSQ-1; Thu, 22 Sep 2022 10:12:09 -0400
X-MC-Unique: QAe93pmKMxu-rUHtxkldSQ-1
Received: by mail-wr1-f72.google.com with SMTP id f9-20020adfc989000000b0022b3bbc7a7eso121875wrh.13
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 07:12:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=Y/iFP6H1ozi01zUaORnvK3MXE2O4OXdY0B940ZuFJpQ=;
        b=pEgPPR9wjs7Fw/xeImvKqC57d2NX4/BJmAzpSOPhBnrqqmrTHjX37O2oPRKfRHj2LE
         B2/FoJWJn2yeMjxOHduzEiObjXy5a+ljxUNXFTiE7q2eTP/yI670TpmzC1udKqqL3dEV
         H59VF72rlNgDzIqyp0krl3V98sPUh/zMMQ/CAFcy03PojSwyir2baJz3QoA+DTQUoxIb
         GpW/TcV5mjvlzr92Gw8Q6xtK0nwd0Lt25zWjrcu8jAgvUApJIDHrwUIiCgLp/lQ1nj0T
         9efoX9drXSN15AA66TXxVrsagpTUDj0kcdO9RFsVlHC0cwJ6oef0cneX5JAc3d9d2r8P
         aCiA==
X-Gm-Message-State: ACrzQf2j5lCLERfMgrGNFavuyOtqzszYMnYzL+PhhRk6frlOsLn1XbwH
	kwGt96GC7QKW6T7WnxIVxXNsAyICxB4Kt7l2XciPpeZiTwsPVlKgjyxiXX6vhavzXvKgdaQsuu2
	awUKaq/cRvf1G3o2SZqXyP/pz3w==
X-Received: by 2002:a5d:59c4:0:b0:22b:237c:3e23 with SMTP id v4-20020a5d59c4000000b0022b237c3e23mr2314019wry.291.1663855928451;
        Thu, 22 Sep 2022 07:12:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6qIYRASR2IfsvAvIir7beVokLpyQg1uzYzGbKfWQNOhgzM7pV5+gao6b9nQQt3+MNJlTYtjA==
X-Received: by 2002:a5d:59c4:0:b0:22b:237c:3e23 with SMTP id v4-20020a5d59c4000000b0022b237c3e23mr2314002wry.291.1663855928114;
        Thu, 22 Sep 2022 07:12:08 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:2200:d595:cc20:2e3a:fc5f? (p200300cbc7082200d595cc202e3afc5f.dip0.t-ipconnect.de. [2003:cb:c708:2200:d595:cc20:2e3a:fc5f])
        by smtp.gmail.com with ESMTPSA id bt25-20020a056000081900b00228d52b935asm5332956wrb.71.2022.09.22.07.12.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 07:12:07 -0700 (PDT)
Message-ID: <d1ceedca-b28e-c47e-aa0d-aa1cb36d12b9@redhat.com>
Date: Thu, 22 Sep 2022 16:12:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v1 1/3] coding-style.rst: document BUG() and WARN() rules
 ("do not crash the kernel")
To: Kalle Valo <kvalo@kernel.org>
References: <20220920122302.99195-1-david@redhat.com>
 <20220920122302.99195-2-david@redhat.com> <87pmfp8hnj.fsf@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <87pmfp8hnj.fsf@kernel.org>
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
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Baoquan He <bhe@redhat.com>, linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Dave Young <dyoung@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>, linux-mm@kvack.org, David Laight <David.Laight@ACULAB.COM>, Dwaipayan Ray <dwaipayanray1@gmail.com>, Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>, Vivek Goyal <vgoyal@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 21.09.22 06:40, Kalle Valo wrote:
> David Hildenbrand <david@redhat.com> writes:
> 
>> Linus notes [1] that the introduction of new code that uses VM_BUG_ON()
>> is just as bad as BUG_ON(), because it will crash the kernel on
>> distributions that enable CONFIG_DEBUG_VM (like Fedora):
>>
>>      VM_BUG_ON() has the exact same semantics as BUG_ON. It is literally
>>      no different, the only difference is "we can make the code smaller
>>      because these are less important". [2]
>>
>> This resulted in a more generic discussion about usage of BUG() and
>> friends. While there might be corner cases that still deserve a BUG_ON(),
>> most BUG_ON() cases should simply use WARN_ON_ONCE() and implement a
>> recovery path if reasonable:
>>
>>      The only possible case where BUG_ON can validly be used is "I have
>>      some fundamental data corruption and cannot possibly return an
>>      error". [2]
>>
>> As a very good approximation is the general rule:
>>
>>      "absolutely no new BUG_ON() calls _ever_" [2]
>>
>> ... not even if something really shouldn't ever happen and is merely for
>> documenting that an invariant always has to hold. However, there are sill
>> exceptions where BUG_ON() may be used:
>>
>>      If you have a "this is major internal corruption, there's no way we can
>>      continue", then BUG_ON() is appropriate. [3]
>>
>> There is only one good BUG_ON():
>>
>>      Now, that said, there is one very valid sub-form of BUG_ON():
>>      BUILD_BUG_ON() is absolutely 100% fine. [2]
>>
>> While WARN will also crash the machine with panic_on_warn set, that's
>> exactly to be expected:
>>
>>      So we have two very different cases: the "virtual machine with good
>>      logging where a dead machine is fine" - use 'panic_on_warn'. And
>>      the actual real hardware with real drivers, running real loads by
>>      users. [4]
>>
>> The basic idea is that warnings will similarly get reported by users
>> and be found during testing. However, in contrast to a BUG(), there is a
>> way to actually influence the expected behavior (e.g., panic_on_warn)
>> and to eventually keep the machine alive to extract some debug info.
>>
>> Ingo notes that not all WARN_ON_ONCE cases need recovery. If we don't ever
>> expect this code to trigger in any case, recovery code is not really
>> helpful.
>>
>>      I'd prefer to keep all these warnings 'simple' - i.e. no attempted
>>      recovery & control flow, unless we ever expect these to trigger.
>>      [5]
>>
>> There have been different rules floating around that were never properly
>> documented. Let's try to clarify.
>>
>> [1] https://lkml.kernel.org/r/CAHk-=wiEAH+ojSpAgx_Ep=NKPWHU8AdO3V56BXcCsU97oYJ1EA@mail.gmail.com
>> [2] https://lore.kernel.org/r/CAHk-=wg40EAZofO16Eviaj7mfqDhZ2gVEbvfsMf6gYzspRjYvw@mail.gmail.com
>> [2] https://lkml.kernel.org/r/CAHk-=wit-DmhMfQErY29JSPjFgebx_Ld+pnerc4J2Ag990WwAA@mail.gmail.com
>> [4] https://lore.kernel.org/r/CAHk-=wgF7K2gSSpy=m_=K3Nov4zaceUX9puQf1TjkTJLA2XC_g@mail.gmail.com
>> [5] https://lore.kernel.org/r/YwIW+mVeZoTOxn%2F4@gmail.com
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> [...]
> 
>> +Use WARN_ON_ONCE() rather than WARN() or WARN_ON()
>> +**************************************************
>> +
>> +WARN_ON_ONCE() is generally preferred over WARN() or WARN_ON(), because it
>> +is common for a given warning condition, if it occurs at all, to occur
>> +multiple times. This can fill up and wrap the kernel log, and can even slow
>> +the system enough that the excessive logging turns into its own, additional
>> +problem.
> 
> FWIW I have had cases where WARN() messages caused a reboot, maybe
> mention that here? In my case the logging was so excessive that the
> watchdog wasn't updated and in the end the device was forcefully
> rebooted.
> 

That should be covered by the last part, no? What would be your suggestion?

-- 
Thanks,

David / dhildenb

