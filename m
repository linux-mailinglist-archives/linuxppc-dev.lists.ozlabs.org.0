Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEA66DB8B7
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 06:01:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PthPH58gtz3fYM
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Apr 2023 14:01:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lo4L3iiR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=lo4L3iiR;
	dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PthNP0vNcz3fVJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Apr 2023 14:00:36 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6323e457395so70909b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Apr 2023 21:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680926433; x=1683518433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qFK/uIeYUfNZgY3kc6tIDnKhLwPMBiZB1vwA9Lwjqqg=;
        b=lo4L3iiRNDDU2WG5Oyft1uGTxdd+en0f6gBlF9K+1fCLSEPtZqXdbii0ZhRPMde/sZ
         yJK4ECwe/qhbsmUMXn3xnLaC0gz8bigr77AU05Vc+v7V71VHG+2DQH27ABbv7tMR0yIi
         IKGPjP/vABOrEO/yLbCOnEs6nnVU1y7xutm/Wk5UzI9GQB1pF/P7pnm+hOPTAuX8A/60
         NZHDO3NOGGUUl3GSlWU5q+Iyq3xpQ3NWEDr0zP73sM6/Xb43jAfRQfB8QzRQsLCmK3kB
         nF0nyzuuSEb6A9mwlncGRX5iBeDy3l7rEPlzfCNae6sXRHH3HGGINeN+ufgNwFrjyq7N
         UoaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680926433; x=1683518433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qFK/uIeYUfNZgY3kc6tIDnKhLwPMBiZB1vwA9Lwjqqg=;
        b=AF94ep4ujvXGmb6/a6XLYBGkvEbhISij0DUouDsM6l7RYjBD0/PpS0c9wP+v/fTiYR
         n4cOrQ34Sw2/CS0XzRNv/D7qYGus2S0DFLUrN2QUZPOlBZY7X3nuUwuikMuZl4ChquHj
         q2biil+PDOxfNx2BuwuSo81mvIssafbPlsVnWy5ilUK2+MlNwme0APt6bVDfgEf5QFn0
         wIsXeE/1QsXIRtve0RYhXYJiq0FBW80yrRWm4WbBqBYz4ai1S1vzrzt6U8jU/t1YLJs6
         o3iQ7hRl24St2rtg6MY8HRrcJ9DUC5i8oSXZsdUAdhVHEbPNcSo4vH3SHdRwsLMSs36y
         5zkw==
X-Gm-Message-State: AAQBX9cxqF8b02e3jtTuozJoJdlLZuCsvpWOgQP1CqKZk2wAJ12iqSVU
	5Av4z5IQCXqXEfBOmWzisrs=
X-Google-Smtp-Source: AKy350YnVfJEM/FMhIJogyGN04Oud2l94lQExA1WBe94RmF4hdhfyrX6Ms2zhUQzYiw+xgt1Bjrz4Q==
X-Received: by 2002:aa7:8434:0:b0:62d:e966:ffc7 with SMTP id q20-20020aa78434000000b0062de966ffc7mr903505pfn.21.1680926433137;
        Fri, 07 Apr 2023 21:00:33 -0700 (PDT)
Received: from wheely.local0.net ([203.59.189.25])
        by smtp.gmail.com with ESMTPSA id o12-20020a056a001bcc00b006328ee1e56csm263872pfw.2.2023.04.07.21.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 21:00:32 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 0/4] KVM: selftests: add powerpc support
Date: Sat,  8 Apr 2023 14:00:16 +1000
Message-Id: <20230408040020.868929-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.0
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
Cc: kvm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, linux-kselftest@vger.kernel.org, Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series adds initial KVM selftests support for powerpc
(64-bit, BookS, radix MMU).

Since v1:
- Update MAINTAINERS KVM PPC entry to include kvm selftests.
- Fixes and cleanups from Sean's review including new patch 1.
- Add 4K guest page support requiring new patch 2.

Thanks,
Nick

Nicholas Piggin (4):
  KVM: selftests: Move pgd_created check into virt_pgd_alloc
  KVM: selftests: Add aligned guest physical page allocator
  KVM: PPC: selftests: add support for powerpc
  KVM: PPC: selftests: add selftests sanity tests

 MAINTAINERS                                   |   2 +
 tools/testing/selftests/kvm/Makefile          |  15 +
 .../selftests/kvm/include/kvm_util_base.h     |  27 ++
 .../selftests/kvm/include/powerpc/hcall.h     |  21 +
 .../selftests/kvm/include/powerpc/ppc_asm.h   |  32 ++
 .../selftests/kvm/include/powerpc/processor.h |  33 ++
 .../selftests/kvm/lib/aarch64/processor.c     |   4 -
 tools/testing/selftests/kvm/lib/guest_modes.c |   3 +
 tools/testing/selftests/kvm/lib/kvm_util.c    |  56 ++-
 .../selftests/kvm/lib/powerpc/handlers.S      |  93 ++++
 .../testing/selftests/kvm/lib/powerpc/hcall.c |  45 ++
 .../selftests/kvm/lib/powerpc/processor.c     | 429 ++++++++++++++++++
 .../testing/selftests/kvm/lib/powerpc/ucall.c |  30 ++
 .../selftests/kvm/lib/riscv/processor.c       |   4 -
 .../selftests/kvm/lib/s390x/processor.c       |   4 -
 .../selftests/kvm/lib/x86_64/processor.c      |   7 +-
 tools/testing/selftests/kvm/powerpc/helpers.h |  46 ++
 .../testing/selftests/kvm/powerpc/null_test.c | 166 +++++++
 .../selftests/kvm/powerpc/rtas_hcall.c        | 146 ++++++
 19 files changed, 1129 insertions(+), 34 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/include/powerpc/hcall.h
 create mode 100644 tools/testing/selftests/kvm/include/powerpc/ppc_asm.h
 create mode 100644 tools/testing/selftests/kvm/include/powerpc/processor.h
 create mode 100644 tools/testing/selftests/kvm/lib/powerpc/handlers.S
 create mode 100644 tools/testing/selftests/kvm/lib/powerpc/hcall.c
 create mode 100644 tools/testing/selftests/kvm/lib/powerpc/processor.c
 create mode 100644 tools/testing/selftests/kvm/lib/powerpc/ucall.c
 create mode 100644 tools/testing/selftests/kvm/powerpc/helpers.h
 create mode 100644 tools/testing/selftests/kvm/powerpc/null_test.c
 create mode 100644 tools/testing/selftests/kvm/powerpc/rtas_hcall.c

-- 
2.40.0

