Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 664826CB780
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 08:52:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pm0jP1Rtgz3fTG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 17:52:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=oSZZtGpM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=oSZZtGpM;
	dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pm0hW3blkz2xvF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 17:51:23 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id o2so10745660plg.4
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 23:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679986281;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e2yHBbAIi7bcby1sefCfDlu2u5pHNGNV5tcG5xb4NlM=;
        b=oSZZtGpMpgh7MSFzxDYvj1cMTqHZz3wblyj/cUVcTXKkeDu3q9xmmiazFvXbwHCm65
         4x80KEkD4c1jXiVeWtJ9U83Eb/80LaVs6A5qtgZ2vbFXQYeFFLYnuMFW0oN2BS2shenA
         QA45+4D8MXi6V6S3MU0dKZ31+GhYZmhmVEWCN51c22CYRqPgk2V2+/i0qqLnc6f7dYS9
         UzceE/72hEezOylkaGAkDLZE78OpN8kglP4/cv8Wn/Z383WubkmJk1z5bPJUni10FEZH
         AsE2sJj714uSODP9N4d/6OIuD91Vdzh7TnopOSU70zmBokChf8muPATWWp9C6eqlVdNG
         jNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679986281;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e2yHBbAIi7bcby1sefCfDlu2u5pHNGNV5tcG5xb4NlM=;
        b=th4W14/QwoF86wfO3eIWpccFg1c7UGLhoJuBjGUJdEub/W1d6uDzZKLLTH1Ex4Kg3d
         d+gDAGMZfSYmHIbChZVacjrVJuuj0R1WDWFjMUV54c7vtKHKbk5b/Y8ricFGsWczeejy
         2QKWalmUrqsz5ONGbCwK1b0QtUX3pBJoS1Q1/r9WRNSEDmVYo52pptjm18voIXWhkv2A
         8fs5ywet/cxDIpzPmsU9DE6/mS0Cx9Wh8WU9+qIlS2jwRGD1O+JMvS2bkHa9IicH8umN
         fKJ8fM73JsLYpm/nZb2LRW1MCQSlzsyFWOb/6zAhoPU2XmKmx+NA2TsbFKp1/ZjO3TIB
         vOaQ==
X-Gm-Message-State: AAQBX9eyU4hJ59SbCVR3t+ZaI5SH+uKqBCyawwFCnJvpuXbMTO0wtLXA
	0u0YmVxbacbLBBz3wX+jQy4=
X-Google-Smtp-Source: AKy350aZe3xgN6/nHSODLzlHUxImVR0xmTpAWJSqhng2/nWTNhGETrT/lHt8JZid+Ab7OcMiSoyrYg==
X-Received: by 2002:a17:902:c40a:b0:1a1:cd69:d2f4 with SMTP id k10-20020a170902c40a00b001a1cd69d2f4mr18263577plk.67.1679986281313;
        Mon, 27 Mar 2023 23:51:21 -0700 (PDT)
Received: from localhost (118-211-28-230.tpgi.com.au. [118.211.28.230])
        by smtp.gmail.com with ESMTPSA id h24-20020a63df58000000b0050f85ef50d1sm14349635pgj.26.2023.03.27.23.51.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 23:51:20 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Mar 2023 16:51:17 +1000
Message-Id: <CRHTFLEGR6RH.3NTYMVN9N1WBZ@bobo>
Subject: Re: [PATCH 2/2] powerpc/64: Rename entry_64.S to prom_entry.S
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>
X-Mailer: aerc 0.13.0
References: <20230325130651.2457266-1-npiggin@gmail.com>
 <20230325130651.2457266-2-npiggin@gmail.com>
 <ffded830-6081-5e8a-b51d-fd1882e9b8a8@csgroup.eu>
In-Reply-To: <ffded830-6081-5e8a-b51d-fd1882e9b8a8@csgroup.eu>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Mar 28, 2023 at 3:48 AM AEST, Christophe Leroy wrote:
>
>
> Le 25/03/2023 =C3=A0 14:06, Nicholas Piggin a =C3=A9crit=C2=A0:
> > This file contains only the enter_prom implementation now.
> > Trim includes and update header comment while we're here.
> >=20
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >   arch/powerpc/kernel/Makefile                  |  8 +++--
> >   .../kernel/{entry_64.S =3D> prom_entry.S}       | 30 ++--------------=
---
> >   scripts/head-object-list.txt                  |  2 +-
> >   3 files changed, 9 insertions(+), 31 deletions(-)
> >   rename arch/powerpc/kernel/{entry_64.S =3D> prom_entry.S} (73%)
> >=20
> > diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefil=
e
> > index ec70a1748506..ebba0896998a 100644
> > --- a/arch/powerpc/kernel/Makefile
> > +++ b/arch/powerpc/kernel/Makefile
> > @@ -209,10 +209,12 @@ CFLAGS_paca.o			+=3D -fno-stack-protector
> >  =20
> >   obj-$(CONFIG_PPC_FPU)		+=3D fpu.o
> >   obj-$(CONFIG_ALTIVEC)		+=3D vector.o
> > -obj-$(CONFIG_PPC64)		+=3D entry_64.o
> > -obj-$(CONFIG_PPC_OF_BOOT_TRAMPOLINE)	+=3D prom_init.o
> >  =20
> > -extra-$(CONFIG_PPC_OF_BOOT_TRAMPOLINE)	+=3D prom_init_check
> > +ifdef CONFIG_PPC_OF_BOOT_TRAMPOLINE
>
> You don't need that ifdef construct, you can do:
>
> obj64-$(CONFIG_PPC_OF_BOOT_TRAMPOLINE) +=3D prom_entry.o

Nice. So that could have been obj64-y from the start?

Thanks,
Nick

>
> > +obj-y				+=3D prom_init.o
> > +obj-$(CONFIG_PPC64)		+=3D prom_entry.o
> > +extra-y				+=3D prom_init_check
> > +endif
> >  =20
> >   quiet_cmd_prom_init_check =3D PROMCHK $@
> >         cmd_prom_init_check =3D $(CONFIG_SHELL) $< "$(NM)" $(obj)/prom_=
init.o; touch $@
>
>
> Christophe

