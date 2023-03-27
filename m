Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E78456CA46F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 14:46:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlXcc5z4hz3chq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 23:46:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IZtvd/an;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IZtvd/an;
	dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlXbh1HGrz3bNn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 23:45:35 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id q102so7544784pjq.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 05:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679921133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KCiKOWP9OD70+BMDOPG9uFA2Fku30UBKZIR1BIz1KaI=;
        b=IZtvd/anTvYfpHea3GmU2+btAEj77m3vW1Mt5eWpVnuyutaBiJVGvXjFs+TFLYNQbs
         P02X4vQY1iBy3GWkgdWvwXkBgHJryaZxCK5nw+AsLgOCg1ZRrS/kO39xexqg2Z4S9i0v
         fv5KoJRoNEyo6J33Zo1q5WN5YEaphnRgePvDdRe4tL8IznpiP63iqO+kOQcNLAp0VfcD
         3KEtBaHsXSmOGKsAOg3OwEwY0SN4m6HfRQqFB3UpsTJgmd8/2tOVCyYyEhV4j/V9866H
         2oraQgLAR1XMcgazB1Zv/seWO2/25b8S4xRErc2ZepPs8YJ6+OQBt9BZ7TFBn11Z+qfU
         xltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679921133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KCiKOWP9OD70+BMDOPG9uFA2Fku30UBKZIR1BIz1KaI=;
        b=Okg2sg+rapM50TcRAHWx0YOf60q+Rsa+43nrs4lnt7+3/1FWk0A2HANZBqHjmCARb/
         oX/jSn/6oJ2YcEPj6ISWXMtGC/ldG9KV6vQGdgRgTxPYIYWK+ckNUXwLKKg3+1id7pu7
         2jE+8SXY+ZYVQZAWbpZfH8gYqMkEL4KIxclK7cTAITw+LsGmqCddHbCggA/EkH0Dmri0
         ux+b/enDJtgEQnkECwU+xQ5O3VSQ0RbyWJRjTyRPti1x1JFLxYyXoAhMXzVT2xInAuUv
         eLFsTGbP3qvQV8AudLQrpLCV2XQxry//JQ8ZfkWhyaa8v5EqysBaw6jZvJnTcfB9F1Fn
         hpWA==
X-Gm-Message-State: AAQBX9cpNM3L8HtytXYj/PoqFDBaiW30CaKTkM/7+n7csCTv01UzBIBz
	M6V3IB3i/vdKL2Ak2kAa11Y=
X-Google-Smtp-Source: AKy350Yn3HKa4UqZvJBBsd+tBZKfXhhXlpPWcsb/4f2azx1FDruTqa/GfCcbWd7tMf57PyRRIc5UYA==
X-Received: by 2002:a17:902:d411:b0:1a1:c8b3:3fe1 with SMTP id b17-20020a170902d41100b001a1c8b33fe1mr8896800ple.31.1679921132917;
        Mon, 27 Mar 2023 05:45:32 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.221.180.225])
        by smtp.gmail.com with ESMTPSA id ay6-20020a1709028b8600b0019a997bca5csm19053965plb.121.2023.03.27.05.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 05:45:32 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests v3 00/13] powerpc: updates, P10, PNV support
Date: Mon, 27 Mar 2023 22:45:07 +1000
Message-Id: <20230327124520.2707537-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series is growing a bit I'm sorry. v2 series added extra interrupt
vectors support which was actually wrong because interrupt handling
code can only cope with 0x100-size vectors and new ones are 0x80 and
0x20. It managed to work because those alias to the 0x100 boundary, but
if more than one handler were installed in the same 0x100-aligned
block it would crash. So a couple of patches added to cope with that.

Thanks,
Nick

Nicholas Piggin (13):
  MAINTAINERS: Update powerpc list
  powerpc: Add local variant of SPR test
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

 MAINTAINERS                 |   2 +-
 lib/powerpc/asm/handlers.h  |   2 +-
 lib/powerpc/asm/hcall.h     |   1 +
 lib/powerpc/asm/ppc_asm.h   |   6 +
 lib/powerpc/asm/processor.h |  55 ++-
 lib/powerpc/handlers.c      |  10 +-
 lib/powerpc/hcall.c         |   4 +-
 lib/powerpc/io.c            |  27 +-
 lib/powerpc/io.h            |   6 +
 lib/powerpc/processor.c     |  80 ++++-
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
 powerpc/unittests.cfg       |   6 +
 23 files changed, 1138 insertions(+), 256 deletions(-)
 create mode 100644 lib/ppc64/asm/opal.h
 create mode 100644 lib/ppc64/asm/vpa.h
 create mode 100644 lib/ppc64/opal-calls.S
 create mode 100644 lib/ppc64/opal.c
 create mode 100644 powerpc/spapr_vpa.c

-- 
2.37.2

