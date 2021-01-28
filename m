Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 38340307209
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 09:55:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DRDnN3jynzDrpC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 19:55:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::130;
 helo=mail-lf1-x130.google.com; envelope-from=sergei.shtylyov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iipPbsfx; dkim-atps=neutral
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DRCjV0LZzzDrfc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jan 2021 19:06:36 +1100 (AEDT)
Received: by mail-lf1-x130.google.com with SMTP id a8so6409833lfi.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jan 2021 00:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZhLAAud3HvOatZc8bWa160+GGDrtwAXLfmrfPeaVYS8=;
 b=iipPbsfxZVCoeVKuars96HlwaPhNMoxff6kXibVhpITK1M6liR5Y9O7+S15Bs18l09
 qlUtM1wTfg9Ou6I6g23AZm7cVsi8afl9ywua8K9yMdO5bZr9nt5kjWGTXEGzGKuOa9/g
 1XUmU2pb08XIkn2+EUpygz+rpS2BWuStq+kp1Z0L+RWjtUcubBnlDUTz5WKp9v7710os
 SLNWgHiJ3JIV+8IAHjWh/nhAgSk/YRdA5r5xJzX10KabfIVPeT0lFPft9QR1HE2XX97r
 YL6s2qMMPrVFtgVS0PASinY6oq3v5br43OEKFxy7K4ebWVUxXV6rGDy0rY0fMsVaCwye
 p0Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ZhLAAud3HvOatZc8bWa160+GGDrtwAXLfmrfPeaVYS8=;
 b=rppEz2k2jPSDAlvtrDvt8oYKsjSYPuiTqNo5XloZEMI7jdamF9HGD7M8xLklYj8E9o
 4OdihW9g1eJVOTl37+H/pg98TwrdMt8+oe27hRQE/GlC7ZvyF68S1cz+cP882B7ryD73
 DbMOpJ/fSU//kvnp28NC3hoIP28/UtyMurNNngt4J/b/hkStJCHgsi/a+F9aMaOR0j1x
 1AnQJ0CmBIqLERBcBp3NFgu3MVbXAB0ifXwhqDw/LbrPrURrymgrP+E8jC5sBcsjV1tK
 0IqC3g+NekrU9j4sZgrHUM2ID7sMlKXF+VHbEmyQ9P7Gt6g5TdZ7P8IKHA4Ppam3E6+r
 nDwg==
X-Gm-Message-State: AOAM532WLR6kYdZURQypx6U5eKIqjClUsHCEbkp4ff44Tel+2Gzop0Gg
 lmanJ0ZA26b723CPD9PKmrE/3b4xSlTvow==
X-Google-Smtp-Source: ABdhPJyNhfosDqTVmWD8kXJOJ9HDxIw2bv3pFQwo469kI3mpp/ZSh90Ay+X1biZCj8UPTr2AxhJ8ug==
X-Received: by 2002:a2e:b6cc:: with SMTP id m12mr7769208ljo.401.1611820759903; 
 Wed, 27 Jan 2021 23:59:19 -0800 (PST)
Received: from [192.168.1.100] ([178.176.79.159])
 by smtp.gmail.com with ESMTPSA id z23sm1635056ljj.25.2021.01.27.23.59.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jan 2021 23:59:19 -0800 (PST)
Subject: Re: [PATCH 02/27] x86/syscalls: fix -Wmissing-prototypes warnings
 from COND_SYSCALL()
To: Masahiro Yamada <masahiroy@kernel.org>, linux-arch@vger.kernel.org,
 x86@kernel.org
References: <20210128005110.2613902-1-masahiroy@kernel.org>
 <20210128005110.2613902-3-masahiroy@kernel.org>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <dd37a7f2-55e1-2e96-0c93-4a40980b8ef2@gmail.com>
Date: Thu, 28 Jan 2021 10:59:07 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210128005110.2613902-3-masahiroy@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 28 Jan 2021 19:51:42 +1100
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
Cc: linux-xtensa@linux-xtensa.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-alpha@vger.kernel.org,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello!

On 28.01.2021 3:50, Masahiro Yamada wrote:

> Building kernel/sys_ni.c with W=1 omits tons of -Wmissing-prototypes

    Emits?

> warnings.
> 
> $ make W=1 kernel/sys_ni.o
>    [ snip ]
>    CC      kernel/sys_ni.o
> In file included from kernel/sys_ni.c:10:
> ./arch/x86/include/asm/syscall_wrapper.h:83:14: warning: no previous prototype for '__x64_sys_io_setup' [-Wmissing-prototypes]
>     83 |  __weak long __##abi##_##name(const struct pt_regs *__unused) \
>        |              ^~
> ./arch/x86/include/asm/syscall_wrapper.h:100:2: note: in expansion of macro '__COND_SYSCALL'
>    100 |  __COND_SYSCALL(x64, sys_##name)
>        |  ^~~~~~~~~~~~~~
> ./arch/x86/include/asm/syscall_wrapper.h:256:2: note: in expansion of macro '__X64_COND_SYSCALL'
>    256 |  __X64_COND_SYSCALL(name)     \
>        |  ^~~~~~~~~~~~~~~~~~
> kernel/sys_ni.c:39:1: note: in expansion of macro 'COND_SYSCALL'
>     39 | COND_SYSCALL(io_setup);
>        | ^~~~~~~~~~~~
> ./arch/x86/include/asm/syscall_wrapper.h:83:14: warning: no previous prototype for '__ia32_sys_io_setup' [-Wmissing-prototypes]
>     83 |  __weak long __##abi##_##name(const struct pt_regs *__unused) \
>        |              ^~
> ./arch/x86/include/asm/syscall_wrapper.h:120:2: note: in expansion of macro '__COND_SYSCALL'
>    120 |  __COND_SYSCALL(ia32, sys_##name)
>        |  ^~~~~~~~~~~~~~
> ./arch/x86/include/asm/syscall_wrapper.h:257:2: note: in expansion of macro '__IA32_COND_SYSCALL'
>    257 |  __IA32_COND_SYSCALL(name)
>        |  ^~~~~~~~~~~~~~~~~~~
> kernel/sys_ni.c:39:1: note: in expansion of macro 'COND_SYSCALL'
>     39 | COND_SYSCALL(io_setup);
>        | ^~~~~~~~~~~~
>    ...
> 
> __SYS_STUB0() and __SYS_STUBx() defined a few lines above have forward
> declarations. Let's do likewise for __COND_SYSCALL() to fix the
> warnings.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>   arch/x86/include/asm/syscall_wrapper.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/x86/include/asm/syscall_wrapper.h b/arch/x86/include/asm/syscall_wrapper.h
> index a84333adeef2..80c08c7d5e72 100644
> --- a/arch/x86/include/asm/syscall_wrapper.h
> +++ b/arch/x86/include/asm/syscall_wrapper.h
> @@ -80,6 +80,7 @@ extern long __ia32_sys_ni_syscall(const struct pt_regs *regs);
>   	}
>   
>   #define __COND_SYSCALL(abi, name)					\
> +	__weak long __##abi##_##name(const struct pt_regs *__unused);	\
>   	__weak long __##abi##_##name(const struct pt_regs *__unused)	\

    Aren't these two lines identical?

[...]

MBR, Sergei
