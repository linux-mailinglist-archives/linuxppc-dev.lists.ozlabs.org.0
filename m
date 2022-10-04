Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6D95F3CC9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 08:34:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MhSbR19Grz3bjs
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 17:34:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OUlyA8W1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=OUlyA8W1;
	dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MhSZT1LF8z2ysx
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Oct 2022 17:33:20 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id d11so11857644pll.8
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Oct 2022 23:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=HJKJfh+TW3c+5YzmTCv0soMAr1rL4CgZJswbnUZOtvQ=;
        b=OUlyA8W1rqn8NiM6lC/JdXPJxpV1hfxHNHSS4KwfzGq7RgJ52qReqEPIajYsip01Lu
         mA4eZ75zdZF6gMXHnzSxgB1SXWC1epZSgNx9febCqSiC6ESTicrG/pMskEEU2xuhT7Oz
         +IpHfuc5z3s+jk8Mf72s0NCK98kKrN7yMaUBefg1BGHOZwKKs+jXu76K+Bf6+EROgUlP
         gpcbXUG7eDBliaZATHN7dSumzPW8HsqEi06cPwey731fp7VQvjiHO2EFL1YvtQFs3f2g
         qtBM4G2D4cb3fyHBvtOHB44CcjGqKZEvEgqZd+y4cgabL6csaSUVQOHafS5nmu/AcKuX
         7WLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=HJKJfh+TW3c+5YzmTCv0soMAr1rL4CgZJswbnUZOtvQ=;
        b=KPimgY0RF+BwLC+yXrGQ4vjty4olqsD1QrqpWpwoyVjMEuj1zZDdTfuXLmIvFC6IOz
         M6ykD96FTvQUFCfFHQNF/G2tn5qgcFGMMuAFPjaL51GmwDnxJ/I0U+tQkfR+r0tKpyHe
         9V4Pix14cXiokPtvAiVLG43lo/8mFzXo/3AfoW9aHSdlxAMMjN1KtQ2l7ioGrwhgCVQ0
         oNyM+9zBZXYTLJMFgDUJijgGzGiJ0TID9XkZLjbb245o+lHpvbNtxi7QmHS0rFbogyGt
         Exk6vOKr4lwWuPQD+UGGglkOub81VEIDivHkacPYGKyRjapWAaDU3tkjokPCJXsomi2o
         E6Rw==
X-Gm-Message-State: ACrzQf1cY5lmaUyHHC54c2k7cQ4KizB7cuAbVxI485BQ3GkE2cYUVGVu
	RX+w0vyAaOpf1K6U8UkueD50bw/8jKI=
X-Google-Smtp-Source: AMsMyM4p+h8dyutB9XbTjJ/Cps1mQVasqA14lAiiZrHzW23Ho0pXvEulbzSFEK5+GVGd8cH/XCR3eQ==
X-Received: by 2002:a17:90b:1a90:b0:202:ff17:4a80 with SMTP id ng16-20020a17090b1a9000b00202ff174a80mr16047246pjb.213.1664865196483;
        Mon, 03 Oct 2022 23:33:16 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (123-243-1-173.tpgi.com.au. [123.243.1.173])
        by smtp.gmail.com with ESMTPSA id s17-20020aa78bd1000000b0056160437e88sm3701782pfd.20.2022.10.03.23.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 23:33:15 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 0/3] powerpc/32: nohz full support
Date: Tue,  4 Oct 2022 16:33:03 +1000
Message-Id: <20221004063306.511154-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Doesn't seem to be much more involved in adding context tracking and
generic virt cpu accounting support for 32-bit, which is all that's
left to support NO_HZ_FULL.

I tested this with e5500 SMP kernel with isolated and nohz CPU, and
it seems to be doing the right thing -- periodic tick is stopped on
the nohz CPUs when they are running in userspace.

Context tracking warnings should catch quite quickly if we got
something wrong there (with the force context tracking option). I
don't have a 32-bit KVM environment to test so that might have some
issues but it should be quite easy to fix if it can be tested.

I assume the virt cpu accounting gen option removal is okay, but not
exactly sure what to look for in terms of possible problems, so we'll
see what comments that gets back.

Thanks,
Nick

Nicholas Piggin (3):
  powerpc/32: Implement HAVE_CONTEXT_TRACKING_USER support
  powerpc: remove the last remnants of cputime_t
  Remove HAVE_VIRT_CPU_ACCOUNTING_GEN option

 arch/Kconfig                         | 11 -----------
 arch/arm/Kconfig                     |  1 -
 arch/csky/Kconfig                    |  1 -
 arch/loongarch/Kconfig               |  1 -
 arch/mips/Kconfig                    |  1 -
 arch/powerpc/Kconfig                 |  2 +-
 arch/powerpc/include/asm/cputime.h   | 17 +----------------
 arch/powerpc/include/asm/interrupt.h | 21 ++++++---------------
 arch/powerpc/kernel/time.c           | 23 ++---------------------
 arch/xtensa/Kconfig                  |  1 -
 init/Kconfig                         |  1 -
 kernel/time/Kconfig                  |  2 --
 12 files changed, 10 insertions(+), 72 deletions(-)

-- 
2.37.2

