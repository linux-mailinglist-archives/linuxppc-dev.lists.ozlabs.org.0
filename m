Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C06072963B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 12:04:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcxW62pZ5z3fd3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 20:04:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=lU9N2QnF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=lU9N2QnF;
	dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcxRP6VvTz3f0M
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 20:00:49 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2562cc85d3dso565338a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Jun 2023 03:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686304847; x=1688896847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q7yZjkwR757SzAYNHEABIcCRRLNnVFovUK9RMc9Au7g=;
        b=lU9N2QnFRcoTjcdV2wZK7DWPPQpne4HLUydYbMv0yB+bLcvRLIAQh1KqedYp7QFEz+
         uGKz5MqK+Vv6wXMg06KsZxc+JjhlKW+Enx5F+czrJDaWoe+E6gWAMDfMS7ATKL8pE+08
         N/SU0kjdiVUpMrIO7c2aw5IWXGbtH8Rhjl7IAXZpzPRDgf+SrAM1k3AvPJafAzs6y/LN
         Apg5tBNdcHGBqOl3QbsWyfgVQ/hnfQyhcfewFKjm//WCk0sdBieOp4q2Uy5QLoOkc+zr
         1J54/zKoQJQhAA21NfKfJVp4+qKL8w/Vl7XtU7yhr2m6YbUQqxGworKrf1aHHOxYlrAw
         VmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686304847; x=1688896847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q7yZjkwR757SzAYNHEABIcCRRLNnVFovUK9RMc9Au7g=;
        b=jlKJNkfG9nWP2CybV+rF8p1qT3lNiyVlqivsprc/TGbG95TW583EDCQHLfgHOe5oZK
         IGfh6zsc87yYFgkDtAZO2qKNmww7uoF7ayzrxYXSgDm3eZMutZL6NFf+ifQDcabZy3cn
         O0wKAo2m/TzNP92LRq2DGxdbr+P2Zqi1PonRFS9AOJ062T6lwJK4B5WWzVHynO9r1l5A
         n5kSt3ZxfINpQoubLCLjJAK15I/XunEh+d5y/Iggnx52X81AaN6WnO9EyQr1PH8Dvrk0
         M+1ZcVjYDkkAK9l1a9CHmrfb7k9MF4sFMz0vVpNzhh3fOEyNsxep+9QjA6Ep6PVUVsL+
         IpJw==
X-Gm-Message-State: AC+VfDxpA9zRqF+BLZUyyY+UIyEt2C1FovSvVwGIu6uGboS2ggE8PVH3
	2KZsooS+3l7gb1l4ZTZedTXX9ViWB1g=
X-Google-Smtp-Source: ACHHUZ5wbdTfo0TJHCAbmIQb0QtxzbfOHpdAmkTlZfaSC6OVbKl7agQVOkOTRX5szU7auNCoMxI+CQ==
X-Received: by 2002:a17:90b:b01:b0:252:75ed:eff5 with SMTP id bf1-20020a17090b0b0100b0025275edeff5mr821925pjb.30.1686304847526;
        Fri, 09 Jun 2023 03:00:47 -0700 (PDT)
Received: from wheely.local0.net ([193.114.110.224])
        by smtp.gmail.com with ESMTPSA id jh11-20020a170903328b00b001b077301a58sm2912864plb.79.2023.06.09.03.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 03:00:46 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/4] powerpc/64s: Use POWER10 stsync barrier for wmb()
Date: Fri,  9 Jun 2023 20:00:26 +1000
Message-Id: <20230609100026.8946-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609100026.8946-1-npiggin@gmail.com>
References: <20230609100026.8946-1-npiggin@gmail.com>
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

The most expensive ordering for hwsync to provide is the store-load
barrier, because all prior stores have to be drained to the caches
before subsequent instructions can complete.

stsync just orders stores which means it can just be a barrer that
goes down the store queue and orders draining, and does not prevent
completion of subsequent instructions. So it should be faster than
hwsync.

Use stsync for wmb(). Older processors that don't recognise the SC
field should treat this as hwsync.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/barrier.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/barrier.h b/arch/powerpc/include/asm/barrier.h
index f0ff5737b0d8..95e637c1a3b6 100644
--- a/arch/powerpc/include/asm/barrier.h
+++ b/arch/powerpc/include/asm/barrier.h
@@ -39,7 +39,7 @@
  */
 #define __mb()   __asm__ __volatile__ ("sync" : : : "memory")
 #define __rmb()  __asm__ __volatile__ ("sync" : : : "memory")
-#define __wmb()  __asm__ __volatile__ ("sync" : : : "memory")
+#define __wmb()  __asm__ __volatile__ (PPC_STSYNC : : : "memory")
 
 /* The sub-arch has lwsync */
 #if defined(CONFIG_PPC64) || defined(CONFIG_PPC_E500MC)
-- 
2.40.1

