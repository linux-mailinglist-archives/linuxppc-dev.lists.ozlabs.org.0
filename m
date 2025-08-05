Return-Path: <linuxppc-dev+bounces-10672-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE902B1B92E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Aug 2025 19:20:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxKtS4yTkz3bn4;
	Wed,  6 Aug 2025 03:20:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754414400;
	cv=none; b=IrGMl50qUX9zcQokK3jLe6emyynZc9oq5GZM6VSgT33RT8rl72DkEla6LjJuwKvxEKa2F6a12xZv3uqDLufG0lSmyPk78HW9+zZj46/HWlMADIn+ixM+1DDzTqgRS0NsPITj7bT/NTYEarfB3u7Tufi/jXz3/+CIOYeFP5e8NzVT2K5QiDCnW6SSEY+ZYH2+wBTbkw1FrWLhe7q7rK4wJyyTS3cvGXcLI78ZHisFkt8JZx7xc75fD3G+Xu8KfHikgaFfA1gv8tMXvzQEcUGq591Jc0dQf7WwdiIqwpbIxEuPntaNmsg5Hy9H6EAbPLLzLds3kU6LZG7tiwAXiQnZYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754414400; c=relaxed/relaxed;
	bh=Q/FfZaSan1eV7HDF3Wa83lEa0xPcSUpZYrzYE5G9wjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n9ejvfF4YXFjKvnV3dJz/ikxEpMjhepDewZe88JqTG18gdNUQZ6f/GYjoVeW/uXGev3KfQn5mtWdXuUr5RzO23GYzTDzsopG2EHflEsa2DfHWnnR2mH8NIFts2791oVBW1UAn16+/NpY0praz6p8KS8pmI3K2qTTNqF/ZA6gPHCWAEvtl0Zcbw/Zw/0UnM97j35+VnsoZcIS7UxQlt8jrSEqExXarTYUX1cTnIxnwll6Zzy6u+Q1xX1gYLtVBqb+tJnMFlH0icDpp4LFG+fzNABde+a+2zszHeCRfbayivy7SGngs2BxFGohFz8cQ5+gjmyh8lDoYIt0mU4R+HEhpQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OlVLHgJ4; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=ryabinin.a.a@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OlVLHgJ4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=ryabinin.a.a@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bxKtR5j5Jz3bmy
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Aug 2025 03:19:59 +1000 (AEST)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-55b858e8778so214019e87.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Aug 2025 10:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754414396; x=1755019196; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q/FfZaSan1eV7HDF3Wa83lEa0xPcSUpZYrzYE5G9wjk=;
        b=OlVLHgJ4EZ5G48jg0C6psXlRzCBjDHAFPELgoEtm683JBIPXH0mFhrGKhmrDl9i1BI
         KWTcVK7n1MfhiZ3CjsI+vT364MS87jqIehPy7NfPXBfFdotwo5MsX65R/83c1cmBpmWT
         IS9aQK4PgynxSLmBkcWRMua46SUTtGC5bcaMEVC/9i61qXla73X1XV2AY9aoasV3fVh9
         w7SHA+jYN5gr42v1P1p6rTBhY7Opzkyk/PDo8ycTozWe21ojB5NGkjquCKLFWJ1+evxu
         mAilyZZrs9Tn6wBHM70z4VFs5Uvh3FmSKBR1V3R1SdrxZHn1FYy23BLZfnoHeg6VDwVw
         ld3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754414396; x=1755019196;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/FfZaSan1eV7HDF3Wa83lEa0xPcSUpZYrzYE5G9wjk=;
        b=DoFaIIJNIFW1drdr0YZPcbaZQIHLNW/dKYVRuPHWOIcJ0J/VhAlIdVoXYH4mgNCC38
         x2Gz55kplfAm/5SunKwiEZYP/83MG+hi+U8leYcV8Ur3MnKrjaF9BXT3AqfJoFc0wYPW
         l3gpXb6chxeGURGkasqsLbG0nYhg0DlqF9Y7+GTvtB36KpAaws2GA+7NfFvFmBnLM9WS
         oddpyVDlFvA60MUHf/sCgFsyeJ2eCu+IvCMZYqAQRNLcuTvREfd+iMD1AE4ZqjeNFO2J
         yiTM4mKHlUNN+V+NcuEMArzDzLMNYahRCz7DaEJcsYAqiKtg3GrUe5dkMm3Ob6pdV1jt
         tIWg==
X-Forwarded-Encrypted: i=1; AJvYcCUOCdRXD1eWxOi2tul06Kej9W8LIhJrtLVx3JSDSB3S2EEA6oUJdbk1mkWzU6/KoorRHe+lY9x79+Gbp64=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw4zu82Fd8axNSdKD7F7ReKWVbd8yqWbtTUDdXRA0fqMSk0XN6J
	dgSd45aQ5dtL3pVcu7MVgx4vzg4BxxR/1FBQ6nKWVHA3vnWhAGm8LZ3S
X-Gm-Gg: ASbGncvEpgkdwbjrhrZJL1928xGgP59Nk3aSnGeWzupK4Ge8zRtZLdmi750EqvviISl
	Bs1yfwmlLvN7lEB2wPnswzLAlWrnOFh2nxIci1Wuf9B0Xisgl47ffyjKrX+luV2AAmFxWPaqNs3
	4gbaJXosT/sPasGNZGV6D17rVGVYwK6PsIQXVuYitVzNioz9cr0cakz/twXIvv5RthJVCkEWH4z
	qLcCBFNRoAblj/n2tkRAq005rWNCbIs8jQIH+pztbw3EYY0KvW1BF5TVsrudeMC+Eee3YBtbdEJ
	ZGrwl8L+tXAuDfPvaf8LmKF7r2uQpAmU8uPWfC8m3d4c965hEj3jJznpurE2NtM+2iGDYSiGE8p
	phb5cZKCYWgQcRi4QLuN2Dn6BT45K
X-Google-Smtp-Source: AGHT+IFZ9pdK1jvsk2cxgalB1qSoH0zZWAWc/VG+Lc+QySUYQJ+aNEU1tTzI15MgaTEZ+riRKR17/A==
X-Received: by 2002:a05:6512:6d1:b0:553:2480:230a with SMTP id 2adb3069b0e04-55b979b819amr1540170e87.0.1754414396425;
        Tue, 05 Aug 2025 10:19:56 -0700 (PDT)
Received: from [10.214.35.248] ([80.93.240.68])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-332382a9483sm19586481fa.23.2025.08.05.10.19.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 10:19:56 -0700 (PDT)
Message-ID: <60895f3d-abe2-4fc3-afc3-176a188f06d4@gmail.com>
Date: Tue, 5 Aug 2025 19:19:09 +0200
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
Subject: Re: [PATCH v4 6/9] kasan/um: select ARCH_DEFER_KASAN and call
 kasan_init_generic
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>, hca@linux.ibm.com,
 christophe.leroy@csgroup.eu, andreyknvl@gmail.com, agordeev@linux.ibm.com,
 akpm@linux-foundation.org, zhangqing@loongson.cn, chenhuacai@loongson.cn,
 trishalfonso@google.com, davidgow@google.com
Cc: glider@google.com, dvyukov@google.com, kasan-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-um@lists.infradead.org, linux-mm@kvack.org
References: <20250805142622.560992-1-snovitoll@gmail.com>
 <20250805142622.560992-7-snovitoll@gmail.com>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <20250805142622.560992-7-snovitoll@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 8/5/25 4:26 PM, Sabyrzhan Tasbolatov wrote:
> 
> diff --git a/arch/um/Kconfig b/arch/um/Kconfig
> index 9083bfdb773..8d14c8fc2cd 100644
> --- a/arch/um/Kconfig
> +++ b/arch/um/Kconfig
> @@ -5,6 +5,7 @@ menu "UML-specific options"
>  config UML
>  	bool
>  	default y
> +	select ARCH_DEFER_KASAN

select ARCH_DEFER_KASAN if STATIC_LINK

>  	select ARCH_WANTS_DYNAMIC_TASK_STRUCT
>  	select ARCH_HAS_CACHE_LINE_SIZE
>  	select ARCH_HAS_CPU_FINALIZE_INIT
> diff --git a/arch/um/include/asm/kasan.h b/arch/um/include/asm/kasan.h
> index f97bb1f7b85..81bcdc0f962 100644
> --- a/arch/um/include/asm/kasan.h
> +++ b/arch/um/include/asm/kasan.h
> @@ -24,11 +24,6 @@
>  
>  #ifdef CONFIG_KASAN
>  void kasan_init(void);
> -extern int kasan_um_is_ready;
> -
> -#ifdef CONFIG_STATIC_LINK
> -#define kasan_arch_is_ready() (kasan_um_is_ready)
> -#endif
>  #else
>  static inline void kasan_init(void) { }
>  #endif /* CONFIG_KASAN */

