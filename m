Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C238BE156
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 13:45:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UfNPM0rF;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UfNPM0rF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VYc0r63Z6z3fSX
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 21:45:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UfNPM0rF;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UfNPM0rF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VYc0263GNz3dh2
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2024 21:45:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715082302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=IdjnCRPF6KIi2xa+JTCJU6XDqzu+qhgJ7js/LxEsyeI=;
	b=UfNPM0rF3JFYD3oiOApeDQclZgjXx6fOJO7Zga6udHNrujSGuhtHVr1vfZebmfd7epz274
	708bS+ufZZM9Y8yNWdkNchYA7ZF9LwDzlSfGt7AbTTMkeKmH0a1KGy09W7+DbtLaMphFhl
	uRB3o7R2fI9lpEm0RR7jbCa5pKqQ+Ls=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715082302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=IdjnCRPF6KIi2xa+JTCJU6XDqzu+qhgJ7js/LxEsyeI=;
	b=UfNPM0rF3JFYD3oiOApeDQclZgjXx6fOJO7Zga6udHNrujSGuhtHVr1vfZebmfd7epz274
	708bS+ufZZM9Y8yNWdkNchYA7ZF9LwDzlSfGt7AbTTMkeKmH0a1KGy09W7+DbtLaMphFhl
	uRB3o7R2fI9lpEm0RR7jbCa5pKqQ+Ls=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-580-guvCFxJTOriUnBjreKuZVQ-1; Tue, 07 May 2024 07:45:00 -0400
X-MC-Unique: guvCFxJTOriUnBjreKuZVQ-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6a0e8859d2bso42133396d6.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 May 2024 04:45:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715082300; x=1715687100;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IdjnCRPF6KIi2xa+JTCJU6XDqzu+qhgJ7js/LxEsyeI=;
        b=wO5wcAQ3YsT9/myw62cMjaEz1hL3LPNMK/U3AsxFSr95u2WiKhw8LOhSX40O7iWbeP
         xqOFHoJFBAFksGA5iQFE9VK7pHVJApL81dEumDJqEeJ+AtLusKvOjFCnWxTuLcyLDeHz
         pnTKT1opjANDu+PxPWfVgxtR8RdCAKes14hdgV/G9H+onv72r/g60UrzkKmyP644RpKf
         i8CHL5jxIbSGS0/WHDp9v/SwE343OMr1M9C9Vdbu6DHQEEUdsisC2yiZ+jyo2lHYwytr
         b8pB6d8PbPFTba7vie4GWtQcYAH2Ynrv3HXuOUVRb3/SpL7dLVYOLHl1yZEzrRkhYEqn
         rTjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEMfWLcY7w+uQj2ZoDtjiJWrEBrfYSVGJraeXXsmJ5soMGEw9XIocMbJYmTL1sROHZD2s4un6afvBSTv946odg+Q6J9VaIf31Xd/CyCA==
X-Gm-Message-State: AOJu0YwLcF/fx93BQFQaGyHnQYQD57nKDy44q0r1UJIt4NZaoSd6Qy4Y
	KkVJ5ye1+BsmODyOVG7SqU+VFS4pcioxmZJkQ8gRTG1CvBVgxcyJxeahUOXvVGZVHK6aRT/73qz
	yEjlJj0S7CeI7f4p/dYUVetRHandTfI1aGNhDtTNRYHQVBRnywCR4nbc3B6TYHyQ=
X-Received: by 2002:a05:6214:20cb:b0:6a0:cba9:374d with SMTP id 11-20020a05621420cb00b006a0cba9374dmr16882866qve.1.1715082300064;
        Tue, 07 May 2024 04:45:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFn5zp9cvKYCQsDht+IznsH9QjfYMruFo57MWUdiCANe/cc3LC8nZHXzUqWoY78m0wmvWw3qQ==
X-Received: by 2002:a05:6214:20cb:b0:6a0:cba9:374d with SMTP id 11-20020a05621420cb00b006a0cba9374dmr16882847qve.1.1715082299723;
        Tue, 07 May 2024 04:44:59 -0700 (PDT)
Received: from [192.168.0.9] (ip-109-40-241-109.web.vodafone.de. [109.40.241.109])
        by smtp.gmail.com with ESMTPSA id n14-20020ad444ae000000b006a0f057489fsm4611227qvt.125.2024.05.07.04.44.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 May 2024 04:44:59 -0700 (PDT)
Message-ID: <c16d6ebc-1e0e-4f56-929f-495cef708d27@redhat.com>
Date: Tue, 7 May 2024 13:44:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v9 03/31] powerpc: Mark known failing tests
 as kfail
To: Nicholas Piggin <npiggin@gmail.com>
References: <20240504122841.1177683-1-npiggin@gmail.com>
 <20240504122841.1177683-4-npiggin@gmail.com>
 <f2411fc8-5f90-4577-9599-f43bb8694cd0@redhat.com>
 <D1347PSKXAVS.2EMGLUQSZN8W4@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <D1347PSKXAVS.2EMGLUQSZN8W4@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 07/05/2024 06.07, Nicholas Piggin wrote:
> On Mon May 6, 2024 at 5:37 PM AEST, Thomas Huth wrote:
>> On 04/05/2024 14.28, Nicholas Piggin wrote:
>>> Mark the failing h_cede_tm and spapr_vpa tests as kfail.
>>>
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>> ---
>>>    powerpc/spapr_vpa.c | 3 ++-
>>>    powerpc/tm.c        | 3 ++-
>>>    2 files changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/powerpc/spapr_vpa.c b/powerpc/spapr_vpa.c
>>> index c2075e157..46fa0485c 100644
>>> --- a/powerpc/spapr_vpa.c
>>> +++ b/powerpc/spapr_vpa.c
>>> @@ -150,7 +150,8 @@ static void test_vpa(void)
>>>    		report_fail("Could not deregister after registration");
>>>    
>>>    	disp_count1 = be32_to_cpu(vpa->vp_dispatch_count);
>>> -	report(disp_count1 % 2 == 1, "Dispatch count is odd after deregister");
>>> +	/* TCG known fail, could be wrong test, must verify against PowerVM */
>>> +	report_kfail(true, disp_count1 % 2 == 1, "Dispatch count is odd after deregister");
>>
>> Using "true" as first argument looks rather pointless - then you could also
>> simply delete the test completely if it can never be tested reliably.
>>
>> Thus could you please introduce a helper function is_tcg() that could be
>> used to check whether we run under TCG (and not KVM)? I think you could
>> check for "linux,kvm" in the "compatible" property in /hypervisor in the
>> device tree to see whether we're running in KVM mode or in TCG mode.
> 
> This I added in patch 30.
> 
> The reason for the suboptimal patch ordering was just me being lazy and
> avoiding rebasing annoyance. I'd written a bunch of failing test cases
> for QEMU work, but hadn't done the kvm/tcg test yet. It had a few
> conflicts so I put it at the end... can rebase if you'd really prefer.

Ah, ok, no need to rebase then, as long it's there in the end, it's fine.

  Thanks,
   Thomas

