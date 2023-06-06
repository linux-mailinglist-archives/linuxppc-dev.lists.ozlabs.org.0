Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E45D723822
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 08:50:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qb1Ly2WjQz3fft
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 16:50:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=JgkFs7/p;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=JgkFs7/p;
	dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qb1HS3Szvz3bhY
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 16:47:16 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-65055aa4ed7so3581902b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jun 2023 23:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686034034; x=1688626034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dfulnTsEZdrLf2MiD74jKp1Umsk7hljuVadzaTgxllU=;
        b=JgkFs7/pdEzy8CGFu9C9s2hcVH/mZHK87GNeDE7Ls4buF7H0l2957kigG4g5AOXDM/
         G5nkdYkwfGO2Ma6N8+AmFCdFGSx8stOV1XJr+hDqowforlk7UYEhBzwie9+d3RgOJR3s
         U0f1Gn0b54Mo1+YWyQDzW5PopxmoE7aTuUl8hXcYjdw1VdcRMUA7tyq0AKffTZ0St7XF
         U+TfSEGEtnwWHC0rqUAX/KKjoUlQE8N6ax047AxmYrEPkIXUI/DOCsgS3MoDTzOKJJR6
         d2mLJSMT6sjQ6gVIfScDPHJTo7XvtGjJeaARc377cUYKThCT9cfx1PFXp6bODW3VwEcK
         ufLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686034034; x=1688626034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dfulnTsEZdrLf2MiD74jKp1Umsk7hljuVadzaTgxllU=;
        b=Z1LrX6h8s2uWjZVXB7FsDSWoqFN+lsWa3SYQVXSMxv3FrgWwhdjBCtNDt4lo9a6xBr
         0dWUaoRZrD3RQvL6gVHv5dRLVnvc4MYFJfTVQtpJCbhY1c7kN6n47S8AnA2SpD7/B8cX
         c/z4EgC5HhbU7I6pkQm6UqfwFltOnpntzT4MPLoyS9UZSGGYpkawEbf2cDeViW5CG8Jn
         EtZG0EFucn8p3o/n37fyumuiteOg9FkenbPwSsR1vkpMsI+2Wsqw3PrSpCd9UjjDxFmv
         5cPFOLukiK9yhPt75jn/TorVgnNsIs4T8uA7oXubW0XsFkJlPWVs3h6XTgozvTTIacC3
         Knag==
X-Gm-Message-State: AC+VfDyNT7UJCTt30PDuE9E9Zy4lKikUD/l/zVgpBrxg0t8a/LlHMy/c
	eyurzR+QTgaY4dapae9WYF9LDcb7u2g=
X-Google-Smtp-Source: ACHHUZ4aJLcA/0CpKIED2j5mSxixdKoQFQzL8PZGnq5k7V8RvjcikYMe+Ci1cr0yxerB0sxjleNKUA==
X-Received: by 2002:a05:6a00:2ea7:b0:65a:6870:3ae6 with SMTP id fd39-20020a056a002ea700b0065a68703ae6mr702689pfb.22.1686034033804;
        Mon, 05 Jun 2023 23:47:13 -0700 (PDT)
Received: from wheely.local0.net ([1.146.61.5])
        by smtp.gmail.com with ESMTPSA id c14-20020aa78e0e000000b0063d24fcc2besm6130449pfr.125.2023.06.05.23.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 23:47:13 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 3/4] powerpc/boot: Separate BOOTCFLAGS from BOOTASFLAGS
Date: Tue,  6 Jun 2023 16:46:56 +1000
Message-Id: <20230606064657.183969-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606064657.183969-1-npiggin@gmail.com>
References: <20230606064657.183969-1-npiggin@gmail.com>
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

BOOTCFLAGS no longer contains anything that BOOTASFLAGS needs (except
-pipe). Separate them to avoid fragility with cross-contamination of
flags which has caused several build problems.

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Link: https://lore.kernel.org/lkml/CAHk-=whyWUdJDeOBN1hRWYSkQkvzYiQ5RbSW5rJjExgnbSNX9Q@mail.gmail.com/
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/boot/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 9445ec442512..9cdc0858b256 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -76,7 +76,7 @@ else
 BOOTTARGETFLAGS	+= -mlittle-endian
 endif
 
-BOOTAFLAGS	:= -D__ASSEMBLY__ $(BOOTTARGETFLAGS) $(BOOTCFLAGS)
+BOOTAFLAGS	:= -D__ASSEMBLY__ $(BOOTTARGETFLAGS) -pipe
 
 BOOTARFLAGS	:= -crD
 
-- 
2.40.1

