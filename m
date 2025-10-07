Return-Path: <linuxppc-dev+bounces-12684-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA67BC01D4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 07 Oct 2025 05:50:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cghx95CbYz2yqh;
	Tue,  7 Oct 2025 14:50:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::632"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759809021;
	cv=none; b=C7+15fu0QleKl7RQRh53oPw9QCkeEyzfADrSJbs078sQZcEE/CdIqABqa8E1OY5mG/fOGvfAsIu94WcoZh1WKRMOmvB61TofRCJ8Vg+4ES+A1Efk4JTN/F5JyNCKBNonlI23K3cgcw1eW/NgmLqX5815IitSgeSOGqRPUK8AJA7Y0lH2gOQ92HjOkNIoKE7OejhrrCYHPOI9020gLSaR6dLvmX0/3oM4eLxLGPM1mZVgVXo1Jc/aEk14aK2QlkEo1CeXTXvYgR8g676fgxATsCCsjjWQf/amIHaGVxX3X3R5C0GUQ+29oxfh0TMCMVSyLQOQ1lnarDJ23NhDRb1Rjg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759809021; c=relaxed/relaxed;
	bh=DLvTrnlB6pwG2/hP8cgIWiHqyjOpePcOnpbnsgYKsys=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:Date:References; b=ScqZkvgvdCtZlpy3QlZm/HYa01hi3bJrBBf45NlKL0lbRrbpJaHnyJ9bD4nwISeXjXFj87UD9Z6SkFYvosgZBxCdfXPU003wjIdHnAHfupR7rSpNWPoH+qUPYP4OLp2pMCGzir5L1twuIi1NWct3JauTljCfHm4KkCgKH3f0TbIbAXjAXd/lfktir8B+PZmIF9z2N4XL/XRUhQ7sHIdpW0FToOq0bW5cDQB6gXrpeBjxuQH+tkbGzjxofrldtw7tPMr4Q4E8U/HAOeo2o45kDculpvqfBOLYM0WpwBD39cGM4UzNVID9tPyDv/PDy3L74l3V7xvZSXkEaW2OW3k/iQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KifLi5Lx; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KifLi5Lx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cghx81CKYz2xcC
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Oct 2025 14:50:19 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-28e7cd6dbc0so65945065ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Oct 2025 20:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759809017; x=1760413817; darn=lists.ozlabs.org;
        h=references:date:in-reply-to:subject:cc:to:from:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DLvTrnlB6pwG2/hP8cgIWiHqyjOpePcOnpbnsgYKsys=;
        b=KifLi5LxaCioAfI9SP4pPbrdOSP4cyhAAy4H/4qX/0g/ofV0TPUVOlrC7+ZrSCGHgL
         NjBVu7LSC90XpW1pRxpIgvcGlSfCUkRC5i2wPNm5IUXdFdHu9XxgaTqF14OAbcYEEQth
         MzBK8PNg/FrJRQHQ+CII90fE3EeECD/lnA1ccBHx9bmSqmhpmS2nvBFxj2y01TlJWmwC
         2AcHAQbGL5LGmanNzcdpdmhCVJD+mYrfcXGFsbZILGw06GpKAgby1kyUgknJaiMfxG6e
         nz+N4P2ajSZ8sbzYVZFZQ4r/poDRUlApiJlHLmkahtn4eiQmsrvj30AnJatmEx7BbUam
         lDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759809017; x=1760413817;
        h=references:date:in-reply-to:subject:cc:to:from:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DLvTrnlB6pwG2/hP8cgIWiHqyjOpePcOnpbnsgYKsys=;
        b=Nq0zviR3sOrO+ji6ZWPUCX0rN62x30chfO0ULlUKnNg0RsqcvNmypz0bQGLNeMVdSV
         M8i4+xg22dfYkVt15nh5b0y/OiYZUCuAoYPzu0R6MJ8Jt5Udq3Czd/xql3156zd40wQ5
         YA/cHOgKQpTuMV+3AAdUEVsygNKhml0isjgjd7PK5/qW/LsXmXFq7qf8d9FpYH4Yw3h1
         W9Rzsn1gC8yFJ2b6BoeLsdNQcv6wFGfAVYshGVQbZnl7U780ZPtEI99jr08QSQm3XUi7
         7KqCYhTqktQNC9OWPj5t8aSxKuhb9+rdUQoWtEuq8f1D17MDilWhNTDYUt5MfLyPLQze
         CW3A==
X-Forwarded-Encrypted: i=1; AJvYcCWD4SD8CWi3DpO2yXb8mfYZU24rd3DLLnv0RulQ/MSNrbcHxpIlThVVFG3Xb3wFAV8YdGFjy+me96b7RNw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwUyBjzmmtHTdgXcXoStnFfPuxx9gZ+Hm2Sc7u4HvwHY+gBjvh5
	6UVnzB3t7BVV1VSxHot0VuBHcv1o68V/P9a8ZR91aTFZ3lQM4BEO/sad
X-Gm-Gg: ASbGncssYZiMkvAdkwx7dtaV/rQsnSTynEsTkxXg5uWKimXPDwX4ph/t72e5qup9eH7
	g1eShkvfVtO3uQPLAG7X/fpxMp48mX5FIQi2bQ9ztoL4t5BzlDxPYblexm3xtVUfrrsENFLwZRA
	p/ORiPT4kBXIrZVvcAJvU9GXlkZyeIfd0pfny1OWd9p1dMxvzptU6OdM1MiuB/Te8H0Fx4r6h/k
	3mqVgbuWMUAhp51u2yKpUDUbsrlR0WUCyyGigd82demqroslbkJWWPtk/1hmeUBPj6xK5zfR7pS
	0E8kiG8BVd68PB8f7SiRwT+sEjUPwNKzXrGASJG02T9fDWLFy5Fd/XE6W18p/W6pGSQ46qSA8VM
	8mlE4ymvxB3avGgIpcQ9MRxEtzNrmr0FzpDmwTpsmIGpHcStvqg==
X-Google-Smtp-Source: AGHT+IFmjVvttIfnEZ9exjxiEqJx+Nnc0IZMPVpG/NyeFL1NUXZsFyXzVDAXJzYFsL6KxP1hXcUViw==
X-Received: by 2002:a17:903:38d0:b0:269:8f2e:e38 with SMTP id d9443c01a7336-28e9a565f18mr186783675ad.6.1759809016924;
        Mon, 06 Oct 2025 20:50:16 -0700 (PDT)
Received: from dw-tp ([49.205.218.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1b8444sm149114645ad.86.2025.10.06.20.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 20:50:16 -0700 (PDT)
Message-ID: <68e48df8.170a0220.4b4b0.217d@mx.google.com>
X-Google-Original-Message-ID: <875xcrgzs2.fsf@ritesh.list@gmail.com>
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Nam Cao <namcao@linutronix.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Gautam Menghani <gautam@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: Re: [PATCH v2 1/3] powerpc/xive: Untangle xive from child interrupt controller drivers
In-Reply-To: <83968073022a4cc211dcbd0faccd20ec05e58c3e.1754903590.git.namcao@linutronix.de>
Date: Tue, 07 Oct 2025 08:54:13 +0530
References: <cover.1754903590.git.namcao@linutronix.de> <83968073022a4cc211dcbd0faccd20ec05e58c3e.1754903590.git.namcao@linutronix.de>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list

Nam Cao <namcao@linutronix.de> writes:

> xive-specific data is stored in handler_data. This creates a mess, as xive
> has to rely on child interrupt controller drivers to clean up this data, as
> was done by 9a014f45688 ("powerpc/pseries/pci: Add a msi_free() handler to
> clear XIVE data").
>
> Instead, store xive-specific data in chip_data and untangle the child
> drivers.
>
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
> v2: no change
> ---
>  arch/powerpc/include/asm/xive.h           |  1 -
>  arch/powerpc/platforms/powernv/pci-ioda.c | 21 +-------
>  arch/powerpc/platforms/pseries/msi.c      | 18 +------
>  arch/powerpc/sysdev/xive/common.c         | 63 +++++++++++------------
>  4 files changed, 33 insertions(+), 70 deletions(-)


Hi Nam, 

I am facing kernel crash on host when trying to run kvm pseries guest on
powernv host. Looking it a bit more closely, I see that we are missing
conversion of xxx_irq_handler_data()) to xxx_irq_chip_data() at few other
places, including in powerpc KVM code. 

<Crash signature>

BUG: Kernel NULL pointer dereference on read at 0x00000010
Faulting instruction address: 0xc0000000001c0704
Oops: Kernel access of bad area, sig: 11 [#1]
LE PAGE_SIZE=64K MMU=Radix  SMP NR_CPUS=2048 NUMA PowerNV
CPU: 103 UID: 0 PID: 2742 Comm: qemu-system-ppc Not tainted 6.17.0-01737-g50c19e20ed2e #1 NONE
<...>
NIP:  c0000000001c0704 LR: c0000000001c06f8 CTR: 0000000000000000
REGS: c0000000627476a0 TRAP: 0300   Not tainted  (6.17.0-01737-g50c19e20ed2e)
MSR:  9000000000009033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 88044488  XER: 00000036
CFAR: c0000000002c20d8 DAR: 0000000000000010 DSISR: 40000000 IRQMASK: 0 
<...>
NIP [c0000000001c0704] kvmppc_xive_attach_escalation+0x174/0x240
LR [c0000000001c06f8] kvmppc_xive_attach_escalation+0x168/0x240
Call Trace:
  kvmppc_xive_attach_escalation+0x168/0x240 (unreliable)
  kvmppc_xive_connect_vcpu+0x2a0/0x4c0
  kvm_arch_vcpu_ioctl+0x354/0x470
  kvm_vcpu_ioctl+0x488/0x9a0
  sys_ioctl+0x4ec/0x1030
  system_call_exception+0x104/0x2b0
  system_call_vectored_common+0x15c/0x2ec



Here is the diff which fixed this.. 

diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
index 1302b5ac5672..c029c6cc82ef 100644
--- a/arch/powerpc/kvm/book3s_xive.c
+++ b/arch/powerpc/kvm/book3s_xive.c
@@ -917,7 +917,7 @@ int kvmppc_xive_attach_escalation(struct kvm_vcpu *vcpu, u8 prio,
         */
        if (single_escalation) {
                struct irq_data *d = irq_get_irq_data(xc->esc_virq[prio]);
-               struct xive_irq_data *xd = irq_data_get_irq_handler_data(d);
+               struct xive_irq_data *xd = irq_data_get_irq_chip_data(d);

                xive_vm_esb_load(xd, XIVE_ESB_SET_PQ_01);
                vcpu->arch.xive_esc_raddr = xd->eoi_page;
@@ -1612,7 +1612,7 @@ int kvmppc_xive_set_mapped(struct kvm *kvm, unsigned long guest_irq,

        /* Grab info about irq */
        state->pt_number = hw_irq;
-       state->pt_data = irq_data_get_irq_handler_data(host_data);
+       state->pt_data = irq_data_get_irq_chip_data(host_data);

        /*
         * Configure the IRQ to match the existing configuration of
@@ -1788,7 +1788,7 @@ void kvmppc_xive_disable_vcpu_interrupts(struct kvm_vcpu *vcpu)
 void xive_cleanup_single_escalation(struct kvm_vcpu *vcpu, int irq)
 {
        struct irq_data *d = irq_get_irq_data(irq);
-       struct xive_irq_data *xd = irq_data_get_irq_handler_data(d);
+       struct xive_irq_data *xd = irq_data_get_irq_chip_data(d);

        /*
         * This slightly odd sequence gives the right result
@@ -2829,7 +2829,7 @@ int kvmppc_xive_debug_show_queues(struct seq_file *m, struct kvm_vcpu *vcpu)
                if (xc->esc_virq[i]) {
                        struct irq_data *d = irq_get_irq_data(xc->esc_virq[i]);
                        struct xive_irq_data *xd =
-                               irq_data_get_irq_handler_data(d);
+                               irq_data_get_irq_chip_data(d);
                        u64 pq = xive_vm_esb_load(xd, XIVE_ESB_GET);

                        seq_printf(m, "    ESC %d %c%c EOI @%llx",


... However grepping for "handler_data" in arch/powerpc I see there is
atleast one more place where we may still need the fix.. There are few
more places which grep returned - but I am not sure if they all really need
the fix. But I guess VAS should be fixed i.e :

arch/powerpc/platforms/powernv/vas.c:   xd = irq_get_handler_data(vinst->virq);


Would you like to submit an official patch for converting these other places too?


Thanks!
-ritesh


