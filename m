Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8746BE9CC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Mar 2023 14:03:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PdPSn4z5bz3f3w
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Mar 2023 00:03:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PP+8WUaC;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PP+8WUaC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PP+8WUaC;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PP+8WUaC;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PdPRs2Vlqz306l
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Mar 2023 00:02:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679058148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1+u4rPc5mt4tMfyMFk62LMmPtglIUJiHWEfglpwOcBE=;
	b=PP+8WUaCF6elG4U7k4kj4oI1QtFXFp8iE6uJrCWWB7iIZ6eMK8pt+8B9ZNFi9ay+Vwha2d
	8qt6UpkweaZhPw95KWIGetLLWCdO7HdBvSvzIQCrudZQ2fhXGg34DG0yauyVoPoGMmPlgU
	GgYvLfls9QGQwqelQ2IPOusf+9C21SE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679058148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1+u4rPc5mt4tMfyMFk62LMmPtglIUJiHWEfglpwOcBE=;
	b=PP+8WUaCF6elG4U7k4kj4oI1QtFXFp8iE6uJrCWWB7iIZ6eMK8pt+8B9ZNFi9ay+Vwha2d
	8qt6UpkweaZhPw95KWIGetLLWCdO7HdBvSvzIQCrudZQ2fhXGg34DG0yauyVoPoGMmPlgU
	GgYvLfls9QGQwqelQ2IPOusf+9C21SE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-540-c6IW57lJP0Gd5yCmmX9OTg-1; Fri, 17 Mar 2023 09:01:19 -0400
X-MC-Unique: c6IW57lJP0Gd5yCmmX9OTg-1
Received: by mail-wm1-f69.google.com with SMTP id i8-20020a05600c354800b003ed59bae33bso1831339wmq.5
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Mar 2023 06:01:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679058077;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1+u4rPc5mt4tMfyMFk62LMmPtglIUJiHWEfglpwOcBE=;
        b=mYx0yuu2BWU3Vk6/HjojWUTUkXl3vBb6aH3XanugXU3SbjAURaZ8uKpN03bwJdvxQU
         ypEBkHPDpeufzrnUos+jN2Vr5bOBObiLLBnVlnxyC8XoDGvj038IPss4ESWXIRlKD8qH
         Cr6r7N5FfYiVGJjYWHm7yd+AMXfg8FooJvWkjxY8HNtnkTLcbAFVG9H5SDiJhAGd/oMn
         odY+ykInR1AwWMgP0pVe2pCXfcDTpO91J06BNPCm3lFy4WsIV12z0zOHcrjDXTVTdPIN
         nkR9+cqZcFDLFRKS9B4ApTf/wDZit/ntBBAv1+AeifhgZolC6Qa+ugY2ExeHkUJNYctW
         eFxw==
X-Gm-Message-State: AO0yUKUsa0Z4S6ZGNT7SSxE/K3iBs7C4LIIcTJ6DR3Iofh/DQclTA6JX
	7GPYj+6aM11YPd3yEhgPlqYEEXlTeFt3YKmy0iVXqfwIrs3nRwb+O9xuQmG1DjvZFQdo3y9S/59
	jyp5Phnq6h6KnVgSAy8YDKC+Y5g==
X-Received: by 2002:a5d:6a4a:0:b0:2cf:3a99:9c1e with SMTP id t10-20020a5d6a4a000000b002cf3a999c1emr6967527wrw.49.1679058077174;
        Fri, 17 Mar 2023 06:01:17 -0700 (PDT)
X-Google-Smtp-Source: AK7set8gg7IA5IehSqTBkPUO4p/6PxmQbiymlGRfGMggrJxSBZOE5w2PIq38aJdSRa6vZG/TH2Td7g==
X-Received: by 2002:a5d:6a4a:0:b0:2cf:3a99:9c1e with SMTP id t10-20020a5d6a4a000000b002cf3a999c1emr6967492wrw.49.1679058076455;
        Fri, 17 Mar 2023 06:01:16 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-33.web.vodafone.de. [109.43.176.33])
        by smtp.gmail.com with ESMTPSA id g9-20020a5d4889000000b002c559843748sm1941036wrq.10.2023.03.17.06.01.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 06:01:15 -0700 (PDT)
Message-ID: <d65643cf-ea6e-7263-8263-52a6c4223aac@redhat.com>
Date: Fri, 17 Mar 2023 14:01:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [kvm-unit-tests PATCH 3/7] powerpc: abstract H_CEDE calls into a
 sleep() function
To: Nicholas Piggin <npiggin@gmail.com>, kvm@vger.kernel.org
References: <20230317123614.3687163-1-npiggin@gmail.com>
 <20230317123614.3687163-3-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230317123614.3687163-3-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 17/03/2023 13.36, Nicholas Piggin wrote:
> This consolidates several implementations, and it no longer leaves
> MSR[EE] enabled after the decrementer interrupt is handled, but
> rather disables it on return.
> 
> The handler no longer allows a continuous ticking, but rather dec
> has to be re-armed and EE re-enabled (e.g., via H_CEDE hcall) each
> time.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
...
> diff --git a/lib/powerpc/processor.c b/lib/powerpc/processor.c
> index ec85b9d..f1fb50f 100644
> --- a/lib/powerpc/processor.c
> +++ b/lib/powerpc/processor.c
> @@ -10,6 +10,8 @@
>   #include <asm/ptrace.h>
>   #include <asm/setup.h>
>   #include <asm/barrier.h>
> +#include <asm/hcall.h>
> +#include <asm/handlers.h>
>   
>   static struct {
>   	void (*func)(struct pt_regs *, void *data);
> @@ -54,3 +56,32 @@ void udelay(uint64_t us)
>   {
>   	delay((us * tb_hz) / 1000000);
>   }
> +
> +void sleep(uint64_t cycles)

When I see a sleep() in a C program, I automatically assume that it's 
parameter is "seconds", so having a sleep() function here that is taking 
cycles as a parameter is confusing. Could you please name the function 
differently?

> +{
> +	uint64_t start, end, now;
> +
> +	start = now = get_tb();
> +	end = start + cycles;
> +
> +	while (end > now) {
> +		uint64_t left = end - now;
> +
> +		/* Could support large decrementer */
> +		if (left > 0x7fffffff)
> +			left = 0x7fffffff;
> +
> +		asm volatile ("mtdec %0" : : "r" (left));
> +		handle_exception(0x900, &dec_handler_oneshot, NULL);
> +		if (hcall(H_CEDE) != H_SUCCESS) {
> +			printf("H_CEDE failed\n");
> +			abort();
> +		}
> +		handle_exception(0x900, NULL, NULL);
> +
> +		if (left < 0x7fffffff)
> +			break;

Shouldn't that be covered by the "end > now" in the while loop condition 
check already?

> +		now = get_tb();
> +	}
> +}

  Thomas

