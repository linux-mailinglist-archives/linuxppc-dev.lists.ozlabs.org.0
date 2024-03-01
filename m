Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A722C86DE8C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Mar 2024 10:46:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ODPI0jj8;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ODPI0jj8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TmNWf1yTlz3vdK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Mar 2024 20:46:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ODPI0jj8;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ODPI0jj8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TmNVr5Qtbz3cPX
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Mar 2024 20:45:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709286319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4H0OYCm6hFlmx4RA0pYmYEJnMmqz3AUipl1jTzgwcLE=;
	b=ODPI0jj8X5QTlALNot1UxCuPRQMe+v5Fa1mZaqf4wLrrOfkzgCSUYnQ4tGfZdZx4KXvJYt
	zSaWF+3qXRDbPVAtgZmU8gwseT87xvVUmF58jzknT+NNMvOVou9Whkt9JMOXcPEFXt6FC0
	SVQOE/1mP5HsunBy9QgFvuu7UoMJVHg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709286319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4H0OYCm6hFlmx4RA0pYmYEJnMmqz3AUipl1jTzgwcLE=;
	b=ODPI0jj8X5QTlALNot1UxCuPRQMe+v5Fa1mZaqf4wLrrOfkzgCSUYnQ4tGfZdZx4KXvJYt
	zSaWF+3qXRDbPVAtgZmU8gwseT87xvVUmF58jzknT+NNMvOVou9Whkt9JMOXcPEFXt6FC0
	SVQOE/1mP5HsunBy9QgFvuu7UoMJVHg=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-567-Bu7Wl5O7Me2C8z3fD4sMNA-1; Fri, 01 Mar 2024 04:45:17 -0500
X-MC-Unique: Bu7Wl5O7Me2C8z3fD4sMNA-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-787f6208f7eso344855485a.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Mar 2024 01:45:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709286317; x=1709891117;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4H0OYCm6hFlmx4RA0pYmYEJnMmqz3AUipl1jTzgwcLE=;
        b=ege0JsXPHfVk7293fAwPRy7nAnIGSwQuGt0QL7GjjM37fJFAYumKacGapKzVj+8B6W
         Uq96aGcbOFGRNb4knoWFilEoEJx98njupoh5rMBLOlOcHB8rqxs1pZRnrBP9TxK0w9CN
         nTdCLFocPOinc+Utlijb6hwLWpQL0MRwCOdp7UQYY84RJjZzSVLK/VVufCiDRYYRNk2y
         U25IaceQGWNoLF2PsUgsGiY8QaXggkHkwoy9bWAomaPULcUOLbaRi3zxiTpNaMkZKimS
         ASl0F5vpdN+O0wicRgBHc4YU/Uf/obVQpP58q6LBTVp7iYqeF3Z8Bxs8pXwfRIdSGS3f
         62lw==
X-Forwarded-Encrypted: i=1; AJvYcCXyFbY59TKlc+n6CcN4wMZiZFEhYiH1p9XzVo3tzA8h2bmq+vtLlJgAeTTshKZyOAzJ3yb+n9vqCkxWEfmhcP29SFOBACC+YH/JYcuGOQ==
X-Gm-Message-State: AOJu0YzKpcGUt6o5N2/Da8ps0NBZzu33yQzfuztA4dwuhGpf1WtEUF4c
	+G+vk1TuSgJfUy0UOjA+UgY/Lz8lT8ZqkWGyRzonXGN6DmBDwdNLoSMBfCSay5OzbbgQIWckZr+
	Uios78+25fo7JGGY6jTJNxX3ssqPDkoiWxhg5iPNfBP4MPHe4PJCIVuJL2en+8EQ=
X-Received: by 2002:a05:620a:b1c:b0:787:a2d2:d59b with SMTP id t28-20020a05620a0b1c00b00787a2d2d59bmr1364786qkg.26.1709286317065;
        Fri, 01 Mar 2024 01:45:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3ZGmrG95zUVRhKvl+Z3Z4TCBmcrBRud34bZ7otTXr0OO1dnrorQHaOC3fDp3qa8laUrQPzw==
X-Received: by 2002:a05:620a:b1c:b0:787:a2d2:d59b with SMTP id t28-20020a05620a0b1c00b00787a2d2d59bmr1364774qkg.26.1709286316816;
        Fri, 01 Mar 2024 01:45:16 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-178-133.web.vodafone.de. [109.43.178.133])
        by smtp.gmail.com with ESMTPSA id g4-20020a05620a40c400b0078783b32229sm1491763qko.7.2024.03.01.01.45.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Mar 2024 01:45:16 -0800 (PST)
Message-ID: <f659964b-da95-4339-9d4f-c7b6a72fbac0@redhat.com>
Date: Fri, 1 Mar 2024 10:45:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH 03/32] powerpc: Fix stack backtrace
 termination
From: Thomas Huth <thuth@redhat.com>
To: Nicholas Piggin <npiggin@gmail.com>
References: <20240226101218.1472843-1-npiggin@gmail.com>
 <20240226101218.1472843-4-npiggin@gmail.com>
 <94491aab-b252-4590-b2a7-7a581297606f@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <94491aab-b252-4590-b2a7-7a581297606f@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 27/02/2024 09.50, Thomas Huth wrote:
> On 26/02/2024 11.11, Nicholas Piggin wrote:
>> The backtrace handler terminates when it sees a NULL caller address,
>> but the powerpc stack setup does not keep such a NULL caller frame
>> at the start of the stack.
>>
>> This happens to work on pseries because the memory at 0 is mapped and
>> it contains 0 at the location of the return address pointer if it
>> were a stack frame. But this is fragile, and does not work with powernv
>> where address 0 contains firmware instructions.
>>
>> Use the existing dummy frame on stack as the NULL caller, and create a
>> new frame on stack for the entry code.
>>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   powerpc/cstart64.S | 12 ++++++++++--
>>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> Thanks for tackling this! ... however, not doing powerpc work since years 
> anymore, I have some ignorant questions below...
> 
>> diff --git a/powerpc/cstart64.S b/powerpc/cstart64.S
>> index e18ae9a22..14ab0c6c8 100644
>> --- a/powerpc/cstart64.S
>> +++ b/powerpc/cstart64.S
>> @@ -46,8 +46,16 @@ start:
>>       add    r1, r1, r31
>>       add    r2, r2, r31
>> +    /* Zero backpointers in initial stack frame so backtrace() stops */
>> +    li    r0,0
>> +    std    r0,0(r1)
> 
> 0(r1) is the back chain pointer ...
> 
>> +    std    r0,16(r1)
> 
> ... but what is 16(r1) ? I suppose that should be the "LR save word" ? But 
> isn't that at 8(r1) instead?? (not sure whether I'm looking at the right ELF 
> abi spec right now...)

Ok, I was looking at the wrong ELF spec, indeed (it was an ancient 32-bit 
spec, not the 64-bit ABI). Sorry for the confusion. Having a proper #define 
or a comment for the 16 here would still be helpful, though.

  Thomas

