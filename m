Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5FD414C7E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 16:55:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HF1Yv361Kz304m
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Sep 2021 00:55:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IwDW3HRV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=IwDW3HRV; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HF1YJ6tM6z2xfG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Sep 2021 00:55:00 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so4656194pjc.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 07:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZDfXCbRHlxW/Kz+AjPdRvaFRaMpPaKjcxBHFi7gVvh4=;
 b=IwDW3HRVn8KVeVfKt0gCK1wwHKB+CcEXQYelYAYjBXwpdQhUfC3UAFr9g+ZP8cw3M+
 F8RglsV6QU2S6u90HI+yLy/JRp1Pt8fEapOZm1YpkNEYVWBKyoMEcN5fGy4qh5OjwR+f
 tMkKKl9u+70zLkSj6wzWDGnTQzyM9gvYxa4JDJagyGrDh7x42yjOvkV6Efvy23eAoIDE
 KqBPhmikbU+3Z27fJbCfn9ipuX6KBiMu/6GRxifomOFTGgOTw9L1qAQszDJLlNbX4xvk
 6LOvvWIv3SMGkOXHAadaHwsGtmkcLcGOGJ4lJh4JyrVvmDKAnZ/YuqkU9t2HrQiiQIjZ
 DoCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZDfXCbRHlxW/Kz+AjPdRvaFRaMpPaKjcxBHFi7gVvh4=;
 b=LmG8o7Y9OBVreYtTvKpdkfwlDH9ONjSg0cBBrdpe3l2HnT6jpTscgYdaKgnjatvY9f
 AFWFv3LM0k9O4eMfD7F12C8xZqjFaPt10v9dtWXwmo+stlDWurVJPyPcTNErX0vSB3xL
 wZmJSzeQ+kdfFoUAMDnlxhw4/97y/IyA+LktvRk4nFxuRoZu8DDaDFQ6WtAXRkipE/+p
 UmbmmPajR7J/xLly+9aSVsWgJKZGeb5DvT0WBitV/s+xhbPqNWEWaqP5faNu4DB2mNRS
 iMspJgRwSiq8hQzsqjEunRqXbrCpNrMrliYvjr+kBJ3mDLFinDO6PvwQjx2/unph+qE3
 KDHg==
X-Gm-Message-State: AOAM5325Ly5d6iJyqgT3Nf8149IuNvwvxzB9egKNyN68rfrex9uBXALh
 zxZtiXvVPV50AU/giee9dFOihFvmDpM=
X-Google-Smtp-Source: ABdhPJzRxSRr4QsKi0NBoh7K5NxvHtNqshBgWyplzLEjMeluA0t+5AZHJKe1BVxPbS0dyo21IZ+1qg==
X-Received: by 2002:a17:90b:1c08:: with SMTP id
 oc8mr11930650pjb.138.1632322497522; 
 Wed, 22 Sep 2021 07:54:57 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (115-64-153-41.tpgi.com.au. [115.64.153.41])
 by smtp.gmail.com with ESMTPSA id o14sm2856211pfh.145.2021.09.22.07.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 07:54:57 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 0/6] powerpc/64s: interrupt speedups
Date: Thu, 23 Sep 2021 00:54:46 +1000
Message-Id: <20210922145452.352571-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Here's a few stragglers. The first patch was submitted already but had
some bugs with unrecoverable exceptions on HPT (current->blah being
accessed before MSR[RI] was enabled). Those should be fixed now.

The others are generally for helping asynch interrupts, which are a bit
harder to measure well but important for IO and IPIs.

After this series, the SPR accesses of the interrupt handlers for radix
are becoming pretty optimal except for PPR which we could improve on,
and virt CPU accounting which is very costly -- we might disable that
by default unless someone comes up with a good reason to keep it.

Since v1:
- Compile fixes for 64e.
- Fixed a SOFT_MASK_DEBUG false positive.
- Improve function name and comments explaining why patch 2 does not
  need to hard enable when PMU is enabled via sysfs.

Since v2:
- Split first patch into patch 1 and 2, improve on the changelogs.
- More compile fixes.
- Fixed several review comments from Daniel.
- Added patch 5.

Thanks,
Nick

Nicholas Piggin (6):
  powerpc/64/interrupt: make normal synchronous interrupts enable
    MSR[EE] if possible
  powerpc/64s/interrupt: handle MSR EE and RI in interrupt entry wrapper
  powerpc/64s/perf: add power_pmu_wants_prompt_pmi to say whether perf
    wants PMIs to be soft-NMI
  powerpc/64s/interrupt: Don't enable MSR[EE] in irq handlers unless
    perf is in use
  powerpc/64/interrupt: reduce expensive debug tests
  powerpc/64s/interrupt: avoid saving CFAR in some asynchronous
    interrupts

 arch/powerpc/include/asm/hw_irq.h    |  59 +++++++++++++---
 arch/powerpc/include/asm/interrupt.h |  58 ++++++++++++---
 arch/powerpc/kernel/dbell.c          |   3 +-
 arch/powerpc/kernel/exceptions-64s.S | 101 ++++++++++++++++++---------
 arch/powerpc/kernel/fpu.S            |   5 ++
 arch/powerpc/kernel/irq.c            |   3 +-
 arch/powerpc/kernel/time.c           |  31 ++++----
 arch/powerpc/kernel/vector.S         |  10 +++
 arch/powerpc/perf/core-book3s.c      |  31 ++++++++
 9 files changed, 232 insertions(+), 69 deletions(-)

-- 
2.23.0

