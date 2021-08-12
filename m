Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F043EAC1B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 22:50:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlzNb1QHXz3cPJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Aug 2021 06:50:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=eAMZXGbn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--morbo.bounces.google.com
 (client-ip=2607:f8b0:4864:20::849; helo=mail-qt1-x849.google.com;
 envelope-from=3dikvyqukdoszbeobtbbtyr.pbzyvahkccp-qriyvfgf.bmynof.bet@flex--morbo.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=eAMZXGbn; dkim-atps=neutral
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com
 [IPv6:2607:f8b0:4864:20::849])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlzMv1bdRz2yXb
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Aug 2021 06:50:01 +1000 (AEST)
Received: by mail-qt1-x849.google.com with SMTP id
 j1-20020ac866410000b029028bef7ed9e1so3866238qtp.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 13:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=EEcmItRjp8Rm0JAsCYF3K+KT6iLKBKGG/FOXlRG+5Ik=;
 b=eAMZXGbnFvLxMVhR3gp86mUMmYHWjrLDcz6rCE8M4HpdlL57YmicGVKFLMpfSwTyyo
 Lo/0xfixfPgvJ6fclJdnhs48fKXYP5zydkg+2l4B/6QJDC8gnisa149VZ+eUcOx1woeV
 ghTqQB6krRcP+VEmBgShd9dngIIz9qCDrlR14W7mpq5rtW332fC80ialeFYuuIjtm+zb
 z6dLFQpBFk1oz1Bz/BsDoQ5G90N3h80UQgUOTFhp1oEOz01PQLix/43n3QbjIhFqet3Z
 AqIloDHl2SDJsWYRD490aevx5dg5DizH8FRex/MFf/g7DysGwt5R6t8SCQJu1o31wJVJ
 Y/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=EEcmItRjp8Rm0JAsCYF3K+KT6iLKBKGG/FOXlRG+5Ik=;
 b=UeXa9zxn51GpLnoeQiAEWZWcX8s2smpboBh7THX5W9P1YUkm9GBrn4sHDP/CNsNpaI
 tUmxBRXV5m5YRb9LBjEVlqLjUCdyMiicihzXp0i7qWMDID7m+sneGWJaJ9GL58vRT8Sn
 SQ2EIZMItm7pSkq2iJfaL1MaymyWi9dxkac20/4VWybWM3Pf9m2cjfcOCgbWxToKjzSp
 NpiQUqFza7rEZjS032astT4scEoKgwazXoXmSDXMKF85qd7/uOrrgIff2VChqffRWvxE
 nx6HmseNmL+Rzg/PbPG+59bu9Ubl77onJkTn1J/BIHOvzCXILaSY8OsZTZojhrATNgAV
 Bpug==
X-Gm-Message-State: AOAM532ahL/fSpkw1/Yjy4JRzbHE9aG4Z7Jw+spy83ESsW2juDyerY4D
 qza7eJLII7wcCp/S9RsYihfFBHlU
X-Google-Smtp-Source: ABdhPJzYF7MyI9foK3XR/5POi74lS+GXilnDEKS8k7jS6nviaD6lyJyTJ+D2Jl6DyJhhGHTObKhsAzigXA==
X-Received: from fawn.svl.corp.google.com
 ([2620:15c:2cd:202:d96:5aae:6b0e:adc6])
 (user=morbo job=sendgmr) by 2002:a05:6214:892:: with SMTP id
 cz18mr5870385qvb.60.1628801396999; Thu, 12 Aug 2021 13:49:56 -0700 (PDT)
Date: Thu, 12 Aug 2021 13:49:51 -0700
Message-Id: <20210812204951.1551782-1-morbo@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
Subject: [PATCH] ppc: add "-z notext" flag to disable diagnostic
From: Bill Wendling <morbo@google.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Paul Mackerras <paulus@samba.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: Bill Wendling <morbo@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The "-z notext" flag disables reporting an error if DT_TEXTREL is set on
PPC with CONFIG=kdump:

  ld.lld: error: can't create dynamic relocation R_PPC64_ADDR64 against
    local symbol in readonly segment; recompile object files with -fPIC
    or pass '-Wl,-z,notext' to allow text relocations in the output
  >>> defined in built-in.a(arch/powerpc/kernel/misc.o)
  >>> referenced by arch/powerpc/kernel/misc.o:(.text+0x20) in archive
      built-in.a

The BFD linker disables this by default (though it's configurable in
current versions). LLD enables this by default. So we add the flag to
keep LLD from emitting the error.

Signed-off-by: Bill Wendling <morbo@google.com>

---
The output of the "get_maintainer.pl" run just in case no one believes me. :-)

$ ./scripts/get_maintainer.pl arch/powerpc/Makefile
Michael Ellerman <mpe@ellerman.id.au> (supporter:LINUX FOR POWERPC (32-BIT AND 64-BIT))
Benjamin Herrenschmidt <benh@kernel.crashing.org> (reviewer:LINUX FOR POWERPC (32-BIT AND 64-BIT))
Paul Mackerras <paulus@samba.org> (reviewer:LINUX FOR POWERPC (32-BIT AND 64-BIT))
Nathan Chancellor <nathan@kernel.org> (supporter:CLANG/LLVM BUILD SUPPORT)
Nick Desaulniers <ndesaulniers@google.com> (supporter:CLANG/LLVM BUILD SUPPORT)
linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT))
linux-kernel@vger.kernel.org (open list)
clang-built-linux@googlegroups.com (open list:CLANG/LLVM BUILD SUPPORT)
---
 arch/powerpc/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 6505d66f1193..17a9fbf9b789 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -122,6 +122,7 @@ endif
 
 LDFLAGS_vmlinux-y := -Bstatic
 LDFLAGS_vmlinux-$(CONFIG_RELOCATABLE) := -pie
+LDFLAGS_vmlinux-$(CONFIG_RELOCATABLE) += -z notext
 LDFLAGS_vmlinux	:= $(LDFLAGS_vmlinux-y)
 
 ifdef CONFIG_PPC64
-- 
2.33.0.rc1.237.g0d66db33f3-goog

