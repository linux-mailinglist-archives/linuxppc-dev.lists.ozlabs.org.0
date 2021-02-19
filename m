Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A2E31F519
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 07:36:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dhhg56R6jz3cFy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 17:36:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=YhOxqAvJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=YhOxqAvJ; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dhhff2QFPz30N1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Feb 2021 17:35:53 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id z7so2812651plk.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Feb 2021 22:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UymbtmbdqSs8j3UG2YdaaaUw62kh30J7HQRbQZoqk44=;
 b=YhOxqAvJA2J4SAvdzaUv4tDBFzuXDZF1zkP7zX3jz+8qFSCkYd7ZfgZYRdqfe1M2Hy
 lOdZP8Fw1owFl9bFOqKTlz+RHfv427I4CaOvtCYII5THolZQkdb5Np8f4vD0YmgD5Ae1
 Jm9Qz5XMj9FkeJLYWlqnuaV+n6sqRlYr7Rucgv2U8oW5H49n8TbxdrTcPCJHnANGEbkV
 cnwjL5q64FH4YFZO9+GuDnd2/GkdANjld8+8nax98ea4rYAIQb5hq/ZnW9cny1BYRdGw
 INy30LZBprtcvCnsq5mpQK7x+wCxiIt1epiUubRqe9iyMwJh30EnLCyPDhm/KcYx2JVK
 MjuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UymbtmbdqSs8j3UG2YdaaaUw62kh30J7HQRbQZoqk44=;
 b=hBnBOAWvvYCw0GXGAT85N3yn1+K/Vcq2Fux4LQfqM7Cg0afZyA1R/ycUy887siQfKV
 qMQIU3U1QKZHvi9VoELZQL0DVG3Die+2g1pyICcwu9lwugwDG2rZdTG3Nm65NOCX6SHj
 Q5QePgw4dZuQqwSQ28a8MhBe5FbN9twz/IUsD3E7DugfUimM4fB7mY/QPP2mbXfDK+pm
 ZjNC7BbWHdw4b+73omGeQx87XmZAeusFEi698pm7E6PyT+/enZlTKD44kZ2JKuYJyCQK
 S1r/w7kORmQuzOT60R/donGSFmFtmPZCZjE4eIVOim9tkgkDGHeDmPJ8lziIQfF84smm
 y2nw==
X-Gm-Message-State: AOAM531h3gV7a6UTxPZyWcwR15wAg9HTs8li/JLSlZeSxNIROw+/KE3O
 yPuWjFJQeCskCpiy841YI+A=
X-Google-Smtp-Source: ABdhPJyPRF0a10TfMG/EtsZivUGEtkgV3v8OiBgHlDh9o99Xn820XzQu15exvkO9OkfpQkmyHOP2bg==
X-Received: by 2002:a17:902:e5c4:b029:e3:b422:34ef with SMTP id
 u4-20020a170902e5c4b02900e3b42234efmr455796plf.26.1613716549848; 
 Thu, 18 Feb 2021 22:35:49 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (14-201-150-91.tpgi.com.au. [14.201.150.91])
 by smtp.gmail.com with ESMTPSA id v16sm7813099pfu.76.2021.02.18.22.35.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Feb 2021 22:35:49 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH 00/13] KVM: PPC: Book3S: C-ify the P9 entry/exit code
Date: Fri, 19 Feb 2021 16:35:29 +1000
Message-Id: <20210219063542.1425130-1-npiggin@gmail.com>
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

This has a lot more implemented, things tidied up, and more things split
out. It's also implemented on top of powerpc next and kvm next which
have a few prerequisite patches (mainly removing EXSLB).

I've got a bunch more things after this including implementing HPT
guests with radix host in the "new" path -- whether we ever actually
want to do that, or port the legacy path up to C, or just leave it to
maintenance mode, I was just testing the waters there and making sure I
wasn't doing something fundamentally incompatible with hash.

I won't post anything further than this for now because I think it's a
good start and gets the total asm code for KVM entry and exit down to
about 160 lines plus the shim for the legacy paths. So would like to
concentrate on getting this in before juggling things around too much
or adding new things.

Thanks,
Nick

Nicholas Piggin (13):
  powerpc/64s: Remove KVM handler support from CBE_RAS interrupts
  powerpc/64s: remove KVM SKIP test from instruction breakpoint handler
  KVM: PPC: Book3S HV: Ensure MSR[ME] is always set in guest MSR
  KVM: PPC: Book3S 64: remove unused kvmppc_h_protect argument
  KVM: PPC: Book3S 64: move KVM interrupt entry to a common entry point
  KVM: PPC: Book3S 64: Move GUEST_MODE_SKIP test into KVM
  KVM: PPC: Book3S 64: add hcall interrupt handler
  KVM: PPC: Book3S HV: Move hcall early register setup to KVM
  KVM: PPC: Book3S HV: Move interrupt early register setup to KVM
  KVM: PPC: Book3S HV: move bad_host_intr check to HV handler
  KVM: PPC: Book3S HV: Minimise hcall handler calling convention
    differences
  KVM: PPC: Book3S HV: Move radix MMU switching together in the P9 path
  KVM: PPC: Book3S HV: Implement the rest of the P9 entry/exit handling
    in C

 arch/powerpc/include/asm/asm-prototypes.h |   3 +-
 arch/powerpc/include/asm/exception-64s.h  |  13 +
 arch/powerpc/include/asm/kvm_asm.h        |   3 +-
 arch/powerpc/include/asm/kvm_book3s_64.h  |   2 +
 arch/powerpc/include/asm/kvm_ppc.h        |   5 +-
 arch/powerpc/kernel/exceptions-64s.S      | 257 +++----------------
 arch/powerpc/kernel/security.c            |   5 +-
 arch/powerpc/kvm/Makefile                 |   6 +
 arch/powerpc/kvm/book3s_64_entry.S        | 295 ++++++++++++++++++++++
 arch/powerpc/kvm/book3s_hv.c              |  69 +++--
 arch/powerpc/kvm/book3s_hv_builtin.c      |   7 +
 arch/powerpc/kvm/book3s_hv_interrupt.c    | 208 +++++++++++++++
 arch/powerpc/kvm/book3s_hv_rm_mmu.c       |   3 +-
 arch/powerpc/kvm/book3s_hv_rmhandlers.S   | 125 +--------
 arch/powerpc/kvm/book3s_segment.S         |   7 +
 arch/powerpc/kvm/book3s_xive.c            |  32 +++
 16 files changed, 670 insertions(+), 370 deletions(-)
 create mode 100644 arch/powerpc/kvm/book3s_64_entry.S
 create mode 100644 arch/powerpc/kvm/book3s_hv_interrupt.c

-- 
2.23.0

