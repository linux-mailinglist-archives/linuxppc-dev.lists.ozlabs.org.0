Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 967D8290E62
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Oct 2020 02:49:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCktk3tdTzDqxd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Oct 2020 11:49:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--morbo.bounces.google.com
 (client-ip=2607:f8b0:4864:20::44a; helo=mail-pf1-x44a.google.com;
 envelope-from=3qz-kxwukdowacfpcuccuzs.qcazwbilddq-rsjzwghg.cnzopg.cfu@flex--morbo.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=PdMACSbF; dkim-atps=neutral
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com
 [IPv6:2607:f8b0:4864:20::44a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCks43PhZzDqMk
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Oct 2020 11:48:05 +1100 (AEDT)
Received: by mail-pf1-x44a.google.com with SMTP id b195so2340609pfb.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Oct 2020 17:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=jsPNLKRt0zVT0owId+SX5kSYWOR84snN45v+3a3AfG8=;
 b=PdMACSbFfcgqdAAL0gSxsAQD4S8LWoOWgZOzLX4zHianfpWYE7u71cFGln91BamRuB
 wOut5MrpBl626fI3I/p7Sxoyl/zok3BMWOVssLcxP7V/+kUJmrGmGpbErYn8lz67jQUH
 xiKTETFxSej6pzlzucQzkC08bhJ3IzNsNdqdpQIehHo5bfK24ahWNH4hiAYcEntJpMBI
 uiT6EJEKBW9rjAWS1hOMywMoSYF0Pmw1BfprPxtdP3sEzuQeqiZjHbey+1yhfL/yA5WU
 82DTWh1LMvrEPg5PVVYu2KEJ0hjlf2kebz0WxwK0EHiQSqQTU76Do8fBM39i6pHMfW/8
 WUyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=jsPNLKRt0zVT0owId+SX5kSYWOR84snN45v+3a3AfG8=;
 b=bOUuE5T0hJCVxpXs/65QplD2705pJ8bVxecaz2cte/buM59HQKEgYE2hhzk1r2Uejg
 4xHD512O9ERX1elFqYIDvDLRicoAXC6t08q28aZ5EuUso55gKiznUW5Z5gTRZ6PhbUVL
 8Roo9JogvFs91g8jKULgCMmhHRFlLTKSdzFBaw7Afwdj5x2DseovvpjgAdb2/G2hleKb
 46Evo62PasowMPCBWVs9B/+HPyUqfmAlQdMq8lznIoCiAuVPKoyzxntXjmhe7wObTc9k
 95Nex1idEhVQAdB50te5f/fEm8MJ+RSQLkbnVs9urb7u9pjiaha98ytLwd1qKkyFPTCF
 Av0A==
X-Gm-Message-State: AOAM530udHfiY47hmDEqdsxLKkE+TsXOKMfHG5yPIb7SRV0HDJoVk2xZ
 cL5rYtNXPWRaOhJ7K+QJfSAV/k0vj+5PboSOFaGVa1l8VRTQrR+27kEU70j55UDqikZ/Vfnt7+9
 nlWtv6NjuBaPtxZq6XIRUrAuskke7kgd7UcrybUvrnyK0KwDX+oHo6iGBSBdYMagMgo0=
X-Google-Smtp-Source: ABdhPJyujnTqOo0oeIRLZ0m/4nV2sNP8LxrB+GFRw7Gwqe292l9rX4xyV23m/Uq3+m+5rwTPJ9NFj6/+JA==
X-Received: from fawn.svl.corp.google.com
 ([2620:15c:2cd:202:7220:84ff:fe0f:9f6a])
 (user=morbo job=sendgmr) by 2002:a17:90a:c388:: with SMTP id
 h8mr6690265pjt.100.1602895683144; Fri, 16 Oct 2020 17:48:03 -0700 (PDT)
Date: Fri, 16 Oct 2020 17:47:52 -0700
In-Reply-To: <20201017004752.415054-1-morbo@google.com>
Message-Id: <20201017004752.415054-3-morbo@google.com>
Mime-Version: 1.0
References: <20201017004752.415054-1-morbo@google.com>
X-Mailer: git-send-email 2.29.0.rc1.297.gfa9743e501-goog
Subject: [PATCH 2/2] powerpc/boot: Use clang when CC is clang
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

The gcc compiler may not be available if CC is clang.

Cc: Fangrui Song <maskray@google.com>
Cc: Alan Modra <amodra@gmail.com>
Signed-off-by: Bill Wendling <morbo@google.com>
---
 arch/powerpc/boot/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index b88fd27a45f0..218f1c9adb5b 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -21,7 +21,11 @@
 all: $(obj)/zImage
 
 ifdef CROSS32_COMPILE
+ifdef CONFIG_CC_IS_CLANG
+    BOOTCC := $(CROSS32_COMPILE)clang
+else
     BOOTCC := $(CROSS32_COMPILE)gcc
+endif
     BOOTAR := $(CROSS32_COMPILE)ar
 else
     BOOTCC := $(CC)
-- 
2.29.0.rc1.297.gfa9743e501-goog

