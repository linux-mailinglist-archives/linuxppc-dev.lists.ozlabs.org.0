Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CC33412CB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 03:26:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1nnN4yzJz3c1R
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 13:26:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CdkMN8s1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::52f;
 helo=mail-pg1-x52f.google.com; envelope-from=drinkcat@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=CdkMN8s1; dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1kQw4S7Nz2yR3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Mar 2021 10:54:45 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id e33so2480081pgm.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 16:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8WJ6qFjujuk84HtZNxKJ3XhHk2SJ/KWCJ14sG1Kz83s=;
 b=CdkMN8s18bbHU7BWYnXpDrRJmP+p4loTeWJJyqcx4HuZvW1Vda8z98Y2ASlcHTIJGT
 kfGOknuMJnd5wDtVN36rhZHHw/YqtK0aGw06udFaXsPxfcgyueVtA7HHrkGtkhobE5G7
 5dNTO5PUp7Y4vbrkQ5AISjIAmImTZQcvd/6NA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8WJ6qFjujuk84HtZNxKJ3XhHk2SJ/KWCJ14sG1Kz83s=;
 b=aOar0drT8mhzM3LQuVkQ3uys13kDk/YgqIsdugW/fEwTnwGl8el4EchKrWnEWd+0eD
 Skj1oYi3aD8a1cWBQnapbVGClkQf43XM5cFW2x5RUgNtBzQnfNmD6Qtw9wCfqpgXAwGN
 ONy3YI3rWJgIaigvCoIQu9sIFR/s6ExzDRDmHyzU+MEuM2n3YBo2kZht0Ab6R04RaMO/
 T05hKSAwKjk9aasqnjzmEmtaLB+b1YzaQHYiSkgmWYyvcmpkM2e077VsPk9D2vZc0IQT
 Ig5nYYNP5UL8aspLQbPiNF83Okh8Ls/+C2djVeZpGqs92wLBzm9EqJiNVMS3N/PX4ywS
 C5Yg==
X-Gm-Message-State: AOAM533q69gW2sdEvcqvfRBp8LoB5s5JsfZcKBE8s+uzLPqqdH8upQrP
 F4vvCNzQDnz/vsdq5eFxMRZZ/g==
X-Google-Smtp-Source: ABdhPJxXmm1o5PbpOMlqhlmpnaK9uuEh/v/JENGCPwg/wnedfsiovOHRc3DPwhGQCHSShTfkWFXJGg==
X-Received: by 2002:a62:e119:0:b029:1f8:9345:a099 with SMTP id
 q25-20020a62e1190000b02901f89345a099mr6618116pfh.21.1616111682271; 
 Thu, 18 Mar 2021 16:54:42 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:dc70:2def:a801:e21b])
 by smtp.gmail.com with ESMTPSA id t7sm3295816pfg.69.2021.03.18.16.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 16:54:41 -0700 (PDT)
From: Nicolas Boichat <drinkcat@chromium.org>
To: stable@vger.kernel.org
Subject: [for-stable-4.19 PATCH 0/2] Backport patches to fix KASAN+LKDTM with
 recent clang on ARM64
Date: Fri, 19 Mar 2021 07:54:14 +0800
Message-Id: <20210318235416.794798-1-drinkcat@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 19 Mar 2021 13:25:13 +1100
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
 Paul Mackerras <paulus@samba.org>, Sasha Levin <sashal@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, clang-built-linux@googlegroups.com,
 linux-sparse@vger.kernel.org,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, linux-arch@vger.kernel.org,
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

Patch 1/2 is context conflict only, and 2/2 is a clean backport.

These patches have been merged to 5.4 stable already. We might
need to backport to older stable branches, but this is what I
could test for now.


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
 include/linux/compiler_types.h    |  4 +++
 scripts/mod/modpost.c             |  2 +-
 8 files changed, 75 insertions(+), 3 deletions(-)

-- 
2.31.0.rc2.261.g7f71774620-goog

