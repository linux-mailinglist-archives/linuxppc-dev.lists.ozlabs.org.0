Return-Path: <linuxppc-dev+bounces-8798-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B282ABEB91
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 07:59:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2LMr2M2nz2ynf;
	Wed, 21 May 2025 15:59:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747807144;
	cv=none; b=nnK4o9XTB0iFhXNrGXIlR9NJiMMmMKeHe7aVmTBQ9dsI/zcwSZxUmWUKGVeRaJp1VLlQd8cGN/A2n3VD2i1MKfSwjd1JLpweOGJH8QtcSbDobUEBBvUAdgq0u+GEqmFlvxxlD1Rg9WIQLS1RAOUYT8m0uIlANXXrhGOPV1LQCGtJDvEYZpPZ04E3//i8zHpwbmXbFbpaID0MtrY3l+KiJuMS3JH3RzhkKRw1sQJ2VXIP9fqln/MRgefvgL2T0BiwQpewZzxqw+vXwy7v60gkQcyXT0NCCZComNtq8mwG89cYHK03ofF3Z0Yh0JFCcTqEwvT6VYbFRfRDIpW18x/fRA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747807144; c=relaxed/relaxed;
	bh=3nX0mf0Fkt78o6JfyiUPx6n9zrKuc9Cy4bOKokl+4+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cWws5QfT2C6V5jyhb63TaoCqqbfp3vIrVNQFNs9UPmUlMJ2cKIjQFFxygFYFGEQkm9eQbFnqHMk7EKQDAljaa2wKHyCQNpRI+Q9auh+x0y7eBbzYaPu6jANcOqDpgBPVggdaRjnaqv6GHz0+1XOccjFLNYNnNxKlbLZhwrvcGjKBBEN9wLeJ1qTFOOW2ZEat/xSSatrPDH5023AbGxiTYqb1vpRWEwzyRbHsFK3ztfgzsHGJh+Ez/EK5tH968cY+z6JBuCjF+3fSwjWyewpAIn/DhGsMuwhborn0ZYE0krPLBOJSK5/eKs4zU7lOfVBulHbhNWnzsjaUhyme4unu6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Tk+Btp5p; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Tk+Btp5p; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=shahuang@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Tk+Btp5p;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Tk+Btp5p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=shahuang@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2LMq0t8Bz2ym0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 15:59:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747807136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3nX0mf0Fkt78o6JfyiUPx6n9zrKuc9Cy4bOKokl+4+0=;
	b=Tk+Btp5pNCFh0tTMWp+jjOh7P59NiOq+Dzme7FcqrxFgge0OKN8Lkps4mzGZxlkmGvJh1p
	+o+4cHlnGCF5Mobe8FTXcFO0iJolcZwZCQ7PIC9D5hZLbJ+65DRVwSYPHd1XfcRLvZNQPU
	oe4bmkOj4Q4E7xq4RylpFfEycmgAHtM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747807136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3nX0mf0Fkt78o6JfyiUPx6n9zrKuc9Cy4bOKokl+4+0=;
	b=Tk+Btp5pNCFh0tTMWp+jjOh7P59NiOq+Dzme7FcqrxFgge0OKN8Lkps4mzGZxlkmGvJh1p
	+o+4cHlnGCF5Mobe8FTXcFO0iJolcZwZCQ7PIC9D5hZLbJ+65DRVwSYPHd1XfcRLvZNQPU
	oe4bmkOj4Q4E7xq4RylpFfEycmgAHtM=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-383-Ar9deF9HPh-5QPcH_jYSMw-1; Wed, 21 May 2025 01:58:52 -0400
X-MC-Unique: Ar9deF9HPh-5QPcH_jYSMw-1
X-Mimecast-MFC-AGG-ID: Ar9deF9HPh-5QPcH_jYSMw_1747807131
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7395d07a3dcso4865815b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 22:58:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747807130; x=1748411930;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3nX0mf0Fkt78o6JfyiUPx6n9zrKuc9Cy4bOKokl+4+0=;
        b=RoNMg6SEMg4mjcGwazjmg/fdoAWOpmT8Z17jnHSVH4GUx5zq1UlskCqY39X0vUPRHe
         0sDO/rcO44GhLQh+qPXjH1ohi8D0cZ3R+bEUQosUf0Edm1KwsHJUpAn6YWvmxzLPSdCS
         4r0UfJ7TdYKhnmBI9DtGpQ1dfCq8jp/ni8WxAEP219jC6AzUXXEnlK5dxvHRse+aXkRR
         jW7hfwKBywAgXZMJwvMaeUx7xHuDmmIWoEHdv7gX+eqxyyITT84B5JOxOnxYAkSt9VUx
         ftyax+JD2pmwTPmYOr2pc8+vg4cOiaIFWFEJWtSqXMI8xvnvXf+AT0UZsAK1VqTHMbng
         bh+w==
X-Forwarded-Encrypted: i=1; AJvYcCUb8jdMjBSSa4CekGhsSbqsuty9VQNctfHdlckMTaznOGYMfIjK3IOk17XidRXUDoL9q8H8MQKTL4iRxXA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxZ+nFucpDDnnpSvvMJY9XoUeFJQtcvTcAbYB7hZs06aL+YfcEr
	/HYFaISmSqooKEBppMrnqyuvX45n0hLMfSwfyFskNPVlNcrfctz8cREWYpunk86bJlKxSivCcZj
	qfuRdAywBU3I+TbBnZKuN67ulxWnmcODIXxHjgjbr9Hk3pMY6IFcn9I/ts4rRPgRceMQ=
X-Gm-Gg: ASbGncs+9XQfJCmxVOc2LIUgJjjzWIClCcZr4UAqOvpsf5JABwbgd8Eu8bGiTFz5qll
	IbDQbQRwMJAZSAEXyf/X8vLFPrvgwk0LQIbY9jATQCjZaD3U1x7Bw80VvisKcnvxfMZs5XdNCF4
	s4VexX+IvTVhdAuFdYvQRnloknZbeiX+4EscnFAXJDyjj3na9QAj5sJGHwwjxj4iA55p3u5vKwY
	Gp22odC5oqalsi3KMGv4TG9tTYmA90UcBFkaWTAXfEmokbXKnXmHqIwjaXCz3//EFr7osO9c2Bq
	gvo9nETSQ7f9QJw=
X-Received: by 2002:a05:6a00:99b:b0:73f:f623:55f8 with SMTP id d2e1a72fcca58-742a9776958mr24169501b3a.5.1747807130591;
        Tue, 20 May 2025 22:58:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGz7QgFo322mqLeqRIQ+QKAfXrUPzgO5kq17+j1FtzB/COn8u/dv5TrNOSm4BX2L/XT0g/pCw==
X-Received: by 2002:a05:6a00:99b:b0:73f:f623:55f8 with SMTP id d2e1a72fcca58-742a9776958mr24169482b3a.5.1747807130253;
        Tue, 20 May 2025 22:58:50 -0700 (PDT)
Received: from [10.72.116.61] ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970c882sm9260119b3a.55.2025.05.20.22.58.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 22:58:49 -0700 (PDT)
Message-ID: <590d9058-7afc-45c7-ac81-68c109dfdad5@redhat.com>
Date: Wed, 21 May 2025 13:58:39 +0800
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
Subject: Re: [kvm-unit-tests PATCH v3 12/16] scripts: Detect kvmtool failure
 in premature_failure()
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
 <20250507151256.167769-13-alexandru.elisei@arm.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20250507151256.167769-13-alexandru.elisei@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yItlBZkiPOMy9gNb2UoBjZMiYZpKu36J4JAdhrT5wro_1747807131
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
> kvm-unit-tests assumes that if the VMM is able to get to where it tries to
> load the kernel, then the VMM and the configuration parameters will also
> work for running the test. All of this is done in premature_failure().
> 
> Teach premature_failure() about the kvmtool's error message when it fails
> to load the dummy kernel.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>

Reviewed-by: Shaoqin Huang <shahuang@redhat.com>

> ---
>   scripts/runtime.bash |  8 +++-----
>   scripts/vmm.bash     | 23 +++++++++++++++++++++++
>   2 files changed, 26 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/runtime.bash b/scripts/runtime.bash
> index 86d8a2cd8528..01ec8eae2bba 100644
> --- a/scripts/runtime.bash
> +++ b/scripts/runtime.bash
> @@ -1,3 +1,5 @@
> +source scripts/vmm.bash
> +
>   : "${RUNTIME_arch_run?}"
>   : "${MAX_SMP:=$(getconf _NPROCESSORS_ONLN)}"
>   : "${TIMEOUT:=90s}"
> @@ -19,11 +21,7 @@ premature_failure()
>   
>       log="$(eval "$(get_cmdline _NO_FILE_4Uhere_)" 2>&1)"
>   
> -    echo "$log" | grep "_NO_FILE_4Uhere_" |
> -        grep -q -e "[Cc]ould not \(load\|open\) kernel" \
> -                -e "error loading" \
> -                -e "failed to load" &&
> -        return 1
> +    ${vmm_opts[$TARGET:parse_premature_failure]} "$log" || return 1
>   
>       RUNTIME_log_stderr <<< "$log"
>   
> diff --git a/scripts/vmm.bash b/scripts/vmm.bash
> index d24a4c4b8713..a1d50ed51981 100644
> --- a/scripts/vmm.bash
> +++ b/scripts/vmm.bash
> @@ -93,6 +93,27 @@ kvmtool_fixup_return_code()
>   	echo $ret
>   }
>   
> +function qemu_parse_premature_failure()
> +{
> +	local log="$@"
> +
> +	echo "$log" | grep "_NO_FILE_4Uhere_" |
> +		grep -q -e "[Cc]ould not \(load\|open\) kernel" \
> +			-e "error loading" \
> +			-e "failed to load" &&
> +		return 1
> +	return 0
> +}
> +
> +function kvmtool_parse_premature_failure()
> +{
> +	local log="$@"
> +
> +	echo "$log" | grep "Fatal: Unable to open kernel _NO_FILE_4Uhere_" &&
> +		return 1
> +	return 0
> +}
> +
>   declare -A vmm_opts=(
>   	[qemu:nr_cpus]='-smp'
>   	[qemu:kernel]='-kernel'
> @@ -100,6 +121,7 @@ declare -A vmm_opts=(
>   	[qemu:initrd]='-initrd'
>   	[qemu:default_opts]=''
>   	[qemu:fixup_return_code]=qemu_fixup_return_code
> +	[qemu:parse_premature_failure]=qemu_parse_premature_failure
>   
>   	[kvmtool:nr_cpus]='--cpus'
>   	[kvmtool:kernel]='--kernel'
> @@ -107,6 +129,7 @@ declare -A vmm_opts=(
>   	[kvmtool:initrd]='--initrd'
>   	[kvmtool:default_opts]="$KVMTOOL_DEFAULT_OPTS"
>   	[kvmtool:fixup_return_code]=kvmtool_fixup_return_code
> +	[kvmtool:parse_premature_failure]=kvmtool_parse_premature_failure
>   )
>   
>   function check_vmm_supported()

-- 
Shaoqin


