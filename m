Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 038F03EE5F6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 06:55:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpdyD6mQ6z3bnj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 14:55:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=sWi/D1W1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sWi/D1W1; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gpdwv6PKNz307C
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Aug 2021 14:54:23 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id
 gz13-20020a17090b0ecdb0290178c0e0ce8bso1883614pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 21:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mgLagm2p/DAbP1ihGtpujZSYeY0D+L5BEpxvFCne3LE=;
 b=sWi/D1W1Z/zjtM1jfUJlf/TpiZFLRJeBJzh56eJ89yfvZyC/fQLS1C4/HKmW+7+NGL
 kfHqmAov4cGlxhW611tsrdgugFZTZwIHR9VnjUOksRGR++Rt96O90Lp5Q5wAdyS1k7aB
 S6m9k3LPDNYnTbMxpYTTTKBeO5pr9FL3fsjP46hvpa7cOoVLDAdrQSE0L1JD8nGBW6oM
 UO9bk/VcQ5Wn8M+fTB2I/RcodweXyTOOYBuX3XHKdqdyAHDP6h7Q1V1AllSyDCYZLviP
 CJrttYAhOGLq/W46LKNtmSsCO/hfi9VmfQwoy0/k5BHlxJDSWpA04AwQpopEpgA+7Ub1
 G4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mgLagm2p/DAbP1ihGtpujZSYeY0D+L5BEpxvFCne3LE=;
 b=IdqXx64sLFxMxaU2pZeX1KpE6kSlFE84Kb0m365GhW6A7ogox7WT081Ne0tHIMQnh1
 3ZbHYYdBaF6gcl0EsDulBoQd9P9WlqHd7WSOW8KfWg8Rxeejy3xM+Mo953vIFcAzhspy
 BkFw6dGibjAOXpLG+x4tPXg9zRHXZHofGKWtLKdsQzUMY3DjM5IBAU9kUYkYotApKAzZ
 OQFn+/rY+mx0Wgla2UVwtSvlPsFQaDbuBe/3bIeqHszeSzVMzh9nNbKlyzULPwL+CPaS
 qHXpcmFlXwHQaoS2ZZcQYWJQIavivjjnvYsbzW70O2SVznh/mj4plAp7rBPlQUqAinJN
 atkw==
X-Gm-Message-State: AOAM532IvFPexVZ/L4vxwdA4t10gjWkWn9eEQcRgqkGKB+oFo0pdq1IC
 zBNPf9KKSbBjjDfx6Xe7U7w=
X-Google-Smtp-Source: ABdhPJwen2dB2ybRdwbRiqCIQmqYsYTY8UyihLZ8NGv32vlvNcSQ4hPOj/ZtAfve43oOFG8FZOeM/w==
X-Received: by 2002:aa7:9dce:0:b0:3e1:3c5d:640d with SMTP id
 g14-20020aa79dce000000b003e13c5d640dmr1640710pfq.25.1629176060519; 
 Mon, 16 Aug 2021 21:54:20 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id k6sm1029073pgk.1.2021.08.16.21.54.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 21:54:19 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/3] powerpc/config: Fix IPV6 warning in mpc855_ads
Date: Tue, 17 Aug 2021 14:24:05 +0930
Message-Id: <20210817045407.2445664-2-joel@jms.id.au>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817045407.2445664-1-joel@jms.id.au>
References: <20210817045407.2445664-1-joel@jms.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When building this config there's a warning:

  79:warning: override: reassigning to symbol IPV6

Commit 9a1762a4a4ff ("powerpc/8xx: Update mpc885_ads_defconfig to
improve CI") added CONFIG_IPV6=y, but left '# CONFIG_IPV6 is not set'
in.

IPV6 is default y, so remove both to clean up the build.

Acked-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Fixes: 9a1762a4a4ff ("powerpc/8xx: Update mpc885_ads_defconfig to improve CI")
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/powerpc/configs/mpc885_ads_defconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/configs/mpc885_ads_defconfig b/arch/powerpc/configs/mpc885_ads_defconfig
index d21f266cea9a..5cd17adf903f 100644
--- a/arch/powerpc/configs/mpc885_ads_defconfig
+++ b/arch/powerpc/configs/mpc885_ads_defconfig
@@ -21,7 +21,6 @@ CONFIG_INET=y
 CONFIG_IP_MULTICAST=y
 CONFIG_IP_PNP=y
 CONFIG_SYN_COOKIES=y
-# CONFIG_IPV6 is not set
 # CONFIG_FW_LOADER is not set
 CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
@@ -76,7 +75,6 @@ CONFIG_PERF_EVENTS=y
 CONFIG_MATH_EMULATION=y
 CONFIG_VIRT_CPU_ACCOUNTING_NATIVE=y
 CONFIG_STRICT_KERNEL_RWX=y
-CONFIG_IPV6=y
 CONFIG_BPF_JIT=y
 CONFIG_DEBUG_VM_PGTABLE=y
 CONFIG_BDI_SWITCH=y
-- 
2.32.0

