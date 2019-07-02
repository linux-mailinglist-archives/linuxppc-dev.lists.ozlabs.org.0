Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0C85C8D7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 07:35:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dCdC1KF2zDqK9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 15:35:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="nDrzgl7A"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dCHS5cpGzDqGq
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2019 15:20:20 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id t16so7644506pfe.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Jul 2019 22:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O0RpxuR45dwfhoqht7ZB55QWMjctg/I39pbBZLVMTYI=;
 b=nDrzgl7Ac58CidsaQ6PIuy197jcO/z/YiU0EKRLMa7gawFXcHfSPFVjyFV8bA8fzfX
 kbLVE7fihyQybCu62Pav6Ya5wh6zD01MAR/KID6uPmcS9VRuCMfYWLAjFKhIvcR3CcG/
 riARMXG16twAGfsI3P74kuVEFzLiu/+6KfT/EBoJe/6Bl2nB+2+f/7o+ZXdXeh4h5iWo
 0N9O1l0gl2/jdhYmL5PGJXKF6YqSbUuAUPlxjZ0c3wXXDGHgR0j5oAvFl98EadkrS2BS
 h3qC+JJeGjH9kr/4fdbCXqA/rbgrbm+7z/3/2ctHY5yimPi5TSqzbyJHPIq1Vd94mcvY
 +jEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O0RpxuR45dwfhoqht7ZB55QWMjctg/I39pbBZLVMTYI=;
 b=hIgv70E29RE5Fks0GjIRBARro610rUu3JMUazCou+tW0zFnyiyAgXCV6rHWZBoMckM
 WJocJIdLYkU8XYie5RMYuM5YklWfN6AnIbDzqFhTep1Y2HTt+eVybDBjnkHZvIx2sgOt
 a724bLC5Q4CtkwmKGVSDuQr6+IKCendJKHCo1zNbg4NHjnIpwf7yRNLLa6hZ9pM+kkM1
 ZumoqQYJgyMnO1GxwieEAt5vFU4UnUdszsfwwYvxmgOhHp2udo3BySHk/jEGocu8I/LV
 YjsYsnh2m4STecbWIqJkU4Dy3DbIzAM6Xu/fAaDeypDwGjHzbrVwR3DHhp18az8PXWFY
 zb2Q==
X-Gm-Message-State: APjAAAVdhWBbHJKCKoiyXdMibCFuY24DY1+UcH6mxnpjuD14iVu+aVwC
 apIzafVhzTE8e6cdZnhtK0LLt9Vn3theHg==
X-Google-Smtp-Source: APXvYqx+WjAPSmdYr9tmqlIfaV8PP52y742alvV7T95gT3Ie/XgUFvMPPYbYDWTUWvnNcfaOhxiuIQ==
X-Received: by 2002:a65:6541:: with SMTP id a1mr28266774pgw.409.1562044818857; 
 Mon, 01 Jul 2019 22:20:18 -0700 (PDT)
Received: from santosiv.in.ibm.com ([129.41.84.67])
 by smtp.gmail.com with ESMTPSA id t9sm1106898pji.18.2019.07.01.22.20.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 01 Jul 2019 22:20:18 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [v2 11/12] powerpc: add machine check safe copy_to_user
Date: Tue,  2 Jul 2019 10:49:31 +0530
Message-Id: <20190702051932.511-12-santosh@fossix.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702051932.511-1-santosh@fossix.org>
References: <20190702051932.511-1-santosh@fossix.org>
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

