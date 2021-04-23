Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E086D368B6F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 05:11:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRK7t6Ld8z30CC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Apr 2021 13:11:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Qo9ajUXf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d;
 helo=mail-pg1-x52d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Qo9ajUXf; dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRK7T2PTHz2xgH
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Apr 2021 13:11:16 +1000 (AEST)
Received: by mail-pg1-x52d.google.com with SMTP id b17so34266533pgh.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 20:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5qP51IUMwVKpInh9XIxiEbi7ReiIYqD6ZZayOcWFHuA=;
 b=Qo9ajUXf1uRFyLHe23ym8TQgMxbZp85k5T6PIOxtjj3ZPnZ7JYfsoAx1uwivKJPnG+
 H+QFxPF1echM27u3ZAV/wAcESYeHkkMajNIWuC2S5SkGvgsaQRGog5I7EYFSAfuYLYVd
 y3nNMDiQaKdrrc5a2QcX29LAvkEX/poYThNJsSu+RcX2hWlxyUsNxNx9FKqRXIzd1zJt
 AVu4x5QOfw0CfmorEgEOBpybYVAk+dhWsaos2EY50vUtSH+besDpIY4DkSbjKi8757Bc
 DD2zqYCQsU1A+8NGnz1L2ryYKnvozAYVkoNhIeed1jK5xuP8lQa25oqHeD6Rw39V2qOj
 cYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5qP51IUMwVKpInh9XIxiEbi7ReiIYqD6ZZayOcWFHuA=;
 b=pKHngjaaFawtF4qDuwvnSZvTFx/wxRBu+SwqdjgZndw2p19FXaMdFRA2Mjxm7vE7vY
 gjdLvHGdwTD05xv3LHG5l66Glx86DG7jAna/oh11DrCHX7fYqzph2NPH6RudVDu0UlGP
 c04LNgv4DSCwQEsTaTIHWJ2+6GQBsBcpEbq0013P5E9LWrNp65vKDU2URD/wMlHOQpsW
 3pKhVpVqMlDpfIRLb4CRh/iCjgLcQ7UMKh/aQSzDPAwTtC+MpBWHa6XrpfXh/1Frypkt
 cG18eswe6NnnraG2y3xNEFgsVOfnwpJmNzkAZssx4akbbPMvXzRS8b6xOJ2qp/GrFZNN
 M4Hw==
X-Gm-Message-State: AOAM531vgvrBu9fZ0z3GrVW4Jlo1bbaYRWBm/cS4ApTOcr37zrOpYaGR
 NBO2RrbcmSCExORxVqAcsJY+qxpuzl0=
X-Google-Smtp-Source: ABdhPJzlMyiSweJ4L6z6roO1LNiCg/TR4wEk7PG3Rhh5ZUhUjSSlWDxWZDcu8Tkn1whOb4b/0D2RgQ==
X-Received: by 2002:a63:fc58:: with SMTP id r24mr1777092pgk.368.1619147474582; 
 Thu, 22 Apr 2021 20:11:14 -0700 (PDT)
Received: from bobo.ibm.com ([59.102.87.99])
 by smtp.gmail.com with ESMTPSA id k1sm3511962pgk.9.2021.04.22.20.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 20:11:14 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/4] Fix queued spinlocks and a bit more
Date: Fri, 23 Apr 2021 13:11:04 +1000
Message-Id: <20210423031108.1046067-1-npiggin@gmail.com>
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
Cc: "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Patch 1 is the important fix. 2 might fix something, although I haven't
provoked a crash yet.

Patch 3 is a small cleanup, and patch 4 I think is the right thing to do
but these could wait for later.

Thanks,
Nick

Nicholas Piggin (4):
  powerpc/pseries: Fix hcall tracing recursion in pv queued spinlocks
  powerpc/pseries: Don't trace hcall tracing wrapper
  powerpc/pseries: use notrace hcall variant for H_CEDE idle
  powerpc/pseries: warn if recursing into the hcall tracing code

 arch/powerpc/include/asm/hvcall.h         |  3 +++
 arch/powerpc/include/asm/paravirt.h       | 22 +++++++++++++++++---
 arch/powerpc/include/asm/plpar_wrappers.h |  6 +++++-
 arch/powerpc/platforms/pseries/hvCall.S   | 10 +++++++++
 arch/powerpc/platforms/pseries/lpar.c     | 25 ++++++++---------------
 5 files changed, 46 insertions(+), 20 deletions(-)

-- 
2.23.0

