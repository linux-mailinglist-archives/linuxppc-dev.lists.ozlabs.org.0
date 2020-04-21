Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E861B1BCF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 04:23:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495nS65z28zDqxh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 12:23:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=c64iBqIz; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 495nQ33rjWzDqkf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 12:22:00 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id g30so5927219pfr.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 19:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZaiQTpBjus0YI32dZnAL3DNMPd39ij1RLV0PfpWFIs0=;
 b=c64iBqIzn7nHA+MF9lkZTSyUKdnW5VRqStBApR9flQQBerSSEkn59KYYaIU+MF9gGq
 U08Myp2N0DDk8A5X4N8eXmIpkKDcIhfpFNHykezCbk1fJn/+kdXpcZoHoidVa1ngkggx
 CU0eGT0m4So7WII+PpdCN70/1be9nyE7qmzo9BlP8O0SG62+nUuLqAQNkKIXYwNJpNcT
 TOOr7Jilb70Ue0rCzkAGBvrPU2MnN+i1wGjPPMePR2E4YOO1eg4xGwljM1HZ9kdKLovb
 1WDIkh4+DSX3dDC4H2nbKfpgw522Zw4ZqHZ30iHTE90z7uOpv0173SWnrw+mB6UI3gZG
 beig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZaiQTpBjus0YI32dZnAL3DNMPd39ij1RLV0PfpWFIs0=;
 b=hoYC8afXrpNgASz63ijB1QURGOXtIS8nMv7wb7zmfQx+OnrQ0H0ZQeASwqPL3A2284
 UA3iq9D+ywLFg8oDD/8CNsR2xrwxR5dRpueKL8m2+aGJWM515a+BE5kc6RJbQieJBa3u
 G6g7V57ARHbgHjK6xCIe+2iv3xw86lb8V2R7kg0sLlVPa0bGOND0cAftL0eBTvGY5vP7
 4HlqfMJz4uoo5DUfR882LKgtu0lHlisMEwogCSyWhg7AbtnvMl42Qsm19GiJzzosw0yk
 NV/gWhpluKbT4CyfgvrU0lvM+t9iFU4Bp9HzS1t+ROGmgRrktDXwj6FrBTuVXuLE0JGm
 atNg==
X-Gm-Message-State: AGi0PuZ7MENcVaGmF/sEL15iZA+Pxfm4TEfaY5qKV8v7QmsOu1ItlcS3
 XrW7y+ZdWOAK39UBM2VLID4RSFHM
X-Google-Smtp-Source: APiQypKR3OQ6k8d5cZRnb05HBFQnHxCbKZyr98fAOZlndrYVOPs2NjdZ8nQRYa3W3pwPqLI6zjoI0Q==
X-Received: by 2002:a63:1d46:: with SMTP id d6mr20116855pgm.236.1587435717014; 
 Mon, 20 Apr 2020 19:21:57 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.185.249.170])
 by smtp.gmail.com with ESMTPSA id w3sm829397pfn.115.2020.04.20.19.21.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 19:21:56 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/4] powerpc: clean up pt_regs traps handling
Date: Tue, 21 Apr 2020 12:19:51 +1000
Message-Id: <20200421021955.772023-1-npiggin@gmail.com>
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

scv support needs to test trap in some cases to distinguish sc from scv,
so it helps to have a few tidy-up patches to start with. This turned
into a slightly bigger job that we needed to do to clean up the double
restart logic that today zeroes traps which is ugly.

Thanks,
Nick

Nicholas Piggin (4):
  powerpc/64s: Always has full regs, so remove remnant checks
  powerpc: Use SET_TRAP and avoid open-coding trap masking
  powerpc: TRAP_IS_SYSCALL helper to hide syscall trap number
  powerpc: Use trap metadata to prevent double restart rather than
    zeroing trap

 arch/powerpc/include/asm/ptrace.h             |  31 +++-
 arch/powerpc/include/asm/syscall.h            |   5 +-
 arch/powerpc/kernel/process.c                 |   4 +-
 arch/powerpc/kernel/ptrace/ptrace-tm.c        |   2 +-
 arch/powerpc/kernel/ptrace/ptrace-view.c      |   2 +-
 arch/powerpc/kernel/signal.c                  |   9 +-
 arch/powerpc/kernel/signal_32.c               |   2 +-
 arch/powerpc/kernel/signal_64.c               |  10 +-
 arch/powerpc/xmon/xmon.c                      |   4 +-
 .../testing/selftests/powerpc/signal/Makefile |   2 +-
 .../powerpc/signal/sig_sc_double_restart.c    | 174 ++++++++++++++++++
 11 files changed, 220 insertions(+), 25 deletions(-)
 create mode 100644 tools/testing/selftests/powerpc/signal/sig_sc_double_restart.c

-- 
2.23.0

