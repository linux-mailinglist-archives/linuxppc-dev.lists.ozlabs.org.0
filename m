Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC55B71573C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 May 2023 09:42:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QVkqp5LQnz3fGt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 May 2023 17:41:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=cWfjTtF3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1131; helo=mail-yw1-x1131.google.com; envelope-from=elver@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=cWfjTtF3;
	dkim-atps=neutral
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QVkpx4wH5z3bnV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 May 2023 17:41:12 +1000 (AEST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-565aa2cc428so34541997b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 May 2023 00:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685432468; x=1688024468;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q1cf9BwhoNeWlUyQ+nRhOtzcn4y84LDXQwm01y+BcxQ=;
        b=cWfjTtF3eAelv3C0ENFRpilS3qbt07DvmrCqafiN2BQ5mSGuK+rXqw7q1W9TMU91Cw
         kTx8IdlR/9ogPHQCzgkZonT8uJPC7eG6eaBriPBfuy0Mv/eeP5+CuHlqXBxV2sQZn00V
         +LUtJFuUSIxoND5gpaK7qFjTUlNzIje46EGH6yd5WhLRCdqhuGLI19OiQPEPWC7jKNDc
         Pu/S5kwz3oqUvJx7p23iCmkmL4FBDyZQTbxqVjPgKhwuDXazg8HVKfC8rJ13v12Jxq62
         UUUKsE0B55q04oH5AuOivLr9Xklo5zNRbFaFGvtC0HHVkHHPYCF10uieFRqrzj+XlXLG
         UsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685432468; x=1688024468;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q1cf9BwhoNeWlUyQ+nRhOtzcn4y84LDXQwm01y+BcxQ=;
        b=MHmMiqCje0DUzVyyvjY1BBICVQKOnGtwANOaibEpfA403ROyUxbWxW+DISZr4z9USN
         qkFrCRhJW/nguXnT0Ini+Ao/+A6bey+kUc3D45nzcEVDlWGX13DYtaVJRZzvaMoHjmPo
         Ol8bNKbTA09TaFerVCDzta+xFzY+gK/9bTHfzV7etrQtbpXVcfoRgElycTqPWZ3eejs7
         eQSPYQJT/LozyErDMJwNZQeIFLVDTsEAVWfhvKnJcCGnV5WBS0U38pQWbmaF1Uebqx9E
         /gcao9nWOFUHq0OVG9Qi8NBeMUq8Fin53j0KJHLP1rpinuA7pzE5zz1OlrZ6oNWReB48
         6MpQ==
X-Gm-Message-State: AC+VfDxkOGTj6aBC/064FDaRSdRNCx4dB8xb2RMBMjY8etkseA4u7ase
	qAi1GuwkymONNnfYiOsxvAai5ERjXl/4q55LwQyxHw==
X-Google-Smtp-Source: ACHHUZ603orwKZkVGYfp9uAmXCpHTLV8nAJhcQyIN1J6v3KEBTcBB92yafeVksSEOXAmPqmWMc/rbwWURv0ZWzslyrM=
X-Received: by 2002:a25:b290:0:b0:ba8:2889:3b8a with SMTP id
 k16-20020a25b290000000b00ba828893b8amr1752504ybj.30.1685432468007; Tue, 30
 May 2023 00:41:08 -0700 (PDT)
MIME-Version: 1.0
References: <57834a703dfa5d6c27c9de0a01329059636e5ab7.1685080579.git.christophe.leroy@csgroup.eu>
In-Reply-To: <57834a703dfa5d6c27c9de0a01329059636e5ab7.1685080579.git.christophe.leroy@csgroup.eu>
From: Marco Elver <elver@google.com>
Date: Tue, 30 May 2023 09:40:31 +0200
Message-ID: <CANpmjNN1VWdwEVouVfPHZqYYszPNo=TbmXt6na9q+DuOkXY3xA@mail.gmail.com>
Subject: Re: [PATCH] powerpc/kcsan: Properly instrument arch_spin_unlock()
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, kasan-dev@googlegroups.com, linuxppc-dev@lists.ozlabs.org, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 29 May 2023 at 17:50, Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> The following boottime error is encountered with SMP kernel:
>
>   kcsan: improperly instrumented type=(0): arch_spin_unlock(&arch_spinlock)
>   kcsan: improperly instrumented type=(0): spin_unlock(&test_spinlock)
>   kcsan: improperly instrumented type=(KCSAN_ACCESS_WRITE): arch_spin_unlock(&arch_spinlock)
>   kcsan: improperly instrumented type=(KCSAN_ACCESS_WRITE): spin_unlock(&test_spinlock)
>   kcsan: improperly instrumented type=(KCSAN_ACCESS_WRITE | KCSAN_ACCESS_COMPOUND): arch_spin_unlock(&arch_spinlock)
>   kcsan: improperly instrumented type=(KCSAN_ACCESS_WRITE | KCSAN_ACCESS_COMPOUND): spin_unlock(&test_spinlock)
>   kcsan: selftest: test_barrier failed
>   kcsan: selftest: 2/3 tests passed
>   Kernel panic - not syncing: selftests failed
>
> Properly instrument arch_spin_unlock() with kcsan_mb().
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Acked-by: Marco Elver <elver@google.com>

> ---
>  arch/powerpc/include/asm/simple_spinlock.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/powerpc/include/asm/simple_spinlock.h b/arch/powerpc/include/asm/simple_spinlock.h
> index 9dcc7e9993b9..4dd12dcb9ef8 100644
> --- a/arch/powerpc/include/asm/simple_spinlock.h
> +++ b/arch/powerpc/include/asm/simple_spinlock.h
> @@ -15,6 +15,7 @@
>   * (the type definitions are in asm/simple_spinlock_types.h)
>   */
>  #include <linux/irqflags.h>
> +#include <linux/kcsan-checks.h>
>  #include <asm/paravirt.h>
>  #include <asm/paca.h>
>  #include <asm/synch.h>
> @@ -126,6 +127,7 @@ static inline void arch_spin_lock(arch_spinlock_t *lock)
>
>  static inline void arch_spin_unlock(arch_spinlock_t *lock)
>  {
> +       kcsan_mb();
>         __asm__ __volatile__("# arch_spin_unlock\n\t"
>                                 PPC_RELEASE_BARRIER: : :"memory");
>         lock->slock = 0;
> --
> 2.40.1
>
