Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDF749724A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jan 2022 15:55:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jhbkb23cbz3bP1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 01:55:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VxvvH2rv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::935;
 helo=mail-ua1-x935.google.com; envelope-from=michael.heltne@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=VxvvH2rv; dkim-atps=neutral
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com
 [IPv6:2607:f8b0:4864:20::935])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jhbjv3qq0z30Kn
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 01:54:25 +1100 (AEDT)
Received: by mail-ua1-x935.google.com with SMTP id c36so26123435uae.13
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jan 2022 06:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=W9z2l+dv8QAMeBJxMmgaqNsLTP4dDW0LaG9CJM6wG64=;
 b=VxvvH2rvDWxPR7dWsh8fim674ys3SIpzWN2k6z93chx9ZulYAThPd/0auY7tnu4Mge
 MQrcDvK06BKRvlYoZejgrXYH8DHL8qxK5Y/gTQx3HEo9uL1Gs4V03rVV/zkRmjzS0zEt
 nzEFzX1dhYVSrOHxmTg+22E4/Pcp0zZHtbR4N6UuMOs9HE7Z9WekWfW5/HS1i7juQLQu
 bAtwwi5U+q4XJQz+Ux5PBlWW1T0RrsUYRDNzD3lnhJI7U/cFQfY14IR4LjU0ou8JnJU8
 0prd4iXBYMKfqOxnMUyi2J4Fdmj8olPxwYobk2sslgMVvzB9OpikMjKi8kGbVLB8EKpJ
 dCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=W9z2l+dv8QAMeBJxMmgaqNsLTP4dDW0LaG9CJM6wG64=;
 b=mFrirHhRyk1snjhTYPY03uiT+3yi0yhtLQMEYz8xreACmoGsPsVQ/qAZyh9xlJdrY7
 CWxfeCHMXRppv8P/Bwbyn/mQMfFlHbuBiBSCY452YvLvbxDmy+6Oxoo2oNiDOvUS+Bhc
 JlMqTrvqSFbJitTdXyiTxDJADKPvSSNJwGIEgNzziarLDhDvNxeahSTcy7GHLBOhpk6e
 YwkvGMvW0ofWdXhhFiOv3OrAtKhsoD6KkeiFSzJmmr9Qsc/XG4dyNd1TkrNsYU2cV2XR
 H0JI+3pMsNAK2gsln+jZnrtrQhciWTuxNmOBvmhI0mIuxTR3EbjJf8gyCyGBLff8qxmg
 cI9w==
X-Gm-Message-State: AOAM533tlLqEwiKMFbyc04tkev0DJVAV4nmBvRbB1cMbZS5XvLWiALF4
 TJFE0sJQz2AixSX572aJOYfj3hvrxO/5qGLaVPqiY1Dw/KC8BA==
X-Google-Smtp-Source: ABdhPJzlyDHafj71Onvi5U2xWJTpcN8qR4XeBDmdHT0eAUkrmjSzmpav1POBj43UiIWDU60i3ZBWOVecRuBc46VIeUk=
X-Received: by 2002:a67:d80b:: with SMTP id e11mr1734804vsj.82.1642949660320; 
 Sun, 23 Jan 2022 06:54:20 -0800 (PST)
MIME-Version: 1.0
References: <CANtoAtP2QeH+fMqHo410H=nkjRiLhYNYjhKiEpMyWRHkMGw2iA@mail.gmail.com>
 <CANtoAtNFOJyqdiwBG9AfQTEZm91MUf5LUof88xwP-Ou7Uh4xYA@mail.gmail.com>
In-Reply-To: <CANtoAtNFOJyqdiwBG9AfQTEZm91MUf5LUof88xwP-Ou7Uh4xYA@mail.gmail.com>
From: Mike <michael.heltne@gmail.com>
Date: Sun, 23 Jan 2022 17:56:53 +0100
Message-ID: <CANtoAtNrzTnyn61GoT5S9Sv8Yo2wNzZCEk+zfeR6XMQN4J_AhA@mail.gmail.com>
Subject: Re: [PATCH] powerpc: fix building after binutils changes.
To: "open list:LINUX FOR POWERPC..." <linuxppc-dev@lists.ozlabs.org>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now I remembered reading something from 2013 on 'lwsync',
https://gcc.gnu.org/legacy-ml/gcc-patches/2006-11/msg01238.html
https://gcc.gnu.org/legacy-ml/gcc-patches/2012-07/msg01062.html

so that would end up something like
--- a/media/thread/12fd50d6-d14c-42af-ad1d-a595e5f080cd/dev/linux-main/linux/arch/powerpc/lib/sstep.c
+++ b/home/thread/dev/linus/linux/arch/powerpc/lib/sstep.c
@@ -3265,7 +3265,11 @@ void emulate_update_regs(struct pt_regs *regs,
struct instruction_op *op)
                        eieio();
                        break;
                case BARRIER_LWSYNC:
+#if defined (CONFIG_40x || CONFIG_44x || CONFIG_E500 ||
CONFIG_PPA8548 || CONFIG_TQM8548 || CONFIG_MPC8540_ADS ||
CONFIG_PPC_BOOK3S_603)
+                       asm volatile("sync" : : : "memory");
+#else
                        asm volatile("lwsync" : : : "memory");
+#endif
                        break;
 #ifdef CONFIG_PPC64
                case BARRIER_PTESYNC:

On Sun, 23 Jan 2022 at 15:18, Mike <michael.heltne@gmail.com> wrote:
>
> Maybe cite the correct parts of the patch where my questions arose for context.
> ---
> diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
> index a94b0cd0bdc5ca..4ffd6791b03ec0 100644
> --- a/arch/powerpc/lib/sstep.c
> +++ b/arch/powerpc/lib/sstep.c
> @@ -1465,7 +1465,7 @@ int analyse_instr(struct instruction_op *op,
> const struct pt_regs *regs,
>   switch ((word >> 1) & 0x3ff) {
>   case 598: /* sync */
>   op->type = BARRIER + BARRIER_SYNC;
> -#ifdef __powerpc64__
> +#ifdef CONFIG_PPC64
>   switch ((word >> 21) & 3) {
>   case 1: /* lwsync */
>   op->type = BARRIER + BARRIER_LWSYNC;
> @@ -3267,9 +3267,11 @@ void emulate_update_regs(struct pt_regs *regs,
> struct instruction_op *op)
>   case BARRIER_LWSYNC:
>   asm volatile("lwsync" : : : "memory");
>   break;
> +#ifdef CONFIG_PPC64
>   case BARRIER_PTESYNC:
>   asm volatile("ptesync" : : : "memory");
>   break;
> +#endif
>   }
>   break;
> -----
>
> On Sun, 23 Jan 2022 at 14:43, Mike <michael.heltne@gmail.com> wrote:
> >
> > As some have probably noticed, we are seeing errors like ' Error:
> > unrecognized opcode: `ptesync'' 'dssall' and 'stbcix' as a result of
> > binutils changes, making compiling all that more fun again. The only
> > question on my mind still is this:
> > ----
> > diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
> > index beba4979bff939..d3a9c91cd06a8b 100644
> > --- a/arch/powerpc/include/asm/io.h
> > +++ b/arch/powerpc/include/asm/io.h
> > @@ -334,7 +334,7 @@ static inline void __raw_writel(unsigned int v,
> > volatile void __iomem *addr)
> >  }
> >  #define __raw_writel __raw_writel
> >
> > -#ifdef __powerpc64__
> > +#ifdef CONFIG_PPC64
> >  static inline unsigned long __raw_readq(const volatile void __iomem *addr)
> >  {
> >   return *(volatile unsigned long __force *)PCI_FIX_ADDR(addr);
> > @@ -352,7 +352,8 @@ static inline void __raw_writeq_be(unsigned long
> > v, volatile void __iomem *addr)
> >   __raw_writeq((__force unsigned long)cpu_to_be64(v), addr);
> >  }
> >  #define __raw_writeq_be __raw_writeq_be
> > -
> > +#endif
> > +#ifdef CONFIG_POWER6_CPU
> >  /*
> >   * Real mode versions of the above. Those instructions are only supposed
> >   * to be used in hypervisor real mode as per the architecture spec.
> > @@ -417,7 +418,7 @@ static inline u64 __raw_rm_readq(volatile void
> > __iomem *paddr)
> >       : "=r" (ret) : "r" (paddr) : "memory");
> >   return ret;
> >  }
> > -#endif /* __powerpc64__ */
> >
> > +#endif /* CONFIG_POWER6_CPU */
> >
> > ---
> > Will there come a mail saying this broke the PPC6'ish based CPU
> > someone made in their garage? And lwesync is a valid PPC32
> > instruction, should i just follow the example above where
> > BARRIER_LWESYNC is PPC64 only?
> >
> > https://github.com/threader/linux/commits/master-build-ppc - linux-next
> >
> > Best regards.
> > Michael Heltne
