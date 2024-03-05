Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADC08715C2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 07:19:28 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ByJXZJbv;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ByJXZJbv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpllL3BlTz3dVH
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 17:19:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ByJXZJbv;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ByJXZJbv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TplkZ12B3z3bZ6
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 17:18:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709619520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pcar2p6s3XrNXLPqtltxkPso06L+KAfnP6O+e52AU68=;
	b=ByJXZJbveeTmZNVfQHBTwDMl6XqrhiqXijhnFO/pLeI7dQKHsg8hXgynDuIDCdH+tCj7FT
	fYP5lmQrEB8dV701h5Cd9xshjvY2ZcNRoDZqsTw3i9aTTDh/IX+eOLS47Fx9JMKij7s2gv
	a0/y2vLEWDp7SHhcEIHn2ua1pbmK+Cc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709619520;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pcar2p6s3XrNXLPqtltxkPso06L+KAfnP6O+e52AU68=;
	b=ByJXZJbveeTmZNVfQHBTwDMl6XqrhiqXijhnFO/pLeI7dQKHsg8hXgynDuIDCdH+tCj7FT
	fYP5lmQrEB8dV701h5Cd9xshjvY2ZcNRoDZqsTw3i9aTTDh/IX+eOLS47Fx9JMKij7s2gv
	a0/y2vLEWDp7SHhcEIHn2ua1pbmK+Cc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-m4SzUAH9P5aKIQ53LlvcVg-1; Tue, 05 Mar 2024 01:18:38 -0500
X-MC-Unique: m4SzUAH9P5aKIQ53LlvcVg-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a447baf1eb0so221820566b.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Mar 2024 22:18:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709619517; x=1710224317;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pcar2p6s3XrNXLPqtltxkPso06L+KAfnP6O+e52AU68=;
        b=iW0PLvtZI4v+qNqSjfaN+gW5ih+PelYZsL2uy5KqU2ni8t6QaFjvlGKe7NFJZGWsM3
         ij++9nG2b431G55pxhbx6Jpdy1wy/b6PG+XKVCln25zli1owCh6tv1ZXJUAfLCrJwg47
         8xZgu5fKc2NYQppqLM5BIj7+pvKrm95dUSRk91Nd1j2qM7CHS+xm5ETErqbhPQc32+wA
         ttHY6nUwPOZ3pcOVm9VI0uq2VYh4oMj8jaqI+TBMqoCtSwE3obaLt5nuxJLp0FY4jLTb
         gONt0A2FIW7ZrwuPvxAKXTr3DlzsVPlbuNMcHyK73jf2Im9rnR5xJ582ROMezcxHehQm
         p5AA==
X-Forwarded-Encrypted: i=1; AJvYcCX9XmKFhE/6QSjBeBYUy6JGMUWaD91rdXbgSW+PO1HpXQNSsJBWdc0StTlaKtWls12kdMop3ypJpkhVtrR/gN/QTQpsqz/Qtf34x3TAeA==
X-Gm-Message-State: AOJu0YzT3XpMusR3dTQsBzESyWvA9Jer6cWUt1+HhYgKnLjZLEBKjut4
	548KPmCOtUdGliA6XCv8fAdOkZfCrm2gH7nUoD3vfrbtIM6lj/P1UF3y5VCV87nwnTYg7QVtP/Q
	OeTzOJvlL++e7PLyBp2lgJ8QmT6xq6JqkXH/WwKMRDtc1IEswJsGxaaf4OHEm97w=
X-Received: by 2002:a17:906:f9cd:b0:a45:3759:ffb8 with SMTP id lj13-20020a170906f9cd00b00a453759ffb8mr3113153ejb.61.1709619517170;
        Mon, 04 Mar 2024 22:18:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEQt1ZcIkbKaeEQzPnba6flgCaowRaPPx8ACJbaWQaxJsrim4BdI92+gX6/aSmC/7vxcRY4Q==
X-Received: by 2002:a17:906:f9cd:b0:a45:3759:ffb8 with SMTP id lj13-20020a170906f9cd00b00a453759ffb8mr3113139ejb.61.1709619516747;
        Mon, 04 Mar 2024 22:18:36 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-178-243.web.vodafone.de. [109.43.178.243])
        by smtp.gmail.com with ESMTPSA id cm26-20020a170906f59a00b00a3ca56e9bcfsm5691745ejd.187.2024.03.04.22.18.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 22:18:36 -0800 (PST)
Message-ID: <e8d9cebe-71ce-4943-92a7-8bde1b7f40d9@redhat.com>
Date: Tue, 5 Mar 2024 07:18:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH 14/32] powerpc: general interrupt tests
To: Nicholas Piggin <npiggin@gmail.com>,
 Andrew Jones <ajones@ventanamicro.com>
References: <20240226101218.1472843-1-npiggin@gmail.com>
 <20240226101218.1472843-15-npiggin@gmail.com>
 <1b89e399-1160-4fca-a9d7-89d60fc9a710@redhat.com>
 <20240301-65a02dd1ea0bc25377fb248f@orel> <CZLGOZZBFIS3.1ZVPJ6AKUMP3A@wheely>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <CZLGOZZBFIS3.1ZVPJ6AKUMP3A@wheely>
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>, Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 05/03/2024 03.30, Nicholas Piggin wrote:
> On Fri Mar 1, 2024 at 11:45 PM AEST, Andrew Jones wrote:
>> On Fri, Mar 01, 2024 at 01:41:22PM +0100, Thomas Huth wrote:
>>> On 26/02/2024 11.12, Nicholas Piggin wrote:
>>>> Add basic testing of various kinds of interrupts, machine check,
>>>> page fault, illegal, decrementer, trace, syscall, etc.
>>>>
>>>> This has a known failure on QEMU TCG pseries machines where MSR[ME]
>>>> can be incorrectly set to 0.
>>>
>>> Two questions out of curiosity:
>>>
>>> Any chance that this could be fixed easily in QEMU?
>>>
>>> Or is there a way to detect TCG from within the test? (for example, we have
>>> a host_is_tcg() function for s390x so we can e.g. use report_xfail() for
>>> tests that are known to fail on TCG there)
>>
>> If there's nothing better, then it should be possible to check the
>> QEMU_ACCEL environment variable which will be there with the default
>> environ.
>>
>>>
>>>> @@ -0,0 +1,415 @@
>>>> +/*
>>>> + * Test interrupts
>>>> + *
>>>> + * Copyright 2024 Nicholas Piggin, IBM Corp.
>>>> + *
>>>> + * This work is licensed under the terms of the GNU LGPL, version 2.
>>>
>>> I know, we're using this line in a lot of source files ... but maybe we
>>> should do better for new files at least: "LGPL, version 2" is a little bit
>>> ambiguous: Does it mean the "Library GPL version 2.0" or the "Lesser GPL
>>> version 2.1"? Maybe you could clarify by additionally providing a SPDX
>>> identifier here, or by explicitly writing 2.0 or 2.1.
>>
>> Let's only add SPDX identifiers to new files.
> 
> +1
> 
> Speaking of which, a bunch of these just got inherited from the file
> that was copied to begin with (I tried not to remove copyright
> notices unless there was really nothing of the original remaining).
> So for new code/files, is there any particular preference for the
> license to use? I don't much mind between the *GPL*. Looks like almost
> all the SPDX code use GPL 2.0 only, but that could be just from
> coming from Linux. I might just go with that.

k-u-t were originally licensed under the LGPL, but in the course of time, 
code has been copied from the Linux kernel here and there, so we updated the 
license to GPL 2.
So yes, for code that might have been copied from the kernel, we have to use 
GPL 2. For other code, it's up to the author to chose. (IIRC we once 
discussed that LGPL would be nice for the files in the lib/ directory, while 
GPL is fine for the other folders, but my memory might fail here and it was 
never written in stone anyway)

  Thomas


