Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB7681276
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Aug 2019 08:39:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4627RC0CCjzDqTw
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Aug 2019 16:39:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="ofzpa4RM"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4627460JTvzDqXW
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Aug 2019 16:23:01 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id n190so4030641pgn.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Aug 2019 23:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wTlpYyZD/0q9aMn5q4HeUbQoatHU8kq64x9EtI8Wul4=;
 b=ofzpa4RMVAg9SEnJH93KWyT5+FnI3bDtLrgWsm3zOuSoKpwJefrzrWUNT5B8mPsCo5
 FHqW38pd2ClHxZp3vHitq4XQikfaDrcGann4aQk3idg3ZMoEdRPmo8Bh7u0SHZk9mnk3
 Qm/PWosgezMuZvPx/H1J4tRxnrFttBph68j+lK7tVvrHoeQ4gDxyiJGtQe8zjp/XvT42
 9WBBVjSoW3kbtpzPZJhWwNp5bQjwYoGN+p0v6Tqv+anrZTt6/9+6fwdl9DD+lVPgOqnd
 iKglAljvNwz+aLB/fzPM5QUO6O98NQV4eEY83+LDRp+m+svmXRJZAZ6PpoRZEQU0SUk7
 Anmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wTlpYyZD/0q9aMn5q4HeUbQoatHU8kq64x9EtI8Wul4=;
 b=CeyIXPLYGDdNliZaQ+QH6XToUuKFmwz5c+lOcNSr4nevojdHfllUJ4gMulQaFZdSFL
 KiviXChIGFsMXUgHuAD+TqwdgIUS5G184jVClwkedatRkNWmOaOKyWDCoPx04jTbHEdB
 6KanyI7kMY0eAcPvtEr8Xh2nX/+SEX5PO+L1wA0J5eJiNxdeDbqnSUsmD5NF76bMaRGb
 fccY2no2NqY41NNXHURBW/3hy2Nkqc6fz64nnt1w9aW0RbGuNJyq2/QVDlohpFWY8BJb
 kf1FOrV7ZGN823rMHBfczCW1Yw1dGN8JFCcsK5LUNZPqilER8mYML9akaQowbGbUlkCT
 HgKg==
X-Gm-Message-State: APjAAAW9/ddQGa4bRxGhw0XXxAhipdxfeYPoLIpAY3A1yGwLkZ/oJ8UQ
 gnkSHyrhatBTLp2zmIQYTbJzLBlG9aI1bw==
X-Google-Smtp-Source: APXvYqx2a53J7+K3AmO8itomjLV2KyMw6dQquJOLFFdxZSKfiDrkTVsqjyaK3xoFqKxYlp7ye3PD6A==
X-Received: by 2002:a17:90a:7148:: with SMTP id
 g8mr16739525pjs.51.1564986179854; 
 Sun, 04 Aug 2019 23:22:59 -0700 (PDT)
Received: from santosiv.in.ibm.com ([129.41.84.66])
 by smtp.gmail.com with ESMTPSA id i14sm124680082pfk.0.2019.08.04.23.22.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 23:22:59 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v7 7/7] powerpc: add machine check safe copy_to_user
Date: Mon,  5 Aug 2019 11:52:25 +0530
Message-Id: <20190805062225.4354-8-santosh@fossix.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190805062225.4354-1-santosh@fossix.org>
References: <20190805062225.4354-1-santosh@fossix.org>
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

