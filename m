Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E837729630
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 12:02:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcxTD1DKdz3fh2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 20:02:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ncEkNY11;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ncEkNY11;
	dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcxRM26Xxz3f0r
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 20:00:46 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-64d18d772bdso1637059b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jun 2023 03:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686304841; x=1688896841;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I3qEUcp9VtH7fSu0EhO1yZM8TfaADYffpYWhYVNdp30=;
        b=ncEkNY11kDE8NjfXAQx1zkrVUp11yFiJeH7pSqTJq0wMFiMuFGfXP4MYkwk40+6Owq
         Lv5ujBOS11RkRBgBThHqam57+4F1fV8uXmAGMJKBu+zVGP2HVLqAQmv/ealRPi6Tn4fU
         mbHisb74F9r6afzam23CSyxZrx4nK14PSWQ4X0Q1YbIgudTMQ2HK88KeDsns0gT/p7Dp
         anokNWBS9LgIy6ovCsyZHlCQKZ8KagAW0FcwdU6t6OPLyAcktF4ZhxSPFiNMxKW3qF8x
         TKXpF/KXlWfxVTPmbiVempjhCT49AX6u2DaPZKC89EUdVrN23144ol56TACB2m+Ovbj0
         drqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686304841; x=1688896841;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I3qEUcp9VtH7fSu0EhO1yZM8TfaADYffpYWhYVNdp30=;
        b=WiOPhIlfP5vwXeRkTrAvQrEqKXuZjtyrrn/ngl68cPl5rOZnWDD6Gvz5Gb574aPOPc
         KA28ReePneUVgErBukBoIXw519qAOD5siiIk6S46xU77PSJ1IDijipwakcj4JJdcn2ZO
         fzfCUoHnAMV4NN54NkhrLEGQpbj4yCjltvHLAQbhdFIhIkIio9+gd0CVNxGXX2GgUiij
         l4uAnJ4E03CpzUBXJgUDjRikZPblGVzTL5UBodLRvwZWvqgZv/FNY54Wk49WR8eo6O6Q
         qzJvC34i7rvDIXuI5ZUJjpY3CD0EzOPk5GHg6c69rlBRqx+9z+FU3ZwOzIcKeEpB6Wce
         vfPw==
X-Gm-Message-State: AC+VfDz5do4GpRLbRyYKhiT5u8HSeHcm9T14U0K19ayx2R30XyMzxMrS
	z8HRVUduo8Xxs/0/HCgHIN+XsDwnUtQ=
X-Google-Smtp-Source: ACHHUZ4dH5gbqopm7vLiOPFzNrCFHaxR6RheX9uxqxQoD6qfP9uPIDFp9QT2SIuwPcsfYvtiSr+Jkw==
X-Received: by 2002:a17:902:9b8b:b0:1b1:d0b2:b9b3 with SMTP id y11-20020a1709029b8b00b001b1d0b2b9b3mr792598plp.23.1686304839514;
        Fri, 09 Jun 2023 03:00:39 -0700 (PDT)
Received: from wheely.local0.net ([193.114.110.224])
        by smtp.gmail.com with ESMTPSA id jh11-20020a170903328b00b001b077301a58sm2912864plb.79.2023.06.09.03.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 03:00:38 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/4] powerpc: Make mmiowb a wmb
Date: Fri,  9 Jun 2023 20:00:23 +1000
Message-Id: <20230609100026.8946-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

mmiowb must ensure MMIO stores inside a spin lock critical section on
one CPU will not be seen by the device after another CPU takes the
same lock and performs MMIOs.

This just requires cache inhibited stores to be ordered with the store
to unlock the spinlock, so wmb() can be used.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/mmiowb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/mmiowb.h b/arch/powerpc/include/asm/mmiowb.h
index 74a00127eb20..cd071fb97eba 100644
--- a/arch/powerpc/include/asm/mmiowb.h
+++ b/arch/powerpc/include/asm/mmiowb.h
@@ -9,7 +9,7 @@
 #include <asm/paca.h>
 
 #define arch_mmiowb_state()	(&local_paca->mmiowb_state)
-#define mmiowb()		mb()
+#define mmiowb()		wmb()
 
 #endif /* CONFIG_MMIOWB */
 
-- 
2.40.1

