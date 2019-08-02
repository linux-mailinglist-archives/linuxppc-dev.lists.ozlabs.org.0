Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7D87F5A8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 13:02:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460PPs2DC3zDqXq
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 21:02:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ugwpKFrl"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460PLq3YR6zDqxH
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 20:59:45 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id l21so35892175pgm.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Aug 2019 03:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qLk1lH2qzO3UGmPiNB0xpQDneJ0ciNco1cgaBRmX6yo=;
 b=ugwpKFrlJXHyKforDElkraC2gYENKAJUfb6H/mdCst3nUppsRstpJtGzhmsO/8L84h
 v9rTt+rg9sYfp4IDMlM0Amw8/pGyFzmd19jDvnsHoxcJgZm9Y17afQspm4geepDihEG+
 B0AUWG/2SSvGkx5j/tO8Ge2SAdHbjEMDvUQsIQBrHCzENYc7FHxsXztTW/KRUezewG0T
 wwdY5io1vJ0jyWxx9rV34VIGFpzL6Cd34fKwwQxxc1TCSUgYNasfo9fQz+F+XaAqjxAw
 NfoYEmR9M55IHpHxce4+KA9CVTyobW88yhkWuGyRfZKIrG17SRjHd5m01W8xGPQPYBNW
 RfzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qLk1lH2qzO3UGmPiNB0xpQDneJ0ciNco1cgaBRmX6yo=;
 b=s9QG+vdnlpnnz9oDi5JxRr124u6t2xp5f1HS7VntAa/GaXXgaG8ArlZTXBfQVuVHqk
 K9V02SNVgjZvF+aRTCuqsOTktY5fi/kOWNHbqmasIQHmKfsQNuLRhS4jnjVn59tRlq0F
 nHoQQqDIRbgWnRQ9mlvN5fEnXUdYxYOmAqYFf4GHzksFGFWQtgcgvcDdpQuYkks66zqU
 1o0u1FgpG/R3rJ7q0XaCv29CHgecT7obY8sceiYh41Chx4jI2NUD5e2VDO2vwaX2PgZL
 5uzCvQH+lQJTPCYID6B2Qlx2ETvn2arYt2uKIEppOt4zm70Dfi/ZR2duTjQshSB2mbKW
 U8aw==
X-Gm-Message-State: APjAAAU74o8relljcCFH16Y9TU9hDzqImzd3sE/KkETQDjp6xBu/+Ppa
 y0bU61dGyMgSYvqovdWXCLnXrCTeIi8=
X-Google-Smtp-Source: APXvYqzDsLuYIsHZDgiDnJVS8MCFdqjK7IWWH4UklJ3ePwyXODSsmpIbMVPgn3SGIv4eRXD75QY7zg==
X-Received: by 2002:a17:90a:a407:: with SMTP id
 y7mr1101024pjp.97.1564743581455; 
 Fri, 02 Aug 2019 03:59:41 -0700 (PDT)
Received: from bobo.local0.net (193-116-68-11.tpgi.com.au. [193.116.68.11])
 by smtp.gmail.com with ESMTPSA id t96sm7377118pjb.1.2019.08.02.03.59.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 03:59:40 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 00/44] powerpc/64s/exception: cleanup and macrofiy,
Date: Fri,  2 Aug 2019 20:56:25 +1000
Message-Id: <20190802105709.27696-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
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

This series is the combined outstanding series posted previously, plus
a change to a new way to define parameters for interrupt code
generation macros (which is a bit clunky but works better than
alternatives).

This is mostly the end result. There is still a few minor things that
could be done, and possibly we could add a "standard form" macro for
well behaved handlers that don't require any custom code, which blats
out everything (the real and virt vectors, KVM handler, and common
handler stuff) in one line after the definition block. But that's not
really important now.

After this we can start on actually improving the generated code.

Thanks,
Nick

Nicholas Piggin (44):
  powerpc/64s/exception: machine check fwnmi remove HV case
  powerpc/64s/exception: machine check remove bitrotted comment
  powerpc/64s/exception: machine check fix KVM guest test
  powerpc/64s/exception: machine check adjust RFI target
  powerpc/64s/exception: machine check pseries should always run the
    early handler
  powerpc/64s/exception: machine check remove machine_check_pSeries_0
    branch
  powerpc/64s/exception: machine check use correct cfar for late handler
  powerpc/64s/powernv: machine check dump SLB contents
  powerpc/64s/pseries: machine check convert to use common event code
  powerpc/64s/exception: machine check pseries should skip the late
    handler for kernel MCEs
  powerpc/64s/exception: machine check restructure to reuse common
    macros
  powerpc/64s/exception: machine check move tramp code
  powerpc/64s/exception: simplify machine check early path
  powerpc/64s/exception: machine check move unrecoverable handling out
    of line
  powerpc/64s/exception: untangle early machine check handler branch
  powerpc/64s/exception: machine check improve labels and comments
  powerpc/64s/exception: Fix DAR load for handle_page_fault error case
  powerpc/64s/exception: move head-64.h exception code to
    exception-64s.S
  powerpc/64s/exception: Add EXC_HV_OR_STD, which selects HSRR if HVMODE
  powerpc/64s/exception: Fix performance monitor virt handler
  powerpc/64s/exception: remove 0xb00 handler
  powerpc/64s/exception: Replace PROLOG macros and EXC helpers with a
    gas macro
  powerpc/64s/exception: remove EXCEPTION_PROLOG_0/1, rename _2
  powerpc/64s/exception: Add the virt variant of the denorm interrupt
    handler
  powerpc/64s/exception: INT_HANDLER support HDAR/HDSISR and use it in
    HDSI
  powerpc/64s/exception: Add INT_KVM_HANDLER gas macro
  powerpc/64s/exception: KVM_HANDLER reorder arguments to match other
    macros
  powerpc/64s/exception: Merge EXCEPTION_PROLOG_COMMON_2/3
  powerpc/64s/exception: Add INT_COMMON gas macro to generate common
    exception code
  powerpc/64s/exception: Expand EXCEPTION_COMMON macro into caller
  powerpc/64s/exception: Expand EXCEPTION_PROLOG_COMMON_1 and 2 into
    caller
  powerpc/64s/exception: INT_COMMON add DAR, DSISR, reconcile options
  powerpc/64s/exception: move interrupt entry code above the common
    handler
  powerpc/64s/exception: program check handler do not branch into a
    macro
  powerpc/64s/exception: Remove pointless KVM handler name bifurcation
  powerpc/64s/exception: reduce page fault unnecessary loads
  powerpc/64s/exception: Introduce INT_DEFINE parameter block for code
    generation
  powerpc/64s/exception: Add GEN_COMMON macro that uses INT_DEFINE
    parameters
  powerpc/64s/exception: Add GEN_KVM macro that uses INT_DEFINE
    parameters
  powerpc/64s/exception: Expand EXC_COMMON and EXC_COMMON_ASYNC macros
  powerpc/64s/exception: Move all interrupt handlers to new style code
    gen macros
  powerpc/64s/exception: Remove old INT_ENTRY macro
  powerpc/64s/exception: Remove old INT_COMMON macro
  powerpc/64s/exception: Remove old INT_KVM_HANDLER

 arch/powerpc/include/asm/head-64.h     |   41 -
 arch/powerpc/include/asm/mce.h         |    6 +
 arch/powerpc/kernel/exceptions-64s.S   | 2242 ++++++++++++++----------
 arch/powerpc/kernel/mce.c              |   40 +-
 arch/powerpc/kernel/mce_power.c        |    4 +
 arch/powerpc/mm/book3s64/hash_utils.c  |    4 +-
 arch/powerpc/platforms/powernv/setup.c |    9 +
 arch/powerpc/platforms/pseries/ras.c   |  457 ++---
 arch/powerpc/platforms/pseries/setup.c |   24 +-
 9 files changed, 1600 insertions(+), 1227 deletions(-)

-- 
2.22.0

