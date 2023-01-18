Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 613476715BE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 09:01:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxdW11M6Sz3fCB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 19:01:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=M10VwdDx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=M10VwdDx;
	dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxdV40kYfz2yPY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 19:00:25 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id c6so36125139pls.4
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 00:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/c+UEu1/betIkwkWD66Ls4sEbWMR7MDl6kLYjMdOV68=;
        b=M10VwdDxiyjR3MkXCt1kIacLOaoFMDhyYGfoN3hv49C7DrdZOq1oe294t353LIQwcM
         l2KY2y2Zc4rxy5Mg3Z728Ym4bWH5diPOXyzsHtMT83RGbaSgYIqIREU23EJGzgLI1Ov6
         N1OYK+iD4zTKGEGWh8IvWX2z6TOFlokAQYUq5hjG8xyZl4+f6z+DDXxK8Du9/vS/4tMg
         wmBdI3sEpKLtpt5MH8U5Bw1lHZF+5fxMmP69GiPiq3w4/kNF6+Kq0OCMnvfKaVIaj14M
         YoEav7fySPBIT0/7ILHa3NgDqx4uXGWF29GGOBUyZgpgm1r8bCwYgVI+XC5Nwmh6iP6r
         LC3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/c+UEu1/betIkwkWD66Ls4sEbWMR7MDl6kLYjMdOV68=;
        b=CsqAkj02VoZK+hVOS/1mXtkskjeJ+z6a3iV6plhZ3l7I+0mjLlYix3jaXpvwlaqj34
         1E5epGw0VHdH1bb4L93HmI2qFoT48INIlkJZnz6nSnl8nBwn6Yx0TQmOa9+b2V9YrwJi
         XeqV46rRYNYstIE0ZC3rvBJujZqZwvoRNTT7H2Ml609Yb5UZ/3qbaExNEyC2nGxZzlZL
         CGG6nlxBVck+dkSuyVkM5pUWyHfiKIutF8POvR8Z8L2A77U9AcIdW4LtYCwjYsvEFa8g
         jRjfJmWEONZsXb1857Ji4/3+Wm/Lu55tbvwHrzzQQ/c3s+IjdJdRC/QvofIGJfjNV2He
         WeyA==
X-Gm-Message-State: AFqh2kpyhXE+G8uMqRjpAt8Zt+jRHPP5CH1NC07HrsWRgayRGoQ2pUsj
	8HYxGjL2nZLCdot0cGa3nzI=
X-Google-Smtp-Source: AMrXdXuopL1YCdkdtbKoGG/gjIRTEabwn/ENnFAHXgYRviGj73xTUB/xxw/XplI1n3AcRXREZspG9g==
X-Received: by 2002:a17:90a:f3d8:b0:228:da96:cfd2 with SMTP id ha24-20020a17090af3d800b00228da96cfd2mr5953879pjb.27.1674028822477;
        Wed, 18 Jan 2023 00:00:22 -0800 (PST)
Received: from bobo.ibm.com (193-116-102-45.tpgi.com.au. [193.116.102.45])
        by smtp.gmail.com with ESMTPSA id y2-20020a17090a16c200b002272616d3e1sm738462pje.40.2023.01.18.00.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 00:00:21 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v6 0/5] shoot lazy tlbs
Date: Wed, 18 Jan 2023 18:00:06 +1000
Message-Id: <20230118080011.2258375-1-npiggin@gmail.com>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Nicholas Piggin <npiggin@gmail.com>, linux-mm <linux-mm@kvack.org>, Andy Lutomirski <luto@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It's time for that annual flamewar. Nothing really changed in core code
to clean things up or make it better for x86 last year, so I think we
can table that objection.

IIRC the situation left off with Andy proposing a different approach,
and Linus preferring to shoot the lazies at exit time (piggybacking on
the TLB flush IPI), which is what this series allows an arch to do.
Discussion thread here:

https://lore.kernel.org/linux-arch/7c9c388c388df8e88bb5d14828053ac0cb11cf69.1641659630.git.luto@kernel.org/

I don't think there was any movement on this or other alternatives, or
code cleanups since then, but correct me if I'm wrong.

Since v5 of this series, there has just been a minor rebase to upstream,
and some tweaking of comments and code style. No functional changes.

Also included patch 5 which is the optimisation that combines final TLB
shootdown with the lazy tlb mm shootdown IPIs. Included because Linus
expected to see it. It works fine, but I have some other powerpc changes
I would like to go ahead of it so I would like to take those through the
powerpc tree. And actually giving it a release cycle without that
optimization will help stress test the final IPI cleanup path too, which
I would like.

Even without the last patch, the additional IPIs caused by shoot lazy
is down in the noise so I'm not too concerned about it.

Thanks,
Nick

Nicholas Piggin (5):
  lazy tlb: introduce lazy tlb mm refcount helper functions
  lazy tlb: allow lazy tlb mm refcounting to be configurable
  lazy tlb: shoot lazies, non-refcounting lazy tlb mm reference handling
    scheme
  powerpc/64s: enable MMU_LAZY_TLB_SHOOTDOWN
  powerpc/64s/radix: combine final TLB flush and lazy tlb mm shootdown
    IPIs

 Documentation/mm/active_mm.rst       |  6 +++
 arch/Kconfig                         | 32 ++++++++++++++
 arch/arm/mach-rpc/ecard.c            |  2 +-
 arch/powerpc/Kconfig                 |  1 +
 arch/powerpc/kernel/smp.c            |  2 +-
 arch/powerpc/mm/book3s64/radix_tlb.c | 30 +++++++++++--
 fs/exec.c                            |  2 +-
 include/linux/sched/mm.h             | 28 ++++++++++++
 kernel/cpu.c                         |  2 +-
 kernel/exit.c                        |  2 +-
 kernel/fork.c                        | 65 ++++++++++++++++++++++++++++
 kernel/kthread.c                     | 21 +++++----
 kernel/sched/core.c                  | 35 ++++++++++-----
 kernel/sched/sched.h                 |  4 +-
 14 files changed, 205 insertions(+), 27 deletions(-)

-- 
2.37.2

