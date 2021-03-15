Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D0833A9DE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 04:18:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzM7Y1HSQz3ckQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 14:18:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=dT5axvtK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434;
 helo=mail-pf1-x434.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dT5axvtK; dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzM6g6JdRz30Gp
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 14:17:30 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id x7so5695047pfi.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Mar 2021 20:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jzR8ErWfNRx1JHHZNtVy6/YcPMkh5LidPDohsPOcWzQ=;
 b=dT5axvtKi7PkztZEkyV12/VAQaOmCodxwcQdYPxKKV5lPsQ10yoVPIEfnSFx4lFr53
 7NXJVsfixMqyRn/64NUPALFevQLmPJXk1vfDXJZjL1NhEQ++cVSEI4ThNET+nqRrxjvs
 dd9qpTqXOOtEdYAbY1Ouxq6pj0skXMbZKUAA+6bnHz/oPQ9yjfpUlcNX/pwQFu0PIUli
 3wqNGL2mN+RLb0QA+jKfJrjuKw3cf6aCZU7x2bDyPoMYY7GQC9+Z1LNjvTA2D0YbP9jj
 lXGfYRsIKeozJnYj8Jqw0t9m1ox/TR4u8g57moAYob+El83rmdvv1QuxBSsB8RcpBHyp
 Un5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jzR8ErWfNRx1JHHZNtVy6/YcPMkh5LidPDohsPOcWzQ=;
 b=CIuxaPp+gKdOEwYx4UHhQxfRALkxqWs/oRz4RkbFPPnMzW9HQB7wdmB1ATHxUtEPpZ
 7l1wrL5CvA8DbMZzqmNQAhyB7IBlb5bWsZwrJdCt+AJohIGArNxb/vcmz4jMWrzDZ7YC
 83Je16xMRQSzpI2oIZV9E9RbTykwZuOVEDntfewlMGLKswS4PAtL4JgOi0yDRsEQAhcg
 GulNFqWjX+YXRg81fxjeNAjUDFrffwF9nqnewyAxWfwz1UhkvhUQVbY/hJmEiuFoQK95
 DEncYgm/sdrlKc7YSaKBL4vcOdsKZu32V6SaW2Uc/OMC/8zhmnqO0lzETiLKbSPhNeuW
 IBsQ==
X-Gm-Message-State: AOAM530ocErj5HzBxBGaTFIvkD3IWB1wdDSJJ+r+i0iEamu0/R3WP081
 yIGGbxn+OgQQ1QqnPH8exJt23j52lgQ=
X-Google-Smtp-Source: ABdhPJxhTN8RjDRg+IZXcZQq+Yj+pQflGEJQ9ey7DRlTfEJq+KtoEccPcwoi+YZ11R5ju4RsRDQPiA==
X-Received: by 2002:aa7:99c4:0:b029:1f6:c0bf:43d1 with SMTP id
 v4-20020aa799c40000b02901f6c0bf43d1mr22296467pfi.37.1615778244965; 
 Sun, 14 Mar 2021 20:17:24 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id
 j22sm8517740pjz.3.2021.03.14.20.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 20:17:24 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 00/10] Move 64e to new interrupt return code
Date: Mon, 15 Mar 2021 13:17:06 +1000
Message-Id: <20210315031716.3940350-1-npiggin@gmail.com>
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
Cc: Scott Wood <oss@buserror.net>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since RFC this is rebased on Christophe's v3 ppc32 conversion, and
has fixed up small details, and then adds some powerpc-wide
cleanups at the end.

Tested on qemu only (QEMU e500), which is not ideal for interrupt
handling particularly the critical interrupts which I don't know
whether it can generate.

Thanks,
Nick

Nicholas Piggin (10):
  powerpc/syscall: switch user_exit_irqoff and trace_hardirqs_off order
  powerpc/64e/interrupt: always save nvgprs on interrupt
  powerpc/64e/interrupt: use new interrupt return
  powerpc/64e/interrupt: NMI save irq soft-mask state in C
  powerpc/64e/interrupt: reconcile irq soft-mask state in C
  powerpc/64e/interrupt: Use new interrupt context tracking scheme
  powerpc/64e/interrupt: handle bad_page_fault in C
  powerpc: clean up do_page_fault
  powerpc: remove partial register save logic
  powerpc: move norestart trap flag to bit 0

 arch/powerpc/include/asm/asm-prototypes.h |   2 -
 arch/powerpc/include/asm/bug.h            |   4 +-
 arch/powerpc/include/asm/interrupt.h      |  66 ++--
 arch/powerpc/include/asm/ptrace.h         |  36 +-
 arch/powerpc/kernel/align.c               |   6 -
 arch/powerpc/kernel/entry_64.S            |  40 +-
 arch/powerpc/kernel/exceptions-64e.S      | 425 ++--------------------
 arch/powerpc/kernel/interrupt.c           |  22 +-
 arch/powerpc/kernel/irq.c                 |  76 ----
 arch/powerpc/kernel/process.c             |  12 -
 arch/powerpc/kernel/ptrace/ptrace-view.c  |  21 --
 arch/powerpc/kernel/ptrace/ptrace.c       |   2 -
 arch/powerpc/kernel/ptrace/ptrace32.c     |   4 -
 arch/powerpc/kernel/signal_32.c           |   3 -
 arch/powerpc/kernel/signal_64.c           |   2 -
 arch/powerpc/kernel/traps.c               |  14 +-
 arch/powerpc/lib/sstep.c                  |   4 -
 arch/powerpc/mm/book3s64/hash_utils.c     |  16 +-
 arch/powerpc/mm/fault.c                   |  28 +-
 arch/powerpc/xmon/xmon.c                  |  23 +-
 20 files changed, 130 insertions(+), 676 deletions(-)

-- 
2.23.0

