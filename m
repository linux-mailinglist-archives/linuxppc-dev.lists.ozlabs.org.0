Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4129B1CA267
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 06:46:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JHpC6yJ5zDqYb
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 14:45:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=twfnXqzw; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JHY40ttvzDqwn
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 14:34:31 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id mq3so3692835pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 May 2020 21:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SNMJNUVBVMFDDALQIqYfqlk0FO/ObaEDypqjoliA8Vk=;
 b=twfnXqzwUJtEdzyvJKwuHRDip0I0lTyelIKna7l2D+ShqPxHVnIVBRHmdODh4+kwKc
 JR/ufzWa+FooTVeN4Z47zfC9JgIQICBtFa9Vqy5Fkkp7oL9qga0sSe023qgYefXtvErk
 ddedOiMCyJMjSN7afncsDGKaLGO+ml+NU3S74mDXnSPe/hoV32B3QSJTaB2hAwew4pkT
 XSgG1WZ/rGAotf8qAlDUF8oory1zR7VYE3sxGZ+U7fkQ7S/gVop/W+eABDsCHDObChGF
 6jZiH39P7bx/9vMSYx7Ki6K0LP6ZXahTU+6d03yolZkRNukN68ZA+rWrgQDh54pOqN4w
 aAmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SNMJNUVBVMFDDALQIqYfqlk0FO/ObaEDypqjoliA8Vk=;
 b=uZax/YNURNZs0KhyfHlND9grcyog3K7N3zp6x2vfvu/SZxWYAUHMCjpFRgJohGYDMy
 xvI/y40uKibwn8+b4oSbzKqWQGYFU+DB58bEEjiDMQtvOn9acAPg5VmlGEB9SaJWkHJV
 00VK3h8n9eUl6F/vT04QOkYESV2/j9KJ3p7mq/fwFmR20HwFmBe/+IagNEbqN1nlp4fY
 S7hizRxIoasYDV+sT5gONTmgmrMu1+1dkXHiBi4qwo3eZdDZ+504JrOj5AMBY6nx6S7V
 crlefbPZOIrXFWx0KMUJgjAXZ3M7qv1g80HrH8ZF+Z2o8UcbjRUCl6onXraOGUPGSwRT
 KsoQ==
X-Gm-Message-State: AGi0PubTCEjYN4usC6ZrXPs+T0Wl7MoQjOTfFLD5LqrwgJYweRad2J/F
 1v+aWjNn31Xb3rbgY1lPoQwfnDy0
X-Google-Smtp-Source: APiQypJLz8ARutXh+5PugFi3W/17xoBu8zsa7TwUQ48mDTlBWzX5iYtHilPjBTJi+9Eo0BG5RHn8bw==
X-Received: by 2002:a17:902:bc89:: with SMTP id
 bb9mr597476plb.101.1588912469065; 
 Thu, 07 May 2020 21:34:29 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (61-68-214-199.tpgi.com.au. [61.68.214.199])
 by smtp.gmail.com with ESMTPSA id i9sm358813pfk.199.2020.05.07.21.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 21:34:28 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 05/16] powerpc/pseries/ras: avoid calling rtas_token in NMI
 paths
Date: Fri,  8 May 2020 14:33:57 +1000
Message-Id: <20200508043408.886394-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200508043408.886394-1-npiggin@gmail.com>
References: <20200508043408.886394-1-npiggin@gmail.com>
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
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In the interest of reducing code and possible failures in the
machine check and system reset paths, grab the "ibm,nmi-interlock"
token at init time.

Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>
Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/firmware.h    |  1 +
 arch/powerpc/platforms/pseries/ras.c   |  2 +-
 arch/powerpc/platforms/pseries/setup.c | 14 ++++++++++----
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/firmware.h b/arch/powerpc/include/asm/firmware.h
index ca33f4ef6cb4..6003c2e533a0 100644
--- a/arch/powerpc/include/asm/firmware.h
+++ b/arch/powerpc/include/asm/firmware.h
@@ -128,6 +128,7 @@ extern void machine_check_fwnmi(void);
 
 /* This is true if we are using the firmware NMI handler (typically LPAR) */
 extern int fwnmi_active;
+extern int ibm_nmi_interlock_token;
 
 extern unsigned int __start___fw_ftr_fixup, __stop___fw_ftr_fixup;
 
diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
index 1d1da639b8b7..ac92f8687ea3 100644
--- a/arch/powerpc/platforms/pseries/ras.c
+++ b/arch/powerpc/platforms/pseries/ras.c
@@ -458,7 +458,7 @@ static struct rtas_error_log *fwnmi_get_errinfo(struct pt_regs *regs)
  */
 static void fwnmi_release_errinfo(void)
 {
-	int ret = rtas_call(rtas_token("ibm,nmi-interlock"), 0, 1, NULL);
+	int ret = rtas_call(ibm_nmi_interlock_token, 0, 1, NULL);
 	if (ret != 0)
 		printk(KERN_ERR "FWNMI: nmi-interlock failed: %d\n", ret);
 }
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 0c8421dd01ab..dd234095ae4f 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -83,6 +83,7 @@ unsigned long CMO_PageSize = (ASM_CONST(1) << IOMMU_PAGE_SHIFT_4K);
 EXPORT_SYMBOL(CMO_PageSize);
 
 int fwnmi_active;  /* TRUE if an FWNMI handler is present */
+int ibm_nmi_interlock_token;
 
 static void pSeries_show_cpuinfo(struct seq_file *m)
 {
@@ -113,9 +114,14 @@ static void __init fwnmi_init(void)
 	struct slb_entry *slb_ptr;
 	size_t size;
 #endif
+	int ibm_nmi_register_token;
 
-	int ibm_nmi_register = rtas_token("ibm,nmi-register");
-	if (ibm_nmi_register == RTAS_UNKNOWN_SERVICE)
+	ibm_nmi_register_token = rtas_token("ibm,nmi-register");
+	if (ibm_nmi_register_token == RTAS_UNKNOWN_SERVICE)
+		return;
+
+	ibm_nmi_interlock_token = rtas_token("ibm,nmi-interlock");
+	if (WARN_ON(ibm_nmi_interlock_token == RTAS_UNKNOWN_SERVICE))
 		return;
 
 	/* If the kernel's not linked at zero we point the firmware at low
@@ -123,8 +129,8 @@ static void __init fwnmi_init(void)
 	system_reset_addr  = __pa(system_reset_fwnmi) - PHYSICAL_START;
 	machine_check_addr = __pa(machine_check_fwnmi) - PHYSICAL_START;
 
-	if (0 == rtas_call(ibm_nmi_register, 2, 1, NULL, system_reset_addr,
-				machine_check_addr))
+	if (0 == rtas_call(ibm_nmi_register_token, 2, 1, NULL,
+			   system_reset_addr, machine_check_addr))
 		fwnmi_active = 1;
 
 	/*
-- 
2.23.0

