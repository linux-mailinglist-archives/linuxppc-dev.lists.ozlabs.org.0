Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B83E46BC46C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 04:18:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PcXXd4phBz3cdV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 14:18:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KRxOVu04;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KRxOVu04;
	dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PcXWf2lj0z3c1K
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Mar 2023 14:17:49 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id gp15-20020a17090adf0f00b0023d1bbd9f9eso3998615pjb.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Mar 2023 20:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678936665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tk2XSOGv1tFnFzi/N5I5mj+ohjjy8LZGSgaI5+dYqZs=;
        b=KRxOVu04sF2V9Howec67b4fbYWXX2ViS+zdfYR553RHPG7p64GJ2xo6Ka06XpL99UQ
         mSdk2DQxsnWh3UxJlw9T0kjZALmmVy/SpUfLRyZSMRT3rKpapyIQMnnh5sLqvJAoLrwm
         Ud5JOSerIGl7Yl0qZ2yRRha2VAkzaGucz+AqujqVxdPNZge+ZXAaLzfIMXxJfUIGMYv2
         NUNR1T9clBlJVB5UHPRioPcC1d22+hsLp674LKKjmsyphg3knlPynhMY+6RIVqoKufwH
         1QNcgQuz3NSAPggAPzAlp970BanGz82l9+1FHlkbaUu4+Uba6ORdSLKUgOitZOEu4KyV
         U0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678936665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tk2XSOGv1tFnFzi/N5I5mj+ohjjy8LZGSgaI5+dYqZs=;
        b=D/Bpfnbqwlwyf0fx5YzrrxHCYn8SyK11Gsb/ZzevVjHu4/KuGn4htXS60DkhPPKOjG
         dYLfpYLlL64MzQHZwyA6/eO816xAg9dJUk+LHN/lhVSYgQEIbIKELzEcOIauKGwZqAtQ
         86j9QlBoBqBZINfpH3AkLLv1Do/8PW44DzncFu1zpb/JVZZmYnHdvssTMzHJ+dXGvR8C
         iz32+6hk5yLiiJNfqQU8fq9cPeJ/7w16yN/YyDq2RB63uMoCLFgRg8qvF4CkLYYjmZe2
         uWHcTWSQfxCIRHzGsiY5335YUBERF3zxk5EfVsRERVCNJtnNpzD3pzL+S1sQNGgKb/02
         Dkrw==
X-Gm-Message-State: AO0yUKVehSI+F+RKVX4xERNpfLaWiFfZuW2KmG/Q8f+YFFuz5irn2jSS
	684DHSawMRTPdZjEieXR+gA=
X-Google-Smtp-Source: AK7set+XCnTpKGt6nKM4igzd+EY9/RD9SvKrwisZAwLB6esqUD5zpJsPmDJ6z+zjy3DI4seRdbLi2g==
X-Received: by 2002:a17:902:ce85:b0:19e:dc0e:1269 with SMTP id f5-20020a170902ce8500b0019edc0e1269mr2196808plg.7.1678936664865;
        Wed, 15 Mar 2023 20:17:44 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (121-44-69-75.tpgi.com.au. [121.44.69.75])
        by smtp.gmail.com with ESMTPSA id b7-20020a1709027e0700b0019a7bb18f98sm4331859plm.48.2023.03.15.20.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 20:17:44 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 0/2] KVM: PPC: support kvm selftests
Date: Thu, 16 Mar 2023 13:17:30 +1000
Message-Id: <20230316031732.3591455-1-npiggin@gmail.com>
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

I guess Paolo is the best point to merge these, if no comments
or objections?

Thanks,
Nick

Nicholas Piggin (2):
  KVM: PPC: Add kvm selftests support for powerpc
  KVM: PPC: Add basic framework tests for kvm selftests

 tools/testing/selftests/kvm/Makefile          |  14 +
 .../selftests/kvm/include/kvm_util_base.h     |  13 +
 .../selftests/kvm/include/powerpc/hcall.h     |  22 ++
 .../selftests/kvm/include/powerpc/processor.h |  13 +
 tools/testing/selftests/kvm/lib/kvm_util.c    |  10 +
 .../testing/selftests/kvm/lib/powerpc/hcall.c |  45 +++
 .../selftests/kvm/lib/powerpc/processor.c     | 355 ++++++++++++++++++
 .../testing/selftests/kvm/lib/powerpc/ucall.c |  30 ++
 .../testing/selftests/kvm/powerpc/null_test.c | 186 +++++++++
 .../selftests/kvm/powerpc/rtas_hcall.c        | 146 +++++++
 10 files changed, 834 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/include/powerpc/hcall.h
 create mode 100644 tools/testing/selftests/kvm/include/powerpc/processor.h
 create mode 100644 tools/testing/selftests/kvm/lib/powerpc/hcall.c
 create mode 100644 tools/testing/selftests/kvm/lib/powerpc/processor.c
 create mode 100644 tools/testing/selftests/kvm/lib/powerpc/ucall.c
 create mode 100644 tools/testing/selftests/kvm/powerpc/null_test.c
 create mode 100644 tools/testing/selftests/kvm/powerpc/rtas_hcall.c

-- 
2.37.2

