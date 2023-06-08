Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB827275B5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 05:26:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qc8kl5Mqzz3f1T
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 13:26:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=r72vBD0V;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::34; helo=mail-oa1-x34.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=r72vBD0V;
	dkim-atps=neutral
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qc8hr0g4gz3cNY
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 13:24:43 +1000 (AEST)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-19f31d6b661so154619fac.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jun 2023 20:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686194676; x=1688786676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p5/+1fA9UdZZNdwm0m4IZsRyaLZTXCA/ALBNzcoctxQ=;
        b=r72vBD0V9bJw0TEBoWHcQsXoI2/S17ZQ+6d18DHgGj2FZJZ7ySvdeAOC7LGAdfrlp8
         xDBOGBN0FRgV4q008qbnWTt2usLpE2uFSlB3Uu/TtPAuAcxkk/2kYpscNeLaXqyDljRk
         55Z+kE9OL2wZu3YITn7AAl5txn6CdKOu7LjmEFf2sGZveqdIClf6ZRWfc5WT4CAnoe0n
         f2UCmZ/yaBs1s7yY2SKJc6O0kbg+bKHu7YacYwa+k09LysMJkS0YmJvbuAWeuXnSXA3j
         u9vXIxcZ4a1imO8k7Bas76cNuCdaot1uW2mqBJEN92a+/EKcW/4naoPy0yxZAthukFUC
         NCDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686194676; x=1688786676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p5/+1fA9UdZZNdwm0m4IZsRyaLZTXCA/ALBNzcoctxQ=;
        b=Mciae8Tr6Wu3avpOq6wJ8Lsf209PDeh6rcW5ibrsZgbCzYXq3X8OeND1e/DbtB62xd
         Y8v4YY67lgXs2BwGT7Ma+Xqh+SbLVHd2S59d6uEnH0xEp+EjBVOYI7G1DhepSv7Adv8u
         K++uAeKLcOc1RkT9hfd77MENN9I5mTxqcS78Ath2dJ9KO9EWC63wdNzk78nUQHeB/cY/
         k/lz6vNbp647SfYf0z7/yTk1MbLDkGn+Iq7AHUqWl0josEoQkbpVGSCvXEkl6Ztnywrm
         5hSWKbf5oC/gPtmaFyCTJmNZFnzcHgkUuWc2cFkq/BVa1j+l75cCT48zYBX0OU3Cp7zW
         dK2w==
X-Gm-Message-State: AC+VfDyHplmDgDBjizfLOsnAWaWcXEGJg4/1UAq6fJySLwuHmBG0ZyfE
	RyIDE6+9lT0XUrKxt3AVDfQ=
X-Google-Smtp-Source: ACHHUZ7SSMbx5SlpVrW00IgxXImnEczLcGdqRZGJzWtx+RigbzuqXWtGqLLbKluldGPnlDoLooa+1A==
X-Received: by 2002:a05:6871:503:b0:187:e05e:a4f0 with SMTP id s3-20020a056871050300b00187e05ea4f0mr6654834oal.26.1686194675743;
        Wed, 07 Jun 2023 20:24:35 -0700 (PDT)
Received: from wheely.local0.net (58-6-224-112.tpgi.com.au. [58.6.224.112])
        by smtp.gmail.com with ESMTPSA id s12-20020a17090a5d0c00b0025930e50e28sm2015629pji.41.2023.06.07.20.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 20:24:34 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 0/6] KVM: selftests: add powerpc support
Date: Thu,  8 Jun 2023 13:24:19 +1000
Message-Id: <20230608032425.59796-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series adds initial KVM selftests support for powerpc
(64-bit, BookS, radix MMU).

Since v2:
- Added a couple of new tests (patch 5,6)
- Make default page size match host page size.
- Check for radix MMU capability.
- Build a few more of the generic tests.

Since v1:
- Update MAINTAINERS KVM PPC entry to include kvm selftests.
- Fixes and cleanups from Sean's review including new patch 1.
- Add 4K guest page support requiring new patch 2.

Thanks,
Nick

Nicholas Piggin (6):
  KVM: selftests: Move pgd_created check into virt_pgd_alloc
  KVM: selftests: Add aligned guest physical page allocator
  KVM: PPC: selftests: add support for powerpc
  KVM: PPC: selftests: add selftests sanity tests
  KVM: PPC: selftests: Add a TLBIEL virtualisation tester
  KVM: PPC: selftests: Add interrupt performance tester

 MAINTAINERS                                   |   2 +
 tools/testing/selftests/kvm/Makefile          |  23 +
 .../selftests/kvm/include/kvm_util_base.h     |  29 +
 .../selftests/kvm/include/powerpc/hcall.h     |  21 +
 .../selftests/kvm/include/powerpc/ppc_asm.h   |  32 ++
 .../selftests/kvm/include/powerpc/processor.h |  46 ++
 .../selftests/kvm/lib/aarch64/processor.c     |   4 -
 tools/testing/selftests/kvm/lib/guest_modes.c |  27 +-
 tools/testing/selftests/kvm/lib/kvm_util.c    |  56 +-
 .../selftests/kvm/lib/powerpc/handlers.S      |  93 +++
 .../testing/selftests/kvm/lib/powerpc/hcall.c |  45 ++
 .../selftests/kvm/lib/powerpc/processor.c     | 541 ++++++++++++++++++
 .../testing/selftests/kvm/lib/powerpc/ucall.c |  30 +
 .../selftests/kvm/lib/riscv/processor.c       |   4 -
 .../selftests/kvm/lib/s390x/processor.c       |   4 -
 .../selftests/kvm/lib/x86_64/processor.c      |   7 +-
 tools/testing/selftests/kvm/powerpc/helpers.h |  46 ++
 .../selftests/kvm/powerpc/interrupt_perf.c    | 199 +++++++
 .../testing/selftests/kvm/powerpc/null_test.c | 166 ++++++
 .../selftests/kvm/powerpc/rtas_hcall.c        | 136 +++++
 .../selftests/kvm/powerpc/tlbiel_test.c       | 508 ++++++++++++++++
 21 files changed, 1981 insertions(+), 38 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/include/powerpc/hcall.h
 create mode 100644 tools/testing/selftests/kvm/include/powerpc/ppc_asm.h
 create mode 100644 tools/testing/selftests/kvm/include/powerpc/processor.h
 create mode 100644 tools/testing/selftests/kvm/lib/powerpc/handlers.S
 create mode 100644 tools/testing/selftests/kvm/lib/powerpc/hcall.c
 create mode 100644 tools/testing/selftests/kvm/lib/powerpc/processor.c
 create mode 100644 tools/testing/selftests/kvm/lib/powerpc/ucall.c
 create mode 100644 tools/testing/selftests/kvm/powerpc/helpers.h
 create mode 100644 tools/testing/selftests/kvm/powerpc/interrupt_perf.c
 create mode 100644 tools/testing/selftests/kvm/powerpc/null_test.c
 create mode 100644 tools/testing/selftests/kvm/powerpc/rtas_hcall.c
 create mode 100644 tools/testing/selftests/kvm/powerpc/tlbiel_test.c

-- 
2.40.1

