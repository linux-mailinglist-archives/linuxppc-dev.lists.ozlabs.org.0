Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D942B9DFC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 00:15:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CcbBC65PkzDqts
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 10:15:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=I1x5GLDX; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ccb8Q2JkQzDqY4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 10:13:40 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id p6so1445917plr.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Nov 2020 15:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RBqOhFUdtF138inDqk8e7BN+UZvBY1XCCDP2EPW3NRM=;
 b=I1x5GLDXdYt+29rALoBaHdqUWJfxktIkzhcPOha+Jq6B27KweIQHYDcBId8bUMQHkY
 V24AdS9+Lx4IsXYjFZRHORGrBqfnLYbsp5UTZt0gM+sBrW2YiTzla2BJ76Plt79lCvCW
 QRM/L7KbQsRcB1uJavKJEpMWQbN2qicQBctc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RBqOhFUdtF138inDqk8e7BN+UZvBY1XCCDP2EPW3NRM=;
 b=bZLX0BDPNCeVst8KHUZIbjt4ZpJIUy+5lhXom3+/8eYkX++ArhheDPyPKLsLBYOknw
 cjMXAEQJAhS+FyUtDXpyU428P55FhGQ4Wio2HEVGSw3vMEIi/io3ZUpuZeC8xNk8f4VZ
 4zsCU0/4GoaTVmmlMuuu3A1p5skPWh5wrQ3QeCpLB8RZILk5XCUBoILCBFJDLSIH7gMh
 sO4ldNegonTGoJdgMR/pbhUoqKMaq+x/rOTiV2CohkLWSuX51V4w1pvsRj21eMsTu7nO
 bzJY4wJoX9DOnBIZ/rp4byzInhPitvtKwqK4Iblxm4DGpzKG3L4lloB6fGDvuMjFf/DB
 Gd4g==
X-Gm-Message-State: AOAM532h7a3jyixAFRkTAleQQbS216l0gQIx15xxFPsTumhj/aKpQPsW
 RPwCPdzmsTw6/t6C67+Otz81Er1C1yqnqQ==
X-Google-Smtp-Source: ABdhPJxxBFYtEj/WOrvNY4jlij5FlMcwoo5dCbZq11juuRzOnHTjKe9pcL5r1Umr98Ptm+tCYjdM7w==
X-Received: by 2002:a17:902:70cc:b029:d7:e8ad:26d4 with SMTP id
 l12-20020a17090270ccb02900d7e8ad26d4mr11089366plt.33.1605827617266; 
 Thu, 19 Nov 2020 15:13:37 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-4d44-522c-3789-8f33.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:4d44:522c:3789:8f33])
 by smtp.gmail.com with ESMTPSA id x3sm890550pjk.17.2020.11.19.15.13.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 15:13:36 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/7] CVE-2020-4788: Speculation on incompletely validated data
 on IBM Power9
Date: Fri, 20 Nov 2020 10:13:26 +1100
Message-Id: <20201119231333.361771-1-dja@axtens.net>
X-Mailer: git-send-email 2.25.1
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
Cc: dja@axtens.net, cmr@informatik.wtf, spoorts2@in.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

IBM Power9 processors can speculatively operate on data in the L1
cache before it has been completely validated, via a way-prediction
mechanism. It is not possible for an attacker to determine the
contents of impermissible memory using this method, since these
systems implement a combination of hardware and software security
measures to prevent scenarios where protected data could be leaked.

However these measures don't address the scenario where an attacker
induces the operating system to speculatively execute instructions
using data that the attacker controls. This can be used for example to
speculatively bypass "kernel user access prevention" techniques, as
discovered by Anthony Steinhauser of Google's Safeside Project. This
is not an attack by itself, but there is a possibility it could be
used in conjunction with side-channels or other weaknesses in the
privileged code to construct an attack.

This issue can be mitigated by flushing the L1 cache between privilege
boundaries of concern. This series flushes the cache on kernel entry and
after kernel user accesses.

Thanks to Nick Piggin, Russell Currey, Christopher M. Riedl, Michael
Ellerman and Spoorthy S for their work in developing, optimising,
testing and backporting these fixes, and to the many others who helped
behind the scenes.

Daniel Axtens (3):
  selftests/powerpc: entry flush test
  selftests/powerpc: refactor entry and rfi_flush tests
  powerpc/64s: rename pnv|pseries_setup_rfi_flush to
    _setup_security_mitigations

Michael Ellerman (1):
  powerpc: Only include kup-radix.h for 64-bit Book3S

Nicholas Piggin (2):
  powerpc/64s: flush L1D on kernel entry
  powerpc/64s: flush L1D after user accesses

Russell Currey (1):
  selftests/powerpc: rfi_flush: disable entry flush if present

 .../admin-guide/kernel-parameters.txt         |   7 +
 .../powerpc/include/asm/book3s/64/kup-radix.h |  66 ++++++---
 arch/powerpc/include/asm/exception-64s.h      |  12 +-
 arch/powerpc/include/asm/feature-fixups.h     |  19 +++
 arch/powerpc/include/asm/kup.h                |  26 +++-
 arch/powerpc/include/asm/security_features.h  |   7 +
 arch/powerpc/include/asm/setup.h              |   4 +
 arch/powerpc/kernel/exceptions-64s.S          |  80 +++++-----
 arch/powerpc/kernel/setup_64.c                | 122 ++++++++++++++-
 arch/powerpc/kernel/syscall_64.c              |   2 +-
 arch/powerpc/kernel/vmlinux.lds.S             |  14 ++
 arch/powerpc/lib/feature-fixups.c             | 104 +++++++++++++
 arch/powerpc/platforms/powernv/setup.c        |  24 ++-
 arch/powerpc/platforms/pseries/mobility.c     |   4 +-
 arch/powerpc/platforms/pseries/pseries.h      |   2 +-
 arch/powerpc/platforms/pseries/setup.c        |  15 +-
 .../testing/selftests/powerpc/include/utils.h |   5 +
 .../selftests/powerpc/security/.gitignore     |   1 +
 .../selftests/powerpc/security/Makefile       |   4 +-
 .../selftests/powerpc/security/entry_flush.c  | 139 ++++++++++++++++++
 .../selftests/powerpc/security/flush_utils.c  |  70 +++++++++
 .../selftests/powerpc/security/flush_utils.h  |  17 +++
 .../selftests/powerpc/security/rfi_flush.c    |  96 ++++--------
 23 files changed, 693 insertions(+), 147 deletions(-)
 create mode 100644 tools/testing/selftests/powerpc/security/entry_flush.c
 create mode 100644 tools/testing/selftests/powerpc/security/flush_utils.c
 create mode 100644 tools/testing/selftests/powerpc/security/flush_utils.h

-- 
2.25.1

