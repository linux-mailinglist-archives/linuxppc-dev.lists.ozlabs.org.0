Return-Path: <linuxppc-dev+bounces-12864-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46468BDA408
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Oct 2025 17:13:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmHlw3wtFz3cQq;
	Wed, 15 Oct 2025 02:13:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.219.45
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760454796;
	cv=none; b=dWnW98apekl0XGIsXXmXnQH3DVy61GLCeJZtaHbiyUajfbD3COvOqTw4EzrIVU8RzbRwkYS9NGr7GWR7ndZ9/EYSpuUD84uyPnWXNn1bC4McAWMsBJpwFkU5PcYC8uLuQlKUScBr+ONfGIRgvxcB9VOfiww/mv9uA0mL2Yw0RfZKIlnzOgDQNgovCv2KpxrmGbkZbGidag6vou40YVebUPCkt/Xy9Wf4dPyUJIacU+wSbVql4OusPUIRiCYp+bvf7ei0vzXqNSUSU5AKp1+WvFTPGbMHBIDOI4w30wB5nzVVIOaTsfi+nqzD4fBJf7QVSHDM/HDT+DK9EB2JfCjI3g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760454796; c=relaxed/relaxed;
	bh=5ckaUVvDg5E1Kv0tRjD3tkk4SrmpuBncmnCZzWhCIjg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PRN8XU0V5jYFUAq1fxUGsRCOlDPGkkFNSi9+b4/gjd//3fFHbeP+qX+aJ2uoUQrK7hY6a/IDWEihoICIACvTmdVHz1LOxNMVbIQlV2vWAlP+ZaXNx7V0byjLz4i57DZYU1GEraj2Qf3Q8jpFZKcFabbzNGrerBi2wrA8hjChuz5ySs0W9ggRXKh2+BJEy6d24DOYHxcJzPM1VeAuEyKQru7y2LxYDAAQnNFHq+21p7Q1Qc7W1o6bd4TT9HhrLncKqbqXk9XV+kOF6OTjX8dVqFAWfMyCbuuSqecBxR/0YTa6bTdFoSFZR2/pT5BH5QGLctel/prJRK+7jU0M3oq6rA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.219.45; helo=mail-qv1-f45.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.45; helo=mail-qv1-f45.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cmHlv23xmz2xPx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Oct 2025 02:13:14 +1100 (AEDT)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-7ea50f94045so80176116d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Oct 2025 08:13:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760454791; x=1761059591;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5ckaUVvDg5E1Kv0tRjD3tkk4SrmpuBncmnCZzWhCIjg=;
        b=XOT9M46QGfBbqVSYTGUa8hPLSyR13HRgP3kkmRiQgvgEyXt7IiUQN03KtzV26hh+Y+
         h4PmXJ2pYq2PGBelvaZ5f9utBRm59Ju6DobjBykR+yrlZjrOhaqNJjZLE+PFVyZt0exZ
         RoqNLLo7q5P8WC40gTeBQ6B5Vzj9+A16WgEsEbwmVjiFOMHg9rWzvdvPWz0U5gXC96Md
         zcxgPmrL0JGLlKQCqypymA/A1MLCJ2yXfyXq9x69Rz+lYC9o/dPXU5SaV9BB2R1u56RZ
         ByYUrWWZHkI8CoT20uwS5rlRG3xEbOvx7kjFN9H7bO76Oq12sck2OtSCGqQU42K/uZ1J
         gBYw==
X-Forwarded-Encrypted: i=1; AJvYcCWNhOxUAkoguf/CbqS84Zi7KeT4riP07XOE76bJprWqCeDh6nIQGPvtkb5HfIxrUfABK+hW62j71Upk544=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YykaQE6yqp/CRO53j0j5gx5LxJrBfZHr5N0lB2ekfOcih8vF7LP
	Qc1HTo/MxXsMfPDF6JaRj6LfI+Q+ECHrhTUBlNIWq86GQy8wik3w1WygzQvQ4DuS
X-Gm-Gg: ASbGncsvtMa6CCrAICrvwogCIq3YzGTqbN3BPStvC+MZ8rguzANyabJvYDikDDTlV0V
	QVu97kjSaZa+LMrSopo0vTqbCkR2HGC2ehrKE7llyIX5foVXkDiq4yyMNz+TvAZpVG23pWzuJbG
	PHl3l8mKAQdSAEqZyzFCJQW64nwmsJ40efTQNwRWhR9I8Tb0tm2J5ADaagedhqX5yeMQkzgKbiw
	aBsHYwpZ8arfHlTdJZJrmDlD/9B2KdnUxTTHpfAx2/iYHpFX9FL7lRk5IsAUrTTjyabPHsmThiO
	3AoSWNNvYjxj1+NGkl2LvYaaGJPWUng/sUMXTPXHngqdQtIo4PP/lLujc4qBuLcEkkvuzzixYE1
	ccQ8cvG4R3WzVfaAnfvry7dEHn7pevn+c+w8O/CMmsGhVyURBt+U8wPYAbDK6tZjbaKuRGXtB2K
	IJbsyLPvp48sTE1k6bKaZeUQ==
X-Google-Smtp-Source: AGHT+IGmAKMlT8NcjmZpokEcYHLI9Oo7mDQs0ExGYBUhlXp0GgnwJ3DJr2cHZAoaU5KSsFXrN/jODg==
X-Received: by 2002:ac8:7dd5:0:b0:4d2:7370:57e9 with SMTP id d75a77b69052e-4e6eb04e879mr348143971cf.31.1760454791222;
        Tue, 14 Oct 2025 08:13:11 -0700 (PDT)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com. [209.85.222.180])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e881d25afesm227851cf.36.2025.10.14.08.13.11
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 08:13:11 -0700 (PDT)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8888f2ce2b5so391349585a.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Oct 2025 08:13:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUn8U2Y5ovYEmn0heZ5TJ3ZBV5RYLjvgFwLpuU6jPUioBy/aXY//wbEZLR9VGnnBnkIKmBTRTJsmsRnR9Y=@lists.ozlabs.org
X-Received: by 2002:a05:690c:6a04:b0:781:556:b7ee with SMTP id
 00721157ae682-7810556c4f0mr161656307b3.7.1760454307894; Tue, 14 Oct 2025
 08:05:07 -0700 (PDT)
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
 <CAMuHMdWMkKFLEZ34j=JV0Ls+o80UfC6s3yD5x-9G2K8ZV-Y-9w@mail.gmail.com>
 <20251014094210.GQ3245006@noisy.programming.kicks-ass.net>
 <CAMuHMdUD8RZqPL5ZYyJrwJB+XL_Tkn-rsLx7WvUmn6y5M_tAtw@mail.gmail.com> <20251014141730.GZ3245006@noisy.programming.kicks-ass.net>
In-Reply-To: <20251014141730.GZ3245006@noisy.programming.kicks-ass.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Oct 2025 17:04:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXpFdjDJrMbK8+6aO=O8c8p68RUGe0o1Mo4PMmFLufc9w@mail.gmail.com>
X-Gm-Features: AS18NWCARfLQt44MvWjqR1ybmDP5uvpIwul8XKi8euGj-rQtyjldCOHWrbLZbQg
Message-ID: <CAMuHMdXpFdjDJrMbK8+6aO=O8c8p68RUGe0o1Mo4PMmFLufc9w@mail.gmail.com>
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

Hi Peter,

On Tue, 14 Oct 2025 at 16:18, Peter Zijlstra <peterz@infradead.org> wrote:
> On Tue, Oct 14, 2025 at 02:37:11PM +0200, Geert Uytterhoeven wrote:
> > > > > +       help
> > > > > +         Improves the CPU scheduler's decision making when dealing with
> > > > > +         MultiThreading at a cost of slightly increased overhead in some
> > > > > +         places. If unsure say N here.
> > > >
> > > > So it should default to n?
> > >
> > > That's just help text that got carried around. Many of the architectures
> > > that had default y still had this text on. I suppose we can change it if
> > > someone cares.
> >
> > Please do so.
>
> How about we remove the recommendation like so? There are many help
> things that do not have a recommendation. Mostly these options add a
> little code and the most expensive bits tend to be gated by
> static_branch() so it really shouldn't be that bit of a burden.
>
> CONFIG_SMP was the big one for the scheduler, and Ingo recently removed
> that (he did an effective unifdef CONFIG_SMP=y on the scheduler code).
>
> ---
> diff --git a/arch/Kconfig b/arch/Kconfig
> index ebe08b9186ad..3d8e2025a4ac 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -57,7 +57,7 @@ config SCHED_SMT
>         help
>           Improves the CPU scheduler's decision making when dealing with
>           MultiThreading at a cost of slightly increased overhead in some
> -         places. If unsure say N here.
> +         places.
>
>  config SCHED_CLUSTER
>         bool "Cluster scheduler support"
> @@ -77,7 +77,7 @@ config SCHED_MC
>         help
>           Multi-core scheduler support improves the CPU scheduler's decision
>           making when dealing with multi-core CPU chips at a cost of slightly
> -         increased overhead in some places. If unsure say N here.
> +         increased overhead in some places.
>
>  # Selected by HOTPLUG_CORE_SYNC_DEAD or HOTPLUG_CORE_SYNC_FULL
>  config HOTPLUG_CORE_SYNC

Thanks, LGTM!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

