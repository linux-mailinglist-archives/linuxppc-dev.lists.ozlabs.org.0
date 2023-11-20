Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC57F7F1351
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 13:30:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XwDOLLUr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SYn0D4mTgz3cW2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 23:30:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XwDOLLUr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SYmzM0jC7z2yhZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Nov 2023 23:29:34 +1100 (AEDT)
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-7a92727934eso159225739f.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Nov 2023 04:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700483369; x=1701088169; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qj9gaId9xEkTbj+GKHFV9m1w8BlvLjGL5meXwVroxI0=;
        b=XwDOLLUrYFfkT2z2RAZgh6v8/4yl0of9eA2m1VT262hAz7F+uzVeel6x8+06WN81Ye
         ehW5OTdNVNbVupzSld2m2CV3DkvripuUM+7DRtRcEWxSi5sPQVZUbVbKF1GXQTOZ8OqQ
         WwQ36YT18UcL8f2+B2FBZAuwi7MDybnVCz8g7aYywVpc0Us2QK/DBFiTMNHyVoZvZouh
         1DX4cpk7n8fZtfijb+lMo02lKhjnJOmvsxz1dcEKdFELILIION6nOYLofzA+cv2H+Aej
         Bx8rUOAxGbNqD+yMTHeIGBSylKRLlkZ+PDvV8/YfKVsSFOvy075lQMNa/e2+sRxLBxeF
         Ae3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700483369; x=1701088169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qj9gaId9xEkTbj+GKHFV9m1w8BlvLjGL5meXwVroxI0=;
        b=AAdabSskO+ZlacvLB4xXzggK6MWnd75F/rm5Nnt7SkYs/g69o9qTQ/YcVcXv8PPDws
         7Sl9oGD3eLV5bWjpyYX96uSOmhKZquSTRajBZM+CPX39P7d9tfv1lrcKsmL1Vb0X90iX
         woJ41v53sk0fKrqD0z5szUL/aMXKGQBm7revecJHq5ebhMoWE9kyaXOXmBVTPy1gxgD5
         cT8zDKaQUwTxoBrFUxzwKU+Ddww60iuJRfYD5Bjk8aG+4I3QNZSs/nLYexfmxfRq13XD
         tPYeeShRANA4CyFK2g8rEOhJI51mkir5+c0L4qNOvpg3/JkHDpM9Tw0bWDaQ26FsiD5t
         v4Pg==
X-Gm-Message-State: AOJu0YzLZdn/yt44tfngjgz75A5xwqS3kFAtOFe5i8xY4aPrjlMVeI0F
	bx2CMAqzec8JUB3hQddO+ro=
X-Google-Smtp-Source: AGHT+IHZZsyYedWaWMSYwWWXg7I2MCnNDE3YGQORTYXde6OKJ02OZBJot3h47lsTEMhcR70RVJH+kw==
X-Received: by 2002:a92:c844:0:b0:35b:cca:a55f with SMTP id b4-20020a92c844000000b0035b0ccaa55fmr500989ilq.2.1700483369574;
        Mon, 20 Nov 2023 04:29:29 -0800 (PST)
Received: from wheely.local0.net (203-219-179-16.tpgi.com.au. [203.219.179.16])
        by smtp.gmail.com with ESMTPSA id d13-20020a056a00244d00b00690fe1c928csm6047477pfj.147.2023.11.20.04.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 04:29:28 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4 0/4] KVM: selftests: add powerpc support
Date: Mon, 20 Nov 2023 22:29:16 +1000
Message-ID: <20231120122920.293076-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
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
Cc: Sean Christopherson <seanjc@google.com>, linuxppc-dev@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series adds initial KVM selftests support for powerpc
(64-bit, BookS, radix MMU).

Since v3:
https://lore.kernel.org/linuxppc-dev/20230608032425.59796-1-npiggin@gmail.com/
- Rebased to upstream (on top of Sean's ucall and guest assert
  rework).
- Drop powerpc specific tests for now, concentrate on base enablement.
- Fix a bunch of bugs and issues including the ones noticed by Joel
  in v3:
- Work around powerpc's max VCPU ID complexity to fix test case failure.
- Use TEST_REQUIRE for radix mode so hash hosts don't assert.
- Pack page table "fragments" in pages (like Linux kernel does), which
  fixes PTE memory consumption estimation and prevents the max memory
  test from failing with no memory for page tables.

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

Nicholas Piggin (4):
  KVM: selftests: Move pgd_created check into virt_pgd_alloc
  KVM: selftests: Add aligned guest physical page allocator
  KVM: PPC: selftests: add support for powerpc
  KVM: PPC: selftests: powerpc enable kvm_create_max_vcpus test

 MAINTAINERS                                   |   2 +
 tools/testing/selftests/kvm/Makefile          |  20 +
 .../selftests/kvm/include/kvm_util_base.h     |  31 ++
 .../selftests/kvm/include/powerpc/hcall.h     |  17 +
 .../selftests/kvm/include/powerpc/ppc_asm.h   |  32 ++
 .../selftests/kvm/include/powerpc/processor.h |  39 ++
 .../selftests/kvm/include/powerpc/ucall.h     |  21 +
 .../selftests/kvm/kvm_create_max_vcpus.c      |   9 +
 .../selftests/kvm/lib/aarch64/processor.c     |   4 -
 tools/testing/selftests/kvm/lib/guest_modes.c |  27 +-
 tools/testing/selftests/kvm/lib/kvm_util.c    |  56 ++-
 .../selftests/kvm/lib/powerpc/handlers.S      |  93 ++++
 .../testing/selftests/kvm/lib/powerpc/hcall.c |  45 ++
 .../selftests/kvm/lib/powerpc/processor.c     | 468 ++++++++++++++++++
 .../testing/selftests/kvm/lib/powerpc/ucall.c |  21 +
 .../selftests/kvm/lib/riscv/processor.c       |   4 -
 .../selftests/kvm/lib/s390x/processor.c       |   4 -
 .../selftests/kvm/lib/x86_64/processor.c      |   7 +-
 tools/testing/selftests/kvm/powerpc/helpers.h |  46 ++
 19 files changed, 908 insertions(+), 38 deletions(-)
 create mode 100644 tools/testing/selftests/kvm/include/powerpc/hcall.h
 create mode 100644 tools/testing/selftests/kvm/include/powerpc/ppc_asm.h
 create mode 100644 tools/testing/selftests/kvm/include/powerpc/processor.h
 create mode 100644 tools/testing/selftests/kvm/include/powerpc/ucall.h
 create mode 100644 tools/testing/selftests/kvm/lib/powerpc/handlers.S
 create mode 100644 tools/testing/selftests/kvm/lib/powerpc/hcall.c
 create mode 100644 tools/testing/selftests/kvm/lib/powerpc/processor.c
 create mode 100644 tools/testing/selftests/kvm/lib/powerpc/ucall.c
 create mode 100644 tools/testing/selftests/kvm/powerpc/helpers.h

-- 
2.42.0

