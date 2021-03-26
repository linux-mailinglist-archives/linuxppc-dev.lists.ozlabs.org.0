Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 829D4349F4E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 03:05:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F650q14Ylz3c0N
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 13:05:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=GjUuWAup;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::52e;
 helo=mail-pg1-x52e.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=GjUuWAup; dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F650N0JL7z30CL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 13:05:20 +1100 (AEDT)
Received: by mail-pg1-x52e.google.com with SMTP id h25so3598129pgm.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Mar 2021 19:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=yKhmmXY4pTqCWXAljZwZF1SSxy2c+IrHiu41koX7ecI=;
 b=GjUuWAup17rU3k6hJzbVBoLpdx1x9vaBoRfVofdlodQDzk3DkIuj2xbDWykBCUopR8
 a3Rv65ZOMsBk9ehPsXqLN8xzYdi0bEZJfm6JekzWtJcrYVIhTqTFlSDhjQm6Grl3H76V
 ihS1r503zJa5FVBIJL6S/va79niYeihhuOtIr0IBEXrAyMoVRBL6MYPBebfmJp6sXO0i
 txfssh/1GBPgUxmJckwXb9Ja9VBapseEEYlxZ5pqCMcaEyJV3y00Za+iJlYU+IhDu3yo
 WU+T3GgSVxWgrWlDhlVE1qB9/QmqOufOEoMd9UVjyf8pGAq9yHwRUjn/7TjeLqTrBvl5
 nDtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yKhmmXY4pTqCWXAljZwZF1SSxy2c+IrHiu41koX7ecI=;
 b=jxoun3v+NBTf55JPToLILEJpYi4Hs/GCdILakTTAquyC/9DxIDNlzxTeJMBkvfBoXP
 KqiN+fzYjrUBQnVKj1gJW1EGyMKdQ4z5mgN9KnAD1ksN2/eWxlMZPPCofPjcMs6Layr7
 01MrIAx/C1tVdovfkY8R+Gdt7KO1hCqhyEbGJ8TSlb5/4oS+RC1n7WaIcXKLCRlIsejA
 r+djlltkLeWjPgW8hwIH9VJAX8qs97uOfRmU7m+in4jttdIfqLAOu5WtmM6ncrYnTGui
 d8IE6tNP75E1MKXSq3x+NE6zYXEjuQPiiZKuDqsF2iFal+DusjB7ZYbU9RT48mS0CYSa
 Nnkg==
X-Gm-Message-State: AOAM533mRaoWJv5eBaIncaR38j3XcDZv2I122PuDh/+A9kkOsPYxfs6T
 lAwfyiJ7RZrZeylnDOs2+3Hn0NXJfkFxfQ==
X-Google-Smtp-Source: ABdhPJytNWZBIFBatQ0RJL7vsJKciW8PCsq+Tu4UZ5ZSHSUmrZ0jmUWmQkMo8hWDzHUdZHcmVXCHuA==
X-Received: by 2002:aa7:9a95:0:b029:1f3:4169:ccf2 with SMTP id
 w21-20020aa79a950000b02901f34169ccf2mr10373184pfi.14.1616724314826; 
 Thu, 25 Mar 2021 19:05:14 -0700 (PDT)
Received: from [192.168.10.23]
 (ppp121-45-194-51.cbr-trn-nor-bras38.tpg.internode.on.net. [121.45.194.51])
 by smtp.gmail.com with UTF8SMTPSA id r10sm6800294pfq.216.2021.03.25.19.05.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 19:05:14 -0700 (PDT)
Message-ID: <11ba0a43-a64a-ca06-581c-e8b7dc97b1d7@ozlabs.ru>
Date: Fri, 26 Mar 2021 13:05:10 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:87.0) Gecko/20100101
 Thunderbird/87.0
Subject: Re: [PATCH v4 24/46] KVM: PPC: Book3S HV P9: Use large decrementer
 for HDEC
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
References: <20210323010305.1045293-1-npiggin@gmail.com>
 <20210323010305.1045293-25-npiggin@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20210323010305.1045293-25-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 23/03/2021 12:02, Nicholas Piggin wrote:
> On processors that don't suppress the HDEC exceptions when LPCR[HDICE]=0,
> this could help reduce needless guest exits due to leftover exceptions on
> entering the guest.
> 
> Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>


ERROR: modpost: "decrementer_max" [arch/powerpc/kvm/kvm-hv.ko] undefined!


need this:

--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -89,6 +89,7 @@ static struct clocksource clocksource_timebase = {

  #define DECREMENTER_DEFAULT_MAX 0x7FFFFFFF
  u64 decrementer_max = DECREMENTER_DEFAULT_MAX;
+EXPORT_SYMBOL_GPL(decrementer_max);


> ---
>   arch/powerpc/include/asm/time.h | 2 ++
>   arch/powerpc/kvm/book3s_hv.c    | 3 ++-
>   2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
> index 8dd3cdb25338..68d94711811e 100644
> --- a/arch/powerpc/include/asm/time.h
> +++ b/arch/powerpc/include/asm/time.h
> @@ -18,6 +18,8 @@
>   #include <asm/vdso/timebase.h>
>   
>   /* time.c */
> +extern u64 decrementer_max;
> +
>   extern unsigned long tb_ticks_per_jiffy;
>   extern unsigned long tb_ticks_per_usec;
>   extern unsigned long tb_ticks_per_sec;
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 8215430e6d5e..bb30c5ab53d1 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -3658,7 +3658,8 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
>   		vc->tb_offset_applied = 0;
>   	}
>   
> -	mtspr(SPRN_HDEC, 0x7fffffff);
> +	/* HDEC must be at least as large as DEC, so decrementer_max fits */
> +	mtspr(SPRN_HDEC, decrementer_max);
>   
>   	switch_mmu_to_host_radix(kvm, host_pidr);
>   
> 

-- 
Alexey
