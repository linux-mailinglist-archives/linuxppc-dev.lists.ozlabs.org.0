Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B08E3CEFE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 16:39:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NXhk3TVMzDqWl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 00:39:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="H3A+1+N2"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NXYf53KKzDqL2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 00:33:42 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id g21so5229001plq.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 07:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dmycij1U1AfCGJ1oJ7aJSIosKxoi1TvoHmvtglo4YNA=;
 b=H3A+1+N2W1N7ql+9FYf2/nmhec4c8RhD/5FEKcMFB9QUqpJjId3b/Pp0VCART/MVeX
 /AUQ4rki8QkEMp8YszJmd++pe6ScIuZ6Kgm++aKDby91WEIvjSYBTHv2ZGbGG4sWAf5/
 65GwQWQ7g8MnZV29d0ONybuYDWRfLnxwH0By19no8S25A4pIc27mgIoXVIi9lRClgTKF
 CY8p63Z6srBuCKRE9RfuIKFIOjcsJb76akDuzuJWHg8Z8qWDyswqsAt76WU1KkBk/gV2
 8AXlrkhoiRStJWC+SuCOZdmMAqb0dmx4vAY9bG+1sQmpV8kKFoWUgWZAncvEyVDnXsx7
 u0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dmycij1U1AfCGJ1oJ7aJSIosKxoi1TvoHmvtglo4YNA=;
 b=EmZ/fxrLPxjVmXEYv0H7/CxCd/Ep8tt3Uc75BS14563qMq9ZCENEMg2iWavZxN20oL
 sZdbL29w6Kl7GRe1nUqUEgNHF81Dfj7+h/pVzfqDHf3BORDEn7EzmTappl5XqnptnEHG
 WLRVDEKpk8Eedn0xvyNUeWxdOxCv+XNRNhbcUrspWH+5Ag1TShLCMrUPcMgrGh66OT74
 iPZwH/ZMuYmiJZz9cxrLxinQyhM8wNFrE4nMxT9af9mDseHfO62ThZF5duBxkMhC0pJ3
 c9DJi7qYePQdhoMFVaRfUKv+l2rKKzd1tI5mjYlz9JWFYx5Q5VBdJ9k/NmXoz5JCLwkn
 m5Sg==
X-Gm-Message-State: APjAAAWsnMTkPDW3C9jvUSjVSU/xtd9WGtUg2lQkdGxyQaiNiCKJDY3d
 7IpQcVBbUdxKqjU+IuUKOMYzO5nx
X-Google-Smtp-Source: APXvYqxgPxUr+3z3YiiYUb/GNyZJSgRW99sdT+fZrSObNlBs00/VNFfSTwvrSf0smtKS51wG0mmO9w==
X-Received: by 2002:a17:902:b905:: with SMTP id
 bf5mr76769652plb.155.1560263618351; 
 Tue, 11 Jun 2019 07:33:38 -0700 (PDT)
Received: from bobo.local0.net (242.60.168.202.static.comindico.com.au.
 [202.168.60.242])
 by smtp.gmail.com with ESMTPSA id a16sm25345568pfd.68.2019.06.11.07.33.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 07:33:37 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 00/28] powerpc/64s interrupt handler cleanups, gasification
Date: Wed, 12 Jun 2019 00:30:12 +1000
Message-Id: <20190611143040.7834-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
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

This is another revision of the previous series rebased to upstream,
fixes, additions, and more testing.

Code changes were tested mostly with ppc64le_defconfig config, diffing
head_64.o from each build.

Most patches cause no changes to generated code, though a few at the
end make significant changes. The bad_stack change in particular is
quite significant, it helps enable future series which goes further in
rewriting interrupt handler code, so I include it here, would be nice
to get out of the way.

Results are best judged by looking at the final result. There is still
some way to go, but at least now almost everything required to explain
exception code generation is contained in one file, and usually only a
couple of layers of macro deep.

Thanks,
Nick

Nicholas Piggin (28):
  powerpc/64s/exception: fix line wrap and semicolon inconsistencies in
    macros
  powerpc/64s/exception: remove H concatenation for EXC_HV variants
  powerpc/64s/exception: consolidate EXCEPTION_PROLOG_2 with _NORI
    variant
  powerpc/64s/exception: move and tidy EXCEPTION_PROLOG_2 variants
  powerpc/64s/exception: fix sreset KVM test code
  powerpc/64s/exception: remove the "extra" macro parameter
  powerpc/64s/exception: consolidate maskable and non-maskable prologs
  powerpc/64s/exception: merge KVM handler and skip variants
  powerpc/64s/exception: KVM handler can set the HSRR trap bit
  powerpc/64s/exception: Make EXCEPTION_PROLOG_0 a gas macro for
    consistency with others
  powerpc/64s/exception: Move EXCEPTION_COMMON handler and return
    branches into callers
  powerpc/64s/exception: Move EXCEPTION_COMMON additions into callers
  powerpc/64s/exception: unwind exception-64s.h macros
  powerpc/64s/exception: improve 0x500 handler code
  powerpc/64s/exception: move EXCEPTION_PROLOG_2* to a more logical
    place
  powerpc/64s/exception: remove STD_EXCEPTION_COMMON variants
  powerpc/64s/exception: move KVM related code together
  powerpc/64s/exception: move exception-64s.h code to exception-64s.S
    where it is used
  powerpc/64s/exception: move head-64.h code to exception-64s.S where it
    is used
  powerpc/64s/exception: remove __BRANCH_TO_KVM
  powerpc/64s/exception: use a gas macro for system call handler code
  powerpc/64s/exception: fix indenting irregularities
  powerpc/64s/exception: generate regs clear instructions using .rept
  powerpc/64s/exception: remove bad stack branch
  powerpc/64s/exception: remove pointless EXCEPTION_PROLOG macro
    indirection
  powerpc/64s/exception: move paca save area offsets into
    exception-64s.S
  powerpc/64s/exception: clean up system call entry
  powerpc/64s/exception: avoid SPR RAW scoreboard stall in real mode
    entry

 arch/powerpc/include/asm/exception-64s.h |  609 +----------
 arch/powerpc/include/asm/head-64.h       |  204 +---
 arch/powerpc/include/asm/paca.h          |    2 +
 arch/powerpc/kernel/asm-offsets.c        |    2 +
 arch/powerpc/kernel/exceptions-64s.S     | 1253 ++++++++++++++++------
 arch/powerpc/xmon/xmon.c                 |    2 +
 6 files changed, 955 insertions(+), 1117 deletions(-)

-- 
2.20.1

