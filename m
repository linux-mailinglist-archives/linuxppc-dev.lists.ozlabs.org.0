Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C8A4C6BC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 07:19:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Tqqb3qm4zDqD0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 15:19:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="fIrEpsAi"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Tqks669VzDqtp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 15:15:01 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id p184so962969pfp.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 22:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ei3SP30CEUBiwK1+xbruAz3DEc79ceG5FnZmM/o/KE8=;
 b=fIrEpsAiyi1rJbrkHgUOgBcCeoDwLRPvXRdzmJCjimxY/oQYn6itkWlDwb1HME1YCv
 nMRunNzreyY3aoLYQZdqhMQH4VikIjq2oQmblOTTAfbnbH1rXWLdXMFEvVuwfvuLd689
 htY4xh7r5HkJ4ihLOgcmHTy35dIsVQn/TsBHMXqfhoXJxuHdPyImV1SU8l/5xwE/yH4z
 0uEW9g30pL0KAWR8xGwbOHURMD5F5GcJ7n2jsJvNTYJ6/rMfFOQ8a9bEaAHRqXHPXYpC
 bTgSbGLdkacm4Ejoxoe242OZ1wu6k7hiJvqWihPwpapnem/PJdN9FqGY5DRK2OB+yJJw
 39RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ei3SP30CEUBiwK1+xbruAz3DEc79ceG5FnZmM/o/KE8=;
 b=thuDLbWtq8KDcW9TxQHoP6O4FGQCcA3QHpukcvmvFeZYRkPF//94zauQYe2b1pWYDe
 O4yv8dqOJ7HcU7NHDSB2PqkhXYT+d/2mEAWwT2zXKZ9drDURj2b17Qs8SIWB27+dCOSh
 eHNDszqzMdAIff4ftGxc0F+M4lMFQdmCGXG4YPRLDkfE61/W28nJ9B/HhIq7jBlE0axs
 Jhtrat5bHaN8Syf+ok+49BMKU0RI3DCmCYLOZTleyXLwMbcUPJ3pAEL/dlK14uAjG5zu
 x0SHBNteCvma1gfQIM8XeBikZ8eFXowsOLcbOYhUhNay7grdl1TkzhH+q91iCChFEpR5
 0qzw==
X-Gm-Message-State: APjAAAXAh2mrF/Z5pECALuzqQj6GOQuvS0ImC+ObR/mY9PGBWNCF37Ud
 pGR1oqP0bgYwSY8vho4yAJkn1Bio
X-Google-Smtp-Source: APXvYqyZs/VS4z9HZ42Tfql9ziC1ZL0HJ7WlZAe3UvQVp6KcEmBmK91qB2drtaoQ8HTW+JMJ97FcaA==
X-Received: by 2002:a63:1c59:: with SMTP id c25mr11085388pgm.395.1561007697166; 
 Wed, 19 Jun 2019 22:14:57 -0700 (PDT)
Received: from bobo.local0.net (193-116-72-140.tpgi.com.au. [193.116.72.140])
 by smtp.gmail.com with ESMTPSA id
 h12sm8235847pje.12.2019.06.19.22.14.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 22:14:56 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 00/52] powerpc/64s interrupt handler cleanups, gasification
Date: Thu, 20 Jun 2019 15:14:07 +1000
Message-Id: <20190620051459.29573-1-npiggin@gmail.com>
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

This contains the previous 28 series in front, with one small fix
mentioned in the last thread, plus one extra patch to remove
unused BRANCH_TO_COMMON macro, so first 29 up to SPR RAW scoreboard
are all quite minimal generated code change.

The next patches start to get a bit more into code change, starting
to mainly attack the "odd" handlers which deviate significantly
from the norm (sreset, machine check, still have pending work to
do on hmi). The aim is to simplify them and make them more regular.
That makes maintaining easier, and also reduces the need to have
a lot of special cases and splits in macros, which helps further
cleanup in future.

After patch 19 I should add it's so much more pleasant to hack on
this code, you don't have to rebuild practically the whole kernel
whenever you change anything.

Oh I also got a KUAP fix in there we should backport.

Thanks,
Nick

Nicholas Piggin (52):
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
  powerpc/64s/exception: remove unused BRANCH_TO_COMMON
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
  powerpc/64s/exception: optimise system_reset for idle, clean up
    non-idle case
  powerpc/64s/exception: mtmsrd L=1 cleanup
  powerpc/64s/exception: windup use r9 consistently to restore SPRs
  powerpc/64s/exception: move machine check windup in_mce handling
  powerpc/64s/exception: simplify hmi windup code
  powerpc/64s/exception: shuffle windup code around
  powerpc/64s/exception: use common macro for windup
  powerpc/64s/exception: add dar and dsisr options to exception macro
  powerpc/64s/exception: machine check use standard macros to save
    dar/dsisr
  powerpc/64s/exception: denorm handler use standard scratch save macro
  powerpc/64s/exception: move SET_SCRATCH0 into EXCEPTION_PROLOG_0
  powerpc/tm: update comment about interrupt re-entrancy
  powerpc/64s/exception: machine check fwnmi does not trigger when in HV
    mode
  powerpc/64s/exception: machine check early only runs in HV mode
  powerpc/64s/exception: separate pseries and powernv mce delivery paths
  powerpc/64s/exception: machine check windup restore cfar for host
    delivery
  powerpc/64s/exception: fix machine check early should not set AMR
  powerpc/64s/exception: machine check restructure handler to be more
    regular
  powerpc/64s/exception: simplify machine check early path
  powerpc/64s/exceptions: machine check move unrecoverable handling out
    of line
  powerpc/64s/exception: untangle early machine check handler
  powerpc/64s/exception: machine check improve branch labels
  powerpc/64s/exception: add missing branch to self after RFI

 arch/powerpc/include/asm/exception-64s.h |  609 +-------
 arch/powerpc/include/asm/head-64.h       |  204 +--
 arch/powerpc/include/asm/paca.h          |    2 +
 arch/powerpc/kernel/asm-offsets.c        |    2 +
 arch/powerpc/kernel/exceptions-64s.S     | 1764 ++++++++++++++--------
 arch/powerpc/kernel/tm.S                 |    4 +-
 arch/powerpc/xmon/xmon.c                 |    2 +
 7 files changed, 1161 insertions(+), 1426 deletions(-)

-- 
2.20.1

