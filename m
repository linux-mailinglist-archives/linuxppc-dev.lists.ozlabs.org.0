Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A929759CE01
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Aug 2022 03:43:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBX7s3m16z3bk0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Aug 2022 11:43:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=o2SkIvPy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=zhouzhouyi@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=o2SkIvPy;
	dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MBX7F0jrHz2xrD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Aug 2022 11:43:18 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id x63-20020a17090a6c4500b001fabbf8debfso13147903pjj.4
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Aug 2022 18:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=V9q0q2/QxbNvfOOowc3MnXFd5fHZg5Kih7cADAHli34=;
        b=o2SkIvPyybUVThnWFIF0mEQ1toFoDZdhab0XVz5z04Y23lonBlSKs2UtoeWoQ0hknp
         Y/S12YhtJMqioYvY/tiuVPbxwyaBTg5rJGEPljAYVCga+4edWfQM6vAgkwTaFQvSJ9oT
         6HBDZuhuj1C6CDKmxxa0LR/7pCJSnnUorZaasingb+kO87Dr7wXUIQfG+2Pxserq2pfK
         +vNqnSC3dxMjFhcRj+yUq3Xsulx9Vqp1XiVAz9t76DpyUAVHIG04XMi0yU4M92SDjHW0
         0kdVlJCV5hwJ7+8Wy4z3AI+6X7hntmtCzo99Cib/qq9gR3M9tCZjflhiHf3c0TdQKz5l
         YwHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=V9q0q2/QxbNvfOOowc3MnXFd5fHZg5Kih7cADAHli34=;
        b=Z8yEq54aTanc53mtAliR57aqBAb/xqffZkjoAQ2Pzv+iKypxYqxqyC5NT8DwHLzUh4
         +2pj9Y9+RMcLAckYBkTFKlYD1PSFiDOOioy/FoPuw3rukWKYrUrpTfi6bZLakqQF896f
         AE2CAROuNPa+p/3wdIbNxzG+f1N1VZd84Xuffk/nBeyn9O4xyLm0MFUo4pbZuHCOLLEs
         3RKRxcRz6blf8z4dbn72n7UNixFku+ByTxptXTlF6izj2r8KzLtL6rWP6vKXKl+TGx0X
         7B3eISQwFiO9N0GKzGLKXEqxwF/YW8LoZhdoN68Ye/j4zeo+T1MRtkEEQhhosnXdJsBC
         iGAQ==
X-Gm-Message-State: ACgBeo0I+bsB4yIsJdEJl9Zn5NOkHBYeACAzddmdt3RwGZHkCuMw154J
	6tfcfCuTX0cXwJz+abZBMxhs3KzyZw3IWzMki7g=
X-Google-Smtp-Source: AA6agR5eM2rKQl1i2NCLvfv06QtijaO7dlv63CAbLScBggr7Q1lpBuqfcCF7lAfxWRtWlY2FCb1psMOwJKOHYDheJiA=
X-Received: by 2002:a17:902:744a:b0:172:fca9:6625 with SMTP id
 e10-20020a170902744a00b00172fca96625mr2403598plt.133.1661218995709; Mon, 22
 Aug 2022 18:43:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220821010030.97539-1-zhouzhouyi@gmail.com> <6375fd69-d57f-be90-6b17-f183e918dbc8@csgroup.eu>
In-Reply-To: <6375fd69-d57f-be90-6b17-f183e918dbc8@csgroup.eu>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Tue, 23 Aug 2022 09:43:04 +0800
Message-ID: <CAABZP2y8dGAWHZwbXpbQgc3iO+7hBMuexqvcYUK-GKaKnAHH5Q@mail.gmail.com>
Subject: Re: [PATCH linux-next] powerpc: disable sanitizer in irq_soft_mask_set
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: "atrajeev@linux.vnet.ibm.com" <atrajeev@linux.vnet.ibm.com>, "paulmck@kernel.org" <paulmck@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "rcu@vger.kernel.org" <rcu@vger.kernel.org>, "lance@osuosl.org" <lance@osuosl.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 22, 2022 at 2:04 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 21/08/2022 =C3=A0 03:00, Zhouyi Zhou a =C3=A9crit :
> > In ppc, compiler based sanitizer will generate instrument instructions
> > around statement WRITE_ONCE(local_paca->irq_soft_mask, mask):
> >
> >     0xc000000000295cb0 <+0>:  addis   r2,r12,774
> >     0xc000000000295cb4 <+4>:  addi    r2,r2,16464
> >     0xc000000000295cb8 <+8>:  mflr    r0
> >     0xc000000000295cbc <+12>: bl      0xc00000000008bb4c <mcount>
> >     0xc000000000295cc0 <+16>: mflr    r0
> >     0xc000000000295cc4 <+20>: std     r31,-8(r1)
> >     0xc000000000295cc8 <+24>: addi    r3,r13,2354
> >     0xc000000000295ccc <+28>: mr      r31,r13
> >     0xc000000000295cd0 <+32>: std     r0,16(r1)
> >     0xc000000000295cd4 <+36>: stdu    r1,-48(r1)
> >     0xc000000000295cd8 <+40>: bl      0xc000000000609b98 <__asan_store1=
+8>
> >     0xc000000000295cdc <+44>: nop
> >     0xc000000000295ce0 <+48>: li      r9,1
> >     0xc000000000295ce4 <+52>: stb     r9,2354(r31)
> >     0xc000000000295ce8 <+56>: addi    r1,r1,48
> >     0xc000000000295cec <+60>: ld      r0,16(r1)
> >     0xc000000000295cf0 <+64>: ld      r31,-8(r1)
> >     0xc000000000295cf4 <+68>: mtlr    r0
> >
> > If there is a context switch before "stb     r9,2354(r31)", r31 may
> > not equal to r13, in such case, irq soft mask will not work.
> >
> > This patch disable sanitizer in irq_soft_mask_set.
>
> Well spotted, thanks.
Thank Christophe for reviewing my patch and your guidance!
>
> You should add:
>
> Fixes: ef5b570d3700 ("powerpc/irq: Don't open code irq_soft_mask helpers"=
)
OK, I will do it!
>
> By the way, I think the READ_ONCE() likely has the same issue so you
> should fix irq_soft_mask_return() at the same time.
Yes, after disassembling irq_soft_mask_return, she has the same issue
as irq_soft_mask_set.

In addition, I read hw_irq.h by naked eye to search for removed inline
assembly one by one,
I found another place that we could possible enhance (Thank Paul E.
McKenny for teaching me use git blame ;-)):
077fc62b2b66a("powerpc/irq: remove inline assembly in hard_irq_disable macr=
o")
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -282,9 +282,7 @@ static inline bool pmi_irq_pending(void)
        flags =3D irq_soft_mask_set_return(IRQS_ALL_DISABLED);            \
        local_paca->irq_happened |=3D PACA_IRQ_HARD_DIS;                  \
        if (!arch_irqs_disabled_flags(flags)) {                         \
-               asm ("stdx %%r1, 0, %1 ;"                               \
-                    : "=3Dm" (local_paca->saved_r1)                      \
-                    : "b" (&local_paca->saved_r1));                    \
+               WRITE_ONCE(local_paca->saved_r1, current_stack_pointer);\
                trace_hardirqs_off();                                   \
        }                                                               \
 } while(0)
I wrap the macro hard_irq_disable into a test function and disassemble
it, she has the above issue too:
(gdb) disassemble test002
Dump of assembler code for function test002:
   0xc000000000295db0 <+0>:    addis   r2,r12,774
   0xc000000000295db4 <+4>:    addi    r2,r2,16464
   0xc000000000295db8 <+8>:    mflr    r0
   0xc000000000295dbc <+12>:    bl      0xc00000000008bacc <mcount>
   0xc000000000295dc0 <+16>:    mflr    r0
   0xc000000000295dc4 <+20>:    std     r30,-16(r1)
   0xc000000000295dc8 <+24>:    std     r31,-8(r1)
   0xc000000000295dcc <+28>:    li      r9,2
   0xc000000000295dd0 <+32>:    std     r0,16(r1)
   0xc000000000295dd4 <+36>:    stdu    r1,-48(r1)
   0xc000000000295dd8 <+40>:    mtmsrd  r9,1
   0xc000000000295ddc <+44>:    addi    r3,r13,2354
   0xc000000000295de0 <+48>:    mr      r31,r13
   0xc000000000295de4 <+52>:    bl      0xc000000000609838 <__asan_load1+8>
   0xc000000000295de8 <+56>:    nop
   0xc000000000295dec <+60>:    li      r3,3
   0xc000000000295df0 <+64>:    lbz     r30,2354(r31)
   0xc000000000295df4 <+68>:    bl      0xc00000000028de90 <irq_soft_mask_s=
et>
   0xc000000000295df8 <+72>:    mr      r31,r13
   0xc000000000295dfc <+76>:    addi    r3,r13,2355
   0xc000000000295e00 <+80>:    bl      0xc000000000609838 <__asan_load1+8>
   0xc000000000295e04 <+84>:    nop
   0xc000000000295e08 <+88>:    lbz     r9,2355(r31)
   0xc000000000295e0c <+92>:    andi.   r10,r30,1
   0xc000000000295e10 <+96>:    ori     r9,r9,1
   0xc000000000295e14 <+100>:    stb     r9,2355(r31)
   0xc000000000295e18 <+104>:    bne     0xc000000000295e30 <test002+128>
   0xc000000000295e1c <+108>:    mr      r30,r1
   0xc000000000295e20 <+112>:    addi    r3,r31,2328
   0xc000000000295e24 <+116>:    bl      0xc000000000609dd8 <__asan_store8+=
8>
   0xc000000000295e28 <+120>:    nop
   0xc000000000295e2c <+124>:    std     r30,2328(r31)
   0xc000000000295e30 <+128>:    addi    r1,r1,48
   0xc000000000295e34 <+132>:    ld      r0,16(r1)
   0xc000000000295e38 <+136>:    ld      r30,-16(r1)
   0xc000000000295e3c <+140>:    ld      r31,-8(r1)
   0xc000000000295e40 <+144>:    mtlr    r0
   0xc000000000295e44 <+148>:    blr
Could we rewrite this macro into a static inline function as
irq_soft_mask_set does, and disable sanitizer for it?

Thanks again
Cheers
Zhouyi
>
> >
> > Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
> > ---
> > Dear PPC developers
> >
> > I found this bug when trying to do rcutorture tests in ppc VM of
> > Open Source Lab of Oregon State University following Paul E. McKenny's =
guidance.
> >
> > console.log report following bug:
> >
> > [  346.527467][  T100] BUG: using smp_processor_id() in preemptible [00=
000000] code: rcu_torture_rea/100^M
> > [  346.529416][  T100] caller is rcu_preempt_deferred_qs_irqrestore+0x7=
4/0xed0^M
> > [  346.531157][  T100] CPU: 4 PID: 100 Comm: rcu_torture_rea Tainted: G=
        W          5.19.0-rc5-next-20220708-dirty #253^M
> > [  346.533620][  T100] Call Trace:^M
> > [  346.534449][  T100] [c0000000094876c0] [c000000000ce2b68] dump_stack=
_lvl+0xbc/0x108 (unreliable)^M
> > [  346.536632][  T100] [c000000009487710] [c000000001712954] check_pree=
mption_disabled+0x154/0x160^M
> > [  346.538665][  T100] [c0000000094877a0] [c0000000002ce2d4] rcu_preemp=
t_deferred_qs_irqrestore+0x74/0xed0^M
> > [  346.540830][  T100] [c0000000094878b0] [c0000000002cf3c0] __rcu_read=
_unlock+0x290/0x3b0^M
> > [  346.542746][  T100] [c000000009487910] [c0000000002bb330] rcu_tortur=
e_read_unlock+0x30/0xb0^M
> > [  346.544779][  T100] [c000000009487930] [c0000000002b7ff8] rcutorture=
_one_extend+0x198/0x810^M
> > [  346.546851][  T100] [c000000009487a10] [c0000000002b8bfc] rcu_tortur=
e_one_read+0x58c/0xc90^M
> > [  346.548844][  T100] [c000000009487ca0] [c0000000002b942c] rcu_tortur=
e_reader+0x12c/0x360^M
> > [  346.550784][  T100] [c000000009487db0] [c0000000001de978] kthread+0x=
1e8/0x220^M
> > [  346.552555][  T100] [c000000009487e10] [c00000000000cd54] ret_from_k=
ernel_thread+0x5c/0x64^M
> >
> > After 12 days debugging, I finally narrow the problem to irq_soft_mask_=
set.
> >
> > I am a beginner, hope I can be of some beneficial to the community ;-)
> >
> > Thanks
> > Zhouyi
> > --
> >   arch/powerpc/include/asm/hw_irq.h | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/a=
sm/hw_irq.h
> > index 26ede09c521d..a5ae8d82cc9d 100644
> > --- a/arch/powerpc/include/asm/hw_irq.h
> > +++ b/arch/powerpc/include/asm/hw_irq.h
> > @@ -121,7 +121,7 @@ static inline notrace unsigned long irq_soft_mask_r=
eturn(void)
> >    * for the critical section and as a clobber because
> >    * we changed paca->irq_soft_mask
> >    */
> > -static inline notrace void irq_soft_mask_set(unsigned long mask)
> > +static inline notrace __no_kcsan __no_sanitize_address void irq_soft_m=
ask_set(unsigned long mask)
> >   {
> >       /*
> >        * The irq mask must always include the STD bit if any are set.
