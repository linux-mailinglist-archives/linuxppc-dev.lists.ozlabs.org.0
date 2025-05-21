Return-Path: <linuxppc-dev+bounces-8796-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 459F0ABEA62
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 05:21:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2GtR3tl1z2yj1;
	Wed, 21 May 2025 13:21:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747797711;
	cv=none; b=HIF1hTCG8iZmzTqOdsuF4/Pj40xhiyc2QOwGtSDXyuq3DKPWjmqtx6aJWZKDcDOHLVF4SS1oH8Sb/x4tOkpEjbuK9AHWwxbMpdcu6mp9xbWjyJTDFhCIXLrmHBTUlols33OFDIiIHUP5apntJT7b/4OKazGCrkNfYMH3rd2jRzC6ntHykiKSF0bTvetEoK3SAUQ6L+dcZaaV72yGGOOPXMONzqBzYYWpK8hHgGwlNRkDquy9Ioh/C9E+XOF+bWydE6jCHnpUZG/oKOPska3HLC8SBfXg2nZ8Pxv8Wfugf6b3TSetGPOfschWkkqbiXkRrjtboI1L6BtrDqzA8Gbofw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747797711; c=relaxed/relaxed;
	bh=jUSOmA0/3Qa3aXRPXfKpDedwfKwE88WYumy/XPPRjQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c8s/w/dLAL+doc590eQygjndwemWjtlYY7AU+31ypimYgA4ythaLkzARuI45zn7wV5I2Wrr1Imu6ehC6Rci5aoj+It/vTcUSh5VT+c8cHenp6d6dnimzrbHhKL91eDPoKx1CrcgXFMZlLSDeM1MMYIkASHawpvBHsBqp7Z5GO0jpGIKagTmZL4baPNbSGpHjoTMXDwZq6kCWgQxpPRYKwrmHa9pLg/n9gAWaZqeATgY5Tt4db+cO7BRmmEEx2UTwjrl73Aji0b71ZNxPB+ED/GXgug+9PwWOTvRTvplEfSoT5yKr/9qJWyGNBX5s0enLIsjREEi9UDgfhnJZ91HcpQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Yk1eRWUg; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GudJ7Zcw; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=shahuang@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Yk1eRWUg;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GudJ7Zcw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=shahuang@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2GtQ096Qz2yhY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 13:21:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747797704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jUSOmA0/3Qa3aXRPXfKpDedwfKwE88WYumy/XPPRjQc=;
	b=Yk1eRWUg+8aP5V7Q/RPQn5iKM+ypyPmDn+zd/rfLApBHQ6I9MuOXMxC16lgoiXuNERdx+W
	xmUYtnRer5vGzAWqKpoB/sFXDR8rsI36Ucbh5/SHV2ZxMLFHU3GemL+uI6Evkcpe3s/GI/
	wXA/jVuzWzeuTMUPVrXVTINAgPqaRaM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747797705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jUSOmA0/3Qa3aXRPXfKpDedwfKwE88WYumy/XPPRjQc=;
	b=GudJ7Zcwm9d/r6bQaO7HOr+WcHBwJNRxctD6Ll8D8SrCuLHJ54AkWY+BNPm18sUDmB6Huq
	/K8egB49qtZTbl1GsB7uNVNgmW4s4oCXUXCDdku5MG9McRkNwz75TCqyT9wJnuXU2WhKtb
	VN7FE7Dt3gSlu6D/XFup2E0OfKzZtJk=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-338-fZXCC-fpOMioXfjnGb1SlA-1; Tue, 20 May 2025 23:21:40 -0400
X-MC-Unique: fZXCC-fpOMioXfjnGb1SlA-1
X-Mimecast-MFC-AGG-ID: fZXCC-fpOMioXfjnGb1SlA_1747797699
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-231d7f59e03so56098205ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 20:21:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747797699; x=1748402499;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jUSOmA0/3Qa3aXRPXfKpDedwfKwE88WYumy/XPPRjQc=;
        b=BSZ49X3t7q5ApMyhiLB+6pczUa7gbF5K7uvgHoYBz7hTlQKKYHjNMeNQU/1H2UI7R+
         peSzHI0/pStMTdh0xohraimM/6mlin7zzJlO52pGQ4nwTCWYiU/isoknYk8znxgeCzAh
         EvBUi7AhRbKJYWA05GzoY6EU+XZ6L4XX2L9pRfjxPW5iHHlSGT1AAoKyDhHu9sjJJW7m
         kDHlj9OBnwTVTHSdsBTl2jK7fB9OqUmtpVmjCWPXN/+h8fy6biIuQddRPpO+GvJn8oyK
         Tkhlk3eqZP0LhSKD9kc3hSJ/obthAnUbafIF9powW8fGsClwb0qr/IesFTT5yD6cvV7W
         Y60A==
X-Forwarded-Encrypted: i=1; AJvYcCWOXHb8LgEyktwCf8191anaCgBRCVSwj5oecXGketFa87yHFRws/NDsTtf25y4wRTe3KYWmOhQLzOz5h70=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxzLOUPC25mqDdI77C2xj1ia5aDYbGONUzpYaZRU4AmSjePZpRY
	AsKQUuMaP2slFUpKCVZQVTShl2Sfi9cV9g6IXZ9+kTDed4kBgCCUpUcDmA9TtB6W5OCqRsW1BN5
	TvVkI+K24X1sbCpPS1MeSGgIgdJwYsbvjqPcVYPtA2yxUClgL+jH/esshnQDtI+JevRk=
X-Gm-Gg: ASbGnctoS/RVoAaTH+EfAe6pc0xkGXsz6KoKL6buCUGnvcYn29c2qzwoOJXQBkopZC6
	lIRKT5jnl4t8a4kCslD5r8KIKAWnjNc7f519L1H83Jw87xtu9ShqWAO0zoAKXTkIXrs5XNBBFn7
	r6ITeAjRg7qIdHcq8VxNJPb+WKuVq4Plm85+1WDdLvAs4sVjS94QR5ZzV2OOHatzOXYStI3H89j
	4s0tqivPxAxrjkQ+jZnWeQRqXgFeYGp7yj1ljfvdYpB92MStRUTfDFxApW05rBGiuHfU3dgiUVY
	wTMTghW3tc/4VNA=
X-Received: by 2002:a17:902:d481:b0:232:4f8c:1b01 with SMTP id d9443c01a7336-2324f8c1cb2mr137961645ad.43.1747797699284;
        Tue, 20 May 2025 20:21:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlhvOC0UNtRC7lIlfulUbJxFqkdOC7pIWuh5IMs24BhyaPmpuqy0MrBWfWyaOHGCOUkRmRPA==
X-Received: by 2002:a17:902:d481:b0:232:4f8c:1b01 with SMTP id d9443c01a7336-2324f8c1cb2mr137961065ad.43.1747797698773;
        Tue, 20 May 2025 20:21:38 -0700 (PDT)
Received: from [10.72.116.61] ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e9784bsm83924955ad.113.2025.05.20.20.21.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 20:21:38 -0700 (PDT)
Message-ID: <79d7ee71-a68a-4cde-8796-fb42df59cfce@redhat.com>
Date: Wed, 21 May 2025 11:21:28 +0800
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
Subject: Re: [kvm-unit-tests PATCH v3 10/16] scripts: Add default arguments
 for kvmtool
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
 <20250507151256.167769-11-alexandru.elisei@arm.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20250507151256.167769-11-alexandru.elisei@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qCoUiO4FEPLlpHP-CQHIgIyiCRyMBJX6q98KmYnL1zo_1747797699
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
> kvmtool, unless told otherwise, will do its best to make sure that a kernel
> successfully boots in a virtual machine. It does things like automatically
> creating a rootfs and adding extra parameters to the kernel command line.
> This is actively harmful to kvm-unit-tests, because some tests parse the
> kernel command line and they will fail if they encounter the options added
> by kvmtool.
> 
> Fortunately for us, kvmtool commit 5613ae26b998 ("Add --nodefaults command
> line argument") addded the --nodefaults kvmtool parameter which disables
> all the implicit virtual machine configuration that cannot be disabled by
> using other parameters, like modifying the kernel command line. So always
> use --nodefaults to allow a test to run.
> 
> kvmtool can also be too verbose when running a virtual machine, and this is
> controlled by several parameters. Add those to the default kvmtool command
> line to reduce this verbosity to a minimum.
> 
> Before:
> 
> $ vm run arm/selftest.flat --cpus 2 --mem 256 --params "setup smp=2 mem=256"
> Info: # lkvm run -k arm/selftest.flat -m 256 -c 2 --name guest-5035
> Unknown subtest
> 
> EXIT: STATUS=127
> Warning: KVM compatibility warning.
>      virtio-9p device was not detected.
>      While you have requested a virtio-9p device, the guest kernel did not initialize it.
>      Please make sure that the guest kernel was compiled with CONFIG_NET_9P_VIRTIO=y enabled in .config.
> Warning: KVM compatibility warning.
>      virtio-net device was not detected.
>      While you have requested a virtio-net device, the guest kernel did not initialize it.
>      Please make sure that the guest kernel was compiled with CONFIG_VIRTIO_NET=y enabled in .config.
> Info: KVM session ended normally.
> 
> After:
> 
> $ vm run arm/selftest.flat --nodefaults --network mode=none --loglevel=warning --cpus 2 --mem 256 --params "setup smp=2 mem=256"
> PASS: selftest: setup: smp: number of CPUs matches expectation
> INFO: selftest: setup: smp: found 2 CPUs
> PASS: selftest: setup: mem: memory size matches expectation
> INFO: selftest: setup: mem: found 256 MB
> SUMMARY: 2 tests
> 
> EXIT: STATUS=1
> 
> Note that KVMTOOL_DEFAULT_OPTS can be overwritten by an environment
> variable with the same name, but it's not documented in the help string for
> run_tests.sh. This has been done on purpose, since overwritting
> KVMTOOL_DEFAULT_OPTS should only be necessary for debugging or development
> purposes.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>   scripts/common.bash | 10 +++++-----
>   scripts/vmm.bash    | 13 +++++++++++++
>   2 files changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/scripts/common.bash b/scripts/common.bash
> index 0645235d8baa..ee0ae71948c2 100644
> --- a/scripts/common.bash
> +++ b/scripts/common.bash
> @@ -56,7 +56,7 @@ function for_each_unittest()
>   			# because qemu interprets the first argument after
>   			# -append as a kernel parameter.
>   			test_args=""
> -			opts=""
> +			opts="${vmm_opts[$TARGET:default_opts]}"
>   			groups=""
>   			arch=""
>   			machine=""
> @@ -70,13 +70,13 @@ function for_each_unittest()
>   		elif [[ $line =~ ^test_args\ *=\ *(.*)$ ]]; then
>   			test_args="${vmm_opts[$TARGET:args]} ${BASH_REMATCH[1]}"
>   		elif [[ $TARGET = "qemu" ]] && [[ $line =~ ^(extra_params|qemu_params)\ *=\ *'"""'(.*)$ ]]; then
> -			opts=$(parse_opts ${BASH_REMATCH[2]}$'\n' $fd)
> +			opts="${vmm_opts[$TARGET:default_opts]} $(parse_opts ${BASH_REMATCH[2]}$'\n' $fd)"
>   		elif [[ $TARGET  = "qemu" ]] && [[ $line =~ ^(extra_params|qemu_params)\ *=\ *(.*)$ ]]; then
> -			opts=${BASH_REMATCH[2]}
> +			opts="${vmm_opts[$TARGET:default_opts]} ${BASH_REMATCH[2]}"
>   		elif [[ $TARGET = "kvmtool" ]] && [[ $line =~ ^kvmtool_params\ *=\ *'"""'(.*)$ ]]; then
> -			opts=$(parse_opts ${BASH_REMATCH[1]}$'\n' $fd)
> +			opts="${vmm_opts[$TARGET:default_opts]} $(parse_opts ${BASH_REMATCH[1]}$'\n' $fd)"
>   		elif [[ $TARGET = "kvmtool" ]] && [[ $line =~ ^kvmtool_params\ *=\ *(.*)$ ]]; then
> -			opts=${BASH_REMATCH[1]}
> +			opts="${vmm_opts[$TARGET:default_opts]} ${BASH_REMATCH[1]}"
>   		elif [[ $line =~ ^groups\ *=\ *(.*)$ ]]; then
>   			groups=${BASH_REMATCH[1]}
>   		elif [[ $line =~ ^arch\ *=\ *(.*)$ ]]; then
> diff --git a/scripts/vmm.bash b/scripts/vmm.bash
> index 20968f2e6b10..d24a4c4b8713 100644
> --- a/scripts/vmm.bash
> +++ b/scripts/vmm.bash
> @@ -1,5 +1,16 @@
>   source config.mak
>   
> +# The following parameters are enabled by default when running a test with
> +# kvmtool:
> +# --nodefaults: suppress VM configuration that cannot be disabled otherwise
> +#               (like modifying the supplied kernel command line). Tests that
> +#               use the command line will fail without this parameter.

Maybe change it to below is better? (Put the 'Otherwise' to the next 
paragraph)

# --nodefaults: suppress VM configuration that cannot be disabled
#               (like modifying the supplied kernel command line). 	# 
            Otherwise tests that use the command line will fail
#               without this parameter.

Others looks good to me.

Reviewed-by: Shaoqin Huang <shahuang@redhat.com>

> +# --network mode=none: do not create a network device. kvmtool tries to help the
> +#               user by automatically create one, and then prints a warning
> +#               when the VM terminates if the device hasn't been initialized.
> +# --loglevel=warning: reduce verbosity
> +: "${KVMTOOL_DEFAULT_OPTS:="--nodefaults --network mode=none --loglevel=warning"}"
> +
>   ##############################################################################
>   # qemu_fixup_return_code translates the ambiguous exit status in Table1 to that
>   # in Table2.  Table3 simply documents the complete status table.
> @@ -87,12 +98,14 @@ declare -A vmm_opts=(
>   	[qemu:kernel]='-kernel'
>   	[qemu:args]='-append'
>   	[qemu:initrd]='-initrd'
> +	[qemu:default_opts]=''
>   	[qemu:fixup_return_code]=qemu_fixup_return_code
>   
>   	[kvmtool:nr_cpus]='--cpus'
>   	[kvmtool:kernel]='--kernel'
>   	[kvmtool:args]='--params'
>   	[kvmtool:initrd]='--initrd'
> +	[kvmtool:default_opts]="$KVMTOOL_DEFAULT_OPTS"
>   	[kvmtool:fixup_return_code]=kvmtool_fixup_return_code
>   )
>   

-- 
Shaoqin


