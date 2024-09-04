Return-Path: <linuxppc-dev+bounces-980-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F8396B96F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 12:57:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzKFj2MLCz2yVX;
	Wed,  4 Sep 2024 20:57:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725447449;
	cv=none; b=BHiAJGpAxTH56/0Wjx73Jwg0+El3Jo5WAlAjA8cshv/3URVlu8tvlO5epdQx/s5GSVoBD2qgl6g3ojahP8/cEF1yjnsO32WIS4Fbmw2LL1PbZzKzO5GySSV0xfc85UiWGOQijVqP+OtLE72Dcnb11U+Yu1Co5CniLaUp8tN0gFIaqxRXzBjLCTBjyK1hlaMdv6IUgmHKaa14ncLsZircEx5Swy3LXqzsa1IhmbQy+WVjFxapctW6IVApypzJGmUce3TIhB4vGyLMUByZ/pGvvyTkYD+XtFz3aSZqX+szcufC6lps8h3T6pHYuI9Ztoocgd9Wwmd9WlssZ/yCd6b4JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725447449; c=relaxed/relaxed;
	bh=gUfy7vBSh0K01zFNsn5gxi7P6P/xGBI0zl9UM5g03aE=;
	h=DKIM-Signature:DKIM-Signature:Message-ID:Date:MIME-Version:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type; b=haPlr8IYNRbi8dKda0DIpGaB0+Jr1Q0SIfFtXWD1FL47qltj/9KAi9Va0uyPtEztmt+XgoDXd6yeVVHZJeapLPso64AOa3ZIx1CJFgHd/paQhl3+Qpa7RIeHiFLnfRg9Pq9LLJdupeaTv4u7BtokDF6nFm4aCVVba2b4fvlrzLe87wC+p5oIyeysuKT4joHSu9mgT2wPjsPN75t0tYhhUwDDpmcHSk0GZujurpgCEmWKToZjr/27BxY1Ra4+XOdFUrkU2fIs7u9um9r1FeLeCBRV7lVnumZgAiNofG9mKqIJQ8Kxbd+v+1vFSdcWMUlVG1LoZJk5Ma+ekFrxWUQWtQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ge46xX3r; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JctGGUyP; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ge46xX3r;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JctGGUyP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzKFh4fFjz2yVV
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 20:57:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725447442;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gUfy7vBSh0K01zFNsn5gxi7P6P/xGBI0zl9UM5g03aE=;
	b=Ge46xX3r6f/uuO2ra+/6pjMSPO8161wMQGfE16adSMqUDC7o8IP9CCEEvmIQyO+XIrdQ9P
	zOynX+IuNlkouNmKmh4msoYCvuGOMxEyxvWth3vysB0uYgS5Ze+ILjNndRvouFpGfh344N
	DzpnAQBeiBnb1Cf2FWhjN8Xfg0BjrwQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725447443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gUfy7vBSh0K01zFNsn5gxi7P6P/xGBI0zl9UM5g03aE=;
	b=JctGGUyPiwqCK0oAYFDZySXLdc/UBsMUEmyPBSHSV0mq5DsqApoj0QB7n/8sE6UN2kHSsV
	SLIykdAU2JAZDWaKRlodAwVaIj1Sw1hM8H7EjxWfCNx3LGbT+g2eZlvb5BDoqf9wkvqt2U
	WeCY2ljtaUXhtwkds9IbWP/xVmM90j0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-9dgwBmNvMwGFxZeP7AdITQ-1; Wed, 04 Sep 2024 06:57:19 -0400
X-MC-Unique: 9dgwBmNvMwGFxZeP7AdITQ-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-42bb9fa67c5so10883345e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2024 03:57:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725447438; x=1726052238;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gUfy7vBSh0K01zFNsn5gxi7P6P/xGBI0zl9UM5g03aE=;
        b=HyKyeTPCFhWzOZAc7KOwcpUvOOPtIUa3/WlpVNfQzHl+Lm3j2N8dvHIIbfMm9RIJg8
         3J1ZS9r7I4ijzlALa6GM820NxXWKxp3XqvnzKn6F6QLd3p24JNUXVSYsohfcTLR7ozPL
         86QJOtKTSxHmptlsyz92c9aUdA+1OSNJjx5IcfvkDir0z4UMlbiOh0KbmbHg0UQ9wZGU
         +puRg3Q/0qIqWI5YRoAX0CUxXq+E73AlhL0pgRl8f3oU0d2fQdjJmM6oqJyCU3Wj64Fk
         T0ScARK8F4upRgac5QuFs9E24okgrPyi/cBEGi20Y2knWvZHoZTE9nFi8Ebfi1//bW9F
         EFUg==
X-Forwarded-Encrypted: i=1; AJvYcCWWNZailVeInxjEObZzIKMdiSCeEPvMMJBk1VKgEjWekHHz25ygi0bVc1L4hVSS+z0O8ENtjXJdM4UCFLc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx3a+K/gp13PsTElx5iL3lVWeAgc4EazhpVj983V5vbn3V6zGh7
	/6ew63NfINeStlS7nELdsvfrLPw9vAQ3DlSmg0c3TjAFR0Ag5RnlTbFdpbS+x2bIuHljoFbh6Ny
	whijiHNyj7KTyCBk7RPjWXoVcTP1ajSaVhBxLp5Ju44ilST+IuNj3O7nGBrpKBiI=
X-Received: by 2002:a05:600c:4445:b0:42b:a7c7:5667 with SMTP id 5b1f17b1804b1-42bb01e6c71mr141132775e9.25.1725447438213;
        Wed, 04 Sep 2024 03:57:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3bTtG96Ys6nCpHR+NA9gfbqo3z2M1uNCXMJJTTF4fsqkhQOGYOpIpNQY5Ixhs8qpqzcI3xw==
X-Received: by 2002:a05:600c:4445:b0:42b:a7c7:5667 with SMTP id 5b1f17b1804b1-42bb01e6c71mr141132595e9.25.1725447437702;
        Wed, 04 Sep 2024 03:57:17 -0700 (PDT)
Received: from [192.168.0.6] (ip-109-43-176-181.web.vodafone.de. [109.43.176.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bbc87773fsm160650225e9.0.2024.09.04.03.57.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 03:57:17 -0700 (PDT)
Message-ID: <40bc448a-420b-4dad-872c-5b10a756dd8c@redhat.com>
Date: Wed, 4 Sep 2024 12:57:15 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v2 2/4] Makefile: Prepare for clang EFI
 builds
To: Andrew Jones <andrew.jones@linux.dev>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org
Cc: pbonzini@redhat.com, lvivier@redhat.com, frankja@linux.ibm.com,
 imbrenda@linux.ibm.com, nrb@linux.ibm.com, atishp@rivosinc.com,
 cade.richard@berkeley.edu, jamestiotio@gmail.com
References: <20240904105020.1179006-6-andrew.jones@linux.dev>
 <20240904105020.1179006-8-andrew.jones@linux.dev>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240904105020.1179006-8-andrew.jones@linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/09/2024 12.50, Andrew Jones wrote:
> clang complains about GNU extensions such as variable sized types not
> being at the end of structs unless -Wno-gnu is used. We may
> eventually want -Wno-gnu, but for now let's just handle the warnings
> as they come. Add -Wno-gnu-variable-sized-type-not-at-end to avoid
> the warning issued for the initrd_dev_path struct.
> 
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> ---
>   Makefile | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 3d51cb726120..7471f7285b78 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -50,6 +50,8 @@ EFI_CFLAGS += -fshort-wchar
>   # EFI applications use PIC as they are loaded to dynamic addresses, not a fixed
>   # starting address
>   EFI_CFLAGS += -fPIC
> +# Avoid error with the initrd_dev_path struct
> +EFI_CFLAGS += -Wno-gnu-variable-sized-type-not-at-end
>   # Create shared library
>   EFI_LDFLAGS := -Bsymbolic -shared -nostdlib
>   endif

Reviewed-by: Thomas Huth <thuth@redhat.com>


