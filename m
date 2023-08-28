Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 104E078A99E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Aug 2023 12:09:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RZ5rD063Hz3c39
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Aug 2023 20:09:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.173; helo=mail-oi1-f173.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RZ1Hh5gYjz2yDD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Aug 2023 16:44:15 +1000 (AEST)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3a8036d805eso2265061b6e.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Aug 2023 23:44:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693205053; x=1693809853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ZAs6BPn0UEnVbrYLaaDeF3O9l7Iturm7FWJFQ5jda0=;
        b=XyGE/Sn3SYhNneXiMkXk1pWYsiZeiwvEPHWC7n8/unbXdGchWnrwIcVOOhMO7pLQGL
         WxnWHmY9WSivTpTeHNErWaFKDMwlp31H1jbVJnRz2xDeZdAh9irJAct9TKYk6WNhCmCO
         9UQ+sLZdj+nAQd9lK1bh4DIAD01sRH4CnYXP34XZDu7tsC3f4ni54o10dpyYGp9F1+xg
         NDFCH/120TSJl+7CUPmAeKmwwdT41dZqsQ2E2V5K8eP1/rLCny21UycDMo+69RISUUZ9
         bwoz+EhJ7vtkTLRo7S8HnsGNNeiM9c1Az0Acbss71ns+XsAXh2C2gG9z2YW4k4dj9qRL
         zS5w==
X-Gm-Message-State: AOJu0YwbgVblOj1lAbBdeADKe/v2aCNtysOqBhmG/TB34GR561wZwvYU
	GSC7p4xmpgiR6Anvy6kqQPnFg7hXVS/MCA==
X-Google-Smtp-Source: AGHT+IFAVTZXs9Qq9oF5em10LUC5Ya/7NQgUxn0YnOVPSsxDHsQ5cf+fY267NBQJT0xTU5OambLuNA==
X-Received: by 2002:aca:f08:0:b0:3a4:316c:8eeb with SMTP id 8-20020aca0f08000000b003a4316c8eebmr9578236oip.40.1693205052699;
        Sun, 27 Aug 2023 23:44:12 -0700 (PDT)
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com. [2607:f8b0:4864:20::232])
        by smtp.gmail.com with ESMTPSA id e9-20020aca2309000000b003a724566afdsm3092681oie.20.2023.08.27.23.44.12
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Aug 2023 23:44:12 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3a7f4f7a8easo1563198b6e.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Aug 2023 23:44:12 -0700 (PDT)
X-Received: by 2002:a25:8502:0:b0:d7a:e348:1e47 with SMTP id
 w2-20020a258502000000b00d7ae3481e47mr3956815ybk.36.1693204971245; Sun, 27 Aug
 2023 23:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230810141947.1236730-1-arnd@kernel.org> <169292577153.789945.11297239773543112051.b4-ty@oracle.com>
 <3956e2a4-c545-1212-e95f-3cf61a60d6a4@gmail.com> <CAMuHMdWC2S330_Vb_NTHTDC=BakBsw4ouP-eFJv0erV1-jmvTQ@mail.gmail.com>
 <130b3b57-edb0-184d-5b5f-69b013715773@gmail.com>
In-Reply-To: <130b3b57-edb0-184d-5b5f-69b013715773@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Aug 2023 08:42:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUkZmkBSksvaGcDCKz2tsgkwyWgDa+WwCJm2UxFMCj1jw@mail.gmail.com>
Message-ID: <CAMuHMdUkZmkBSksvaGcDCKz2tsgkwyWgDa+WwCJm2UxFMCj1jw@mail.gmail.com>
Subject: Re: (subset) [PATCH 00/17] -Wmissing-prototype warning fixes
To: Michael Schmitz <schmitzmic@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 28 Aug 2023 20:08:51 +1000
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
Cc: x86@kernel.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-block@vger.kernel.org, linux-mips@vger.kernel.org, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, Jonas Bonn <jonas@southpole.se>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-snps-arc@lists.infradead.org, linux-scsi@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-next@vger.kernel.org, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, Guenter Roeck <linux@roeck-us.net>, linux-trace-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Brian Cain <bcain@quicinc.com>
 , Heiko Carstens <hca@linux.ibm.com>, linux-alpha@vger.kernel.org, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Nathan Chancellor <nathan@kernel.org>, linux-m68k@lists.linux-m68k.org, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Bjorn Helgaas <bhelgaas@google.com>, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>, Arnd Bergmann <arnd@kernel.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-openrisc@vger.kernel.org, linux-pci@vger.kernel.org, linux-s390@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, Andrew Morton <ak
 pm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Aug 26, 2023 at 12:44=E2=80=AFAM Michael Schmitz <schmitzmic@gmail.=
com> wrote:
> (Incidentally - did you ever publish the m68k full history tree anywhere
> in git?)

You mean the gitified version of the Linux/m68k CVS tree Ralf created
for me because my machine wasn't powerful enough?
No, and I should look into doing that...

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
