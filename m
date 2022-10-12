Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDF05FCA0D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 19:49:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MngBq13L6z3dqV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 04:49:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hAoB12/z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hAoB12/z;
	dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mng9s0ChDz3bjj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 04:48:30 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id o17-20020a17090aac1100b0020d98b0c0f4so1261897pjq.4
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Oct 2022 10:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+080M2Ccg3F9b6vVa00cGNCQ5pfLGYWzTW+63xhlSEQ=;
        b=hAoB12/zlpJOvmACoRllIDaPbKWz+a90RztdehW+dlLO+9J5vdwqH8YMvI5aeaDj1i
         gG0rfp/LVfrvznrWhrdaNpTSMDITyoB5wN+dHbATvy8E2+Ke3yya+A4AQClZc1WRe8AP
         8ZNmu3eJfsfiDJl8lMPJRCv0ChUroi5szsWqBnrsZB3bnsQ0ZoYVp9jvt+TZ/r/gz3Fi
         HTP7rZolkKAwMUPGbEf5zRP5s1ASjGkQqaZo81CeaJTsp/Tc4HwpukXfjlIqIp04OIKj
         AQdQ+sP/2q7Ja/IQgHb3SN1NrNUkcr0zQAUc8vFwJnSNubgsdkz7yxqe1f9EbCWqDvNC
         FlkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+080M2Ccg3F9b6vVa00cGNCQ5pfLGYWzTW+63xhlSEQ=;
        b=FV+fGgY8VWefDFRxKkTNdU4qJbE+3h6ySkg5JoLla7InOGw94Vaa85t6FFxo6+II1b
         HY52s9hjF8tevJQoRh6PB5uw1cFUHEJ740SdGmq4PQPaA7I1/2h3xyBIu+kQzp489Ayu
         W7ibImcC2FDLp7gra4kp1+L5kogJRJq/rY8oylH4ZZmaHTh0m0ba28iU3LuzzojQ8pd3
         ARWOX/ZWnPOI3+7bjgDoBheBQhiDOCbTW4itdAqPkXm9ROKu2cuNo+awCY5wzCpz9ImM
         cEfkRdJAwgQP7l5kXFEUms5XNwjX+EsQJOiKWxh0UEM31b/Kcj8pYDDZtuyU994q2KEn
         AI6A==
X-Gm-Message-State: ACrzQf0ZKLBO1UAnIIhNuBVCFZI8/ghqiTJWWMsEf34YuIPRgI9OE7fb
	13ELaEThBtid7pXzuDoCKsE=
X-Google-Smtp-Source: AMsMyM7Ku165jYTvHsirPuMopeA4YvIkzIyhvLz3on2XA5/RF1gULwpGGzg+2JoWZQXZIffpUvabxQ==
X-Received: by 2002:a17:90b:4f4e:b0:20d:9f5b:abbf with SMTP id pj14-20020a17090b4f4e00b0020d9f5babbfmr1000536pjb.148.1665596907792;
        Wed, 12 Oct 2022 10:48:27 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z15-20020a17090a398f00b00202aa2b5295sm1698589pjb.36.2022.10.12.10.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 10:48:27 -0700 (PDT)
Date: Wed, 12 Oct 2022 10:48:26 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.1-1 tag
Message-ID: <20221012174826.GB2995920@roeck-us.net>
References: <87edvhntv0.fsf@mpe.ellerman.id.au>
 <20221012141827.GA2405914@roeck-us.net>
 <Y0biBtCUtc2mowbQ@zx2c4.com>
 <20221012164452.GA2990467@roeck-us.net>
 <Y0b3ZsTRHWG6jGK8@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0b3ZsTRHWG6jGK8@zx2c4.com>
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
Cc: david@redhat.com, linux-kernel@vger.kernel.org, wsa+renesas@sang-engineering.com, nicholas@linux.ibm.com, windhl@126.com, cuigaosheng1@huawei.com, mikey@neuling.org, paul@paul-moore.com, haren@linux.ibm.com, joel@jms.id.au, lukas.bulwahn@gmail.com, nathanl@linux.ibm.com, ajd@linux.ibm.com, ye.xingchen@zte.com.cn, npiggin@gmail.com, nathan@kernel.org, rmclure@linux.ibm.com, hbathini@linux.ibm.com, atrajeev@linux.vnet.ibm.com, yuanjilin@cdjrlc.com, pali@kernel.org, farosas@linux.ibm.com, geoff@infradead.org, Linus Torvalds <torvalds@linux-foundation.org>, gustavoars@kernel.org, lihuafei1@huawei.com, aneesh.kumar@linux.ibm.com, zhengyongjun3@huawei.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 12, 2022 at 11:20:38AM -0600, Jason A. Donenfeld wrote:
> On Wed, Oct 12, 2022 at 09:44:52AM -0700, Guenter Roeck wrote:
> > On Wed, Oct 12, 2022 at 09:49:26AM -0600, Jason A. Donenfeld wrote:
> > > On Wed, Oct 12, 2022 at 07:18:27AM -0700, Guenter Roeck wrote:
> > > > NIP [c000000000031630] .replay_soft_interrupts+0x60/0x300
> > > > LR [c000000000031964] .arch_local_irq_restore+0x94/0x1c0
> > > > Call Trace:
> > > > [c000000007df3870] [c000000000031964] .arch_local_irq_restore+0x94/0x1c0 (unreliable)
> > > > [c000000007df38f0] [c000000000f8a444] .__schedule+0x664/0xa50
> > > > [c000000007df39d0] [c000000000f8a8b0] .schedule+0x80/0x140
> > > > [c000000007df3a50] [c00000000092f0dc] .try_to_generate_entropy+0x118/0x174
> > > > [c000000007df3b40] [c00000000092e2e4] .urandom_read_iter+0x74/0x140
> > > > [c000000007df3bc0] [c0000000003b0044] .vfs_read+0x284/0x2d0
> > > > [c000000007df3cd0] [c0000000003b0d2c] .ksys_read+0xdc/0x130
> > > > [c000000007df3d80] [c00000000002a88c] .system_call_exception+0x19c/0x330
> > > > [c000000007df3e10] [c00000000000c1d4] system_call_common+0xf4/0x258
> > > 
> > > Obviously the first couple lines of this concern me a bit. But I think
> > > actually this might just be a catalyst for another bug. You could view
> > > that function as basically just:
> > > 
> > >     while (something)
> > >     	schedule();
> > > 
> > > And I guess in the process of calling the scheduler a lot, which toggles
> > > interrupts a lot, something got wedged.
> > > 
> > > Curious, though, I did try to reproduce this, to no avail. My .config is
> > > https://xn--4db.cc/rBvHWfDZ . What's yours?
> > > 
> > 
> > Attached. My qemu command line is
> 
> Okay, thanks, I reproduced it. In this case, I suspect
> try_to_generate_entropy() is just the messenger. There's an earlier
> problem:
> 

That problem is not new but has existed for a couple of releases, and has
never caused a hang until now.

> BUG: using smp_processor_id() in preemptible [00000000] code: swapper/0/1
> caller is .__flush_tlb_pending+0x40/0xf0
> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.0.0-28380-gde492c83cae0-dirty #4
> Hardware name: PowerMac3,1 PPC970FX 0x3c0301 PowerMac
> Call Trace:
> [c0000000044c3540] [c000000000f93ef0] .dump_stack_lvl+0x7c/0xc4 (unreliable)
> [c0000000044c35d0] [c000000000fc9550] .check_preemption_disabled+0x140/0x150
> [c0000000044c3660] [c000000000073dd0] .__flush_tlb_pending+0x40/0xf0
> [c0000000044c36f0] [c000000000334434] .__apply_to_page_range+0x764/0xa30
> [c0000000044c3840] [c00000000006cad0] .change_memory_attr+0xf0/0x160
> [c0000000044c38d0] [c0000000002a1d70] .bpf_prog_select_runtime+0x150/0x230
> [c0000000044c3970] [c000000000d405d4] .bpf_prepare_filter+0x504/0x6f0
> [c0000000044c3a30] [c000000000d4085c] .bpf_prog_create+0x9c/0x140
> [c0000000044c3ac0] [c000000002051d9c] .ptp_classifier_init+0x44/0x78
> [c0000000044c3b50] [c000000002050f3c] .sock_init+0xe0/0x100
> [c0000000044c3bd0] [c000000000010bd4] .do_one_initcall+0xa4/0x438
> [c0000000044c3cc0] [c000000002005008] .kernel_init_freeable+0x378/0x428
> [c0000000044c3da0] [c0000000000113d8] .kernel_init+0x28/0x1a0
> [c0000000044c3e10] [c00000000000ca3c] .ret_from_kernel_thread+0x58/0x60
> 
> This in turn is because __flush_tlb_pending() calls:
> 
> static inline int mm_is_thread_local(struct mm_struct *mm)
> {
>         return cpumask_equal(mm_cpumask(mm),
>                               cpumask_of(smp_processor_id()));
> }
> 
> __flush_tlb_pending() has a comment about this:
> 
>  * Must be called from within some kind of spinlock/non-preempt region...
>  */
> void __flush_tlb_pending(struct ppc64_tlb_batch *batch)
> 
> So I guess that didn't happen for some reason? Maybe this is indicative
> of some lock imbalance that then gets hit later?
> 
> I've also managed to not hit this bug a few times. When it triggers,
> after "kprobes: kprobe jump-optimization is enabled. All kprobes are
> optimized if possible.", there's a long hang - tens seconds before it
> continues. When it doesn't trigger, there's no hang at that point in the
> boot process.
> 

That probably explains why my attempts to bisect the problem were
unsuccessful.

Thanks,
Guenter
