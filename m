Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A4189B79C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 08:29:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GU7kB4ph;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VCfLs2QBnz3vX0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 16:29:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GU7kB4ph;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com; envelope-from=philmd@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VCfL46QMgz2xKQ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Apr 2024 16:28:26 +1000 (AEST)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-56e6282dd72so399220a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 07 Apr 2024 23:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712557700; x=1713162500; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z6EgD/Muel3BqCojSMMdXuM1Td/LzqFDog01ouaIAt4=;
        b=GU7kB4phgiLkSm4tBrfaMWS/dC7gsF7A5kFiW/Zx9Y7lysQmuqupoQAlifVdAdvne2
         h+ZUKlQ40OTNi8hXAeBXmletuX9rIs4jP2Si3KYcAfj5/R4fsAVzAmQNqIXs9P0L5x20
         v6TL0MDOcJ56JbiFL3ocUCSSeLwprXnHGrJylVjTu8/W9HEqMqQ0bhtNnTgKxAc60oyG
         m43yBJ6P3locDelrkoh0z35nxSWSJlIhIBozJmv+SQehzH5lqzObS15ykj3CJ876riCK
         DrvaJwiTJu05l57/aL4rA9VKu5Deqtri/omCy9WKYvWKRlmBirzRGa4THbjT9lZUZ4fn
         fO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712557700; x=1713162500;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z6EgD/Muel3BqCojSMMdXuM1Td/LzqFDog01ouaIAt4=;
        b=qxgMMZqfRrjJSx4+dmKxWQXFH8wkji7ieq/vhULU8/kDL0ZuPuiuFqCPMplzG1ZohT
         oCkLuOPK1Df+mOlMjYaYxR1GHxhZKaXk2/vrMkRY32SqK7iaTj1kvm7kxOqSFU4DS7JN
         luytPoxx+jw32Sx8kvgMGehBnHDL5CVxlS5Jb12Eid6t3c+6V/c3lnh20OCwpxomCDbe
         F+2tAyOQZ4cSXW1V2poYti4ydUIonr9TWYMHyv/U4BoYqxA/+766mEk3RRsT0+gpXRhx
         2q2aUz9opkv9rPan1gEumMI9gM6GJk7tY2km///+VBoXJm7codyL/lk56XXK/RYPwYxh
         XrFA==
X-Forwarded-Encrypted: i=1; AJvYcCUQXoNP8OzS/w10zESYuSuNskFzToYVqT8lsthwAdEVQtLtdv4zZAIxDiNPKqTpJPyKjtFH+bYZ/0VWmxr4iN6ikn16ETYx/XPYy/Sh2g==
X-Gm-Message-State: AOJu0YxZGQiG0VbLt7Ng2EzI4mdAMMgZEs3oy5ZvQNaJBSlhrW5USaK3
	9MgearKiGIEOYu8pXUoL2s2+BMFatGibm/oGtXAcT7/lZz2iPTNOZZcj70jqmyM=
X-Google-Smtp-Source: AGHT+IEW7NFlAXtt0eb3qEVFrk9JxABFiNRfMx5pOzC0ESg5/RMCffY6KCodQ4v8J7x5a4GlkvTfcw==
X-Received: by 2002:a50:bae3:0:b0:56c:18d5:1e27 with SMTP id x90-20020a50bae3000000b0056c18d51e27mr5576700ede.5.1712557699936;
        Sun, 07 Apr 2024 23:28:19 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.144.67])
        by smtp.gmail.com with ESMTPSA id k19-20020aa7c393000000b0056bfb7004basm3538428edq.90.2024.04.07.23.28.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Apr 2024 23:28:19 -0700 (PDT)
Message-ID: <2e481816-2b06-432c-b09c-e92e230debe8@linaro.org>
Date: Mon, 8 Apr 2024 08:28:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] mm: replace set_pte_at_notify() with just
 set_pte_at()
To: Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org
References: <20240405115815.3226315-1-pbonzini@redhat.com>
 <20240405115815.3226315-5-pbonzini@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240405115815.3226315-5-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: kvm-riscv@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, loongarch@lists.linux.dev, David Hildenbrand <david@redhat.com>, Marc Zyngier <maz@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-mips@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-perf-users@vger.kernel.org, linux-mm@kvack.org, Bibo Mao <maobibo@loongson.cn>, Sean Christopherson <seanjc@google.com>, Anup Patel <anup@brainfault.org>, kvmarm@lists.linux.dev, Oliver Upton <oliver.upton@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-trace-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/4/24 13:58, Paolo Bonzini wrote:
> With the demise of the .change_pte() MMU notifier callback, there is no
> notification happening in set_pte_at_notify().  It is a synonym of
> set_pte_at() and can be replaced with it.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   include/linux/mmu_notifier.h | 2 --
>   kernel/events/uprobes.c      | 5 ++---
>   mm/ksm.c                     | 4 ++--
>   mm/memory.c                  | 7 +------
>   mm/migrate_device.c          | 8 ++------
>   5 files changed, 7 insertions(+), 19 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

