Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B88C9EA3D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 15:59:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Hr8y2Cg1zDqjb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 23:59:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="C6hb6KkI"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Hr5L5kCczDqg7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 23:56:38 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id y8so11846955plr.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 06:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kxvcmq7qQl6ujRFCorLKhzWIx1eRBU0Xlo49XZPB4aE=;
 b=C6hb6KkIP816+QUhcN0JCt3dapvbQPgB1GB1/RtnSMS/G3kt7cpZToXzSB9+VNmgi7
 j5H4vXlcvofkuOUL1Azn7ixZnnNqRgF2qBDBpW6/M6L/MGAJrrGBgCRpyT1gxnksi0IC
 CMYuG6t0c37AvHRnHBk8FOkOsevYr4I1RBGCJeAddLvga/ts3QtF17stGARB7ykJRtGr
 /sm7OWcPRvjmjyLBicmyglRNe/7rKGwFVVPhggk1Idkl/3SHRd1OtLVvj11aCYAI6Q7m
 Axcoe61uQFreipvuuoMgFg1qLNkdI+0/zqWBtQXAZzS354VgLOdsLpP9vftDIGhPgtPD
 ufBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Kxvcmq7qQl6ujRFCorLKhzWIx1eRBU0Xlo49XZPB4aE=;
 b=lvpG0moxaxp2IbTX38GbKSJopK4tIQ+5l2emkrMiCvbJgLOHaw0DjlI0xStBSSM5Cx
 dUZs3Bd0Mm+ArFmgMSAgEHud3z3T7jqs8iD3C9e9X1oHqpJ3T6ZmXeQ34Cxsp+5DqAwJ
 HpjCMAXlZPH/7cRj50XuErBOaWsqM20MrR+Dvt3lUINApfMQaOTuxBJK7zVkp/QlLO5Y
 5bTuveKqZNVcUh9p5UGll9irYOGWC3648hhp94TQ9V69qOK0+YFwHdMQ2Vhk4mdw5ea4
 ZQLiX+p4B3E0shgt4Ae0We3HHAvG9FipLvtvAAMPST8M6GPOdxjHnRKsTo9E+Ro2aBvD
 OqBg==
X-Gm-Message-State: APjAAAXbChdCHuBOdGfNk29MkyfbzcJblY0Jx1+llT8qc6wwQ4Atn2La
 ++KfTnyeOtCai1wSCZzZ3s/fJs4L
X-Google-Smtp-Source: APXvYqwZoh9OQ7sr8037w1UDz3ZrwvXiCnEJmZK23BSKgDfvCdNrCQZ+yZskz3ZRtz+QmErSSf6s1Q==
X-Received: by 2002:a17:902:7b97:: with SMTP id
 w23mr11000282pll.283.1566914195812; 
 Tue, 27 Aug 2019 06:56:35 -0700 (PDT)
Received: from bobo.local0.net (14-202-91-55.tpgi.com.au. [14.202.91.55])
 by smtp.gmail.com with ESMTPSA id m9sm15988764pfh.84.2019.08.27.06.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 06:56:35 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/4] powerpc/64: syscalls in C
Date: Tue, 27 Aug 2019 23:55:44 +1000
Message-Id: <20190827135548.21457-1-npiggin@gmail.com>
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

Accounted for some feedback.

Nicholas Piggin (4):
  powerpc: convert to copy_thread_tls
  powerpc/64: remove support for kernel-mode syscalls
  powerpc/64: system call remove non-volatile GPR save optimisation
  powerpc/64: system call implement the bulk of the logic in C

 arch/powerpc/Kconfig                          |   1 +
 arch/powerpc/include/asm/asm-prototypes.h     |  11 -
 .../powerpc/include/asm/book3s/64/kup-radix.h |  12 +-
 arch/powerpc/include/asm/cputime.h            |  22 +
 arch/powerpc/include/asm/ptrace.h             |   3 +
 arch/powerpc/include/asm/signal.h             |   2 +
 arch/powerpc/include/asm/switch_to.h          |   5 +
 arch/powerpc/include/asm/time.h               |   3 +
 arch/powerpc/kernel/Makefile                  |   3 +-
 arch/powerpc/kernel/entry_64.S                | 421 +++---------------
 arch/powerpc/kernel/exceptions-64s.S          |   2 -
 arch/powerpc/kernel/process.c                 |   9 +-
 arch/powerpc/kernel/signal.h                  |   2 -
 arch/powerpc/kernel/syscall_64.c              | 177 ++++++++
 arch/powerpc/kernel/syscalls/syscall.tbl      |  22 +-
 15 files changed, 307 insertions(+), 388 deletions(-)
 create mode 100644 arch/powerpc/kernel/syscall_64.c

-- 
2.22.0

