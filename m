Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE85178DA3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 16:19:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45y1zN1N84zDqF5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 00:19:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="sfx70gdH"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45y1rC4w2PzDqF6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2019 00:13:31 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id k8so27584943plt.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 07:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+PDDMuEpuNKUylJor+mjxxftxEsWjADGSr0iyjke2lQ=;
 b=sfx70gdHtL0Zsxxlo301XBK+Xb7OW87+dPYXMvnot1FeaumQVdNp7UWppM+sq6Slnx
 a8q/7GtYc7xx5hhV60PmDybL92Z05aYgEdVe0A9t7bLXilJt2kIFkrmgv+7xQ6nzXxtv
 dtPrJYvfO8QCcQH8g2pFfUVOdPeTgtwHlhwcEWaKAxrFBiFlUrMPnezXRLIBC6xaCiEr
 hjf0x8Rlh31n3/rPSNTNKB/1Y3qEhJVNEy1w/7R7LsOWe6giWa5xwHHLf78OfsaxmWLF
 zcCoH3T9eIlgN0n6T0O4QNf4ggpPY0LWCg1NDaQNLkJQga4yvrw1oicp3uNItoTccgGv
 iIMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+PDDMuEpuNKUylJor+mjxxftxEsWjADGSr0iyjke2lQ=;
 b=ogr/XmHTgt2mDdV7UTPJzQisC9HbDSi3Tj0RVHzK5z95A2u/uMD/hYPhP1gUGZoWV1
 gDipQ9Uzvu1UraZhyj3MY4ElbbhLP/v9aGBTBH+CCdcZFDIe3NOMFtwu1nFEAA8rtiy3
 D+/zEHvI7hmNBMtxfKmrJpgKRO42meLfqYsZ55utZAMY4UAkZ/VKVXfLxgWVN8Eops6B
 C3P2/QpqlMy2KLcEmzktoNqVBK9d5tAWBUyqNRZOaWfAlgwN+cIQ+TNAu1wq8C4ckKBb
 87ftiGedwtgV87q1kAeSmnFGgwMHfxvqf0w4B946oB7aCwYCyiJlJHgQ0E2LWaIV9djf
 GKrA==
X-Gm-Message-State: APjAAAV9gVbtn8ejBXPfskBrvxuzwzMFHiJYyGoGbedCLpxP3VK1cxw9
 eVY5q08VqmZqYusqKtJslgqI7xpm
X-Google-Smtp-Source: APXvYqy7sVv9yAB/rKeuw+QI2G9UUoY5UYMNLcn7/71z7+4KDaXZLMrpktXZsiqtEvl4EcP0lPYomA==
X-Received: by 2002:a17:902:7887:: with SMTP id
 q7mr112094253pll.129.1564409608105; 
 Mon, 29 Jul 2019 07:13:28 -0700 (PDT)
Received: from bobo.local0.net (61-68-184-39.tpgi.com.au. [61.68.184.39])
 by smtp.gmail.com with ESMTPSA id u7sm53960083pfm.96.2019.07.29.07.13.26
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 07:13:27 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 00/18] powerpc/64s/exception: cleanup and gas macroify, round 2
Date: Tue, 30 Jul 2019 00:12:29 +1000
Message-Id: <20190729141247.26762-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
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

This series goes on top of the unmerged machine check handler
changes

https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=118814

This carries on with the goal of unwinding macros and consolidating
code. This gets most of the way there, but we have traded that
improvement for another problem, which is the argument list for code
generation macros is unwieldy.

  INT_HANDLER system_reset, 0x100, 0, 0, 0, EXC_STD, PACA_EXNMI, 0, 0, 0, 0, 1

There are two possible ways I see to solve this. One is to come up
with new sets of constants for each argument.

  INT_HANDLER system_reset, 0x100, INLINE, FULL, REAL, EXC_STD, PACA_EXNMI, CLEAR_RI, NO_DAR, NO_DSISR, NO_MASK, KVM

I don't really like that, my preferred way is we can set symbols to 
configure the behaviour of the code generation macro.

  INT_DEFINE_BEGIN(system_reset)
          IVEC=0x100
          IHSRR=0
          IAREA=PACA_EXNMI
          ISET_RI=0
          IKVM_REAL=1
  INT_DEFINE_END(data_access)

  INT_HANDLER system_reset

Any other suggestions?

Thanks,
Nick

Nicholas Piggin (18):
  powerpc/64s/exception: Fix DAR load for handle_page_fault error case
  powerpc/64s/exception: move head-64.h exception code to
    exception-64s.S
  powerpc/64s/exception: Add EXC_HV_OR_STD, for HSRR if HV=1 else SRR
  powerpc/64s/exception: Fix performance monitor virt handler
  powerpc/64s/exception: remove 0xb00 handler
  powerpc/64s/exception: Replace PROLOG macros and EXC helpers with a
    gas macro
  powerpc/64s/exception: remove EXCEPTION_PROLOG_0/1, rename _2
  powerpc/64s/exception: Add the virt variant of the denorm interrupt
    handler
  powerpc/64s/exception: INT_HANDLER support HDAR/HDSISR and use it in
    HDSI
  powerpc/64s/exception: Add INT_KVM_HANDLER gas macro
  powerpc/64s/exception: KVM_HANDLER reorder arguments to match other
    macros
  powerpc/64s/exception: Merge EXCEPTION_PROLOG_COMMON_2/3
  powerpc/64s/exception: Add INT_COMMON gas macro to generate common
    exception code
  powerpc/64s/exception: Expand EXCEPTION_COMMON macro into caller
  powerpc/64s/exception: Expand EXCEPTION_PROLOG_COMMON_1 and 2 into
    caller
  powerpc/64s/exception: INT_COMMON add DIR, DSISR, reconcile options
  powerpc/64s/exception: move interrupt entry code above the common
    handler
  powerpc/64s/exception: program check handler do not branch into a
    macro

 arch/powerpc/include/asm/head-64.h   |   41 -
 arch/powerpc/kernel/exceptions-64s.S | 1264 +++++++++++++-------------
 2 files changed, 623 insertions(+), 682 deletions(-)

-- 
2.22.0

