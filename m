Return-Path: <linuxppc-dev+bounces-8800-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC67ABEBD6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 May 2025 08:16:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2Lm51H0Qz3bkd;
	Wed, 21 May 2025 16:16:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747808197;
	cv=none; b=YTvVFYEoZVzo526fkCJPappidRH+npH4fIoShZQzx8jMXCPiaU5JEM/NibNhj0miFxLNlEvaESTyCeLJJSg2Zpzaq9DRm1uy2cgJXq69imM4ze9NR/D7fShCCelXrUUyyWd3NJ7NbYdDMC9LX/QUP5CMELbJJMYWrCzEA0Z5qBsmC74k2ShFxEQrYyb70om1IaTK5CJITyHc50MyXzuwcP08iBIqRJyJUz/WxUbfMWMZDlC26hEKq9xwVQhB3ClSQRivLHck42KcXWnDek5GqIP+eWuC20T1iEotmnvegLWCHktVqypqg4T2bPHkq/g0MpWoGSk1pqA6eeogkvCY0w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747808197; c=relaxed/relaxed;
	bh=iw5uJHJc2V+sRbe4e4Tg6n7ubVHazSs+sdmDhxZTg8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IByyW4n4s/L/ScP0UexhuA+dW++zQI2yKXZdwYecUuP8E+wGX8mEtK+SqWIThH4Rf4EkqWSWcniKkZ3aEEiPtFrgdBW/14sUUHIS1ofcQMSzKOmwQE1yqeCHM2BgnnC5QdGmfwnsyMqFIOv54oplMmO9+e7cGhuCZ2fY6V19e9b6UX4FssTDa27v+F51+SJdNdAgLuwN4IuPg+tQAdAesJKd4+Y+hBhi11peOgWcps96nxtOASj3AFUJyycgrEQM2Y6mFWfNI3a9ZR4V/B6kYya44q5W1KR8s+7L9l9v238R6oO4CgbUonaETpr7E4dZw3xH0coaRvE1EXbWg5dY1A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HiK3d3LX; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TuFTYu8n; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=shahuang@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HiK3d3LX;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TuFTYu8n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=shahuang@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2Lm40HG9z2yyJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 16:16:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747808191;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iw5uJHJc2V+sRbe4e4Tg6n7ubVHazSs+sdmDhxZTg8c=;
	b=HiK3d3LXL9bN7GdSU2TR5Swdm6WzzRdKLsjky3on3jtCbN1aGs4dhzMVPcyn0JjIhdS8ul
	UFk2s+5OF7sCdMDBV1reWA1AWINz5WCLTI2zBjaCddHtAi9NZTAYQmhQxcL6qX013x6bg7
	APkSzbQdpMK3Mqi1Nu96E4DRI44Tf+A=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747808192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iw5uJHJc2V+sRbe4e4Tg6n7ubVHazSs+sdmDhxZTg8c=;
	b=TuFTYu8ne3YFlH3Z0R2NzufrmDWU0zaVfnSdJkhZIZu2E32cQmhFbvDGavf5dcOaS1K+Rm
	NPq7eamu2vQqPKx9acljrJZkJdaAtS0cbv09u++nnhao2ViJuJ0zTy5J5H6ZYG+buViBIV
	T+e3ZaFnmjEXDIohYsJPvCFwLSvoesE=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-wYstYkQOMiOMX4j-BiLhcQ-1; Wed, 21 May 2025 02:16:28 -0400
X-MC-Unique: wYstYkQOMiOMX4j-BiLhcQ-1
X-Mimecast-MFC-AGG-ID: wYstYkQOMiOMX4j-BiLhcQ_1747808187
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-23222fdb4f2so55738635ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 23:16:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747808187; x=1748412987;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iw5uJHJc2V+sRbe4e4Tg6n7ubVHazSs+sdmDhxZTg8c=;
        b=IRIshWOfx71cW7zrRID6p5aOq4Os/rg9K85NSlPdMUA307hNpvfQFu9kfZxIq/Vxm7
         cdhSbzLzvJm/+DODUMQgowNLn7M1JcOFJO/AdiIQnX5dAW4JUYs5QfMF+n+92oPnHwlg
         1h6YVRLEpIilbMGfRPGWTuGlqkY/6bAk1x1HIhu/k7ZYTqMcFG+2UgTd+GpZ86UYe5DM
         TUc+5HEnz76w5zQJ7LWUXtY52N6q31u+Nk+8XJFxuGcpcZMabMh6ewccVG5fd/1tyV69
         ZA+7fF2iK6h65TOYIHDoCyFiAlWsqv/7eb6E5pkcirTm6keFBBIdkWny0Ow/6D4kzXGI
         KAAg==
X-Forwarded-Encrypted: i=1; AJvYcCUAKSm84VzLpJ/NdsGFLZVZ2iNTKvaStQv/HFaDRHOAxxwcZxzx7I+YSqxURAU3xDsxKCjuJ+trdLSKiq4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyH77cRzhfsRMhgg+Sv6wY+uOhc7jhYqEn6FnjSWMWe4qRFcqHO
	xN3QlLk0xYUDfEqBPd2V5UqZxEoqGDWbiUHY6j9iu9Sisth8daTybRkYlEoxKJuavhVD2LerlDv
	XNqWy/6Oobrz4VxL5jQPI2BIK3BSa0Y6VPuqJFHQVsJYuDy5NrPtLvk9oYoZoje8l/ak=
X-Gm-Gg: ASbGncs2NGFwzim8q8G4YXRg786ANAYqTvhn/6G7FVr2efJG+VH9iuMMmWGaVwVjDYW
	Q8yFrSU7Jg0d4H8n61r53ylNpQEBBFQpOY/cf3dtz35v0wNw5OZL8Zotl2x/D7f++6AiuPsuz2m
	1P4fSKYg1OomM8zU7r0G1T/UkEnb3YnZBlQk8LejqRKU4O3prteqvJWK94Zon7+UGaGxJtOIfGU
	ZiWfwmBGzL4wOPPkRrtzLk5A/R1kFDMlArU2RH0pArRHV30ThaRp6gdbwSV+qRmQI9TvxC1+mGy
	CwFItckdpV5IuDs=
X-Received: by 2002:a17:902:fc46:b0:231:bf74:e1df with SMTP id d9443c01a7336-231de3515demr258862195ad.7.1747808187186;
        Tue, 20 May 2025 23:16:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMaGJi9XZe04iIaqoT0LCToE4EYldNnY+Yj53uJr8Djqjif4zPPKYkEdeIkY17gXv01FY1iA==
X-Received: by 2002:a17:902:fc46:b0:231:bf74:e1df with SMTP id d9443c01a7336-231de3515demr258862005ad.7.1747808186859;
        Tue, 20 May 2025 23:16:26 -0700 (PDT)
Received: from [10.72.116.61] ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ed5460sm85707015ad.241.2025.05.20.23.16.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 23:16:26 -0700 (PDT)
Message-ID: <b5d2d946-7f46-4908-b44a-6ce80b67c46c@redhat.com>
Date: Wed, 21 May 2025 14:16:18 +0800
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
Subject: Re: [kvm-unit-tests PATCH v3 14/16] scripts/mkstandalone: Export
 $TARGET
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
 <20250507151256.167769-15-alexandru.elisei@arm.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <20250507151256.167769-15-alexandru.elisei@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9WOSezE6W2ylKIXglI4KvCEAnJiNDuTMIAteG6WeY4Y_1747808187
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
> $TARGET is needed for the test runner to decide if it should use qemu or
> kvmtool, so export it.
> 
> Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>

Reviewed-by: Shaoqin Huang <shahuang@redhat.com>

> ---
>   scripts/mkstandalone.sh | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/mkstandalone.sh b/scripts/mkstandalone.sh
> index 4f666cefe076..3b2caf198b00 100755
> --- a/scripts/mkstandalone.sh
> +++ b/scripts/mkstandalone.sh
> @@ -47,6 +47,7 @@ generate_test ()
>   	config_export ARCH_NAME
>   	config_export TARGET_CPU
>   	config_export DEFAULT_QEMU_CPU
> +	config_export TARGET
>   
>   	echo "echo BUILD_HEAD=$(cat build-head)"
>   

-- 
Shaoqin


