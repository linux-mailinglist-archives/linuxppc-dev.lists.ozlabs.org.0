Return-Path: <linuxppc-dev+bounces-8553-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE145AB6145
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 May 2025 05:37:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZxzYR5G8lz2yqP;
	Wed, 14 May 2025 13:37:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747193835;
	cv=none; b=AdpocBQu4eJErVAcjbrO0H8HxdPmLBEXgr4F+5zNGNX8SbCpzRbiAbiey4bqezASVD2egJpDuiZBzT5WrjjbdaqLdZOqZqU8xNREaawIarHLsNliK9XBTXiOdq/oXjwwfOkefK+Xmi+dmHXla93HPMaRLsIeiv418UzbDgXKq6Ius3Qr0fZdyys3uHEiuEbVJg5BXVc+M2ec3H3XEUq2JvfY8K8rjrxHMYVrlbGQ6A6VRi49BOvZHfExRtEu2fV4RNQ9jEpfRQ/AXbbV8cwBpxb1WUKLcAQQ153/c1ZeOBBYcqL51QIwGijhbwbarkaegO8swj5k13fbcovY38AADQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747193835; c=relaxed/relaxed;
	bh=sXnHSZ0Yk0pjB03hExnA/yD4CkvPU5te8D9VFkvGbRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c2r1k8Ica7K+BPrvgSyoXCnDe+rPjKZ5mvtz6ciyPzkWGYIYkwZymsL0e5jtLMS6m63inDebSlkzTzXd0kioVtxuVdtf5PbgLNIRxVQY+BY2vmgMZ/kOBZwZdRc+/I0JqIgv2KqeSvcwmIs2bnHa6zYF16XIGnQo8fokdephWoNtJSLir7V01YAHxgNLnskCC+D55wxpxkIwNQHvLd6LCNroqJn7AJeXNBWRHuhRRBiL4CeCkzWE3kqlahx7RoQv4lijlPIv/Mb1glM4aTJ41FkoOXYDF1c42pdjkSR+jHTaMRpHA/851GWN7mRtIb4Bc32K8+lBeJ6s3Gsmnd9QHA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GosP4vXs; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GosP4vXs; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=shahuang@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GosP4vXs;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GosP4vXs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=shahuang@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZxzYQ6CcQz2xd5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 13:37:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747193831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sXnHSZ0Yk0pjB03hExnA/yD4CkvPU5te8D9VFkvGbRE=;
	b=GosP4vXsN218zv4s5OohvZUcl4xx8C/iM0l2XopyKMp++Gf0pMRKMkrjhEre2EHQdxg3j1
	s/4hfxbeNyCth419v5BulI9SF5V7H+T6n4q3qv4+JutDwM/ZV89AolvzJyrxKD7WsGqjTC
	gFiRnt2a9zN6WBvqwT6KUx/cTb42tQs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747193831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sXnHSZ0Yk0pjB03hExnA/yD4CkvPU5te8D9VFkvGbRE=;
	b=GosP4vXsN218zv4s5OohvZUcl4xx8C/iM0l2XopyKMp++Gf0pMRKMkrjhEre2EHQdxg3j1
	s/4hfxbeNyCth419v5BulI9SF5V7H+T6n4q3qv4+JutDwM/ZV89AolvzJyrxKD7WsGqjTC
	gFiRnt2a9zN6WBvqwT6KUx/cTb42tQs=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-rX4rdc6wNGSMJu9Dgjcc1Q-1; Tue, 13 May 2025 23:37:10 -0400
X-MC-Unique: rX4rdc6wNGSMJu9Dgjcc1Q-1
X-Mimecast-MFC-AGG-ID: rX4rdc6wNGSMJu9Dgjcc1Q_1747193829
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-30abb33d1d2so9863146a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 May 2025 20:37:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747193829; x=1747798629;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sXnHSZ0Yk0pjB03hExnA/yD4CkvPU5te8D9VFkvGbRE=;
        b=M+LStWSlr6l/aRrXeUAhj3xJk0eUPuHLihjv2zRwvmh50420qorytDOYppJmGASBXh
         /YcnAjMSw5cWM2A5HRhy/XXzcUZlVMbG114GNiBgTSTkKxiZSulz1YnWUOQllhJYP1C4
         9c4n6vJ0ft5HE6YnLg7PpFnTN6o5raUxeUnjRYDr3Ru/JZFkOk5KtoVPs8yngdwXMdKl
         FmacxH83xNsKcKIsl0eSteS77bIUxzt7ERWXaIue1/uiKGoe7Li2zzP6weKWjwp18Dav
         ndEOkWtmsL+L3ICTnsHd7V47DMRM5jEc9o29zy2yZH6iay1EVT43QQzdCl6+QKF2v4cb
         qt/w==
X-Forwarded-Encrypted: i=1; AJvYcCX32NAzxWoSdiHDuatSxUKV7ArIu4L+ieWQ/FvhetzUE8/rQdb+licY8CU2Z4TmL7O8RekO4OmRZerf65Y=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxvXXOATVVPKB6A6DjAB/bubDfTkjsEyGDrrxuIqKKfqh5oUJNF
	76lsL6XBDR+xABP4Uon2T3wR7Gtqua0F4jeBHP/08qbyZ3JysVyHSaa3wRCFuMrtuUICO1Dj2k+
	6lPzacZe5M5vxIz6KjcsKkzSunGIEaPLAirTGeKw3oe6JBxhzuDoFVSzv5vDTv+s=
X-Gm-Gg: ASbGncv6jPFPZVVZcaJjCQp7ntMbLeBUvhHhcCOhehJPn7leQWW+y3B+s+9n6/i7XsM
	bQ48UYox5yQN/3yh90gA1BwOhlOoWgF0Y7R5kk+iRC3P/8Dvep7DKKvnlfFdklmngmVVnpROAj6
	qLgiX6r9HzWudqdFO9sFEYysSmDKF1IRiR95MmHy4xrYLJo7+DtsjrpjRrZepyUUlqrq52DIGo6
	lHj5mdh2tCPTuHWBb24QflzoiD8Q6eMknl3yw/5tafQQXeTQR4hsc5dtaGEOJaeLJXrcgKkj/ds
	NzPyN3r0O2SoI89y
X-Received: by 2002:a17:90b:5590:b0:2ee:f687:6acb with SMTP id 98e67ed59e1d1-30e2e5c24b0mr3049816a91.13.1747193829179;
        Tue, 13 May 2025 20:37:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEMic3JZfqHUduiY6RIFo4rKxWJxbdw/r/LByh2iH/VAXRKkC+svCTuRA6EfZQjPLBCUxbkg==
X-Received: by 2002:a17:90b:5590:b0:2ee:f687:6acb with SMTP id 98e67ed59e1d1-30e2e5c24b0mr3049782a91.13.1747193828788;
        Tue, 13 May 2025 20:37:08 -0700 (PDT)
Received: from [10.72.116.125] ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e334e2503sm434299a91.31.2025.05.13.20.37.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 20:37:08 -0700 (PDT)
Message-ID: <1ac10d00-c21c-44fd-9973-c32fd89b4ba1@redhat.com>
Date: Wed, 14 May 2025 11:36:58 +0800
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v3 05/16] scripts: Document environment
 variables
To: Alexandru Elisei <alexandru.elisei@arm.com>, andrew.jones@linux.dev,
 eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com,
 frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com,
 david@redhat.com, pbonzini@redhat.com
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, will@kernel.org, julien.thierry.kdev@gmail.com,
 maz@kernel.org, oliver.upton@linux.dev, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, joey.gouly@arm.com, andre.przywara@arm.com,
 Andrew Jones <drjones@redhat.com>
References: <20250507151256.167769-1-alexandru.elisei@arm.com>
 <20250507151256.167769-6-alexandru.elisei@arm.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20250507151256.167769-6-alexandru.elisei@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jUZ_uRr0vnp0sTJEAOkDt0tcS787NnuV9WbqBa9amQc_1747193829
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 5/7/25 11:12 PM, Alexandru Elisei wrote:
> Document the environment variables that influence how a test is executed
> by the run_tests.sh test runner.
> 
> Suggested-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>

Reviewed-by: Shaoqin Huang <shahuang@redhat.com>

> ---
>   docs/unittests.txt |  5 ++++-
>   run_tests.sh       | 12 +++++++++---
>   2 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/unittests.txt b/docs/unittests.txt
> index 6eb315618dbd..ea0da959f008 100644
> --- a/docs/unittests.txt
> +++ b/docs/unittests.txt
> @@ -102,7 +102,8 @@ timeout
>   -------
>   timeout = <duration>
>   
> -Optional timeout in seconds, after which the test will be killed and fail.
> +Optional timeout in seconds, after which the test will be killed and fail. Can
> +be overwritten with the TIMEOUT=<duration> environment variable.
>   
>   check
>   -----
> @@ -113,3 +114,5 @@ can contain multiple files to check separated by a space, but each check
>   parameter needs to be of the form <path>=<value>
>   
>   The path and value cannot contain space, =, or shell wildcard characters.
> +
> +Can be overwritten with the CHECK environment variable with the same syntax.
> diff --git a/run_tests.sh b/run_tests.sh
> index f30b6dbd131c..dd9d27377905 100755
> --- a/run_tests.sh
> +++ b/run_tests.sh
> @@ -27,9 +27,15 @@ Usage: $0 [-h] [-v] [-a] [-g group] [-j NUM-TASKS] [-t] [-l]
>       -l, --list          Only output all tests list
>           --probe-maxsmp  Update the maximum number of VCPUs supported by host
>   
> -Set the environment variable QEMU=/path/to/qemu-system-ARCH to
> -specify the appropriate qemu binary for ARCH-run.
> -
> +The following environment variables are used:
> +
> +    QEMU            Path to QEMU binary for ARCH-run
> +    ACCEL           QEMU accelerator to use, e.g. 'kvm', 'hvf' or 'tcg'
> +    ACCEL_PROPS     Extra argument(s) to ACCEL
> +    MACHINE         QEMU machine type
> +    TIMEOUT         Timeout duration for the timeout(1) command
> +    CHECK           Overwrites the 'check' unit test parameter (see
> +                    docs/unittests.txt)
>   EOF
>   }
>   

-- 
Shaoqin


