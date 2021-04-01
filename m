Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C41350CFF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 05:13:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9pCp22jBz3bsF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 14:13:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=RC63h5vI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::132;
 helo=mail-lf1-x132.google.com; envelope-from=sxwjean@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RC63h5vI; dkim-atps=neutral
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9nb16qkkz2ydG
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Apr 2021 13:44:43 +1100 (AEDT)
Received: by mail-lf1-x132.google.com with SMTP id d13so584145lfg.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 19:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wrqYjelSb5/HkAwF2Sl1k+tdUiBKisB2EJruoTPNeL4=;
 b=RC63h5vI3np155S9cvnk8Ds0sRjBiOfDZdw/yVaPja14Zx/bH6Ln6KpCiBvQLSXRnG
 tMPjN6mpCgUi1YxFuOS+sFsVLtuTmvRJvjMA4Ieij5wLEMwI4S+/7DOnL3Fo3YDNvrZk
 9vq2ZF9qLmEuugdv5lEHvb7NkKD14RUEJzRanR2L56gv9dQV3ZN0aau26iS1U7UoV925
 /ZM3gyHxq06AHDvrAm+eYTG1lQavylsLV/glAdfBDRcin3J5CHLpLbHtJljrNqsdykAj
 nx9IXo+XxOx83GDXQW7bx4kLFAKY84suk0Iwbhrv9R/vUY3WqoC1YwFwmtaNkTbneTOa
 VUUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wrqYjelSb5/HkAwF2Sl1k+tdUiBKisB2EJruoTPNeL4=;
 b=Kjtn1hw3ut5HWMEAkui0qZKHP8XyeD9lLKHWXoAeXLHUjQa0Jr/0M7lcC9+ePrYl63
 Sv7mqUfvt5V9AxNxDCIDA7OYv/UKMVUOdQ4uXM75BTmtyddCEd4yp+gvCa1bVwgWlE/k
 IIF/mXULdl8dHeS0QNR+8oX8TMRj3gNsyk1116aCxz8/iZq66k/Wqo5DGt7IXjGo6Uug
 mFqqcdQJr0J923msW6enIv4uiaau4XwlqY98d+QmRd9ZKAIoBeYExaMw6uBViAOpv1tg
 mMYlcA+Qq/7TBP6UBN60re+0ZYVNCYXEQMEPO60Mf/a5Wwg3MZoV/ALt92GoMeqY41/g
 G+DQ==
X-Gm-Message-State: AOAM530trp9mDi5YQs7DvOom8XxwZW78AekQn1ki/GzuQQ9uZb/BLIPy
 QIIC+o7klJkX5nHU+ZGaSQhyY5Ykq/4SyicFpfc=
X-Google-Smtp-Source: ABdhPJxGfeI1dVblbBXRI4QlACyh8I+rRClhet7yYluSbXbyZSot6f7lOAll9yzwmMovPe7ljU1BsOAWTE/LCQuNnx8=
X-Received: by 2002:a19:58a:: with SMTP id 132mr4102575lff.520.1617245077489; 
 Wed, 31 Mar 2021 19:44:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210330150425.10145-1-sxwjean@me.com>
 <875z17y79i.fsf@mpe.ellerman.id.au>
In-Reply-To: <875z17y79i.fsf@mpe.ellerman.id.au>
From: Xiongwei Song <sxwjean@gmail.com>
Date: Thu, 1 Apr 2021 10:44:26 +0800
Message-ID: <CAEVVKH8ur_8Bvrp-u8yoHwrpUoAqxfiYT_g2Ok3T1rBTeOKAxg@mail.gmail.com>
Subject: Re: [PATCH v2] powerpc/traps: Enhance readability for trap types
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: multipart/alternative; boundary="0000000000005bcc5505bee036b0"
X-Mailman-Approved-At: Thu, 01 Apr 2021 14:12:45 +1100
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
Cc: pmladek@suse.com, peterz@infradead.org, peterx@redhat.com,
 linux-kernel@vger.kernel.org, paulus@samba.org, kan.liang@linux.intel.com,
 leobras.c@gmail.com, mikey@neuling.org, maddy@linux.ibm.com,
 aneesh.kumar@linux.ibm.com, haren@linux.ibm.com, aik@ozlabs.ru,
 kjain@linux.ibm.com, msuchanek@suse.de, ravi.bangoria@linux.ibm.com,
 john.ogness@linutronix.de, alistair@popple.id.au, npiggin@gmail.com,
 kvm-ppc@vger.kernel.org, jniethe5@gmail.com, atrajeev@linux.vnet.ibm.com,
 Xiongwei Song <sxwjean@me.com>, oleg@redhat.com, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--0000000000005bcc5505bee036b0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Michael Ellerman <mpe@ellerman.id.au> =E4=BA=8E2021=E5=B9=B43=E6=9C=8831=E6=
=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=885:58=E5=86=99=E9=81=93=EF=BC=9A

> Xiongwei Song <sxwjean@me.com> writes:
> > From: Xiongwei Song <sxwjean@gmail.com>
> >
> > Create a new header named traps.h, define macros to list ppc exception
> > types in traps.h, replace the reference of the real trap values with
> > these macros.
>
> Personally I find the hex values easier to recognise, but I realise
> that's probably not true of other people :)
>
> I'm one of the "other people".

> ...
> > diff --git a/arch/powerpc/include/asm/traps.h
> b/arch/powerpc/include/asm/traps.h
> > new file mode 100644
> > index 000000000000..a31b6122de23
> > --- /dev/null
> > +++ b/arch/powerpc/include/asm/traps.h
> > @@ -0,0 +1,19 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef _ASM_PPC_TRAPS_H
> > +#define _ASM_PPC_TRAPS_H
> > +
> > +#define TRAP_RESET   0x100 /* System reset */
> > +#define TRAP_MCE     0x200 /* Machine check */
> > +#define TRAP_DSI     0x300 /* Data storage */
> > +#define TRAP_DSEGI   0x380 /* Data segment */
> > +#define TRAP_ISI     0x400 /* Instruction storage */
> > +#define TRAP_ISEGI   0x480 /* Instruction segment */
> > +#define TRAP_ALIGN   0x600 /* Alignment */
> > +#define TRAP_PROG    0x700 /* Program */
> > +#define TRAP_DEC     0x900 /* Decrementer */
> > +#define TRAP_SYSCALL 0xc00 /* System call */
> > +#define TRAP_TRACEI  0xd00 /* Trace */
> > +#define TRAP_FPA     0xe00 /* Floating-point Assist */
> > +#define TRAP_PMI     0xf00 /* Performance monitor */
>
> I know the macro is called TRAP and the field in pt_regs is called trap,
> but the terminology in the architecture is "exception", and we already
> have many uses of that. In particular we have a lot of uses of "exc" as
> an abbreviation for "exception". So I think I'd rather we use that than
> "TRAP".
>
Ok.

>
> I think we should probably use the names from the ISA, unless they are
> really over long.
>
> Which are:
>
>   0x100   System Reset
>   0x200   Machine Check
>   0x300   Data Storage
>   0x380   Data Segment
>   0x400   Instruction Storage
>   0x480   Instruction Segment
>   0x500   External
>   0x600   Alignment
>   0x700   Program
>   0x800   Floating-Point Unavailable
>   0x900   Decrementer
>   0x980   Hypervisor Decrementer
>   0xA00   Directed Privileged Doorbell
>   0xC00   System Call
>   0xD00   Trace
>   0xE00   Hypervisor Data Storage
>   0xE20   Hypervisor Instruction Storage
>   0xE40   Hypervisor Emulation Assistance
>   0xE60   Hypervisor Maintenance
>   0xE80   Directed Hypervisor Doorbell
>   0xEA0   Hypervisor Virtualization
>   0xF00   Performance Monitor
>   0xF20   Vector Unavailable
>   0xF40   VSX Unavailable
>   0xF60   Facility Unavailable
>   0xF80   Hypervisor Facility Unavailable
>   0xFA0   Directed Ultravisor Doorbell
>
>
> So perhaps:
>
>   EXC_SYSTEM_RESET
>   EXC_MACHINE_CHECK
>   EXC_DATA_STORAGE
>   EXC_DATA_SEGMENT
>   EXC_INST_STORAGE
>   EXC_INST_SEGMENT
>   EXC_EXTERNAL_INTERRUPT
>   EXC_ALIGNMENT
>   EXC_PROGRAM_CHECK
>   EXC_FP_UNAVAILABLE
>   EXC_DECREMENTER
>   EXC_HV_DECREMENTER
>   EXC_SYSTEM_CALL
>   EXC_HV_DATA_STORAGE
>   EXC_PERF_MONITOR
>
> Thanks for the suggestions. I'm ok with the prefix. Let me change.

--0000000000005bcc5505bee036b0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">Michael Ellerman &lt;<a href=3D"mailto:mp=
e@ellerman.id.au">mpe@ellerman.id.au</a>&gt; =E4=BA=8E2021=E5=B9=B43=E6=9C=
=8831=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8B=E5=8D=885:58=E5=86=99=E9=81=93=
=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Xiongw=
ei Song &lt;<a href=3D"mailto:sxwjean@me.com" target=3D"_blank">sxwjean@me.=
com</a>&gt; writes:<br>
&gt; From: Xiongwei Song &lt;<a href=3D"mailto:sxwjean@gmail.com" target=3D=
"_blank">sxwjean@gmail.com</a>&gt;<br>
&gt;<br>
&gt; Create a new header named traps.h, define macros to list ppc exception=
<br>
&gt; types in traps.h, replace the reference of the real trap values with<b=
r>
&gt; these macros.<br>
<br>
Personally I find the hex values easier to recognise, but I realise<br>
that&#39;s probably not true of other people :)<br>
<br></blockquote><div>I&#39;m one of the &quot;other people&quot;.=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
...<br>
&gt; diff --git a/arch/powerpc/include/asm/traps.h b/arch/powerpc/include/a=
sm/traps.h<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..a31b6122de23<br>
&gt; --- /dev/null<br>
&gt; +++ b/arch/powerpc/include/asm/traps.h<br>
&gt; @@ -0,0 +1,19 @@<br>
&gt; +/* SPDX-License-Identifier: GPL-2.0 */<br>
&gt; +#ifndef _ASM_PPC_TRAPS_H<br>
&gt; +#define _ASM_PPC_TRAPS_H<br>
&gt; +<br>
&gt; +#define TRAP_RESET=C2=A0 =C2=A00x100 /* System reset */<br>
&gt; +#define TRAP_MCE=C2=A0 =C2=A0 =C2=A00x200 /* Machine check */<br>
&gt; +#define TRAP_DSI=C2=A0 =C2=A0 =C2=A00x300 /* Data storage */<br>
&gt; +#define TRAP_DSEGI=C2=A0 =C2=A00x380 /* Data segment */<br>
&gt; +#define TRAP_ISI=C2=A0 =C2=A0 =C2=A00x400 /* Instruction storage */<b=
r>
&gt; +#define TRAP_ISEGI=C2=A0 =C2=A00x480 /* Instruction segment */<br>
&gt; +#define TRAP_ALIGN=C2=A0 =C2=A00x600 /* Alignment */<br>
&gt; +#define TRAP_PROG=C2=A0 =C2=A0 0x700 /* Program */<br>
&gt; +#define TRAP_DEC=C2=A0 =C2=A0 =C2=A00x900 /* Decrementer */<br>
&gt; +#define TRAP_SYSCALL 0xc00 /* System call */<br>
&gt; +#define TRAP_TRACEI=C2=A0 0xd00 /* Trace */<br>
&gt; +#define TRAP_FPA=C2=A0 =C2=A0 =C2=A00xe00 /* Floating-point Assist */=
<br>
&gt; +#define TRAP_PMI=C2=A0 =C2=A0 =C2=A00xf00 /* Performance monitor */<b=
r>
<br>
I know the macro is called TRAP and the field in pt_regs is called trap,<br=
>
but the terminology in the architecture is &quot;exception&quot;, and we al=
ready<br>
have many uses of that. In particular we have a lot of uses of &quot;exc&qu=
ot; as<br>
an abbreviation for &quot;exception&quot;. So I think I&#39;d rather we use=
 that than<br>
&quot;TRAP&quot;.<br></blockquote><div>Ok.</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
<br>
I think we should probably use the names from the ISA, unless they are<br>
really over long.<br>
<br>
Which are:<br>
<br>
=C2=A0 0x100=C2=A0 =C2=A0System Reset<br>
=C2=A0 0x200=C2=A0 =C2=A0Machine Check<br>
=C2=A0 0x300=C2=A0 =C2=A0Data Storage<br>
=C2=A0 0x380=C2=A0 =C2=A0Data Segment<br>
=C2=A0 0x400=C2=A0 =C2=A0Instruction Storage<br>
=C2=A0 0x480=C2=A0 =C2=A0Instruction Segment<br>
=C2=A0 0x500=C2=A0 =C2=A0External<br>
=C2=A0 0x600=C2=A0 =C2=A0Alignment<br>
=C2=A0 0x700=C2=A0 =C2=A0Program<br>
=C2=A0 0x800=C2=A0 =C2=A0Floating-Point Unavailable<br>
=C2=A0 0x900=C2=A0 =C2=A0Decrementer<br>
=C2=A0 0x980=C2=A0 =C2=A0Hypervisor Decrementer<br>
=C2=A0 0xA00=C2=A0 =C2=A0Directed Privileged Doorbell<br>
=C2=A0 0xC00=C2=A0 =C2=A0System Call<br>
=C2=A0 0xD00=C2=A0 =C2=A0Trace<br>
=C2=A0 0xE00=C2=A0 =C2=A0Hypervisor Data Storage<br>
=C2=A0 0xE20=C2=A0 =C2=A0Hypervisor Instruction Storage<br>
=C2=A0 0xE40=C2=A0 =C2=A0Hypervisor Emulation Assistance<br>
=C2=A0 0xE60=C2=A0 =C2=A0Hypervisor Maintenance<br>
=C2=A0 0xE80=C2=A0 =C2=A0Directed Hypervisor Doorbell<br>
=C2=A0 0xEA0=C2=A0 =C2=A0Hypervisor Virtualization<br>
=C2=A0 0xF00=C2=A0 =C2=A0Performance Monitor<br>
=C2=A0 0xF20=C2=A0 =C2=A0Vector Unavailable<br>
=C2=A0 0xF40=C2=A0 =C2=A0VSX Unavailable<br>
=C2=A0 0xF60=C2=A0 =C2=A0Facility Unavailable<br>
=C2=A0 0xF80=C2=A0 =C2=A0Hypervisor Facility Unavailable<br>
=C2=A0 0xFA0=C2=A0 =C2=A0Directed Ultravisor Doorbell<br>
<br>
<br>
So perhaps:<br>
<br>
=C2=A0 EXC_SYSTEM_RESET<br>
=C2=A0 EXC_MACHINE_CHECK<br>
=C2=A0 EXC_DATA_STORAGE<br>
=C2=A0 EXC_DATA_SEGMENT<br>
=C2=A0 EXC_INST_STORAGE<br>
=C2=A0 EXC_INST_SEGMENT<br>
=C2=A0 EXC_EXTERNAL_INTERRUPT<br>
=C2=A0 EXC_ALIGNMENT<br>
=C2=A0 EXC_PROGRAM_CHECK<br>
=C2=A0 EXC_FP_UNAVAILABLE<br>
=C2=A0 EXC_DECREMENTER<br>
=C2=A0 EXC_HV_DECREMENTER<br>
=C2=A0 EXC_SYSTEM_CALL<br>
=C2=A0 EXC_HV_DATA_STORAGE<br>
=C2=A0 EXC_PERF_MONITOR<br>
<br></blockquote><div>Thanks for the suggestions. I&#39;m ok with the prefi=
x. Let me change.</div></div></div>

--0000000000005bcc5505bee036b0--
