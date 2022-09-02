Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 607ED5AAAA7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 10:54:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJsCX2M14z3bpn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 18:54:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ljgQSdF1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ljgQSdF1;
	dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJsBy38fdz2yMk
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 18:53:28 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id y127so1259074pfy.5
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Sep 2022 01:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=z1Gm/v5SxpZdJzIKq5SAIMmz4ylGwhcwvpaiYBJU4yE=;
        b=ljgQSdF1Z1/gcD63pbtUvMhzvl93CBdRaWABw63Qk+lTAKMAyrTWBuSCMpBL8HWup6
         VPjNThAIIFDuKoB2hCo1abCrQf+qW6gS+qn5tbgBH3poQ6T7MbpzrNIyDLJ8CsDk+1Vc
         IWhgQSFJqXKPaOSDq0R9pUChaT1x5JG+z5Bdz0IPriRA+7lCK6UJ5m738UiUMflnHaOA
         etZeqZcT+0ArfdcTazAG2QuYN8LcKxplkB+9HST1bK2jw5n0wtSygdp5sgijlhvYNSQN
         vZbCIWRY2eVGRsF8P7eD2VQBMzDlSNT28qkXyfDyywfvJXWQ2MyFH5NHIVYOSlXEU2Mo
         Ij4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=z1Gm/v5SxpZdJzIKq5SAIMmz4ylGwhcwvpaiYBJU4yE=;
        b=5NSeezwgmsCtJ7sWHZQpjbDt99dEsyQw7cMhwCZiF3PN6ihwkn+p8l92fObeMOAGck
         y4zha7lr99B8hvRqQv0g6XlUb8Q3Yw9nr/Z7XnXB8tZvs+JWSyCz9tlDSJC2p/z9pM/z
         T6SvUNlRQwSmArFgdgRb3aWHiE9fNcv+DZyt4BAyboy0Zuhv+Mq5zSR7sfw/JYmD+1Bk
         SQMPN/CL8PH3BpEmQSkXk2CapiJ0l9lzTKaCCPZ6nNgFXE0ZaV8/E8HGiyJzkWKWPxh5
         bbroCdUcifQLjL89vmxC8xwkpO7kJaq1FQjIjLmO/CZ+0cEXghL2oSO0+9B/qlqv/Ru8
         Oqew==
X-Gm-Message-State: ACgBeo01oloRO5BIY2yxib5aLAfiE8JO8SVXvhu0tbfmeaAHN9+PD1+6
	nHJwwx8XDbCnvoTomlEo/M0U3q+uQM0=
X-Google-Smtp-Source: AA6agR7G4q2GM60qxPCUHfHw38C/r3XqdyLzdqdGxWPoP8iq5NBZC26RKRE96ngqf4Qax5MIX8vRCg==
X-Received: by 2002:a63:1555:0:b0:42c:146a:6722 with SMTP id 21-20020a631555000000b0042c146a6722mr19768202pgv.605.1662108805901;
        Fri, 02 Sep 2022 01:53:25 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([124.170.18.239])
        by smtp.gmail.com with ESMTPSA id y4-20020a17090322c400b001750b31faabsm1039130plg.262.2022.09.02.01.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 01:53:25 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/4] powerpc: stolen time accounting for VIRT_CPU_ACCOUNTING_GEN
Date: Fri,  2 Sep 2022 18:53:12 +1000
Message-Id: <20220902085316.2071519-1-npiggin@gmail.com>
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

pseries provides stolen time accounting when VIRT_CPU_ACCOUNTING_NATIVE
is selected, but not when VIRT_CPU_ACCOUNTING_GEN is. We like GEN
because it's less code in arch/powerpc, allows full nohz, and distros
have moved to it, so this series adds stolen time accounting for GEN,
and moves our pseries configs over to it.

Thanks,
Nick

Since v1:
- Move the KVM patches out of this series to make it smaller.
  I'll post them separately.
- Fix compilation bug in patch 2 due to missing header in patch.
- Add defconfig changes to patch 3.
- Add tidy up patch 4.
- Improve changelogs.

Nicholas Piggin (4):
  powerpc/pseries: Add wait interval counter definitions to struct
    lppaca
  powerpc/pseries: Implement CONFIG_PARAVIRT_TIME_ACCOUNTING
  powerpc/64: Remove PPC64 special case for cputime accounting default
  powerpc/pseries: Move dtl scanning and steal time accounting to
    pseries platform

 .../admin-guide/kernel-parameters.txt         |  6 +-
 arch/powerpc/configs/ppc64_defconfig          |  2 +
 arch/powerpc/configs/pseries_defconfig        |  2 +
 arch/powerpc/include/asm/cputime.h            |  2 +-
 arch/powerpc/include/asm/dtl.h                |  8 --
 arch/powerpc/include/asm/lppaca.h             | 10 +-
 arch/powerpc/include/asm/paravirt.h           | 12 +++
 arch/powerpc/include/asm/paravirt_api_clock.h |  1 +
 arch/powerpc/include/asm/time.h               |  5 +-
 arch/powerpc/kernel/time.c                    | 92 +------------------
 arch/powerpc/platforms/pseries/Kconfig        |  8 ++
 arch/powerpc/platforms/pseries/dtl.c          | 81 ++++++++++++++++
 arch/powerpc/platforms/pseries/lpar.c         | 11 +++
 arch/powerpc/platforms/pseries/setup.c        | 19 ++++
 init/Kconfig                                  |  3 +-
 15 files changed, 156 insertions(+), 106 deletions(-)
 create mode 100644 arch/powerpc/include/asm/paravirt_api_clock.h

-- 
2.37.2

