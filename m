Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7182B87E5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 23:44:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CbyXc08BVzDqJ7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 09:44:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--morbo.bounces.google.com
 (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com;
 envelope-from=3s6g1xwukdna8adxa2aa270.ya8749gjbby-z0h74efe.al7wxe.ad2@flex--morbo.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Qbeenus8; dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CbyM164lNzDqc1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Nov 2020 09:35:34 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id r4so3747418ybs.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Nov 2020 14:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=d+bIZ09nG8hw+ySjYPTAu1+6YR5JEF4dm7h9RsWiYik=;
 b=Qbeenus8J+Yy3AHHjbeDXYNZVp9YbvzvVGx40NmvwKbf2I9QAI3t+4z8f5XjjuPSOy
 02a3KZKyNRMwimjWUEwRDV/IZfmIMFSDFuqGRGuAXFyCezM//pWQiSvszKjwboGKOL3d
 Tc2PKuQUtjY40zcH2mU9+bIxipmE0NfmP/8IatEV7ROyOBgl19yxXIm/SxTAvrY9Onm8
 xzGOV3nJyY1oQ4xvYT8gZtcFo5EDGFXu/ZkwKSSzyz0FY9BPoq31vyl30U10+T+O1Mct
 NIGmCadNsI04pmVN2RWVdgqzBwEGDiWa9kQrxw60WUMgOi1Hn1O/SPyEJ8fyr2VyS4o6
 /K0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=d+bIZ09nG8hw+ySjYPTAu1+6YR5JEF4dm7h9RsWiYik=;
 b=KWx4xY8dyllQXdE9JXXkm60sI6PfW4qYTxp+f0VvEQyIWuTQXvKgRQCrWwwFPH//ll
 6S2jVPPC4CaTqqMmcUO53NE9yD6SXhO/y/c0IFw/3OrQ1oI3hTJsYCes1iGC2DfBfn7f
 qcXudGfl8XYuvGJUWOPAhUlao/936iRPej278LWprSPtgQSZFU4fD7F7DrjN3a4iQzQP
 7+Xf1ynNp7s2R9HzRxQDvFxV9lkDJBSkkf3x37YwRyyPDk1R8EiTDLHt0oB63NTxbaK3
 4PPUF6ikeBLuG7lievWKqB76SmVekzxuoM/ekXkk+XJq8HX4HfDiUWoIfFNceDFnIz3f
 V09A==
X-Gm-Message-State: AOAM533OQDVoCoGNArwz8+biy0kfVbDOmSEOVZjJlHUyv+/ATAwz8K/h
 7SybTb1T3uY+WGmzR3B0+BI0x3Vs
X-Google-Smtp-Source: ABdhPJwFfRysLdLZV+NsmWD89ysWODf+empLIvYI6TLjJWfxQnMInllhV2Q4oktp+26/tavXmjubjthRmg==
X-Received: from fawn.svl.corp.google.com ([100.116.77.50]) (user=morbo
 job=sendgmr) by 2002:a25:6a84:: with SMTP id
 f126mr10587979ybc.271.1605738931868; 
 Wed, 18 Nov 2020 14:35:31 -0800 (PST)
Date: Wed, 18 Nov 2020 14:35:12 -0800
In-Reply-To: <20201017004752.415054-3-morbo@google.com>
Message-Id: <20201118223513.2704722-3-morbo@google.com>
Mime-Version: 1.0
References: <20201017004752.415054-3-morbo@google.com>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
Subject: [PATCH 2/3] powerpc/boot: Use clang when CC is clang
From: Bill Wendling <morbo@google.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
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
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The gcc compiler may not be available if CC is clang.

Signed-off-by: Bill Wendling <morbo@google.com>
---
 arch/powerpc/boot/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index f8ce6d2dde7b..68a7534454cd 100644
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
2.29.2.454.gaff20da3a2-goog

