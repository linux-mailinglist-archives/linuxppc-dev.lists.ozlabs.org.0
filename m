Return-Path: <linuxppc-dev+bounces-8568-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 606A6AB6517
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 May 2025 10:02:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zy5Rb0M9gz2yrK;
	Wed, 14 May 2025 18:02:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747209754;
	cv=none; b=k1+Rg7O4XBMqJbyQ59mzz0KLh4g5R9YXUEZ5hsVvVW2eEK4FrrDzZlde3dvu9pKUxp1/qe54DtoZnjAHJs7cK8PcCLuVOz4U0FkchvyZRQjnlu4u79aXd+cetGUTamKgH8+ycWWO+d5dczwYIZgYmeWw7Cx2jOQM6On3xXvyvgQb7EJrNIv3QIR74/qEv3DbsCiz98HlHSuo9iQ6KVEYTbfVDnk0wpl4onZX294mDHnGd/gOiu8SNN9npCn1/Ab+bB1uVnVe4a2SlmXSLR89mNG5EO6iRoaPvnkG9mdsZGMgoawBHXrnVZilzrgp+tEdW/55S4QciqQfA8xOuNms+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747209754; c=relaxed/relaxed;
	bh=ET5iCd8MyKLHEGzFDUiYbW8pYPvNTTRlK86QIMS0syE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eHHF+VpKQ6C6Eb1+d8VxbM0xYIqrYSTiDlBRLwRzhxqTqoa19Zn9v0q96mfPXahF7ApW9DCCcTJH2RU6YyWKrvVW7F8rxTlnsRtl5jPL21ODrnZbjdQVdRUVEDNRN7BRAYmJEAbwEK09dl0rBHb8WWRb7ViZFyt8FuQQIJNGoOAjYBmiY7qzod/SyUZqvgCuW5sjjOzkuVwyCoCDEaQQj8bmejeMX4nJC1FfYMT5etEboEzIJEqkK2ADj4zxczx9Zw29TY3aqc3MyjSYjNJJbAyXla2syeS/H9CGeS4E6UHMqilk7RApbrAvZFKpZRfAC9TGsjo8RFYLOqDC5+yByw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f5iKnZwl; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f5iKnZwl; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=shahuang@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f5iKnZwl;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f5iKnZwl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=shahuang@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zy5RZ1F67z2yqW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 18:02:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747209750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ET5iCd8MyKLHEGzFDUiYbW8pYPvNTTRlK86QIMS0syE=;
	b=f5iKnZwlTMu7+mIg7ea/9D2d1TOsbo/VtbuzCeYr2LG+vlV8+9iap4jXWFo+BMU5OxTfo7
	Y/33lnBpUTkemgCMeIWnUJGTVbOUoxW6Z8WLnLvFz5QPEv81lnZpx0BgKDQ/da4DTnhj9l
	RNd2ywibDDUGqu9+8cazuHTGmHqMoPQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747209750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ET5iCd8MyKLHEGzFDUiYbW8pYPvNTTRlK86QIMS0syE=;
	b=f5iKnZwlTMu7+mIg7ea/9D2d1TOsbo/VtbuzCeYr2LG+vlV8+9iap4jXWFo+BMU5OxTfo7
	Y/33lnBpUTkemgCMeIWnUJGTVbOUoxW6Z8WLnLvFz5QPEv81lnZpx0BgKDQ/da4DTnhj9l
	RNd2ywibDDUGqu9+8cazuHTGmHqMoPQ=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-542-v96msjjeMlikurkOm2xcuA-1; Wed, 14 May 2025 04:02:28 -0400
X-MC-Unique: v96msjjeMlikurkOm2xcuA-1
X-Mimecast-MFC-AGG-ID: v96msjjeMlikurkOm2xcuA_1747209747
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7424d8944b6so484473b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 01:02:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747209747; x=1747814547;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ET5iCd8MyKLHEGzFDUiYbW8pYPvNTTRlK86QIMS0syE=;
        b=M6X27W8ubofcHde6CHKiw6lzNT0mUrKUL83ZQiWEhL3VVeHsm+YkLgSuOo0kRE4Ecc
         uUVq3EftiBW3atghEytUVRZb6aOniltzVOQvXfGPtdYPf23/PKrgtY+pdY60Pc7yxHA9
         wlUDI/IvMxX2BwNG5eNRDWnNEx2mdLsvICY/7Z8CfE4rKhdo/Q+7AV2GQgkln68W1ME/
         WhbESLuWD3MkNZitYxzv1Kgqd8j8CeDTElDVmFZcJopw4tzu4bVIWUfFRLwuRPlXqkWo
         Jo58MouFtMc6O8EFW5gHgpURq0glzEZURlwGFEkkaZ4ah0+PjQ39B93ajP03Rl6954Rz
         v/3g==
X-Forwarded-Encrypted: i=1; AJvYcCUWY8EwbsVBQQ2KNYkkFpj519EMk2uENT8vPedH5UEhFxuNcmZhJvPZ3djKwsm23Zut//BOYpWAD0ocyWU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxXF3cF3vAJLou6QqOfrqYPkIL0c7xmL0pqoIoRkKe+ao/Iv8JN
	4cLc8gJuod8/NOxDlaDY3+zsNgMvgWvXGiCzaKMZzpAzzSnJrs+mBKPXAeP92Q9pvAWTQox6/r7
	M9ia/VVFLV4kXX+G0CYzvQp7kEKO9zEBvUcZSgVQKDCRZLP42iW3haUk60J+SW9o=
X-Gm-Gg: ASbGnctMgpbWRq4dymFQlaZzQSagHy29yoJ2A32sJCWBuqNtwqrYZbAletQhstG+fxr
	xLhfgrCcGvYxmDvrmJfZ7oju+Jg9DqVqPtpR0DsqPx2BE0yZSzJK6vnHDNzufr1hp/YiShp1YKk
	m2xFiYsoIZGbqi1MC9zIiVJ+5EnYO6eniRMaS2b1cfvgQFQSW2dj9AeppecVA8CmcPdSNwZ4+Vu
	PMwlfk+zbQj+6i9YbfG/A+Zggl8kesYNBmsAdr+rLPUvs9LfYY2ju2kP5CmbXKMzcgAr6tWJJrh
	J5CtP+y3c/6FjZJx
X-Received: by 2002:a05:6a00:811a:b0:736:4c3d:2cba with SMTP id d2e1a72fcca58-7427917883cmr7436394b3a.9.1747209747404;
        Wed, 14 May 2025 01:02:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwhqdQhP9GhHKMFywwgH/LIw6XImxil66dwro2onM7heCubGabPHGV/eyERLOa/TP3h81BbA==
X-Received: by 2002:a05:6a00:811a:b0:736:4c3d:2cba with SMTP id d2e1a72fcca58-7427917883cmr7436362b3a.9.1747209747028;
        Wed, 14 May 2025 01:02:27 -0700 (PDT)
Received: from [10.72.116.125] ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7423772752csm8775799b3a.45.2025.05.14.01.02.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 01:02:26 -0700 (PDT)
Message-ID: <74a90a55-80ae-45ff-9b37-7cb2771ed0e0@redhat.com>
Date: Wed, 14 May 2025 16:02:17 +0800
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
Subject: Re: [kvm-unit-tests PATCH v3 07/16] scripts: Use an associative array
 for qemu argument names
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
 <20250507151256.167769-8-alexandru.elisei@arm.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20250507151256.167769-8-alexandru.elisei@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uBQO8wU25bPrypGrIYcfjczHHD6OdXMroSJPGhiRtPY_1747209747
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
> Move away from hardcoded qemu arguments and use instead an associative
> array to get the needed arguments. This paves the way for adding kvmtool
> support to the scripts, which has a different syntax for the same VM
> configuration parameters.
> 
> Suggested-by: Andrew Jones <andrew.jones@linux.dev>
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>

Reviewed-by: Shaoqin Huang <shahuang@redhat.com>

> ---
>   scripts/common.bash  | 10 +++++++---
>   scripts/runtime.bash |  7 +------
>   scripts/vmm.bash     |  7 +++++++
>   3 files changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/scripts/common.bash b/scripts/common.bash
> index 9deb87d4050d..649f1c737617 100644
> --- a/scripts/common.bash
> +++ b/scripts/common.bash
> @@ -1,4 +1,5 @@
>   source config.mak
> +source scripts/vmm.bash
>   
>   function for_each_unittest()
>   {
> @@ -26,8 +27,11 @@ function for_each_unittest()
>   				$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$test_args" "$opts" "$arch" "$machine" "$check" "$accel" "$timeout"
>   			fi
>   			testname=$rematch
> -			smp=1
> +			smp="${vmm_opts[$TARGET:nr_cpus]} 1"
>   			kernel=""
> +			# Intentionally don't use -append if test_args is empty
> +			# because qemu interprets the first argument after
> +			# -append as a kernel parameter.
>   			test_args=""
>   			opts=""
>   			groups=""
> @@ -39,9 +43,9 @@ function for_each_unittest()
>   		elif [[ $line =~ ^file\ *=\ *(.*)$ ]]; then
>   			kernel=$TEST_DIR/${BASH_REMATCH[1]}
>   		elif [[ $line =~ ^smp\ *=\ *(.*)$ ]]; then
> -			smp=${BASH_REMATCH[1]}
> +			smp="${vmm_opts[$TARGET:nr_cpus]} ${BASH_REMATCH[1]}"
>   		elif [[ $line =~ ^test_args\ *=\ *(.*)$ ]]; then
> -			test_args=${BASH_REMATCH[1]}
> +			test_args="${vmm_opts[$TARGET:args]} ${BASH_REMATCH[1]}"
>   		elif [[ $line =~ ^(extra_params|qemu_params)\ *=\ *'"""'(.*)$ ]]; then
>   			opts=${BASH_REMATCH[2]}$'\n'
>   			while read -r -u $fd; do
> diff --git a/scripts/runtime.bash b/scripts/runtime.bash
> index 06cc58e79b69..86d8a2cd8528 100644
> --- a/scripts/runtime.bash
> +++ b/scripts/runtime.bash
> @@ -34,7 +34,7 @@ premature_failure()
>   get_cmdline()
>   {
>       local kernel=$1
> -    echo "TESTNAME=$testname TIMEOUT=$timeout MACHINE=$machine ACCEL=$accel $RUNTIME_arch_run $kernel -smp $smp $opts"
> +    echo "TESTNAME=$testname TIMEOUT=$timeout MACHINE=$machine ACCEL=$accel $RUNTIME_arch_run $kernel $smp $test_args $opts"
>   }
>   
>   skip_nodefault()
> @@ -88,11 +88,6 @@ function run()
>       local accel="${10}"
>       local timeout="${11:-$TIMEOUT}" # unittests.cfg overrides the default
>   
> -    # If $test_args is empty, qemu will interpret the first option after -append
> -    # as a kernel parameter instead of a qemu option, so make sure the -append
> -    # option is used only if $test_args is not empy.
> -    [ -n "$test_args" ] && opts="-append $test_args $opts"
> -
>       if [ "${CONFIG_EFI}" == "y" ]; then
>           kernel=${kernel/%.flat/.efi}
>       fi
> diff --git a/scripts/vmm.bash b/scripts/vmm.bash
> index 39325858c6b3..b02055a5c0b6 100644
> --- a/scripts/vmm.bash
> +++ b/scripts/vmm.bash
> @@ -1,5 +1,12 @@
>   source config.mak
>   
> +declare -A vmm_opts=(
> +	[qemu:nr_cpus]='-smp'
> +	[qemu:kernel]='-kernel'
> +	[qemu:args]='-append'
> +	[qemu:initrd]='-initrd'
> +)
> +
>   function check_vmm_supported()
>   {
>   	case "$TARGET" in

-- 
Shaoqin


