Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3AD3A737E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 03:50:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3rqQ6j2Wz3dXs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 11:50:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=ZeJTQLnh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=ZeJTQLnh; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3rmQ54hvz3btL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 11:47:34 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso915756pjx.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jun 2021 18:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yq2AQYTBwcMSkk50BfF3YUyk3WvoM0RKP8OIdZyLogM=;
 b=ZeJTQLnhfCYIF5Alb7Xcgk6mY9zzQWFwt3XhISP0PkPInYBI9a5/ZaMCsy80NCvgIn
 nSVdbGwMuO0uX84KkYEAuIPjAXkySgG3mlroYr4cGA5WGFzgNpn4J/HKXkGc8Y2d9KL2
 vaabfR/X5gDD51l49hsy4PjrGjT/drL7td3nc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yq2AQYTBwcMSkk50BfF3YUyk3WvoM0RKP8OIdZyLogM=;
 b=HrJosXxqPAhvPC493F9/JQmQ8EaQjoDjyJG8fYaSpjjoQlZc2LI3DeFDzcAi5mjJTe
 yNb2fW4YQ0S4LwOwaHXpGzlbeZe+bt6Usj4NAVTaWV27brTNFEI/cqpWsW5Fay+LWXY/
 F8+LoIm+pODS33Fk26MN03y2ue6tezGW0GOFoUb8Og87ih1kzSfeJ5aUTXvHqim+edQS
 ZccviXA24ji8MCY8THfelRaThA6DixmRn/X6mp/+BAPUaRQDQbdPc6j6UnBXW5k0CdIU
 ahK7g8ZaDMBP3VOxb/g9GXxSwQWrHpaHu7aXLqzyWTpLQOJx5tAw+5rILcMKX9VYLJAC
 az6A==
X-Gm-Message-State: AOAM531vUqq8twID78V37wF/b5iaVAcfmoIa5OWYvTjtXeXcDKGVbrUX
 3E54MGgUqENnvnM3kgcVCcPBgA==
X-Google-Smtp-Source: ABdhPJwIh6iSrt+CcEWzVqr90qKul9F0AOPFTbmA3xMVJpWYKIvGycOfdzCm5eVl4SQ5y/hhcfyFCQ==
X-Received: by 2002:a17:902:728e:b029:101:c3b7:a47f with SMTP id
 d14-20020a170902728eb0290101c3b7a47fmr1630411pll.21.1623721651578; 
 Mon, 14 Jun 2021 18:47:31 -0700 (PDT)
Received: from localhost ([203.206.29.204])
 by smtp.gmail.com with ESMTPSA id t62sm5508747pfc.189.2021.06.14.18.47.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 18:47:31 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 christophe.leroy@csgroup.eu, aneesh.kumar@linux.ibm.com,
 bsingharora@gmail.com
Subject: [PATCH v12 5/6] powerpc/mm/kasan: rename kasan_init_32.c to init_32.c
Date: Tue, 15 Jun 2021 11:47:04 +1000
Message-Id: <20210615014705.2234866-6-dja@axtens.net>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210615014705.2234866-1-dja@axtens.net>
References: <20210615014705.2234866-1-dja@axtens.net>
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
Cc: elver@google.com, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

kasan is already implied by the directory name, we don't need to
repeat it.

Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 arch/powerpc/mm/kasan/Makefile                       | 2 +-
 arch/powerpc/mm/kasan/{kasan_init_32.c => init_32.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename arch/powerpc/mm/kasan/{kasan_init_32.c => init_32.c} (100%)

diff --git a/arch/powerpc/mm/kasan/Makefile b/arch/powerpc/mm/kasan/Makefile
index bb1a5408b86b..42fb628a44fd 100644
--- a/arch/powerpc/mm/kasan/Makefile
+++ b/arch/powerpc/mm/kasan/Makefile
@@ -2,6 +2,6 @@
 
 KASAN_SANITIZE := n
 
-obj-$(CONFIG_PPC32)           += kasan_init_32.o
+obj-$(CONFIG_PPC32)           += init_32.o
 obj-$(CONFIG_PPC_8xx)		+= 8xx.o
 obj-$(CONFIG_PPC_BOOK3S_32)	+= book3s_32.o
diff --git a/arch/powerpc/mm/kasan/kasan_init_32.c b/arch/powerpc/mm/kasan/init_32.c
similarity index 100%
rename from arch/powerpc/mm/kasan/kasan_init_32.c
rename to arch/powerpc/mm/kasan/init_32.c
-- 
2.27.0

