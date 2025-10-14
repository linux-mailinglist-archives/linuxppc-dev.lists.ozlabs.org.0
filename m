Return-Path: <linuxppc-dev+bounces-12851-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F94BD96CB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Oct 2025 14:44:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmDRz0Bsgz3bW7;
	Tue, 14 Oct 2025 23:44:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.221.171
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760445854;
	cv=none; b=JNxPFr5ksDNE5ltYNsaU6clHGcw3AtBwGuBxsqpOWqKX6Z/5MqN4J8/tE6RRTQ5PCQQnYIzz94+AW8/XufwpcKOERfQa1JdsMri5snOfGfOxwBV4001Kyw+fp64KvZsl52Fw1CXrtYmPaLXRkJGvVGoCQnVmNBgEuXmAZkFHWz/34srJiAV22tGsplF1RwrBBPYd6rD/JqnhyOrgly8Nu1ezKLmPwlZGfeEd3ETquKlY3D6BpKvzkefRu7TfBOVfZjmGcvbFes5C8Pj3QUVlcM8c//GPxsWguzkDJ6VzIHmTT7W8msfe7LBTJ5YjtGO5XsaStik5J0yOMZBgTE0xbw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760445854; c=relaxed/relaxed;
	bh=sNxEU7KyfBYhfmf3Lx2LLvPMpGLQ7HkB7d0pkrjoK9E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Eoyeh040MYC0QWEOs0DNX96qLp+k/Khj52YWPTgR//mooAOT7i4CsdzjgECMqMedQywP6YV/xkBt9fuPHpSQUzqvW28xF0z+yDU2uzrLL1hm6hd2YTEzLqziTjJ0PR5tWkhgXvTc5Usxkeo3Uxd7pIS4eUJFD1fO71zMiem4jozvAKVPHsF4OVParDmjK4KLT2+GCkogWF0R8IS2NeTd28Yo7Evf7Pk0ze+5EiRbpO3iBnqzX5MVetjBaEf+EEidiSwfPU6vzQMQx/x8WdZF38tAYZ04CiSsd6TYl/mvQCHrL0IHkcXsDPdOsRo+boQL5RlwD7JovN7VjWDz9k8DkQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.221.171; helo=mail-vk1-f171.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.221.171; helo=mail-vk1-f171.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cmDRx2kf8z30M0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Oct 2025 23:44:12 +1100 (AEDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-554ff1682c8so1458382e0c.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Oct 2025 05:44:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760445849; x=1761050649;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sNxEU7KyfBYhfmf3Lx2LLvPMpGLQ7HkB7d0pkrjoK9E=;
        b=gOlU14rX2H0S+a3AwwQZQBP7kym6cqd95URGV2ViRqQmkhQF14Q6F7hvSCdHGGfntX
         qok4P4C8ZSLa/ygIGh2KzfhDRlUtjYI/YSUg3y/L3kA5RIpn/fv4riZtJLkOHKuTv6Ah
         uqjQiYUYRETN5qa2d3cW9V8SZd+CLMMLXm3iL+P8VGXQgMec6WK+plWXa1dnfGzYUyoi
         tqtukBC3ZTX+D7xclG01hv/jDwb6i2sTH/xq7Kg+8GIhr/MyZaSL8eJTZhctDFjkNKEL
         H9Zh3KrtSwAZBGNQWlQo35EzKH8d5mQmMA+3DXWtCBeWyA0YA4XMTThkgOlgOduC4YS7
         jPyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJ43aadMd0y97TAywT1ykXDh5q1Rxcriw4xdQB1wW3oh6vx2adxMDdOECJYSliHHxq8OOUwcGvgJGbrxU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx6mJ8X7gwjQkOP+BLPt8zQZrCNGbpuA95GTtt06nLXRnVccO4b
	p4k7UtasQqCyfQk+MSIUBgM2joQcv4rjGwhZsUpyAx5BwLra20eLNQ88/J3ZWTQr
X-Gm-Gg: ASbGncsYMCNn0+7UPZvKLaNcFyB6ml4VDPGEsBG2Ajm8N3GzeWtSGxjLncQiWPDdlcq
	DmmQO79pmcWTgonddgeeAcc98unyy88VXG31CXYAV6Wrr4gRECqDUzH6f8jTHouIdU18jChuNHC
	0rgct95HR5dMF35tURHFLoXSwEgbjJVUtEZqPUvsnB4JF6grzSL+O6UAOjBd6/sA7UhZ6MgGMng
	b7GIJA4tKrL3kSQ/H4WmdeZ4FRKZDWDAan9MQBDzHZh0cR2gRU5xkKDhv1pPU3sYfj6YGQVSrBr
	ywSQeBQTLbi6HbqwwPEMFDznec3a5xtk/KYpvXQjYthRwc7ns3z8EyX2OsvGg0z3uwSnU+QH/rB
	Hf1LYzF6+4i/1y3t4dausANEHbFy/nRLJLw+BuJNie5/IrHaYAb+UJtRbqfuFj8ZkoyfqQQe4sb
	5hTuNub7Q=
X-Google-Smtp-Source: AGHT+IH5Sdmd47WQW9Vm+FKT0KKezRW94eO66avg54E7FrItdRMS7a+W/lwXJ1ow/7Y8umYKjJDEzA==
X-Received: by 2002:a05:6122:8c5:b0:554:afe3:1fc4 with SMTP id 71dfb90a1353d-554b8b88f4bmr9758709e0c.9.1760445849489;
        Tue, 14 Oct 2025 05:44:09 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-554d7ce706csm4139754e0c.0.2025.10.14.05.44.09
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 05:44:09 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-58de3ab1831so4828137137.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Oct 2025 05:44:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXli5MS7DhJC+np/1sOi5H1SSo4UiXkM6EykWppPY1YJWPXEaeMHRs7zws4IpL1QHxLMtVpZXd72UMRaxw=@lists.ozlabs.org
X-Received: by 2002:a05:6102:a51:b0:5d6:3554:2dbb with SMTP id
 ada2fe7eead31-5d635542e5dmr527665137.16.1760445443647; Tue, 14 Oct 2025
 05:37:23 -0700 (PDT)
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
 <CAMuHMdWMkKFLEZ34j=JV0Ls+o80UfC6s3yD5x-9G2K8ZV-Y-9w@mail.gmail.com> <20251014094210.GQ3245006@noisy.programming.kicks-ass.net>
In-Reply-To: <20251014094210.GQ3245006@noisy.programming.kicks-ass.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Oct 2025 14:37:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUD8RZqPL5ZYyJrwJB+XL_Tkn-rsLx7WvUmn6y5M_tAtw@mail.gmail.com>
X-Gm-Features: AS18NWC3_aMtxy2dnl_M3on8VhWCTedTTMBJW4khUhDoS9xyzcvkRTZ1BETpTHo
Message-ID: <CAMuHMdUD8RZqPL5ZYyJrwJB+XL_Tkn-rsLx7WvUmn6y5M_tAtw@mail.gmail.com>
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

On Tue, 14 Oct 2025 at 11:42, Peter Zijlstra <peterz@infradead.org> wrote:
> On Tue, Oct 14, 2025 at 11:25:53AM +0200, Geert Uytterhoeven wrote:
> > On Thu, 28 Aug 2025 at 14:57, Peter Zijlstra <peterz@infradead.org> wrote:
> > > Now, when I look at unifying those config options (there's a metric ton
> > > of crap that's duplicated in the arch/*/Kconfig), I end up with something
> > > like the below.
> > >
> > > And while that isn't exact, it is the closest I could make it without
> > > making a giant mess of things.
> > >
> > > WDYT?
> >
> > Thanks for your patch, which is now commit 7bd291abe2da09f5 ("sched:
> > Unify the SCHED_{SMT,CLUSTER,MC} Kconfig") in v6.18-rc1.
> >
> > > --- a/arch/Kconfig
> > > +++ b/arch/Kconfig
> > > @@ -41,6 +41,44 @@ config HOTPLUG_SMT
> > >  config SMT_NUM_THREADS_DYNAMIC
> > >         bool
> > >
> > > +config ARCH_SUPPORTS_SCHED_SMT
> > > +       bool
> > > +
> > > +config ARCH_SUPPORTS_SCHED_CLUSTER
> > > +       bool
> > > +
> > > +config ARCH_SUPPORTS_SCHED_MC
> > > +       bool
> > > +
> > > +config SCHED_SMT
> > > +       bool "SMT (Hyperthreading) scheduler support"
> > > +       depends on ARCH_SUPPORTS_SCHED_SMT
> > > +       default y
> >
> > This is now enabled by default everywhere, while it was disabled by
> > default on most architectures before...
>
> I'm not sure ARCH_SUPPORTS_SCHED_SMT counts as everywhere, but yes.
> A fair deal of the architectures had all this default yes, and I had to
> pick something. Can't make an omelette without breaking an egg and all
> that :/

OK.

> > > +       help
> > > +         Improves the CPU scheduler's decision making when dealing with
> > > +         MultiThreading at a cost of slightly increased overhead in some
> > > +         places. If unsure say N here.
> >
> > So it should default to n?
>
> That's just help text that got carried around. Many of the architectures
> that had default y still had this text on. I suppose we can change it if
> someone cares.

Please do so.

> > If it is really needed on some architectures or platforms, I guess
> > they can still select it explicitly?
>
> There were 4 cases:
>
>  - arch doesn't support SMT
>  - arch supports SMT and lets user pick, default Y
>  - arch supports SMT and lets user pick, default N
>  - arch mandates SMT
>
> Of those 3 are still possible, the one we lost is the default N case.
>
> Old configs that have =N will continue to have N. New configs might end
> up with Y.
>
> Why is this a problem?

While old .config files will see no changes, old defconfig files do
need updates.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

