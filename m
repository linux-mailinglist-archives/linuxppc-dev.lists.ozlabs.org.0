Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFA08A6584
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 09:56:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WrDngP1f;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WrDngP1f;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJbvk1nYmz3vXP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 17:56:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WrDngP1f;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WrDngP1f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJbtx6XsTz2yt0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Apr 2024 17:55:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713254135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=S89tFe+K1CTG5fRksbFWnV+2+q7XeAKEw6AmjhBVsSc=;
	b=WrDngP1fQP4yzFLYr9bwaBN0fwrWqXkSEMOSnaN3mcrpgJ3tAeP4+nFS/FWwYolZmRpQ8W
	Nyhd91B8N41ZALTRZUIVWWKV+QDDq6+eC3KMKQj2+z+lvewi+9DFosoYjuiD5c/8gSlffj
	ImR+n4sIs16OVDV67Dmx9sO3hMXVdYo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713254135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=S89tFe+K1CTG5fRksbFWnV+2+q7XeAKEw6AmjhBVsSc=;
	b=WrDngP1fQP4yzFLYr9bwaBN0fwrWqXkSEMOSnaN3mcrpgJ3tAeP4+nFS/FWwYolZmRpQ8W
	Nyhd91B8N41ZALTRZUIVWWKV+QDDq6+eC3KMKQj2+z+lvewi+9DFosoYjuiD5c/8gSlffj
	ImR+n4sIs16OVDV67Dmx9sO3hMXVdYo=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-qD8n9ZdCMxaaVQNhtsZiww-1; Tue, 16 Apr 2024 03:55:32 -0400
X-MC-Unique: qD8n9ZdCMxaaVQNhtsZiww-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-56c3dc8d331so3191408a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Apr 2024 00:55:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713254131; x=1713858931;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S89tFe+K1CTG5fRksbFWnV+2+q7XeAKEw6AmjhBVsSc=;
        b=UASmxOFAGkyw/SdqGweiH3PK6TnD8l69U1Jdj79dzsoXwoe9akHOFwf9E3f0Hc6uVP
         BdtJP54A8HVeUQSkI7Iq/PSJuVAnqILTGO1lOOJPLFf7eIgW+nxuWnwsaCDWf1lXXWXK
         /h4E45/AJKIs6c/PlvVHn0EuHVVsV8b1kXRPYkLqfXl/XlkmZ6hA9HoWrkqoyNGUNz4Z
         b0lioUodu1cm+2mGooMh+NjNMBFI74vwIQ/91lHj944o/mTzZ5WqC87hYK/BMzicWgqf
         NOxGhOFr3kFj19epRqWThB3LonvnGQjQ4DxYAK4HPhjtYWAQjWemarbk9WhEfrZeR6CU
         LIXA==
X-Forwarded-Encrypted: i=1; AJvYcCUeVrmFCKDpeAEsP6EVeA/HAN/zU6lR8+HATRxY/n4MIsS9FMiq8BOkwjX/uRcBNOVh7OSyLtB3GGS+l+NLpy7KkFOkaI6+kAQD74bFiA==
X-Gm-Message-State: AOJu0YxJO51gHaA6JZOFd7j9iA16lXw1ApdEK7QtBrlGnrnw58NthC6a
	S3oq2fe1T0fe8hlHQCIHBzmOkfY/e5NX1tyT5Od45xSDEZcslCNVaQiDKI+oL1S2IgmO014iPU+
	M+o+KWHldfVlPMasrRdP/HEb3HKcpEkaE023tFrYwx2fZnRPJMm/42OECsguZx+Y=
X-Received: by 2002:a50:cc93:0:b0:56e:2332:c282 with SMTP id q19-20020a50cc93000000b0056e2332c282mr8622366edi.14.1713254131175;
        Tue, 16 Apr 2024 00:55:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHa0DXBEypul5UW11czuB/NKkbvt2k8AR7/Ww+kWF1gtW3L+HGVsO/bppG6FTx1l7Vk2upgdw==
X-Received: by 2002:a50:cc93:0:b0:56e:2332:c282 with SMTP id q19-20020a50cc93000000b0056e2332c282mr8622350edi.14.1713254130805;
        Tue, 16 Apr 2024 00:55:30 -0700 (PDT)
Received: from [192.168.0.9] (ip-109-43-179-50.web.vodafone.de. [109.43.179.50])
        by smtp.gmail.com with ESMTPSA id p8-20020a05640210c800b005704825e8c3sm200778edu.27.2024.04.16.00.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Apr 2024 00:55:30 -0700 (PDT)
Message-ID: <56b4514b-e873-4509-89f3-fb6d96ff1274@redhat.com>
Date: Tue, 16 Apr 2024 09:55:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v8 06/35] gitlab-ci: Run migration selftest
 on s390x and powerpc
From: Thomas Huth <thuth@redhat.com>
To: Nico Boehr <nrb@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
References: <20240405083539.374995-1-npiggin@gmail.com>
 <20240405083539.374995-7-npiggin@gmail.com>
 <171259239221.48513.3205716585028068515@t14-nrb>
 <e6c452bd-9101-40b7-ae3b-02400fed9e42@redhat.com>
 <bc91c2e1-6099-46c5-bbca-18bb7adb82d2@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <bc91c2e1-6099-46c5-bbca-18bb7adb82d2@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 16/04/2024 09.18, Thomas Huth wrote:
> On 11/04/2024 21.22, Thomas Huth wrote:
>> On 08/04/2024 18.06, Nico Boehr wrote:
>>> Quoting Nicholas Piggin (2024-04-05 10:35:07)
>>>> The migration harness is complicated and easy to break so CI will
>>>> be helpful.
>>>>
>>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>>> ---
>>>>   .gitlab-ci.yml      | 32 +++++++++++++++++++++++---------
>>>>   s390x/unittests.cfg |  8 ++++++++
>>>>   2 files changed, 31 insertions(+), 9 deletions(-)
>>>>
>>>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>>>> index ff34b1f50..60b3cdfd2 100644
>>>> --- a/.gitlab-ci.yml
>>>> +++ b/.gitlab-ci.yml
>>> [...]
>>>> @@ -135,7 +147,7 @@ build-riscv64:
>>>>   build-s390x:
>>>>    extends: .outoftree_template
>>>>    script:
>>>> - - dnf install -y qemu-system-s390x gcc-s390x-linux-gnu
>>>> + - dnf install -y qemu-system-s390x gcc-s390x-linux-gnu nmap-ncat
>>>>    - mkdir build
>>>>    - cd build
>>>>    - ../configure --arch=s390x --cross-prefix=s390x-linux-gnu-
>>>> @@ -161,6 +173,8 @@ build-s390x:
>>>>         sclp-1g
>>>>         sclp-3g
>>>>         selftest-setup
>>>> +      selftest-migration-kvm
>>>
>>> We're running under TCG in the Gitlab CI. I'm a little bit confused why
>>> we're running a KVM-only test here.
>>
>> The build-s390x job is TCG, indeed, but we have the "s390x-kvm" job that 
>> runs on a KVM-capable s390x host, so it could be added there?
> 
> I now gave it a try and it seems to work, so I updated this patch and pushed 
> it to the repository now.

Hmm, "selftest-migration" now was failing once here:

  https://gitlab.com/kvm-unit-tests/kvm-unit-tests/-/jobs/6633865591

Let's keep an eye on it, and if it is not stable enough, we might need to 
disable it in the CI again...

  Thomas


