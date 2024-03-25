Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DB188A862
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 17:09:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UFSW7T/R;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UFSW7T/R;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3HtN4jn6z3dVb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 03:09:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UFSW7T/R;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UFSW7T/R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3Hsc3m7jz3cVd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 03:08:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711382896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+3LtywVA7NTQFz0RoMpqZgRH+FCq4yAPsqKSgNMKI1A=;
	b=UFSW7T/R4js08K81YGVc8rDCOQusb3wsXqM14r7kcxbZkO3FG30b8k+vBs/OBpiasGwC62
	1HCKdZfyzayF2Az9BDeVMiExGOumJVkTMEbDXQJLgNc5bjJKXainKpkY79x8ib3vmYl8U5
	2L3EYvHMVRj/VJ1FG/qLrpe0wFjh9ZY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711382896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+3LtywVA7NTQFz0RoMpqZgRH+FCq4yAPsqKSgNMKI1A=;
	b=UFSW7T/R4js08K81YGVc8rDCOQusb3wsXqM14r7kcxbZkO3FG30b8k+vBs/OBpiasGwC62
	1HCKdZfyzayF2Az9BDeVMiExGOumJVkTMEbDXQJLgNc5bjJKXainKpkY79x8ib3vmYl8U5
	2L3EYvHMVRj/VJ1FG/qLrpe0wFjh9ZY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-lxsonsgUPey_S05iqSUFvg-1; Mon, 25 Mar 2024 12:08:14 -0400
X-MC-Unique: lxsonsgUPey_S05iqSUFvg-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4148b739698so3067075e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 09:08:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711382893; x=1711987693;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+3LtywVA7NTQFz0RoMpqZgRH+FCq4yAPsqKSgNMKI1A=;
        b=WKMyAL8B10pzExhvPKZtU4Fk2PC2aWzMbR8QPHd9e6P3PUuZDBDJfORGaQfNvXk98u
         i6bxaJWH0tvKgafFl0NbUHl0QFDMfMmd4g8j5KvXQt/i4BtAEJ0lTR8CS7OzGkWyBcA9
         d3t8L+XFR3idLEtrSwWyTimUtvy0NPnQMbwHuTZvIUgJuf7PWiOv+lKy7kEXlgIpOnSi
         FXtN8x9SuZRBpfOoIDl6VpiElpQE8gkx4KPrqtQAbHarb38+SQK/AnOqV4RJOWeVyiV7
         Ygbiu4mAeo3B4D9OyadUV4f0vt5QKD8nIs7Qhqthcxq9ZOicKQiv+N2GLc8hOgQP3ncU
         0eGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxnk3M4qXVMjleFdaj8e4DL0+bcB+YA8FphidhC1WE8VUvgdyiATf/AV6LOprLzJOy08nldUrIR2ZkbcOFSQN2FOOii8d8ZGYkPxSJ5A==
X-Gm-Message-State: AOJu0Yx4HJqDFhW+WNXwPMwXAvEbV7HX/6roktxpRKMUo8wbnzf7CQK+
	w9dsySEFXS8xGT02tTAsy9VlZAgD5zEgmSi9lazogEzZvZD/2JSgI0bmyLte59K2Y6PFD0K03rk
	X5YE9TIRtSyM/ak8/yd09J1g9btErkEVdOJHSwn3yRvjQM/PglRKjKZ4URYkE8Cs=
X-Received: by 2002:a05:600c:1f84:b0:414:887f:6167 with SMTP id je4-20020a05600c1f8400b00414887f6167mr3382728wmb.7.1711382893045;
        Mon, 25 Mar 2024 09:08:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRDyTWIfUX3BkdmHTwqnjITCdrXKqdGGiggbkYvcUs2c0ghfvn9MeU2N4y9nE9g5vUn9I2/w==
X-Received: by 2002:a05:600c:1f84:b0:414:887f:6167 with SMTP id je4-20020a05600c1f8400b00414887f6167mr3382716wmb.7.1711382892704;
        Mon, 25 Mar 2024 09:08:12 -0700 (PDT)
Received: from [192.168.0.9] (ip-109-43-176-158.web.vodafone.de. [109.43.176.158])
        by smtp.gmail.com with ESMTPSA id r18-20020a05600c35d200b00414808dea22sm2387686wmq.0.2024.03.25.09.08.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 09:08:12 -0700 (PDT)
Message-ID: <91a6724d-5247-4f43-9400-1b8c03cb6cb3@redhat.com>
Date: Mon, 25 Mar 2024 17:08:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v7 06/35] gitlab-ci: Run migration selftest
 on s390x and powerpc
To: Nicholas Piggin <npiggin@gmail.com>
References: <20240319075926.2422707-1-npiggin@gmail.com>
 <20240319075926.2422707-7-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240319075926.2422707-7-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 19/03/2024 08.58, Nicholas Piggin wrote:
> The migration harness is complicated and easy to break so CI will
> be helpful.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   .gitlab-ci.yml      | 18 +++++++++++-------
>   s390x/unittests.cfg |  8 ++++++++
>   2 files changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index ff34b1f50..bd34da04f 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -92,26 +92,28 @@ build-arm:
>   build-ppc64be:
>    extends: .outoftree_template
>    script:
> - - dnf install -y qemu-system-ppc gcc-powerpc64-linux-gnu
> + - dnf install -y qemu-system-ppc gcc-powerpc64-linux-gnu nmap-ncat
>    - mkdir build
>    - cd build
>    - ../configure --arch=ppc64 --endian=big --cross-prefix=powerpc64-linux-gnu-
>    - make -j2
>    - ACCEL=tcg ./run_tests.sh
> -     selftest-setup spapr_hcall rtas-get-time-of-day rtas-get-time-of-day-base
> -     rtas-set-time-of-day emulator
> +     selftest-setup selftest-migration selftest-migration-skip spapr_hcall
> +     rtas-get-time-of-day rtas-get-time-of-day-base rtas-set-time-of-day

I used to squash as much as possible into one line in the past, but nowadays 
I rather prefer one test per line (like it is done for s390x below), so that 
it is easier to identify the changes ...
So if you like, I think you could also put each test on a separate line here 
now (since you're touching all lines with tests here anyway).

> +     emulator
>        | tee results.txt
>    - if grep -q FAIL results.txt ; then exit 1 ; fi
>   
>   build-ppc64le:
>    extends: .intree_template
>    script:
> - - dnf install -y qemu-system-ppc gcc-powerpc64-linux-gnu
> + - dnf install -y qemu-system-ppc gcc-powerpc64-linux-gnu nmap-ncat
>    - ./configure --arch=ppc64 --endian=little --cross-prefix=powerpc64-linux-gnu-
>    - make -j2
>    - ACCEL=tcg ./run_tests.sh
> -     selftest-setup spapr_hcall rtas-get-time-of-day rtas-get-time-of-day-base
> -     rtas-set-time-of-day emulator
> +     selftest-setup selftest-migration selftest-migration-skip spapr_hcall
> +     rtas-get-time-of-day rtas-get-time-of-day-base rtas-set-time-of-day
> +     emulator
>        | tee results.txt
>    - if grep -q FAIL results.txt ; then exit 1 ; fi
>   
> @@ -135,7 +137,7 @@ build-riscv64:
>   build-s390x:
>    extends: .outoftree_template
>    script:
> - - dnf install -y qemu-system-s390x gcc-s390x-linux-gnu
> + - dnf install -y qemu-system-s390x gcc-s390x-linux-gnu nmap-ncat
>    - mkdir build
>    - cd build
>    - ../configure --arch=s390x --cross-prefix=s390x-linux-gnu-
> @@ -161,6 +163,8 @@ build-s390x:
>         sclp-1g
>         sclp-3g
>         selftest-setup
> +      selftest-migration-kvm
> +      selftest-migration-skip
>         sieve
>         smp
>         stsi
> diff --git a/s390x/unittests.cfg b/s390x/unittests.cfg
> index 49e3e4608..b79b99416 100644
> --- a/s390x/unittests.cfg
> +++ b/s390x/unittests.cfg
> @@ -31,6 +31,14 @@ groups = selftest migration
>   # https://lore.kernel.org/qemu-devel/20240219061731.232570-1-npiggin@gmail.com/
>   accel = kvm
>   
> +[selftest-migration-kvm]
> +file = selftest-migration.elf
> +groups = nodefault
> +accel = kvm
> +# This is a special test for gitlab-ci that can must not use TCG until the

"can" or "must"?

> +# TCG migration fix has made its way into CI environment's QEMU.
> +# https://lore.kernel.org/qemu-devel/20240219061731.232570-1-npiggin@gmail.com/
> +
>   [selftest-migration-skip]
>   file = selftest-migration.elf
>   groups = selftest migration

  Thomas

