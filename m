Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D52529641
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2019 12:45:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 459NLw5hnrzDqV3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2019 20:45:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::344; helo=mail-wm1-x344.google.com;
 envelope-from=mathieu.malaterre@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="X1PxbDFg"; 
 dkim-atps=neutral
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 459NKb3nG8zDqS0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2019 20:44:35 +1000 (AEST)
Received: by mail-wm1-x344.google.com with SMTP id 15so8703200wmg.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2019 03:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0jy20rK00X/Jpvye1eiZdw+BT0nVJunFQCUMU0sD3iQ=;
 b=X1PxbDFgBqLM2NhmlrzxN/Z4MQHhxPSqs6aIHaPvF6iBAMLHzmH4nUvsmk//1HfYtC
 M7+RiqIUBnxnUqtQ25FtAlI9TYUuDf8FA0WWWY/sJW0s+MvmNdXDzLauptvrWs2cUaqj
 xB+/SW80bPKdsBGtHWxc3y8FmFHI5GngHXc59KD+O5Lr2DZmG38IJpvxIEkC6uuIeR/7
 wWJu9Qn8qPhvMRywg+V6bnzPeOFiQ/IORcoYGzLsMY7vtwENi1rb4BA++E0rVIYk3rnv
 Y0vPlbwObLKxWrwWEwMTrgKOWFImoQkdIM62Bc2RaeWmlzzqiOrhfp4C5RF5aK4p4H/c
 49DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0jy20rK00X/Jpvye1eiZdw+BT0nVJunFQCUMU0sD3iQ=;
 b=VYN8IPR1dM/E3Q4vQd4J9sVwOm2rOma12cbH1dov/N2pLR4eorS320taXUVm9lopFe
 DioYbA23x6Ggdqcg4q9HFkgxLszlqRZKwdy/0amCB7IQo/0UQCAEiiUwpu0tYt9iql66
 S8hKGU5TkpfX8f0SBIFD2vpf61dm2k9Cwdks2vORZjgLR8JBukE/uaJjBiQeP7FbiJ17
 9zB5DgjjrCSTxkiOE1+6fmPWx3b6xAk2z+hKcuEuzFJvw8t9HOMjtPg4C9Q3B+GoBdBm
 5pRG3pnbrMtKADCPkeK5tDsHgfrio4kSQ8u9Rm74vJQaLi4TQauyeUMdSRTogb1H12oH
 BDEA==
X-Gm-Message-State: APjAAAV/6ryF+939fNBzwNBvdanWzlLaEHu7Aj2X+GCFS6Ho/pSh6kh5
 lqAKxVgbXdnyVEadKJ7GEXU=
X-Google-Smtp-Source: APXvYqyeytuN8l7DauI//G/eM6aGcU8yhn6PWpRVKMHeZ4rs7BNDg9Pkie2MVw5YsStjKFsnchTflQ==
X-Received: by 2002:a1c:6c0a:: with SMTP id h10mr16235945wmc.135.1558694666632; 
 Fri, 24 May 2019 03:44:26 -0700 (PDT)
Received: from macbookpro.malat.net ([2a01:e34:ee1e:860:6f23:82e6:aa2d:bbd1])
 by smtp.gmail.com with ESMTPSA id
 o6sm4589463wrh.55.2019.05.24.03.44.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 May 2019 03:44:25 -0700 (PDT)
Received: by macbookpro.malat.net (Postfix, from userid 1000)
 id 9E40B11415E7; Fri, 24 May 2019 12:44:24 +0200 (CEST)
From: Mathieu Malaterre <malat@debian.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2] powerpc/power: Expose pfn_is_nosave prototype
Date: Fri, 24 May 2019 12:44:18 +0200
Message-Id: <20190524104418.17194-1-malat@debian.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523114736.30268-1-malat@debian.org>
References: <20190523114736.30268-1-malat@debian.org>
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
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-s390@vger.kernel.org,
 Len Brown <len.brown@intel.com>, Mathieu Malaterre <malat@debian.org>,
 linux-pm@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Pavel Machek <pavel@ucw.cz>, Martin Schwidefsky <schwidefsky@de.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The declaration for pfn_is_nosave is only available in
kernel/power/power.h. Since this function can be override in arch,
expose it globally. Having a prototype will make sure to avoid warning
(sometime treated as error with W=1) such as:

  arch/powerpc/kernel/suspend.c:18:5: error: no previous prototype for 'pfn_is_nosave' [-Werror=missing-prototypes]

This moves the declaration into a globally visible header file and add
missing include to avoid a warning on powerpc. Also remove the
duplicated prototypes since not required anymore.

Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Signed-off-by: Mathieu Malaterre <malat@debian.org>
---
v2: As suggestion by christophe remove duplicates prototypes

 arch/powerpc/kernel/suspend.c | 1 +
 arch/s390/kernel/entry.h      | 1 -
 include/linux/suspend.h       | 1 +
 kernel/power/power.h          | 2 --
 4 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/suspend.c b/arch/powerpc/kernel/suspend.c
index a531154cc0f3..9e1b6b894245 100644
--- a/arch/powerpc/kernel/suspend.c
+++ b/arch/powerpc/kernel/suspend.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/mm.h>
+#include <linux/suspend.h>
 #include <asm/page.h>
 #include <asm/sections.h>
 
diff --git a/arch/s390/kernel/entry.h b/arch/s390/kernel/entry.h
index 20420c2b8a14..b2956d49b6ad 100644
--- a/arch/s390/kernel/entry.h
+++ b/arch/s390/kernel/entry.h
@@ -63,7 +63,6 @@ void __init startup_init(void);
 void die(struct pt_regs *regs, const char *str);
 int setup_profiling_timer(unsigned int multiplier);
 void __init time_init(void);
-int pfn_is_nosave(unsigned long);
 void s390_early_resume(void);
 unsigned long prepare_ftrace_return(unsigned long parent, unsigned long sp, unsigned long ip);
 
diff --git a/include/linux/suspend.h b/include/linux/suspend.h
index 6b3ea9ea6a9e..e8b8a7bede90 100644
--- a/include/linux/suspend.h
+++ b/include/linux/suspend.h
@@ -395,6 +395,7 @@ extern bool system_entering_hibernation(void);
 extern bool hibernation_available(void);
 asmlinkage int swsusp_save(void);
 extern struct pbe *restore_pblist;
+int pfn_is_nosave(unsigned long pfn);
 #else /* CONFIG_HIBERNATION */
 static inline void register_nosave_region(unsigned long b, unsigned long e) {}
 static inline void register_nosave_region_late(unsigned long b, unsigned long e) {}
diff --git a/kernel/power/power.h b/kernel/power/power.h
index 9e58bdc8a562..44bee462ff57 100644
--- a/kernel/power/power.h
+++ b/kernel/power/power.h
@@ -75,8 +75,6 @@ static inline void hibernate_reserved_size_init(void) {}
 static inline void hibernate_image_size_init(void) {}
 #endif /* !CONFIG_HIBERNATION */
 
-extern int pfn_is_nosave(unsigned long);
-
 #define power_attr(_name) \
 static struct kobj_attribute _name##_attr = {	\
 	.attr	= {				\
-- 
2.20.1

