Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6041F5E7269
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 05:25:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYcxH0qT1z3cfT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 13:25:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=L2ZJ0YTd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=L2ZJ0YTd;
	dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYcwh3rfFz30R7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 13:25:23 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id c7so11042181pgt.11
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 20:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=d9XGKc/u3AIBL2uHRCydNMZf+6w0g+tEuAC941fH7Vg=;
        b=L2ZJ0YTdhhkUpC/7eBn+2TijdMspcFs61XZJWNkyuupoyuctEtt6ze88zLQllpFEjH
         DUO9++jbiCVqtrGX0F97gaGstNyi9EFgJvGyT335QqeQXGAqOjOVDXBhe/4x6rKTrV1q
         SzIvlJZoe140Zvb95NthAIc5sEp1BDW8aMhi8V6iHrn/uwTPs3mDHTSCn8/IlX1Z4CA0
         8c69aLD7fRnUZigu9sENBxAwX6vOCvKt0v39+XKfNanNzJg62C0Ju+2tBLGLsQnrNqOP
         CAOT2Mrn9DAWtYwN6XxEK8NWUiLaesn6S6MQ8N7LuNYOiYq0zieimdIrLJ0sNPfd4tL4
         WaIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=d9XGKc/u3AIBL2uHRCydNMZf+6w0g+tEuAC941fH7Vg=;
        b=TB4eY+DW8MF5Ne6h55P9dxogVk4Wz4nXJVdWvkWjPFS6V8eRrNYBi3GEgcod46Vlb6
         GX6R4XT/A8183SbWxLz5NX5L4aWR/wh81w2/MWFdJePmCt5efAyTkh7QfiMFy/XjIxf1
         mUmLNM9FH/1MlxvZLS3+S17JLC5YUBFOOpYzUoZXImUzqNM05oVb+AvspfdDSW93TcnL
         CdXkfyCpLY4AyEdQIS4yIch2xjUY0gEXoCXKXGNedUpnBxi/TfwcvLu/TIOYP1bci/Cv
         ixvYJ0DH6IRn0M96HfXsZXp8p/t0rdyfvC5qj0LrjlQq+hAdMvHT/CMQM2TCPL9ezYJM
         sX4w==
X-Gm-Message-State: ACrzQf1DyrLdRg0D8XnNT1DOnYFgigoOZzKXAdEw+sIyc7rZ8ukGJiRV
	weFkJafS/3hW44zPhcnbKEfiyh8ZQnw6ew==
X-Google-Smtp-Source: AMsMyM6vdjEIyicbbI5IqtW8mgsa6g5HyPT7L6qfwZ5C8txvUJWBn4nGtNqoF01E4yWjhYwZrOP+7g==
X-Received: by 2002:a63:f353:0:b0:43c:3b4c:84cb with SMTP id t19-20020a63f353000000b0043c3b4c84cbmr2274080pgj.298.1663903521182;
        Thu, 22 Sep 2022 20:25:21 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (27-32-155-116.static.tpgi.com.au. [27.32.155.116])
        by smtp.gmail.com with ESMTPSA id q3-20020a170902f78300b001752216ca51sm4895224pln.39.2022.09.22.20.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 20:25:20 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/5] powerpc/64: avoid GOT addressing, don't put data in TOC
Date: Fri, 23 Sep 2022 13:25:07 +1000
Message-Id: <20220923032512.535725-1-npiggin@gmail.com>
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

Nothing really new, this is more complete, splits out the changes
more logically, adds changelog/comments, and avoids touching ppc32
much (only slight comment change and interrupt stack magic number
change).

Patch 2 is probably actually required before we make the TOC readonly
at runtime, because there is one case (hcall_tracepoint_refcount)
that puts read-write data in the TOC section.

Thanks,
Nick

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
 arch/powerpc/include/asm/ptrace.h             |  5 +--
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
 24 files changed, 97 insertions(+), 110 deletions(-)

-- 
2.37.2

