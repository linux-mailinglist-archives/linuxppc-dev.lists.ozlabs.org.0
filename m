Return-Path: <linuxppc-dev+bounces-8799-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C3CABEB9E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 08:03:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2LSV72xDz3bYf;
	Wed, 21 May 2025 16:03:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747807386;
	cv=none; b=SDdysxZWPOwQUzNh6t+87dVqxDG5oqf7FfLFmP3RZKULoAPE/2E+50DcBkHQ8bRwTUHt31VDkxf/Y26LnmEs5z2393IvmGbPJHncPMVKYCfXbbp0csa673mW2e7n18fz2t7Jx8pCbe+6F660i7LEiMk43JufxLqQX4vQHhmm+iIdTFubCqlLDwvxMRGTeOTff6rI9cw4P6hMU40fQDTUMMC5Jd3TYE8LKbKdLF1O8vbi81Xn4OuYAX3OMczsTa7CT7UQ16CUF5xAodEBODCGEPXmrtd+1Hfl5IWniNS8pAM2Vn+Xj+7x7ECFjqW44Hltv8wyTMzrCttk/cWwzqX0cA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747807386; c=relaxed/relaxed;
	bh=Luzvl9YYiKKkKv2ZrlEtI5HQQUPGehqlA/R1MmkzXtU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PgE90beOjYTVhGtfwNW4ajOk12eHjzWqn/9c1MDdMJZhAmDBrrLZghJ1tJ0vrGdlGCRZZI5IsYPmIpUkp1GoU1m0hRMBIoH3dqpGNzhTdnBwZqGKJ+i3CZfkxV+gZnWZKjDGaX2lviWVrL9ujB4zGkziuXxMoG/nJVYxdEQk3mH41zNewkx5O7XKI8BTAwjGXw3z9DgyE6pPiVSzFXjH6Ad+bLa62Nz5er0qcP0zbWz4Jw70nmBimIzNmUvaZrqkNR8vI77aCYa9OjTFwkz9bSwj4bNIQZi7PPWb1X7DneF0USh/3Qi9BgbcFpLMHz+ijet5inTdc9hUMIhacaB5NA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YeoGR8LF; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YeoGR8LF; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=shahuang@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YeoGR8LF;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YeoGR8LF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=shahuang@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2LST6x1cz2yyJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 16:03:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747807383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Luzvl9YYiKKkKv2ZrlEtI5HQQUPGehqlA/R1MmkzXtU=;
	b=YeoGR8LFso2xaJo07LjF1s4VqP6VYRQg9IbkoV7JhxHM/AEOY4qscvyyGgi4vj6Wh4zaZp
	mBQAkj5IBkPSbM+oikkpLDu/lXgBuFPQhe9D7iG5Xf1aJ2UQ27ugIGONUZkuwm2Yg1upZG
	TTwJNYYTOIKySy87D9Q9Cc7Ks3HeV6I=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747807383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Luzvl9YYiKKkKv2ZrlEtI5HQQUPGehqlA/R1MmkzXtU=;
	b=YeoGR8LFso2xaJo07LjF1s4VqP6VYRQg9IbkoV7JhxHM/AEOY4qscvyyGgi4vj6Wh4zaZp
	mBQAkj5IBkPSbM+oikkpLDu/lXgBuFPQhe9D7iG5Xf1aJ2UQ27ugIGONUZkuwm2Yg1upZG
	TTwJNYYTOIKySy87D9Q9Cc7Ks3HeV6I=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-UmjjCjLHMEuiT-fXJNrj4g-1; Wed, 21 May 2025 02:03:00 -0400
X-MC-Unique: UmjjCjLHMEuiT-fXJNrj4g-1
X-Mimecast-MFC-AGG-ID: UmjjCjLHMEuiT-fXJNrj4g_1747807380
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7394792f83cso4997990b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 23:03:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747807380; x=1748412180;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Luzvl9YYiKKkKv2ZrlEtI5HQQUPGehqlA/R1MmkzXtU=;
        b=ptR+bQIWWnZpwKws6DQQIZiGIS3Tq8gUio52ucymq+c+OY2Ou4ISMcctHT3eLn9zDW
         qu8M930c3aH7lga2/x7Lk35xNiTzJ25tCGFDsrmhGn3ahBgStkT3cBdHVZW76Hattbn/
         Lh/cbI8LG8QbRW7hJeeoCW1G10UZxUwxnx04hY+nZpIeJLewwQGONw481JEZiG5dbMS7
         wObtTH3YeUA19nF7rOnGAL6EToLfLVNLoptD38KObkWIgZRIJ+s6qx8MZc5zMXOJM5FK
         cBM3XziQbYGATEur/TBzxrKYULVpB18bwIlchaLhI34q20ll0WMdaFLLNTod2gBQi4oT
         6I+g==
X-Forwarded-Encrypted: i=1; AJvYcCUwVlEh9V2Bok7W0M2RqIG0YbyPFDu3kf34QR+qK8F7A+xDCyIu70oI7oBtSdBv2/0fmuIkrD50CbmGClI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxiyPavA1p5YyCjtTlSq4onj5kBOCbum7X4MLwGUY85Q+a4zSRW
	guOU3NOm7lwkhNRblsPH8q7eo+Cs2LzWcT1Ue8/J0xT3OEgTD8eIpPEtLdShogkd/YzF8LH1D7B
	yHkxD61IL6RixXJcxVUCWX4Xft+m2gTkml/FFEoBU9Y0foWk6Hk+QpNPpyjjOF46XfMI=
X-Gm-Gg: ASbGncsOdDMEDNQXkaFyMQ69j+eQehs3Ph8/qzsce7Cob3VK0uN5+nFEgl5oOYEA3PF
	IeFzcU00a2Brp9waapTIru+71CiP00f5/IHk4uKmn8ZL5xS3JSYyFlLvLjE88z4PqjZcUv3mbOY
	8eNgk7tATHBo8fBeAPEtpdiOyaTOP06hx4D3Vl14nEax4enwBuC9aT/oe4lRWDJWt3109lVBKyG
	xldVeOsDgTtSjGcAWQr/Hi7rYxux6wINMGN0IcKsozm6y18qv6cCoQuZ48iEcFAqMrCOzrlJQK7
	a4M51RyEgcS0QAY=
X-Received: by 2002:a05:6a00:1788:b0:736:5544:7ad7 with SMTP id d2e1a72fcca58-742a97eb5b9mr28757192b3a.14.1747807379857;
        Tue, 20 May 2025 23:02:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkzCM7/Ctb9gNAgNxzZrfSW/B0q8J+JojRSlwDFqY3yzQr38av5VTKAulIBRs6Cj/pJdZcvA==
X-Received: by 2002:a05:6a00:1788:b0:736:5544:7ad7 with SMTP id d2e1a72fcca58-742a97eb5b9mr28757152b3a.14.1747807379436;
        Tue, 20 May 2025 23:02:59 -0700 (PDT)
Received: from [10.72.116.61] ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829b87sm8888368b3a.114.2025.05.20.23.02.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 23:02:58 -0700 (PDT)
Message-ID: <3b33d060-895a-4f4b-a067-66164a29f8b4@redhat.com>
Date: Wed, 21 May 2025 14:02:45 +0800
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
Subject: Re: [kvm-unit-tests PATCH v3 13/16] scripts: Do not probe for maximum
 number of VCPUs when using kvmtool
To: Alexandru Elisei <alexandru.elisei@arm.com>, andrew.jones@linux.dev,
 eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com,
 frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com,
 david@redhat.com, pbonzini@redhat.com
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, will@kernel.org, julien.thierry.kdev@gmail.com,
 maz@kernel.org, oliver.upton@linux.dev, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, joey.gouly@arm.com, andre.przywara@arm.com
References: <20250507151256.167769-1-alexandru.elisei@arm.com>
 <20250507151256.167769-14-alexandru.elisei@arm.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20250507151256.167769-14-alexandru.elisei@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EJNiW-TaH2Cor6rMRTc6ye4K6jnEoPPAlUYIIGO8DCQ_1747807380
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
> The --probe-maxsmp parameter updates MAX_SMP with the maximum number of
> VCPUs that the host supports. Qemu will exit with an error when creating a
> virtual machine if the number of VCPUs is exceeded.
> 
> kvmtool behaves differently: it will automatically limit the number of
> VCPUs to the what KVM supports, which is exactly what --probe-maxsmp wants
> to achieve. When doing --probe-maxsmp with kvmtool, print a message
> explaining why it's redundant and don't do anything else.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>

Reviewed-by: Shaoqin Huang <shahuang@redhat.com>

> ---
>   run_tests.sh         |  3 ++-
>   scripts/runtime.bash | 16 ----------------
>   scripts/vmm.bash     | 24 ++++++++++++++++++++++++
>   3 files changed, 26 insertions(+), 17 deletions(-)
> 
> diff --git a/run_tests.sh b/run_tests.sh
> index 150a06a91064..a69c3665b7a4 100755
> --- a/run_tests.sh
> +++ b/run_tests.sh
> @@ -10,6 +10,7 @@ if [ ! -f config.mak ]; then
>   fi
>   source config.mak
>   source scripts/common.bash
> +source scripts/vmm.bash
>   
>   function usage()
>   {
> @@ -90,7 +91,7 @@ while [ $# -gt 0 ]; do
>               list_tests="yes"
>               ;;
>           --probe-maxsmp)
> -            probe_maxsmp
> +            ${vmm_opts[$TARGET:probe_maxsmp]}
>               ;;
>           --)
>               ;;
> diff --git a/scripts/runtime.bash b/scripts/runtime.bash
> index 01ec8eae2bba..a802686c511d 100644
> --- a/scripts/runtime.bash
> +++ b/scripts/runtime.bash
> @@ -209,19 +209,3 @@ function run()
>   
>       return $ret
>   }
> -
> -#
> -# Probe for MAX_SMP, in case it's less than the number of host cpus.
> -#
> -function probe_maxsmp()
> -{
> -	local smp
> -
> -	if smp=$($RUNTIME_arch_run _NO_FILE_4Uhere_ -smp $MAX_SMP |& grep 'SMP CPUs'); then
> -		smp=${smp##* }
> -		smp=${smp/\(}
> -		smp=${smp/\)}
> -		echo "Restricting MAX_SMP from ($MAX_SMP) to the max supported ($smp)" >&2
> -		MAX_SMP=$smp
> -	fi
> -}
> diff --git a/scripts/vmm.bash b/scripts/vmm.bash
> index a1d50ed51981..ef9819f4132c 100644
> --- a/scripts/vmm.bash
> +++ b/scripts/vmm.bash
> @@ -105,6 +105,22 @@ function qemu_parse_premature_failure()
>   	return 0
>   }
>   
> +#
> +# Probe for MAX_SMP, in case it's less than the number of host cpus.
> +#
> +function qemu_probe_maxsmp()
> +{
> +	local smp
> +
> +	if smp=$($RUNTIME_arch_run _NO_FILE_4Uhere_ -smp $MAX_SMP |& grep 'SMP CPUs'); then
> +		smp=${smp##* }
> +		smp=${smp/\(}
> +		smp=${smp/\)}
> +		echo "Restricting MAX_SMP from ($MAX_SMP) to the max supported ($smp)" >&2
> +		MAX_SMP=$smp
> +	fi
> +}
> +
>   function kvmtool_parse_premature_failure()
>   {
>   	local log="$@"
> @@ -114,6 +130,12 @@ function kvmtool_parse_premature_failure()
>   	return 0
>   }
>   
> +function kvmtool_probe_maxsmp()
> +{
> +	echo "kvmtool automatically limits the number of VCPUs to maximum supported"
> +	echo "The 'smp' test parameter won't be modified"
> +}
> +
>   declare -A vmm_opts=(
>   	[qemu:nr_cpus]='-smp'
>   	[qemu:kernel]='-kernel'
> @@ -122,6 +144,7 @@ declare -A vmm_opts=(
>   	[qemu:default_opts]=''
>   	[qemu:fixup_return_code]=qemu_fixup_return_code
>   	[qemu:parse_premature_failure]=qemu_parse_premature_failure
> +	[qemu:probe_maxsmp]=qemu_probe_maxsmp
>   
>   	[kvmtool:nr_cpus]='--cpus'
>   	[kvmtool:kernel]='--kernel'
> @@ -130,6 +153,7 @@ declare -A vmm_opts=(
>   	[kvmtool:default_opts]="$KVMTOOL_DEFAULT_OPTS"
>   	[kvmtool:fixup_return_code]=kvmtool_fixup_return_code
>   	[kvmtool:parse_premature_failure]=kvmtool_parse_premature_failure
> +	[kvmtool:probe_maxsmp]=kvmtool_probe_maxsmp
>   )
>   
>   function check_vmm_supported()

-- 
Shaoqin


