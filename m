Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A891F34D1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 09:28:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49h1tc2fVhzDqBg
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 17:28:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UQZM97U4; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49h1PZ1f8DzDqWt
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 17:06:25 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id k2so998263pjs.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Jun 2020 00:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bw3hijgKGm5uqDQXakaFslKK6j/104d/Ed/V5q80OGM=;
 b=UQZM97U4KMUQBeuoqpmTFFfTkYSCciFSbwmUwfihqFFWu5ijtthv68/kAs9UOsUo71
 3OKhrNkGnNSDPhjU0w+xWVJnAY1r6b22aO370twzqMM++xNDeXYRkFmGO28o0qHiSnS0
 avwBNKs+8MMxbaCId2VYdo/x7cHpO9NoVupZ5IoaZX6d1A2rwu+wbTHHQYZeK5eqgdkg
 78ER3w9NUMiaixIRzo9xgmUmq0X62CuU6C+eq+KUGeQKVM2YrZJtKdytBI/D26dNiDFn
 Sbi6SVWI33lMtRfWxuRqYXlqLd8Tf/1L82cWi/mPCekQ+4LlfeiHWFRgPXqCTvx+lkYK
 LnIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bw3hijgKGm5uqDQXakaFslKK6j/104d/Ed/V5q80OGM=;
 b=RlGCs8/Pef9lBT6mMb2JX6ngpiMdj1l0RkznVP3FJphR6rxf6bhnGrM52pzZeS8ISE
 evjfs6o6U8gf9DvzMOSUZ7sxGWNw1m5TVq7xr73KV2Ovfohczc3QiiRmZvoRxa+ToYTw
 A9w+zQiNaHL/O+rnKeuKHGJE01OxOu6lKP4uTqyV+LienReuT+w2hGiZs2y5OPz5bC+f
 bx7AUgCLeemD0Al4mDY6n5OHIrypEusSbjTFTB96lwYHI+dJYZe5jSkis2PGmF99zPlN
 tRQ7bYAPYJFWNDaD3e2CpcmVMCy847To0JORYvHfPqTtVN9QKv60nBLeViCoKzx1vgk8
 ElpA==
X-Gm-Message-State: AOAM530m/yYHNe9EQhZQfCL7GHiSJKLkjg8DvBpUx6DzAZJPRaB+9by+
 Leuqjo/yOulh0W+zVA1x0wax8wp9s+U=
X-Google-Smtp-Source: ABdhPJzrwgcufKyuOpuD7Fx18S2qraHuSjXYYoEhs5qZ1DAAfBPAVeX69xyS02ZGz1zqiX5RPPVG4w==
X-Received: by 2002:a17:90b:14d5:: with SMTP id
 jz21mr3534500pjb.70.1591686381333; 
 Tue, 09 Jun 2020 00:06:21 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([61.68.71.10])
 by smtp.gmail.com with ESMTPSA id 9sm1545615pju.1.2020.06.09.00.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 00:06:20 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/7] powerpc: branch cache flush changes
Date: Tue,  9 Jun 2020 17:06:03 +1000
Message-Id: <20200609070610.846703-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series allows the link stack to be flushed with the speical
bcctr 2,0,0 flush instruction that also flushes the count cache if
the processor supports it.

Firmware does not support this at the moment, but I've tested it in
simulator with a patched firmware to advertise support.

Thanks,
Nick

Nicholas Piggin (7):
  powerpc/security: re-name count cache flush to branch cache flush
  powerpc/security: change link stack flush state to the flush type enum
  powerpc/security: make display of branch cache flush more consistent
  powerpc/security: split branch cache flush toggle from code patching
  powerpc/64s: Move branch cache flushing bcctr variant to ppc-ops.h
  powerpc/security: Allow for processors that flush the link stack using
    the special bcctr
  powerpc/64s: advertise hardware link stack flush

 arch/powerpc/include/asm/asm-prototypes.h    |   4 +-
 arch/powerpc/include/asm/hvcall.h            |   1 +
 arch/powerpc/include/asm/ppc-opcode.h        |   2 +
 arch/powerpc/include/asm/security_features.h |   2 +
 arch/powerpc/include/uapi/asm/kvm.h          |   1 +
 arch/powerpc/kernel/entry_64.S               |  13 +-
 arch/powerpc/kernel/security.c               | 139 +++++++++++--------
 arch/powerpc/kvm/powerpc.c                   |   9 +-
 arch/powerpc/platforms/powernv/setup.c       |   3 +
 arch/powerpc/platforms/pseries/setup.c       |   3 +
 tools/arch/powerpc/include/uapi/asm/kvm.h    |   1 +
 11 files changed, 106 insertions(+), 72 deletions(-)

-- 
2.23.0

