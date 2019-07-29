Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFCC783D8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 06:13:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45xmWc48l2zDqSK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 14:13:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="MRFvu9yG"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45xmF72QBqzDqJC
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 14:00:43 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id i70so16768774pgd.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Jul 2019 21:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KYoJ39RZguTRCAW4cRr4Uas+ZKo6lunMYQdFjdRdsTU=;
 b=MRFvu9yGIaq501dGo53Wv1aWIiI20JHn/6SaR94cUOslhI01cqY1OscbkEB4bafSG1
 NBkC5W3wF79PW6D2yVd4qpKhmZ7USzlCQqRymQ9bE4FPoKV03h8CcwNbFWVBOwH01Raw
 dxkiW1LSRNIFBAtarYOwUGaHeYtJLPLYhXGFXorjWP4nHNx/8BQHAp12B/bs50htbTEu
 kgPHDrtE1sz8OIZWcDDdTf2V1d7KesTjR3plDml/XAxwW7/fsvOWrVmgGMQb43vt/wGV
 EJ+3DucHOnenE4bsMxKp4tMZaw6jaERPpzvmtH7SeSgHa7Zdo4CZ7k+OT/tOlfHWD+HH
 y05A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KYoJ39RZguTRCAW4cRr4Uas+ZKo6lunMYQdFjdRdsTU=;
 b=UF5yN17etixNqwJC8JO5YaAFNhDZryVWMsQq0ZSb9mqe3YwgWqFrFTWiHw9b1i/jd9
 RxINu8x3Q2KOV1Hv2EPJ7b+1SPhZ37klVaBLq/8I3h+mTLlTOGDr6IZX2UuSnBX7Kq2z
 UaiJ46lECkxUyVeK5N6guRDpAARGDMUM/unYdQDm3bwQ4MKVPHOG0nPD1UCMIvRpptau
 /PLiZTemt+UXI+Ezgb/YLnplLDyxeY/VvCiPSEPXE/JrMec9v0CTiBKBrNLaHxbl9GES
 Mq5rCQCE38+cHPO87fiJhACtfSrJrbq9OxFtTMuDK47cOyykTGqDZrpssBhpfxqO4Zxn
 8ODQ==
X-Gm-Message-State: APjAAAVEFM8W6nfmkyjpPo0enI6/cdGb4YKkQMU7AgGQmZOSnGjMkNRJ
 BrN9V6T4JG7n+7gHVVnZ5GOOW9NnEM8=
X-Google-Smtp-Source: APXvYqxwHDNnwSRWBDGz3KvI8+gl/wzLhz3CdSqZBPFmXcyEmav46uRKQPVHfO14UC8UXzFmksdBxQ==
X-Received: by 2002:a63:e54f:: with SMTP id z15mr101944058pgj.4.1564372840933; 
 Sun, 28 Jul 2019 21:00:40 -0700 (PDT)
Received: from santosiv.in.ibm.com ([183.82.17.52])
 by smtp.gmail.com with ESMTPSA id g1sm100033948pgg.27.2019.07.28.21.00.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 28 Jul 2019 21:00:40 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel@vger.kernel.org
Subject: [v6 6/6] powerpc: add machine check safe copy_to_user
Date: Mon, 29 Jul 2019 09:30:11 +0530
Message-Id: <20190729040011.5086-7-santosh@fossix.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190729040011.5086-1-santosh@fossix.org>
References: <20190729040011.5086-1-santosh@fossix.org>
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
index f516796dd819..18d831f52fa7 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -135,6 +135,7 @@ config PPC
 	select ARCH_HAS_STRICT_KERNEL_RWX	if ((PPC_BOOK3S_64 || PPC32) && !RELOCATABLE && !HIBERNATION)
 	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UACCESS_FLUSHCACHE	if PPC64
+	select ARCH_HAS_UACCESS_MCSAFE		if PPC64
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
 	select ARCH_HAS_ZONE_DEVICE		if PPC_BOOK3S_64
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
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

