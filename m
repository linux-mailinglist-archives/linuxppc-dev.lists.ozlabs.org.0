Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 477796C9B60
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 08:28:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlNDD1JnZz3f4b
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 17:28:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GHu6JKpd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GHu6JKpd;
	dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlNCK5N5Kz30Ky
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 17:27:24 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id om3-20020a17090b3a8300b0023efab0e3bfso10754519pjb.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Mar 2023 23:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679898442;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/1MPkrc59nj7/vRx3EUgh/9Oxiv8gB+0mC5l8+wxrpQ=;
        b=GHu6JKpdfvBlZ5CaysvaaW5cDtdLeomhMMlCptnKmPowtDEYcaguwfh+0jqmk9xQFI
         1FN9tK8wUYX1MiEUyhUEzIyyvJi85fqIMXXcfMZAGG87+qhQk1EtSh6rpkl3aT5qR3Ll
         3/HeuOx+/zHKRPf6Jd27te9wX66gWCKXPJuo1G6HV8ESD1jJy0Pve+e7KW/c+mHm8LoD
         fuRgZckZJeVd+/zsPLpxTPJTgTJ5TVBuXhnOI1tJG6gGxA+BR/OWXf1TE3RXdQfVhIKC
         KqxD0D8Bc4rKkURenEJ71V/cOYjgf3i8yGn4wCO/6WlVrZ4Bfu53kBp/ZodcL1ZzWPkh
         SSOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679898442;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/1MPkrc59nj7/vRx3EUgh/9Oxiv8gB+0mC5l8+wxrpQ=;
        b=TZP1xhxmsHeb/cTrcH2pQv/EDMMXGLXqv4FRJ+yFpYOUcq5W18hzDGPqMwHkVkzhSB
         0WuInOgTJLJ0joxwZzln1Ew0rPY97yFP9ac2suGSCDu2CwF7XISjmUb2PcMkLKtJgufc
         0LV5yTjzd1qr2VTRx+soHGEVVOf3qtOYB8v+vWLdTC74Z4nD2Ld2WWskFYkKLhLrLAzY
         2dR/6gD2pwgDGJe3cvWE2hnTDBwmNNU2wO/F6HsQKyfsaWvQ+ge8W4A8BXFXGdenzSrZ
         v8Aq4Y666CeiLXLim949LQt8/DA372vDgzMrDHC7R6VGq7aa6KXXJdvVihJ3Ja4ZwHrr
         3hqw==
X-Gm-Message-State: AO0yUKU7ce6KHPfBw0kqylYaPRzbW0P4BsX+cDmXjquVC3mCkcLUpL0z
	hh/VJ3MoQGFLQLP4OHKWwllyxeBAFjM=
X-Google-Smtp-Source: AK7set/TTGUxgm141UWAXtsIwKXBDw657LJuDBKM8Ifljbg4ZknXfANlv+qDL8wsWDLevPkDyRMfxQ==
X-Received: by 2002:a05:6a20:4ca7:b0:d4:fcb2:7966 with SMTP id fq39-20020a056a204ca700b000d4fcb27966mr9926508pzb.11.1679898441933;
        Sun, 26 Mar 2023 23:27:21 -0700 (PDT)
Received: from localhost ([203.221.180.225])
        by smtp.gmail.com with ESMTPSA id j26-20020aa7929a000000b0062c0c3da6b8sm4253357pfa.13.2023.03.26.23.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Mar 2023 23:27:21 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Mar 2023 16:27:17 +1000
Message-Id: <CRGYAO7K51SR.1XV9XYPSYFFEY@bobo>
Subject: Re: [kvm-unit-tests v2 07/10] powerpc/spapr_vpa: Add basic VPA
 tests
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Thomas Huth" <thuth@redhat.com>, <kvm@vger.kernel.org>
X-Mailer: aerc 0.13.0
References: <20230320070339.915172-1-npiggin@gmail.com>
 <20230320070339.915172-8-npiggin@gmail.com>
 <e10767db-95c2-18a2-aa9a-a055844570ac@redhat.com>
In-Reply-To: <e10767db-95c2-18a2-aa9a-a055844570ac@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Mar 24, 2023 at 12:07 AM AEST, Thomas Huth wrote:
> On 20/03/2023 08.03, Nicholas Piggin wrote:
> > The VPA is a(n optional) memory structure shared between the hypervisor
> > and operating system, defined by PAPR. This test defines the structure
> > and adds registration, deregistration, and a few simple sanity tests.
> >=20
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >   lib/linux/compiler.h    |  2 +
> >   lib/powerpc/asm/hcall.h |  1 +
> >   lib/ppc64/asm/vpa.h     | 62 ++++++++++++++++++++++++++++
> >   powerpc/Makefile.ppc64  |  2 +-
> >   powerpc/spapr_vpa.c     | 90 ++++++++++++++++++++++++++++++++++++++++=
+
>
> Please add the new test to powerpc/unittests.cfg, otherwise it won't get=
=20
> picked up by the run_tests.sh script.

Ah good point.

> > diff --git a/lib/linux/compiler.h b/lib/linux/compiler.h
> > index 6f565e4..c9d205e 100644
> > --- a/lib/linux/compiler.h
> > +++ b/lib/linux/compiler.h
> > @@ -45,7 +45,9 @@
> >  =20
> >   #define barrier()	asm volatile("" : : : "memory")
> >  =20
> > +#ifndef __always_inline
> >   #define __always_inline	inline __attribute__((always_inline))
> > +#endif
>
> What's this change good for? ... it doesn't seem to be related to this pa=
tch?

Some header ordering issue I forgot about, thanks for reminding. I think it
should be split it out. See /usr/include/<arch>/sys/cdefs.h:

/* Forces a function to be always inlined.  */
#if __GNUC_PREREQ (3,2) || __glibc_has_attribute (__always_inline__)
/* The Linux kernel defines __always_inline in stddef.h (283d7573), and
   it conflicts with this definition.  Therefore undefine it first to
   allow either header to be included first.  */
# undef __always_inline
# define __always_inline __inline __attribute__ ((__always_inline__))
#else
# undef __always_inline
# define __always_inline __inline
#endif

> > diff --git a/lib/ppc64/asm/vpa.h b/lib/ppc64/asm/vpa.h
> > new file mode 100644
> > index 0000000..11dde01
> > --- /dev/null
> > +++ b/lib/ppc64/asm/vpa.h
> > @@ -0,0 +1,62 @@
> > +#ifndef _ASMPOWERPC_VPA_H_
> > +#define _ASMPOWERPC_VPA_H_
> > +/*
> > + * This work is licensed under the terms of the GNU LGPL, version 2.
> > + */
> > +
> > +#ifndef __ASSEMBLY__
> > +
> > +struct vpa {
> > +	uint32_t	descriptor;
> > +	uint16_t	size;
> > +	uint8_t		reserved1[3];
> > +	uint8_t		status;
>
> Where does this status field come from? ... My LoPAPR only says that ther=
e=20
> are 18 "reserved" bytes in total here.

Hmm, I'm not sure why that was left out of LoPAPR, Linux has been using
it for a long time. It basically just tells you if you are on a
dedicated or shared partition (hard partitioned or timesliced CPUs).
Possibly an oversight.

>
> > +	uint8_t		reserved2[14];
> > +	uint32_t	fru_node_id;
> > +	uint32_t	fru_proc_id;
> > +	uint8_t		reserved3[56];
> > +	uint8_t		vhpn_change_counters[8];
> > +	uint8_t		reserved4[80];
> > +	uint8_t		cede_latency;
> > +	uint8_t		maintain_ebb;
> > +	uint8_t		reserved5[6];
> > +	uint8_t		dtl_enable_mask;
> > +	uint8_t		dedicated_cpu_donate;
> > +	uint8_t		maintain_fpr;
> > +	uint8_t		maintain_pmc;
> > +	uint8_t		reserved6[28];
> > +	uint64_t	idle_estimate_purr;
> > +	uint8_t		reserved7[28];
> > +	uint16_t	maintain_nr_slb;
> > +	uint8_t		idle;
> > +	uint8_t		maintain_vmx;
> > +	uint32_t	vp_dispatch_count;
> > +	uint32_t	vp_dispatch_dispersion;
> > +	uint64_t	vp_fault_count;
> > +	uint64_t	vp_fault_tb;
> > +	uint64_t	purr_exprop_idle;
> > +	uint64_t	spurr_exprop_idle;
> > +	uint64_t	purr_exprop_busy;
> > +	uint64_t	spurr_exprop_busy;
> > +	uint64_t	purr_donate_idle;
> > +	uint64_t	spurr_donate_idle;
> > +	uint64_t	purr_donate_busy;
> > +	uint64_t	spurr_donate_busy;
> > +	uint64_t	vp_wait3_tb;
> > +	uint64_t	vp_wait2_tb;
> > +	uint64_t	vp_wait1_tb;
> > +	uint64_t	purr_exprop_adjunct_busy;
> > +	uint64_t	spurr_exprop_adjunct_busy;
>
> The above two fields are also marked as "reserved" in my LoPAPR ... which=
=20
> version did you use?
>
> > +	uint32_t	supervisor_pagein_count;
> > +	uint8_t		reserved8[4];
> > +	uint64_t	purr_exprop_adjunct_idle;
> > +	uint64_t	spurr_exprop_adjunct_idle;
> > +	uint64_t	adjunct_insns_executed;
>
> dito for the above three lines... I guess my LoPAPR is too old...

Ah, I'm guessing the "adjunct" option isn't relevant to Linux/KVM so it
was probably left out (it's much older than LoPAPR).

Generally LoPAPR is still pretty up to date, but we should do better at
keeping it current IMO. I've made some more noises about that, but
can't make any promises here.

> > +	uint8_t		reserved9[120];
> > +	uint64_t	dtl_index;
> > +	uint8_t		reserved10[96];
> > +};
> > +
> > +#endif /* __ASSEMBLY__ */
> > +
> > +#endif /* _ASMPOWERPC_VPA_H_ */
> > diff --git a/powerpc/Makefile.ppc64 b/powerpc/Makefile.ppc64
> > index ea68447..b0ed2b1 100644
> > --- a/powerpc/Makefile.ppc64
> > +++ b/powerpc/Makefile.ppc64
> > @@ -19,7 +19,7 @@ reloc.o  =3D $(TEST_DIR)/reloc64.o
> >   OBJDIRS +=3D lib/ppc64
> >  =20
> >   # ppc64 specific tests
> > -tests =3D
> > +tests =3D $(TEST_DIR)/spapr_vpa.elf
> >  =20
> >   include $(SRCDIR)/$(TEST_DIR)/Makefile.common
> >  =20
> > diff --git a/powerpc/spapr_vpa.c b/powerpc/spapr_vpa.c
> > new file mode 100644
> > index 0000000..45688fe
> > --- /dev/null
> > +++ b/powerpc/spapr_vpa.c
> > @@ -0,0 +1,90 @@
> > +/*
> > + * Test sPAPR hypervisor calls (aka. h-calls)
>
> Adjust to "Test sPAPR H_REGISTER_VPA hypervisor call" ?

Yes.

> > +	rc =3D hcall(H_REGISTER_VPA, 5ULL << 45, cpuid, vpa);
> > +	report(rc =3D=3D H_SUCCESS, "VPA deregistered");
> > +
> > +	disp_count1 =3D be32_to_cpu(vpa->vp_dispatch_count);
> > +	report(disp_count1 % 2 =3D=3D 1, "Dispatch count is odd after deregis=
ter");
> > +}
>
> Now that was a very tame amount of tests ;-)

Yeah it was just a start. I was going to add a few more scheduling
type ones if I can improve SMP support as well.

> I'd suggest to add some more:
>
> - Check hcall(H_REGISTER_VPA, 0, ...);
> - Check hcall(H_REGISTER_VPA, ..., bad-cpu-id, ...)
> - Check hcall(H_REGISTER_VPA, ..., ..., unaligned-address)
> - Check hcall(H_REGISTER_VPA, ..., ..., illegal-address)
> - Check registration with vpa->size being too small
> - Check registration where the vpa crosses the 4k boundary
>
> What do you think?

Good idea.

> > +int main(int argc, char **argv)
> > +{
> > +	struct vpa *vpa;
> > +
> > +	vpa =3D memalign(4096, sizeof(*vpa));
> > +
> > +	memset(vpa, 0, sizeof(*vpa));
> > +
> > +	vpa->size =3D cpu_to_be16(sizeof(*vpa));
> > +
> > +	report_prefix_push("vpa");
>
> This lacks the corresponding report_prefix_pop() later.

Got it.

Thanks,
Nick
