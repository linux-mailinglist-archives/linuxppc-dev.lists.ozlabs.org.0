Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 968E241B9E9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 00:08:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJttc2c8dz2yWR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 08:08:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dabbelt-com.20210112.gappssmtp.com header.i=@dabbelt-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=I79TXBee;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::736;
 helo=mail-qk1-x736.google.com; envelope-from=palmer@dabbelt.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=dabbelt-com.20210112.gappssmtp.com
 header.i=@dabbelt-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=I79TXBee; dkim-atps=neutral
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com
 [IPv6:2607:f8b0:4864:20::736])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJtss4dk4z2xgJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Sep 2021 08:07:43 +1000 (AEST)
Received: by mail-qk1-x736.google.com with SMTP id i132so368865qke.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Sep 2021 15:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=hqLpx7Wm6Aikf3yaBVZ1DfYqAohja9hoxxDTJ4xjS7o=;
 b=I79TXBeeKhqw/PkSZBawchrYJxCClh648BkPzWLbNa1UkVvlTTkBiT5/9JZ+EP89Ho
 guh8PRCNJ/vUJtFdxBjphdv3bgHIkUSsNWXSjlUDvsWO3HOrWnzDZvk/lFdojijY2jBm
 97fJyoUUndoubaQUCmKy2tXrCNSbPLATypEeOetRkXaSK7lLYOl8+AdZseYJPanJiAoB
 KfXAL15/M4xU3OTAtvuix3kZ1MqdcjRGfyiy9wFV2n8BOIJUv9Q4ppd4p+p0P7dD6qbE
 GLziTGb2w4zMAPXS6NDZ4GbcEi892+RAgDw4uV9gr7Gi4UuGL6DvBJ3bjf+mUAn+Yeim
 ooKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=hqLpx7Wm6Aikf3yaBVZ1DfYqAohja9hoxxDTJ4xjS7o=;
 b=lxhAuvz8n8m2Fvgt1nza9TyU47ISSbwi5v/6SDTT975ERwLhf6k4hqXugPm5jXmReS
 caXIsLq69Osp3Dw0oini15Tr4YF3wK/YchQvLK1vR/34MXl4hXXsb/6ClJshDZ/MpTSY
 IhzQDsDF6DBuqBKWnIqSnV1fFJ4qSy16AMHotZLTtSxAAQ5oyKG7kmUQKfM2vVgn6VFo
 E9rBxvkwmSVICJYHuxPkGyfooHqwRvCZWKYcUnAXVHpFS3po+FUobFzp7ryWS0CuNzZZ
 RTa+dkZeRegC6c/aNMrcoAjFtb+OTV+xBqgvqrMCL1bGC16iTjbjniJXobI6uiD1setA
 AYGw==
X-Gm-Message-State: AOAM533TtmXe0HUVNXQh2OigSxm00RWC7M3xqg6NbOWZFwmWmNKHRk+X
 hcTGYDf4NswkdopLLqNY7Q0j9w==
X-Google-Smtp-Source: ABdhPJwYa3sPb+5NPeY3D11qHxW63pqGnDrFPVG/BTx8yJXFd0HA44jnISUSxDVomkPI7Dkdn063kA==
X-Received: by 2002:ae9:de86:: with SMTP id s128mr2452630qkf.146.1632866860009; 
 Tue, 28 Sep 2021 15:07:40 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id e16sm332752qtq.18.2021.09.28.15.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 15:07:39 -0700 (PDT)
Date: Tue, 28 Sep 2021 15:07:39 -0700 (PDT)
X-Google-Original-Date: Tue, 28 Sep 2021 15:07:35 PDT (-0700)
Subject: Re: [RFC PATCH 7/8] riscv: rely on core code to keep thread_info::cpu
 updated
In-Reply-To: <20210914121036.3975026-8-ardb@kernel.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ardb@kernel.org
Message-ID: <mhng-7d24dba9-38a7-4267-b01c-388471412237@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: peterz@infradead.org, paulus@samba.org, linux-riscv@lists.infradead.org,
 will@kernel.org, ardb@kernel.org, linux-s390@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux@armlinux.org.uk, borntraeger@de.ibm.com,
 mingo@redhat.com, catalin.marinas@arm.com, aou@eecs.berkeley.edu,
 keescook@chromium.org, gor@linux.ibm.com, hca@linux.ibm.com,
 keithpac@amazon.com, bp@alien8.de, luto@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 14 Sep 2021 05:10:35 PDT (-0700), ardb@kernel.org wrote:
> Now that the core code switched back to using thread_info::cpu to keep
> a task's CPU number, we no longer need to keep it in sync explicitly. So
> just drop the code that does this.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/riscv/kernel/asm-offsets.c | 1 -
>  arch/riscv/kernel/entry.S       | 5 -----
>  arch/riscv/kernel/head.S        | 1 -
>  3 files changed, 7 deletions(-)
>
> diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
> index 90f8ce64fa6f..478d9f02dab5 100644
> --- a/arch/riscv/kernel/asm-offsets.c
> +++ b/arch/riscv/kernel/asm-offsets.c
> @@ -33,7 +33,6 @@ void asm_offsets(void)
>  	OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_count);
>  	OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kernel_sp);
>  	OFFSET(TASK_TI_USER_SP, task_struct, thread_info.user_sp);
> -	OFFSET(TASK_TI_CPU, task_struct, thread_info.cpu);
>
>  	OFFSET(TASK_THREAD_F0,  task_struct, thread.fstate.f[0]);
>  	OFFSET(TASK_THREAD_F1,  task_struct, thread.fstate.f[1]);
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 98f502654edd..459eb1714353 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -544,11 +544,6 @@ ENTRY(__switch_to)
>  	REG_L s9,  TASK_THREAD_S9_RA(a4)
>  	REG_L s10, TASK_THREAD_S10_RA(a4)
>  	REG_L s11, TASK_THREAD_S11_RA(a4)
> -	/* Swap the CPU entry around. */
> -	lw a3, TASK_TI_CPU(a0)
> -	lw a4, TASK_TI_CPU(a1)
> -	sw a3, TASK_TI_CPU(a1)
> -	sw a4, TASK_TI_CPU(a0)
>  	/* The offset of thread_info in task_struct is zero. */
>  	move tp, a1
>  	ret
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index fce5184b22c3..d5ec30ef6f5d 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -317,7 +317,6 @@ clear_bss_done:
>  	call setup_trap_vector
>  	/* Restore C environment */
>  	la tp, init_task
> -	sw zero, TASK_TI_CPU(tp)
>  	la sp, init_thread_union + THREAD_SIZE
>
>  #ifdef CONFIG_KASAN

Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

Thanks!
