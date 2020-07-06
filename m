Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F6221564E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 13:26:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0jtc1qx6zDqY0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 21:26:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::241;
 helo=mail-lj1-x241.google.com; envelope-from=anders.roxell@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=QH/QkiRC; dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B0jrm41thzDqQm
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jul 2020 21:24:20 +1000 (AEST)
Received: by mail-lj1-x241.google.com with SMTP id h19so44831064ljg.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Jul 2020 04:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N/qqSqGJ4atHyDtGLB+oDdWnYx8zR6WgF+gzNEisgxo=;
 b=QH/QkiRCO/2f007fNmmGuuln3zrUOvUgGzbfbxcEo+zlATxosWUlkAbebuuGTvU6Gj
 6nSv8exlNPSZ6/bO4J3Er6ID/F4RysG1kQjmM+zbR5p/7H9cd0SlGQu+h9Dtke2zrcF6
 mFM0+2R0ODJBtWWf/rYzI1CqIGP6bn+TzckYs+24G1QIM1jgR6ItUrExyUILgTnBm6Ow
 VsFo0Bvz+YANuhbW9fv40BkpdbwsyP4/22frHTA2sOqqr/BCkgdiTEFXNjebPn36Ul66
 zuxWEboMtMq9kGbk0jItt+q/PZT7oduzGfN+z4fhh0RBmT9vrpMKjGAMZchXEou5Cc0d
 lVHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N/qqSqGJ4atHyDtGLB+oDdWnYx8zR6WgF+gzNEisgxo=;
 b=OKVinsx6d8ecNjIxgyxMSw2T63RoC4iOoRxuMU/E+QBscFRzFjo2Sxf6AQueCTCsL0
 AKIwy41CSzHknOzEwCBtjTmEBI3dFJs0lVTNL+rKpqbp0VJXW7rJ/NmIuZEg+AZJiU8x
 i/9R5c9pGnQyuqlFXUh0sJzYWJAw9vyIZrq27ES4C2l4j7kLT8x/djxu5H2VaB9fHRLg
 pFR+YlrBGbXjoGdmOdG6WNfdd5vK+6HbcWsTW/AZVQ3x0mi+6+0NIfpRfgXS8PFmOMJN
 LWP9Sdw0qrmMU4vyEDg2oAURTf3TTzfmh1T95QbKtXNZ6zi5am0ba/JsW/0wmAfhhh9t
 mztw==
X-Gm-Message-State: AOAM531uNWS+uSsbW4xQqrqYxxpDK/7MVkOefjsbkyEzFHoGugQ8MHfr
 WAmgqUvxVKaD4wff3BsLvgE+8VAMvxDKxtAAEB7lGw==
X-Google-Smtp-Source: ABdhPJxinXv3Qm7OoOgVOZXKb7XScaCRT3Q3d/hmgv6HXQpneLgKWySKYEGdk3hiM/+rU3v65qYgO4ico8H4m6guBu4=
X-Received: by 2002:a05:651c:102d:: with SMTP id
 w13mr20625061ljm.29.1594034656332; 
 Mon, 06 Jul 2020 04:24:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200628015041.1000002-1-masahiroy@kernel.org>
 <87imfa8le0.fsf@mpe.ellerman.id.au>
 <CAK7LNATusciypBJ4dYZcyrugdi_rXEV_s=zxAehDxsX+Sd5z4g@mail.gmail.com>
In-Reply-To: <CAK7LNATusciypBJ4dYZcyrugdi_rXEV_s=zxAehDxsX+Sd5z4g@mail.gmail.com>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Mon, 6 Jul 2020 13:24:05 +0200
Message-ID: <CADYN=9JnzPC6Ja9s3_01k-CDTSuxKBMRdrqU5rqp0xw1r9XpRw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: introduce ccflags-remove-y and asflags-remove-y
To: Masahiro Yamada <masahiroy@kernel.org>
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
Cc: Michal Marek <michal.lkml@markovi.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Russell King <linux@armlinux.org.uk>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Sami Tolvanen <samitolvanen@google.com>,
 Rich Felker <dalias@libc.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

When I built an allmodconfig kernel for arm64, and boot that in qemu
guest I see the following issues:

[...]
[   10.451561][    T1] Testing tracer function: PASSED
[   33.087895][    T1] Testing dynamic ftrace: .. filter did not
filter .. FAILED!
[   51.127094][    T1] ------------[ cut here ]------------
[   51.132387][    T1] WARNING: CPU: 0 PID: 1 at
kernel/trace/trace.c:1814 run_tracer_selftest+0x314/0x40c
[   51.140805][    T1] Modules linked in:
[   51.145398][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted
5.8.0-rc3-next-20200703-00004-g8cd4bc531754 #1
[   51.154146][    T1] Hardware name: linux,dummy-virt (DT)
[   51.159536][    T1] pstate: 80400005 (Nzcv daif +PAN -UAO BTYPE=--)
[   51.165711][    T1] pc : run_tracer_selftest+0x314/0x40c
[   51.171167][    T1] lr : run_tracer_selftest+0x308/0x40c
[   51.176475][    T1] sp : ffff000069c07c40
[   51.180855][    T1] x29: ffff000069c07c40 x28: ffffa00015e80320
[   51.187187][    T1] x27: ffffa00013e074a0 x26: ffffa000150f22ee
[   51.193520][    T1] x25: ffffa000125b35a0 x24: ffffa00013f6a000
[   51.199868][    T1] x23: ffffa00013f6adc0 x22: 00000000ffffffff
[   51.206225][    T1] x21: ffffa000150f2250 x20: ffffa00015e801c0
[   51.212582][    T1] x19: ffffa00015e7fa80 x18: 0000000000002750
[   51.218887][    T1] x17: 00000000000014c0 x16: 00000000000016f0
[   51.225229][    T1] x15: 00000000000014f8 x14: ffffa0001000a3c8
[   51.231584][    T1] x13: ffffa000124a5fb8 x12: ffff80000d494822
[   51.237935][    T1] x11: 1fffe0000d494821 x10: ffff80000d494821
[   51.244293][    T1] x9 : ffffa000101763b0 x8 : ffff000069c077d7
[   51.250704][    T1] x7 : 0000000000000001 x6 : ffff000069c077d0
[   51.257060][    T1] x5 : ffff00006a7fc040 x4 : 0000000000000000
[   51.263423][    T1] x3 : ffffa00010211118 x2 : 8af0509000018b00
[   51.269757][    T1] x1 : 0000000000000000 x0 : 0000000000000001
[   51.276084][    T1] Call trace:
[   51.279934][    T1]  run_tracer_selftest+0x314/0x40c
[   51.285174][    T1]  init_trace_selftests+0x110/0x31c
[   51.290391][    T1]  do_one_initcall+0x410/0x960
[   51.295315][    T1]  kernel_init_freeable+0x430/0x4f0
[   51.300595][    T1]  kernel_init+0x20/0x1d8
[   51.305180][    T1]  ret_from_fork+0x10/0x18
[   51.309741][    T1] irq event stamp: 1401832
[   51.314399][    T1] hardirqs last  enabled at (1401831):
[<ffffa0001020d10c>] console_unlock+0xc04/0xd10
[   51.322973][    T1] hardirqs last disabled at (1401832):
[<ffffa00010050fe4>] debug_exception_enter+0xbc/0x200
[   51.331993][    T1] softirqs last  enabled at (1401828):
[<ffffa000100023a4>] __do_softirq+0x95c/0x9f8
[   51.340490][    T1] softirqs last disabled at (1401821):
[<ffffa0001010f7d0>] irq_exit+0x118/0x198
[   51.348717][    T1] _warn_unseeded_randomness: 5 callbacks suppressed
[   51.349263][    T1] random: get_random_bytes called from
print_oops_end_marker+0x48/0x80 with crng_init=0
[   51.350502][    T1] ---[ end trace c566e8a71c933d3c ]---
[...]
[40709.672335][    C0] pool 2: cpus=0 flags=0x5 nice=0 hung=3s
workers=3 manager: 1455
[40739.960593][   T26] INFO: lockdep is turned off.
[40775.312499][   T26] Kernel panic - not syncing: hung_task: blocked tasks
[40775.341521][   T26] CPU: 0 PID: 26 Comm: khungtaskd Tainted: G
  W         5.8.0-rc3-next-20200703-00004-g8cd4bc531754 #1
[40775.352848][   T26] Hardware name: linux,dummy-virt (DT)
[40775.359304][   T26] Call trace:
[40775.364148][   T26]  dump_backtrace+0x0/0x418
[40775.369918][   T26]  show_stack+0x34/0x48
[40775.375468][   T26]  dump_stack+0x1f4/0x2b0
[40775.381136][   T26]  panic+0x2dc/0x6ec
[40775.386430][   T26]  watchdog+0x1400/0x1460
[40775.392103][   T26]  kthread+0x23c/0x250
[40775.397548][   T26]  ret_from_fork+0x10/0x18
[40775.407039][   T26] Kernel Offset: disabled
[40775.412634][   T26] CPU features: 0x240002,20002004
[40775.418751][   T26] Memory Limit: none
[40775.425823][   T26] ---[ end Kernel panic - not syncing: hung_task:
blocked tasks ]---

The full log can be found here [1].

Without this patch for  'trace_selftest_dynamic' for instance, CC_FLAGS_FTRACE
was removed from kernel/trace/*, and then added back to
kernel/trace/trace_selftest_dynamic.
While with this patch it looks like we add the flag (even though it is
already there), and then
removes the flag for all files in kernel/trace/* .

Cheers,
Anders
[1] https://people.linaro.org/~anders.roxell/output-next-20200703.log

On Tue, 30 Jun 2020 at 04:09, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Mon, Jun 29, 2020 at 2:55 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
> >
> > Masahiro Yamada <masahiroy@kernel.org> writes:
> > > CFLAGS_REMOVE_<file>.o works per object, that is, there is no
> > > convenient way to filter out flags for every object in a directory.
> > >
> > > Add ccflags-remove-y and asflags-remove-y to make it easily.
> > >
> > > Use ccflags-remove-y to clean up some Makefiles.
> > >
> > > Suggested-by: Sami Tolvanen <samitolvanen@google.com>
> > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > > ---
> > >
> > >  arch/arm/boot/compressed/Makefile | 6 +-----
> > >  arch/powerpc/xmon/Makefile        | 3 +--
> > >  arch/sh/boot/compressed/Makefile  | 5 +----
> > >  kernel/trace/Makefile             | 4 ++--
> > >  lib/Makefile                      | 5 +----
> > >  scripts/Makefile.lib              | 4 ++--
> > >  6 files changed, 8 insertions(+), 19 deletions(-)
> > >
> > > diff --git a/arch/powerpc/xmon/Makefile b/arch/powerpc/xmon/Makefile
> > > index 89c76ca35640..55cbcdd88ac0 100644
> > > --- a/arch/powerpc/xmon/Makefile
> > > +++ b/arch/powerpc/xmon/Makefile
> > > @@ -7,8 +7,7 @@ UBSAN_SANITIZE := n
> > >  KASAN_SANITIZE := n
> > >
> > >  # Disable ftrace for the entire directory
> > > -ORIG_CFLAGS := $(KBUILD_CFLAGS)
> > > -KBUILD_CFLAGS = $(subst $(CC_FLAGS_FTRACE),,$(ORIG_CFLAGS))
> > > +ccflags-remove-y += $(CC_FLAGS_FTRACE)
> >
> > This could be:
> >
> > ccflags-remove-$(CONFIG_FUNCTION_TRACER) += $(CC_FLAGS_FTRACE)
> >
> > Similar to kernel/trace/Makefile below.
>
>
> I fixed it up, and applied to linux-kbuild.
> Thanks.
>
>
> > I don't mind though.
> >
> > Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
> >
> > cheers
> >
> > > diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
> > > index 6575bb0a0434..7492844a8b1b 100644
> > > --- a/kernel/trace/Makefile
> > > +++ b/kernel/trace/Makefile
> > > @@ -2,9 +2,9 @@
> > >
> > >  # Do not instrument the tracer itself:
> > >
> > > +ccflags-remove-$(CONFIG_FUNCTION_TRACER) += $(CC_FLAGS_FTRACE)
> > > +
> > >  ifdef CONFIG_FUNCTION_TRACER
> > > -ORIG_CFLAGS := $(KBUILD_CFLAGS)
> > > -KBUILD_CFLAGS = $(subst $(CC_FLAGS_FTRACE),,$(ORIG_CFLAGS))
> > >
> > >  # Avoid recursion due to instrumentation.
> > >  KCSAN_SANITIZE := n
>
>
>
> --
> Best Regards
> Masahiro Yamada
