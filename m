Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8FA2D9362
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Dec 2020 07:54:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CvXFM2FWfzDqR6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Dec 2020 17:54:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=q6GEshR5; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CvXCq2R4rzDqQQ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Dec 2020 17:53:25 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id x12so7655028plr.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Dec 2020 22:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=836ueWsqhXJFS2jsaV/+MeW0snlTaUrAFFynrxAzOKk=;
 b=q6GEshR5RFezy4+EprhXJG3fpkvIJHTaEh/EvfhfVA5FfUUDnQ3+4cDCpIRFRC/Mm2
 ZbtvniEPDGviRpZFiQEw8za5h5Z+oWiIlhCu6JBrMnylhIiZhpvC1s1wknSQzDFn0sBw
 8JBT7WhTHfWQfd/wi8sI02TaNRGE436yalS6VtVi39Gml2AGcKkbCiNmqS+4M4ZvGaeu
 xyWfWZoDpWHAvjMESrmKu4FJkOpTQ9ExYrWUgUdh4fCFUa3xeWlwuMz2sCEkKblW5gxy
 +XHxC0WI5idDR3jZr0BQTqsOClCl3URK8jdwMk8i0+K2wgfBGhE4DdSap9b1vIhgbLvC
 7w7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=836ueWsqhXJFS2jsaV/+MeW0snlTaUrAFFynrxAzOKk=;
 b=oZr8b6CjJY/LE5bhf72gP3+pEgBMdCJFJtdWwXz0CHeAZP5LTflJWYd/7xxvfxZVtN
 5Se/fIDjFdj+bYViyS68nXnxFsTB/EttYiDYqZTeAerRDpTiMQolLF7X9ZZwwa4cI5un
 TebKxewHZmMsUwZ3xJ49N5QqXhFTQChtnxEFhGWjSgj/tZ0opa34qnH5GlhbnPqyB1/j
 tL78weoUlhnnJ72Aka0tUM/vxabFBbrz3IL8LfUoqHPQMSFbKl0iljGJRjBfZ49EJooB
 jInNcDZMd655VkZO7qP0k4IPvFd9FYKbDJckMcst2M6NBFHFNH90Fb0O/X/kkRYpC3Eq
 bHYQ==
X-Gm-Message-State: AOAM533RvaI8Wv0A79U2itb0cx++WkvDhdUbEneMBytGx+oH0zF1rKhI
 BcgU/h+ZyvSmEDyNFmT1s84=
X-Google-Smtp-Source: ABdhPJyoH0x/t5iFpjCJhCQTVS//5zozzcYJHAEPewzZkngQ9RzGM8cWtjfAj/AvxA1N7fuXpEPEMA==
X-Received: by 2002:a17:90a:a45:: with SMTP id
 o63mr24426408pjo.146.1607928801482; 
 Sun, 13 Dec 2020 22:53:21 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([220.240.228.148])
 by smtp.gmail.com with ESMTPSA id 84sm19570018pfy.9.2020.12.13.22.53.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 22:53:20 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] shoot lazy tlbs
Date: Mon, 14 Dec 2020 16:53:07 +1000
Message-Id: <20201214065312.270062-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 linux-mm@kvack.org, Andy Lutomirski <luto@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is another rebase, on top of mainline now (don't need the
asm-generic tree), and without any x86 or membarrier changes.
This makes the series far smaller and more manageable and
without the controversial bits.

Thanks,
Nick

Nicholas Piggin (5):
  lazy tlb: introduce lazy mm refcount helper functions
  lazy tlb: allow lazy tlb mm switching to be configurable
  lazy tlb: shoot lazies, a non-refcounting lazy tlb option
  powerpc: use lazy mm refcount helper functions
  powerpc/64s: enable MMU_LAZY_TLB_SHOOTDOWN

 arch/Kconfig                         | 30 ++++++++++
 arch/arm/mach-rpc/ecard.c            |  2 +-
 arch/powerpc/Kconfig                 |  1 +
 arch/powerpc/kernel/smp.c            |  2 +-
 arch/powerpc/mm/book3s64/radix_tlb.c |  4 +-
 fs/exec.c                            |  4 +-
 include/linux/sched/mm.h             | 20 +++++++
 kernel/cpu.c                         |  2 +-
 kernel/exit.c                        |  2 +-
 kernel/fork.c                        | 52 ++++++++++++++++
 kernel/kthread.c                     | 11 ++--
 kernel/sched/core.c                  | 88 ++++++++++++++++++++--------
 kernel/sched/sched.h                 |  4 +-
 13 files changed, 184 insertions(+), 38 deletions(-)

-- 
2.23.0

