Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC7E2C51FC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 11:28:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChYrL2ZxnzDrBk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 21:28:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gcK0CZtB; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChYn41ZhTzDr5h
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 21:25:43 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id j19so1369004pgg.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 02:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XuITBhWID8C5/2m3vbKUOJqIkVYKMR1FiQsXpBnojVw=;
 b=gcK0CZtBs7mADPLCIP8oTXS6aFFdEgdbwjO+nq+0DCViZURib1LCUMRS9dRBNnGDET
 UwGXyH5debSUbGVKENI2tLSDmGS3F3oi0NfNlX0KHlSamPHJy658pc9fFmEsYGRWWg18
 2+jYoxXhMcUqzwGo3LZmIPcktiLhFcGkE/MvjrEu8n7cZ8e2Bps9PGFC/hJqCmteKmaz
 Itn/nhVgAmA5z7vAWZZRYBlqXm8HwwTdGFjo2f7FKINpyIgvyOksvPS3CpBYKhODpe2f
 ua8SrFvHOL4wPVgYh9dhg3HFN/1wjAI1EeT3qAtQbua5y9EvrAvE2ews8p9FK9UwJfgN
 dNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XuITBhWID8C5/2m3vbKUOJqIkVYKMR1FiQsXpBnojVw=;
 b=eky6bHxXlFKLjZKMtBV0aImjf8Z2XjpxiFYl50eZMs/FxTNhhAvuVm0vw+N/BHVg3A
 EWefXGwpjgCN5jHdYaK4wvoE0St5GogHWBHPooMRzn5HGIgZT6dobsascjczeA77CgvR
 eDCA878fiuGyun3C7HcBwXhzIPm5Nm57IZ+yGIaF9v231OpPHyNSodvUCddgBVcFHbM+
 KrQLUMQsNdBXmyFXjQsIKHMcFhOHIYyM8c8Kjk/C09Ubs0VB6rvQ33BFwaceOymUbJ1D
 cvArUrwYdKkswForgGMH8V7l0zNfo4E0nTx4uO45IVSexHlZXpzEXURqC/MOF3k+WTv4
 XRYA==
X-Gm-Message-State: AOAM531YHXzclSaKmtZIox7kFL3vhVq3Sr54+WMStUByAQSUmH1oOF22
 CsbSc3y5FkzL7nZh/2TVeMOyI83CFx5/FA==
X-Google-Smtp-Source: ABdhPJyeXg5B63wsNDcLNz6VTzpiqHpy7ip13qusMR9jks8fuYdxhl6niTHJKGAZBdbnbmfIggjKiw==
X-Received: by 2002:a17:90a:9f98:: with SMTP id
 o24mr2973729pjp.207.1606386340976; 
 Thu, 26 Nov 2020 02:25:40 -0800 (PST)
Received: from bobo.ibm.com (193-116-103-132.tpgi.com.au. [193.116.103.132])
 by smtp.gmail.com with ESMTPSA id h7sm4338134pgr.33.2020.11.26.02.25.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 02:25:40 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/4] powerpc/64s: Fix hash ISA v3.0 TLBIEL instruction
 generation
Date: Thu, 26 Nov 2020 20:25:27 +1000
Message-Id: <20201126102530.691335-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201126102530.691335-1-npiggin@gmail.com>
References: <20201126102530.691335-1-npiggin@gmail.com>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Paul Mackerras <paulus@samba.org>, Nicholas Piggin <npiggin@gmail.com>,
 Milton Miller <miltonm@us.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A typo has the R field of the instruction assigned by lucky dip a la
register allocator.

Fixes: d4748276ae14c ("powerpc/64s: Improve local TLB flush for boot and MCE on POWER9")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_native.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/book3s64/hash_native.c b/arch/powerpc/mm/book3s64/hash_native.c
index 0203cdf48c54..97fa42d7027e 100644
--- a/arch/powerpc/mm/book3s64/hash_native.c
+++ b/arch/powerpc/mm/book3s64/hash_native.c
@@ -68,7 +68,7 @@ static __always_inline void tlbiel_hash_set_isa300(unsigned int set, unsigned in
 	rs = ((unsigned long)pid << PPC_BITLSHIFT(31));
 
 	asm volatile(PPC_TLBIEL(%0, %1, %2, %3, %4)
-		     : : "r"(rb), "r"(rs), "i"(ric), "i"(prs), "r"(r)
+		     : : "r"(rb), "r"(rs), "i"(ric), "i"(prs), "i"(r)
 		     : "memory");
 }
 
-- 
2.23.0

