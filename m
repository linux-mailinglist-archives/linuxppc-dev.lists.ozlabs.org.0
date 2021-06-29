Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B353B7A5B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 00:21:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GDzT71qTMz3bjG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 08:20:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=f+jn80Ot;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c;
 helo=mail-pf1-x42c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=f+jn80Ot; dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GDzS90bpNz2yXX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jun 2021 08:20:08 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id i6so587549pfq.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Jun 2021 15:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GnN//iNBgEBYqHZHMGXDVVVN0pCq+iqj8cvIQQHM9Gg=;
 b=f+jn80OtBatx+cCl0Hb9RsOy9pyMYE32a1NAEkrFIS0Xjy+RowD8jjH5R3noEleRuz
 SvHRPaz8bz8kkGYoHPeFgPRPxSJHiFwoVrkvSVHvYAMTvfmHQXFPT5q2cPNwLedRxTxn
 xE6rxU1QzBl/CEKP9/3YjvB4KRK7HAvsMxhNoh9eaiolpYcTSkewzcRYDLfReS/xba0M
 uUYmrnAmovDTAAJnrQk7M/vb8F/8AiZSnezkS00Ba6GTlvOvFQSoAJ3kMqH27t1fJhn5
 u6t6g6ohr5gXuT8X6v5v90XEaDGgUb6cKN0BsVkxqK9gKgCxQ/8/8o6W1FcZJKzn1fkd
 cZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GnN//iNBgEBYqHZHMGXDVVVN0pCq+iqj8cvIQQHM9Gg=;
 b=kGaCDE0cg9WRADcixzudslacbk+hXiY/fhyTF7rgP1cEDAsy/k62GTeoC5TBV131vH
 442oN18T0zh45irmYAQDKqTSjp6Phw3xkEmRbdWcOuCvQXmox+R0Ywpmp1Ren/qi1D9x
 ZKO2c2RXieUM/xqgVXDr1CPigFCHNVeAOrOi/gTH3Pp/QEeE5FnDwkP7WfpI9d0fVkcE
 W4fCTi60Cy4Aa1qW2hJ1NfJCiCbyBYBMvm0DbAqNbCCMKVUlQTAzW0yzUU69cv/Z9r+b
 gbtJSkGmvmLAPMXxyUT52UO3xzKaVgXqcBH0woG4H4UCQaedkvxfyTfYOWjtn/IZT7FM
 UE4w==
X-Gm-Message-State: AOAM531OJ7myBzD03ZDx93mQa7X7RpTHSE9l6IeGSMC9mvwulgQa0qm7
 x8l2aRCjN+bf7l1SXkGbxe6SH7dYB9E=
X-Google-Smtp-Source: ABdhPJy6O+x0pwNu17qHxqZTRaUnB8XyovObW0dkRbsOkoOPrk3aad1lIjGzWa29qZen+mhWf6eTtA==
X-Received: by 2002:a62:844e:0:b029:309:a88f:f8e8 with SMTP id
 k75-20020a62844e0000b0290309a88ff8e8mr23703208pfd.26.1625005203937; 
 Tue, 29 Jun 2021 15:20:03 -0700 (PDT)
Received: from bobo.ibm.com (220-244-87-52.tpgi.com.au. [220.244.87.52])
 by smtp.gmail.com with ESMTPSA id l7sm19316583pgb.19.2021.06.29.15.20.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jun 2021 15:20:03 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/9] powerpc: fast interrupt exit bug and misc fixes
Date: Wed, 30 Jun 2021 08:19:48 +1000
Message-Id: <20210629221957.1947577-1-npiggin@gmail.com>
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

Since v1:
- Fixed a bisection compile error due to a fix incorrectly going to
  a later patch.
- Fixed the "add a table of implicit soft-masked addresses" patch to
  include the low scv vector range as a soft-masked table entry. scv
  was the original reason for implicit soft masking, and the previous
  version breaks it. My stress testing was using an image without
  scv glibc unfortunately.
- Fixed a bug with the same patch that would restore r12 with SRR1
  rather than HSRR1 in the case of masked hypervisor interrupts after
  searching the soft-mask table. Again unfortunately my stress testing
  was in a guest so no HV interrupts.

Thanks to Michael for noticing these issues.

- Pulled in the hash page fault interrupt handler fix into this series
  to make the dependencies clear (well it's not exactly dependent but
  assertions introduced later make the existing bug crash more often).

This survives overnight stress testing on a bare metal scv capable
system :)

Thanks,
Nick

Nicholas Piggin (9):
  powerpc/64s: fix hash page fault interrupt handler
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

 arch/powerpc/include/asm/interrupt.h  | 41 +++++++++---
 arch/powerpc/include/asm/ppc_asm.h    |  7 +++
 arch/powerpc/kernel/exceptions-64e.S  | 23 +++----
 arch/powerpc/kernel/exceptions-64s.S  | 64 ++++++++++++++++---
 arch/powerpc/kernel/interrupt_64.S    | 90 ++++++++++++++++++---------
 arch/powerpc/kernel/irq.c             |  1 +
 arch/powerpc/kernel/vmlinux.lds.S     |  9 +++
 arch/powerpc/lib/restart_table.c      | 26 ++++++++
 arch/powerpc/mm/book3s64/hash_utils.c | 24 ++++---
 9 files changed, 212 insertions(+), 73 deletions(-)

-- 
2.23.0

