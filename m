Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C83034F5DC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2019 15:19:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45WGPQ67HtzDqNs
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2019 23:19:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Idr03b5b"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45WGKB2CL8zDqZw
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2019 23:16:11 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id ay6so4320723plb.9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2019 06:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QL1uDgv4erMWTBmggilBBtmiw/GulpX5jeFU7R2cQYA=;
 b=Idr03b5bxsC7ooc62sDFAiUK7kzRmf1X75r0AN3ObZMmMGxWz880G5zltctZzqvdGB
 B8C7nE0FwmpibRcSUhOty7b1c7qAITfMTHiT0AuDuWeRjOijUrE8oA5aw+5e7umayPTh
 w00r8FmIAGnErOxLLBhO6hZ9JRXIYeINczJT6tScUyFHwKl/TvqRYbu9fJIN5YTJO7Qs
 j/DmCAJT8BFM141qVhKmKFwgPZ1qTs8KC3bbvnDAa+UcFRxc2LFRa8UjolfqjWU/b2C0
 JY8o/j7xqiHftVMsufoeinpHA3/4YTMghxZWKaEiddmvKIE8TclsGa7BoZ6GUgvqDzCY
 Wl4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QL1uDgv4erMWTBmggilBBtmiw/GulpX5jeFU7R2cQYA=;
 b=jPDWkp3yN3BxXC9od0jhbC0w9I5Vw5OmjmwJ4hGGItXYgmYDJWD5zzkY9HdL8X5lz6
 o4KwCAZ5E2u/I/8rsxOzmX58UWZVpVV9V+jZmR+oyeyha7J1fWJfHO9T0odfZ4v/AVLv
 nF/JYnED5GsqhVLHtJnl8irsK6CEZTCXMMXP/c+LlLO24U5QklDOgTjEW01nFJu3U4s7
 zkn+2Dp19KO3i2M2jL6mpFUcECg5ByfQMTq3I6j1WsF+32VcYwEah2S/3mF4AAzjMpXC
 rhg9dPRFEp876MI2J9FY3X1Qz7gosiBfIQWBnlyPhd4y1y1/N7LP3V4LFCzboufIcLyE
 1hhw==
X-Gm-Message-State: APjAAAVEe3seoFXciT2IOzqCoER1O9/tWoc5RpRq976yzmsd8quoLpj9
 u2tggfvGnjfoSBGcSl/vCkrI4Zi9
X-Google-Smtp-Source: APXvYqwM5UUNxiuPEDv1U9E2X21dbWh7ASHt1JyJF8yzcByiZumdnQwjAGPWThTN5aABAG+ds30Mrw==
X-Received: by 2002:a17:902:148:: with SMTP id
 66mr128501283plb.143.1561209366556; 
 Sat, 22 Jun 2019 06:16:06 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([1.144.136.2])
 by smtp.gmail.com with ESMTPSA id n1sm5192471pgv.15.2019.06.22.06.16.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 22 Jun 2019 06:16:05 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 00/25] powerpc/64s interrupt handler cleanups, gasification
Date: Sat, 22 Jun 2019 23:15:10 +1000
Message-Id: <20190622131535.20996-1-npiggin@gmail.com>
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

One more try at this, sorry for the spam. To reduce the chance of more
problems I've gone back the other way and actually pulled out almost
all the patches that altered generated code, leaving just a couple of
simple cases.

Thanks,
Nick

Nicholas Piggin (25):
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
  powerpc/64s/exception: remove pointless EXCEPTION_PROLOG macro
    indirection
  powerpc/64s/exception: move paca save area offsets into
    exception-64s.S

 arch/powerpc/include/asm/exception-64s.h |  604 +----------
 arch/powerpc/include/asm/head-64.h       |  202 ----
 arch/powerpc/kernel/exceptions-64s.S     | 1170 +++++++++++++++++-----
 3 files changed, 941 insertions(+), 1035 deletions(-)

-- 
2.20.1

