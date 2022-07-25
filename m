Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AE257FBD4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 10:55:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lrv516JSjz3c70
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 18:55:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=B41XXnog;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=zhouzhouyi@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=B41XXnog;
	dkim-atps=neutral
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lrv4M4PZ3z30Qc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 18:54:41 +1000 (AEST)
Received: by mail-ej1-x629.google.com with SMTP id ez10so19193860ejc.13
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 01:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=47BArXHIXB9BaUKafjhngHzvOxajXlmoQN8z1D/nn+k=;
        b=B41XXnogGRTsWKKXwcoVzwsvOVhDu+KdXGyBeafZ1MaGPuUh4vnxjsQXjc8jbR5BBv
         SCctWK9I6ec7nWLK3mFS2ySQdQOQTcADnPRRy+INY23rx2hJ2FEdUM3vdMmvsTZMxi7X
         NCXPWQD27B9faXLggMdit79b6ZCsHXRXRB8HDWREM4Bf30T1E/jADVd5Do/UD0nlUfp+
         eMzDPGC3FdLP0swH/1Rz1dpt75QlZ2V2VR2T0h4iCIN5j5SOXNEb6zaD4f0+n29SZ90z
         Sgdr9kr94lC1Q/n8KU1MkFEghauVPT5XQ+NdXq3q8fGtWCUZAnwhmFCXQlRQJT02e7vo
         UljA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=47BArXHIXB9BaUKafjhngHzvOxajXlmoQN8z1D/nn+k=;
        b=TaIdz7Y587dEHwl9AgaTH8sl/YfPUOeFfjpA2/0E5a1HZW4z/YnKlVzgTWSoh4EVuT
         4RxZ0u/IvHqf8QiYCjn/cDmQ7/uxG75dC61p91xenO5DclvYSeRRFhAfeHv6TkqbVnm5
         b6VdoSkROzdzHXTpz6k3h/6z3PB71kCcVtcVS8aQrpgyrmgA7uxQmpb34JwqVyd22Pd9
         DSXTv8J1+yN7LQZWYps6Dt93+is7LjM7860NBG+XBshmG7qQqGctY+92WmW9dLpYuyWQ
         aFaCoi0pjFp0DlI1zl6G+Wf4ZosXzAoKYTegCFjAMeWGzuthlJ5gJJZkwQ9HRpsvLe92
         OLNA==
X-Gm-Message-State: AJIora8eFyxMnz/oWU91byjsfstvlIBV1xkE5WAwUCqt26IqJKnFm7Bt
	GgXasK1KZcrOmFFCLf9ILnLJFKAxeMb2PW2n6Y4=
X-Google-Smtp-Source: AGRyM1ucJl22LjVfdToVKOyeMo26q7eY0GRrHMqckh/jVztpOQJSV3YJaIKA5CRwG8w5JQUh30s5gHzVh+rKmUChl4w=
X-Received: by 2002:a17:906:8a5a:b0:72b:6b60:2d9f with SMTP id
 gx26-20020a1709068a5a00b0072b6b602d9fmr9263214ejc.324.1658739275459; Mon, 25
 Jul 2022 01:54:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220724010221.17371-1-zhouzhouyi@gmail.com> <878rohd3u8.fsf@mpe.ellerman.id.au>
In-Reply-To: <878rohd3u8.fsf@mpe.ellerman.id.au>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Mon, 25 Jul 2022 16:54:24 +0800
Message-ID: <CAABZP2wL4o+EjLWSxNNeyuo40zcDQDQ3Q0T1v9+h65phRLJMCg@mail.gmail.com>
Subject: Re: [PATCH linux-next] powerpc: init jump label early in ppc 64
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: wangkefeng.wang@huawei.com, "Paul E. McKenney" <paulmck@kernel.org>, John Ogness <john.ogness@linutronix.de>, linux-kernel <linux-kernel@vger.kernel.org>, rcu <rcu@vger.kernel.org>, paulus@samba.org, Nicholas Piggin <npiggin@gmail.com>, aneesh.kumar@linux.ibm.com, lance@osuosl.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 25, 2022 at 3:55 PM Michael Ellerman <mpe@ellerman.id.au> wrote=
:
>
> zhouzhouyi@gmail.com writes:
> > From: Zhouyi Zhou <zhouzhouyi@gmail.com>
> >
> > In ppc 64, invoke jump_label_init in setup_feature_keys is too late
> > because static key will be used in subroutine of early_init_devtree.
> >
> > So we can invoke jump_label_init earlier in early_setup.
> > We can not move setup_feature_keys backward because its subroutine
> > cpu_feature_keys_init depend on data structures initialized in
> > early_init_devtree.
> >
> > Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
> > ---
> > Dear PPC developers
> >
> > I found this bug when trying to do rcutorture tests in ppc VM of
> > Open Source Lab of Oregon State University.
> >
> > qemu-system-ppc64 -nographic -smp cores=3D8,threads=3D1 -net none -M ps=
eries -nodefaults -device spapr-vscsi -serial file:/home/ubuntu/linux-next/=
tools/testing/selftests/rcutorture/res/2022.07.19-01.18.42-torture/results-=
rcutorture/TREE03/console.log -m 512 -kernel /home/ubuntu/linux-next/tools/=
testing/selftests/rcutorture/res/2022.07.19-01.18.42-torture/results-rcutor=
ture/TREE03/vmlinux -append "debug_boot_weak_hash panic=3D-1 console=3DttyS=
0 rcupdate.rcu_cpu_stall_suppress_at_boot=3D1 torture.disable_onoff_at_boot=
 rcupdate.rcu_task_stall_timeout=3D30000 rcutorture.onoff_interval=3D200 rc=
utorture.onoff_holdoff=3D30 rcutree.gp_preinit_delay=3D12 rcutree.gp_init_d=
elay=3D3 rcutree.gp_cleanup_delay=3D3 rcutree.kthread_prio=3D2 threadirqs t=
ree.use_softirq=3D0 rcutorture.n_barrier_cbs=3D4 rcutorture.stat_interval=
=3D15 rcutorture.shutdown_secs=3D420 rcutorture.test_no_idle_hz=3D1 rcutort=
ure.verbose=3D1"
> >
> > console.log report following WARN:
> > [    0.000000][    T0] static_key_enable_cpuslocked(): static key '0xc0=
00000002953260' used before call to jump_label_init()^M
> > [    0.000000][    T0] WARNING: CPU: 0 PID: 0 at kernel/jump_label.c:16=
6 static_key_enable_cpuslocked+0xfc/0x120^M
> > [    0.000000][    T0] Modules linked in:^M
> > [    0.000000][    T0] CPU: 0 PID: 0 Comm: swapper Not tainted 5.19.0-r=
c5-next-20220708-dirty #131^M
> > [    0.000000][    T0] NIP:  c00000000038068c LR: c000000000380688 CTR:=
 c000000000186ac0^M
> > [    0.000000][    T0] REGS: c000000002867930 TRAP: 0700   Not tainted =
 (5.19.0-rc5-next-20220708-dirty)^M
> > [    0.000000][    T0] MSR:  8000000000022003 <SF,FP,RI,LE>  CR: 242822=
24  XER: 20040000^M
> > [    0.000000][    T0] CFAR: 0000000000000730 IRQMASK: 1 ^M
> > [    0.000000][    T0] GPR00: c000000000380688 c000000002867bd0 c000000=
002868d00 0000000000000065 ^M
> > [    0.000000][    T0] GPR04: 0000000000000001 0000000000000000 0000000=
000000080 000000000000000d ^M
> > [    0.000000][    T0] GPR08: 0000000000000000 0000000000000000 c000000=
0027fd000 000000000000000f ^M
> > [    0.000000][    T0] GPR12: c000000000186ac0 c000000002082280 0000000=
000000003 000000000000000d ^M
> > [    0.000000][    T0] GPR16: 0000000002cc00d0 0000000000000000 c000000=
002082280 0000000000000001 ^M
> > [    0.000000][    T0] GPR20: c000000002080942 0000000000000000 0000000=
000000000 0000000000000000 ^M
> > [    0.000000][    T0] GPR24: 0000000000000000 c0000000010d6168 0000000=
000000000 c0000000020034c8 ^M
> > [    0.000000][    T0] GPR28: 0000002800000000 0000000000000000 c000000=
002080942 c000000002953260 ^M
> > [    0.000000][    T0] NIP [c00000000038068c] static_key_enable_cpusloc=
ked+0xfc/0x120^M
> > [    0.000000][    T0] LR [c000000000380688] static_key_enable_cpuslock=
ed+0xf8/0x120^M
> > [    0.000000][    T0] Call Trace:^M
> > [    0.000000][    T0] [c000000002867bd0] [c000000000380688] static_key=
_enable_cpuslocked+0xf8/0x120 (unreliable)^M
> > [    0.000000][    T0] [c000000002867c40] [c000000000380810] static_key=
_enable+0x30/0x50^M
> > [    0.000000][    T0] [c000000002867c70] [c000000002030314] setup_forc=
ed_irqthreads+0x28/0x40^M
> > [    0.000000][    T0] [c000000002867c90] [c000000002003568] do_early_p=
aram+0xa0/0x108^M
> > [    0.000000][    T0] [c000000002867d10] [c000000000175340] parse_args=
+0x290/0x4e0^M
> > [    0.000000][    T0] [c000000002867e10] [c000000002003c74] parse_earl=
y_options+0x48/0x5c^M
> > [    0.000000][    T0] [c000000002867e30] [c000000002003ce0] parse_earl=
y_param+0x58/0x84^M
> > [    0.000000][    T0] [c000000002867e60] [c000000002009878] early_init=
_devtree+0xd4/0x518^M
> > [    0.000000][    T0] [c000000002867f10] [c00000000200aee0] early_setu=
p+0xb4/0x214^M
> >
> > After this fix, the WARN does not show again.
>
> Hi Zhouyi,
Thank Michael for your guidance.
>
> We have hit something like this previously, see the stack trace in
> commit e7eb919057c3 ("powerpc/64s: Handle program checks in wrong endian
> during early boot").
I am learning the fantastic work by you (git log -p e7eb919057c3),
e7eb919057c3 provides
a trampoline to detect and correct the wrong endian when handling the
exception caused by the WARN
(static key used before call to jump_label_init)
>
> That was fixed incidentally/accidentally by the page_poison code
> changing to not use static keys so early.
>
> There was a similar case recently in the random code too, see
> 60e5b2886b92 ("random: do not use jump labels before they are
> initialized").
I am also studying 60e5b2886b92, this commit delays the use of the
static key after jump_label_init is called.
>
> But I guess this will keep happening, as generic code authors expect to
> be able to use static keys in early_param() handlers.
>
> I think the ideal solution would be to move most early param parsing
> later. There's only a few parameters that need to be parsed that early
> in early_init_devtree(). That would be a complex and error-prone change
> though, so I won't ask you to do that :)
Yes, as a beginner, I like to study technologies, but I am not able to
do such a complex job ;-)
>
> But I think it would be better if you moved the call to
> jump_label_init() into early_init_devtree(), just before we call
> parse_early_param(), with a comment saying that it's required to call it
> before parsing early params.
OK, I will do that.
>
> And ...
>
> > diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup=
_64.c
> > index 2b2d0b0fbb30..bf2fb76221da 100644
> > --- a/arch/powerpc/kernel/setup_64.c
> > +++ b/arch/powerpc/kernel/setup_64.c
> > @@ -365,6 +365,9 @@ void __init early_setup(unsigned long dt_ptr)
> >
> >       udbg_printf(" -> %s(), dt_ptr: 0x%lx\n", __func__, dt_ptr);
> >
> > +     /* Initialise jump label because subsequent calls need it */
> > +     jump_label_init();
> > +
> >       /*
> >        * Do early initialization using the flattened device
> >        * tree, such as retrieving the physical memory map or
> > @@ -394,8 +397,15 @@ void __init early_setup(unsigned long dt_ptr)
> >
> >       /* Apply all the dynamic patching */
> >       apply_feature_fixups();
> > -     setup_feature_keys();
>
> I think you can just leave this as-is, it's fine to call
> jump_label_init() more than once.
Thanks again for your guidance ;-)
I will try to make a second version of the PATCH tomorrow.
Anyhow, this is a valuable learning process for me ;-)

Many Thank
Best Regards
Zhouyi
>
> > +
> > +     /*
> > +      * All the cpu/mmu_has_feature() checks take on their correct pol=
arity
> > +      * based on the current set of CPU/MMU features. These should be =
done
> > +      * only after early_init_devtree.
> > +      */
> > +     cpu_feature_keys_init();
> > +     mmu_feature_keys_init();
> > +
> >
> >       /* Initialize the hash table or TLB handling */
> >       early_init_mmu();
> > --
> > 2.25.1
>
> cheers
