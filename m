Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6FC30B59F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Feb 2021 04:05:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DV8nS5cS9zDqyZ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Feb 2021 14:05:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oqSZBfla; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DV8lS5DdfzDqM1
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 14:03:30 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id u11so11617607plg.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Feb 2021 19:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XnMUGqo6v78Eh/fRxn0LKxydpRpgQp2lWUKIA3uSBwg=;
 b=oqSZBfla6Syh4Wf97Rza+UzgRlPbCwFuCIhFkhdYt1F/QcFe/DpObhcI4+TKeUPYHz
 ZAehemmixU1PaMcqq1AsEx3aM1CXOYhD/rPMhLUfNWHAE0tPm8X+7NMZdSlogeYMMo6Z
 jCZ7KJSVdEdkbeDSdgTcexONO9WLEhwH3YSpc/J6HwFLFgu+MMJGKyn/J4a72yyFOw71
 GP6lqcGzk5eIiFiN1SXeZ/8DpBVqTroWuvksTb4619IWFKr2zNMvL5AlueGD8PAf1TIL
 yMv0EeNMXSBF9L4zigqvbshEnT9EVTWTSA7hrJH+RJDvXmJ1AHv3t8YLWzTadSHkyaHf
 mmLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XnMUGqo6v78Eh/fRxn0LKxydpRpgQp2lWUKIA3uSBwg=;
 b=ecBlifDubMOTVWUaDlKvQAPAek/aXhJyijTH/9KoM9G3ZbuhuadhnpoAUPWHLTpohF
 l5+acoVb+LNI83bllQEvBzkdCs5LkloAf9cOEwUjSc7QudHL4z/ZtQCBya1WCP9esPox
 Bzl08baG6O5L7auCokPyOufwtMhm+pVkoG0QUsQzMnh0AtjxNi/fed36zaU+1szGLae1
 Ivr60YU68Q+aaCHnbitcbWtYqcNlx4lBxGWWKONTwXRs9I0ZmiFGwONORo/RPOJBKTdA
 Xf+pPhptZN3MERzHNclx5qbzSet0c/VRK84OiBTGyPDCfHHgPcVfi4OfvQtwFYhdZNgl
 a4cA==
X-Gm-Message-State: AOAM5333p50ImdmLOgTppS35wtbr5lTXDyiaLgQbC2r2k1oMUpNJKkJU
 IumFee29tqybN34lc4bp+FI=
X-Google-Smtp-Source: ABdhPJzl/udEkMG/FNjx4O4cAOZRHx0YIFbfy1Nv6jQaHPQzD6AgeqfyexofMeJU7MlrmCjfEx5JQA==
X-Received: by 2002:a17:90a:f2cf:: with SMTP id
 gt15mr1899400pjb.166.1612235005509; 
 Mon, 01 Feb 2021 19:03:25 -0800 (PST)
Received: from bobo.ozlabs.ibm.com
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id a24sm20877337pff.18.2021.02.01.19.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 19:03:25 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [RFC PATCH 0/9] KVM: PPC: Book3S: C-ify the P9 entry/exit code
Date: Tue,  2 Feb 2021 13:03:04 +1000
Message-Id: <20210202030313.3509446-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series goes on top of the KVM patches I sent for the next
merge window. It's pretty rough and incomplete at the moment but
has started booting a simple guest into busybox in sim.

One of the main points of this is to avoid running KVM in a special
mode (aka "realmode") which is hostile to the rest of Linux and can't
be instrumented well by core facilities or generally use core code.

The asm itself is also tricky to follow. It's nothing compared with the
old HV path when you sit down and go through it, but it's not trivial
and sharing code paths makes things painful too.

One issue is what to do about PR-KVM and pre-ISAv3.0 / HPT HV-KVM.

The old path could also be converted similarly to C, although that's a
far bigger job. At least removing the asm code sharing makes a (slight)
simplification to the old path for now.

This change is a pretty clean break in the low level exit/entry code,
and the rest of the code already has many divergences, so I don't think
this exacerbates the problem, but if those PR / old-HV are to be
maintained well then we should eat the cost early to modernise that
code too. If they stay walled off with these interface shims then
they'll just be harder to maintain and the problem will definitely not
get better.

Now, the number of people who understand PR-KVM and have time to
maintain it is roughly zero, and for the old HV path it's approaching
zero. The radix, LPAR-per-thread programming model by comparison is so
nice and simple, maybe its better to just keep the rest on life support
and keep them going for as long as we can with the bare minimum.

Thanks,
Nick

Nicholas Piggin (9):
  KVM: PPC: Book3S 64: move KVM interrupt entry to a common entry point
  KVM: PPC: Book3S 64: Move GUEST_MODE_SKIP test into KVM
  KVM: PPC: Book3S 64: add hcall interrupt handler
  KVM: PPC: Book3S HV: Move hcall early register setup to KVM
  powerpc/64s: Remove EXSLB interrupt save area
  KVM: PPC: Book3S HV: Move interrupt early register setup to KVM
  KVM: PPC: Book3S HV: move bad_host_intr check to HV handler
  KVM: PPC: Book3S HV: Minimise hcall handler calling convention
    differences
  KVM: PPC: Book3S HV: Implement the rest of the P9 entry/exit handling
    in C

 arch/powerpc/include/asm/asm-prototypes.h |   2 +-
 arch/powerpc/include/asm/exception-64s.h  |  13 ++
 arch/powerpc/include/asm/kvm_asm.h        |   3 +-
 arch/powerpc/include/asm/kvm_book3s_64.h  |   2 +
 arch/powerpc/include/asm/kvm_ppc.h        |   2 +
 arch/powerpc/include/asm/paca.h           |   3 +-
 arch/powerpc/kernel/asm-offsets.c         |   1 -
 arch/powerpc/kernel/exceptions-64s.S      | 259 +++-------------------
 arch/powerpc/kvm/Makefile                 |   6 +
 arch/powerpc/kvm/book3s_64_entry.S        | 232 +++++++++++++++++++
 arch/powerpc/kvm/book3s_hv.c              |  21 +-
 arch/powerpc/kvm/book3s_hv_interrupt.c    | 164 ++++++++++++++
 arch/powerpc/kvm/book3s_hv_rmhandlers.S   | 136 ++----------
 arch/powerpc/kvm/book3s_segment.S         |   7 +
 arch/powerpc/kvm/book3s_xive.c            |  32 +++
 15 files changed, 523 insertions(+), 360 deletions(-)
 create mode 100644 arch/powerpc/kvm/book3s_64_entry.S
 create mode 100644 arch/powerpc/kvm/book3s_hv_interrupt.c

-- 
2.23.0

