Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B1C72795D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 09:59:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcGnk3jS4z3f0J
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 17:59:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=jCFSxpWf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=jCFSxpWf;
	dkim-atps=neutral
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcGmv1Lpqz3dqt
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 17:58:38 +1000 (AEST)
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-33b1e83e1daso773935ab.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jun 2023 00:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686211115; x=1688803115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4yRFqg508jlhIJTvId1HikWkLMg7l9WIXZYisxaAOGc=;
        b=jCFSxpWfAp3s7AdTzF8n8zs96QU5CfRqn96Aat1Y4ZAZnThzayo1wjSy+osBoLJ1ef
         9YIGJFXCkIq7AOVA5fnBe074xj3j5HXljYwx/rz1b6a4VAUupmMmmxgtcCRp1v6sKbec
         b0ba3bsxR+67w5lZ++6VTOpDSOKsKz4nmB3REtxWDtIL1W7v70K63edzksNmVl5q3xFE
         Blj71m/NhVwcS5b/xEmolDKd7u4GdULnvoFUzyvcshJCaSqJ27prGSegxiIOxsBZt9dO
         02SZy07UIfDwqq+Q8Js6HdhWB1ql+l6P54UtsI6Km465zJXwVpywTJ1ptnWQpJ1M0IaH
         JGPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686211115; x=1688803115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4yRFqg508jlhIJTvId1HikWkLMg7l9WIXZYisxaAOGc=;
        b=OP0m0PVAMBh3DxorxqHrcAlbQxvxffbrve6hrgJ/ox2RxLjZzlF1x3Y2xRWczjLYzc
         JtK9IbZMb+O9QgZZzd7r/OJkxw/0tFGZZIvPVrZXy2iGjXMAZDM2en2u/6THkmV9w9Ku
         Vu1q1tK9TUso75IvvNh+kwMHvlP2xzaY2sUq2Z+EZTCbU36fOYxSvyicyQECGN97j+wi
         rrAaujw14IOKfN+u6HuPkZCmcHbhcn164VpjiHeRe3wCXH/FaLyo38/uczKVGQqb3NIp
         awew+BiKH24JDVojPED7/2zsx+TfliX1okLpfDgZR9xAVUrg3WKqxdYHNIJSIKN3ZAg5
         kehQ==
X-Gm-Message-State: AC+VfDypA54ToscHDvMNWTEcMXznux1emMFEPzvbCuiUeJ74ilszXS1j
	Kgeu24XioQhChafddaQqstc=
X-Google-Smtp-Source: ACHHUZ67ce7fphGLD+/kuZ1n4tpmZO5QdEngrfS9H0fO+f9uMO+b3L//Lx5tS+bSNU+ydGFnbljKOA==
X-Received: by 2002:a92:2802:0:b0:33a:a93f:a87e with SMTP id l2-20020a922802000000b0033aa93fa87emr7621000ilf.14.1686211115408;
        Thu, 08 Jun 2023 00:58:35 -0700 (PDT)
Received: from wheely.local0.net ([1.146.34.117])
        by smtp.gmail.com with ESMTPSA id 17-20020a630011000000b00542d7720a6fsm673182pga.88.2023.06.08.00.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 00:58:34 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests v4 00/12] powerpc: updates, P10, PNV support
Date: Thu,  8 Jun 2023 17:58:14 +1000
Message-Id: <20230608075826.86217-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Posting again, a couple of patches were merged and accounted for review
comments from last time.

Thanks,
Nick

Nicholas Piggin (12):
  powerpc: Report instruction address and MSR in unhandled exception
    error
  powerpc: Add some checking to exception handler install
  powerpc: Abstract H_CEDE calls into a sleep functions
  powerpc: Add ISA v3.1 (POWER10) support to SPR test
  powerpc: Extract some common helpers and defines to headers
  powerpc/sprs: Specify SPRs with data rather than code
  powerpc/spapr_vpa: Add basic VPA tests
  powerpc: Expand exception handler vector granularity
  powerpc: Add support for more interrupts including HV interrupts
  powerpc: Discover runtime load address dynamically
  powerpc: Support powernv machine with QEMU TCG
  powerpc/sprs: Test hypervisor registers on powernv machine

 lib/powerpc/asm/handlers.h  |   2 +-
 lib/powerpc/asm/hcall.h     |   1 +
 lib/powerpc/asm/ppc_asm.h   |   9 +
 lib/powerpc/asm/processor.h |  55 ++-
 lib/powerpc/handlers.c      |  10 +-
 lib/powerpc/hcall.c         |   4 +-
 lib/powerpc/io.c            |  27 +-
 lib/powerpc/io.h            |   6 +
 lib/powerpc/processor.c     |  79 ++++-
 lib/powerpc/setup.c         |   8 +-
 lib/ppc64/asm/opal.h        |  15 +
 lib/ppc64/asm/vpa.h         |  62 ++++
 lib/ppc64/opal-calls.S      |  46 +++
 lib/ppc64/opal.c            |  74 +++++
 powerpc/Makefile.ppc64      |   4 +-
 powerpc/cstart64.S          | 105 ++++--
 powerpc/run                 |  35 +-
 powerpc/spapr_hcall.c       |   9 +-
 powerpc/spapr_vpa.c         | 172 ++++++++++
 powerpc/sprs.c              | 645 ++++++++++++++++++++++++++----------
 powerpc/tm.c                |  20 +-
 powerpc/unittests.cfg       |   3 +
 22 files changed, 1133 insertions(+), 258 deletions(-)
 create mode 100644 lib/ppc64/asm/opal.h
 create mode 100644 lib/ppc64/asm/vpa.h
 create mode 100644 lib/ppc64/opal-calls.S
 create mode 100644 lib/ppc64/opal.c
 create mode 100644 powerpc/spapr_vpa.c

-- 
2.40.1

