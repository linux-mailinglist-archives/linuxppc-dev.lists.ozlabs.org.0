Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3831D273A89
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 08:12:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwWDW2MVLzDqwb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 16:12:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c44;
 helo=mail-oo1-xc44.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XsWFgUoM; dkim-atps=neutral
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com
 [IPv6:2607:f8b0:4864:20::c44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwWBq06gqzDqSZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 16:10:42 +1000 (AEST)
Received: by mail-oo1-xc44.google.com with SMTP id w25so88556oos.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Sep 2020 23:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DTIdTi5KZ3nwu0a/RnaWKAKSq6ttTDmJOrmVTGzsLtg=;
 b=XsWFgUoMDDudJmHJEY50KzSdQjFaO0YyB6dLKT7EeXxObCsd3shYY+MDqxbJPyk99R
 fhKe2n1As9pHAYIKBIVLValo0QIQ7zKHJu1f6xVY9mV6wNIb7Un6JMb7iRw+D58t9F5L
 i/GI2Wz+HU2w+A/OuL2R0Dz1/zBfDLfH3SlkaEA+iA1BUh1N5Eiq91lrHn56KrFXtJaN
 lQ11Rpr6K5zrbNsWo9ZqgBGqwh4NKlLeIg6GPIrHmOy/fJ5V2dnriOgcVI6Xlgo+BHAI
 xY1kgA0IEDTAhAMJ+S0bq6EI8+8DIsu+cwSoR1oPbz5KrXUuiBiD700bnYWTFiLzhR4F
 HcFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DTIdTi5KZ3nwu0a/RnaWKAKSq6ttTDmJOrmVTGzsLtg=;
 b=ai2vXpJ4KsyZ17bykE7xrZkpHyZarcHb2ddvZBZitH0cNSh5uZCvMj4iuTCvaBuJQq
 SSuXKURfofxLg0fphT2akR7rIRNCcnFaGGnPGnZGCGWkGFQwE9iUuZPyFB85hM8ANtpH
 lNt3kBXvTDPhfE3e1GlCgq6diRSLJ+PTRIpAD1/BHAS0KZki4hKngyQ2MWpUcCGU2Pm5
 bU+hd/Q4PtIhacptyu8Cm2qHIVXZfq56LXoq0haDDe3MPy/lRlB6G1CPUlbMuatB/NeG
 +le+cODDkKZsqHQ0RO3zCyqBUJIyR+OmlL2yH84wlYvOS5XVjwbqMH80PykxOST2YdhO
 Ui+g==
X-Gm-Message-State: AOAM530GU9SUqCZQRyRBDLzOCrBCoOFHUa5NztqfLtFhPhSohvj/Bbie
 a+YfopiOhF8JWH5A23qJCxYwoiTmXOF4jaJd2qY=
X-Google-Smtp-Source: ABdhPJydM0emrpEHl39+M3b3e0x/Q4Ve7AsmRm6nWEJ8DfxyS1QT+eG4/6xXcpGiIwKLHT0XNyEjmYaHhAuOBW0Kqeg=
X-Received: by 2002:a4a:d38c:: with SMTP id i12mr1928159oos.81.1600755040003; 
 Mon, 21 Sep 2020 23:10:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200922055307.10647-1-jniethe5@gmail.com>
 <a4bc673b-74e2-98ea-dac7-4e6d86d10d15@csgroup.eu>
In-Reply-To: <a4bc673b-74e2-98ea-dac7-4e6d86d10d15@csgroup.eu>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Tue, 22 Sep 2020 16:10:28 +1000
Message-ID: <CACzsE9pgLVFDEfVgWAyfwBA1wYqcE2S1skGMBJkD1GJNh-BpKw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] powerpc/64: Set up a kernel stack for secondaries
 before cpu_restore()
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
Cc: Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 22, 2020 at 3:59 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 22/09/2020 =C3=A0 07:53, Jordan Niethe a =C3=A9crit :
> > Currently in generic_secondary_smp_init(), cur_cpu_spec->cpu_restore()
> > is called before a stack has been set up in r1. This was previously fin=
e
> > as the cpu_restore() functions were implemented in assembly and did not
> > use a stack. However commit 5a61ef74f269 ("powerpc/64s: Support new
> > device tree binding for discovering CPU features") used
> > __restore_cpu_cpufeatures() as the cpu_restore() function for a
> > device-tree features based cputable entry. This is a C function and
> > hence uses a stack in r1.
> >
> > generic_secondary_smp_init() is entered on the secondary cpus via the
> > primary cpu using the OPAL call opal_start_cpu(). In OPAL, each hardwar=
e
> > thread has its own stack. The OPAL call is ran in the primary's hardwar=
e
> > thread. During the call, a job is scheduled on a secondary cpu that wil=
l
> > start executing at the address of generic_secondary_smp_init().  Hence
> > the value that will be left in r1 when the secondary cpu enters the
> > kernel is part of that secondary cpu's individual OPAL stack. This mean=
s
> > that __restore_cpu_cpufeatures() will write to that OPAL stack. This is
> > not horribly bad as each hardware thread has its own stack and the call
> > that enters the kernel from OPAL never returns, but it is still wrong
> > and should be corrected.
> >
> > Create the temp kernel stack before calling cpu_restore().
> >
> > As noted by mpe, for a kexec boot, the secondary CPUs are released from
> > the spin loop at address 0x60 by smp_release_cpus() and then jump to
> > generic_secondary_smp_init(). The call to smp_release_cpus() is in
> > setup_arch(), and it comes before the call to emergency_stack_init().
> > emergency_stack_init() allocates an emergency stack in the PACA for eac=
h
> > CPU.  This address in the PACA is what is used to set up the temp kerne=
l
> > stack in generic_secondary_smp_init(). Move releasing the secondary CPU=
s
> > to after the PACAs have been allocated an emergency stack, otherwise th=
e
> > PACA stack pointer will contain garbage and hence the temp kernel stack
> > created from it will be broken.
> >
> > Fixes: 5a61ef74f269 ("powerpc/64s: Support new device tree binding for =
discovering CPU features")
> > Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> > ---
> > v2: Add more detail to the commit message
> > v3: Release secondary CPUs after the emergency stack is created
> > ---
> >   arch/powerpc/kernel/head_64.S      | 8 ++++----
> >   arch/powerpc/kernel/setup-common.c | 6 ++++--
> >   2 files changed, 8 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_6=
4.S
> > index 0e05a9a47a4b..4b7f4c6c2600 100644
> > --- a/arch/powerpc/kernel/head_64.S
> > +++ b/arch/powerpc/kernel/head_64.S
> > @@ -420,6 +420,10 @@ generic_secondary_common_init:
> >       /* From now on, r24 is expected to be logical cpuid */
> >       mr      r24,r5
> >
> > +     /* Create a temp kernel stack for use before relocation is on.  *=
/
> > +     ld      r1,PACAEMERGSP(r13)
> > +     subi    r1,r1,STACK_FRAME_OVERHEAD
> > +
> >       /* See if we need to call a cpu state restore handler */
> >       LOAD_REG_ADDR(r23, cur_cpu_spec)
> >       ld      r23,0(r23)
> > @@ -448,10 +452,6 @@ generic_secondary_common_init:
> >       sync                            /* order paca.run and cur_cpu_spe=
c */
> >       isync                           /* In case code patching happened=
 */
> >
> > -     /* Create a temp kernel stack for use before relocation is on.  *=
/
> > -     ld      r1,PACAEMERGSP(r13)
> > -     subi    r1,r1,STACK_FRAME_OVERHEAD
> > -
> >       b       __secondary_start
> >   #endif /* SMP */
> >
> > diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/s=
etup-common.c
> > index 808ec9fab605..fff714e36b37 100644
> > --- a/arch/powerpc/kernel/setup-common.c
> > +++ b/arch/powerpc/kernel/setup-common.c
> > @@ -919,8 +919,6 @@ void __init setup_arch(char **cmdline_p)
> >
> >       /* On BookE, setup per-core TLB data structures. */
> >       setup_tlb_core_data();
> > -
> > -     smp_release_cpus();
> >   #endif
> >
> >       /* Print various info about the machine that has been gathered so=
 far. */
> > @@ -944,6 +942,10 @@ void __init setup_arch(char **cmdline_p)
> >       exc_lvl_early_init();
> >       emergency_stack_init();
> >
> > +#ifdef CONFIG_SMP
> > +     smp_release_cpus();
> > +#endif
>
> Are you sure you need that #ifdef ?
Thanks, you are right, should not be necessary.
>
> In asm/smp.h, we have:
>
> #if defined(CONFIG_PPC64) && (defined(CONFIG_SMP) ||
> defined(CONFIG_KEXEC_CORE))
> extern void smp_release_cpus(void);
> #else
> static inline void smp_release_cpus(void) { };
> #endif
>
>
> > +
> >       initmem_init();
> >
> >       early_memtest(min_low_pfn << PAGE_SHIFT, max_low_pfn << PAGE_SHIF=
T);
> >
>
> Christophe
