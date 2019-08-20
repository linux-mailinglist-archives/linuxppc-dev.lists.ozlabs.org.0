Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC9D9599B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 10:30:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CPBc1BdvzDqHr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 18:30:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="FAC88M3x"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CNqm55rPzDqwY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 18:14:28 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id u17so2776836pgi.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 01:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uHTQPelRXoeGRxk9/7QApa3hD+2cD5EffZTn9akbQbg=;
 b=FAC88M3xyO1XNTfnXTZeE2URUxDYQSdUEBxzuzqVjNiG2EIBREa7IcVO0JaXk1TN6N
 +Fc7WDfSdFhc8+r/dbDczub6YKzQyAsR5aQELTD9pGe68hw8INSwRolMbOi7kiCQAO6Z
 1d1gQd92zkfmA7suA4NHPmn23U9T2YW7oU/8AzahKurgzk4r1XoUKjmCS13liO/7drWg
 Y+zlMuyVoWjWrC4X/Ze9MxJ/R8oqt2HU09ksut5VqzIwSJ649g21pc/zbN/3CzPONaEp
 vmzrL3FCOLq9B5KdekqZOBnd7jzKy1A6AoKJiUuYrJopy1aqMSVAtYQWXs1MjECElQkm
 4SNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uHTQPelRXoeGRxk9/7QApa3hD+2cD5EffZTn9akbQbg=;
 b=JUaPUWBc4sbujR7n06EEWC5gPycZus+wilVDp/2srz8JQ1g275geE5cHD09ltVeNHc
 NESykvWG8ZIJxwcFBa1v0lKKi2hB2QOzvv5ta9Zd+b9JRyQzJOd3hmbNn1/SwVM0dfYF
 MMjopCjUTZuDQ196RILWt0PZVbY5bquW3zWr7BknudjKXN5tqVVXas8erZhG6aYny0pm
 D877IksATVaJggiYMsf/nqKKG6WihCAAZS5q38mYmd5ige72VHOWpNYOLWSfDSUSG+sg
 T1yz4A5zv1zPdaRK9KqhPVwofzj4KSYI5SOo3gMad/HtH9VrYQWn2090RTK0spakBmSZ
 Du9w==
X-Gm-Message-State: APjAAAWWuYFwTo2lu5h0FEJi82OcqrJ7xzLqAvpkC6ORFz34jw1c7QkV
 OxxabzWVd8V9ddTpb/LsqAT+bO0w0acR6A==
X-Google-Smtp-Source: APXvYqy4FSoccV/iKHaOcV7FENxh9+ndEv+zxT0iBqRlg8hAyNtDrU/eQSMAicaHNg93qFUQsO6rhw==
X-Received: by 2002:a63:10a:: with SMTP id 10mr23784675pgb.281.1566288866620; 
 Tue, 20 Aug 2019 01:14:26 -0700 (PDT)
Received: from santosiv.in.ibm.com ([129.41.84.78])
 by smtp.gmail.com with ESMTPSA id b14sm18949265pfo.15.2019.08.20.01.14.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 01:14:25 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>
Subject: [PATCH v11 7/7] powerpc: add machine check safe copy_to_user
Date: Tue, 20 Aug 2019 13:43:52 +0530
Message-Id: <20190820081352.8641-8-santosh@fossix.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190820081352.8641-1-santosh@fossix.org>
References: <20190820081352.8641-1-santosh@fossix.org>
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
 Chandan Rajendra <chandan@linux.ibm.com>, Reza Arbab <arbab@linux.ibm.com>
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
index d8dcd8820369..39c738aa600a 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -136,6 +136,7 @@ config PPC
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
2.21.0

