Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 033156602E5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Jan 2023 16:18:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NpRn56Trqz3cdH
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Jan 2023 02:18:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.43; helo=mail-qv1-f43.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NpRmY18HVz2xH6
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Jan 2023 02:18:04 +1100 (AEDT)
Received: by mail-qv1-f43.google.com with SMTP id d13so1149824qvj.8
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Jan 2023 07:18:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Alz05ZcNgoaQdFl2lti3Hdp2W/onZPDBRRL7a7nm+Vw=;
        b=GCz2CQZqhbZ0PBv+WSZiiPrRAP13Ygid222Wa7ZOo45rgxpDzCgZhUdAM3oEnoLaoN
         Eu8/GsSCPffSUNL2l5Z9+KzjuN8nttHhTJU4O9AcusrdOPjrb9m3PQw6rCHAQQ9t5CL7
         bMv2Z33uK6tMjPugHZNjZhF0/pN+fYjKBKUS/kPfevUL5OHbwSC7gk8Js9OyKRlbs4of
         S0RH1TwqiRnHrb5Gse/t/7SDE5BqOiaexsrqdcXSnkS9i91zk8tzpTcijaW6E55nrG1C
         kRGS9j4L2bFH5WmZbUyrk1zJflir3y6DMFvkcLTN/SHCQ6lN5C7XZR3IMd9/WTz02FeF
         3GOg==
X-Gm-Message-State: AFqh2krWriK8pj8S5ypoKcBsLPENGhTuVxAED4mKmsHPZOhbir4DN5kB
	RPscgaBRvUZ/hrtfSTFNCpUoQ6R+xsJuXw==
X-Google-Smtp-Source: AMrXdXv66fcxplHtQNdmpFPbwkgdKSODEMdA4f4kaoQeVr7yC6N9/37/2gJbH/xSQ2+rPAJdI4hqhQ==
X-Received: by 2002:ad4:4b6f:0:b0:4c6:eb92:c97b with SMTP id m15-20020ad44b6f000000b004c6eb92c97bmr79695770qvx.50.1673018280123;
        Fri, 06 Jan 2023 07:18:00 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id r18-20020a05620a299200b006cebda00630sm654456qkp.60.2023.01.06.07.17.59
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jan 2023 07:17:59 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id 186so2154167ybe.8
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Jan 2023 07:17:59 -0800 (PST)
X-Received: by 2002:a25:d84e:0:b0:7b4:6a33:d89f with SMTP id
 p75-20020a25d84e000000b007b46a33d89fmr557375ybg.543.1673018279290; Fri, 06
 Jan 2023 07:17:59 -0800 (PST)
MIME-Version: 1.0
References: <CAHk-=wgf929uGOVpiWALPyC7pv_9KbwB2EAvQ3C4woshZZ5zqQ@mail.gmail.com>
 <20221227082932.798359-1-geert@linux-m68k.org> <alpine.DEB.2.22.394.2212270933530.311423@ramsan.of.borg>
 <c05bee5d-0d69-289b-fe4b-98f4cd31a4f5@physik.fu-berlin.de>
In-Reply-To: <c05bee5d-0d69-289b-fe4b-98f4cd31a4f5@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Jan 2023 16:17:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXNJveXHeS=g-aHbnxtyACxq1wCeaTg8LbpYqJTCqk86g@mail.gmail.com>
Message-ID: <CAMuHMdXNJveXHeS=g-aHbnxtyACxq1wCeaTg8LbpYqJTCqk86g@mail.gmail.com>
Subject: Re: Build regressions/improvements in v6.2-rc1
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
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
Cc: linux-xtensa@linux-xtensa.org, linux-sh@vger.kernel.org, linux-wireless@vger.kernel.org, linux-mips@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-f2fs-devel@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi John,

On Fri, Jan 6, 2023 at 4:10 PM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On 12/27/22 09:35, Geert Uytterhoeven wrote:
> >    + /kisskb/src/include/linux/compiler_types.h: error: call to '__comp=
iletime_assert_262' declared with attribute error: Unsupported access size =
for {READ,WRITE}_ONCE().:  =3D> 358:45
> >    + /kisskb/src/include/linux/compiler_types.h: error: call to '__comp=
iletime_assert_263' declared with attribute error: Unsupported access size =
for {READ,WRITE}_ONCE().:  =3D> 358:45
> >
> > In function 'follow_pmd_mask',
> >      inlined from 'follow_pud_mask' at /kisskb/src/mm/gup.c:735:9,
> >      inlined from 'follow_p4d_mask' at /kisskb/src/mm/gup.c:752:9,
> >      inlined from 'follow_page_mask' at /kisskb/src/mm/gup.c:809:9:
> >
> > sh4-gcc11/sh-defconfig (G=C3=BCnter wondered if pmd_t should use union)
>
> I'm seeing this, too. Also for sh7785lcr_defconfig.
>
> > sh4-gcc11/sh-allmodconfig (ICE =3D internal compiler error)
>
> I'm not seeing this one, but I am getting this one instead:
>
> In file included from ./arch/sh/include/asm/hw_irq.h:6,
>                   from ./include/linux/irq.h:596,
>                   from ./include/asm-generic/hardirq.h:17,
>                   from ./arch/sh/include/asm/hardirq.h:9,
>                   from ./include/linux/hardirq.h:11,
>                   from ./include/linux/interrupt.h:11,
>                   from ./include/linux/serial_core.h:13,
>                   from ./include/linux/serial_sci.h:6,
>                   from arch/sh/kernel/cpu/sh2/setup-sh7619.c:11:
> ./include/linux/sh_intc.h:100:63: error: division 'sizeof (void *) / size=
of (void)' does not compute the number of array elements [-Werror=3Dsizeof-=
pointer-div]
>    100 | #define _INTC_ARRAY(a) a, __same_type(a, NULL) ? 0 : sizeof(a)/s=
izeof(*a)
>        |                                                               ^
> ./include/linux/sh_intc.h:105:31: note: in expansion of macro '_INTC_ARRA=
Y'
>    105 |         _INTC_ARRAY(vectors), _INTC_ARRAY(groups),      \
>        |                               ^~~~~~~~~~~

The easiest fix for the latter is to disable CONFIG_WERROR.
Unfortunately I don't know a simple solution to get rid of the warning.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
