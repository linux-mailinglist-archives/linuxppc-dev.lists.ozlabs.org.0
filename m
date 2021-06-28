Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EE33B5A0B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Jun 2021 09:50:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GD0Bq16L4z30D9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Jun 2021 17:50:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=TZc1VkVh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430;
 helo=mail-pf1-x430.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TZc1VkVh; dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GD0BH2WpPz303t
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Jun 2021 17:49:43 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id y4so13404135pfi.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Jun 2021 00:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YgWNnON359vBdYQPJK2JJ7cuAgqDJpoKiUS8EeDOdcI=;
 b=TZc1VkVhFNjhj7pd20+XCSi2ifY0xLFKhTgv9+jehRuyTzFXjDsem2ctlQ+fkIauXS
 QHrZaaOeksMxr6kcMbpEOD15OFulhkNhWggUDjWdaKR9XqYfUEjvAb2oC8InJ2IAzZG7
 PoSDGbeX68PC9DFgAaq/mCuTwi7DvSTK15fOi0hbXzha0UIO5Q5kMYfCiUeyZJG6NM9Q
 +uwHhVtUH97DfgpG1Xp1lswIB62Nyn4/MNUXh6Qbzo4/V3b9AxDEpn3H1usALA1rhYq0
 0mPObPZPaX4tiFH+rDkv8G6K2cFim4xwjAHnS4BJCyAWqU4aJNMnxRzl3VajBj6gyE3C
 wxgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YgWNnON359vBdYQPJK2JJ7cuAgqDJpoKiUS8EeDOdcI=;
 b=VKS3grn+y32uzSZtNwulNwZ7kIeGlDFrfWdz+piYL33hHyTj831auxX5h+p/G8xR8d
 lpRluoETcAzcknSrMoz28GivQajnvuC3XoxCbBMHkiI5OlhR0Ml2XHpcxUE8+6JilpP8
 xkj6BiPaEgFBu6NNe52Nns5ChLYwnpbQ5qehUYZ3LQlmZM4r4JGidcN4xMhXsvp6UrSY
 fi6eEvVI6cdq0ONBHA6akI/2vHEUjDk+yXAPiy8+Cvd4zc3/gD9aQWC5b0Zsr7uQLYzM
 QqF//ZHrUa8EZCC1X2VqbS5FzOXwxiWpfzpZJG97mm4nq/yJzDCftgpNXHgmuqIrfM8T
 S4Qg==
X-Gm-Message-State: AOAM532967smVsxg3rV5N7OTfjkXOFZHVxeI8bRyrfrYyYbGpSSwOjMZ
 8ToFFPXJB7CTruatFt9jUDB2acbUyzE=
X-Google-Smtp-Source: ABdhPJwK85Oj+InnZxbjgyKAhB78cOTIydPNHW1uzsYEhO8G/roWXgm/oELw30ZnNWbs1voMZj/ChQ==
X-Received: by 2002:aa7:93bb:0:b029:307:31a3:ad3d with SMTP id
 x27-20020aa793bb0000b029030731a3ad3dmr23623832pff.65.1624866579791; 
 Mon, 28 Jun 2021 00:49:39 -0700 (PDT)
Received: from bobo.ibm.com (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id b22sm5264962pfp.20.2021.06.28.00.49.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 00:49:39 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/8] powerpc: fast interrupt exit bug and misc fixes
Date: Mon, 28 Jun 2021 17:49:24 +1000
Message-Id: <20210628074932.1499554-1-npiggin@gmail.com>
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a bunch of fixes for powerpc next, mostly a nasty hole in fast
interrupt exit code found by Sachin and some other bits along the way
while looking at it.

So far this survives about 5 hours of stress testing with a workload
that would trigger it in a few seconds (guest 128 vcpus running kernel
compile loops with perf record -ag running in the background).

Thanks,
Nick

Nicholas Piggin (8):
  powerpc/64e: fix CONFIG_RELOCATABLE build
  powerpc/64e: remove implicit soft-masking and interrupt exit restart
    logic
  powerpc/64s: add a table of implicit soft-masked addresses
  powerpc/64s/interrupt: preserve regs->softe for NMI interrupts
  powerpc/64: enable MSR[EE] in irq replay pt_regs
  powerpc/64/interrupts: add missing kprobe annotations on interrupt
    exit symbols
  powerpc/64s/interrupt: clean up interrupt return labels
  powerpc/64s: move ret_from_fork etc above __end_soft_masked

 arch/powerpc/include/asm/interrupt.h | 41 ++++++++++---
 arch/powerpc/include/asm/ppc_asm.h   |  7 +++
 arch/powerpc/kernel/exceptions-64e.S | 23 +++----
 arch/powerpc/kernel/exceptions-64s.S | 55 ++++++++++++++---
 arch/powerpc/kernel/interrupt_64.S   | 90 ++++++++++++++++++----------
 arch/powerpc/kernel/irq.c            |  1 +
 arch/powerpc/kernel/vmlinux.lds.S    |  9 +++
 arch/powerpc/lib/restart_table.c     | 26 ++++++++
 8 files changed, 194 insertions(+), 58 deletions(-)

-- 
2.23.0

