Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9066C8E2D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 13:31:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PkJMt4qvCz3f8t
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 23:31:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=B9wcFxDi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=B9wcFxDi;
	dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PkJKs5Hk4z3cdr
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Mar 2023 23:29:20 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id kq3so4151026plb.13
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Mar 2023 05:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679747357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lIPeKscnGFEsy2WSX3ygNCSCd5BzRqHGBV3qN6cHP4c=;
        b=B9wcFxDiELAauAwqU8QEmbr7m10gClpL9ePCr9lRMeuhNbGJAbpT032swL3+lhwdfP
         sqxlRDiJkc09tWCcv4LUbojN3rTqGNv2ST8n0IjsgdbJzGkPK5ghLL8agNaISmSSUYzH
         i1MeD2COYG2+ieZgv5tL9i8JJ9GR4t51JhQjWNHTiaT/1v2RoMirrVZ5WpVNZCTtc2FJ
         6z8Icg6fbA5ouvQF69lIDdlDWXmwDWjHWjK19N1c0bbXvuHUyuUD4H2yEnRYmS/ghcLM
         z2/NZl57hhyb1fAlpco0iHDBj+MeOPeoj+Uuun7S3rLW0UOvZXLZhtq/1zSMEj5CcneO
         W8dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679747357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lIPeKscnGFEsy2WSX3ygNCSCd5BzRqHGBV3qN6cHP4c=;
        b=WaJesjUjMrx/GJwdrOZbOmIovyZesBuicYfBbqOlkzRLSX+mx5hSr0JwYDq28A8qdr
         RMtM+vYl1uRzO7C+v2sCjI+V0uEbkJGi+5E+ge+y8bn55MgOdGL4zRbC0JxqLbOV4KbH
         lE8ALKGv0BWpR5vNTwbsH38cCCXv7TeAtzIo/l3s+RyUMNgsGQlZ3vDIlFIxFZ2U9M3D
         2vZlozR6s0iGcRXeYkj7FDV6JsV+ARsnMVt7qw7F0dySSFbk0B+uKvTvHG/lBFf9tulq
         tPGNkdGwkxevqVUv+K5YIBEk8iTs4FjcsUEedChHEh13XXvLPHTDHbN42NbovpBsnXJa
         O8BA==
X-Gm-Message-State: AO0yUKWsH1WsF1Glg66uKSulw1tK+pBvk58XB7PSGA3xH66VIHGSU8IG
	H2bS1XYTZCk4K7Q76PFegA3pnlXiJnA=
X-Google-Smtp-Source: AK7set8xUpT9Pws+/eg+Vt60NayKLWYsogw8CPjlH6JpYQ73SAwg390e4xtd3OEz2apfcEJIpQhlKA==
X-Received: by 2002:a05:6a20:4e08:b0:d9:4c19:fe69 with SMTP id gk8-20020a056a204e0800b000d94c19fe69mr7499061pzb.25.1679747356897;
        Sat, 25 Mar 2023 05:29:16 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([124.170.18.191])
        by smtp.gmail.com with ESMTPSA id a13-20020a63d20d000000b0050376cedb3asm14923643pgg.24.2023.03.25.05.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 05:29:15 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/8] powerpc: copy_thread cleanups
Date: Sat, 25 Mar 2023 22:28:56 +1000
Message-Id: <20230325122904.2375060-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
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

This series cleans up copy_thread and hopefully makes the code
easier to understand. The big changes in patch 3 and 4 which use
the switch stack instead of user int stack for restoring
fn and args parameters for the new thread.

I don't think there's any bugs fixed here because in the case of
a kernel-user thread, kthread_exec would re-populate the user int
frame with regs, so that should be okay.

Since v1, I only rejiged some changes between patches and minor
cosmetic improvements but no functional change. Tested with
32e/s 64e/s BE and LE.

Thanks,
Nick

Nicholas Piggin (8):
  powerpc: copy_thread remove unused pkey code
  powerpc: copy_thread make ret_from_fork register setup consistent
  powerpc: use switch frame for ret_from_kernel_thread parameters
  powerpc/64: ret_from_fork avoid restoring regs twice
  powerpc: copy_thread differentiate kthreads and user mode threads
  powerpc: differentiate kthread from user kernel thread start
  powerpc: copy_thread don't set _TIF_RESTOREALL
  powerpc: copy_thread don't set PPR in user interrupt frame regs

 arch/powerpc/include/asm/thread_info.h |   2 +
 arch/powerpc/kernel/entry_32.S         |  23 ++++-
 arch/powerpc/kernel/interrupt_64.S     |  28 +++++-
 arch/powerpc/kernel/process.c          | 124 ++++++++++++++-----------
 4 files changed, 113 insertions(+), 64 deletions(-)

-- 
2.37.2

