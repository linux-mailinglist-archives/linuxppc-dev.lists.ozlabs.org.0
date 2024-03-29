Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC15289145B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 08:31:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=asL64p71;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V5XCk4mM9z3w2h
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 18:31:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=asL64p71;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sifive.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=samuel.holland@sifive.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V5X3y5kwkz3vZ6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Mar 2024 18:25:02 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-29fb12a22afso1334806a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Mar 2024 00:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711697100; x=1712301900; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dzRar7ztYXEnRyKAelp48saozJM51jVm9Dh1Zr4pH8s=;
        b=asL64p71m8UwZpJMOBTrYFfjrxjKArWZ+Buyg5BdVZXn/VIwouc4ETFRfktEIrJiMR
         HR7nODDbgtqLX2+V8aNyWiH/Z8NtzcgKAxZVi725fNpz5CKjAFSDJ3xTP3xN2ErYidot
         mAYOjisS0ocgtY5uiAkEE7ngZLKOrPNjd7sP8DUhsBhNZiUj+Iu4TAucS0vs7rHHcrLp
         RpjdIZUGKAr1abHNboz/GTMd8C67NIPv3BSsst5svjCrvi+NqQDZZagAwUy+0iSbuqfF
         WTQv+4udYCxvhp8Tz4xwUFQLRBmLUlqRbRxBde36oDYoWZQd/XBtzaVIeY+QFgJBaSTK
         e7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711697100; x=1712301900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dzRar7ztYXEnRyKAelp48saozJM51jVm9Dh1Zr4pH8s=;
        b=GXhTPmxrBaXehKAUAsF4bQGSJVVWJFUvr9YJ6Mrz6jTO9yhaDNBYC1YuKkTROI1Vj3
         URqkoXk0GzivVO66cDfXCnZH2AgzLEHSBzxJ6Xsq1CqbVAXP6d5WYGAtqh+bF+VD7rOW
         QcVx87lebjZcOr/wNxEbZ/NwwOvv4fSk5Wvz3KXIvnONp737NAKUrvh8YuhuYEjiznKA
         SzDanWu6Y41GKMClLKP+8PpIp5hT9C8lHS9FOI66NAB0SU90KnUvkQnqY5N/losCV/SN
         WFFjfCrI/WK80rSKB9zAephEUTfkZVZdJ+42IixYLLTzAcq2k+DLV/1Pfq8tgpcgMa75
         IuHg==
X-Forwarded-Encrypted: i=1; AJvYcCWk5arFDQMK+g+Bq1ELNOk7HjVOJxIY2yo24zsFye48eF3QH2chYNJBR31W7NY1Rdq9jsCFP4DyMaqzTaf6jqZgq9lfboUeeGvLSkK0yw==
X-Gm-Message-State: AOJu0YxLJ1an/gs9ohq/cltxdhSuVUax27j3UA3rlxpZ1Tw3pjeaSJE7
	V0alc0SxB54byUqC3gF1wInklZ3uCW22JGLnLeegm1Nn75OlpIhvkeYMIcfUWoI=
X-Google-Smtp-Source: AGHT+IEs8kBZu3dBChnRywCF22OnC9/Ej+znSx9gblpEFd+wsOZOeprciOlW3fwk28PpRrFgoWrM2Q==
X-Received: by 2002:a17:90a:d3c3:b0:29e:975:3500 with SMTP id d3-20020a17090ad3c300b0029e09753500mr1446912pjw.28.1711697100232;
        Fri, 29 Mar 2024 00:25:00 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id b8-20020a17090a010800b0029ddac03effsm4971798pjb.11.2024.03.29.00.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 00:24:59 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org
Subject: [PATCH v4 09/15] x86/fpu: Fix asm/fpu/types.h include guard
Date: Fri, 29 Mar 2024 00:18:24 -0700
Message-ID: <20240329072441.591471-10-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240329072441.591471-1-samuel.holland@sifive.com>
References: <20240329072441.591471-1-samuel.holland@sifive.com>
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
Cc: linux-arch@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, Samuel Holland <samuel.holland@sifive.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The include guard should match the filename, or it will conflict with
the newly-added asm/fpu.h.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v4:
 - New patch for v4

 arch/x86/include/asm/fpu/types.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/include/asm/fpu/types.h b/arch/x86/include/asm/fpu/types.h
index ace9aa3b78a3..eb17f31b06d2 100644
--- a/arch/x86/include/asm/fpu/types.h
+++ b/arch/x86/include/asm/fpu/types.h
@@ -2,8 +2,8 @@
 /*
  * FPU data structures:
  */
-#ifndef _ASM_X86_FPU_H
-#define _ASM_X86_FPU_H
+#ifndef _ASM_X86_FPU_TYPES_H
+#define _ASM_X86_FPU_TYPES_H
 
 #include <asm/page_types.h>
 
@@ -596,4 +596,4 @@ struct fpu_state_config {
 /* FPU state configuration information */
 extern struct fpu_state_config fpu_kernel_cfg, fpu_user_cfg;
 
-#endif /* _ASM_X86_FPU_H */
+#endif /* _ASM_X86_FPU_TYPES_H */
-- 
2.44.0

