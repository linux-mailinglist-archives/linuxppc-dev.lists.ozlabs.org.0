Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA56635F0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 14:32:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jhY92QfTzDqXd
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 22:32:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="Aq4tw2DO"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jhB83DthzDqBG
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2019 22:16:16 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id b7so10014037pls.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Jul 2019 05:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fkBqb9r0ZPOja9LVgBYQkYAhfvXLkyoq2mrWQ0Pvb1g=;
 b=Aq4tw2DOBGdNB98EMhXA4w+2ylAiJ1OoZ3NSWIh34kOBQUPX8LuS0VRymUQpuGOvBu
 rGEaItVxkNkDUTz//EY+aLVdfR4b+kKkRdiV4ho1cD1ug5FrdeOBgb36izjxxDzVAevZ
 ACC7a/9tkGYTXuxqeg6ltiNNN2XwoW6yMImECQU0a+vdSq6ZyNXDKtgxo/+vOMqGVigQ
 cJ+kK1ZmrHspDe0nIbIFYWf7UctJ7R5JkluYqRyXrpkNZjH1OBNty7GLFMXo2C//icqj
 FPwKWlEeesGB2W6zZEt7aN04czkEoS9wHXmO+xYnZUnWPewITL541qK60sdqPQU2ALZx
 QouQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fkBqb9r0ZPOja9LVgBYQkYAhfvXLkyoq2mrWQ0Pvb1g=;
 b=sWNe7gkOsws36ko/S2genxclYccFOgLVs3IEs80DwuW4RgziXdxbXeYLuxfl5hVAza
 rZUldJnjHw/N0ZSOhqHK/ZApds5KdudB1g4HXIK1M78CBeR9drinXko9jJYZVNNHWoiQ
 4nl60IrBqYS4WEIZ5BSncoz+LMPGIouTEH5kyfA2YwFtC3dPXQ6um8sON/lFbGSSJeyI
 9WqsiaNITUToN6GGjGuPUGigLNJjHf1f/oE9tNnEohlNfPsgzJWq5nquk1EGd+j2qLnp
 u+g76dOOAr0h4d1JW6J6stbWCG3XqpaWkGPMNtjpe/UBhzpvQLtHO5HeUH6TzugBV9Qc
 seGQ==
X-Gm-Message-State: APjAAAVC6MRD54g8QRgUyET7P7AOg0QX250it7ilE0+4QNogsdSbdJFT
 p8EoAGLLL794/9date+XY+dwpQtIh47zLJUi
X-Google-Smtp-Source: APXvYqxoJPumP2n/U3rz8WfX3Lh81RLahpQDrCmW2U3rK49Lkf/SP3QFjcTITL8TkqaPWIT1ztqrew==
X-Received: by 2002:a17:902:24c:: with SMTP id 70mr31615139plc.2.1562674574365; 
 Tue, 09 Jul 2019 05:16:14 -0700 (PDT)
Received: from santosiv.in.ibm.com ([223.186.121.175])
 by smtp.gmail.com with ESMTPSA id o15sm21243933pgj.18.2019.07.09.05.16.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 09 Jul 2019 05:16:14 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel@vger.kernel.org
Subject: [v5 6/6] powerpc: add machine check safe copy_to_user
Date: Tue,  9 Jul 2019 17:45:24 +0530
Message-Id: <20190709121524.18762-7-santosh@fossix.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190709121524.18762-1-santosh@fossix.org>
References: <20190709121524.18762-1-santosh@fossix.org>
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

