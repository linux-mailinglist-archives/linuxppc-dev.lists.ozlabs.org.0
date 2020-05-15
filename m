Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F7A1D5989
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 May 2020 20:57:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NyMP4xTRzDqdM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 May 2020 04:57:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=FepFYDdu; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Ny4w5b9KzDq6l
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 May 2020 04:44:45 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id r10so1389957pgv.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 May 2020 11:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aqpEyjmRGymmAkpEVNLXc9rm3KhELEO9r/R/WZVikzc=;
 b=FepFYDduMkE+0Vc6udG9athvibh6QBvTsQoYsBFI7fTVizPHCZoDeTiA1Qh1GhyRsu
 KE65oHTsa+hmwdwO4VpPHRts+bXH6NsISs8EGjuR/EukerazV9u0Qpsi4MhsN4Odq6Wa
 +FNAlLl++yjbjgUKqAnw0ypxXMATy9BiLo+Uw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aqpEyjmRGymmAkpEVNLXc9rm3KhELEO9r/R/WZVikzc=;
 b=Z4RaPo+vB3lFGwFhcX2buXqzSFthH6IAzDk9zdTlFAPBjIODV3KHbbBokHLiLjNxAy
 R/nf28CK7xieMAs9hQxf2hbfrBejL9vij7Xtx2LqIU51UeshX3ONo1PhpdPdEEDirmwP
 AzHWfMmtpyQerpHEz39A2vfa5W8j+Yj/ZrrosjAUYDs5NMubILEE+IVD6YxGsCgg+fYj
 tjOqPqTmzCYgkkmhLms7GE21GEoYJu7hVihwlPNFDpF/Ptt60wbZpDuKQHI+oIO2Ffah
 DPc92e3+AGHHKKD5Al31Y0m1OLnbfC3bvSp8iqsQuDfgcAY0q7cRvV2DI/C54yxutQxN
 wmTw==
X-Gm-Message-State: AOAM532MK/8u0QkYtcFTmDeh5JkxxPTVXZ1FPwQOneGV7niX9RPoWy4T
 75bgrXKqmTyiRq268ThZ/DHBpA==
X-Google-Smtp-Source: ABdhPJxDRJnJDZmBecNcZ4uRgeiGUpxX7zgXYIqmKtnUH4FhAIJ11bjo7gZpRkIMVbYw1HRdWk2dWg==
X-Received: by 2002:a63:2b03:: with SMTP id r3mr4280548pgr.201.1589568282926; 
 Fri, 15 May 2020 11:44:42 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id j26sm2518425pfr.215.2020.05.15.11.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 11:44:38 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Pavel Tatashin <pasha.tatashin@soleen.com>
Subject: [PATCH v4 0/6] allow ramoops to collect all kmesg_dump events
Date: Fri, 15 May 2020 11:44:28 -0700
Message-Id: <20200515184434.8470-1-keescook@chromium.org>
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
Cc: Petr Mladek <pmladek@suse.com>, Tony Luck <tony.luck@intel.com>,
 Kees Cook <keescook@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
 Anton Vorontsov <anton@enomsg.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Colin Cross <ccross@android.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linuxppc-dev@lists.ozlabs.org, Benson Leung <bleung@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello!

I wanted to get the pstore tree nailed down, so here's the v4 of
Pavel's series, tweaked for the feedback during v3 review.

-Kees

v4:
- rebase on pstore tree
- collapse shutdown types into a single dump reason
  https://lore.kernel.org/lkml/CA+CK2bAPv5u1ih5y9t5FUnTyximtFCtDYXJCpuyjOyHNOkRdqw@mail.gmail.com/
- fix dump_oops vs max_reason module params
  https://lore.kernel.org/lkml/20200512233504.GA118720@sequoia/
- typos
  https://lore.kernel.org/lkml/4cdeaa2af2fe0d6cc2ca8ce3a37608340799df8a.camel@perches.com/
- rename DT parsing routines ..._size -> ..._u32
  https://lore.kernel.org/lkml/CA+CK2bCu8eFomiU+NeBjVn-o2dbuECxwRfssNjB3ys3caCbXeA@mail.gmail.com/
v3: https://lore.kernel.org/lkml/20200506211523.15077-1-keescook@chromium.org/
v2: https://lore.kernel.org/lkml/20200505154510.93506-1-pasha.tatashin@soleen.com
v1: https://lore.kernel.org/lkml/20200502143555.543636-1-pasha.tatashin@soleen.com

Kees Cook (3):
  printk: Collapse shutdown types into a single dump reason
  printk: Introduce kmsg_dump_reason_str()
  pstore/ram: Introduce max_reason and convert dump_oops

Pavel Tatashin (3):
  printk: honor the max_reason field in kmsg_dumper
  pstore/platform: Pass max_reason to kmesg dump
  ramoops: Add max_reason optional field to ramoops DT node

 Documentation/admin-guide/ramoops.rst         | 14 +++--
 .../bindings/reserved-memory/ramoops.txt      | 13 ++++-
 arch/powerpc/kernel/nvram_64.c                |  4 +-
 drivers/platform/chrome/chromeos_pstore.c     |  2 +-
 fs/pstore/platform.c                          | 26 ++-------
 fs/pstore/ram.c                               | 58 +++++++++++++------
 include/linux/kmsg_dump.h                     | 12 +++-
 include/linux/pstore.h                        |  7 +++
 include/linux/pstore_ram.h                    |  2 +-
 kernel/printk/printk.c                        | 32 ++++++++--
 kernel/reboot.c                               |  6 +-
 11 files changed, 114 insertions(+), 62 deletions(-)

-- 
2.20.1

