Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C91238FB0B2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 13:02:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hjb0Mk5K;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hjb0Mk5K;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vtnk663TYz3cVl
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 21:02:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hjb0Mk5K;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hjb0Mk5K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VtnjP3Pnlz3cJl
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2024 21:02:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717498918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wJUOI9qxtQ1g8vuGBmXdc1ny/8UHvRPp/bfXx3Q0EnE=;
	b=Hjb0Mk5KEKUla9g8e8X+5HuVlyTsidH18tgSfQdoOCJyKjmoqyOpw8Ec41blcuCxSacpwo
	lROhFb7SlL7ctpkbGw4Sh17zqwPhn0YGuRwJgT3VmdBoJF2WZ2+Tw6NWATYBVPVXUtwjzr
	SYuU50mkPo2ZLQI5BeuQj1nQn8FIkZg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717498918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wJUOI9qxtQ1g8vuGBmXdc1ny/8UHvRPp/bfXx3Q0EnE=;
	b=Hjb0Mk5KEKUla9g8e8X+5HuVlyTsidH18tgSfQdoOCJyKjmoqyOpw8Ec41blcuCxSacpwo
	lROhFb7SlL7ctpkbGw4Sh17zqwPhn0YGuRwJgT3VmdBoJF2WZ2+Tw6NWATYBVPVXUtwjzr
	SYuU50mkPo2ZLQI5BeuQj1nQn8FIkZg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-5_UHt7G3NCC3k9ZAInyIcA-1; Tue, 04 Jun 2024 07:01:56 -0400
X-MC-Unique: 5_UHt7G3NCC3k9ZAInyIcA-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-795106b7c6dso179781085a.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jun 2024 04:01:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717498916; x=1718103716;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wJUOI9qxtQ1g8vuGBmXdc1ny/8UHvRPp/bfXx3Q0EnE=;
        b=JYFNhD9zg5wc61GmFuyAkaPDTrHmWWmB0LlCSnG6vLQu2RD/nzYYM/0glJ1CDLNnoF
         7kRDW/ZbqSMbCHkAdHYsb6KFHLXQvMIyS6vwJIR4XJDIqzIaJN/yQb2WyjGPwX9H2QUQ
         u8sMhJivq/HD/hrdCm0JSY6RCtQMBQ1MmQ5qLKnBwsaHGJjr0bqTvydLnKWVkh06L47z
         Bw0rM8W8Hn1IlOZZgEk3/+bHb0ro2QcY2417uyFSFlp/9LAWnoE+a14fbY7+d88CBZg/
         +n4MmTEjAKNgWkXR3D73TJq/rnzwklBecnPgUJt2TsJ6oTxASlFg1uMKD1PUzQdotu4T
         Ul3w==
X-Forwarded-Encrypted: i=1; AJvYcCXlpLfp4NJZqSh0qeMTzxt2ksdbbg4l2tIbCnVgRrJLebGmrAETZe0hk5iYyQxlnOKgAYlya26D8AmvGIoqUrM7VD1kdhgKrztSMXhMIg==
X-Gm-Message-State: AOJu0YwdOsC812g7BiG9tOuCfqMv1KQwY+Tght7v63RConauLhtiKknB
	zHRX/ZZFxW6n8DPqXuZ1KL+WjgMC4iUF2mQ6lT2ZAduBTMiz+80KRLkTpeZorpQcquLhm+5JBY9
	rUT41+rJQqCP2jXRTNS/xc5nKBprmEp4zJA7ghZZCavdMQu/TjLiyxFhclq7pDUM=
X-Received: by 2002:a05:620a:21cd:b0:792:bbdb:2520 with SMTP id af79cd13be357-794f5c594f0mr1157072685a.9.1717498916315;
        Tue, 04 Jun 2024 04:01:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbuRLQ/x8ZpVwQLYMnCiiydmKpKjQCV1Q8TnRddHRYCHBQ64GyGOW2qV/cmyHNiP8mX3L1Eg==
X-Received: by 2002:a05:620a:21cd:b0:792:bbdb:2520 with SMTP id af79cd13be357-794f5c594f0mr1157069785a.9.1717498915651;
        Tue, 04 Jun 2024 04:01:55 -0700 (PDT)
Received: from [192.168.0.4] (ip-109-43-178-97.web.vodafone.de. [109.43.178.97])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43ff23e0dddsm48244621cf.41.2024.06.04.04.01.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 04:01:55 -0700 (PDT)
Message-ID: <54623658-23c8-4a51-8365-a983b230740a@redhat.com>
Date: Tue, 4 Jun 2024 13:01:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v9 31/31] powerpc: gitlab CI update
To: Nicholas Piggin <npiggin@gmail.com>
References: <20240504122841.1177683-1-npiggin@gmail.com>
 <20240504122841.1177683-32-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240504122841.1177683-32-npiggin@gmail.com>
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

On 04/05/2024 14.28, Nicholas Piggin wrote:
> This adds testing for the powernv machine, and adds a gitlab-ci test
> group instead of specifying all tests in .gitlab-ci.yml, and adds a
> few new tests (smp, atomics) that are known to work in CI.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   .gitlab-ci.yml        | 30 ++++++++----------------------
>   powerpc/unittests.cfg | 32 ++++++++++++++++++++++++++------
>   2 files changed, 34 insertions(+), 28 deletions(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 23bb69e24..31a2a4e34 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -97,17 +97,10 @@ build-ppc64be:
>    - cd build
>    - ../configure --arch=ppc64 --endian=big --cross-prefix=powerpc64-linux-gnu-
>    - make -j2
> - - ACCEL=tcg ./run_tests.sh
> -      selftest-setup
> -      selftest-migration
> -      selftest-migration-skip
> -      spapr_hcall
> -      rtas-get-time-of-day
> -      rtas-get-time-of-day-base
> -      rtas-set-time-of-day
> -      emulator
> -      | tee results.txt
> - - if grep -q FAIL results.txt ; then exit 1 ; fi
> + - ACCEL=tcg MAX_SMP=8 ./run_tests.sh -g gitlab-ci | tee results.txt
> + - grep -q PASS results.txt && ! grep -q FAIL results.txt
> + - ACCEL=tcg MAX_SMP=8 MACHINE=powernv ./run_tests.sh -g gitlab-ci | tee results.txt
> + - grep -q PASS results.txt && ! grep -q FAIL results.txt
>   
>   build-ppc64le:
>    extends: .intree_template
> @@ -115,17 +108,10 @@ build-ppc64le:
>    - dnf install -y qemu-system-ppc gcc-powerpc64-linux-gnu nmap-ncat
>    - ./configure --arch=ppc64 --endian=little --cross-prefix=powerpc64-linux-gnu-
>    - make -j2
> - - ACCEL=tcg ./run_tests.sh
> -      selftest-setup
> -      selftest-migration
> -      selftest-migration-skip
> -      spapr_hcall
> -      rtas-get-time-of-day
> -      rtas-get-time-of-day-base
> -      rtas-set-time-of-day
> -      emulator
> -      | tee results.txt
> - - if grep -q FAIL results.txt ; then exit 1 ; fi
> + - ACCEL=tcg MAX_SMP=8 ./run_tests.sh -g gitlab-ci | tee results.txt
> + - grep -q PASS results.txt && ! grep -q FAIL results.txt
> + - ACCEL=tcg MAX_SMP=8 MACHINE=powernv ./run_tests.sh -g gitlab-ci | tee results.txt
> + - grep -q PASS results.txt && ! grep -q FAIL results.txt
>   
>   # build-riscv32:
>   # Fedora doesn't package a riscv32 compiler for QEMU. Oh, well.
> diff --git a/powerpc/unittests.cfg b/powerpc/unittests.cfg
> index d767f5d68..6fae688a8 100644
> --- a/powerpc/unittests.cfg
> +++ b/powerpc/unittests.cfg
> @@ -16,17 +16,25 @@
>   file = selftest.elf
>   smp = 2
>   extra_params = -m 1g -append 'setup smp=2 mem=1024'
> -groups = selftest
> +groups = selftest gitlab-ci
>   
>   [selftest-migration]
>   file = selftest-migration.elf
>   machine = pseries
>   groups = selftest migration
>   
> +# QEMU 7.0 (Fedora 37) in gitlab CI has known migration bugs in TCG, so
> +# make a kvm-only version for CI
> +[selftest-migration-ci]
> +file = selftest-migration.elf
> +machine = pseries
> +groups = nodefault selftest migration gitlab-ci
> +accel = kvm
> +
>   [selftest-migration-skip]
>   file = selftest-migration.elf
>   machine = pseries
> -groups = selftest migration
> +groups = selftest migration gitlab-ci
>   extra_params = -append "skip"
>   
>   [migration-memory]
> @@ -37,6 +45,7 @@ groups = migration
>   [spapr_hcall]
>   file = spapr_hcall.elf
>   machine = pseries
> +groups = gitlab-ci
>   
>   [spapr_vpa]
>   file = spapr_vpa.elf
> @@ -47,38 +56,43 @@ file = rtas.elf
>   machine = pseries
>   timeout = 5
>   extra_params = -append "get-time-of-day date=$(date +%s)"
> -groups = rtas
> +groups = rtas gitlab-ci
>   
>   [rtas-get-time-of-day-base]
>   file = rtas.elf
>   machine = pseries
>   timeout = 5
>   extra_params = -rtc base="2006-06-17" -append "get-time-of-day date=$(date --date="2006-06-17 UTC" +%s)"
> -groups = rtas
> +groups = rtas gitlab-ci
>   
>   [rtas-set-time-of-day]
>   file = rtas.elf
>   machine = pseries
>   extra_params = -append "set-time-of-day"
>   timeout = 5
> -groups = rtas
> +groups = rtas gitlab-ci
>   
>   [emulator]
>   file = emulator.elf
> +groups = gitlab-ci
>   
> +# QEMU 7.0 (Fedora 37) in gitlab CI fails this
>   [interrupts]
>   file = interrupts.elf
>   
> +# QEMU 7.0 (Fedora 37) in gitlab CI fails this
>   [mmu]
>   file = mmu.elf
>   smp = $MAX_SMP
>   
> +# QEMU 7.0 (Fedora 37) in gitlab CI fails this
>   [pmu]
>   file = pmu.elf
>   
>   [smp]
>   file = smp.elf
>   smp = 2
> +groups = gitlab-ci
>   
>   [smp-smt]
>   file = smp.elf
> @@ -92,16 +106,19 @@ accel = tcg,thread=single
>   
>   [atomics]
>   file = atomics.elf
> +groups = gitlab-ci
>   
>   [atomics-migration]
>   file = atomics.elf
>   machine = pseries
>   extra_params = -append "migration -m"
> -groups = migration
> +groups = migration gitlab-ci
>   
> +# QEMU 7.0 (Fedora 37) in gitlab CI fails this
>   [timebase]
>   file = timebase.elf
>   
> +# QEMU 7.0 (Fedora 37) in gitlab CI fails this
>   [timebase-icount]
>   file = timebase.elf
>   accel = tcg
> @@ -115,14 +132,17 @@ smp = 2,threads=2
>   extra_params = -machine cap-htm=on -append "h_cede_tm"
>   groups = h_cede_tm
>   
> +# QEMU 7.0 (Fedora 37) in gitlab CI fails this
>   [sprs]
>   file = sprs.elf
>   
> +# QEMU 7.0 (Fedora 37) in gitlab CI fails this
>   [sprs-migration]
>   file = sprs.elf
>   machine = pseries
>   extra_params = -append '-w'
>   groups = migration

Have any of the failures been fixed in newer versions of QEMU?
If so, you could also update the ppc jobs to fedora:40:

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -91,6 +91,7 @@ build-arm:
  
  build-ppc64be:
   extends: .outoftree_template
+ image: fedora:40
   script:
   - dnf install -y qemu-system-ppc gcc-powerpc64-linux-gnu nmap-ncat
   - mkdir build
@@ -111,6 +112,7 @@ build-ppc64be:
  
  build-ppc64le:
   extends: .intree_template
+ image: fedora:40
   script:
   - dnf install -y qemu-system-ppc gcc-powerpc64-linux-gnu nmap-ncat
   - ./configure --arch=ppc64 --endian=little --cross-prefix=powerpc64-linux-gnu-

I also had a patch somewhere that updates all jobs, it just needs some
polishing to get finished ...  maybe a good point in time to do this now.

  Thomas

