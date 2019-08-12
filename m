Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DF4899ED
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2019 11:38:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466W455mcJzDqVB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2019 19:38:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="FXLvaXon"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 466Vkw22lWzDqYP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2019 19:23:20 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id o70so4058248pfg.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2019 02:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/fmDyudl4ch4OP62eHQXqnVTVLm5jUqLhjp55PmzJvo=;
 b=FXLvaXonyVIAIIdHfE+h+/srPCOougwvG/jI7j3hLrjD+C6AvBOGYiXQTlTO3Dhciz
 MyxbG20eAjLWMBWN4CnSPXkbLzkzkKYnlueT8mDCN9+BjwJv0UShmzszeoBGKxhij0+2
 +mIQgoYUKWkHjbFK7l4Shd8rvC/LRZcYT0HQ6ERx0tOdtDHxn+3pwtXWX6PLTuhzvo2q
 M/5VtViQNupTnwfoqVDhPOxkPssGQaLTGHeEMtMazGK0nt7XOp1ZAlfDszbXjX0mMDc6
 TeEcKeGnLpzFp8CI7MYzCuCHoRRrgnEXJWqiZtcKLq3x4rTdSrYdsO1oNfN8Pl1j1bBS
 dhig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/fmDyudl4ch4OP62eHQXqnVTVLm5jUqLhjp55PmzJvo=;
 b=WjJs4JZOEQrZVlrX12b0JI3PMbtZkrWzDZfzg/tFkIIsqYagTwAguZxFwMpgI3tZ9c
 gK3pMGvj1+nvajUe0XhKomrZ0nfZx31BSFHTeIC5WlRHug+bqQRITCIsGQBRdy+JHsQ4
 GThubDHTRJpEjumdLIhR+61V4EAOcI+UuHc5OOyWfrkZ/NjirZz2VXtRx1VW/1fOyzFy
 JK0g75nzWDfUKbwH5/aKLjASGpq2T/znwIJdyh3SRdieZaUmVU+dVvpq2CBRO5QIKGd7
 oHOy0myz9rB4sOE39v5nbmInYnyr6jGkjWo2Gw9PrJ9lrL8p1RSCInF136CGjD8Ol/aX
 c/uw==
X-Gm-Message-State: APjAAAUfNRgz7dsYjTPEvbEneZXi/EJH4PX5/D5EAeZty89MsBPm+C14
 dFy86SadKxXwUKlirBP7pJKRe/tpEBFCAw==
X-Google-Smtp-Source: APXvYqzUbHHpKF9RpVY5dD8I56SMQRoVpK6MPIZYF1VY+Rqb0ousNfT7P/+4UDqPJ71fmRcBf+8VQQ==
X-Received: by 2002:a63:6947:: with SMTP id e68mr29764764pgc.60.1565601796914; 
 Mon, 12 Aug 2019 02:23:16 -0700 (PDT)
Received: from santosiv.in.ibm.com ([129.41.84.75])
 by smtp.gmail.com with ESMTPSA id y188sm10543517pfb.115.2019.08.12.02.23.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 02:23:16 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 7/7] powerpc: add machine check safe copy_to_user
Date: Mon, 12 Aug 2019 14:52:36 +0530
Message-Id: <20190812092236.16648-8-santosh@fossix.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190812092236.16648-1-santosh@fossix.org>
References: <20190812092236.16648-1-santosh@fossix.org>
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
2.21.0

