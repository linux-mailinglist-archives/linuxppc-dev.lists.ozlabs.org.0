Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EE560FAF
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2019 11:56:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45gnDj10ZhzDqgG
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Jul 2019 19:56:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="ZuqTT1yz"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45gn1c5L8TzDqS6
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Jul 2019 19:47:16 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id y15so5313179pfn.5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 06 Jul 2019 02:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fkBqb9r0ZPOja9LVgBYQkYAhfvXLkyoq2mrWQ0Pvb1g=;
 b=ZuqTT1yzf5APeqMPgz518RD8e6NRmJKL9fC0mTv/ZUz00gDQUoLXxuIlqUkAMYjsDu
 vy2HXJ6DmiokkzRAE6BqMxfvZwpGSW8Xo0BgiunLDnWq0QRBJvgGailU69jBFc9fano1
 2OfP0dJF8ePSrqoeHCWxFzGoKIbsY3oYEBpN8hU3FftWlsbkoi7FKbUIOXBX61LLWYJa
 YeS4WqgSHuNaJPVgn4EqioVJXOCGSeK6roFfrjiZSJq5jjALUsR2GZG2hxmPN7Dk/4Si
 nPQRcMEjQLMiAlMKh7oMOuHnZT89hI1TNxP6rFUU4/GWn/8Os6jMmu8gUKV9sLxwrCzV
 i99g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fkBqb9r0ZPOja9LVgBYQkYAhfvXLkyoq2mrWQ0Pvb1g=;
 b=ujy2nM3KC1ryVlh/W++u0/mrAS81nmUDpI45P1w076M64UKIFXksQKebkqriy6vblB
 A77KWJzqWWWvwjn669nf+h0XBbgNiY6/YB0SiXhL7pOq2KwRB42hOwa/k0oseobMUroG
 ld/dZIPzEyBg8sKOTHIXwcExHfS0uhyQQwESvP+D3xZTbVMKv3qygVYI5NPq3qRzOzCQ
 IriXTJVXcVwYAbntea59p2bZVNCD/wX5HAbC60ugepAq4l7H4IoIPBOGbX0VsuHLW2u9
 GX1Pik4JJxO+0xnzNjZcJfU1AQNUUvo9CGZYuDepLCTMxST9JmWxfs1s7D/fPSInIO4f
 XoLg==
X-Gm-Message-State: APjAAAU5KFOPwLvRV/j2j0oKBXC9RXxGzECKOs3Z4BvRa/4BPcZ9/10b
 OtMFdYhVwk/3wrCbLB1yVWiuPkXYDgNcnA==
X-Google-Smtp-Source: APXvYqxYXhiRHVtMB3nWyobZoMKJb4lqU10vbVXz0VGtcLDFRviAVaZrvuqZRwEtlrJ4A82cp2eMOg==
X-Received: by 2002:a17:90a:2627:: with SMTP id
 l36mr11031492pje.71.1562406433703; 
 Sat, 06 Jul 2019 02:47:13 -0700 (PDT)
Received: from santosiv.in.ibm.com ([49.205.217.222])
 by smtp.gmail.com with ESMTPSA id p23sm13493091pfn.10.2019.07.06.02.47.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 06 Jul 2019 02:47:13 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [v4 5/6] powerpc: add machine check safe copy_to_user
Date: Sat,  6 Jul 2019 15:16:46 +0530
Message-Id: <20190706094647.15427-6-santosh@fossix.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190706094647.15427-1-santosh@fossix.org>
References: <20190706094647.15427-1-santosh@fossix.org>
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
index 76f34346b642..8899864a5552 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -386,6 +386,20 @@ static inline unsigned long raw_copy_to_user(void __user *to,
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

