Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAC232EDE1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 16:09:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsWNX1M1Fz3dny
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Mar 2021 02:09:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=oW8f6TYr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b;
 helo=mail-pf1-x42b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oW8f6TYr; dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsWL13rY5z3dKB
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Mar 2021 02:07:05 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id r5so2187585pfh.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Mar 2021 07:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qc0nUYDLvwQRwFOs9WtkYR1nP7DQW4PKRkHGFNnJEpE=;
 b=oW8f6TYrCImZoVKsQ8e6LRkxGAc5+pLTQfoXGydCc2QMQeWku89SMXq3SnkQMDnnC+
 XXgifMIU/3tJsSR7CGeJtxA8iX0Jje4/f4v06IG9IkU+7iGfQi7YAulUZmS8EoZGRWFT
 +/luePBjnZsnqPVixw4G9/IbWUP6c58rPVMzEDjvqk9MKWjkoFG5zSwLv4WFeCeG3ufP
 JfEUhK4MK2tZ2gpHeFBJ+u7JQ5qk4ohdZ7aOUQ6RqiXLx1qQfFqYzO4CrvfRbqsR8rfz
 nTUyxfuuA0m1nbbfxPxBDleVsvWFsnJ4vJKbEKL+t2atNPwfhooYK0XeYDiGWMFZaql3
 ypDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qc0nUYDLvwQRwFOs9WtkYR1nP7DQW4PKRkHGFNnJEpE=;
 b=gDd8YxSE8KDCfcTaiFlCnpRd9va7WeOT/OyVcWOA9UAPAqQ3/PVCwGrQaoMps+nNyS
 GjdeYJMDO0HTb43kuQT/ONqr57e9B+aC389F6cg4l3xwhAQabGL4csMWvx2Ap9avG3qc
 JO2mZZyDd5jx0++EQh9aOVrdPuBuW47SgcY4HbamDIPdBM3yF02TXa1kVVFt05kAAxul
 jJWlXwfoC1SF0Qg4Xy3aEx3ul153gSnlgy7k8Yhw/WwARHEKY6zMn8tHjHiYEb5Au7SE
 4axe358H/2zT5nuj7SPDyJLEHSFf35I+JuOKLcbVEhJfSGtUzYke7efq3bCmmBPDacYq
 WkGw==
X-Gm-Message-State: AOAM532qZyWv1XVGK1RNneauWUsbtxSwdEO8JGB3wicki1PQjV8vO9oc
 D7MS+GlIY6MJ299YIii5W2o=
X-Google-Smtp-Source: ABdhPJwX6ulUpxaBlIKwg0Z8Rcf1A2H8sn5EvZWB3Lz7EmI8nnFFp72xD7e2nOTkBiG+OmmaqR0Z3Q==
X-Received: by 2002:a63:50a:: with SMTP id 10mr8919091pgf.89.1614956823275;
 Fri, 05 Mar 2021 07:07:03 -0800 (PST)
Received: from bobo.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id m5sm1348982pfd.96.2021.03.05.07.07.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 07:07:02 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v3 05/41] KVM: PPC: Book3S HV: Fix CONFIG_SPAPR_TCE_IOMMU=n
 default hcalls
Date: Sat,  6 Mar 2021 01:06:02 +1000
Message-Id: <20210305150638.2675513-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210305150638.2675513-1-npiggin@gmail.com>
References: <20210305150638.2675513-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This config option causes the warning in init_default_hcalls to fire
because the TCE handlers are in the default hcall list but not
implemented.

Reviewed-by: Daniel Axtens <dja@axtens.net>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 0542d7f17dc3..f1230f9d98ba 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -5377,8 +5377,10 @@ static unsigned int default_hcall_list[] = {
 	H_READ,
 	H_PROTECT,
 	H_BULK_REMOVE,
+#ifdef CONFIG_SPAPR_TCE_IOMMU
 	H_GET_TCE,
 	H_PUT_TCE,
+#endif
 	H_SET_DABR,
 	H_SET_XDABR,
 	H_CEDE,
-- 
2.23.0

