Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A893E0293
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 16:02:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gftj33F0xz3cMK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 00:02:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=PQW94aeF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72d;
 helo=mail-qk1-x72d.google.com; envelope-from=radu.rendec@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PQW94aeF; dkim-atps=neutral
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfthR3hz2z304V
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Aug 2021 00:01:42 +1000 (AEST)
Received: by mail-qk1-x72d.google.com with SMTP id x3so2795435qkl.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Aug 2021 07:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=lAcUqfGNK/vKh805DTBR3HzpfTobh2wi2E9gIlvVZ18=;
 b=PQW94aeF6OBxLbUUYwzl19r0q7xGYyNVs8SbLqe/oTt9VMpwGLy2MOs0O/Y1+uVr9z
 UqTYotVTFPShEzM8I1S5uLXaJtkfp0/3mqpYI7aNoJP709ihgrcdTDAmBXAkjbEwOY19
 r8zEMhfO4YLhphtJ+ICVFuLoctauTapc2wlUCdgqaRuBt7NddT3dzpleY7p1v21KeSF1
 fMVngf1z2hh6c+uQ1aeEBpafcYjnS/3V6n0Yc5Ol0QA0BUoML0wBiTuY0KiLhzx0rrRb
 DC0MAzvGwIj8LygiVz5IKW4Zi/MmWBXS3H8qRAi2WI/KgF6xxgy6d6NxPcR9MlaQ2NSo
 Gf+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=lAcUqfGNK/vKh805DTBR3HzpfTobh2wi2E9gIlvVZ18=;
 b=XJQKC5Y7xmhdOITqVH3myFnqrJVHBSPRQS/LramOugbuzSBmzPJv8/TzN6FR5J1UFk
 LilQIDlrNjB0/KhoQ7kw6QRgDQMCTfcW8NabnpkwVahYX/TyJEr57BrT9+PTy+x/MxlP
 880W/JMbyNTkfFKip2qk8SplDNTNgjVQQQ4rKUVpVNei9rK5QjLL7jjQEl+3awHIvhyi
 zLlL3c+ZXXSwdDaneDUxocGHbi/44EDlGHbo2A38ZfUzz+78gTjV58b8fCK6whgQJXhj
 RLK6nLq6DVMq1QQ6h9lyaA+pymrc2YY7dcNTQ45THgcnH+AHUNB4SLn/UrT2kaOoN/Tj
 /QlA==
X-Gm-Message-State: AOAM533XOwAyodv7GNU8FF5qIz/D7J3mxA6EXd9vMbovA3DAt2E3V6F9
 qDGxNyJKBWnV5qLTsiljItQ=
X-Google-Smtp-Source: ABdhPJz/A+s0bModLH3XwnR7BC4vkevcEVENTG3FaZqf7ADtkd+kbfKcTmDSEsh1tPDV6xleTqGdpA==
X-Received: by 2002:ae9:f70f:: with SMTP id s15mr2127451qkg.437.1628085698949; 
 Wed, 04 Aug 2021 07:01:38 -0700 (PDT)
Received: from bat.mindbit.ro (cpe00fc8d79db03-cm00fc8d79db00.cpe.net.fido.ca.
 [72.137.118.157])
 by smtp.gmail.com with ESMTPSA id j12sm857805qtj.21.2021.08.04.07.01.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 07:01:38 -0700 (PDT)
Message-ID: <32e1428e6b872fe6694cc1251bf19bc4b6d403a9.camel@gmail.com>
Subject: Re: [PATCH] powerpc/32: Fix critical and debug interrupts on BOOKE
From: Radu Rendec <radu.rendec@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Date: Wed, 04 Aug 2021 10:01:37 -0400
In-Reply-To: <c9f3a3e2-e5ed-6074-b700-99911d925012@csgroup.eu>
References: <028d5483b4851b01ea4334d0751e7f260419092b.1625637264.git.christophe.leroy@csgroup.eu>
 <c9f3a3e2-e5ed-6074-b700-99911d925012@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

On Wed, 2021-08-04 at 07:52 +0200, Christophe Leroy wrote:
> Le 07/07/2021 à 07:55, Christophe Leroy a écrit :
> > 32 bits BOOKE have special interrupts for debug and other
> > critical events.
> 
> Were you able to test this patch ?

I tested it three weeks ago and it works like a charm!

I'm so sorry I forgot to let you know. I got distracted testing the
old ptrace() problem. In fact, I wouldn't have been able to test that
if your interrupts patch hadn't been working.

Thanks,
Radu

> > When handling those interrupts, dedicated registers are saved
> > in the stack frame in addition to the standard registers, leading
> > to a shift of the pt_regs struct.
> > 
> > Since commit db297c3b07af ("powerpc/32: Don't save thread.regs on
> > interrupt entry"), the pt_regs struct is expected to be at the
> > same place all the time.
> > 
> > Instead of handling a special struct in addition to pt_regs, just
> > add those special registers to struct pt_regs.
> > 
> > Reported-by: Radu Rendec <radu.rendec@gmail.com>
> > Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > Fixes: db297c3b07af ("powerpc/32: Don't save thread.regs on
> > interrupt entry")
> > Cc: stable@vger.kernel.org
> > ---
> >   arch/powerpc/include/asm/ptrace.h | 16 ++++++++++++++++
> >   arch/powerpc/kernel/asm-offsets.c | 31
> > ++++++++++++++-----------------
> >   arch/powerpc/kernel/head_booke.h  | 27
> > +++------------------------
> >   3 files changed, 33 insertions(+), 41 deletions(-)
> > 
> > diff --git a/arch/powerpc/include/asm/ptrace.h
> > b/arch/powerpc/include/asm/ptrace.h
> > index 3e5d470a6155..14422e851494 100644
> > --- a/arch/powerpc/include/asm/ptrace.h
> > +++ b/arch/powerpc/include/asm/ptrace.h
> > @@ -70,6 +70,22 @@ struct pt_regs
> >                 unsigned long __pad[4]; /* Maintain 16 byte
> > interrupt stack alignment */
> >         };
> >   #endif
> > +#if defined(CONFIG_PPC32) && defined(CONFIG_BOOKE)
> > +       struct { /* Must be a multiple of 16 bytes */
> > +               unsigned long mas0;
> > +               unsigned long mas1;
> > +               unsigned long mas2;
> > +               unsigned long mas3;
> > +               unsigned long mas6;
> > +               unsigned long mas7;
> > +               unsigned long srr0;
> > +               unsigned long srr1;
> > +               unsigned long csrr0;
> > +               unsigned long csrr1;
> > +               unsigned long dsrr0;
> > +               unsigned long dsrr1;
> > +       };
> > +#endif
> >   };
> >   #endif
> >   
> > diff --git a/arch/powerpc/kernel/asm-offsets.c
> > b/arch/powerpc/kernel/asm-offsets.c
> > index a47eefa09bcb..5bee245d832b 100644
> > --- a/arch/powerpc/kernel/asm-offsets.c
> > +++ b/arch/powerpc/kernel/asm-offsets.c
> > @@ -309,24 +309,21 @@ int main(void)
> >         STACK_PT_REGS_OFFSET(STACK_REGS_IAMR, iamr);
> >   #endif
> >   
> > -#if defined(CONFIG_PPC32)
> > -#if defined(CONFIG_BOOKE) || defined(CONFIG_40x)
> > -       DEFINE(EXC_LVL_SIZE, STACK_EXC_LVL_FRAME_SIZE);
> > -       DEFINE(MAS0, STACK_INT_FRAME_SIZE+offsetof(struct
> > exception_regs, mas0));
> > +#if defined(CONFIG_PPC32) && defined(CONFIG_BOOKE)
> > +       STACK_PT_REGS_OFFSET(MAS0, mas0);
> >         /* we overload MMUCR for 44x on MAS0 since they are
> > mutually exclusive */
> > -       DEFINE(MMUCR, STACK_INT_FRAME_SIZE+offsetof(struct
> > exception_regs, mas0));
> > -       DEFINE(MAS1, STACK_INT_FRAME_SIZE+offsetof(struct
> > exception_regs, mas1));
> > -       DEFINE(MAS2, STACK_INT_FRAME_SIZE+offsetof(struct
> > exception_regs, mas2));
> > -       DEFINE(MAS3, STACK_INT_FRAME_SIZE+offsetof(struct
> > exception_regs, mas3));
> > -       DEFINE(MAS6, STACK_INT_FRAME_SIZE+offsetof(struct
> > exception_regs, mas6));
> > -       DEFINE(MAS7, STACK_INT_FRAME_SIZE+offsetof(struct
> > exception_regs, mas7));
> > -       DEFINE(_SRR0, STACK_INT_FRAME_SIZE+offsetof(struct
> > exception_regs, srr0));
> > -       DEFINE(_SRR1, STACK_INT_FRAME_SIZE+offsetof(struct
> > exception_regs, srr1));
> > -       DEFINE(_CSRR0, STACK_INT_FRAME_SIZE+offsetof(struct
> > exception_regs, csrr0));
> > -       DEFINE(_CSRR1, STACK_INT_FRAME_SIZE+offsetof(struct
> > exception_regs, csrr1));
> > -       DEFINE(_DSRR0, STACK_INT_FRAME_SIZE+offsetof(struct
> > exception_regs, dsrr0));
> > -       DEFINE(_DSRR1, STACK_INT_FRAME_SIZE+offsetof(struct
> > exception_regs, dsrr1));
> > -#endif
> > +       STACK_PT_REGS_OFFSET(MMUCR, mas0);
> > +       STACK_PT_REGS_OFFSET(MAS1, mas1);
> > +       STACK_PT_REGS_OFFSET(MAS2, mas2);
> > +       STACK_PT_REGS_OFFSET(MAS3, mas3);
> > +       STACK_PT_REGS_OFFSET(MAS6, mas6);
> > +       STACK_PT_REGS_OFFSET(MAS7, mas7);
> > +       STACK_PT_REGS_OFFSET(_SRR0, srr0);
> > +       STACK_PT_REGS_OFFSET(_SRR1, srr1);
> > +       STACK_PT_REGS_OFFSET(_CSRR0, csrr0);
> > +       STACK_PT_REGS_OFFSET(_CSRR1, csrr1);
> > +       STACK_PT_REGS_OFFSET(_DSRR0, dsrr0);
> > +       STACK_PT_REGS_OFFSET(_DSRR1, dsrr1);
> >   #endif
> >   
> >         /* About the CPU features table */
> > diff --git a/arch/powerpc/kernel/head_booke.h
> > b/arch/powerpc/kernel/head_booke.h
> > index 87b806e8eded..e5503420b6c6 100644
> > --- a/arch/powerpc/kernel/head_booke.h
> > +++ b/arch/powerpc/kernel/head_booke.h
> > @@ -168,20 +168,18 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
> >   /* only on e500mc */
> >   #define DBG_STACK_BASE                dbgirq_ctx
> >   
> > -#define EXC_LVL_FRAME_OVERHEAD (THREAD_SIZE - INT_FRAME_SIZE -
> > EXC_LVL_SIZE)
> > -
> >   #ifdef CONFIG_SMP
> >   #define BOOKE_LOAD_EXC_LEVEL_STACK(level)             \
> >         mfspr   r8,SPRN_PIR;                            \
> >         slwi    r8,r8,2;                                \
> >         addis   r8,r8,level##_STACK_BASE@ha;            \
> >         lwz     r8,level##_STACK_BASE@l(r8);            \
> > -       addi    r8,r8,EXC_LVL_FRAME_OVERHEAD;
> > +       addi    r8,r8,THREAD_SIZE - INT_FRAME_SIZE;
> >   #else
> >   #define BOOKE_LOAD_EXC_LEVEL_STACK(level)             \
> >         lis     r8,level##_STACK_BASE@ha;               \
> >         lwz     r8,level##_STACK_BASE@l(r8);            \
> > -       addi    r8,r8,EXC_LVL_FRAME_OVERHEAD;
> > +       addi    r8,r8,THREAD_SIZE - INT_FRAME_SIZE;
> >   #endif
> >   
> >   /*
> > @@ -208,7 +206,7 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
> >         mtmsr   r11;                                                    \
> >         mfspr   r11,SPRN_SPRG_THREAD;   /* if from user, start at
> > top of   */\
> >         lwz     r11, TASK_STACK - THREAD(r11); /* this thread's
> > kernel stack */\
> > -       addi    r11,r11,EXC_LVL_FRAME_OVERHEAD; /* allocate stack
> > frame    */\
> > +       addi    r11,r11,THREAD_SIZE - INT_FRAME_SIZE;   /* allocate
> > stack frame    */\
> >         beq     1f;                                                         
> > \
> >         /* COMING FROM USER MODE
> > */                                          \
> >         stw     r9,_CCR(r11);           /* save
> > CR                         */\
> > @@ -516,24 +514,5 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
> >         bl      kernel_fp_unavailable_exception;                             
> > \
> >         b       interrupt_return
> >   
> > -#else /* __ASSEMBLY__ */
> > -struct exception_regs {
> > -       unsigned long mas0;
> > -       unsigned long mas1;
> > -       unsigned long mas2;
> > -       unsigned long mas3;
> > -       unsigned long mas6;
> > -       unsigned long mas7;
> > -       unsigned long srr0;
> > -       unsigned long srr1;
> > -       unsigned long csrr0;
> > -       unsigned long csrr1;
> > -       unsigned long dsrr0;
> > -       unsigned long dsrr1;
> > -};
> > -
> > -/* ensure this structure is always sized to a multiple of the
> > stack alignment */
> > -#define STACK_EXC_LVL_FRAME_SIZE       ALIGN(sizeof (struct
> > exception_regs), 16)
> > -
> >   #endif /* __ASSEMBLY__ */
> >   #endif /* __HEAD_BOOKE_H__ */
> > 


