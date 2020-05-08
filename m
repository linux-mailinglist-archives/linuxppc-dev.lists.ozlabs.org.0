Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 427C21CA250
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 06:36:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JHbT6ljvzDqyY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 14:36:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b;
 helo=mail-pf1-x42b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ipXTMhDC; dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JHXs0XyZzDqvW
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 14:34:20 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id d184so304377pfd.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 May 2020 21:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Bx4DZmh2CqZddAGXSdfVBB3cHDBWfR6bzqqnAlX49Dw=;
 b=ipXTMhDCUNYJAxClGpXR0ty1sAE10heN/Mj8sIigDofJqwCGOcn+m1Jyfotb/lCWpW
 ftbfHmVvufNZpcsYavj86JOmIoPLlhH/QtXoiOoMD2KJjXPctkrUESaXaHy60yIpA/V+
 BaGGjkZF/dQZVxLTR4zjBA6OXajxjbApNhWyLclWPWLlAUHE7kmIak6neDKAAgTVIlGz
 N99vI2kRcyU2tkCZS+sjg/1Iucxm9ZnvefCB5ROQiKBZIXnilTKeKqzQPkh79M3NFYsU
 ZGibGULSmfII6kZr89wPUWo8cwe1xODqrkWsX8JLB8zj83wPFVhE0/3FJYtdb67noG6Q
 EinQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Bx4DZmh2CqZddAGXSdfVBB3cHDBWfR6bzqqnAlX49Dw=;
 b=Txrvs2IdG8mWDVxbKZLcs6j06NnDDYgtAYwx50IcW0rBSAofG10p/47GsYXhDnWvw5
 uyXfyi/JeT9mXVBshHKJ8EQYIHhxzskheFtoCFWDyO6y11d7U9rFtLEJyrJcITbw0jP/
 AXEeeIXH4s6ZvXlrzrlqGNFu9UYzvRgkvVi4DXs90+c2tqUBhi5K2JHLpc1oUohe9imR
 3IGAUw8B6ifS7rPlVzRPczT8iTW3JcvBx13PW6QmIyrVM3h/PAvIoyb77w9JTJQLor0e
 EJpkvdUYACK2rvBkBmxBPOk5s9a9zpHqkkTfhr/y86I6un4k1id3QItB9Xi6z1eKUIuW
 KJXA==
X-Gm-Message-State: AGi0Puad8jfyIGkdHbYDlwwTUS5N8O/HccWR4Ht3VkqqL4koWcXAd0zq
 CQXV1bbgZ2xUtUd6el1WgFyPLd2f
X-Google-Smtp-Source: APiQypLdCjPslg6rj1UiVxecW0ACbEyi01x/GHTD0pfqaPsFXQlJ4mTgcwqPUAptwBSRQI14gqvPmA==
X-Received: by 2002:a63:d404:: with SMTP id a4mr559321pgh.390.1588912456694;
 Thu, 07 May 2020 21:34:16 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-214-199.tpgi.com.au. [61.68.214.199])
 by smtp.gmail.com with ESMTPSA id i9sm358813pfk.199.2020.05.07.21.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 21:34:16 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 00/16] powerpc: machine check and system reset fixes
Date: Fri,  8 May 2020 14:33:52 +1000
Message-Id: <20200508043408.886394-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since v3, I fixed a compile error and returned the generic machine check
exception handler to be NMI on 32 and 64e, as caught by Christophe's
review.

Also added the last patch, just found it by looking at the code, a
review for 32s would be good.

Thanks,
Nick

Nicholas Piggin (16):
  powerpc/64s/exception: Fix machine check no-loss idle wakeup
  powerpc/64s/exceptions: Fix in_mce accounting in unrecoverable path
  powerpc/64s/exceptions: Change irq reconcile for NMIs from reusing
    _DAR to RESULT
  powerpc/64s/exceptions: machine check reconcile irq state
  powerpc/pseries/ras: avoid calling rtas_token in NMI paths
  powerpc/pseries/ras: FWNMI_VALID off by one
  powerpc/pseries/ras: fwnmi avoid modifying r3 in error case
  powerpc/pseries/ras: fwnmi sreset should not interlock
  powerpc/pseries: limit machine check stack to 4GB
  powerpc/pseries: machine check use rtas_call_unlocked with args on
    stack
  powerpc/64s: machine check interrupt update NMI accounting
  powerpc: implement ftrace_enabled helper
  powerpc/64s: machine check do not trace real-mode handler
  powerpc/traps: system reset do not trace
  powerpc/traps: make unrecoverable NMIs die instead of panic
  powerpc/traps: Machine check fix RI=0 recoverability check

 arch/powerpc/include/asm/firmware.h    |  1 +
 arch/powerpc/include/asm/ftrace.h      | 14 ++++++
 arch/powerpc/kernel/exceptions-64s.S   | 47 +++++++++++++++-----
 arch/powerpc/kernel/mce.c              | 16 ++++++-
 arch/powerpc/kernel/process.c          |  2 +-
 arch/powerpc/kernel/setup_64.c         | 15 +++++--
 arch/powerpc/kernel/traps.c            | 31 ++++++++++---
 arch/powerpc/platforms/pseries/ras.c   | 60 +++++++++++++++++++-------
 arch/powerpc/platforms/pseries/setup.c | 14 ++++--
 9 files changed, 157 insertions(+), 43 deletions(-)

-- 
2.23.0

