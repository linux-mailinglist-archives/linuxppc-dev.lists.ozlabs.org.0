Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BDE77EDCD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 01:25:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dabbelt-com.20221208.gappssmtp.com header.i=@dabbelt-com.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=dZxL0Ptm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RR44w41y7z3c1t
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Aug 2023 09:25:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=dabbelt-com.20221208.gappssmtp.com header.i=@dabbelt-com.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=dZxL0Ptm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=palmer@dabbelt.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RQrNt2H5lz2xpm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Aug 2023 00:38:52 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-269304c135aso4718790a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Aug 2023 07:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1692196728; x=1692801528;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z7kyCuHl1t/gCCGpNTbA3hwFj/lf6SuaKvtbsxGuDBs=;
        b=dZxL0Ptmo/RfqSZAnaNdMqEON3wvqTtz9rCCZbGwRlxrXd7njXeZ9MC0HoDMQnzbMm
         Mbp7gkbEr8As7DndYa19Nv36eYd2hToSSCFzF826MiTxJFQPanB3TDkisU5ug1n2xO0x
         lqvfBU8gjYGcjvzm7z1KhnYi76zAKQMvLjSkKN8VKcgO7yrfcLxnnczFGmL7s8fYvGKe
         iupXY/7su7eB4Qp8Ot15WegMitq0aXkC7C2B4amBqtpQq9iCTqbSvz7oVYvokSqAF4SL
         qE7Cmnt2iThlim9z5xca3mEZ27llu2nfrUpa7hwX8WY7UkN0OSfjH/LjoRTW/fMpY9+M
         GNdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692196728; x=1692801528;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z7kyCuHl1t/gCCGpNTbA3hwFj/lf6SuaKvtbsxGuDBs=;
        b=EGKUyZkpEC56pbvUKfvd8tYOqe+9vVBp2w8rDEgBJtTtlpvym4A7QWnF7hRulcPhbA
         rRPEOJ49oxsN8TFErtlRUViQ+yhkHyuAfZnW/HNP9RsKT9WHTOFiNpoMK1Kyo94CXEX+
         sAlHb+5z5RfGP0LThRdBNtwEEWK68Ji76DbSbI7NZTHCMgb6J6B1srQ/M5ZvNcMkSnlY
         wHtf9h7W+wLiPnJuZqRpZpnGB8M/fdzDRo31Uf2w8gCzasjC949NVQPXXqpi6wrgnz70
         H9DNJcm+e73mNNf2vcYPGjpHT77HQ0htIBULZIcv+7P2yR3Zsy+MdVOi/+Ib03BW/t6L
         /8cA==
X-Gm-Message-State: AOJu0YymMWy5xqkgWEz2dPVPGs0t8aoPcxzJp1kAUtrkNwsuVTId5bm5
	XVTr3Fd5yXv81ytnx+MoAdVOWw==
X-Google-Smtp-Source: AGHT+IG9lm23RRLom/xb7C80klG2aDXB0ZwUgcZV4fsV/hyXYHdBd19S4I3YH9SwHqrCXPj4TdemSQ==
X-Received: by 2002:a17:90a:f982:b0:26b:4e59:57e7 with SMTP id cq2-20020a17090af98200b0026b4e5957e7mr1730234pjb.43.1692196727793;
        Wed, 16 Aug 2023 07:38:47 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id gi23-20020a17090b111700b0025645ce761dsm13120399pjb.35.2023.08.16.07.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 07:38:47 -0700 (PDT)
Date: Wed, 16 Aug 2023 07:38:47 -0700 (PDT)
X-Google-Original-Date: Wed, 16 Aug 2023 07:38:45 PDT (-0700)
Subject: Re: [PATCH 00/17] -Wmissing-prototype warning fixes
In-Reply-To: <20230810141947.1236730-1-arnd@kernel.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: arnd@kernel.org
Message-ID: <mhng-ce493a2d-71e9-440f-84d0-522a4f694bbe@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 17 Aug 2023 09:24:54 +1000
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
Cc: x86@kernel.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linux-block@vger.kernel.org, linux-mips@vger.kernel.org, James.Bottomley@HansenPartnership.com, jcmvbkbc@gmail.com, guoren@kernel.org, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, kernel@xen0n.name, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, jonas@southpole.se, Stephen Rothwell <sfr@canb.auug.org.au>, linux-snps-arc@lists.infradead.org, linux-scsi@vger.kernel.org, deller@gmx.de, chenhuacai@kernel.org, linux@armlinux.org.uk, linux-next@vger.kernel.org, geert@linux-m68k.org, vgupta@kernel.org, mattst88@gmail.com, masahiroy@kernel.org, linux@roeck-us.net, linux-trace-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, hca@linux.ibm.com, linux-alpha@vger.kernel.org, stefan.kristiansson@saunalahti.fi, nathan@kernel.org, linux-m68k@lists.linux-m68k.org, bp@alien8.de, loongarch@lists
 .linux.dev, glaubitz@physik.fu-berlin.de, bhelgaas@google.com, shorne@gmail.com, linux-arm-kernel@lists.infradead.org, axboe@kernel.dk, bcain@quicinc.com, monstr@monstr.eu, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, martin.petersen@oracle.com, linux-openrisc@vger.kernel.org, linux-pci@vger.kernel.org, ndesaulniers@google.com, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, dinguyen@kernel.org, richard@nod.at, linux-mtd@lists.infradead.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, sudipm.mukherjee@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 10 Aug 2023 07:19:18 PDT (-0700), arnd@kernel.org wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Most of the patches I sent so far for the -Wmissing-prototype warnings
> have made it into linux-next now. There are a few that I'm resending
> now as nobody has picked them up, and then a number of fixes that I
> found while test-building across all architectures rather than just the
> ones I usually test.
>
> The first 15 patches in this series should be uncontroversial, so
> I expect that either a subsystem maintainer or Andrew Morton can
> apply these directly.
>
> For the last two patches, these might still need some debate about how
> to handle them. I added a Kconfig option to turn off most of the missing
> prototype warnings in the architectures that nobody has fixed yet,
> see patch 16 for those. The last patch does cause some known warnings
> and likely unknown ones for architectures other than x86 and arm,
> so applying it now will bring new problems, but not applying it also
> means that new warnings creep in, so I think this is mainly a question
> of what the best timing is for having this in linux-next.
>
> Arnd Bergmann (17):
>   [RESEND] jffs2: mark __jffs2_dbg_superblock_counts() static
>   [RESEND] irq_work: consolidate arch_irq_work_raise prototypes
>   [RESEND] ida: make 'ida_dump' static
>   pci: sysfs: move declarations to linux/pci.h
>   swim3: mark swim3_init() static
>   macintosh/ams: mark ams_init() static
>   scsi: qlogicpti: mark qlogicpti_info() static
>   microblaze: mark flush_dcache_folio() inline
>   parport: gsc: mark init function static
>   zorro: include zorro.h in names.c
>   scsi: gvp11: remove unused gvp11_setup() function
>   time: make sysfs_get_uname() function visible in header
>   stackleak: add declarations for global functions
>   kprobes: unify kprobes_exceptions_nofify() prototypes
>   arch: fix asm-offsets.c building with -Wmissing-prototypes
>   [RFC] arch: turn -Wmissing-prototypes off conditionally
>   [RFC] Makefile.extrawarn: turn on missing-prototypes again
>
>  arch/alpha/Kbuild                        |  2 ++
>  arch/alpha/include/asm/pci.h             |  3 ---
>  arch/alpha/kernel/asm-offsets.c          |  2 +-
>  arch/alpha/lib/Makefile                  |  1 +
>  arch/arc/Kbuild                          |  2 ++
>  arch/arc/include/asm/kprobes.h           |  3 ---
>  arch/arm/include/asm/irq_work.h          |  2 --
>  arch/arm/include/asm/kprobes.h           |  2 --
>  arch/arm64/include/asm/irq_work.h        |  2 --
>  arch/arm64/include/asm/kprobes.h         |  2 --
>  arch/csky/Kbuild                         |  2 ++
>  arch/csky/include/asm/irq_work.h         |  2 +-
>  arch/hexagon/Kbuild                      |  2 ++
>  arch/ia64/Kbuild                         |  2 ++
>  arch/ia64/include/asm/kprobes.h          |  2 --
>  arch/ia64/kernel/asm-offsets.c           |  2 +-
>  arch/ia64/lib/Makefile                   |  1 +
>  arch/loongarch/Kbuild                    |  2 ++
>  arch/loongarch/kernel/asm-offsets.c      | 12 ++++++++++++
>  arch/m68k/Kbuild                         |  2 ++
>  arch/m68k/lib/Makefile                   |  1 +
>  arch/microblaze/Kbuild                   |  2 ++
>  arch/microblaze/include/asm/cacheflush.h |  2 +-
>  arch/mips/Kbuild                         |  2 ++
>  arch/mips/boot/compressed/Makefile       |  3 ++-
>  arch/mips/include/asm/kprobes.h          |  2 --
>  arch/nios2/Kbuild                        |  2 ++
>  arch/nios2/lib/Makefile                  |  1 +
>  arch/openrisc/Kbuild                     |  2 ++
>  arch/parisc/Kbuild                       |  2 ++
>  arch/parisc/lib/Makefile                 |  1 +
>  arch/powerpc/include/asm/irq_work.h      |  1 -
>  arch/powerpc/include/asm/kprobes.h       |  2 --
>  arch/riscv/include/asm/irq_work.h        |  2 +-
>  arch/s390/include/asm/irq_work.h         |  2 --
>  arch/s390/include/asm/kprobes.h          |  2 --
>  arch/sh/Kbuild                           |  2 ++
>  arch/sh/boot/compressed/Makefile         |  1 +
>  arch/sh/include/asm/kprobes.h            |  2 --
>  arch/sparc/Kbuild                        |  2 ++
>  arch/sparc/include/asm/kprobes.h         |  2 --
>  arch/sparc/kernel/asm-offsets.c          | 13 ++-----------
>  arch/sparc/lib/Makefile                  |  1 +
>  arch/sparc/prom/Makefile                 |  1 +
>  arch/x86/include/asm/irq_work.h          |  1 -
>  arch/x86/include/asm/kprobes.h           |  2 --
>  arch/xtensa/Kbuild                       |  2 ++
>  arch/xtensa/boot/lib/Makefile            |  2 ++
>  drivers/block/swim3.c                    |  2 +-
>  drivers/macintosh/ams/ams-core.c         |  2 +-
>  drivers/parport/parport_gsc.c            |  2 +-
>  drivers/scsi/gvp11.c                     |  5 -----
>  drivers/scsi/qlogicpti.c                 |  2 +-
>  drivers/zorro/names.c                    |  1 +
>  fs/jffs2/debug.c                         |  2 +-
>  include/linux/irq_work.h                 |  3 +++
>  include/linux/kprobes.h                  |  4 ++++
>  include/linux/pci.h                      |  5 +++++
>  include/linux/stackleak.h                |  6 ++++++
>  init/Kconfig                             | 10 ++++++++++
>  kernel/time/tick-internal.h              |  3 ++-
>  lib/test_ida.c                           |  2 +-
>  scripts/Makefile.extrawarn               |  5 +++--
>  63 files changed, 101 insertions(+), 63 deletions(-)

Acked-by: Palmer Dabbelt <palmer@rivosinc.com> # RISC-V
