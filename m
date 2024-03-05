Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C29F387160B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 07:51:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D2NPQHTR;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D2NPQHTR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpmRn45FMz3dTl
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 17:51:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D2NPQHTR;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=D2NPQHTR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpmR25z88z3cDR
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 17:50:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709621418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=yUHOxqOqxGyA7MtR9Nnzp2vnulyuYHtJSbKL4qmMk4s=;
	b=D2NPQHTR1dVQHkqe1T8kzmcJ6akl3cd1cKfAJGdDNNbAkjAeS5U0+QTJ09/y3saHrlW9C+
	ha2I4ML5nbaFQkdt3HEW0XoFljuOhmGvqpomvpsRcYeX4DDrVGyJmPuLMuwmuI0wmiT5cL
	XelGhKjxLq40yHjXiUW9IsjbD92052o=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709621418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=yUHOxqOqxGyA7MtR9Nnzp2vnulyuYHtJSbKL4qmMk4s=;
	b=D2NPQHTR1dVQHkqe1T8kzmcJ6akl3cd1cKfAJGdDNNbAkjAeS5U0+QTJ09/y3saHrlW9C+
	ha2I4ML5nbaFQkdt3HEW0XoFljuOhmGvqpomvpsRcYeX4DDrVGyJmPuLMuwmuI0wmiT5cL
	XelGhKjxLq40yHjXiUW9IsjbD92052o=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-292-ozFziRe_NkKeLNKy4GkefQ-1; Tue, 05 Mar 2024 01:50:13 -0500
X-MC-Unique: ozFziRe_NkKeLNKy4GkefQ-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-56544b5af9dso3526820a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Mar 2024 22:50:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709621412; x=1710226212;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yUHOxqOqxGyA7MtR9Nnzp2vnulyuYHtJSbKL4qmMk4s=;
        b=QpwpKSYx5gLhoNF/MCqcJS0ywpnx5o1T1RrtcpZd2hxwSyiEs4B173nW7ETefbl/1H
         wZqqbMiAI3s7JVXS+8UT1DR15LPIhf6BfFd6f64bdje9t7gz6zRq5NnJK43QyEI3wyL4
         STkPQXq4NjXFdTxgJv6aIeQniA83AClw6kt2kiLp0mKXuAz67pQAXh/zrJuNB6zy+rjd
         SgynhbWWRCl9/Lv02frimN98iIKA9Gsr3BS3MaSAVRppUTBurKFk2l49rJK6P5x68+0Z
         ua1j8AgB1hC/PtHuvTecxZMnuDs14Vqkd+S1Kay/7b8plGXjYuTNk8W1ywlgIKyYJaVh
         b0Ig==
X-Forwarded-Encrypted: i=1; AJvYcCXi/nEQIaxPg/LiduFHxCj70BAiMDNuuVJN9vXKUUrNm06G/TXdIL4dYUjTsbyrBLcqoT/Ky9Uf37sqgX4g7uqE5GQbAFm+pzB4sLobZg==
X-Gm-Message-State: AOJu0YxhYSuh2xoYamqzFkuUiR+UhgyMlbbDmReVYcNLSpvsPG1/5ZhW
	6qEz26Oj2k95kFrfDzZJAnKiLhrFlaTXIHFWBNy35KWsGsDr2aH3lA9Lkau/EqVK71W9ANORgeT
	+U5HinShMm1/Tp4BWCiBhLSatIw4ZForVRpVoY/a/EOxpNzutpt2Qy/dm5hvxclE=
X-Received: by 2002:a05:6402:901:b0:565:e646:5c12 with SMTP id g1-20020a056402090100b00565e6465c12mr8850261edz.0.1709621412698;
        Mon, 04 Mar 2024 22:50:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGtP2gEIqeZN5nDOzlMNSXgqysn23HAV2b1atmbvM+KQvO6/brgGjbq/PcchmAc2KGMGnL+hQ==
X-Received: by 2002:a05:6402:901:b0:565:e646:5c12 with SMTP id g1-20020a056402090100b00565e6465c12mr8850252edz.0.1709621412367;
        Mon, 04 Mar 2024 22:50:12 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-178-243.web.vodafone.de. [109.43.178.243])
        by smtp.gmail.com with ESMTPSA id q22-20020a50aa96000000b00564e489ce9asm5712740edc.12.2024.03.04.22.50.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 22:50:12 -0800 (PST)
Message-ID: <d78eda02-7cd7-4e66-94d8-8493f8282d72@redhat.com>
Date: Tue, 5 Mar 2024 07:50:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH 6/7] gitlab-ci: Run migration selftest on
 s390x and powerpc
To: Nicholas Piggin <npiggin@gmail.com>
References: <20240226093832.1468383-1-npiggin@gmail.com>
 <20240226093832.1468383-7-npiggin@gmail.com>
 <7783977b-69ea-4831-a8f2-55de26d7bfd4@redhat.com>
 <CZLGURIYNKHG.1JRG53746LHWI@wheely>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <CZLGURIYNKHG.1JRG53746LHWI@wheely>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, Marc Hartmayer <mhartmay@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 05/03/2024 03.38, Nicholas Piggin wrote:
> On Sat Mar 2, 2024 at 12:16 AM AEST, Thomas Huth wrote:
>> On 26/02/2024 10.38, Nicholas Piggin wrote:
>>> The migration harness is complicated and easy to break so CI will
>>> be helpful.
>>>
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>> ---
>>>    .gitlab-ci.yml | 18 +++++++++++-------
>>>    1 file changed, 11 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>>> index 71d986e98..61f196d5d 100644
>>> --- a/.gitlab-ci.yml
>>> +++ b/.gitlab-ci.yml
>>> @@ -64,26 +64,28 @@ build-arm:
>>>    build-ppc64be:
>>>     extends: .outoftree_template
>>>     script:
>>> - - dnf install -y qemu-system-ppc gcc-powerpc64-linux-gnu
>>> + - dnf install -y qemu-system-ppc gcc-powerpc64-linux-gnu nmap-ncat
>>>     - mkdir build
>>>     - cd build
>>>     - ../configure --arch=ppc64 --endian=big --cross-prefix=powerpc64-linux-gnu-
>>>     - make -j2
>>>     - ACCEL=tcg ./run_tests.sh
>>> -     selftest-setup spapr_hcall rtas-get-time-of-day rtas-get-time-of-day-base
>>> -     rtas-set-time-of-day emulator
>>> +     selftest-setup selftest-migration selftest-migration-skip spapr_hcall
>>> +     rtas-get-time-of-day rtas-get-time-of-day-base rtas-set-time-of-day
>>> +     emulator
>>>         | tee results.txt
>>>     - if grep -q FAIL results.txt ; then exit 1 ; fi
>>>    
>>>    build-ppc64le:
>>>     extends: .intree_template
>>>     script:
>>> - - dnf install -y qemu-system-ppc gcc-powerpc64-linux-gnu
>>> + - dnf install -y qemu-system-ppc gcc-powerpc64-linux-gnu nmap-ncat
>>>     - ./configure --arch=ppc64 --endian=little --cross-prefix=powerpc64-linux-gnu-
>>>     - make -j2
>>>     - ACCEL=tcg ./run_tests.sh
>>> -     selftest-setup spapr_hcall rtas-get-time-of-day rtas-get-time-of-day-base
>>> -     rtas-set-time-of-day emulator
>>> +     selftest-setup selftest-migration selftest-migration-skip spapr_hcall
>>> +     rtas-get-time-of-day rtas-get-time-of-day-base rtas-set-time-of-day
>>> +     emulator
>>>         | tee results.txt
>>>     - if grep -q FAIL results.txt ; then exit 1 ; fi
>>>    
>>> @@ -107,7 +109,7 @@ build-riscv64:
>>>    build-s390x:
>>>     extends: .outoftree_template
>>>     script:
>>> - - dnf install -y qemu-system-s390x gcc-s390x-linux-gnu
>>> + - dnf install -y qemu-system-s390x gcc-s390x-linux-gnu nmap-ncat
>>>     - mkdir build
>>>     - cd build
>>>     - ../configure --arch=s390x --cross-prefix=s390x-linux-gnu-
>>> @@ -133,6 +135,8 @@ build-s390x:
>>>          sclp-1g
>>>          sclp-3g
>>>          selftest-setup
>>> +      selftest-migration
>>> +      selftest-migration-skip
>>>          sieve
>>>          smp
>>>          stsi
>>
>> While I can update the qemu binary for the s390x-kvm job, the build-* jobs
>> run in a container with a normal QEMU from the corresponding distros, so I
>> think this has to wait 'til we get distros that contain your QEMU TCG
>> migration fix.
> 
> Okay. powerpc *could* run into the TCG bug too, in practice it has not.
> We could try enable it there to get migration into CI, and revert it if
> it starts showing random failures?

Fine for me.

  Thomas

