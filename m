Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F45C9E670
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 13:07:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HmL42ghtzDqqJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 21:07:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=socionext.com
 (client-ip=210.131.2.91; helo=conssluserg-06.nifty.com;
 envelope-from=yamada.masahiro@socionext.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.b="Smo7xVDM"; 
 dkim-atps=neutral
Received: from conssluserg-06.nifty.com (conssluserg-06.nifty.com
 [210.131.2.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HmJF3yjxzDqlf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 21:05:48 +1000 (AEST)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com
 [209.85.221.173]) (authenticated)
 by conssluserg-06.nifty.com with ESMTP id x7RB5Jpb018051
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 20:05:20 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com x7RB5Jpb018051
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1566903920;
 bh=dWxuqD4YJcRMD9twhfib+BopSFdJKxF8FxvMFpBbUHc=;
 h=From:Date:Subject:To:Cc:From;
 b=Smo7xVDM1saSAc9FhwvktzLiJpBycJ+sjNW1E5H88MtL6GaRaUW3b2mZzyz9yNp3o
 ON5wteDwVWexvg3jkSIdjcjt7KXVoqLeu07mCJrbhZbQ/Fapo2w1P7OsGinbQvBLrM
 FcY/alQrWHC8V9s7qhZr+WEohEuzyjCHNJSw8vcNgmWK8H4xgoJvdF+kYX6hzcrZEI
 PftcTuJqmgMqiFKTy+8du0t/VFew1CMrHkrv3Or9jXK308QkD6AFTMmK72RAIru1Z+
 BVhRtlDlChWkOSWsiR1Am0tK7rWlw6rF0zLbiQ962A5IRUxsiHooYuBqGzwQ1C7jIM
 annZ+aZsorbvw==
X-Nifty-SrcIP: [209.85.221.173]
Received: by mail-vk1-f173.google.com with SMTP id p5so2708889vkm.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 04:05:19 -0700 (PDT)
X-Gm-Message-State: APjAAAWPBtK6IusFTeWxmCyWxPll9JlZz21YekOK1bnm3z2yXUU1UpEc
 IHcZ6bPiGim3Uy9y0lFUREOGpbAOLYf+2NkqrXY=
X-Google-Smtp-Source: APXvYqyledIhqfWe+gAo4mMvwSREWvj02FyonTP3pC7GC3fqLFZMC32WbLnqBuyPj2Xf3LXKNxpFogQPsn8yCWi5NfU=
X-Received: by 2002:a1f:7c0e:: with SMTP id x14mr10777661vkc.0.1566903918828; 
 Tue, 27 Aug 2019 04:05:18 -0700 (PDT)
MIME-Version: 1.0
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 27 Aug 2019 20:04:43 +0900
X-Gmail-Original-Message-ID: <CAK7LNATg7O0ZQQ4fe2maNqf0ascHU8b2Mfnqkrxzpzj8D_X7pQ@mail.gmail.com>
Message-ID: <CAK7LNATg7O0ZQQ4fe2maNqf0ascHU8b2Mfnqkrxzpzj8D_X7pQ@mail.gmail.com>
Subject: powerpc asm-prototypes.h seems odd
To: Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi.

Lots of powerpc files include <asm/asm-prototypes.h>,
and powerpc is the only architecture that does this.

<asm/asm-prototypes.h> exists to support modversion for asm.
So, it is supposed to be parsed by genksysms, not to be
included from other files.  Right?


$  git grep  asm/asm-prototypes.h
arch/arm64/include/asm/asm-prototypes.h: * ... kbuild will
automatically pick these up from <asm/asm-prototypes.h> and
arch/powerpc/kernel/early_32.c:#include <asm/asm-prototypes.h>
arch/powerpc/kernel/irq.c:#include <asm/asm-prototypes.h>
arch/powerpc/kernel/machine_kexec_64.c:#include <asm/asm-prototypes.h>
arch/powerpc/kernel/process.c:#include <asm/asm-prototypes.h>
arch/powerpc/kernel/prom_init.c:#include <asm/asm-prototypes.h>
arch/powerpc/kernel/ptrace.c:#include <asm/asm-prototypes.h>
arch/powerpc/kernel/security.c:#include <asm/asm-prototypes.h>
arch/powerpc/kernel/setup_32.c:#include <asm/asm-prototypes.h>
arch/powerpc/kernel/signal_32.c:#include <asm/asm-prototypes.h>
arch/powerpc/kernel/signal_64.c:#include <asm/asm-prototypes.h>
arch/powerpc/kernel/smp.c:#include <asm/asm-prototypes.h>
arch/powerpc/kernel/syscalls.c:#include <asm/asm-prototypes.h>
arch/powerpc/kernel/tau_6xx.c:#include <asm/asm-prototypes.h>
arch/powerpc/kernel/time.c:#include <asm/asm-prototypes.h>
arch/powerpc/kernel/trace/ftrace.c:#include <asm/asm-prototypes.h>
arch/powerpc/kernel/traps.c:#include <asm/asm-prototypes.h>
arch/powerpc/kvm/book3s_emulate.c:#include <asm/asm-prototypes.h>
arch/powerpc/kvm/book3s_hv.c:#include <asm/asm-prototypes.h>
arch/powerpc/kvm/book3s_hv_builtin.c:#include <asm/asm-prototypes.h>
arch/powerpc/kvm/book3s_hv_rm_xive.c:#include <asm/asm-prototypes.h>
arch/powerpc/kvm/book3s_pr.c:#include <asm/asm-prototypes.h>
arch/powerpc/lib/vmx-helper.c:#include <asm/asm-prototypes.h>
arch/powerpc/mm/book3s64/hash_utils.c:#include <asm/asm-prototypes.h>
arch/powerpc/mm/book3s64/slb.c:#include <asm/asm-prototypes.h>
arch/powerpc/platforms/powernv/idle.c:#include <asm/asm-prototypes.h>
arch/powerpc/platforms/powernv/opal-call.c:#include <asm/asm-prototypes.h>
arch/powerpc/platforms/powernv/opal-tracepoints.c:#include
<asm/asm-prototypes.h>
arch/powerpc/platforms/pseries/lpar.c:#include <asm/asm-prototypes.h>
scripts/Makefile.build:# .S file exports must have their C prototypes
defined in asm/asm-prototypes.h
scripts/Makefile.build:     echo "\#include <asm/asm-prototypes.h>" ;
                            \
scripts/Makefile.build:ASM_PROTOTYPES := $(wildcard
$(srctree)/arch/$(SRCARCH)/include/asm/asm-prototypes.h)



-- 
Best Regards
Masahiro Yamada
