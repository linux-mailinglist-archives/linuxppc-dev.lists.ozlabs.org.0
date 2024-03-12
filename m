Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7729D87918D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 10:59:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tv8Hq2G3fz3vZB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Mar 2024 20:59:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.218.45; helo=mail-ej1-f45.google.com; envelope-from=jirislaby@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tv8HM4WRVz3bqC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Mar 2024 20:58:55 +1100 (AEDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a3ddc13bbb3so1133882666b.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Mar 2024 02:58:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710237532; x=1710842332;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=20zYEyLo1uGBdyGD+mW32vGX9bbntfXqOZr+grOdraU=;
        b=SB/VUYJcGx4y0Io9MrIkT0aPT5nYnT3Khlg84S0ycc91YsLRD/Srts1aZh8OmtKhT+
         MlhbCrcHWnVjNRya/OoC2xVCoAnla0xym3QPOPeYIHHjFRAUowKDXdJFoWtv1TSuf0he
         I/VW5CsFc+kh36ducwYz82shIwMTvCyau2RmTqF1ts5whxVCJkbPSh7LTYc3SlQ3wp8L
         l6I89DFfCw340IxqExhQO7tpCoPUIMPvfSa9GAKeLxkaFq8p1DNoj7Gm3AT7mNu89lLI
         ktmCUax+xeQcCZjyQxOM+HwN7wk7qABgP5PapDplvvkr5W/vnD5CKpVinM5llR3uGlJE
         pzuw==
X-Forwarded-Encrypted: i=1; AJvYcCUeziFMuZKCV9u6U/UQDv0sb3b3d8aT7GG263rBd3eDKH+epthxKKe6ylCgqPpjndIaIuSUngZQ8o2My2w+VVqu2Do4M3eQM+27gTNugw==
X-Gm-Message-State: AOJu0YyKIsKY208mUiYpjsdS9SJ2fzqx5lvpgqwajLCH6tzDcOAjxRza
	QCHSMG1rohprsGns00+X+YBrE3TcKJBhMFbTT7Ul6BUZOjZ7kOk7
X-Google-Smtp-Source: AGHT+IETibp12PRvFiYm7GCLEuY75A3XYmbwPESL8NCFgIZrDYNPsB62x0W0nbzgHX6FS6gL+9y8Ww==
X-Received: by 2002:a17:907:7e98:b0:a46:13e9:25bd with SMTP id qb24-20020a1709077e9800b00a4613e925bdmr8175116ejc.15.1710237531715;
        Tue, 12 Mar 2024 02:58:51 -0700 (PDT)
Received: from ?IPV6:2a0b:e7c0:0:107::aaaa:59? ([2a0b:e7c0:0:107::aaaa:59])
        by smtp.gmail.com with ESMTPSA id ci8-20020a170907266800b00a462fa148dbsm1440058ejc.30.2024.03.12.02.58.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 02:58:51 -0700 (PDT)
Message-ID: <4c775fca-5def-4a2d-8437-7130b02722a2@kernel.org>
Date: Tue, 12 Mar 2024 10:58:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: kexec verbose dumps with 6.8 [was: [PATCH v4 1/7] kexec_file: add
 kexec_file flag to control debug printing]
Content-Language: en-US
To: Baoquan He <bhe@redhat.com>, linux-kernel@vger.kernel.org
References: <20231213055747.61826-1-bhe@redhat.com>
 <20231213055747.61826-2-bhe@redhat.com>
From: Jiri Slaby <jirislaby@kernel.org>
Autocrypt: addr=jirislaby@kernel.org; keydata=
 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
In-Reply-To: <20231213055747.61826-2-bhe@redhat.com>
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
Cc: linux-parisc@vger.kernel.org, x86@kernel.org, kexec@lists.infradead.org, conor@kernel.org, nathan@kernel.org, joe@perches.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 13. 12. 23, 6:57, Baoquan He wrote:
> When specifying 'kexec -c -d', kexec_load interface will print loading
> information, e.g the regions where kernel/initrd/purgatory/cmdline
> are put, the memmap passed to 2nd kernel taken as system RAM ranges,
> and printing all contents of struct kexec_segment, etc. These are
> very helpful for analyzing or positioning what's happening when
> kexec/kdump itself failed. The debugging printing for kexec_load
> interface is made in user space utility kexec-tools.
> 
> Whereas, with kexec_file_load interface, 'kexec -s -d' print nothing.
> Because kexec_file code is mostly implemented in kernel space, and the
> debugging printing functionality is missed. It's not convenient when
> debugging kexec/kdump loading and jumping with kexec_file_load
> interface.
> 
> Now add KEXEC_FILE_DEBUG to kexec_file flag to control the debugging
> message printing. And add global variable kexec_file_dbg_print and
> macro kexec_dprintk() to facilitate the printing.
> 
> This is a preparation, later kexec_dprintk() will be used to replace the
> existing pr_debug(). Once 'kexec -s -d' is specified, it will print out
> kexec/kdump loading information. If '-d' is not specified, it regresses
> to pr_debug().
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>
...
> --- a/include/linux/kexec.h
> +++ b/include/linux/kexec.h
...
> @@ -500,6 +500,13 @@ static inline int crash_hotplug_memory_support(void) { return 0; }
>   static inline unsigned int crash_get_elfcorehdr_size(void) { return 0; }
>   #endif
>   
> +extern bool kexec_file_dbg_print;
> +
> +#define kexec_dprintk(fmt, ...)					\
> +	printk("%s" fmt,					\
> +	       kexec_file_dbg_print ? KERN_INFO : KERN_DEBUG,	\
> +	       ##__VA_ARGS__)

This means you dump it _always_. Only with different levels.

And without any prefix whatsoever, so people see bloat like this in 
their log now:
[  +0.000001] 0000000000001000-000000000009ffff (1)
[  +0.000002] 000000007f96d000-000000007f97efff (3)
[  +0.000002] 0000000000800000-0000000000807fff (4)
[  +0.000001] 000000000080b000-000000000080bfff (4)
[  +0.000002] 0000000000810000-00000000008fffff (4)
[  +0.000001] 000000007f97f000-000000007f9fefff (4)
[  +0.000001] 000000007ff00000-000000007fffffff (4)
[  +0.000002] 0000000000000000-0000000000000fff (2)

without actually knowing what that is.

There should be nothing logged if that is not asked for and especially 
if kexec load went fine, right?

Can this be redesigned, please?

Actually what was wrong on the pr_debug()s? Can you simply turn them on 
from the kernel when -d is passed to kexec instead of all this?

...
> --- a/kernel/kexec_core.c
> +++ b/kernel/kexec_core.c
> @@ -52,6 +52,8 @@ atomic_t __kexec_lock = ATOMIC_INIT(0);
>   /* Flag to indicate we are going to kexec a new kernel */
>   bool kexec_in_progress = false;
>   
> +bool kexec_file_dbg_print;

Ugh, and a global flag for this?

thanks,
-- 
js
suse labs

