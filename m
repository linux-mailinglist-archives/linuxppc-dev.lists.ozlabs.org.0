Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A7E33CC03
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 04:20:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dzz7p4R8Jz3c2T
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 14:20:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=pukob/0H;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pukob/0H; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dzz5f4h39z30BD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 14:18:46 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id
 a22-20020a17090aa516b02900c1215e9b33so609918pjq.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 20:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1IjRU96F9zybhuKBZEy8xck8HhQ81mfRTZfLi2Uhtog=;
 b=pukob/0HMs32Q+Pm6GVkBsuR9ba7cegYUXl/utjlW/z83kMNXvQjmaMqRM2+NyRvn4
 GT3bu+yrONJo26h3BqEas+EfHC02eKs4nYhk7PDv80vr+WBaRnXF7FcQ6yOEF80UIVUw
 l/xYJnaWAg6yo+GkOwqWRhKv3fMxVBdCQKAHAAafmjRGnC9tlztn/v6romNd+uuTNXTf
 omXD3WExV8fkNjgI5r56heBi0UrvIdmSxdguuTIcgxRBFdM0Yf2ZSfy1oSn/zJI456DZ
 KvJM5lSZrVT+33G3vbRcuWStSpZBtqG45zcvl53d+WWkpTJAaun1Y8LxeetOCNDnzoxK
 XxXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1IjRU96F9zybhuKBZEy8xck8HhQ81mfRTZfLi2Uhtog=;
 b=HNE66CKJGP7Vz+R5vPrj4aCHgx9hOfkeTXqMq9iAD9c5pdy/ltbuJslLZPR2MFo+So
 ug+HFJdKFvA+fQ0Xeq/bvDfSXW3CkePdV3+jt2qE2Dk1ENUEuLbiEreWXwF5ap4oZJz/
 xoOw23IRiIjxxjbaYxQliFIVLaJQAGffHHIy5YiPfK/8CePG3s86KnP30kFpN/OlEkvY
 wN2Aakx8Qc88K4Hculx4iHNYGzTGCzMd/YdA4EBT9FepQyr3tyojMaQdh2sraHWDbRf1
 R93Xhtr0yZdRJS70YQ7KUfaU4i1xgucjUT/3FdHAMTjzWXZtN+XUOkhiPzlW4TTwUFne
 CgQw==
X-Gm-Message-State: AOAM530/Xj0KYKMMtyjIK4aUYXqcwAOQq4SfskyJS8XCxDrVAHGSVFYk
 HcEW3pjwOPMNnHQP4Ou54NjxfjWXwQWpBQ==
X-Google-Smtp-Source: ABdhPJx4qh8JoiAZssDxsvgI6Bxy9sXfRFN8jVOfkwPe9/KVrvESDvuh+z9nt+TvTOcFGRGnNOkXZA==
X-Received: by 2002:a17:90b:809:: with SMTP id
 bk9mr2424462pjb.83.1615864724382; 
 Mon, 15 Mar 2021 20:18:44 -0700 (PDT)
Received: from localhost.localdomain
 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id o13sm15098809pgv.40.2021.03.15.20.18.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 20:18:44 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v9 5/8] powerpc: Set ARCH_HAS_STRICT_MODULE_RWX
Date: Tue, 16 Mar 2021 14:17:38 +1100
Message-Id: <20210316031741.1004850-5-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210316031741.1004850-1-jniethe5@gmail.com>
References: <20210316031741.1004850-1-jniethe5@gmail.com>
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
Cc: christophe.leroy@c-s.fr, ajd@linux.ibm.com, npiggin@gmail.com,
 naveen.n.rao@linux.ibm.com, Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Russell Currey <ruscur@russell.cc>

To enable strict module RWX on powerpc, set:

    CONFIG_STRICT_MODULE_RWX=y

You should also have CONFIG_STRICT_KERNEL_RWX=y set to have any real
security benefit.

ARCH_HAS_STRICT_MODULE_RWX is set to require ARCH_HAS_STRICT_KERNEL_RWX.
This is due to a quirk in arch/Kconfig and arch/powerpc/Kconfig that
makes STRICT_MODULE_RWX *on by default* in configurations where
STRICT_KERNEL_RWX is *unavailable*.

Since this doesn't make much sense, and module RWX without kernel RWX
doesn't make much sense, having the same dependencies as kernel RWX
works around this problem.

Signed-off-by: Russell Currey <ruscur@russell.cc>
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 4498a27ac9db..d9cadc4212d0 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -137,6 +137,7 @@ config PPC
 	select ARCH_HAS_SCALED_CPUTIME		if VIRT_CPU_ACCOUNTING_NATIVE && PPC_BOOK3S_64
 	select ARCH_HAS_SET_MEMORY
 	select ARCH_HAS_STRICT_KERNEL_RWX	if ((PPC_BOOK3S_64 || PPC32) && !HIBERNATION)
+	select ARCH_HAS_STRICT_MODULE_RWX	if ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UACCESS_FLUSHCACHE
 	select ARCH_HAS_COPY_MC			if PPC64
-- 
2.25.1

