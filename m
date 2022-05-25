Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE31533815
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 10:14:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7P462vYZz3bff
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 18:14:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=B8TgxKi/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=B8TgxKi/; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7P3T2GMRz304r
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 18:13:56 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id
 m14-20020a17090a414e00b001df77d29587so1028991pjg.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 01:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aqYCoIzg60DLqB/tqybZ9OyNDKLGdd2bS+Db0jc9Llw=;
 b=B8TgxKi/iavlYWh/t0g6JJBvT2u8o6RMuZt+Pdfehs87C5x272QcGUYtdepe4dvWKx
 t4OsbbDlOUP0n9nuw/VxlceEyf8nc7mi+E0315eQ/5WvFxruUMh/aRr+dGoqDWZTeP9m
 PtPiZ0y7cGt5VH9QzkHO6BuraDbuLZAk00dj2+bZ5noDvGntA9xDakuSHtDxkgXwWi7C
 38vXLeroCOivaj12QkEEjxXilkTKGrVz39g/0WQjF2q9ilPp6KvdDtyhGNNS5CTCrSj0
 HQhXCm9Tg6T+yvCnNgoOJtJrrZngh/Xs8VLNkUO7KvXzQgMu3sduYQIKGCESEnM5HN0N
 T5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aqYCoIzg60DLqB/tqybZ9OyNDKLGdd2bS+Db0jc9Llw=;
 b=03q1yhFc6ANqH2iBwOfUOqUhGcKlm8RJvpMAy3kAHAxut90BAkxyJMXpaNQ+vE1BZQ
 mg3b+6U0eWJMZLnN0XKRrvC2C9LeTKG8C3VoeZgh2nCSPxyO6hMtKVGa1dXVlPyYUexg
 lOfH/3EEjOf0+RbbAP25/EM6AC6f7EzW5rILWeHhcm4jcPxywiHl/T3Sm+KrXUZsgTlv
 7Ghiq0I9dtsbd9ahcILcnCGSfv7vDpRweVRghO+Jb3wxKUoiiwDO6GQNhs3NgORULDIR
 VpQKtxL4OLtc+zME0u2RByuDSbFqPukt6xt5LVivuvODq7YSEuEX5i8DTH7PGbp8OB4p
 Kb+w==
X-Gm-Message-State: AOAM5337VgnI3kDiMZ99kHwlFy0s9Lx573cD6YkEX2pB/IhEdXesH92K
 EqvdR5P5N40ToCt5Kpbde/90lCCjDlnW5g==
X-Google-Smtp-Source: ABdhPJyB3P56IBRcoGvJv60eO376pPHKsyyUuKpsGMY5wJETB51gQCFpWlLBFZBbAcvZkn31/EW9/w==
X-Received: by 2002:a17:902:f685:b0:161:8df3:7f50 with SMTP id
 l5-20020a170902f68500b001618df37f50mr30639814plg.106.1653466434097; 
 Wed, 25 May 2022 01:13:54 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (220-244-74-131.tpgi.com.au.
 [220.244.74.131]) by smtp.gmail.com with ESMTPSA id
 q22-20020a170902789600b0016230703ca3sm4960936pll.231.2022.05.25.01.13.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 01:13:52 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64: Remove PPC64 special case for cputime accounting
 default
Date: Wed, 25 May 2022 18:13:46 +1000
Message-Id: <20220525081346.871535-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.35.1
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Distro kernels tend to be moving to VIRT_CPU_ACCOUNTING_GEN, and there
is not much reason why PPC64 should be special here.

VIRT_CPU_ACCOUNTING_NATIVE does provide scaled vtime and stolen time
apportioned between system and user time, and vtime accounting is not
unconditionally enabled, and possibly other things. But it would be
better at this point to extend GEN to cover important missing features
rather than directing users back to a less used option.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
After implementing stolen time for GEN for powerpc, can we try this and
see who screams?

Thanks,
Nick

 init/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index ddcbefe535e9..544ed8b0707a 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -473,8 +473,7 @@ config VIRT_CPU_ACCOUNTING
 
 choice
 	prompt "Cputime accounting"
-	default TICK_CPU_ACCOUNTING if !PPC64
-	default VIRT_CPU_ACCOUNTING_NATIVE if PPC64
+	default TICK_CPU_ACCOUNTING
 
 # Kind of a stub config for the pure tick based cputime accounting
 config TICK_CPU_ACCOUNTING
-- 
2.35.1

