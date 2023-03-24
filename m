Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9666C76E2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 06:14:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PjVk90vhXz3fRv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 16:14:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=H+be9FYD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=H+be9FYD;
	dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PjVj858SXz3chX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 16:13:15 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id mp3-20020a17090b190300b0023fcc8ce113so4009028pjb.4
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Mar 2023 22:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679634793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pE8AmdIH0RIUbdvBWMctyo17vOjMWtp9V8i3guH1aIQ=;
        b=H+be9FYDHOxafWM2eX0/k19L63LcHLF3A5R8FfG6v+obDbBoFGG5LzNL0NpjWNVDJj
         Crp5moKYSeVt/cXhguk+gOQVfuMU44i8pIbuHGGKGg1AE5gwTAebA4xr8JgMQ+OKXvf7
         7g/hxOaDeHdx2bNb2jFu2CsQxg8CgwP7H/rMAX15xIxwCIIzv5ZlxJx8/uX3BPjo/DFY
         dzmwcXcgyXkOjmrmHx2Ezd7ilJNILxp0cZmoqoOW/MtgHZCCeTl/fU6WPu0ZdmL+x5Mq
         Ncw2aetRme9mzVynx23PSTK2oT6NqJOmSsKZKfCfy5Sh4pcOzqcT02yfj2SNmkDbVFGA
         zKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679634793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pE8AmdIH0RIUbdvBWMctyo17vOjMWtp9V8i3guH1aIQ=;
        b=0d8y8zuUrYhQxiCBNwYDqDg2R7caLOQIZvm5gZhnrBWgOKUHUHyqXUNY4jUXU8hdX9
         EFjd2tVPIVuDTbcZto0QuuqIc6LnS+jtrbhWQhG1slekaXqHVAO4ocNAFA76RFpS/r5p
         CDJv0cpnC20oX/5nvslflPKjlCRBv2aPdIAvVWKoGyNp7yCiarah1JEPvLoH5Zzw0Civ
         2QgeLQdNE8Qc5Di1rYmDkeR2+mzdiQkTvIEoXYmrzTXHDdCT/Z+LNIJXRwpdnBZPvUVf
         JSwxOQqTp2XqqrJtqaawKDz+r/SsNbd/8Xnnp7ZBJOs5h+08BkLUMElu4Wp14LaSDxwM
         LPnQ==
X-Gm-Message-State: AAQBX9cxe4EYvB9t5xTQxdc27vGpSEPAvzYWm92+3s8wumBc/wPalWcC
	opYrw17CPxdh2l5VfQephP393+yUJyI=
X-Google-Smtp-Source: AKy350brwNXbQOUcBCaI180uX2CvuZz5FKM4HJJ3a5ViJY/BcZrMkAx+yP7owsoXMTJCPvOjXW/EQQ==
X-Received: by 2002:a17:902:e5c7:b0:1a1:be45:9857 with SMTP id u7-20020a170902e5c700b001a1be459857mr1545573plf.1.1679634792964;
        Thu, 23 Mar 2023 22:13:12 -0700 (PDT)
Received: from bobo.ibm.com ([124.170.18.191])
        by smtp.gmail.com with ESMTPSA id l4-20020a170902eb0400b0019a70a85e8fsm13169774plb.220.2023.03.23.22.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 22:13:12 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 0/2] KVM: PPC: selftests: powerpc support
Date: Fri, 24 Mar 2023 15:12:52 +1000
Message-Id: <20230324051254.1894918-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

This series adds initial KVM selftests support for powerpc
(64-bit, BookS). It spans 3 maintainers but it does not really
affect arch/powerpc, and it is well contained in selftests
code, just touches some makefiles and a tiny bit headers so
conflicts should be unlikely and trivial.

Hey Paolo and KVM group, if you didn't take the v1 series yet, could
you please take this instead. Otherwise I can send an incremental
fixup.

Since v1:
- r2 (TOC) was not being set for guest code
- MSR[VSX] was not being set for guest code
- Proper guest interrupt handling instead of quick hack that
  just made a ucall out to host.
- Adjust subject to better match kvm selftests convention.

Thanks,
Nick


Nicholas Piggin (2):
  KVM: PPC: selftests: implement support for powerpc
  KVM: PPC: selftests: basic sanity tests

 tools/testing/selftests/kvm/Makefile          |  15 +
 .../selftests/kvm/include/kvm_util_base.h     |  13 +
 .../selftests/kvm/include/powerpc/hcall.h     |  22 +
 .../selftests/kvm/include/powerpc/ppc_asm.h   |  17 +
 .../selftests/kvm/include/powerpc/processor.h |  32 ++
 tools/testing/selftests/kvm/lib/kvm_util.c    |  10 +
 .../selftests/kvm/lib/powerpc/handlers.S      |  96 ++++
 .../testing/selftests/kvm/lib/powerpc/hcall.c |  45 ++
 .../selftests/kvm/lib/powerpc/processor.c     | 411 ++++++++++++++++++
 .../testing/selftests/kvm/lib/powerpc/ucall.c |  30 ++
 tools/testing/selftests/kvm/powerpc/helpers.h |  46 ++
 .../testing/selftests/kvm/powerpc/null_test.c | 166 +++++++
 .../selftests/kvm/powerpc/rtas_hcall.c        | 146 +++++++
 13 files changed, 1049 insertions(+)
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
2.37.2

