Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD1B9DC02
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 05:32:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HZF03K5VzDqrW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 13:32:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rmFm9dx/"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HZCC1XL6zDqng
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 13:30:46 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id o70so13156948pfg.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 20:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ba7ULwLyZjBq/rA8tIKv4sxjqRp2+c2D1oz27h1rh4s=;
 b=rmFm9dx/D5saHz/58A4BEc/INzCITcn6HR+xgMUVVg3mD8hS+TwfliX1fXeT9FWgfI
 ObeuIf7+MzadBadVI8tcil53Vu2WUk6zzbXZcn5hPQB9owqmRtcMkGSoEP4MbEKFqMEt
 CHfNzq9utJvXT3/NSHo2wI2cFcVsawAH41tdZm9JnKleFr5Z9Fiv+naVimExa0/fcYF0
 NW7lEXFGKTjRv5TFysTY+u8qap+S6bzX9o+uUnKN8P4c8KpZ0/NedLpZ0LLWorw+l/DE
 eHwZ4ArTUwy8HBrNS8wUPZ2E3luVv3hhhA2NIn0lEaRZur8F2SfTTiQWUCdrc8+gXnsS
 rR0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ba7ULwLyZjBq/rA8tIKv4sxjqRp2+c2D1oz27h1rh4s=;
 b=WRPuMqM5nHYZQRZuozw12Ef5pWPcfA1JCVAc75OpFpgpCZihOe/khfY/qxh3YsPX/h
 GXkpk7P+giOAWRa+V23ikpYZaORS97H5zAiC7vnsTWrLEpxkvmpyTDMIkvZT0JCggcKW
 x3hVKG2Q+l49r+neNGtMrT6KceqB8VGJxTD/xSP9FXN+z+d2IZrAtnl2OnETvNAC8BOd
 SrKMlbHDECg55ZtaFVpbpByJ+q1T9++UV9/VhplJxa7HB+R9ZQSWC/3icJfbsglNHWtF
 FO8Shb87uWcVsha6ALHwtBPUJrKcYhI5W4z8/zlLUsJ8kbztaxS+kOiBwAftBwN1YchY
 6SNw==
X-Gm-Message-State: APjAAAUt+7A+uzWWHgFVXUUneFmpMKtTT7DKbhHBd5Run/qKyH5KKRsA
 XEH2nECXaff64wSF8HjnF8g8vPK4
X-Google-Smtp-Source: APXvYqzPxzLtvCqAJQworI3YuM5C7rd4oXWo0/7XFfK5sw0swpeJyf4yNh9nM3rYrRPp6dkT/l/H/A==
X-Received: by 2002:a17:90b:14c:: with SMTP id
 em12mr10818638pjb.28.1566876642570; 
 Mon, 26 Aug 2019 20:30:42 -0700 (PDT)
Received: from bobo.local0.net (14-202-91-55.tpgi.com.au. [14.202.91.55])
 by smtp.gmail.com with ESMTPSA id x24sm11383984pgl.84.2019.08.26.20.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 20:30:41 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/4] powerpc/64: syscalls in C
Date: Tue, 27 Aug 2019 13:30:05 +1000
Message-Id: <20190827033010.28090-1-npiggin@gmail.com>
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

This hasn't been highly stress tested or tested all cases (like 32-bit
binaries, single stepping, etc.) but so far it's running stable doing
normal kernel development and microbenchmarks.

Thanks,
Nick

Nicholas Piggin (4):
  powerpc: convert to copy_thread_tls
  powerpc/64: remove support for kernel-mode syscalls
  powerpc/64: system call remove non-volatile GPR save optimisation
  powerpc/64: system call implement the bulk of the logic in C

 arch/powerpc/Kconfig                      |   1 +
 arch/powerpc/include/asm/asm-prototypes.h |  11 -
 arch/powerpc/include/asm/ptrace.h         |   3 +
 arch/powerpc/include/asm/signal.h         |   2 +
 arch/powerpc/include/asm/switch_to.h      |   4 +
 arch/powerpc/include/asm/time.h           |   3 +
 arch/powerpc/kernel/Makefile              |   3 +-
 arch/powerpc/kernel/entry_64.S            | 424 ++++------------------
 arch/powerpc/kernel/exceptions-64s.S      |   2 -
 arch/powerpc/kernel/process.c             |  15 +-
 arch/powerpc/kernel/signal.h              |   2 -
 arch/powerpc/kernel/syscall_64.c          | 202 +++++++++++
 arch/powerpc/kernel/syscalls/syscall.tbl  |  22 +-
 13 files changed, 305 insertions(+), 389 deletions(-)
 create mode 100644 arch/powerpc/kernel/syscall_64.c

-- 
2.22.0

