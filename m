Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4B8351621
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 17:23:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB6QW1W0Mz3hT8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 02:23:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=SKiBiR/2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b;
 helo=mail-pf1-x42b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SKiBiR/2; dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB6246tj6z3cmc
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 02:05:48 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id c204so1686320pfc.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Apr 2021 08:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=puIw6o5we11S+Q3MLTh61PKAuyf9CU/jVlPkn7xSoS8=;
 b=SKiBiR/2Q2aiA23Dorrvkz3EPlAAZXWfclRRRM2Cd0B13XSSR4Gtrwzr00tLhdsPAl
 TdE8bg3tMoLUwUMo1jGiGSmxmtqhSQmZTbWYD8wHES48mQWlWwrBBX3Qx8N7JAsCIRBx
 akuyOsS+wRLQBClogC79ET71nmP8Ww70igHQ9drMUJYW7biWEqpTsOMrN+wO2gRUp4wR
 Icnu/siWxO0tSJn7tPZZcY7oCLVr/a2QgmInrQbJMOZC3VYtEha4sV23bnKxCSp6Z1BX
 jthn7qnHiu/Esnxd3IW1UTlOwF3mj24tHn0zw3FjtnyrILcxSgjUMxbBboEZEXlAHItO
 JCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=puIw6o5we11S+Q3MLTh61PKAuyf9CU/jVlPkn7xSoS8=;
 b=dTYhIos7yXa3izOe6pXCpMXnldj3GdVrBA9YDs3/LLK4U4HVuc649k+6YTJQkbNvmn
 /8IDwmFIld0xPFGItUV3sv4zqXUgIicaAZIiz32EH32JIS/CfvzTJaheXLUXiWIT7Sn7
 lpROzFW+8AQNpTwR+v6RkObjGtXODmcozMflNQsqbbGO55lGE8EcZM7gdhXfBkv/CqHq
 Mmzq1DU0GyG9M9ICxTamLOJI0n54vAHuYG9YyB+Gh8JI5We1mGoeymdmRzk47aBbv3tX
 hkEn0p123MV8bxcGeYAvYds7lYYT9QJ3Mj/K6K/mhePx0riHDgai1tILGhxcsMbhh4ye
 JxLw==
X-Gm-Message-State: AOAM530k7yLpXy7UI1vO5YKVxkc5qZRa9EdkVVyTl4g2NA+qnP3CJwXX
 Kvb3d5NUXbfYnwPDq1DSBe0=
X-Google-Smtp-Source: ABdhPJwhJblL2WhYBcTqAUUegpI7fKr0iy5JjeM+fGae2o4TbxvLVtKqnTlovtm2SnJqIEpazVFqnQ==
X-Received: by 2002:a62:190a:0:b029:221:cd7d:7927 with SMTP id
 10-20020a62190a0000b0290221cd7d7927mr7762455pfz.27.1617289545724; 
 Thu, 01 Apr 2021 08:05:45 -0700 (PDT)
Received: from bobo.ibm.com ([1.128.218.207])
 by smtp.gmail.com with ESMTPSA id l3sm5599632pju.44.2021.04.01.08.05.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 08:05:45 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v5 43/48] KVM: PPC: Book3S HV P9: Allow all P9 processors to
 enable nested HV
Date: Fri,  2 Apr 2021 01:03:20 +1000
Message-Id: <20210401150325.442125-44-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210401150325.442125-1-npiggin@gmail.com>
References: <20210401150325.442125-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

All radix guests go via the P9 path now, so there is no need to limit
nested HV to processors that support "mixed mode" MMU. Remove the
restriction.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index f4d6ec6c4710..f4fa39f4cd4c 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -5446,7 +5446,7 @@ static int kvmhv_enable_nested(struct kvm *kvm)
 {
 	if (!nested)
 		return -EPERM;
-	if (!cpu_has_feature(CPU_FTR_ARCH_300) || no_mixing_hpt_and_radix)
+	if (!cpu_has_feature(CPU_FTR_ARCH_300))
 		return -ENODEV;
 
 	/* kvm == NULL means the caller is testing if the capability exists */
-- 
2.23.0

