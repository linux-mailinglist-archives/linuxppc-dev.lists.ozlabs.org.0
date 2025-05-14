Return-Path: <linuxppc-dev+bounces-8567-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF8FAB64D0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 May 2025 09:49:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zy58M5q4yz2yqR;
	Wed, 14 May 2025 17:49:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747208963;
	cv=none; b=BywEpVxp8eHkXlXmAldPBKhg8U66z392Tc6rqiYJFze0FxA/u/YoaXggOCaTdHlkixxc8yb66DgriyPlkWpvi8iiLUR1LB6L1vt/Ud2dltDeHv5NrFHtgeYIaNIl432PtXN+jH8MgVMhZ4tFHRY45EVfuyaC6a/8qkI2c8us3LD9yx9jfbXKQEffDhD8nYu/MYyBkWxWKWHGH6WerkVJwiAzPusYxeAz2oqWWov1qqD7GGDtHbMOCwipgAWdlwR2P2IDxM7I2taQ895E9SgEGtr9Sx3x81Qr+5v85i2adBQ55l0IM5R03O9ID1gmAS0Ooumrh2ZYFF50RX/hHPMJbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747208963; c=relaxed/relaxed;
	bh=GY5pVLDJBE/QxHoyRscYKOYBVWh0U1cYp7B4seYFbNI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S567RKWhC9RLDN9//ymbg5O+vZyM5+UVUnoldnfF6NZ2GphdlWNMoVKa+icqgP70ftdcepIayoKIMwlM9SZ9c4Bo1Jz1ofG69+3g3nulQYa/rFVC5sCodNEif1B98N14PeSwKj/voA4VWgl0MpofKQ6pGY72zqaaJC6bM3Fp0KBwdJNEVeFDctzVIkt056gxAnE7L963Ue5V1cXco1RePSU7+zvD8lHeLq1pr1tYpSwsmZgXsDU5TohXd8Bup07IQcwqSrT0cj5VmUh+OQLTveqqgXf/tsPcrS2e71xMuO7H678y+cwD7pOTDEsAHNgVAtu6GzmyL2ndb1WGGbUNaw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=elL9VmWt; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CJNCYXMq; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=shahuang@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=elL9VmWt;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CJNCYXMq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=shahuang@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zy58L3q02z2ydj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 17:49:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747208956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GY5pVLDJBE/QxHoyRscYKOYBVWh0U1cYp7B4seYFbNI=;
	b=elL9VmWthI5UzbQx8W488snkOcAvVEf4aGR/rMNtwggOqdHwsaMNZp0HabrgX2z6EB/mqg
	M77bgqP96/S+njXB4cJzvFoESQIUFaLXOAvXpNFCuYSlRCJ4kIoU7hfgLG7elm82K4E6Nr
	VNZ+73hcIW3f2ObXHahMFSkmUXNd3Qg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747208957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GY5pVLDJBE/QxHoyRscYKOYBVWh0U1cYp7B4seYFbNI=;
	b=CJNCYXMqPJ9jxH2JLydLDkHuZeCEdz9CA/vjoThMZ/ZN5bJoYQMuZ9Cd77eNSZM59hwiak
	ztxqLALMo01FkW7WK5bEgdzNJd78XSH7wenA5/lSAEK0AEAi0E+1aKac8rJ9b9QWXLn+4g
	lzLcimT8kTOplluN2tyQHMM/E7vycgM=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-360-GIKD8moIOE2xX5XTcGk6bw-1; Wed, 14 May 2025 03:49:15 -0400
X-MC-Unique: GIKD8moIOE2xX5XTcGk6bw-1
X-Mimecast-MFC-AGG-ID: GIKD8moIOE2xX5XTcGk6bw_1747208954
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-74089884644so5848544b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 00:49:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747208954; x=1747813754;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GY5pVLDJBE/QxHoyRscYKOYBVWh0U1cYp7B4seYFbNI=;
        b=TD60lx0P6S1OPD8zgWwSBghOHe/vU4cQMIKVuhZi9J20oBwA1j3KIRNMH+mBf/lxVX
         OUg4904zhJW2ReBInKyypoM8mfLyzmtdC4xxDrDatgm4DA+VyGvx+K4V6YICjLTNWTmG
         UDsmyKAD5BubDLIEvnW9Q40HcYtWEF2hxwM1kOLzNfJ5dYM+GRMbDaoqd7ut0f8qcAiR
         ze/m875vZQwrFkvIVEO3TfhqEm0KJGyRwNDI7TUWkdMX4Jue7/9rjjPd/NzAaIi788FT
         rARlZ/5fRBvOHaxMI9TvImbDE3x3BlwQcJ90ovFc8rN9gbhwhOIpYhKr84hY+iSBpz1Z
         yopg==
X-Forwarded-Encrypted: i=1; AJvYcCXEJ9nTg/VgQm9SFcIodeF1+WzTUCULEW7k80l6CY98bihy9sKhckEe9TyEyefvcY9wsvbfs9d0JFfntUo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzJV3PYqE0OQmqb+WJJLC7UdwLRz7izl7o05cT0J+Bp48coxUjz
	QQCnxFyyWPjpBKt/x3Ky2t2cz9BUIrmwF1TBPfgSODYxn7mUSRvQ8qD95i5QPKmM1F+VAzqHDaP
	pWR+cwkbi2fDzDHI9srvLtfcv4qStYGsiECHQe2Yn96jDubVlZ28nVgpwtWY4+8I=
X-Gm-Gg: ASbGncuFJRNPWK8uEFMaJZixMztZzHR7BKXeB3riy/ziyE9s5oK12Fl7Zz0NG5jBSIO
	MRND1aVpUQJWhqdDyAzE6XXDeyUUbEIvBEcI+6XMEUoisxN69gp+M7MfJCPl/l3K8m1yQgtVGAt
	4wOa+M56LD2egU73O98j2qWPf3lhtswj8DGSVsk5D1O1PwccqPmiMmvC3i31GX32cUdL4wQfCll
	XP91KRrflWenUFzXgm9VaCK3UC07moFUvTlY0W/7A2Shk8EsomxMqW+kyZCFZIWWQbzFOhbjr36
	ta1pyx1cY9DzsOQI
X-Received: by 2002:a05:6a00:a83:b0:740:596e:1489 with SMTP id d2e1a72fcca58-74289373d91mr3716648b3a.23.1747208953961;
        Wed, 14 May 2025 00:49:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxNAnjJT+LSzbpKrbMZgFeI/1Abe8EQQBbch700DZ2BLpon2TmE4Xe4l7GJrieZh9Qyjgk0Q==
X-Received: by 2002:a05:6a00:a83:b0:740:596e:1489 with SMTP id d2e1a72fcca58-74289373d91mr3716602b3a.23.1747208953574;
        Wed, 14 May 2025 00:49:13 -0700 (PDT)
Received: from [10.72.116.125] ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a10881sm9212477b3a.106.2025.05.14.00.49.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 00:49:12 -0700 (PDT)
Message-ID: <67fb8130-94fd-46d0-8f59-1c047ff0a881@redhat.com>
Date: Wed, 14 May 2025 15:49:03 +0800
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
Subject: Re: [kvm-unit-tests PATCH v3 06/16] scripts: Refuse to run the tests
 if not configured for qemu
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
 <20250507151256.167769-7-alexandru.elisei@arm.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20250507151256.167769-7-alexandru.elisei@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sKODicnkgw6LD6IaIkdTpZ75UF3edwm0GZcvAPmrXGU_1747208954
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
> Arm and arm64 support running the tests under kvmtool. kvmtool has a
> different command line syntax for configuring and running a virtual
> machine, and the automated scripts know only how to use qemu.
> 
> One issue with that is even though the tests have been configured for
> kvmtool (with ./configure --target=kvmtool), the scripts will use qemu to
> run the tests, and without looking at the logs there is no indication that
> the tests haven't been run with kvmtool, as configured.
> 
> Another issue is that kvmtool uses a different address for the UART and
> when running the tests with qemu via the scripts, this warning is
> displayed:
> 
> WARNING: early print support may not work. Found uart at 0x9000000, but early base is 0x1000000.
> 
> which might trip up an unsuspected user.
> 
> There are four different ways to run a test using the test infrastructure:
> with run_tests.sh, by invoking arm/run or arm/efi/run with the correct
> parameters (only the arm directory is mentioned here because the tests can
> be configured for kvmtool only on arm and arm64), and by creating
> standalone tests.
> 
> run_tests.sh ends up execuing either arm/run or arm/efi/run, so add a check
> to these two scripts for the test target, and refuse to run the test if
> kvm-unit-tests has been configured for kvmtool.
> 
> mkstandalone.sh also executes arm/run or arm/efi run, but the usual use
> case for standalone tests is to compile them on one machine, and then to
> run them on a different machine. This two step process can be time
> consuming, so save the user time (and frustration!) and add a check
> directly to mkstandalone.sh.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>

Reviewed-by: Shaoqin Huang <shahuang@redhat.com>

> ---
>   arm/efi/run             |  3 +++
>   arm/run                 |  4 ++++
>   scripts/mkstandalone.sh |  3 +++
>   scripts/vmm.bash        | 14 ++++++++++++++
>   4 files changed, 24 insertions(+)
>   create mode 100644 scripts/vmm.bash
> 
> diff --git a/arm/efi/run b/arm/efi/run
> index 8f41fc02df31..53d71297cc52 100755
> --- a/arm/efi/run
> +++ b/arm/efi/run
> @@ -11,6 +11,9 @@ if [ ! -f config.mak ]; then
>   fi
>   source config.mak
>   source scripts/arch-run.bash
> +source scripts/vmm.bash
> +
> +check_vmm_supported
>   
>   if [ -f /usr/share/qemu-efi-aarch64/QEMU_EFI.fd ]; then
>   	DEFAULT_UEFI=/usr/share/qemu-efi-aarch64/QEMU_EFI.fd
> diff --git a/arm/run b/arm/run
> index ef58558231b7..56562ed1628f 100755
> --- a/arm/run
> +++ b/arm/run
> @@ -7,7 +7,11 @@ if [ -z "$KUT_STANDALONE" ]; then
>   	fi
>   	source config.mak
>   	source scripts/arch-run.bash
> +	source scripts/vmm.bash
>   fi
> +
> +check_vmm_supported
> +
>   qemu_cpu="$TARGET_CPU"
>   
>   if [ "$QEMU" ] && [ -z "$ACCEL" ] &&
> diff --git a/scripts/mkstandalone.sh b/scripts/mkstandalone.sh
> index c4ba81f18935..4f666cefe076 100755
> --- a/scripts/mkstandalone.sh
> +++ b/scripts/mkstandalone.sh
> @@ -6,6 +6,9 @@ if [ ! -f config.mak ]; then
>   fi
>   source config.mak
>   source scripts/common.bash
> +source scripts/vmm.bash
> +
> +check_vmm_supported
>   
>   temp_file ()
>   {
> diff --git a/scripts/vmm.bash b/scripts/vmm.bash
> new file mode 100644
> index 000000000000..39325858c6b3
> --- /dev/null
> +++ b/scripts/vmm.bash
> @@ -0,0 +1,14 @@
> +source config.mak
> +
> +function check_vmm_supported()
> +{
> +	case "$TARGET" in
> +	qemu)
> +		return 0
> +		;;
> +	*)
> +		echo "$0 does not support target '$TARGET'"
> +		exit 2
> +		;;
> +	esac
> +}

-- 
Shaoqin


