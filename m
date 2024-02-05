Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EA48498D5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Feb 2024 12:29:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=frWlSQHh;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=frWlSQHh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TT40b28cCz3btJ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Feb 2024 22:29:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=frWlSQHh;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=frWlSQHh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TT3zn2vD9z2xdn
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Feb 2024 22:28:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707132527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=nUaMZZu+Dp9dwRrEKB8bV8ysB1e4sCJY0FwagGA5ceE=;
	b=frWlSQHhUaIrxA4ECNnKETP3hwojUlGTqcXbrTi/xW2BejpbPE/mZE3CAQhZ2yO3b404j7
	OatKDvfPpv5Ht1wApKPuw1/mnOxR/Egc66+ZkfGC4cCtT6HuBHIbKvj3P3B8UGesKYVGXw
	hD5sEj4ht1MXwfWlvrVwcIlIjpVELoI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707132527;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=nUaMZZu+Dp9dwRrEKB8bV8ysB1e4sCJY0FwagGA5ceE=;
	b=frWlSQHhUaIrxA4ECNnKETP3hwojUlGTqcXbrTi/xW2BejpbPE/mZE3CAQhZ2yO3b404j7
	OatKDvfPpv5Ht1wApKPuw1/mnOxR/Egc66+ZkfGC4cCtT6HuBHIbKvj3P3B8UGesKYVGXw
	hD5sEj4ht1MXwfWlvrVwcIlIjpVELoI=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-hwT7wDAdOkuPndUDRDHSNA-1; Mon, 05 Feb 2024 06:28:45 -0500
X-MC-Unique: hwT7wDAdOkuPndUDRDHSNA-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-68c4f138403so54728276d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Feb 2024 03:28:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707132525; x=1707737325;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nUaMZZu+Dp9dwRrEKB8bV8ysB1e4sCJY0FwagGA5ceE=;
        b=JACxbPjCWhmQR4Qd2UT5Voc9Hodg9cc9Jyvqwd5asnbeP/e/HT+v0uV/VvGHAAq1ZI
         SE3FT06jB0jTiHcwWuhq0MP2TGka+Eci0B06s+8XglKgOgTG1tsaWsNs9dytr+JUVEuX
         msDDsQTCmpS95ELa2KP87kyxQqrkKgzfQ2HpayhLa1jaMLYWKF6mg4GXsnHe4H5dD+pe
         GwbeYSpV6V+8oSZjOm4MDNyMZQvdzMv1lr3a4LmbYZFlzm6slK9MNoBfOo8QdeJLTmT+
         x+7FmJeBVRfLcHZ/ngxJJ+m4WwemWiPMvw4A91XzXLP2D+WMdTk1CSt31H4cQo3a0ZO9
         OC6Q==
X-Gm-Message-State: AOJu0YzL/nzRbo0Z09ObhnJe74oLT13QV6jmnnJRy+Znz42vVuqEszDG
	MPJMsW8HAkjCxXrAaxdCaO8YAy45CQUeFSl8aGk0+oxcSqn13TVbj6nmK+lPlQ62YuGVkFQmqsl
	732+KCnUfP5v5ARDQNLMKKWKPXkJpXQ96ED73xSrqqBrYqHdFX3BTdvNPxDPu4F8=
X-Received: by 2002:a05:6214:1bca:b0:68c:5aec:a777 with SMTP id m10-20020a0562141bca00b0068c5aeca777mr10444487qvc.15.1707132525336;
        Mon, 05 Feb 2024 03:28:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8EaWM4B1y1ZetAAd55Aml2aHxbapztaFPxB73e0x4SKOBYmOWyWuKnTkcVyTF/NaB0tj2yA==
X-Received: by 2002:a05:6214:1bca:b0:68c:5aec:a777 with SMTP id m10-20020a0562141bca00b0068c5aeca777mr10444456qvc.15.1707132525076;
        Mon, 05 Feb 2024 03:28:45 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXWPIeAmM4zXqyigLA0WaHjYvNc0iltB6bnBBy8QYvhZLHNBXkjYjHaucBRdJYPH0szT+kDLlvclxWkY5zxZP8lUzEhIXYmjGPkzkA3KlO3Qa2uRQXc9nXwApYOePPqxPh993CX+Ykh5jamYbUskGrr02J+wyVcxl+9yb35OMqMi48kHAZwZg/zppBC1scp8eyLC2fKAfLNawWG2xo2EawCIJYSrvkvLjxiVxsXNPOaclgOUBS2Qog+pId8rXLYpWHB/fFohXulmw0J7f8DgDSfPwPFRsOMVxURBnWOEI/X6tZAL8cEaDB2EZWPlvaEINY5yy9woLltLnE7jzYIZZGeRsspWNDvJgBPDqwzOYxDi3TAFncm1h9WOVQaLnZ8ZjiLaU40OkuC4ZMzb0k4f2AVGD5RBXnICUYtufL9szNSrdRZocVbgybUdJqs2dg617ubop/j5uGuX1VCXNWQ1YgZ2Su7HbPkAQ/hZidUC3/U
Received: from [192.168.0.9] (ip-109-43-177-196.web.vodafone.de. [109.43.177.196])
        by smtp.gmail.com with ESMTPSA id nz10-20020a0562143a8a00b0068c7664112bsm3658473qvb.52.2024.02.05.03.28.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Feb 2024 03:28:44 -0800 (PST)
Message-ID: <003f43ab-cce9-408d-8354-b7884f513ad1@redhat.com>
Date: Mon, 5 Feb 2024 12:28:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v2 1/9] (arm|powerpc|s390x): Makefile: Fix
 .aux.o generation
To: Andrew Jones <andrew.jones@linux.dev>, Nicholas Piggin <npiggin@gmail.com>
References: <20240202065740.68643-1-npiggin@gmail.com>
 <20240202065740.68643-2-npiggin@gmail.com>
 <20240202-2f93f59553cec386791f7629@orel>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240202-2f93f59553cec386791f7629@orel>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Eric Auger <eric.auger@redhat.com>, Marc Hartmayer <mhartmay@linux.ibm.com>, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 02/02/2024 10.30, Andrew Jones wrote:
> On Fri, Feb 02, 2024 at 04:57:32PM +1000, Nicholas Piggin wrote:
>> Using all prerequisites for the source file results in the build
>> dying on the second time around with:
>>
>> gcc: fatal error: cannot specify ‘-o’ with ‘-c’, ‘-S’ or ‘-E’ with multiple files
>>
>> This is due to auxinfo.h becoming a prerequisite after the first
>> build recorded the dependency.

D'oh, of course I only tried to run "make" once when testing that patch :-/

>> diff --git a/arm/Makefile.common b/arm/Makefile.common
>> index 54cb4a63..c2ee568c 100644
>> --- a/arm/Makefile.common
>> +++ b/arm/Makefile.common
>> @@ -71,7 +71,7 @@ FLATLIBS = $(libcflat) $(LIBFDT_archive) $(libeabi)
>>   
>>   ifeq ($(CONFIG_EFI),y)
>>   %.aux.o: $(SRCDIR)/lib/auxinfo.c
>> -	$(CC) $(CFLAGS) -c -o $@ $^ \
>> +	$(CC) $(CFLAGS) -c -o $@ $< \
>>   		-DPROGNAME=\"$(@:.aux.o=.efi)\" -DAUXFLAGS=$(AUXFLAGS)
> 
> There are two instances of the %.aux.o target in arm/Makefile.common. We
> need to fix both. We can actually pull the target out of the two arms of
> the CONFIG_EFI if-else, though, by changing the .efi/.flat to .$(exe).

I went ahead and pushed this patch with the trivial fix for the else-branch 
to the repo to unbreak the build. If you think it's worthwhile to unify the 
target, please provide a patch to do so, thanks!

  Thomas

