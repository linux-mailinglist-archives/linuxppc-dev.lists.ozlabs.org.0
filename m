Return-Path: <linuxppc-dev+bounces-12849-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DD1BD8739
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Oct 2025 11:33:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cm8DB0GBYz30M0;
	Tue, 14 Oct 2025 20:33:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.166.51
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760434425;
	cv=none; b=b1iXlyX9YJUn6ahf+YcRw526uDRzNaEnfE5WNjGQsKX/6eqhrO5dTW+rjkkSN+QMSd85yDh1NBBeKZTWT14U9iw/rbX/ty1MiLYg1oxWUPCuHVgR/q95sx1VV+NvJYDXT+9Fi18MmsuN1yP17NFBpRx3Afr7/ZctMlaWcX6+O2D9HJR8nd28mssoxV9u4o92ATpAvnR9+O8umOPjVe6jEUVPTHaklkXEnUfTZyHr/Tnm9n2w4sWLYY/1NsPCmLev1+A8TXxPVGntWrhOM7MKa2zSzJmUO5F/5p+9hD9iKohHFr+t2S7fFnsnOTvkS/bfCEIMWuKy1DZ2aE3SDilhGg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760434425; c=relaxed/relaxed;
	bh=mpBgoDCD1NZyU8yXWBy8hXEWr5MI7i37aL5+z3xg+Dc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ULynxNBybER5Jk1nPN4iLPkorbJDFfm70hhpMaVf182r58T5OKJtG9hYlnFG96jWEdaRfGFSIg3yvwNtNBkZYcNskJ+E2G1THjr/aMM2HCVShBI7hsDUp4s7TD4s+5xm0cQ3miAE2Zn3Pfrt/X53kFCHDCv1oXGaTdgRAALrXuEYbssDXHnHxeZqs822Zb1TBSJBv1gG2vCqngayck66BFJSiiAuGuzNKdydglobgBJZrLJGT+g8laYSAbejbodRDatIQsjZOacOLvqivFkoIDZGS+cbtJPCWK3oVhoVKwF7w1M1uy0tYHHQpa/WMXxCdRjtUwhAsBSf/+EtczfOSA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.166.51; helo=mail-io1-f51.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.51; helo=mail-io1-f51.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cm8D83Sc6z2xpn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Oct 2025 20:33:43 +1100 (AEDT)
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-938de0df471so476930139f.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Oct 2025 02:33:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760434420; x=1761039220;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mpBgoDCD1NZyU8yXWBy8hXEWr5MI7i37aL5+z3xg+Dc=;
        b=pdSrsirGjvPZ322E8QeDfYaNJwigeAkibTg2igheGtvTiQrUcT0HJ1hWfPdaPTcDiQ
         lJyar/DX7U1cc2YsqWaeLlyCg5/ks9RyafeeHtYx1TucpXa7h9Kg2qUInmc/b+qJJtPB
         y85TM0q2k5S9QDUDkVmmCQcJCsOzX9KqBB/YOnHrGPgJQYUnfA0TrKVrlMeTpjX59g3S
         kGpwG6XikVhdKiE08tAFd5BdsvHehgCbViC2NTOYBJsQMv03LEoekUumo/ik3d7IOfdQ
         +f3QKZmnAKQn3YbbrhKzQ7354MegPyZWOI/8Y2WN2VYfYpH4tKxSHsfIW310nea+HMKB
         c0Hw==
X-Forwarded-Encrypted: i=1; AJvYcCWgPYLb7HXjCYOgrM8lw7ESXYagFrr4yuMpRKBu1epNU0Ljt6FaSyWX9mHQiirntmao6wJJwjnguEzCmYg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyc4nPi5zMnd0ANyCmwYn+m+BaQtd63qd9evlJOBRw1tU/Q3Qle
	XdPbZMzswMcSZzJxGFLp+6j1hmwFWxiUxxVCpYtcPTXQmDwU6lM7pjV34nA0aNiC
X-Gm-Gg: ASbGncuz+0z84z9CYilBSc21njG9FFsGaWzxrIB9NQ72M2ucapXit0CcxIkK6jrsZvt
	njjpqFVkEnMhIa3LJZlb8PrdjNNlSBDIWKYGrhkZj8gP9IGGbcBkoTHWwAUpGKRUckMMna57zHt
	hkU9JrH/KGhEbv17r/dSq2DhF5eXMyR57TUEr+d90EbQBHtYF6e20BXa3H18k6p1Lw9x9vymfCX
	b7y/KRzlN/VV41JTEhRfz0odn74mQFPOD2QNBnxxDPhJrUa7WzQya3oPRv8l7WTivxwrfkO5xwg
	UhXyrsn19yJZ0WB8VecrEY5Eg7aW+QiHY6GcIYMAzNtxk8mpj/BSmUlkmyIUvOHtoqcJ6SSQL8e
	CBrZdmtbWobCOo1BM4j68Ads9zbSWEMrvfgbG9HSUSBcdgUa9FsfTo7jrh0s5qHCsFCrhqkM2hp
	WmUe8=
X-Google-Smtp-Source: AGHT+IHdQavYvrGPtjG8Gu8pyCxoHCwaf/QpYpvzssIK3hYRT5+Cljdxo6YvXdFQMhCd6SB6P6JJ4w==
X-Received: by 2002:a05:6e02:1543:b0:42f:9410:ea96 with SMTP id e9e14a558f8ab-42f9410ec91mr219085905ab.2.1760434419935;
        Tue, 14 Oct 2025 02:33:39 -0700 (PDT)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com. [209.85.166.47])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-58f6d2357f6sm4595752173.25.2025.10.14.02.33.39
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 02:33:39 -0700 (PDT)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-93e2c9821fcso334322139f.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Oct 2025 02:33:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUUffWDjltPl9zHtZlHMegr/VH/5Hcjblss9n/VksNvaRFABEr6rV4PTRTjawqh4+6h8ft6hdxkdJyyks8=@lists.ozlabs.org
X-Received: by 2002:a05:6102:161e:b0:4f7:d553:3cfa with SMTP id
 ada2fe7eead31-5d5e2278aaamr7047842137.12.1760433964277; Tue, 14 Oct 2025
 02:26:04 -0700 (PDT)
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
References: <20250826041319.1284-1-kprateek.nayak@amd.com> <20250826041319.1284-5-kprateek.nayak@amd.com>
 <609a980b-cbe3-442b-a492-91722870b156@csgroup.eu> <20250826080706.GC3245006@noisy.programming.kicks-ass.net>
 <20250826094358.GG3245006@noisy.programming.kicks-ass.net>
In-Reply-To: <20250826094358.GG3245006@noisy.programming.kicks-ass.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Oct 2025 11:25:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWMkKFLEZ34j=JV0Ls+o80UfC6s3yD5x-9G2K8ZV-Y-9w@mail.gmail.com>
X-Gm-Features: AS18NWBTuiqEZg-SFYGrxqYZDbYb0o6XrCJ3YERltbZU5Ho7kkUOk_8aIEnP1Zk
Message-ID: <CAMuHMdWMkKFLEZ34j=JV0Ls+o80UfC6s3yD5x-9G2K8ZV-Y-9w@mail.gmail.com>
Subject: Re: [PATCH v7 4/8] powerpc/smp: Introduce CONFIG_SCHED_MC to guard MC
 scheduling bits
To: Peter Zijlstra <peterz@infradead.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, thomas.weissschuh@linutronix.de, 
	Li Chen <chenl311@chinatelecom.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Mete Durlu <meted@linux.ibm.com>, Tobias Huschle <huschle@linux.ibm.com>, 
	Easwar Hariharan <easwar.hariharan@linux.microsoft.com>, 
	Guo Weikang <guoweikang.kernel@gmail.com>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Brian Gerst <brgerst@gmail.com>, 
	Patryk Wlazlyn <patryk.wlazlyn@linux.intel.com>, Swapnil Sapkal <swapnil.sapkal@amd.com>, 
	"Yury Norov [NVIDIA]" <yury.norov@gmail.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Andrea Righi <arighi@nvidia.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, 
	Ricardo Neri <ricardo.neri-calderon@linux.intel.com>, 
	Tim Chen <tim.c.chen@linux.intel.com>, 
	Vinicius Costa Gomes <vinicius.gomes@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hoi Peter,

On Thu, 28 Aug 2025 at 14:57, Peter Zijlstra <peterz@infradead.org> wrote:
> Now, when I look at unifying those config options (there's a metric ton
> of crap that's duplicated in the arch/*/Kconfig), I end up with something
> like the below.
>
> And while that isn't exact, it is the closest I could make it without
> making a giant mess of things.
>
> WDYT?

Thanks for your patch, which is now commit 7bd291abe2da09f5 ("sched:
Unify the SCHED_{SMT,CLUSTER,MC} Kconfig") in v6.18-rc1.

> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -41,6 +41,44 @@ config HOTPLUG_SMT
>  config SMT_NUM_THREADS_DYNAMIC
>         bool
>
> +config ARCH_SUPPORTS_SCHED_SMT
> +       bool
> +
> +config ARCH_SUPPORTS_SCHED_CLUSTER
> +       bool
> +
> +config ARCH_SUPPORTS_SCHED_MC
> +       bool
> +
> +config SCHED_SMT
> +       bool "SMT (Hyperthreading) scheduler support"
> +       depends on ARCH_SUPPORTS_SCHED_SMT
> +       default y

This is now enabled by default everywhere, while it was disabled by
default on most architectures before...

> +       help
> +         Improves the CPU scheduler's decision making when dealing with
> +         MultiThreading at a cost of slightly increased overhead in some
> +         places. If unsure say N here.

So it should default to n?
If it is really needed on some architectures or platforms, I guess
they can still select it explicitly?

> +
> +config SCHED_CLUSTER
> +       bool "Cluster scheduler support"
> +       depends on ARCH_SUPPORTS_SCHED_CLUSTER
> +       default y

Likewise.

> +       help
> +         Cluster scheduler support improves the CPU scheduler's decision
> +         making when dealing with machines that have clusters of CPUs.
> +         Cluster usually means a couple of CPUs which are placed closely
> +         by sharing mid-level caches, last-level cache tags or internal
> +         busses.
> +
> +config SCHED_MC
> +       bool "Multi-Core Cache (MC) scheduler support"
> +       depends on ARCH_SUPPORTS_SCHED_MC
> +       default y

Likewise.

> +       help
> +         Multi-core scheduler support improves the CPU scheduler's decision
> +         making when dealing with multi-core CPU chips at a cost of slightly
> +         increased overhead in some places. If unsure say N here.

Likewise.

> +
>  # Selected by HOTPLUG_CORE_SYNC_DEAD or HOTPLUG_CORE_SYNC_FULL
>  config HOTPLUG_CORE_SYNC
>         bool

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

