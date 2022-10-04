Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 709CD5F42F6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 14:33:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MhcZM17Kgz3c6r
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 23:33:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Bj3j42Z1;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Bj3j42Z1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Bj3j42Z1;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Bj3j42Z1;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MhcYM301Qz2xf6
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Oct 2022 23:32:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664886769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ARqzLCUGK9oxipjgV/TP0dhqnyFoncnYQ36iiV2KnPc=;
	b=Bj3j42Z1UFJxAf6YnYiq7NJ3NO9F4UlDsMIq/7WYaWkpoVrynneqQ4mr6cmd8P35wooo+5
	YZikVsJClDnsIlB4/Pq/SufLkKeAPtSRu2ZnjjVHRF5aQOrXEaeBt1id4GngKaVoV67Uyk
	y+uh0YZd8vEipXD3A8r7trk4I9m0sI4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664886769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ARqzLCUGK9oxipjgV/TP0dhqnyFoncnYQ36iiV2KnPc=;
	b=Bj3j42Z1UFJxAf6YnYiq7NJ3NO9F4UlDsMIq/7WYaWkpoVrynneqQ4mr6cmd8P35wooo+5
	YZikVsJClDnsIlB4/Pq/SufLkKeAPtSRu2ZnjjVHRF5aQOrXEaeBt1id4GngKaVoV67Uyk
	y+uh0YZd8vEipXD3A8r7trk4I9m0sI4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-386-cj78BLwhOUqnyypANZd_6w-1; Tue, 04 Oct 2022 08:32:48 -0400
X-MC-Unique: cj78BLwhOUqnyypANZd_6w-1
Received: by mail-wm1-f69.google.com with SMTP id c2-20020a1c3502000000b003b535aacc0bso10827567wma.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Oct 2022 05:32:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=ARqzLCUGK9oxipjgV/TP0dhqnyFoncnYQ36iiV2KnPc=;
        b=u35T5/vuliGC+cEzM7n67cck8m1BN4JmYrMCnK3zD1L6tAlT+VXWE5W/VLiasaOFux
         dWFSF4sx2mMkkpftC4VuWPfZbonaRQCKtzcPFgnkVf1y0YoLS9SoGYAGl/lO1EaatNrZ
         Os/nBcSqMGHn0pUVsUtjqbtLm3JgAmPrQR+MtHFa2HXUwzKD2xpxlCJrvHKsJjFxqv4f
         vOGO0TTMfq7kkrFVCEjAgXxfiZ/10XOgTeB7XfJ1XBfix1YnhLMcP1xJFFsWDkSS+4Lh
         0m88wNVQ0ua1SEwbLkeL5XAIXR/m7exQzZT3n6VzteJdX7YBVVvV5hhbtjFNRfgGGMV2
         BTdA==
X-Gm-Message-State: ACrzQf1aUtLfHpKQu2mH7aQfhuvGlYjQaETUUQ4W3YLMY9xeHxCw1OEV
	MMALxtSDK6Cgq2yOtpS+2PhiV9ZXVqJ7zjCeLxmQH71qqBBaaH497SJoKBHJMSwDekkK2Y5oCD8
	xBxSV6I5dingvRubElXGG7w6Tvw==
X-Received: by 2002:adf:fb84:0:b0:21a:10f2:1661 with SMTP id a4-20020adffb84000000b0021a10f21661mr15777341wrr.2.1664886767405;
        Tue, 04 Oct 2022 05:32:47 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4xqePutEPB3BXlHEVeHUD3E+8ExIhv/azDcUvIYjAckd2CXwfmrDfdmGjPdpAJS/YBJHMgGg==
X-Received: by 2002:adf:fb84:0:b0:21a:10f2:1661 with SMTP id a4-20020adffb84000000b0021a10f21661mr15777319wrr.2.1664886767130;
        Tue, 04 Oct 2022 05:32:47 -0700 (PDT)
Received: from ?IPV6:2003:cb:c706:5000:4fff:1dd6:7868:a36? (p200300cbc70650004fff1dd678680a36.dip0.t-ipconnect.de. [2003:cb:c706:5000:4fff:1dd6:7868:a36])
        by smtp.gmail.com with ESMTPSA id k5-20020adff5c5000000b0022afbd02c69sm10360655wrp.56.2022.10.04.05.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Oct 2022 05:32:46 -0700 (PDT)
Message-ID: <31f20ddf-cd41-69b5-2875-2d738b166ae2@redhat.com>
Date: Tue, 4 Oct 2022 14:32:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v1 1/3] coding-style.rst: document BUG() and WARN() rules
 ("do not crash the kernel")
To: Kalle Valo <kvalo@kernel.org>
References: <20220920122302.99195-1-david@redhat.com>
 <20220920122302.99195-2-david@redhat.com> <87pmfp8hnj.fsf@kernel.org>
 <d1ceedca-b28e-c47e-aa0d-aa1cb36d12b9@redhat.com> <87leq64m20.fsf@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <87leq64m20.fsf@kernel.org>
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

On 26.09.22 09:44, Kalle Valo wrote:
> David Hildenbrand <david@redhat.com> writes:
> 
>>>> +Use WARN_ON_ONCE() rather than WARN() or WARN_ON()
>>>> +**************************************************
>>>> +
>>>> +WARN_ON_ONCE() is generally preferred over WARN() or WARN_ON(), because it
>>>> +is common for a given warning condition, if it occurs at all, to occur
>>>> +multiple times. This can fill up and wrap the kernel log, and can even slow
>>>> +the system enough that the excessive logging turns into its own, additional
>>>> +problem.
>>>
>>> FWIW I have had cases where WARN() messages caused a reboot, maybe
>>> mention that here? In my case the logging was so excessive that the
>>> watchdog wasn't updated and in the end the device was forcefully
>>> rebooted.
>>>
>>
>> That should be covered by the last part, no? What would be your suggestion?
> 
> I was just thinking that maybe make it more obvious that even WARN_ON()
> can crash the system, something along these lines:
> 
> "..., additional problem like stalling the system so much that it causes
> a reboot."

Hi Kalle,

sorry for the late reply. Jonathan already queued v2 and sent it upstream.

I think that's it is already covered by the statement and that the 
additional example isn't required -- most of us learned the hard way 
that "excessive logging turns into its own problem" includes all weird 
kinds of kernel crashes. A panic/reboot due to a watchdog not firing is 
one such possible outcome.

Thanks!

-- 
Thanks,

David / dhildenb

