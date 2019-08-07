Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C48684FDC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 17:28:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463b471DTjzDqtr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2019 01:28:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="VZdtHgLy"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463ZP30VT4zDqng
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2019 00:57:43 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id ay6so41264379plb.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Aug 2019 07:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wTlpYyZD/0q9aMn5q4HeUbQoatHU8kq64x9EtI8Wul4=;
 b=VZdtHgLyYvp56/GWYUxjZY/HaPlw9IM6uayBv0L1h1rXX15pZv6wRLUAO/v/Np+e+/
 mYCkXklk7PCjJYlj/tzE6KbgGjYydDU9b7dpBSN76wMDMI2gAgLjGCvEgpJPIkQNeucw
 LaC7Zguwv8tmyIntCUvnBpfdikKNpME/X6nJOElhwOL/bLgoT1ZdRkgklU8OKyaL/p4/
 McDkB0A/rys21D8xNiYsUFsCPcaC0XV6n+cG0amBF9IZKfwZea9q92VkIwtTF0D238NV
 Zh4XSwH8ILNtTkp/PXHX+l94uUQaH1D45lpk5osGRx5osFfWCO9VGd7dsWy4yahkdPGi
 /ilQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wTlpYyZD/0q9aMn5q4HeUbQoatHU8kq64x9EtI8Wul4=;
 b=ZvsB/DH6NJh6bGgNkaLrQKW7VzlinNdzMDZcN74XeRAkJDnR3vX9FDuiJdCYhRrdUR
 6dgXaCzKWVRULkGSDKHUDa/IV2RZbSxQe14MWCTo0e8rBPmkLhtMbuUP5LXa0j0GVijt
 +Qpc/DbbNjGYH61HAz7L+4U5xzfDU4kzE+R5PtXNQKdpECCU7flwrmG/MMGGRySpZcAX
 MEbGiAeGTaOjNU0zqBrlOA7pRfn0z2GV8tCSW4yI2FFR25lBuaRMn3MJ1brSVhGWS3c8
 BFnnbEiXkkAojh/FE8tBti/18koeaujwMiVUJ0rMi6js7vs7g24bJ1dgpqdlSLacj+0l
 bgVQ==
X-Gm-Message-State: APjAAAUWFa15XWuRTdi+QrjmHgPVuw3StaU8pFZZ8AWWURhQfbdhfLUo
 dW+FEO9Odmn9rgccst4s2+LSklW9jtxuTQ==
X-Google-Smtp-Source: APXvYqzqIPLLTzFhaDtVk7gn/hoCZP25Z5oJBF0C5S3MYQQWUzHXCXpS9TJiUqegIGn4gwfPaEj9fw==
X-Received: by 2002:a62:5253:: with SMTP id g80mr9639856pfb.179.1565189858724; 
 Wed, 07 Aug 2019 07:57:38 -0700 (PDT)
Received: from santosiv.in.ibm.com.com ([183.82.17.96])
 by smtp.gmail.com with ESMTPSA id l4sm93617475pff.50.2019.08.07.07.57.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 07 Aug 2019 07:57:38 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>
Subject: [PATCH v8 7/7] powerpc: add machine check safe copy_to_user
Date: Wed,  7 Aug 2019 20:27:00 +0530
Message-Id: <20190807145700.25599-8-santosh@fossix.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190807145700.25599-1-santosh@fossix.org>
References: <20190807145700.25599-1-santosh@fossix.org>
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
 arch/powerpc/include/asm/uaccess.h | 14 ++++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 77f6ebf97113..4316e36095a2 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -137,6 +137,7 @@ config PPC
 	select ARCH_HAS_STRICT_KERNEL_RWX	if ((PPC_BOOK3S_64 || PPC32) && !RELOCATABLE && !HIBERNATION)
 	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UACCESS_FLUSHCACHE	if PPC64
+	select ARCH_HAS_UACCESS_MCSAFE		if PPC64
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
 	select ARCH_KEEP_MEMBLOCK
diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 8b03eb44e876..15002b51ff18 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -387,6 +387,20 @@ static inline unsigned long raw_copy_to_user(void __user *to,
 	return ret;
 }
 
+static __always_inline unsigned long __must_check
+copy_to_user_mcsafe(void __user *to, const void *from, unsigned long n)
+{
+	if (likely(check_copy_size(from, n, true))) {
+		if (access_ok(to, n)) {
+			allow_write_to_user(to, n);
+			n = memcpy_mcsafe((void *)to, from, n);
+			prevent_write_to_user(to, n);
+		}
+	}
+
+	return n;
+}
+
 extern unsigned long __clear_user(void __user *addr, unsigned long size);
 
 static inline unsigned long clear_user(void __user *addr, unsigned long size)
-- 
2.20.1

