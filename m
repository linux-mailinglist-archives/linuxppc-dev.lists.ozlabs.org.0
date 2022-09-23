Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF515E78D7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 12:56:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYpww2JJKz3cBh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 20:56:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UEwLxXK/;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UEwLxXK/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UEwLxXK/;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UEwLxXK/;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYpwD1BBJz3bcc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 20:55:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663930534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eef54XeIfI5ePPfdQCCa+xwkgeOXOv7/COauKA6kwwQ=;
	b=UEwLxXK/DcqRGm/I3a1xLTR3BJ660LIWxR4D405iMewcQGAwfZ45M9XLPYJNUuQFe7jkXo
	a3eShBkOPF/MUW7bcMGuLN8FD9AMooOwROydmGKY+AFXQSL+96VS/8rwqqucURsDnOj9XU
	SyHITg6YpfyjPeHz++PTg+Bo3q2LLXc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1663930534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eef54XeIfI5ePPfdQCCa+xwkgeOXOv7/COauKA6kwwQ=;
	b=UEwLxXK/DcqRGm/I3a1xLTR3BJ660LIWxR4D405iMewcQGAwfZ45M9XLPYJNUuQFe7jkXo
	a3eShBkOPF/MUW7bcMGuLN8FD9AMooOwROydmGKY+AFXQSL+96VS/8rwqqucURsDnOj9XU
	SyHITg6YpfyjPeHz++PTg+Bo3q2LLXc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-523-l39HgEGKMHmL39-2x41VWw-1; Fri, 23 Sep 2022 06:55:32 -0400
X-MC-Unique: l39HgEGKMHmL39-2x41VWw-1
Received: by mail-wr1-f69.google.com with SMTP id d9-20020adfa349000000b0022ad6fb2845so3867999wrb.17
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 03:55:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=eef54XeIfI5ePPfdQCCa+xwkgeOXOv7/COauKA6kwwQ=;
        b=nYulwtepzw2w6NNZodQe5Hti3tXcw9VMC6/Hg8RbyM+zDTEcfGaIlt1POwVKJAdq/D
         n7rIknrmQtqtcYl+6cM6hIsd27EBWb/sUF1i6b7CdQ6bopz3ggNnYEKzU7cDfdG09Ofr
         TtFA17jAt6Nz37bWKUeqork16vi31FyCfRsZAbdNIxXK2KZ2X5b4V8Mgg1Asov3kN8HZ
         9K5qXJPr2RVmuWfI58ovjnTo3pxERys+qv4n/NCKRt5YzTTR0a6AzkHV1TUtSaJpP6n9
         6f85EuXlvvUKyB9KD+PC4pW2kW9873E1NNyhnQWj6HS5i1O5zvMYtacNrcHUCpNTWknm
         4TMQ==
X-Gm-Message-State: ACrzQf3pUjZ3rT3bkbjOvoCETo0UScuMvX7c5p5FlNNNQaP7t4dTBbYw
	ykR55KYeaeYAT7QIwAZAzWlt5j+x+nFs/uAzDCMRjATo9jJhpuuGLNxK0a73L/wPb0sJxlCet6G
	V1mXiuPKNVQOZ1I22vTI4fT07vA==
X-Received: by 2002:adf:de01:0:b0:228:62ae:78bc with SMTP id b1-20020adfde01000000b0022862ae78bcmr4702233wrm.41.1663930531852;
        Fri, 23 Sep 2022 03:55:31 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4kdGvtbB82mE3J4eOPvIcDO2feso4JPy2pwAaShDx+NaqgW7GNPKE3hF5xRI57FveqzL+0bQ==
X-Received: by 2002:adf:de01:0:b0:228:62ae:78bc with SMTP id b1-20020adfde01000000b0022862ae78bcmr4702188wrm.41.1663930531409;
        Fri, 23 Sep 2022 03:55:31 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:cc00:4585:a83b:64f2:ad21? (p200300cbc704cc004585a83b64f2ad21.dip0.t-ipconnect.de. [2003:cb:c704:cc00:4585:a83b:64f2:ad21])
        by smtp.gmail.com with ESMTPSA id d10-20020a056000114a00b002250c35826dsm7067750wrx.104.2022.09.23.03.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 03:55:30 -0700 (PDT)
Message-ID: <3108be4e-319d-3444-308d-ca60729ea502@redhat.com>
Date: Fri, 23 Sep 2022 12:55:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v1 1/3] coding-style.rst: document BUG() and WARN() rules
 ("do not crash the kernel")
To: John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org
References: <20220920122302.99195-1-david@redhat.com>
 <20220920122302.99195-2-david@redhat.com>
 <3dcbcc7b-9ca0-1465-5a73-075a1c151331@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <3dcbcc7b-9ca0-1465-5a73-075a1c151331@nvidia.com>
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
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Baoquan He <bhe@redhat.com>, linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Dave Young <dyoung@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Nicholas Piggin <npiggin@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>, linux-mm@kvack.org, David Laight <David.Laight@ACULAB.COM>, Dwaipayan Ray <dwaipayanray1@gmail.com>, Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@kernel.org>, Vivek Goyal <vgoyal@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 23.09.22 04:26, John Hubbard wrote:
> On 9/20/22 05:23, David Hildenbrand wrote:
>> [1] https://lkml.kernel.org/r/CAHk-=wiEAH+ojSpAgx_Ep=NKPWHU8AdO3V56BXcCsU97oYJ1EA@mail.gmail.com
>> [2] https://lore.kernel.org/r/CAHk-=wg40EAZofO16Eviaj7mfqDhZ2gVEbvfsMf6gYzspRjYvw@mail.gmail.com
>> [2] https://lkml.kernel.org/r/CAHk-=wit-DmhMfQErY29JSPjFgebx_Ld+pnerc4J2Ag990WwAA@mail.gmail.com
> 
> s/2/3/

Thanks!

> 
> ...
>> diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
>> index 03eb53fd029a..e05899cbfd49 100644
>> --- a/Documentation/process/coding-style.rst
>> +++ b/Documentation/process/coding-style.rst
>> @@ -1186,6 +1186,67 @@ expression used.  For instance:
>>   	#endif /* CONFIG_SOMETHING */
>>   
>>   
>> +22) Do not crash the kernel
>> +---------------------------
>> +
>> +In general, it is not the kernel developer's decision to crash the kernel.
> 
> What do you think of this alternate wording:
> 
> In general, the decision to crash the kernel belongs to the user, rather
> than to the kernel developer.

Ack

[...]

> I like the wording, it feels familiar somehow! :)

:)

> 
> Reviewed-by: John Hubbard <jhubbard@nvidia.com>

Thanks!

-- 
Thanks,

David / dhildenb

