Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D257264EB1D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Dec 2022 13:02:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NYSQD4fLfz3f47
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Dec 2022 23:02:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=n7vu6EOm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=n7vu6EOm;
	dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NYSMN0qsRz3bVy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Dec 2022 22:59:43 +1100 (AEDT)
Received: by mail-pg1-x529.google.com with SMTP id 62so1577900pgb.13
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Dec 2022 03:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P6GZ5wjoHKgPVnn522+72lxNpKkugmzeDUcZHpY4Rm0=;
        b=n7vu6EOmesgwTC6sebdlEqOPCAq3KNmT5ZQvvtUlFDy0hu6J3HNunwD+4KpGgsDsUI
         bH+LOQqxGVvqBMRcbRzh6B6QUvD3fhLFb2Eu8P1MUdSE1Z5FOFxLaDIwsRfu3MGjzK4E
         aOiVpiPKIPtoIvf3bYtpgsF9dn8MNFu1m5+bnsjVUjphph1qTIIz+jN5NrnxmVK+kHec
         CHMsBlxQyfKp7Ziq33Zno+r/Fa14cHD7V3Pech9/Mbsfmrllz1CQjFWKrDsesdwZOSVq
         aZ2IDG++0zoSCGPAnypXa6wWWs2dVoLPkP2cN5wZ6y7ixJY8aL1NMj3vvkcT1+9C7asb
         uxaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P6GZ5wjoHKgPVnn522+72lxNpKkugmzeDUcZHpY4Rm0=;
        b=UPfN6llc9YsNs2tqsnXV5N4gjCftJegUjcdGpjQ/M27TcuJl83DDimKJpWvhBHNyCn
         /cpUFyeSQIrpIm0Bv5/Khg1LCzb9Sx5+rorf1w+k8q92t2+5dbBan6E6woaFNmQDtXDe
         /I+xHDTYc/7cn8uFranmg+fNLFs4RuG89JDRMXSPZD4va8P+m9dwYKrELt9qFZFwzzjr
         gHwAf8HPelGnGBckiHB4l5p4Jz0zyrGBEzy/+2WsX6GRBNawrPUrwD3lv89CUnpv0OUN
         AuYcAaUQJyhIWkh/9LxAJnyxR4qSWALx1keCJxHWmikKfewJ2hWwh+dfg2hAXJRw38H5
         AbWw==
X-Gm-Message-State: ANoB5pmRhC5WlMkum0YPCdB1XR2EaG0XKtzqnuj9IhABxhs4eONYndxE
	+uSQ3tJYFEzdpZ3A9PKFM678x0Ktc5En5g==
X-Google-Smtp-Source: AA0mqf7FDQs4+6IXDzjCM0GA26kjXImC7VjYHa5i6f0ybBoi6AIaRzgO0D+3nfimDFpGcY9VxthHuQ==
X-Received: by 2002:aa7:8b4d:0:b0:56c:962:fe7e with SMTP id i13-20020aa78b4d000000b0056c0962fe7emr31265822pfd.32.1671191981717;
        Fri, 16 Dec 2022 03:59:41 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-236-36.tpgi.com.au. [115.64.236.36])
        by smtp.gmail.com with ESMTPSA id g22-20020a625216000000b0057ef155103asm1289438pfb.155.2022.12.16.03.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 03:59:41 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/4] powerpc/64: Fix task_cpu in early boot when booting non-zero cpuid
Date: Fri, 16 Dec 2022 21:59:28 +1000
Message-Id: <20221216115930.2667772-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221216115930.2667772-1-npiggin@gmail.com>
References: <20221216115930.2667772-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

powerpc/64 can boot on a non-zero SMP processor id. Initially, the boot
CPU is said to be "assumed to be 0" until early_init_devtree() discovers
the id from the device tree. That is not a good description because the
assumption can be wrong and that has to be handled, the better
description is that 0 is used as a placeholder, and things are fixed
after the real id is discovered.

smp_processor_id() is set to the boot cpuid, but task_cpu(current) is
not, which causes the smp_processor_id() == task_cpu(current) invariant
to be broken until init_idle() in sched_init().

This is quite fragile and could lead to subtle bugs in future. One bug
is that validate_sp_size uses task_cpu() to get the process stack, so
any stack trace from the the booting CPU between early_init_devtree()
and sched_init() will have problems. Early on paca_ptrs[0] will be
poisoned, so that can cause machine checks dereferencing that memory
in real mode. Later, validating the current stack pointer against the
idle task of a different secondary will probably cause no stack trace
to be printed.

Fix this by setting thread_info->cpu right after smp_processor_id() is
set to the boot cpuid.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/setup_64.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index a0dee7354fe6..e6c8d1e326f7 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -396,6 +396,9 @@ void __init early_setup(unsigned long dt_ptr)
 	}
 	fixup_boot_paca(paca_ptrs[boot_cpuid]);
 	setup_paca(paca_ptrs[boot_cpuid]); /* install the paca into registers */
+	// smp_processor_id() now reports boot_cpuid
+
+	task_thread_info(current)->cpu = boot_cpuid; // fix task_cpu(current)
 
 	/*
 	 * Configure exception handlers. This include setting up trampolines
-- 
2.37.2

