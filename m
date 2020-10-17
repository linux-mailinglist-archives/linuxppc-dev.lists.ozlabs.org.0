Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 132A5290E4E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Oct 2020 02:03:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCjsY0XTDzDr3N
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Oct 2020 11:03:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--morbo.bounces.google.com
 (client-ip=2607:f8b0:4864:20::84a; helo=mail-qt1-x84a.google.com;
 envelope-from=3djskxwukdasxz2mzrzzrwp.nzxwty5800n-op6wt343.zawlm3.z2r@flex--morbo.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=c4I6GyNY; dkim-atps=neutral
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com
 [IPv6:2607:f8b0:4864:20::84a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCjr30T0VzDqx1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Oct 2020 11:02:02 +1100 (AEDT)
Received: by mail-qt1-x84a.google.com with SMTP id b12so2370527qte.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Oct 2020 17:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=4qX6R8ATeno1n1khz5HXB0Z4nN7hHOns/0/s7ydkqQw=;
 b=c4I6GyNYE01O83HBrm121Fa4E4Uhm3NTjTsfEDeBn8m4qwddXVxaE1mKTAV2h72D0G
 rMUS5zTFupfRRjMFec07LxJCnVr35uqJEtcgPAlwvxhGXKtzMhAj5ZcKuw4c6JLllgBI
 rmtbipLhtno2XDvH1Bzza8nf/gGRx0JSLSbtEUnLMGVaTsdyoxx2k0w9gNfNfCbM8G9u
 PzUV3cluEBb/K5HiOvLTSJ7PpzQ98Lk9uSc3+NiHuF1ScjiauTlVByJBFPiDlMLu3Pad
 rywdCFbi9+FVCVYdgnNjvO2uGMJLyE3vrWv/WkqrhMJ364eWmkzwgBAHlDgKCPx1oYtB
 M3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=4qX6R8ATeno1n1khz5HXB0Z4nN7hHOns/0/s7ydkqQw=;
 b=A4HkmLAuwOXdmefSkQNb5oRWbO8/1hN5e65ai6nwBCbAvpAzEEpcfCVlztSTq1ik0V
 6uc8X4Prrji456SQ4fxGy8jWuV4VRLFl5jLTYVo2msAKBRagg8fi+Y81wF3DY/wkVHwK
 OXqMhaGNcSeOg7mIKloyf6+ofhUoDkXSomeLwH4QpxxtidXZnwJ1RXVMKOsTaPgzdRk0
 Iqa2hJfeJlhBE3g7m1vvxZdUWOxDnBwUeSWaWlikaU+1TCOhw14JZyDSXOKdDtDet2O/
 c6hFHU58vbDwvQ23VGrYjQRgr8qV4+S63OqBc4W1UaiTUQDtfeDCvVZqG4rp5NGTU7C4
 5WHA==
X-Gm-Message-State: AOAM533prTaI1gwVqy3wjo6n2CpvPtxDhYgU6SPEAMiyAzRZU6eBVKyQ
 Dnf+2Ii63JNYAXlCioaPOCvJ67+MOXrFTmD3LML75UsnFHB0tseLd1brM76s5YEDO/ECdQZfCW6
 d1T6CRl36oHi20fqRCnREzEfDbQLiLTSDPeztG+dFWhsuTMdfDkwjyQJLC1ALV6R/AG4=
X-Google-Smtp-Source: ABdhPJxwWl1HNU/s7TzUDYtEwiDxZoITL86v6HyrcvOJwJ9+5nfzIE8DoPu/aJLdbEpdeCnCmlAalfTIgw==
X-Received: from fawn.svl.corp.google.com
 ([2620:15c:2cd:202:7220:84ff:fe0f:9f6a])
 (user=morbo job=sendgmr) by 2002:a0c:e346:: with SMTP id
 a6mr6581232qvm.9.1602892918177; 
 Fri, 16 Oct 2020 17:01:58 -0700 (PDT)
Date: Fri, 16 Oct 2020 17:01:51 -0700
Message-Id: <20201017000151.150788-1-morbo@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.0.rc1.297.gfa9743e501-goog
Subject: [PATCH] powerpc/boot: move the .got section to after the .dynamic
 section
From: Bill Wendling <morbo@google.com>
To: linuxppc-dev@lists.ozlabs.org
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
Cc: Fangrui Song <maskray@google.com>, Alan Modra <amodra@gmail.com>,
 Paul Mackerras <paulus@samba.org>, Bill Wendling <morbo@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Both .dynamic and .got are RELRO sections and should be placed together,
and LLD emits an error:

  ld.lld: error: section: .got is not contiguous with other relro sections

Place them together to avoid this.

Cc: Fangrui Song <maskray@google.com>
Cc: Alan Modra <amodra@gmail.com>
Signed-off-by: Bill Wendling <morbo@google.com>
---
 arch/powerpc/boot/zImage.lds.S | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/boot/zImage.lds.S b/arch/powerpc/boot/zImage.lds.S
index a21f3a76e06f..d6f072865627 100644
--- a/arch/powerpc/boot/zImage.lds.S
+++ b/arch/powerpc/boot/zImage.lds.S
@@ -34,6 +34,17 @@ SECTIONS
     __dynamic_start = .;
     *(.dynamic)
   }
+
+#ifdef CONFIG_PPC64_BOOT_WRAPPER
+  . = ALIGN(256);
+  .got :
+  {
+    __toc_start = .;
+    *(.got)
+    *(.toc)
+  }
+#endif
+
   .hash : { *(.hash) }
   .interp : { *(.interp) }
   .rela.dyn :
@@ -76,16 +87,6 @@ SECTIONS
     _esm_blob_end =  .;
   }
 
-#ifdef CONFIG_PPC64_BOOT_WRAPPER
-  . = ALIGN(256);
-  .got :
-  {
-    __toc_start = .;
-    *(.got)
-    *(.toc)
-  }
-#endif
-
   . = ALIGN(4096);
   .bss       :
   {
-- 
2.29.0.rc1.297.gfa9743e501-goog

