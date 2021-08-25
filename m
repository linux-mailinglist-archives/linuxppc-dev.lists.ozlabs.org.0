Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E003F752E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 14:38:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gvlr42Xxrz2yZf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 22:37:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=A2c8ppra;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d;
 helo=mail-pl1-x62d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=A2c8ppra; dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GvlqS5zcHz2yHY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Aug 2021 22:37:22 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id q3so2416721plx.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Aug 2021 05:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kVy7Jjmaw0gHzT0JXO7khNuWbOIs5lpw1dsq6RqJYXU=;
 b=A2c8ppraQvTCf2X8wO6B2KxWJtbQ5xN7Ltp9i6IOSorxn8QRaPuY9m7fQk0c8B/Yja
 bYOI9aUL0htV02UABzmcyHamciIHcUGtrBxsmZKH8qWPqtVqwf+fYGlt8/7vRXgYVYo7
 l6b3k/81mpu8xJkF3h7XynZq+RsGTLlEQUFsIqaPfbN25QEgf/V+qWXGt4cr+L+DNnyE
 VXqX+Z024H3JkyTsStm83wzxjEmrat/rAnDpfn5Hcv1bH231rOz2dXQZNCcNRjF8gu5q
 L1WueDmln8+sgpPey/WBkMuLQnboZfVQitolOCgRWxHz35/5whS98fLvMrgP9nxlDpHq
 I6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kVy7Jjmaw0gHzT0JXO7khNuWbOIs5lpw1dsq6RqJYXU=;
 b=VGGuDrd0V2nIoSnbM7L1osH2H4zPeD5T3gu9J78jYe7lqZvKhNTiN+9pOfTpn0KrEl
 8BQ8P2uIRXBWEUE/lsQhYamHv7tSU+8WFbeE58DjqeuZcUHyfdZU4Ft50DZhxkgs7kb4
 avRZFu1+lINK5kfB+YIDBukyw7+tEU3KDVvb3ombRwDfern9zXy8Ugfb7HYidy6OsFby
 /ldJJCKSBKo96jTETR9UdTfGlWiwWicEe+gV3Cin1U7Qf//fWhuzNyO+LP/8nEE2bk10
 lDLLSlTPjCsGk4HW6ELfpOufMd1tckLFGDZwPV+BVIAwccRrQhMPl+b0ZfzqQsqV4gdl
 ZEhQ==
X-Gm-Message-State: AOAM531LO1Z3Ou8rON9sRW1v8eLtWTc+4NMJqBHu7ZN6pCEnqgnZDp22
 Nu2U15ixZj5q9Qu7JphohjWBuPr6bV0=
X-Google-Smtp-Source: ABdhPJxbthjhwmbWNWcbeZMpeWbJehzZAAII++TVTRp8g5KGo6T5G/7fvjxsUDZIbepTZDvbWJoqrA==
X-Received: by 2002:a17:90a:a389:: with SMTP id
 x9mr10116922pjp.167.1629895040004; 
 Wed, 25 Aug 2021 05:37:20 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-119-33.tpgi.com.au.
 [193.116.119.33])
 by smtp.gmail.com with ESMTPSA id j6sm22043162pfi.220.2021.08.25.05.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 05:37:19 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/4] powerpc/64s: interrupt speedups
Date: Wed, 25 Aug 2021 22:37:10 +1000
Message-Id: <20210825123714.706201-1-npiggin@gmail.com>
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

Thanks,
Nick

Nicholas Piggin (4):
  powerpc/64: handle MSR EE and RI in interrupt entry wrapper
  powerpc/64s/perf: add power_pmu_wants_prompt_pmi to say whether perf
    wants PMIs to be soft-NMI
  powerpc/64s/interrupt: Don't enable MSR[EE] in irq handlers unless
    perf is in use
  powerpc/64s/interrupt: avoid saving CFAR in some asynchronous
    interrupts

 arch/powerpc/include/asm/hw_irq.h    | 57 ++++++++++++++---
 arch/powerpc/include/asm/interrupt.h | 31 ++++++++--
 arch/powerpc/kernel/dbell.c          |  3 +-
 arch/powerpc/kernel/exceptions-64s.S | 93 +++++++++++++++++++---------
 arch/powerpc/kernel/fpu.S            |  5 ++
 arch/powerpc/kernel/irq.c            |  3 +-
 arch/powerpc/kernel/time.c           | 31 +++++-----
 arch/powerpc/kernel/vector.S         |  8 +++
 arch/powerpc/perf/core-book3s.c      | 28 +++++++++
 9 files changed, 199 insertions(+), 60 deletions(-)

-- 
2.23.0

