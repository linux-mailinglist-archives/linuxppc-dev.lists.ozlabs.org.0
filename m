Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4444811D0D7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 16:21:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Ycw42G6GzDqrN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 02:21:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Ycpw2BpZzDqGb
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2019 02:17:10 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id r11so1312563pgf.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 07:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v26BsJHtOrSEIqcupCpn6pVHwbqhLlNjRKE6OChruw8=;
 b=q7DQztUhC2cJBLWp8U64RWDfNoq8AbBYU8MfDcKAjAFGPJpPnE3FAqVtyqVKY+ZAqn
 qMLB/MGQif2yiI3NOW7QGUKPa2TozBJMY2FgfNVz0e4txIKABIoAdygoKGywYQN+O2Vo
 Nkke2edKnZCvy5sqTt3NpxXWt8nNTJADHSHOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v26BsJHtOrSEIqcupCpn6pVHwbqhLlNjRKE6OChruw8=;
 b=CfkJhntMoFmQckKOFLooWGW8seGyy/gcZ0ISziEQCPhtpYOYKBVtHwOhJHomNqxp8I
 9NZFem7zPV+Nooxdaf7y9zeyBOwCiure/T1T6rCmJKKICtsyBllvThdPLDJIQe+qXDqw
 DzFlPRLm6dBv+uFdHmcGW301vS7l0aDrQbH5elZ1P3RkWlA/bTLQThFyMEu74yp61DbO
 03vDnh7d9js19gT3rLUFK/mNEScyN/GFixokmrXJmgwQvOpb6AiMrJsxb9OzKhN2R6ZI
 jxhQMJ7VeA2RUrcVTRL0gG/VeDEWF/rbpPFG/iGYGxG2gevVOPENH3++y60avLy6+mW+
 KmbQ==
X-Gm-Message-State: APjAAAXev+OMtbMWeNdKis54u4603p7MoL6Qmp9OFcaTT8DTLSEOtpj4
 Nhoy0N/Xzy93xIpJ1XgYwbEIjA==
X-Google-Smtp-Source: APXvYqwZHmuzKnMIkPQu7WYLto/58IR4TZmFj0304fSKWKFda3vIFLGQeA7OjH96Yx4Qnd6rYUHK5g==
X-Received: by 2002:aa7:90c4:: with SMTP id k4mr10406197pfk.216.1576163822527; 
 Thu, 12 Dec 2019 07:17:02 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-b116-2689-a4a9-76f8.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:b116:2689:a4a9:76f8])
 by smtp.gmail.com with ESMTPSA id 5sm6415205pjc.29.2019.12.12.07.17.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2019 07:17:01 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 christophe.leroy@c-s.fr, aneesh.kumar@linux.ibm.com, bsingharora@gmail.com
Subject: [PATCH v3 0/3] KASAN for powerpc64 radix
Date: Fri, 13 Dec 2019 02:16:53 +1100
Message-Id: <20191212151656.26151-1-dja@axtens.net>
X-Mailer: git-send-email 2.20.1
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
Cc: Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Building on the work of Christophe, Aneesh and Balbir, I've ported
KASAN to 64-bit Book3S kernels running on the Radix MMU.

This provides full inline instrumentation on radix, but does require
that you be able to specify the amount of physically contiguous memory
on the system at compile time. More details in patch 3.

v3: Reduce the overly ambitious scope of the MAX_PTRS change.
    Document more things, including around why some of the
    restrictions apply.
    Clean up the code more, thanks Christophe.

v2: The big change is the introduction of tree-wide(ish)
    MAX_PTRS_PER_{PTE,PMD,PUD} macros in preference to the previous
    approach, which was for the arch to override the page table array
    definitions with their own. (And I squashed the annoying
    intermittent crash!)

    Apart from that there's just a lot of cleanup. Christophe, I've
    addressed most of what you asked for and I will reply to your v1
    emails to clarify what remains unchanged.


Daniel Axtens (3):
  kasan: define and use MAX_PTRS_PER_* for early shadow tables
  kasan: Document support on 32-bit powerpc
  powerpc: Book3S 64-bit "heavyweight" KASAN support

 Documentation/dev-tools/kasan.rst             |   7 +-
 Documentation/powerpc/kasan.txt               | 122 ++++++++++++++++++
 arch/powerpc/Kconfig                          |   3 +
 arch/powerpc/Kconfig.debug                    |  21 +++
 arch/powerpc/Makefile                         |  11 ++
 arch/powerpc/include/asm/book3s/64/hash.h     |   4 +
 arch/powerpc/include/asm/book3s/64/pgtable.h  |   7 +
 arch/powerpc/include/asm/book3s/64/radix.h    |   5 +
 arch/powerpc/include/asm/kasan.h              |  21 ++-
 arch/powerpc/kernel/process.c                 |   8 ++
 arch/powerpc/kernel/prom.c                    |  64 ++++++++-
 arch/powerpc/mm/kasan/Makefile                |   3 +-
 .../mm/kasan/{kasan_init_32.c => init_32.c}   |   0
 arch/powerpc/mm/kasan/init_book3s_64.c        |  72 +++++++++++
 include/linux/kasan.h                         |  18 ++-
 mm/kasan/init.c                               |   6 +-
 16 files changed, 359 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/powerpc/kasan.txt
 rename arch/powerpc/mm/kasan/{kasan_init_32.c => init_32.c} (100%)
 create mode 100644 arch/powerpc/mm/kasan/init_book3s_64.c

-- 
2.20.1

