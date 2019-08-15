Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA7B8E236
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 02:56:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4687Lp5VVjzDr7k
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 10:56:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="HWqj9ejN"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46870C4d26zDqyk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 10:40:27 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id 129so403462pfa.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 17:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/fmDyudl4ch4OP62eHQXqnVTVLm5jUqLhjp55PmzJvo=;
 b=HWqj9ejNdJQayCUbigjbIXvdJTCNkGhJls8EEyFYC0V8P4n0cTodkeE/HZhHecjB2W
 l7K6/dnZ3R92f0SnXwkyP4/Slv8+iF8HLECnGiERqMUdnAxpOvN6Me8I+/OVNGlTMWWH
 glveWyra0FcWwjnojoIwAzWWCNACyTvNdRFctxY1L0ClXgRia0nJ7aA0BC8IB/kuQBN3
 Pj+r+anTktTiSy2dF3unKDZi5QJdbIEpr3+y+WwRAU9VsbXTYnltGnsmDCenf+WVBJab
 Uc/f4tASqK5hui6iQhES1/wQ3tn4JLbkW7lPDoaTwWFKP02oJTUmptnbNvSC7sdIZ0E0
 sFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/fmDyudl4ch4OP62eHQXqnVTVLm5jUqLhjp55PmzJvo=;
 b=UQjyp3Bqcg2MMq01n8VYkCUpY8nrotZmkIUeqQAROzFZ/VOgKh92dyeAKbbYs5V7gO
 m7PAku6elrCiMcVCmqF57h9WQKffheW0nt2Ux1caub8Uo70M+hAzMASrslyovjkFrwL2
 cmXow5n5z9+l1rxGP8gkJipkI/szvhH6xh5f10XgJUghKsW+e50utt/nLexL3TGcRBYA
 7uDieNb+cDd8eLAkDOSY5GASVB/Imqr2S7Ga+ibtvrHZ2Kv29sHMVy/GJyn2FCRv6P7w
 le5s7u4pbiMzUCXKFHjr4G+oMjicptlEav06csyMro5kDry8DW79OX4T/DnTFKCrbcy6
 28Xw==
X-Gm-Message-State: APjAAAWjygBiwcFBxgJzx3o6ziElC4H2FJiL/NuX8Jk6J6KSAGcOfCwK
 OZrNBL9NokGhfLbMyXWXa/987+AXAeOh5g==
X-Google-Smtp-Source: APXvYqxJ0ghvU9hcLu7YTY3p+AcV3t2y1ZX9SIluJdDl1sFi0V2JgVZjpV4KqrkTpI3HBiO5NV1fBw==
X-Received: by 2002:a63:ee08:: with SMTP id e8mr1562536pgi.70.1565829625505;
 Wed, 14 Aug 2019 17:40:25 -0700 (PDT)
Received: from santosiv.in.ibm.com ([49.205.218.176])
 by smtp.gmail.com with ESMTPSA id g8sm815917pgk.1.2019.08.14.17.40.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 17:40:24 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 7/7] powerpc: add machine check safe copy_to_user
Date: Thu, 15 Aug 2019 06:09:41 +0530
Message-Id: <20190815003941.18655-8-santosh@fossix.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190815003941.18655-1-santosh@fossix.org>
References: <20190815003941.18655-1-santosh@fossix.org>
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

