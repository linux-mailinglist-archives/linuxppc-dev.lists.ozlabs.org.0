Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAF726BEB1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 10:01:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrsxB1NfVzDqFh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 18:01:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=tony.ambardar@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bLL86q+Z; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrsWf1dqRzDqTk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Sep 2020 17:42:31 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id mm21so1130491pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Sep 2020 00:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IjUD0F6XmJJIFT5UAlzkPPx1enPEzZw4LiZfY+PSTUk=;
 b=bLL86q+ZcOR1A4VJ1duYRTdx6XqB66Wn3Xygvjuss1rMYTIezkiOVlB04WJS4wprxK
 czipKQk+YDFnf+SKMSJ/ccEzZ/ZIAfFVPgpLWG1EHWU9Xh1+ViF2F9t8kdYCCNPJqAQ8
 9e+2m/8YKK2E/VNqjidKWHZkxc/KRxvw57jSTQHnyCzoWit53U3pznQLmAqBOoAA8UUw
 44idV0N1OS814TFucxiZUh5wBsveHanKCQD0o3eb/A6CWCUWHItAVK70tImgIeRoZJIS
 vnSISoKxNfD5AMkS1YgCiUd9tCQitEjB1Cc2T0sLC8brqfDTU4JqXgMUzOF5KtAhAiJq
 Vc9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IjUD0F6XmJJIFT5UAlzkPPx1enPEzZw4LiZfY+PSTUk=;
 b=Au8Iy6hT4ijRp1dglNkL2L04v8kI8SioLrOCZs0lui5nmC4WUKAxPaD5B9UWz3ibkp
 jFvk2ZKhfqg0XjIzWpVg3zWnwdbV0hDn6mv1TXOO/Si9xIncqs3QkdaGb631rXOXQZtJ
 GEp4Elyv+cJniWrU6yOkXRpwL6dPl86b8zOWudg5BFFaO0HOtUpuznTwZnocnV/wkcs8
 J85qrve45hpoDgg0S8vXFd2GbyrfDNfQm0CXA2Mu5HQ8nJ46BVGH0lC2DGaqZXMnBWAN
 QL7zEBM2GncUqnHBnxfQxtOVU3EHCZU7KVGvTNpaDfTQ0CS+tkBOsP+4yUs0SLUpXYQk
 T5lQ==
X-Gm-Message-State: AOAM532s/AocPzmE32l8YZBu/q2s/TUnJxOhmG5c/4FCjDpvVTkvOgZv
 bgQkQbD2XXnxXoRXiKoM/WU=
X-Google-Smtp-Source: ABdhPJza/sEXEDVNzVMlUYOQCWVI82fWeZ5KduXPTQK59ttTaEQQZILDfaf521IzMVIQ75m1GsSstA==
X-Received: by 2002:a17:90a:d90c:: with SMTP id
 c12mr2817089pjv.94.1600242147868; 
 Wed, 16 Sep 2020 00:42:27 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:e92d:10:3481:f05e:64c3:d2bd])
 by smtp.gmail.com with ESMTPSA id
 z127sm7393152pfb.34.2020.09.16.00.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 00:42:27 -0700 (PDT)
From: Tony Ambardar <tony.ambardar@gmail.com>
X-Google-Original-From: Tony Ambardar <Tony.Ambardar@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v1] powerpc: fix EDEADLOCK redefinition error in
 uapi/asm/errno.h
Date: Wed, 16 Sep 2020 00:42:14 -0700
Message-Id: <20200916074214.995128-1-Tony.Ambardar@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 16 Sep 2020 17:59:29 +1000
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
Cc: Tony Ambardar <Tony.Ambardar@gmail.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Rosen Penev <rosenp@gmail.com>,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A few archs like powerpc have different errno.h values for macros
EDEADLOCK and EDEADLK. In code including both libc and linux versions of
errno.h, this can result in multiple definitions of EDEADLOCK in the
include chain. Definitions to the same value (e.g. seen with mips) do
not raise warnings, but on powerpc there are redefinitions changing the
value, which raise warnings and errors (if using "-Werror").

Guard against these redefinitions to avoid build errors like the following,
first seen cross-compiling libbpf v5.8.9 for powerpc using GCC 8.4.0 with
musl 1.1.24:

  In file included from ../../arch/powerpc/include/uapi/asm/errno.h:5,
                   from ../../include/linux/err.h:8,
                   from libbpf.c:29:
  ../../include/uapi/asm-generic/errno.h:40: error: "EDEADLOCK" redefined [-Werror]
   #define EDEADLOCK EDEADLK

  In file included from toolchain-powerpc_8540_gcc-8.4.0_musl/include/errno.h:10,
                   from libbpf.c:26:
  toolchain-powerpc_8540_gcc-8.4.0_musl/include/bits/errno.h:58: note: this is the location of the previous definition
   #define EDEADLOCK       58

  cc1: all warnings being treated as errors
  make[5]: *** [target-powerpc_8540_musl/bpftools-5.8.9/tools/build/Makefile.build:97: /home/kodidev/openwrt-project/build_dir/target-powerpc_8540_musl/bpftools-minimal/bpftools-5.8.9//libbpf/staticobjs/libbpf.o] Error 1

Fixes: 95f28190aa01 ("tools include arch: Grab a copy of errno.h for arch's
                      supported by perf")
Fixes: c3617f72036c ("UAPI: (Scripted) Disintegrate arch/powerpc/include/asm")

Reported-by: Rosen Penev <rosenp@gmail.com>
Signed-off-by: Tony Ambardar <Tony.Ambardar@gmail.com>
---
 arch/powerpc/include/uapi/asm/errno.h       | 1 +
 tools/arch/powerpc/include/uapi/asm/errno.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/powerpc/include/uapi/asm/errno.h b/arch/powerpc/include/uapi/asm/errno.h
index cc79856896a1..4ba87de32be0 100644
--- a/arch/powerpc/include/uapi/asm/errno.h
+++ b/arch/powerpc/include/uapi/asm/errno.h
@@ -2,6 +2,7 @@
 #ifndef _ASM_POWERPC_ERRNO_H
 #define _ASM_POWERPC_ERRNO_H
 
+#undef	EDEADLOCK
 #include <asm-generic/errno.h>
 
 #undef	EDEADLOCK
diff --git a/tools/arch/powerpc/include/uapi/asm/errno.h b/tools/arch/powerpc/include/uapi/asm/errno.h
index cc79856896a1..4ba87de32be0 100644
--- a/tools/arch/powerpc/include/uapi/asm/errno.h
+++ b/tools/arch/powerpc/include/uapi/asm/errno.h
@@ -2,6 +2,7 @@
 #ifndef _ASM_POWERPC_ERRNO_H
 #define _ASM_POWERPC_ERRNO_H
 
+#undef	EDEADLOCK
 #include <asm-generic/errno.h>
 
 #undef	EDEADLOCK
-- 
2.25.1

