Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 702F05E9849
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 05:42:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbT8p2gTnz3cdk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 13:42:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bOVd6Cmd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bOVd6Cmd;
	dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbT7Y4CMLz2yph
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 13:41:11 +1000 (AEST)
Received: by mail-pj1-x1033.google.com with SMTP id q35-20020a17090a752600b002038d8a68fbso11183327pjk.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Sep 2022 20:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=Cc9ZpB/FXVPghqlTHEojQhfU+/E86DKj1XAmtnn1wQk=;
        b=bOVd6Cmdw9FmXmSizyxH7Zh0fire6s2tD/yfTKwAQeu084KXltm7/Tb2JT6tf161VW
         9WuR6+DyYwKo5PnbChwzYP3foSYUiDOkU6ENeatBCoBIKuBOc7geVXs0CaPWFH6HYOCo
         eKLKvGK/lf5EXiATWySY1ZYUfACCbWFbGDnCyXMH4eH/zQPwIjsdZqiJ9CZpMNLWdwmp
         iG8PVqL2sp9TMZfqG3bgoBiKQ8aL0SEjPj8WcUXkQFO2ByV/iBJeOf9TAi7obJEXGG9n
         +w6fZy2qNM13+cNTmbDxQSQ0WODSVgCxeJRnfjVYpguZ3Rt4B1h3Ojwe71H4s4ckO38y
         jTXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=Cc9ZpB/FXVPghqlTHEojQhfU+/E86DKj1XAmtnn1wQk=;
        b=bASg0RswvgboYtIuQJKWQK9wQCkYGiOJVRHCvC1gzWByF1YZQAntnlQ4PrHaveWkum
         WlZk/zPZ6TSWHvEeuPLHnvQCG7+gn3C3WuS3j9b740vqkfVaOFpwMcURRhuiEl3DF91G
         7TUgarYllwz6NYTJAkUaWl9wRlT2vsYL3iNwdVefNHaipHqvpSoQca2pHwBkY6L4/NqD
         fQvwwAMqWRmEjJsEEgDWTLZjc3/Yi9p9+YZqYuCVADIBtx1hYwBxkO+ObFZcdQTJaclg
         dte5d+SZ82/egY6JBredavLMk82IvqqwtEcy49b/s3dpEFJ7aekcGwBf3cya+8WzGHRp
         iIsg==
X-Gm-Message-State: ACrzQf0A7SpiuJYDd1k6bMPED/VFihW3dfLqx2h488it2ufLmWpDG/f5
	hB+d+zlQB5pkHDUVawh7KZSdSeUEnjM=
X-Google-Smtp-Source: AMsMyM5v+zU+DIIzz1P95rCUzNXiX+QSDACnmlUn600EcfQe+ThzcDkLbMg6Laa6TRZNR9ItA/yIcw==
X-Received: by 2002:a17:90b:1b0b:b0:205:9926:3a6b with SMTP id nu11-20020a17090b1b0b00b0020599263a6bmr12401524pjb.139.1664163666829;
        Sun, 25 Sep 2022 20:41:06 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (27-32-155-116.static.tpgi.com.au. [27.32.155.116])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902710300b001746f66244asm10122907pll.18.2022.09.25.20.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 20:41:05 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/5] powerpc/64: avoid GOT addressing, don't put data in TOC
Date: Mon, 26 Sep 2022 13:40:52 +1000
Message-Id: <20220926034057.2360083-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>, Alan Modra <amodra@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a cleaned up set of the initial prep patches from the pcrel
series, dealing with regularising addressing variables from asm
and using helper macros more consistently.

Changes since v1:
- Use "REGS" stack frame marker for 64-bit, leaving 32-bit unchanged.
- Fix PPC64 32-bit boot wrapper compile.

Nicholas Piggin (5):
  powerpc/64: use 32-bit immediate for STACK_FRAME_REGS_MARKER
  powerpc/64: asm use consistent global variable declaration and access
  powerpc/64: switch asm helpers from GOT to TOC relative addressing
  powerpc/64: provide a helper macro to load r2 with the kernel TOC
  powerpc/64e: provide an addressing macro for use with TOC in alternate
    register

 arch/powerpc/boot/opal-calls.S                |  6 ++--
 arch/powerpc/boot/ppc_asm.h                   | 10 ++++++
 arch/powerpc/include/asm/ppc_asm.h            | 20 ++++++++++-
 arch/powerpc/include/asm/ptrace.h             |  4 +--
 arch/powerpc/kernel/entry_32.S                |  6 ++--
 arch/powerpc/kernel/exceptions-64e.S          | 34 ++++++++-----------
 arch/powerpc/kernel/exceptions-64s.S          |  8 ++---
 arch/powerpc/kernel/head_64.S                 | 11 ++----
 arch/powerpc/kernel/interrupt_64.S            | 28 +++++----------
 arch/powerpc/kernel/optprobes_head.S          |  2 +-
 arch/powerpc/kernel/swsusp_asm64.S            | 16 +++------
 arch/powerpc/kernel/trace/ftrace_low.S        |  2 +-
 arch/powerpc/kernel/trace/ftrace_mprofile.S   |  6 ++--
 arch/powerpc/kernel/vector.S                  | 15 ++++----
 arch/powerpc/kvm/book3s_64_entry.S            |  2 +-
 arch/powerpc/kvm/book3s_hv_rmhandlers.S       |  4 +--
 arch/powerpc/kvm/tm.S                         |  2 +-
 arch/powerpc/lib/copypage_64.S                |  7 +---
 arch/powerpc/lib/string_64.S                  |  7 +---
 arch/powerpc/mm/nohash/tlb_low_64e.S          |  4 +--
 arch/powerpc/perf/bhrb.S                      |  2 +-
 .../powerpc/platforms/powernv/opal-wrappers.S |  2 +-
 arch/powerpc/platforms/pseries/hvCall.S       |  4 +--
 arch/powerpc/xmon/spr_access.S                |  4 +--
 24 files changed, 96 insertions(+), 110 deletions(-)

-- 
2.37.2

