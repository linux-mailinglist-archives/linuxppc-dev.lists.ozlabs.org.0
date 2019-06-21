Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43ACB4E007
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 07:23:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45VRtc3FGwzDq7j
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2019 15:23:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="XaoH7A7H"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45VRHK58LFzDqRF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2019 14:56:45 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id f25so2727922pgv.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 21:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O0RpxuR45dwfhoqht7ZB55QWMjctg/I39pbBZLVMTYI=;
 b=XaoH7A7HWEh3h/H7BNt9NeaCNby3XasvYPhESKC4N0o48biS1xPb1ilbLH/ojUnOmq
 A/Y1aUjNb648LxkRgqCjGMcK66RVQ6/WRSZBdqBTwKtzdMkm/Y+OROfIkxMVwUlxPIGd
 3KQzM0E9EeUeeVXGrXh3FxdBuizw2ztEyvL033IAz+WQZ757bnOxr560Lp3kgZCCvifM
 qVgv+cL6fYEuVZWN4MWIw89neZNG+2/L/IV5E0y7UqVSFLLDCFmJS5NVJeToa3LDgYFX
 kgPYvfHCsoUcHi/bRk4uKgiTe5GR4a68wcsRyMTOV4kSOlq1bYqkFd5zIUBsWz2PpSpf
 N8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O0RpxuR45dwfhoqht7ZB55QWMjctg/I39pbBZLVMTYI=;
 b=CdJyIGY1591ziJcnd5WSIj9COFugvWnXlfUoMGvZq8dxLS16mT6x9wQcMxqzggnnpl
 GPUi+G8Xb7fL6cMy02f/uu0AqTonMl38cVb8D18w3wun1XOJH3ensfbcVFYrSacIhJDR
 46zU5LCzBQivA67+M3No35Jso7Wr/Io+VgrceTI0FUmbRp12tb3xkFEnJ5eRSylyqiPC
 Q6WP6lnVG8EGz/9buCOvGRje4E/8JgGO+GJsed+R31f+1lChTprF2Aw/pyhs6KAisUxy
 YbCAtAImXZ9Pz30QtSRLAtu3i1Sh3LaYvY+FwuwAR+X5NnPYZhdFlEQ4q+JG9wRHZim5
 tdbw==
X-Gm-Message-State: APjAAAWKVIbZ3TrOjgeZX1MCVHINF9+KuqguVgcGWXkAGiiq7oKAeZJJ
 9BlivohR5Xrg5U9VEcrR1HItPNsn8swBjg==
X-Google-Smtp-Source: APXvYqzixIAPtGMfU+ZIdzcrmR9qgh1HEbcDDN7pBwxJo3RjgaWkK1VdZndICOjJSoAcZsLFGmJphQ==
X-Received: by 2002:a65:5302:: with SMTP id m2mr16027712pgq.266.1561093003740; 
 Thu, 20 Jun 2019 21:56:43 -0700 (PDT)
Received: from santosiv.in.ibm.com ([129.41.84.77])
 by smtp.gmail.com with ESMTPSA id q131sm1392069pfq.157.2019.06.20.21.56.41
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 20 Jun 2019 21:56:43 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 13/13] powerpc: add machine check safe copy_to_user
Date: Fri, 21 Jun 2019 10:25:55 +0530
Message-Id: <2e3615bf4eb66acb14ac415c20f1fe9b22a85594.1561020760.git.santosh@fossix.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1561020760.git.santosh@fossix.org>
References: <cover.1561020760.git.santosh@fossix.org>
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
 Mahesh Salgaonkar <mahesh@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 Chandan Rajendra <chandan@linux.vnet.ibm.com>,
 Reza Arbab <arbab@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use  memcpy_mcsafe() implementation to define copy_to_user_mcsafe()

Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
---
 arch/powerpc/Kconfig               |  1 +
 arch/powerpc/include/asm/uaccess.h | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 8c1c636308c8..a173b392c272 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -134,6 +134,7 @@ config PPC
 	select ARCH_HAS_STRICT_KERNEL_RWX	if ((PPC_BOOK3S_64 || PPC32) && !RELOCATABLE && !HIBERNATION)
 	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UACCESS_FLUSHCACHE	if PPC64
+	select ARCH_HAS_UACCESS_MCSAFE		if PPC64
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
 	select ARCH_HAS_ZONE_DEVICE		if PPC_BOOK3S_64
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 76f34346b642..f8fcaab4c5bc 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -386,6 +386,18 @@ static inline unsigned long raw_copy_to_user(void __user *to,
 	return ret;
 }
 
+static __always_inline unsigned long __must_check
+copy_to_user_mcsafe(void __user *to, const void *from, unsigned long n)
+{
+	if (likely(check_copy_size(from, n, true))) {
+		allow_write_to_user(to, n);
+		n = memcpy_mcsafe(to, from, n);
+		prevent_write_to_user(to, n);
+	}
+
+	return n;
+}
+
 extern unsigned long __clear_user(void __user *addr, unsigned long size);
 
 static inline unsigned long clear_user(void __user *addr, unsigned long size)
-- 
2.20.1

