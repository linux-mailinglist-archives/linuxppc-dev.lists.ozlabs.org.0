Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE32C788181
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 10:03:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXCBg2jbBz3cM3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 18:03:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.171; helo=mail-il1-f171.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RXBgV6yrKz308K
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Aug 2023 17:40:05 +1000 (AEST)
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-34cacab5e33so2171275ab.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Aug 2023 00:40:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692949202; x=1693554002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E5r8bhhlGnXrx708tsGw6Ag8gm7AVkEO6BeDk4HD7tk=;
        b=a6KL8WW/1ovDUeQVxxb7LORS8xVpLYKS1XYNDJvo586SUq4tK2c2RMyxzePGamdD5/
         +1nFW9AT365hDpaOsKoj3fB9wk6UdIZlixEacsdaBaek32ai5IPZdcP2BFnbijCpORUZ
         Mn8+HcmGY1wqe9cgNIqiCAR4RuuQxE+P2otfxIHK/Zbm90b7rhiALl/rparjFlmk2A8d
         5jAl9FIhhAvMzhXjqV0vM+ZlMbbtdFPkjA8T1YokFVnHlNGxpt6X7TkaEM7iS4Clo5Sc
         dLGu3JTj1gsN5jSOe8G4qf1p6Q0o7B+sS/R2uOsJAQVxi35C7wXDOeYgZ2DD21Tw42mK
         Zc4A==
X-Gm-Message-State: AOJu0Ywb1Ytv64ZIZbVPLievYx4up1iscxvX+W9ndbR+myfapjpaY0LE
	zUqJSauXugHP7V2DMtH8n/Tp5pF5/LQDMDIk
X-Google-Smtp-Source: AGHT+IHlDWtefBy+KyFemzuSxJOHKaV7QpFUDsfarYvNmrVurCg0XqteFGM7JniFXRxLWXPj49zXuA==
X-Received: by 2002:a05:6e02:1607:b0:34b:ba9a:341 with SMTP id t7-20020a056e02160700b0034bba9a0341mr9894580ilu.32.1692949201580;
        Fri, 25 Aug 2023 00:40:01 -0700 (PDT)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com. [209.85.166.178])
        by smtp.gmail.com with ESMTPSA id gm1-20020a0566382b8100b0042b3e04510asm352720jab.98.2023.08.25.00.40.00
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Aug 2023 00:40:00 -0700 (PDT)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-34bb72ffb1fso2179525ab.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Aug 2023 00:40:00 -0700 (PDT)
X-Received: by 2002:a25:34cd:0:b0:d0b:5b6:4629 with SMTP id
 b196-20020a2534cd000000b00d0b05b64629mr19382891yba.46.1692949180028; Fri, 25
 Aug 2023 00:39:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230810141947.1236730-1-arnd@kernel.org> <169292577153.789945.11297239773543112051.b4-ty@oracle.com>
 <3956e2a4-c545-1212-e95f-3cf61a60d6a4@gmail.com>
In-Reply-To: <3956e2a4-c545-1212-e95f-3cf61a60d6a4@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 25 Aug 2023 09:39:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWC2S330_Vb_NTHTDC=BakBsw4ouP-eFJv0erV1-jmvTQ@mail.gmail.com>
Message-ID: <CAMuHMdWC2S330_Vb_NTHTDC=BakBsw4ouP-eFJv0erV1-jmvTQ@mail.gmail.com>
Subject: Re: (subset) [PATCH 00/17] -Wmissing-prototype warning fixes
To: Michael Schmitz <schmitzmic@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 25 Aug 2023 18:02:24 +1000
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

Hi Michael,

On Fri, Aug 25, 2023 at 3:31=E2=80=AFAM Michael Schmitz <schmitzmic@gmail.c=
om> wrote:
> On 25/08/23 13:12, Martin K. Petersen wrote:
> > [11/17] scsi: gvp11: remove unused gvp11_setup() function
> >          https://git.kernel.org/mkp/scsi/c/bfaa4a0ce1bb
>
> I somehow missed that one ...
>
> The gvp11_setup() function was probably a relic from the times before
> module parameters.
>
> Since gvp11_xfer_mask appears to be required for some Amiga systems to
> set the DMA mask, I'd best send a patch to add such a module parameter ..=
.
>
> Do you know any details around the use of DMA masks for Amiga WD33C93
> drivers, Geert?

Doh, it's been a while, and I never had an affected system.
Probably it's needed on A2000 with an accelerator card and GVP II SCSI,
to prevent DMA to RAM banks that do not support fast DMA cycles.

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
