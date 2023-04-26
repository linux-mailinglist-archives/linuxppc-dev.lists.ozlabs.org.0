Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 553BD6EEDF3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 08:04:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5pGV1hK0z3cP0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 16:04:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=WMn+Fluq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=WMn+Fluq;
	dkim-atps=neutral
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5p8t4Fb0z3cdX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Apr 2023 15:59:10 +1000 (AEST)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so6269741a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 22:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682488748; x=1685080748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iy39fLjmbx+My1HIdfMmUL3RPnN1+OhXAGLfbeZPBRY=;
        b=WMn+FluqFHbt/t+2GPj1cHEG9zHobsmdjHGCPQ0fNqw0MvKTYveXn6+/rzBDY3IPEb
         QbUxUKvAt9XeGgBFxtAocmphlYB/reSr/6rzFZxXWXDNyIex8JwN/nSQmDZ11SEftgyx
         EMWYXd7fl1UfZT7lgERtmVjY4XFU1ytOgshJB9NJRRaF9thQyI5ELvU0WtOm0QwykexH
         ZI1dYn0KZIZMVgUsiE0d3vheAOXm0yvUCszu1KFzSJ6pyN31SYVR4YqRScawGlY/mIUX
         Dq2lR9uZtifd9hKFcQTenk8uMr9SXueq+r0Lk2DCgUMlNo/YZqaot84QyoyplyDTsbql
         FkzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682488748; x=1685080748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iy39fLjmbx+My1HIdfMmUL3RPnN1+OhXAGLfbeZPBRY=;
        b=IP87DkS7ShhCYMcXcxjZde9jIKYM+0jIZOdsTLsBFgCgCZn43CLUs7ir9CRfgWweDl
         A1yjbKX8ntzb2T7q0fK/iNdkWTGQbaBUAf6byXy3sAcG8x2VWzx+lg0PC2bK1T/cfWBd
         826nyGv4w9O9EqG5Iu1Tg4N5NGMBGxt4RtSXEJ9/pIL6sxYF7E3DOTv+xs5EUSmAa/lX
         ouzD37Zs+i2gu/+Wft+zjrVCns0IRiOgmvfQFAMIjAVLn/8FO4x+i+07+Wx7Tp5Tvxxp
         Y3rTBt2CmNY2eFSxIVk2j3G+Yc0B2cflyzgB9CsJHlLChpKaNni0pffKnLVtPFbZTvR1
         QSfA==
X-Gm-Message-State: AAQBX9cT+oRYfPLQoO3I2jrO+SScm2EZRxSQ7rlNYwWFPzUj0cy7FKin
	w3jiinZyQknfq9rmJkgqFiCjQRSq+fpPrw==
X-Google-Smtp-Source: AKy350b7dHDbXIl6vvtovBg89tp42UrYcVMmBhUwviLTiBID8TU029o1FDb7UCpiA/6qVFsbtO+ptA==
X-Received: by 2002:a05:6a20:ab98:b0:f0:ac6b:379f with SMTP id da24-20020a056a20ab9800b000f0ac6b379fmr20471344pzb.15.1682488747697;
        Tue, 25 Apr 2023 22:59:07 -0700 (PDT)
Received: from wheely.local0.net ([203.221.203.54])
        by smtp.gmail.com with ESMTPSA id f25-20020aa782d9000000b0063a1e7d7439sm10300479pfn.69.2023.04.25.22.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 22:59:07 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 5/9] powerpc/boot: Separate BOOTCFLAGS from BOOTASFLAGS
Date: Wed, 26 Apr 2023 15:58:42 +1000
Message-Id: <20230426055848.402993-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426055848.402993-1-npiggin@gmail.com>
References: <20230426055848.402993-1-npiggin@gmail.com>
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
index bfeb7a9fef9c..99f56c94177f 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -77,7 +77,7 @@ else
 BOOTTARGETFLAGS	+= -mlittle-endian
 endif
 
-BOOTAFLAGS	:= -D__ASSEMBLY__ $(BOOTTARGETFLAGS) $(BOOTCFLAGS)
+BOOTAFLAGS	:= -D__ASSEMBLY__ $(BOOTTARGETFLAGS) -pipe
 
 BOOTARFLAGS	:= -crD
 
-- 
2.40.0

