Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB92D60D36
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2019 23:40:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45gSvS004yzDqlQ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2019 07:40:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="YGmWU9DG"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45gSbm5jdVzDqfZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jul 2019 07:27:16 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id cl9so5100050plb.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Jul 2019 14:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O0RpxuR45dwfhoqht7ZB55QWMjctg/I39pbBZLVMTYI=;
 b=YGmWU9DGSv5zjvV6AL9F/VEzAaDLhVCfnHZiJiUGNn4QRC1DVY8F2hCRVBBOpyZuQR
 L3jtPtD+lvZFQfmpXPLMd7/dTx9K0L83k/aKpoRRZ5lZEahcUZBU5NB3Dp3amKNKTDR0
 B5VEtMgiKw7FaubMsbd/mVbV6Alb+44JzyLdLsu+SgASc2xTJ3p5rGiQCQbLCKFLvE5z
 q4C9ZyfbNpUL5RYj+i/miIYC9SW5NxYOoNuB9kzeu93TrWce4La+Yp6KqXFXCPTch9ua
 7oVc1VaHUfzWw+cehU1uf7/eKG0j1Ry0ly/5PoINNlb5KaLZDWOiRutnWeqI61rbozCP
 /k+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O0RpxuR45dwfhoqht7ZB55QWMjctg/I39pbBZLVMTYI=;
 b=SgL2vjhUpW4tH5B1PqHBQ4Wcq1Kw/MzUq28kAJphBJT/rMSb8btw18/rNvx5cwA1nk
 5Xbgg2Iw+0iaYVcm39LR/86RJjj4brfKVB5kiRjxoqbSAVgQ/hSUh9hNXXPjGjD6GboY
 zdvkOxrRcsCrMV+ETI7lpmIfWLF2cJ1B3pIUAglTMXy+AtWz+brXVwSIQe/g+cPTqAn9
 6unlNX4KCC8KrLuBmt+wKJ+D4g8bjpqApM2tl36HqvK0rN1Z+IX5GKjxvdAxXbiWiesp
 wRmWK6xgFs09svS+qmpbSSRBAZY0JdO/GeoD2qAmoGT4JFf1Nx7ufKu3XUgEOdR+wJWC
 lE/g==
X-Gm-Message-State: APjAAAVUBS4bl0Huc7fjJ896pbUz++0Mo/i3Kv+CKJPUbpp0fIsMa8o9
 5h8rBnJqR7MW3rd0DS/GT7fIxw0dXU2cLA==
X-Google-Smtp-Source: APXvYqzj2Slb+QlEs/jYCO2McbxUwTjEPUCb/0Mzz1GoysbGbTA7nKlDd1cHY+8/mnakS8asEFzM0A==
X-Received: by 2002:a17:902:fe14:: with SMTP id
 g20mr7510836plj.54.1562362034046; 
 Fri, 05 Jul 2019 14:27:14 -0700 (PDT)
Received: from santosiv.in.ibm.com ([49.205.217.222])
 by smtp.gmail.com with ESMTPSA id o13sm9321389pje.28.2019.07.05.14.27.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 05 Jul 2019 14:27:13 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [v3 6/7] powerpc: add machine check safe copy_to_user
Date: Sat,  6 Jul 2019 02:56:46 +0530
Message-Id: <20190705212647.21750-7-santosh@fossix.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190705212647.21750-1-santosh@fossix.org>
References: <20190705212647.21750-1-santosh@fossix.org>
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

