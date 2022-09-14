Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB14E5B8C37
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 17:49:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSPrw6SrZz3cNM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Sep 2022 01:49:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QakjMd/s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QakjMd/s;
	dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSPqf32lzz2xy4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 01:47:58 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id o23so13713497pji.4
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Sep 2022 08:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=I5YhyHRIp01bb/wdnhQzGTcelGovlrFL/Fr3jrEtPGA=;
        b=QakjMd/sCYD0aU+vI6vFsPKsScaFLf6weP3BkuhzwVN0Znh6IAGPQxDFLIQzjMwkNH
         owUbSfnqGXPhXz0e58jboYo9usT+tscw5btRV391oybdjyNnzZkjFPue1U90Y358Ybeq
         VK99iurYbmaXA8YE7lyPfg9y9rFTw4Nivhf3t9Kmcwq2a7IVE+f7tmLE8IEHeq6nzh2c
         inFpKYiSO8sZ7U0vpIFBRRIOv35eL7nY8GUyJiThMOaDqjiXpQBOepe0sgPKU4iV3Gml
         dqNTzngajiZSjHVom/9Jkn8zViIUOOQ0TTNYqQntoazbdoDYhhp2yfabwMk8ERe1ek5R
         A52A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=I5YhyHRIp01bb/wdnhQzGTcelGovlrFL/Fr3jrEtPGA=;
        b=DJb52DMsDS+Gqonjgx8siGTDY7EgkWw64kq7aWdMgzBgynhmnDpXaLOuZLjmI7FQna
         wUN2KFw+RpGtqPsQ3PjMMQojD5I+kVneHctxviE/74j4CsyNaVpvqnCO86og6eMU4Rly
         xBAhKbjzZ9xeEfuFaStVmAx4TGjT65EWz89NPA7JdaNODvZx/pY401iXT2g0y+sn3e14
         yCEws6EwADLIGuIlk2LsBaCymo245qDK9CcK8QqbIWDkbfrwAi4ZWKhr2lbL/S7xU22b
         6nytQAhqO1GeEZLtSI4P/VgGrUdnnXOwAcxfJlx6uXl6stTr+eFWY6X0kGb8rK0lZZ6Q
         Np+g==
X-Gm-Message-State: ACgBeo29nP4lqsC7W7Pgy0lJt1OIA/oFoHAdNLwL7fNsowiulnIaqre8
	VISPQZIqw0kRQnuAPV79ut/X1Y+lpOc=
X-Google-Smtp-Source: AA6agR6qHiyWgRBQd+6nq3yntWVdYCRHb4Ae1YIH86QNAhpy9p5XqMY+zVwYLtUhQTCzMJyaybmahA==
X-Received: by 2002:a17:902:ceca:b0:177:fa1f:4abc with SMTP id d10-20020a170902ceca00b00177fa1f4abcmr29521810plg.99.1663170475940;
        Wed, 14 Sep 2022 08:47:55 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([118.210.107.131])
        by smtp.gmail.com with ESMTPSA id i7-20020a17090332c700b00177e263303dsm9919892plr.183.2022.09.14.08.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 08:47:55 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/7] powerpc/build: put sys_call_table in .data.rel.ro if RELOCATABLE
Date: Thu, 15 Sep 2022 01:47:40 +1000
Message-Id: <20220914154746.1122482-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220914154746.1122482-1-npiggin@gmail.com>
References: <20220914154746.1122482-1-npiggin@gmail.com>
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

Const function pointers live in .data.rel.ro rather than .rodata because
they must be relocated. This change prevents powerpc/32 from generating
R_PPC_UADDR32 relocations (which are not handled). The sys_call_table is
moved to writeable memory, but a later change will move it back.

After this patch, 44x_defconfig + CONFIG_RELOCATABLE boots to busybox.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/systbl.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/kernel/systbl.S b/arch/powerpc/kernel/systbl.S
index cb3358886203..0bec33e86f50 100644
--- a/arch/powerpc/kernel/systbl.S
+++ b/arch/powerpc/kernel/systbl.S
@@ -12,7 +12,11 @@
 
 #include <asm/ppc_asm.h>
 
+#ifdef CONFIG_RELOCATABLE
+.section .data.rel.ro,"aw"
+#else
 .section .rodata,"a"
+#endif
 
 #ifdef CONFIG_PPC64
 	.p2align	3
-- 
2.37.2

