Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 392415F68C3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 16:05:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjtW56qFtz3dqd
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 01:05:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Z1Ed5wAs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Z1Ed5wAs;
	dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjtV73x0Yz3bqn
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Oct 2022 01:04:30 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id f23so1807084plr.6
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Oct 2022 07:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=wxNwtwliPYDE93NjwsTv+/GOfrACut8iCdcchwaxKyU=;
        b=Z1Ed5wAsJGj/zKo1/+jK5KBs86zPWl659L47zqWU7vupUoEW6+jpfmrtezRlevhYFL
         gaxl4/+T0MDJJHZc/6FBXc1xOamS92JMWYJtxI1t1F8zat5LKSWvtuh9aCOTklHAHuAA
         sDZjV1+iZWM2ZlWJ0mbIWuRI6OvyI61suu87QLTnlLmgpw1mh31mDkhdG56/Y6DzkQr0
         G8yfO3MzbHN4bertTSr0j/ysfbihirfSQvkGfJN6zvzl7eyVpmV6BzuAQ7KxR1RoyFXG
         nPyNeIORoCsYb5baX4WTGhavi5/8rXdPsPuDLC3CPAYuuznmXRNXtLYjatbmhr7ECIsm
         jRqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=wxNwtwliPYDE93NjwsTv+/GOfrACut8iCdcchwaxKyU=;
        b=EhCR52BxGOD7GIl+Rp0aRPLdCerBiSWSegkGv7fby5Lwrwl2rZZDchKJZtBtAqQNGs
         NQOY3NU8Yxh/+dw2fS/SJ9bmiNr/r1k894Uks/UWHcObhQNP5pcjHCbCRFXX55nHAidX
         Jyu6vPV/J9h94cnFNk0Xz/oSO2Pmys0SUpdXT5gEsL0DW3NLtUhIb6ol/L93Cez2asrM
         ncVldICeUGyvCw8TGuBkt5WQRupmPqCA33lCCsjgjN9tUUkA0KIT0fJ0aezPS/rpIvrD
         r8B5OknaNtoJIFh+2NQUaSUE2/pH1uMhGMcoZaUv56BXiBcffGhJG0kJM36A9a8pC2n8
         YpPA==
X-Gm-Message-State: ACrzQf2P4Yso7P9Vo1i5kSDhmSZdppMTfjm6OgSGUz9dPFc2xdFgfJ4Y
	qcMMr7LfNuG4jb59OLynPSa1RYW1JG8=
X-Google-Smtp-Source: AMsMyM4IFh6L2syoa73LO2fspGRe993XwmcvPMQv13upFAf5QMyUjTaOGBs3x9iyaxC2zZHVeictag==
X-Received: by 2002:a17:902:ec89:b0:178:3ea4:2960 with SMTP id x9-20020a170902ec8900b001783ea42960mr100362plg.160.1665065067273;
        Thu, 06 Oct 2022 07:04:27 -0700 (PDT)
Received: from bobo.ibm.com ([118.208.156.99])
        by smtp.gmail.com with ESMTPSA id m1-20020a170902bb8100b0017bf6061ee4sm4602901pls.117.2022.10.06.07.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 07:04:26 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/4] powerpc: misc interrupt and context tracking fixes
Date: Fri,  7 Oct 2022 00:04:09 +1000
Message-Id: <20221006140413.126443-1-npiggin@gmail.com>
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

These are several fixes for regressions and bugs that can crash
the host.

Thanks,
Nick

Nicholas Piggin (4):
  KVM: PPC: BookS PR-KVM and BookE do not support context tracking
  powerpc/64s/interrupt: Perf NMI should not take normal exit path
  powerpc/64e/interrupt: Prevent NMI PMI causing a dangerous warning
  powerpc/64: Fix perf profiling asynchronous interrupt handlers

 arch/powerpc/include/asm/hw_irq.h    | 41 ++++++++++++++++++++--------
 arch/powerpc/kernel/dbell.c          |  2 +-
 arch/powerpc/kernel/exceptions-64e.S |  7 +++++
 arch/powerpc/kernel/exceptions-64s.S | 14 +++++++++-
 arch/powerpc/kernel/interrupt.c      | 13 +++++++--
 arch/powerpc/kernel/irq.c            |  2 +-
 arch/powerpc/kernel/time.c           |  2 +-
 arch/powerpc/kernel/traps.c          |  2 --
 arch/powerpc/kvm/Kconfig             |  4 +++
 9 files changed, 66 insertions(+), 21 deletions(-)

-- 
2.37.2

