Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE00B30D1DB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 04:04:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVmkZ0J1VzDqlW
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 14:04:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=kVMYXGJD; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVk2V2BY6zDwlF
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 12:03:27 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id cl8so2113576pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Feb 2021 17:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=M2cZmscEFTlqW/9wuWvHckwWLerLXDXMuxJCyG3m8MA=;
 b=kVMYXGJDz/9kT0oT65QFjNmzk4CeROOf/avreIFo9MlGVUZCzuMTxEmlEX1Ev2757r
 iyh8g/lbsnPZaoeW8rP1N6DYXQWesnZ/IeQlaoGM2CbVIROoKA1dBlCOtNTJORJaPUVu
 ukQjvTJiWET50DYN/wcv9RvOmAW4lDpC6jNDoNdkXnYox6B7HZXafHzYPXYA/dPY5EzB
 yo+s+vi90RoxisMOnEGM3FU10WZaMRP/qJAhAWoanovMV8I2fe/tFlv/EAylBFBuunA3
 GEnLnxbAA2AL3/weh+GPOsfnPKRztM2uB8awWPgfwbfCOx9XKLw8T0CIexShaocPqHAr
 qJ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=M2cZmscEFTlqW/9wuWvHckwWLerLXDXMuxJCyG3m8MA=;
 b=hwSz9z8wSBrTH76b24ktBvL5cM7DUV6FT6rURbsTlpzE6OcHmpBCNqpl4/jLXXe8Kq
 e70I8LWKfRyk2j9tj7EG1Vk/ZMUcywaYfNyX8U0Ay/PpmfETC/dCTrxNr21lMyIh/vRa
 1LV6GVt8BYxMr7L9n1ndJ6gkG0NLImMqNQox1w9Y2w9IaSeTZOyVCFJvaqTaBr7ksTxX
 REd4VSY1B5kVb6rlPqWQTMh6ChlU04q2PGh8E9hlgJnQWow3Kj5pRP6xadtWKEbWbPTX
 NdRjYX9c8P4ogMGbF1UvA9sHFET6rNhLXSPfDFupMhGb0f7ERHMiBNIfOO51UxwB6nQr
 2G7w==
X-Gm-Message-State: AOAM5337YIR2PmEUkk8RPc++XgLp1K8BQ24jZ+/knKTVNqoUtISQ/7Bi
 CDsdxRa/YzXKFliWCQn+Zvn3oQ==
X-Google-Smtp-Source: ABdhPJyfTxf3m2njrS6ZLxEEgvkeBT1tDO2sfs7nY4yDaNaGOhW9vMwhiiOLyHQqMs4UVdwTHRoMog==
X-Received: by 2002:a17:90b:1b4f:: with SMTP id
 nv15mr534242pjb.105.1612314204643; 
 Tue, 02 Feb 2021 17:03:24 -0800 (PST)
Received: from [192.168.10.153] (124-171-107-241.dyn.iinet.net.au.
 [124.171.107.241])
 by smtp.gmail.com with UTF8SMTPSA id d195sm169068pfd.216.2021.02.02.17.03.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Feb 2021 17:03:23 -0800 (PST)
Message-ID: <0e650515-b9b7-2ee7-cc8a-02621ec89aa5@ozlabs.ru>
Date: Wed, 3 Feb 2021 12:03:19 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101
 Thunderbird/85.0
Subject: Re: [PATCH kernel] powerpc/uaccess: Skip might_fault() when user
 access is enabled
Content-Language: en-US
To: linuxppc-dev@lists.ozlabs.org
References: <20210202091447.36234-1-aik@ozlabs.ru>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20210202091447.36234-1-aik@ozlabs.ru>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 02/02/2021 20:14, Alexey Kardashevskiy wrote:
> The amount of code executed with enabled user space access (unlocked KUAP)
> should be minimal. However with CONFIG_PROVE_LOCKING or
> CONFIG_DEBUG_ATOMIC_SLEEP enabled, might_fault() may end up replaying
> interrupts which in turn may access the user space and forget to restore
> the KUAP state.
> 
> The problem places are strncpy_from_user (and similar) which unlock KUAP
> and call unsafe_get_user -> __get_user_allowed -> __get_user_nocheck()
> with do_allow=false to skip KUAP as the caller took care of it.
> 
> This changes __get_user_nocheck() to look at @do_allow to decide whether
> to skip might_fault(). Since strncpy_from_user/etc call might_fault()
> anyway before unlocking KUAP, there should be no visible change.
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
> 
> 
> This an attempt to fix that KUAP restore problem from
> "powerpc/kuap: Restore AMR after replaying soft interrupts".
> 
> 
> 
> ---
>   arch/powerpc/include/asm/uaccess.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
> index 501c9a79038c..cd6c0427a9e2 100644
> --- a/arch/powerpc/include/asm/uaccess.h
> +++ b/arch/powerpc/include/asm/uaccess.h
> @@ -313,7 +313,7 @@ do {								\
>   	__typeof__(size) __gu_size = (size);			\
>   								\
>   	__chk_user_ptr(__gu_addr);				\
> -	if (!is_kernel_addr((unsigned long)__gu_addr))		\
> +	if (!do_allow && !is_kernel_addr((unsigned long)__gu_addr)) \


ah my bad, must be "if (do_allow..."


>   		might_fault();					\
>   	barrier_nospec();					\
>   	if (do_allow)								\
> 

-- 
Alexey
