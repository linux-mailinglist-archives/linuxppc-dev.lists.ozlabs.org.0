Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CBC5C8CC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 07:31:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dCWw4GYGzDqGc
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 15:31:08 +1000 (AEST)
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
 header.i=@fossix-org.20150623.gappssmtp.com header.b="sdVj0eAf"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dCHL29QVzDq5b
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2019 15:20:14 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id ay6so8462417plb.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Jul 2019 22:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FCcMOSA1W9ejLFHOo0LYIVGLCDzvV9wbPlNYjs5O9hk=;
 b=sdVj0eAfVKWAD1kIC38Y7C0eUOy2gEIHlkGgpEQmALTS3WGhU4vXtT0HL8qlIU1kwB
 qMWcsfQMaFlWnSS8DpMgAheOiFqDzKvwfwvnT3hkUGyJr96VQ0N4zUopPUGRkTWRsUfr
 qEIBIMKNV7FO5x866Y/NUWLrdYV1Fz6jyE2kTeixnE1Q9VOKD+wav21Zz11R3advj4la
 Sx2SlJ4ibk4d5KS8Q96NuO3pujuP/dvOgXLC1iG7T9VmGnDvek/D4QmADMtYlLJGR2XE
 rFkCDUWt/Vi5XlWtfnpMj17u7QMCZgYDMdd6doHHvwu4cvQtdgTpdIZvWPDwOHNv8RQO
 FqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FCcMOSA1W9ejLFHOo0LYIVGLCDzvV9wbPlNYjs5O9hk=;
 b=Xsd4iipQzGMkG481+UEcfMoPS3QFk6F+gObSv8q/NX2tdWn70YaAXgnklSD8FBrMxP
 y3EiYnLpNc21T5OZS2Ser+5xmopsufK0ydqsinxq6QyaZLVFI95TjcgkES6TeUs8YbGi
 /SQtL3CwyFJ/+dC0fAabOICszWh6rdh8eItvx615PpFRztsn+7if+yfKk+Ct/Bxdjj1z
 CxH9Y3LoOcaPrsfYYiT9Ie5o5WtxTc+05dzGGTvpdxfa306+NByqtKcaciDwEf5SoTRu
 HV5/avo78EMFeKqXpAj6/uIMRrbylFUwp0XxSOwrUwyd/F8Wt5oGiJv4mtarGbzZL+wO
 0VMA==
X-Gm-Message-State: APjAAAUufNAB4r4jLWTovB6xZPGAhPwiosBc3J/sknPD1XU1LdZXEuxT
 JIxN+/h6ShR6zQUPf1eWmLIMhp2DljWQww==
X-Google-Smtp-Source: APXvYqxnqKafTJespSqfVY2qOrOnHM774v6y59+0drWqz/5t/Wdszynw9oy0ZAUSFjqokX+JCPTy6Q==
X-Received: by 2002:a17:902:2884:: with SMTP id
 f4mr32469631plb.286.1562044812353; 
 Mon, 01 Jul 2019 22:20:12 -0700 (PDT)
Received: from santosiv.in.ibm.com ([129.41.84.67])
 by smtp.gmail.com with ESMTPSA id t9sm1106898pji.18.2019.07.01.22.20.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 01 Jul 2019 22:20:11 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [v2 09/12] powerpc/mce: Enable MCE notifiers in external modules
Date: Tue,  2 Jul 2019 10:49:29 +0530
Message-Id: <20190702051932.511-10-santosh@fossix.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702051932.511-1-santosh@fossix.org>
References: <20190702051932.511-1-santosh@fossix.org>
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

From: Reza Arbab <arbab@linux.ibm.com>

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 6 ++++++
 arch/powerpc/kernel/mce.c            | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index c83e38a403fd..311f1392a2ec 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -458,6 +458,12 @@ EXC_COMMON_BEGIN(machine_check_handle_early)
 	bl	machine_check_early
 	std	r3,RESULT(r1)	/* Save result */
 
+	/* Notifiers may be in a module, so enable virtual addressing. */
+	mfmsr	r11
+	ori	r11,r11,MSR_IR
+	ori	r11,r11,MSR_DR
+	mtmsr	r11
+
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	machine_check_notify
 	ld	r11,RESULT(r1)
diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
index a8348a9bea5b..9e4d497837d8 100644
--- a/arch/powerpc/kernel/mce.c
+++ b/arch/powerpc/kernel/mce.c
@@ -50,11 +50,13 @@ int mce_register_notifier(struct notifier_block *nb)
 {
 	return blocking_notifier_chain_register(&mce_notifier_list, nb);
 }
+EXPORT_SYMBOL_GPL(mce_register_notifier);
 
 int mce_unregister_notifier(struct notifier_block *nb)
 {
 	return blocking_notifier_chain_unregister(&mce_notifier_list, nb);
 }
+EXPORT_SYMBOL_GPL(mce_unregister_notifier);
 
 static int check_memcpy_mcsafe(struct notifier_block *nb, unsigned long val,
 			       void *data)
-- 
2.20.1

