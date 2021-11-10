Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CB944B9A5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 01:38:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HpmDc5rwGz3cPJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 11:38:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ad7CPz9u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034;
 helo=mail-pj1-x1034.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ad7CPz9u; dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HpmCG2Hg7z2xZm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Nov 2021 11:37:29 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id
 gx15-20020a17090b124f00b001a695f3734aso113669pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Nov 2021 16:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fUIfZeEsg24Rg3Y3hTLTmej9xOdZZZMHYvHW6g9p1g0=;
 b=ad7CPz9u6la29AC50n6shC17hTRQ10Sah6lYgrN5npyWLV5sYsQYCRCBw4I7l+DMoy
 7OY7UvY5Qzz+X65dzKc4JxGTrqFNGLiPS66vemeXEJLFqB1wB5Xx0HgZ6Bo54OPPvby8
 jpg5Iz+vNIvweJmyavU9utyfNsdLiGF2xdpQPX8/ntJR0VByMh5j9uTa8nq5O5tGO253
 06XTKifezw923vRWr3kut0LTLXYPZsjU0zLso1Zpf9MazDqVdC8dguHzzouRUYrD0bD2
 0HJS6BrLou8s1a3aKdm/YaLBeIs4/PL1YSM5Zausg/406au+EE/0Ko4ecqTJzxYTtFup
 NLhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fUIfZeEsg24Rg3Y3hTLTmej9xOdZZZMHYvHW6g9p1g0=;
 b=xI7wMb3A3yuzp+z9V0JZXNVSZQ/U353ERzhowsPEYZ3I4cj+luIml81oC/DgFWmwLW
 CUvSvM7nijinLPKuYzvacFNhd35+pz0LXuAEwemzJGLsNnzzOpDPT6vjGA+LXU/9c4Ow
 /WYf9MS1wWIsUY/vgA1a9nBLaPmlplIFo/9/tFKESH5fKatmrGKUBqmDZQZgENVkiq9/
 Xpxh31EaDfVAqPVkij+kmwn5GmQfFz2bYZNFiBdlb/GgQjpDLY1DsCtAz/EpD2m2yI0Y
 NmCH2HqkrOGrOehErPdnfuKyyd147Bbt5sFJZFEU+W6CYPzOCke5W6p6kFU4m9bORtJk
 bYew==
X-Gm-Message-State: AOAM531qc+8ffy9Z5PjQX3iTLEFbkiQou0LBsUcBQR9NcGSBgoqpROWE
 p+896YFAHcu+yeQlvAqyWDHbCvXDdB7B9g==
X-Google-Smtp-Source: ABdhPJwZ7IOpjLDoeXzp0xOz0cHT3kFaoYzRBe0WP7Qkpe7fzxHLTwt5ccIWeSCzpCyQHZHR55MTVg==
X-Received: by 2002:a17:90b:1d8f:: with SMTP id
 pf15mr8413519pjb.180.1636504642741; 
 Tue, 09 Nov 2021 16:37:22 -0800 (PST)
Received: from tee480.ozlabs.ibm.com
 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id t21sm15854074pgo.12.2021.11.09.16.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 16:37:22 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 0/5] Use per-CPU temporary mappings for patching on Radix
 MMU
Date: Wed, 10 Nov 2021 11:37:12 +1100
Message-Id: <20211110003717.1150965-1-jniethe5@gmail.com>
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
Cc: Jordan Niethe <jniethe5@gmail.com>, cmr@bluescreens.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a revision of Chris' series to introduces a per cpu temporary mm to be
used for patching with strict rwx on radix mmus.

The previous version of the series is here:
https://lore.kernel.org/linuxppc-dev/20210911022904.30962-1-cmr@bluescreens.de/

v7: - introduce helper functions for clearing and restoring breakpoint
      registers when using the temporary mm
    - use a new patch_instruction_mm() function instead of needing repeated
      conditionals and a struct to save state to work within
      do_patch_instruction() 
    - include a ptesync after setting the pte

Christopher M. Riedl (4):
  powerpc/64s: Introduce temporary mm for Radix MMU
  powerpc: Rework and improve STRICT_KERNEL_RWX patching
  powerpc: Use WARN_ON and fix check in poking_init
  powerpc/64s: Initialize and use a temporary mm for patching on Radix

Jordan Niethe (1):
  powerpc: Allow clearing and restoring registers independent of saved
    breakpoint state

 arch/powerpc/include/asm/debug.h |   2 +
 arch/powerpc/kernel/process.c    |  36 ++++++-
 arch/powerpc/lib/code-patching.c | 162 +++++++++++++++++++++++++++----
 3 files changed, 176 insertions(+), 24 deletions(-)

-- 
2.25.1

