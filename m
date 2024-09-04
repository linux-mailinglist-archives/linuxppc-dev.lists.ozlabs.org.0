Return-Path: <linuxppc-dev+bounces-948-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 292E696B160
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 08:17:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzC2K0wCGz2yQL;
	Wed,  4 Sep 2024 16:17:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725430359;
	cv=none; b=eatVX/76SphvIbxpiuWfySEAvZtBHUnsUu1wdFo1cBs3W4AyRxZL1UnaDNUexvrDjTINTC/zANTdUMi4R3Xlc5ho5S2ZOy0MGP6VmT2jPVvFD/32oSB7zsePDArSJK/vBfuAEEEZZbImAwcL+lp3iT2Ajc2wObtbNIZPRXMwPmNuAbfcDoc0eB5laCuOtUWj1+7IpBAmn5hCvIYx47RvpDddfFpXXAHSpl6zJznt2qsKdq4vXd/2mWn9ErEBFSrNqViwzDMYT1Ae/Yuk8d00XjKVrrlERHXiYSL4vzMvWh5Aus2sXzj9mlxakSkGJLWU5yoxKfHAvd4d/btqZLPO6g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725430359; c=relaxed/relaxed;
	bh=pFi+GvA472wwOZH0lUKoPWTzWmpUD/+iLOVkN6gRHFI=;
	h=DKIM-Signature:DKIM-Signature:Message-ID:Date:MIME-Version:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type; b=HWvFrXkGPgX5oCrqbNSY3/HEWSj+poD9WbElZ9/ZdyfrcrtvLW8EJb/fO7kHQjLzJ3neoBSFGfBia+d969MJ/56mLN7HejdX+MTSCi/Co3R/zkF+c/bMRZOEQt5iRECuNn8SgUTW++mGLRH0ZzXBaGBiTZbXxUyQlDlZG6SZwpZNXbAp6lq1RaElpKw2vkweW+wkNCrnXlq9dIV/LwW+bL+D26LH9M9aXC0hd5/6WvClyFXuTAoNk/Vmj5DiFrvm5EwEaeat4TgoN11xtd1qrRYSjNZukCvqJLnKI4B5jY1ywAEOQwElk8n++mdaV9i906KgphaRAFbozbvhmpMeIQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PHWaK1di; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UXQmMI5z; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PHWaK1di;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UXQmMI5z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzBx32wjVz2xZQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 16:12:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725430355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pFi+GvA472wwOZH0lUKoPWTzWmpUD/+iLOVkN6gRHFI=;
	b=PHWaK1dib2/1K+4JIlpfLtVgXv54Y7El/sznvaq4tdS7dLdzwZpdh7oy2nsPl6qTGpEPXu
	sFrFOe2pyfVze4go/cMdhM4jMzWfiQYi550dVUN0MPucETUvKLMRalEIXlu1+fxKXWrgEm
	aO/cONH3MibP7gaCDLFURtWKu8sL8Vc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725430356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pFi+GvA472wwOZH0lUKoPWTzWmpUD/+iLOVkN6gRHFI=;
	b=UXQmMI5zj74o5gUUH9MrzMsAW4iiQnrRylF1fubDCQG+Wj/0Pvxw3OvH6XFJY76wca5Tgu
	UwtgSHMo9IG+M9ibRpSznYjOSGN+JIKdOWHBppJE8JRXaG6N0ztIuaWdPOuoIUp3ZL/dHh
	1Foj6gm6zxu7i4WGMRQ90CmY9CZuxEM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-421-sHHRdqYiM6K1e7in4WYhFw-1; Wed, 04 Sep 2024 02:12:29 -0400
X-MC-Unique: sHHRdqYiM6K1e7in4WYhFw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a8696019319so460549566b.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Sep 2024 23:12:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725430348; x=1726035148;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pFi+GvA472wwOZH0lUKoPWTzWmpUD/+iLOVkN6gRHFI=;
        b=RNzj893jJME+a4dIFOwuOl0VJse1G8zBW63q4G/Qk8i4rIjaxCftYjsaFkzAc68296
         Kb6kWY4OiU20Euf3LzEThYL7AeFGKLV1Kq9VBHKheTeojLh30uwiaLG634NsBHu4KH+f
         RPlK+2MvGT+ZGMB/iO1qcc9V5G/j9Nm30F4OgwXPW0nCM3kmYsTjn4GD4kzmtmPRxGWG
         wds3vPqJJyLVNPRopu28bZ4jkwIdJcNfaL5UggvHSXllx7dJD8lXaiZTA9pG8uIinXhF
         o/O2K2qORfIWBRgXpIRx/yl+Yt7mZfMpiXYeUxk7vV5xppX7lbemkOKFJFHqjcD1tSHT
         QICw==
X-Forwarded-Encrypted: i=1; AJvYcCX+jrJGrfbV3kmXQXTdHpEKASoZgFtYhalznbCo4PcX5i7esnRAub+4ajNrV93ACgNz66mq7fs63lPEZyE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YySIYpV6VR9MDAf50sNLYczjCk76yO8Yd6u1P2foygP1ibpYiY7
	2Oz6hClgYh2FbyF1OQwzz4A2r5CPVbXXUSjpyQl5koi6eWaOYGF/619evr4NQ/OB+H22L22ge2P
	5fIX+7//qvAIleovd+3ncYTfU+e9rTYqjO/LMJ+UdIkgoRw8rdwVzoD3Hk1X6m5sTEqD10yQ=
X-Received: by 2002:a17:907:968a:b0:a86:7b01:7dcc with SMTP id a640c23a62f3a-a89b94c72ddmr951638966b.18.1725430348604;
        Tue, 03 Sep 2024 23:12:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDGkN9s2Jmw7XcWlEqSmMDSJiOFB+htHItlggYvkQ9RraTtZHA1IDxBlv8WOsHPBd0lfuW2g==
X-Received: by 2002:a17:907:968a:b0:a86:7b01:7dcc with SMTP id a640c23a62f3a-a89b94c72ddmr951636566b.18.1725430348097;
        Tue, 03 Sep 2024 23:12:28 -0700 (PDT)
Received: from [192.168.0.6] (ip-109-43-176-181.web.vodafone.de. [109.43.176.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988feb767sm773020966b.16.2024.09.03.23.12.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Sep 2024 23:12:27 -0700 (PDT)
Message-ID: <7ef4ee12-ce0b-41e6-904a-ff43ee571be1@redhat.com>
Date: Wed, 4 Sep 2024 08:12:25 +0200
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
Subject: Re: [kvm-unit-tests PATCH 1/3] riscv: Drop mstrict-align
To: Andrew Jones <andrew.jones@linux.dev>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org
Cc: pbonzini@redhat.com, lvivier@redhat.com, frankja@linux.ibm.com,
 imbrenda@linux.ibm.com, nrb@linux.ibm.com, atishp@rivosinc.com,
 cade.richard@berkeley.edu, jamestiotio@gmail.com
References: <20240903163046.869262-5-andrew.jones@linux.dev>
 <20240903163046.869262-6-andrew.jones@linux.dev>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240903163046.869262-6-andrew.jones@linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/09/2024 18.30, Andrew Jones wrote:
> The spec says unaligned accesses are supported, so this isn't required
> and clang doesn't support it. A platform might have slow unaligned
> accesses, but kvm-unit-tests isn't about speed anyway.
> 
> Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
> ---
>   riscv/Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/riscv/Makefile b/riscv/Makefile
> index 179a373dbacf..2ee7c5bb5ad8 100644
> --- a/riscv/Makefile
> +++ b/riscv/Makefile
> @@ -76,7 +76,7 @@ LDFLAGS += -melf32lriscv
>   endif
>   CFLAGS += -DCONFIG_RELOC
>   CFLAGS += -mcmodel=medany
> -CFLAGS += -mstrict-align
> +#CFLAGS += -mstrict-align
>   CFLAGS += -std=gnu99
>   CFLAGS += -ffreestanding
>   CFLAGS += -O2

Reviewed-by: Thomas Huth <thuth@redhat.com>


