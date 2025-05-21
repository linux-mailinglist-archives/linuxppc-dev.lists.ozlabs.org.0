Return-Path: <linuxppc-dev+bounces-8801-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 401A1ABEBDD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 08:21:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2Ls65mM2z3blC;
	Wed, 21 May 2025 16:20:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747808458;
	cv=none; b=AF8Xt1W2cjlpHNSORY4WECtAOD5//p9K50Wg7mY88UVSQVUJX/Oqe14ts/1U0OWTqw0RKVvTTYI/r8MvCthBpGQiRDn9T3/esnMYd1spbEVebM6eEPPHPIgrHYhZfj2+GL0wwcO+lBWQ/m5BxAntNKEqS0wWixHGZVwGOTA3fTTVuX/j3l4NLYatUwgnkyL1NlYblxqOOeBQdoMYsetf3KwfgmlGLWreohpN/Ngh7rdnSjyODiAK0+AmCtqYgpeoKvbgaIYAx1RpN0MY2dQ9ID8UoZUUL9oL3gLdwb7ZAMB1foQTRSIzgVljTDsuCBnEIV8wN0Xr1YuGUC4UDpayYg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747808458; c=relaxed/relaxed;
	bh=27vdWwqXm6Qw7dfKd1dwnOUfre6U0zDeEbDFMcZZEZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LZ/oQW1qXeBef20V+TijNEUZ5von1HUYJA23FJvtqwnWy3EgYFw4dC1X2LFcRzqGM8Jrphe0pqFUJySZBhHowhQkmogOhf5S/0reMMP2BYEkhwdQwXB5Ze/x4ij5rG0tI7orYhSeGkU1nvvf3wc4z7plplnqNV4pNxtJaqEdZOEjfLGAOGoPu3SHs2o8dAJ5npcTrjvv+r85p8wCp6SMy6dTeymrfTv9Swce3XPKG3mgEkpLD+jhZgAI/aDELi8muvw9HZh0CZEZmIaoVxJ3HtHUZxHEwn4AK5sp8UCYX6PnOYDaL++frcIdlBXWt3o9NCi17bmwYZ5/hpTt3iqisg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VimMleUa; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VimMleUa; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=shahuang@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VimMleUa;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VimMleUa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=shahuang@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2Ls33384z2yyJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 16:20:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747808452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=27vdWwqXm6Qw7dfKd1dwnOUfre6U0zDeEbDFMcZZEZY=;
	b=VimMleUakX6xZfFRzYsVi4x2wleY1XiKaN+NDL/b2811fwSBRCtURflCfTDOWaCSeYz6oD
	nEGwtvJZ5S1XojtA3Lgz1J9dkYReLoGFOIsTCjbekkrHjD0VYfq9o+In0+ghM1znCaoBUW
	9ZBBZB2Fz0yqHLfaoipKjPRiiQb2rf4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747808452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=27vdWwqXm6Qw7dfKd1dwnOUfre6U0zDeEbDFMcZZEZY=;
	b=VimMleUakX6xZfFRzYsVi4x2wleY1XiKaN+NDL/b2811fwSBRCtURflCfTDOWaCSeYz6oD
	nEGwtvJZ5S1XojtA3Lgz1J9dkYReLoGFOIsTCjbekkrHjD0VYfq9o+In0+ghM1znCaoBUW
	9ZBBZB2Fz0yqHLfaoipKjPRiiQb2rf4=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-184-sYtG1VFHNp6Xejg8IUb1ig-1; Wed, 21 May 2025 02:20:48 -0400
X-MC-Unique: sYtG1VFHNp6Xejg8IUb1ig-1
X-Mimecast-MFC-AGG-ID: sYtG1VFHNp6Xejg8IUb1ig_1747808448
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-30e8425926eso7069493a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 23:20:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747808448; x=1748413248;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=27vdWwqXm6Qw7dfKd1dwnOUfre6U0zDeEbDFMcZZEZY=;
        b=AA1beBu31scVHkFJjrkXzyqz4gaRNvhXVp9pUzLneXiEyAxdY5rgXdjWHxVjO7aOqu
         zkY60y4lalDja2IzAwPWIwUm73YcsCSzHCMWU7F39Fk2tNs6p1TsPD0qpKU26AUFB1wk
         3BOZI+7ZkR/rtMP2R3rBo87nJ5b8nKCTt5cJlZfWCikgTxPg4OTvOQ3p4+JeIwff2LMJ
         92ce91XYQ69OsEMDc8oOERiu187WfI4kY1CCx30u6nU1gxk8iTFTyBC9GrX/uslewPzR
         4m26C2MhiskBd6zBrmTSYEHk3xuBzCklriQZww4gdLxEkE5rwSPWFph3Fu8YsU+hON+C
         XDlg==
X-Forwarded-Encrypted: i=1; AJvYcCU+i3cjiGb5yGySlBazUQH7sYn3qyKXZllueBu2o5lNWyPkXAVv/Rc7/tsznINi7DuIH4o6c0iggB+NYQE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz7aW9inVTNVVP2PhHGEjPfDlip+FyxjhbS/v8FMd697wrncya6
	+6uWdiCr1DIEhJdi+TYMOYsHiaqD2z82OyVL9ROG2KBxAzKHljNwocu7VOmMIrfQZGdhTcXgv4Y
	0knp5IOr0cT6Jj8P9k9OB2RaQ8UJwPwzZWy4+jJLmEp4t1g/9MSSxy1dBtqt4A3PGFu0=
X-Gm-Gg: ASbGncvrIY3JpHUIssHI0YANIxyqLOB9VxI5HAyxBeywuNAenswxKVlJMrBgWbyogLP
	IcPcaOiMtZh1WwHHtJXFrG6cPrRvAZ1tkumseY9/aPj0syjJ+2JciLfKe5xkRmA0WdFLhW9mySZ
	eWy9rml2m8fFpy1MHXXRPn7IGDwwWbTGs53TFvprqsKNTYqDDEqU8xpUZHKxwU53VwuY0p/LvYq
	5MOhkn5nfPjZ7gdQTmTzm45XkbouySvgyj7RFklqvOyildkloYeT40NxPKm0GG/4NIJvWhBn32c
	BltKwIXIvPt1Ixg=
X-Received: by 2002:a17:90b:35ca:b0:2fe:baa3:b8bc with SMTP id 98e67ed59e1d1-30e832258eamr23096816a91.23.1747808447862;
        Tue, 20 May 2025 23:20:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCcJqZvem5ZOsw0GUieRAaMuIKN6FQwGBBKSGgLmmfZRpS0KvtQJGPwRUgMl3I4UcNRsWE9Q==
X-Received: by 2002:a17:90b:35ca:b0:2fe:baa3:b8bc with SMTP id 98e67ed59e1d1-30e832258eamr23096785a91.23.1747808447373;
        Tue, 20 May 2025 23:20:47 -0700 (PDT)
Received: from [10.72.116.61] ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365b2d8fsm2847557a91.7.2025.05.20.23.20.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 23:20:46 -0700 (PDT)
Message-ID: <5b284638-2082-4d85-9e4d-4514ee15e193@redhat.com>
Date: Wed, 21 May 2025 14:20:37 +0800
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
Subject: Re: [kvm-unit-tests PATCH v3 16/16] scripts: Enable kvmtool
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
 <20250507151256.167769-17-alexandru.elisei@arm.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20250507151256.167769-17-alexandru.elisei@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: T6fYaIR5limEt1jVw_kmjeqYI7JAyjUkvNJIqUFcC_8_1747808448
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
> Everything is in place to run the tests using kvmtool:
> 
> $ ./configure --target=kvmtool
> $ make clean && make
> $ KVMTOOL=<path/to/kvmtool> ./run_tests.sh
> 
> so enable it, and remove ERRATA_FORCE=y when configuring for kvmtool,
> because the runner will generate and pass the correct environment to
> kvmtool.
> 
> Missing is support for EFI tests. That's because distros don't ship a

Missing should be Nothing?

> EDK2 binary compiled for kvmtool, and on top of that kvm-unit-tests as
> an EFI app hasn't been tested to work with kvmtool.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>

Reviewed-by: Shaoqin Huang <shahuang@redhat.com>

> ---
>   README.md        | 18 +++++++++++++++++-
>   arm/efi/run      |  5 +++++
>   configure        |  1 -
>   scripts/vmm.bash |  2 +-
>   4 files changed, 23 insertions(+), 3 deletions(-)
> 
> diff --git a/README.md b/README.md
> index be07dc28a094..723ce04cd978 100644
> --- a/README.md
> +++ b/README.md
> @@ -65,6 +65,9 @@ or:
>   
>   to run them all.
>   
> +All tests can be run using QEMU. On arm and arm64, tests can also be run using
> +kvmtool.
> +
>   By default the runner script searches for a suitable QEMU binary in the system.
>   To select a specific QEMU binary though, specify the QEMU=path/to/binary
>   environment variable:
> @@ -78,12 +81,25 @@ ACCEL=name environment variable:
>   
>   For running tests that involve migration from one QEMU instance to another
>   you also need to have the "ncat" binary (from the nmap.org project) installed,
> -otherwise the related tests will be skipped.
> +otherwise the related tests will be skipped. kvmtool does not support migration.
> +
> +As for running a test with kvmtool, please configure kvm-unit-tests accordingly
> +first:
> +
> +   ./configure --arch=arm64 --target=kvmtool
> +
> +then run the test(s) like with QEMU above.
> +
> +To select a kvmtool binary, specify the KVMTOOL=path/to/binary environment
> +variable. kvmtool supports only kvm as the accelerator.
>   
>   ## Running the tests with UEFI
>   
>   Check [x86/efi/README.md](./x86/efi/README.md).
>   
> +On arm and arm64, this is only supported with QEMU; kvmtool cannot run the
> +tests under UEFI.
> +
>   # Tests configuration file
>   
>   The test case may need specific runtime configurations, for
> diff --git a/arm/efi/run b/arm/efi/run
> index 53d71297cc52..0843725ec360 100755
> --- a/arm/efi/run
> +++ b/arm/efi/run
> @@ -15,6 +15,11 @@ source scripts/vmm.bash
>   
>   check_vmm_supported
>   
> +if [[ $TARGET = "kvmtool" ]]; then
> +	echo "kvmtool does not support EFI tests."
> +	exit 2
> +fi
> +
>   if [ -f /usr/share/qemu-efi-aarch64/QEMU_EFI.fd ]; then
>   	DEFAULT_UEFI=/usr/share/qemu-efi-aarch64/QEMU_EFI.fd
>   elif [ -f /usr/share/edk2/aarch64/QEMU_EFI.silent.fd ]; then
> diff --git a/configure b/configure
> index 8c4400db42bc..d5f9995172f8 100755
> --- a/configure
> +++ b/configure
> @@ -392,7 +392,6 @@ elif [ "$arch" = "arm" ] || [ "$arch" = "arm64" ]; then
>           : "${uart_early_addr:=0x9000000}"
>       elif [ "$target" = "kvmtool" ]; then
>           : "${uart_early_addr:=0x1000000}"
> -        errata_force=1
>       else
>           echo "--target must be one of 'qemu' or 'kvmtool'!"
>           usage
> diff --git a/scripts/vmm.bash b/scripts/vmm.bash
> index ef9819f4132c..4ae60c37a6e8 100644
> --- a/scripts/vmm.bash
> +++ b/scripts/vmm.bash
> @@ -159,7 +159,7 @@ declare -A vmm_opts=(
>   function check_vmm_supported()
>   {
>   	case "$TARGET" in
> -	qemu)
> +	qemu | kvmtool)
>   		return 0
>   		;;
>   	*)

-- 
Shaoqin


