Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C0E6CABE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 10:16:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45q6Qj0f06zDqXw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 18:15:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.b="MfU7zanx"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45q6NB4hhtzDqKS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 18:13:46 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id c73so12234136pfb.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 01:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WEPQWB9mL7qVaCOqVBJLCz5vsDHBMIw1+BdS4ATmzgQ=;
 b=MfU7zanxbv9W4UR9Jm9cRC1ssg0R8tJalTrmiDVVaixvRRDkLeAVGFMA/uNkbpOa+D
 jvpp9Z5eb417ob7VF4kFtVHZC48Lck2SAulQIXeJgt1v8Dl7LeD5SOsZ2Mbw/OPTZDQR
 9CrmsuhLaWXhojYzNwye0Px6EFygP/7sSZUBBK/dh8/PlRTfwvsVYh3w0WVGd4sm32W8
 OfFCrOH5636iRoq5zvvnmEI0Gwp093U9jrZm8W6O9jCtw75PA8Hmnzyi+lPlhfYn3h1s
 z/y3Qu9eORQGiqfnYehet7qlxgR+YqMzKt9G4yVGU7yp5SdTh1GSD+3b8ywVvgFXWIJ4
 +d9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WEPQWB9mL7qVaCOqVBJLCz5vsDHBMIw1+BdS4ATmzgQ=;
 b=LfMq0KZZGSVb9Dlc5ebZSPbhKTtLBLA02ACtr8wRZ1i34+oott6QbIE8x1l24AKRSo
 mBYonmNHsaRdVltZvvTyI9rCS4X3obcZWbxiJSG6d639VhLqYXsB76NBM9Vd6HJ/6xSt
 /4PE6yZWtcu97gUCEycvhsoVJ4ZkhGILZyjwQ9v3ptyV0+lvwu0R/IUbVw3+iUg3N/7N
 rdQXhA1LaS/okVl5F/bVbEG6Kc1Vo4tGa7xQ4RqkqSiI1dbhxByaUqzpDhjHa+9hwK/4
 qhWJ1Gk6Z1AT6nBwfI9ZhwNsvJbaixR/p5xxPlbxvqZInr5EwVBxi3A6QmET4phjwkeK
 QFYA==
X-Gm-Message-State: APjAAAUZqxpwm2K77d+51uH43LfrIGkm5YD4lXq5zevrXtrbkOcRNH5W
 Z9CRUBYhdyN1S1X4iYfKdJU=
X-Google-Smtp-Source: APXvYqwYbAyTAJi5PUBKz5SoezdiiL/6tSMEnS1yZRWW4nvvCzwLv5HlG+A48+VgqzdCLGCq9W2gxg==
X-Received: by 2002:a63:490a:: with SMTP id w10mr45466506pga.6.1563437623905; 
 Thu, 18 Jul 2019 01:13:43 -0700 (PDT)
Received: from [10.61.2.175] ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id f72sm37999820pjg.10.2019.07.18.01.13.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Jul 2019 01:13:43 -0700 (PDT)
Subject: Re: [PATCH v2 04/13] powerpc/pseries/svm: Add helpers for
 UV_SHARE_PAGE and UV_UNSHARE_PAGE
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
References: <20190713060023.8479-1-bauerman@linux.ibm.com>
 <20190713060023.8479-5-bauerman@linux.ibm.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <4fcc84ae-b93a-b5f1-fba4-b0e2af7b727c@ozlabs.ru>
Date: Thu, 18 Jul 2019 18:13:37 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190713060023.8479-5-bauerman@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Anshuman Khandual <anshuman.linux@gmail.com>,
 Mike Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 linux-kernel@vger.kernel.org, Claudio Carvalho <cclaudio@linux.ibm.com>,
 Paul Mackerras <paulus@samba.org>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 13/07/2019 16:00, Thiago Jung Bauermann wrote:
> From: Ram Pai <linuxram@us.ibm.com>
> 
> These functions are used when the guest wants to grant the hypervisor
> access to certain pages.
> 
> Signed-off-by: Ram Pai <linuxram@us.ibm.com>
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/ultravisor-api.h |  2 ++
>   arch/powerpc/include/asm/ultravisor.h     | 15 +++++++++++++++
>   2 files changed, 17 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/ultravisor-api.h b/arch/powerpc/include/asm/ultravisor-api.h
> index fe9a0d8d7673..c7513bbadf57 100644
> --- a/arch/powerpc/include/asm/ultravisor-api.h
> +++ b/arch/powerpc/include/asm/ultravisor-api.h
> @@ -25,6 +25,8 @@
>   #define UV_UNREGISTER_MEM_SLOT		0xF124
>   #define UV_PAGE_IN			0xF128
>   #define UV_PAGE_OUT			0xF12C
> +#define UV_SHARE_PAGE			0xF130
> +#define UV_UNSHARE_PAGE			0xF134
>   #define UV_PAGE_INVAL			0xF138
>   #define UV_SVM_TERMINATE		0xF13C
>   
> diff --git a/arch/powerpc/include/asm/ultravisor.h b/arch/powerpc/include/asm/ultravisor.h
> index f5dc5af739b8..f7418b663a0e 100644
> --- a/arch/powerpc/include/asm/ultravisor.h
> +++ b/arch/powerpc/include/asm/ultravisor.h
> @@ -91,6 +91,21 @@ static inline int uv_svm_terminate(u64 lpid)
>   
>   	return ucall(UV_SVM_TERMINATE, retbuf, lpid);
>   }
> +
> +static inline int uv_share_page(u64 pfn, u64 npages)
> +{
> +	unsigned long retbuf[UCALL_BUFSIZE];
> +
> +	return ucall(UV_SHARE_PAGE, retbuf, pfn, npages);


What is in that retbuf? Can you pass NULL instead?


> +}
> +
> +static inline int uv_unshare_page(u64 pfn, u64 npages)
> +{
> +	unsigned long retbuf[UCALL_BUFSIZE];
> +
> +	return ucall(UV_UNSHARE_PAGE, retbuf, pfn, npages);
> +}
> +
>   #endif /* !__ASSEMBLY__ */
>   
>   #endif	/* _ASM_POWERPC_ULTRAVISOR_H */
> 

-- 
Alexey
