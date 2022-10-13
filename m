Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E679D5FE235
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 20:57:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MpJfL5Fggz3drS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 05:56:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FPFt3yOE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FPFt3yOE;
	dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MpJdL5FRlz2yQg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Oct 2022 05:56:05 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id q10-20020a17090a304a00b0020b1d5f6975so2728195pjl.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 11:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oWRpr36T0vvq5ApDatbP6GER4re2aJOEKr2PxsMGVwo=;
        b=FPFt3yOEfGwAJKS6G8ieWTOkgCkn7k7tjXJgzao8TvPZ3+ep3kpnG3uSiMJCtdlZAq
         0m6zhPax4wvRaecvmxZuiVBMb4by2zlwPVv7gTcQlpWueAD002NEZqX9fin/PwQiZJ8N
         EEZ/5H/32HU9wFTU6IHEu0zSjYsu+eumn2zslMJ7xBuARtaoMkOWuJ69POuuW2GgXVPV
         1vMQBb7BxHzoddHA60gRD0Vd0F5if2bUAMxfo8mlRhGEAZqLhF6QXfkEH8R0xU1GiyQU
         i1cmwIpar3JRqG6oH8JxCjBZZNKKvG05q2c84T9kXzRtPmxtJsbTQwqLioaKnYlD/38+
         crYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oWRpr36T0vvq5ApDatbP6GER4re2aJOEKr2PxsMGVwo=;
        b=wlPasi2xINzZX2mRJdYKZ1VCEXavyg7Ja+gJSZ12rUjP3whUxYJ9BiBpp7uESEkrsL
         mkhN4Y8jpcZqTdYbJRl3Ea1fEX/QWkt1zgGnC0g4K1B18V7zdaSz2wdW0YHNhs6/y4KH
         MK8RIXaMCwgdHgRH4Oh3t8l5Z8K5uws+I10BNaZNAx/m2fGrv2hQtHs1Ilu0WiIvGjFs
         XMo/YorPJFg2f3cGuuf38gsCOgYtttwWmWQbeON7ArtClN9B5TArBjvuDBj84ovJZ2A1
         9twtStNSkVqXxo/zuNkBUkxbS7ArIHOCdNXfmoxiIR5ThXe/eZbd15nAzUcAd4/xWFoI
         opNw==
X-Gm-Message-State: ACrzQf2hPsKwjs8lEc7avkBJgztBiJVjD3vYtngYaQy+M7Yp7BZF/vCn
	h2W4Sx44hNhSdDwJswB4AG4=
X-Google-Smtp-Source: AMsMyM59xd6ZcVEx+l3swra9RQo5gElDf282vgtxbCfMlBM5HWdPGtooDKymbuG/Y/s6RPa38fhMgA==
X-Received: by 2002:a17:90b:1e11:b0:20d:90b3:45a0 with SMTP id pg17-20020a17090b1e1100b0020d90b345a0mr10212953pjb.29.1665687361502;
        Thu, 13 Oct 2022 11:56:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b1-20020a170902d40100b0017870f471f6sm173606ple.226.2022.10.13.11.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 11:56:00 -0700 (PDT)
Date: Thu, 13 Oct 2022 11:55:59 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.1-1 tag
Message-ID: <20221013185559.GA836698@roeck-us.net>
References: <87edvhntv0.fsf@mpe.ellerman.id.au>
 <20221012141827.GA2405914@roeck-us.net>
 <Y0biBtCUtc2mowbQ@zx2c4.com>
 <20221012164452.GA2990467@roeck-us.net>
 <Y0b3ZsTRHWG6jGK8@zx2c4.com>
 <bba714ce-4af7-a7ea-21b5-10e5578b6db8@roeck-us.net>
 <CNKJES19WP6K.LOS0TA0Q4MRO@bobo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CNKJES19WP6K.LOS0TA0Q4MRO@bobo>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, david@redhat.com, Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, wsa+renesas@sang-engineering.com, nicholas@linux.ibm.com, windhl@126.com, cuigaosheng1@huawei.com, mikey@neuling.org, paul@paul-moore.com, haren@linux.ibm.com, Ingo Molnar <mingo@kernel.org>, joel@jms.id.au, lukas.bulwahn@gmail.com, nathanl@linux.ibm.com, ajd@linux.ibm.com, ye.xingchen@zte.com.cn, nathan@kernel.org, rmclure@linux.ibm.com, hbathini@linux.ibm.com, atrajeev@linux.vnet.ibm.com, yuanjilin@cdjrlc.com, pali@kernel.org, farosas@linux.ibm.com, geoff@infradead.org, Linus Torvalds <torvalds@linux-foundation.org>, gustavoars@kernel.org, lihuafei1@huawei.com, aneesh.kumar@linux.ibm.com, zhengyongjun3@huawei.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 13, 2022 at 03:14:08PM +1000, Nicholas Piggin wrote:
> > > 
> > > BUG: using smp_processor_id() in preemptible [00000000] code: swapper/0/1
> > > caller is .__flush_tlb_pending+0x40/0xf0
> > > CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.0.0-28380-gde492c83cae0-dirty #4
> > > Hardware name: PowerMac3,1 PPC970FX 0x3c0301 PowerMac
> > > Call Trace:
> > > [c0000000044c3540] [c000000000f93ef0] .dump_stack_lvl+0x7c/0xc4 (unreliable)
> > > [c0000000044c35d0] [c000000000fc9550] .check_preemption_disabled+0x140/0x150
> > > [c0000000044c3660] [c000000000073dd0] .__flush_tlb_pending+0x40/0xf0
> > > [c0000000044c36f0] [c000000000334434] .__apply_to_page_range+0x764/0xa30
> > > [c0000000044c3840] [c00000000006cad0] .change_memory_attr+0xf0/0x160
> > > [c0000000044c38d0] [c0000000002a1d70] .bpf_prog_select_runtime+0x150/0x230
> > > [c0000000044c3970] [c000000000d405d4] .bpf_prepare_filter+0x504/0x6f0
> > > [c0000000044c3a30] [c000000000d4085c] .bpf_prog_create+0x9c/0x140
> > > [c0000000044c3ac0] [c000000002051d9c] .ptp_classifier_init+0x44/0x78
> > > [c0000000044c3b50] [c000000002050f3c] .sock_init+0xe0/0x100
> > > [c0000000044c3bd0] [c000000000010bd4] .do_one_initcall+0xa4/0x438
> > > [c0000000044c3cc0] [c000000002005008] .kernel_init_freeable+0x378/0x428
> > > [c0000000044c3da0] [c0000000000113d8] .kernel_init+0x28/0x1a0
> > > [c0000000044c3e10] [c00000000000ca3c] .ret_from_kernel_thread+0x58/0x60
> > > 
> > > This in turn is because __flush_tlb_pending() calls:
> > > 
> > > static inline int mm_is_thread_local(struct mm_struct *mm)
> > > {
> > >          return cpumask_equal(mm_cpumask(mm),
> > >                                cpumask_of(smp_processor_id()));
> > > }
> > > 
> > > __flush_tlb_pending() has a comment about this:
> > > 
> > >   * Must be called from within some kind of spinlock/non-preempt region...
> > >   */
> > > void __flush_tlb_pending(struct ppc64_tlb_batch *batch)
> > > 
> > > So I guess that didn't happen for some reason? Maybe this is indicative
> > > of some lock imbalance that then gets hit later?
> >
> > I managed to bisect that problem. Unfortunately it points to the
> > scheduler merge. No idea what to do about that. Any idea ?
> > I am copying Peter and Ingo for comments.
> >
> 
> > # first bad commit: [30c999937f69abf935b0228b8411713737377d9e] Merge tag 'sched-core-2022-10-07' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
> 
> This might be a red herring because I can reproduce without it.
> I think we can fix this with some preempt critical sections, they
> don't look too much of a problem.
> 

Do you refer to the bisect of the BUG: message above, or to the other
problem ? I can try to repeat the bisect with some retries if you
think that 30c999937f69a isn't responsible for "BUG: using
smp_processor_id() in preemptible [00000000] code".

Thanks,
Guenter
