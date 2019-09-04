Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D97A7A81B2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 14:01:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Nj8f5qwyzDqbm
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 22:01:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gXhemPkX"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Nj2j5KQHzDqnR
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 21:56:12 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id 205so10644635pfw.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2019 04:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1Tdt+m9Pe17PmbDCBykPXAs/aRyoLtwXsPZ3Sa51E28=;
 b=gXhemPkX1IKdc6eyj6x6gvglb+PK71AK6u9uoFl3X2A8t0Nm0Lq9n6lnvROOZywp4M
 O8hFWvHU8io49n+oiRan3PzvWrhnBh1ymyFifdVH6prJu0vycQHUFhml1BwDK0neA5Wa
 h+OM7TxfBbOyTOxJhXRAnDHFBvM69t8Ywjadbswo0PRf1qS9b5kDntHOBMtdUFhbgfMO
 2FldV44bsfrOjGQevkCqPEQX+Gtj5uTs1p8dx2Xp02fwNRty/LArgQmc8graLtVD4c1A
 HsjJq1ORLpx8KRCASZbYTWN7yq0b/oHK52HXz9Uy/KyT5G5QfHAdFH2wXChfHl8NwJkq
 u7Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1Tdt+m9Pe17PmbDCBykPXAs/aRyoLtwXsPZ3Sa51E28=;
 b=AzZF2Tlenv00UH3ez98mwa2XSuPLF9z+ivEUw7BS3fOg4br8rog3ThRthZK0GCu3NV
 dvr5XC0WcrZR8oSJT8rELUZLI+Q0QUop2LUzSs9i8orHCukcntyu1DZSapD4ByaRhOxw
 e09Ku5P8ztm1sN9KVhzlq2lct3R0kLWV6m/+EWZIrv+x83pSmasrtoLK0+Gn+6BncXz2
 HcPGIh0delpICm5efgh2IpAwu421iI0Lj62WBq22boHcBp+8N6tGoTpSX/bUSaya3oS7
 CJfaR0aKJ0pi0mm6eqKUmZAaaGeZhPSlvP1a64myEVTlPXplHs5aMmkBLVsE0hOKP4Hh
 us6A==
X-Gm-Message-State: APjAAAXdogJkoesfe1emHWD3FwvybE8hUjyC+ynxFlQObIGDcDLZjpTi
 ftIvjWPzH1e5AMC6465pl4KMd2Uw
X-Google-Smtp-Source: APXvYqys0/54lanhSJmRZHdgPpAe2Hfg5cN1idll+2GmbmlgXjogcz9BRYew07pm1uYpVFCVO7iL+g==
X-Received: by 2002:aa7:9ddd:: with SMTP id g29mr29616936pfq.146.1567598168659; 
 Wed, 04 Sep 2019 04:56:08 -0700 (PDT)
Received: from bobo.local0.net ([203.63.189.78])
 by smtp.gmail.com with ESMTPSA id g18sm19554789pgm.9.2019.09.04.04.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 04:56:08 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 00/20] remaining interrupt handler changes
Date: Wed,  4 Sep 2019 21:55:15 +1000
Message-Id: <20190904115535.18559-1-npiggin@gmail.com>
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

This is a rebase of the remaining patches in this series to the
powerpc next branch

https://lore.kernel.org/r/20190802105709.27696-2-npiggin@gmail.com

Plus the next series. A few improvements were added, such as using
the name=val style of parameter for invoking macros.


Nicholas Piggin (20):
  powerpc/64s/exception: Introduce INT_DEFINE parameter block for code
    generation
  powerpc/64s/exception: Add GEN_COMMON macro that uses INT_DEFINE
    parameters
  powerpc/64s/exception: Add GEN_KVM macro that uses INT_DEFINE
    parameters
  powerpc/64s/exception: Expand EXC_COMMON and EXC_COMMON_ASYNC macros
  powerpc/64s/exception: Move all interrupt handlers to new style code
    gen macros
  powerpc/64s/exception: Remove old INT_ENTRY macro
  powerpc/64s/exception: Remove old INT_COMMON macro
  powerpc/64s/exception: Remove old INT_KVM_HANDLER
  powerpc/64s/exception: Add ISIDE option
  powerpc/64s/exception: move real->virt switch into the common handler
  powerpc/64s/exception: move soft-mask test to common code
  powerpc/64s/exception: move KVM test to common code
  powerpc/64s/exception: remove confusing IEARLY option
  powerpc/64s/exception: remove the SPR saving patch code macros
  powerpc/64s/exception: trim unused arguments from KVMTEST macro
  powerpc/64s/exception: hdecrementer avoid touching the stack
  powerpc/64s/exception: re-inline some handlers
  powerpc/64s/exception: Clean up SRR specifiers
  powerpc/64s/exception: add more comments for interrupt handlers
  powerpc/64s/exception: only test KVM in SRR interrupts when PR KVM is
    supported

 arch/powerpc/include/asm/exception-64s.h |    4 -
 arch/powerpc/include/asm/time.h          |    1 -
 arch/powerpc/kernel/exceptions-64s.S     | 1859 +++++++++++++++-------
 arch/powerpc/kernel/time.c               |    9 -
 arch/powerpc/kvm/book3s_hv_rmhandlers.S  |   11 -
 arch/powerpc/kvm/book3s_segment.S        |    7 -
 6 files changed, 1303 insertions(+), 588 deletions(-)

-- 
2.22.0

