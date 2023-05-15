Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E28702304
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 May 2023 06:46:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKRfZ29L8z3cBF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 May 2023 14:46:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=JYzez4PE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=JYzez4PE;
	dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKRdf00fhz3cDG
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 May 2023 14:45:55 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-530638a60e1so4845290a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 May 2023 21:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684125951; x=1686717951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fUDt8eDsobnNvT+2/FdKCb5HDP4KUJCPslvPnEVNPmY=;
        b=JYzez4PEvWhiLXnefG6VbciCTwKfAJm/AZN3E41Y1OmpdRuGepkU+jwmPRw9g16UXl
         mdEO9G87e/6hJkc1dGM0jFEwQJ9vLNwd0dq3p5R2MLmUkis4jSlIZwZl1lp2EkI93TF3
         x/2hs2M0+HxDvwAEhqvz1Sn31F5LMsJuOJMb2BGjfidn5wO3EfrIUxAZBCslr2zcAkWP
         1B98BE0j1CCzmmwbBz01hgXfKvWhRVg3TTRYEdxCHuOp86Vsuo2o2jm8DCizDSwj7fdT
         BBKUQ0b95VQuySlGkfaSvh49q6OyCZoe0gAx/oCMgqijgk7vP0RgR2OvyEYi1zUYYQVu
         ZHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684125951; x=1686717951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fUDt8eDsobnNvT+2/FdKCb5HDP4KUJCPslvPnEVNPmY=;
        b=HjZ3wJA0SgYNKv1o6x2TFLGlgAnXgW6g4NuwwQWUu3dAHnWa9d0NuUbi4zfyXUEOvV
         A9DERSiOV0yM10AM6S74mCIvhPQoktn9cixKxNL73z6XbuFub5nfXZga6IYguuqCJ2Tt
         oz7r3F1F7RAQInXpuHpcDpk/82WjVcUPjkDcGNd9FRbBrvInkotGhU2+8oo0x5AviLj8
         apULVBtwC/DNwirqDk6bncBl4WFhWboWFSoKoQFjIyifxM/oiiQUpjN1j4te2R4ndYrG
         wL0PZjFklN3LrJ5eiMWFdzQJ9kVPO4FaPNOpvQYZ9uwOQsomBq3g8dKTKC2a6d6nnlp0
         6kwA==
X-Gm-Message-State: AC+VfDwlzrEoJi4mqd8V5t4+ZdDfgDqk5EBMpDqtX+9bmWquOo+Bz77Q
	WbdPv6txR13BgtT/dREyZ47eYHOOxROIWw==
X-Google-Smtp-Source: ACHHUZ7idY3BfYirSIelZOsJA0IvWuBDLZDwdHM93x+voXFQeenkSJcSRae7Z2gvQERT21piMshBSg==
X-Received: by 2002:a17:902:e5ce:b0:1ae:e2b:3ad8 with SMTP id u14-20020a170902e5ce00b001ae0e2b3ad8mr4247808plf.66.1684125951558;
        Sun, 14 May 2023 21:45:51 -0700 (PDT)
Received: from wheely.local0.net ([1.146.102.8])
        by smtp.gmail.com with ESMTPSA id u17-20020a170903125100b001a64851087bsm2514018plh.272.2023.05.14.21.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 21:45:50 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/6] powerpc: merge _switch in 32/64
Date: Mon, 15 May 2023 14:45:37 +1000
Message-Id: <20230515044543.78903-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This got a positive response so I'll post again. If anything ppc32 gets
complicated by all the ppc64 crud so if Christophe is okay with it then
it can't be too bad.

Thanks,
Nick

Since v1:
- Don't re-order 32-bit prologue.
- Improve Kconfig conditional includes.
- Break out code changes into their own patches before merging,
  so merge patch leaves generated code unchanged.
- Change prom_entry.S to prom_entry_64.S.

Nicholas Piggin (6):
  powerpc/64s: move stack SLB pinning out of line from _switch
  powerpc/64: Rearrange 64-bit _switch to prepare for 32/64 merge
  powerpc/32: Remove sync from _switch
  powerpc/32: Rearrange _switch to prepare for 32/64 merge
  powerpc: merge 32-bit and 64-bit _switch implementation
  powerpc/64: Rename entry_64.S to prom_entry_64.S

 arch/powerpc/kernel/Makefile                 |  10 +-
 arch/powerpc/kernel/entry_32.S               |  58 ----
 arch/powerpc/kernel/prom_entry_64.S          |  87 +++++
 arch/powerpc/kernel/{entry_64.S => switch.S} | 347 ++++++++-----------
 scripts/head-object-list.txt                 |   2 +-
 5 files changed, 239 insertions(+), 265 deletions(-)
 create mode 100644 arch/powerpc/kernel/prom_entry_64.S
 rename arch/powerpc/kernel/{entry_64.S => switch.S} (59%)

-- 
2.40.1

