Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (unknown [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92340342A5A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Mar 2021 05:17:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F2SC247VFz3c3D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Mar 2021 15:17:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PrfZRsmz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::62c;
 helo=mail-pl1-x62c.google.com; envelope-from=drinkcat@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=PrfZRsmz; dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F2SBb6QNNz30Gj
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Mar 2021 15:16:36 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id f17so3847833plr.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Mar 2021 21:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AnMg47T8Z7mVw2QYcNj+ca1PflwjFpQ0knP09yHBQe8=;
 b=PrfZRsmz3UsByLzMgIDUIzCr+LhjgOYA+Nh9/H13Agb9hHJi7ziHDjVe3JuOzAL2FX
 xUiC3V+PT+eCW5XYT+iDKAAQ0o3CxYXpEdi8GCRjDUw/U5Of+RBSi7tmM31+HWvwZ7Fm
 XIU5+XedKEFeMg9zmn1ExdTrB4wQMwqm98ODw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AnMg47T8Z7mVw2QYcNj+ca1PflwjFpQ0knP09yHBQe8=;
 b=Ji1w+kUjyb+WTb+IrGRt6rhIo32dYlsJRsxpn/wt7NjNN6TfjBXnmBqExjy72L7vDI
 EK7BbDTSnAXVbk1j0p5HwIEIH0myvE5OKpmjiLKQymZLBG6w3cUJiCo+j5HSllQyN2Lu
 h9YYmVoVU46pJZT8ZroY4rhFI26YQ678RjgjacwgV84MdaUM3qfmymEM7n6UZNnsUhJd
 DxXqZgSDfFdqTaK2Wcumx7bhnUhofwS6isJRfhBWPalCNdyXd3dmQNkiGXqBWlVTSaxe
 h+0HauL/oqATKMlLOa3MdUcZ1blfdNlcVtyil4poGEA8GXcIC/SDwTvMW5ggPLiTJgUk
 ywvw==
X-Gm-Message-State: AOAM532a5lO/zK6touvcUoYdEEu8RRaP/lHTTrDxh47t7FYH1LQT/HrC
 qdpq7zOhyCqcWTiToWeir8puYw==
X-Google-Smtp-Source: ABdhPJw4hRCPEH2/kfcgtaref9TF8lFo2zdT4xoTpYUa2F76wDEZKZFyP619enk9tKUj0PiS8O5eJg==
X-Received: by 2002:a17:90a:ab09:: with SMTP id
 m9mr1910002pjq.122.1616213794673; 
 Fri, 19 Mar 2021 21:16:34 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:f0c7:e1f7:948e:d8d5])
 by smtp.gmail.com with ESMTPSA id s62sm6998869pfb.148.2021.03.19.21.16.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 21:16:34 -0700 (PDT)
From: Nicolas Boichat <drinkcat@chromium.org>
To: stable@vger.kernel.org
Subject: [for-stable-4.19 PATCH v2 0/2] Backport patches to fix KASAN+LKDTM
 with recent clang on ARM64
Date: Sat, 20 Mar 2021 12:16:24 +0800
Message-Id: <20210320041626.885806-1-drinkcat@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
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
Cc: Alexandre Chartre <alexandre.chartre@oracle.com>,
 Peter Zijlstra <peterz@infradead.org>, Christopher Li <sparse@chrisli.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Paul Mackerras <paulus@samba.org>, groeck@chromium.org,
 linux-arch@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 clang-built-linux@googlegroups.com, linux-sparse@vger.kernel.org,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-kbuild@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Daniel Axtens <dja@axtens.net>,
 Michal Marek <michal.lkml@markovi.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Backport 2 patches that are required to make KASAN+LKDTM work
with recent clang (patch 2/2 has a complete description).
Tested on our chromeos-4.19 branch.
Also compile tested on x86-64 and arm64 with gcc this time
around.

Patch 1/2 adds a guard around noinstr that matches upstream,
to prevent a build issue, and has some minor context conflicts.
Patch 2/2 is a clean backport.

These patches have been merged to 5.4 stable already. We might
need to backport to older stable branches, but this is what I
could test for now.

Changes in v2:
 - Guard noinstr macro by __KERNEL__ && !__ASSEMBLY__ to prevent
   expansion in linker script and match upstream.

Mark Rutland (1):
  lkdtm: don't move ctors to .rodata

Thomas Gleixner (1):
  vmlinux.lds.h: Create section for protection against instrumentation

 arch/powerpc/kernel/vmlinux.lds.S |  1 +
 drivers/misc/lkdtm/Makefile       |  2 +-
 drivers/misc/lkdtm/rodata.c       |  2 +-
 include/asm-generic/sections.h    |  3 ++
 include/asm-generic/vmlinux.lds.h | 10 ++++++
 include/linux/compiler.h          | 54 +++++++++++++++++++++++++++++++
 include/linux/compiler_types.h    |  6 ++++
 scripts/mod/modpost.c             |  2 +-
 8 files changed, 77 insertions(+), 3 deletions(-)

-- 
2.31.0.rc2.261.g7f71774620-goog

