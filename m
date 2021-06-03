Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1096239A228
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 15:24:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fwmp33ptvz3098
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 23:24:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QBsI4a6r;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bJvAgi8H;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=trix@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=QBsI4a6r; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=bJvAgi8H; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwmnZ3q7Vz2yj1
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jun 2021 23:24:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622726635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I2nBspPjF20/3Fz9Ced5rD4OQmXVJBuSYoh/YGtujCs=;
 b=QBsI4a6rpbVwFPj25x2EEv9dtL5N6/NVflB9pKgE07YNJTCcceerpqt7b60s75YyNhropZ
 Wnwra66Ng0nN69GuYoqpIMkbhMnfDJ8/pPzzz9MpRZ06v/6xuJRmAR5B6HXIQZdXnWc/mN
 XCWLmMdkOj3V9IYl0B3Gy9XzSbdJIUI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622726636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I2nBspPjF20/3Fz9Ced5rD4OQmXVJBuSYoh/YGtujCs=;
 b=bJvAgi8HzUQdVztQ/S5tabRLOka/Jmq49OZrXO1mGjhqIdC0PRkOtEDivd+PYBx1+bpwLa
 Ax9eav4pWyNF9PFWmeBbWOQ4Ji77bw25O5vYYlEJcsE02UY1vGE8gHioSslw6apx9nEdM2
 vWZuxknddPmW5iUerKQgyiFm+8rl0kY=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-4QBgF2JgPnOg_pP51tp8_Q-1; Thu, 03 Jun 2021 09:23:53 -0400
X-MC-Unique: 4QBgF2JgPnOg_pP51tp8_Q-1
Received: by mail-oo1-f69.google.com with SMTP id
 i3-20020a4a6f430000b0290248e8fe5cbcso763251oof.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Jun 2021 06:23:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=I2nBspPjF20/3Fz9Ced5rD4OQmXVJBuSYoh/YGtujCs=;
 b=E9lM9r7ETuY9C9HoSLD4bndEM8uv0ykiX7IUFGdXiV5m8wOVFH/UwqXr889/O4R0r/
 r2bgPI87C1cr8muDCOccx0LKSvGcJqY/oz/LvWU/lOpQ5MUgVmMkxz77hQVQCXfun31q
 vde0+IXwakQGvdB3PMMMl+owF+twIVGArRLylqyrtzbGX0apQcLtPcdy9d2loR+8d95Q
 +UKB0Qod4uGQyDoCSQ3Xpljye4npeu3kX17xdMxuMf5FGWIi+jZs4VkIWQAeOtLZFFyx
 UxXZGnMLrUmMbKiVDkMH0ep6iUaUnvPpwaHW7l8pLxxNlUlFOpR4JUz5Dir+NYEuZIq9
 ERDQ==
X-Gm-Message-State: AOAM530uaaV8BN0QY21q+RweD1XfUyrSyn2pWVnhlQEoU+7Ycz1m09Tq
 uIAl0rIIysU3pvdTAidutD8xX7b7q2ky+qLaLvmnT5S1OIvb4zEGNcm75chn/iyykZuF879vj0Y
 jH5Kf5lADQqHQOgcgQGAXTM4uWwSAo318Yz7iRGKp2Xn5V6dcJ4E6PQ2lgCpqqqzPgAOG+TWE
X-Received: by 2002:a05:6830:4006:: with SMTP id
 h6mr5586612ots.348.1622726632501; 
 Thu, 03 Jun 2021 06:23:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+9F/VkBceYlmAJQlazH/NI64dO2xB52KTX53ZpD0nVzlCS2Qb1fhML4o9/H0tm/a7+EM6Lw==
X-Received: by 2002:a05:6830:4006:: with SMTP id
 h6mr5586593ots.348.1622726632243; 
 Thu, 03 Jun 2021 06:23:52 -0700 (PDT)
Received: from localhost.localdomain (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id q26sm655035otn.0.2021.06.03.06.23.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 06:23:51 -0700 (PDT)
Subject: Re: [PATCH] powerpc: Remove CONFIG_PPC_MMU_NOHASH_32
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <bf1e074f6fb213a1c4cc4964370bdce4b648d647.1622706812.git.christophe.leroy@csgroup.eu>
From: Tom Rix <trix@redhat.com>
Message-ID: <d201a021-fe6f-4240-8ba6-095e1d9badde@redhat.com>
Date: Thu, 3 Jun 2021 06:23:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <bf1e074f6fb213a1c4cc4964370bdce4b648d647.1622706812.git.christophe.leroy@csgroup.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 6/3/21 12:53 AM, Christophe Leroy wrote:
> Since commit Fixes: 555904d07eef ("powerpc/8xx: MM_SLICE is not needed anymore"),
> CONFIG_PPC_MMU_NOHASH_32 has not been used.
>
> Remove it.
>
> Reported-by: Tom Rix <trix@redhat.com>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Thanks, one less for me to do.

There are about ~100 similar tree wide, I'll be posting these soon.

Tom

> ---
>   arch/powerpc/platforms/Kconfig.cputype | 4 ----
>   1 file changed, 4 deletions(-)
>
> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
> index 885140055b7a..dc7c46f92302 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -424,10 +424,6 @@ config PPC_MMU_NOHASH
>   	def_bool y
>   	depends on !PPC_BOOK3S
>   
> -config PPC_MMU_NOHASH_32
> -	def_bool y
> -	depends on PPC_MMU_NOHASH && PPC32
> -
>   config PPC_BOOK3E_MMU
>   	def_bool y
>   	depends on FSL_BOOKE || PPC_BOOK3E

