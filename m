Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C429F84EF63
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 04:29:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=L4yinsu8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWK8S5HLWz3cTZ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 14:29:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=L4yinsu8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2c; helo=mail-oa1-x2c.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWK7f24gWz2xdh
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Feb 2024 14:28:28 +1100 (AEDT)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-214c940145bso255662fac.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Feb 2024 19:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707449305; x=1708054105; darn=lists.ozlabs.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HxzGG9tiVnG9eoQG9HjEplP7zHqtFTQIBWqH3c45mMU=;
        b=L4yinsu8nu6scJm0/N8DHP5HswSa6e0Vb8KmOYjTdwndTKBiATAbLrojTdbL81+ep8
         9aefYHBG6m67BHbd/4i6+F0tJOSCmBEmIat9MZ/uwmXkrR26QziPT5453YMw1GWz7+pl
         mIMuW/iCTCITZxqVDH5NSu23x/pPyPltzIaDeny7Fo60C/EucOe4xF7izP5O+ORRFDDx
         vfcoQdwgrdMaDXiJRsKqzr/7GUOLNDVcIGNIf4893V3aE+bcNW1Psn7WmvVZkWMb6KN7
         xt3rRPLRA8mBfJ3LjFXf4ENaTLzcQ00rDgp4oNEWaeYmTBfRIvtp+AXa2S0hSqkxaviN
         6BbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707449305; x=1708054105;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HxzGG9tiVnG9eoQG9HjEplP7zHqtFTQIBWqH3c45mMU=;
        b=VYwseUAl0xkh2Ru7hqLwsnvhKqFsttPQqOXpTYXRVfDPri4UMDTBKhwb7hFxq53Rfg
         s9nDWh4wWKv7ctq07nsoJGf117J25He22bT5p/SaN/jDRYdHEKmgpe4+lEeu77YPHx2C
         AvFKFQwQQnZdCTQTzSE+luKkZhzYR4dLpP60I56JAyNrsgAiT+m40B5cPZWuIulksDDs
         BEVvTVeUxpiFdOUQKZ5o7U2KqsuCzJ6pgIqTjmHMOuJg2XlVJsYVLLTnKksuZOybcVep
         rNQm4Jwqeg/GJCf1gdLO6eN6rBwM9tTIlyMzuQdOaWVOD1DT+i9BEWBoA0E9KBRTFzI4
         H2TA==
X-Forwarded-Encrypted: i=1; AJvYcCWQ8s+OwP3oKcmglSRO2pVidLfpSGEHejT7wpJngj1EFLdAQYlSENSuUfL+faY7HF84Dq+/46IBhNisaaR3I4G/XtkcDU3ELM6cW+8Ylg==
X-Gm-Message-State: AOJu0YyV1OEZUuaDXAPyT10UbYSxZ+qlH7V+4SnXHQ5Sb5lzSv1mnZLJ
	LZSyITQrrLU0xinUy3169nzmbXeB6eHlEeMQEhrqBTyF5x1duPhG
X-Google-Smtp-Source: AGHT+IGJdYdAowW+FidRJBjJ5PRhE+P1LKYarWAESwpfBnD1uwZNpuEkdkLlM9TfbBRzyA0on78BAA==
X-Received: by 2002:a05:6870:c112:b0:219:42a8:5d83 with SMTP id f18-20020a056870c11200b0021942a85d83mr406135oad.3.1707449305032;
        Thu, 08 Feb 2024 19:28:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVULcZwPASQ+q6GP71T+MBtAqLWnLhugVfu4p8gmhSXuqNlEUODQuUxkyi2MEX6/l0cRKubC3JOSTZc0xPPaulE0+M39DBGhW9UnwmD7LC5KGv0u8vEQ3mmpVz4lm7Ai+truexjLt1afFD9ijiN9wUwMWdmN39tdsMwXPeMSUF7GPbHKsDiYREm6QPo5XKoOAh6LFvGDL3RMZClxq6HS6jVHV/2uHCugx+SDFEaASJB126BYDE4AH87u/Ipw0LeAGy1zpLjUdZLR6+h
Received: from localhost ([1.146.65.44])
        by smtp.gmail.com with ESMTPSA id m7-20020a654387000000b005dc389409c1sm475022pgp.93.2024.02.08.19.28.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Feb 2024 19:28:24 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Feb 2024 13:28:17 +1000
Message-Id: <CZ089ERGIDWI.14PQB4HD4F1NH@wheely>
To: "Alexander Gordeev" <agordeev@linux.ibm.com>, "Frederic Weisbecker"
 <frederic@kernel.org>, "Ingo Molnar" <mingo@kernel.org>, "Michael Ellerman"
 <mpe@ellerman.id.au>, "Heiko Carstens" <hca@linux.ibm.com>, "Vasily Gorbik"
 <gor@linux.ibm.com>
Subject: Re: [PATCH v2 1/5] sched/vtime: remove confusing
 arch_vtime_task_switch() declaration
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.15.2
References: <cover.1707422448.git.agordeev@linux.ibm.com>
 <f5c88d9290bca3b280cfdd499c236a3c390af51b.1707422448.git.agordeev@linux.ibm.com>
In-Reply-To: <f5c88d9290bca3b280cfdd499c236a3c390af51b.1707422448.git.agordeev@linux.ibm.com>
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
Cc: linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Feb 9, 2024 at 6:15 AM AEST, Alexander Gordeev wrote:
> Callback arch_vtime_task_switch() is only defined when
> CONFIG_VIRT_CPU_ACCOUNTING_NATIVE is selected. Yet, the
> function prototype forward declaration is present for
> CONFIG_VIRT_CPU_ACCOUNTING_GEN variant. Remove it.
>

And powerpc arch_vtime_task_switch is static inline too,
so this just confuses things.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> Reviewed-by: Frederic Weisbecker <frederic@kernel.org>
> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
> ---
>  include/linux/vtime.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/include/linux/vtime.h b/include/linux/vtime.h
> index 3684487d01e1..593466ceebed 100644
> --- a/include/linux/vtime.h
> +++ b/include/linux/vtime.h
> @@ -18,7 +18,6 @@ extern void vtime_account_idle(struct task_struct *tsk)=
;
>  #endif /* !CONFIG_VIRT_CPU_ACCOUNTING */
> =20
>  #ifdef CONFIG_VIRT_CPU_ACCOUNTING_GEN
> -extern void arch_vtime_task_switch(struct task_struct *tsk);
>  extern void vtime_user_enter(struct task_struct *tsk);
>  extern void vtime_user_exit(struct task_struct *tsk);
>  extern void vtime_guest_enter(struct task_struct *tsk);

