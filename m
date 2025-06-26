Return-Path: <linuxppc-dev+bounces-9830-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74862AEA2A7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jun 2025 17:33:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSjPS6Thgz3bgn;
	Fri, 27 Jun 2025 01:33:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::132"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750951980;
	cv=none; b=YIKX6XQ6ECfXAR1kNtEIQddRoBPvZ9UVn8OvKcpRqzEoWc5XDjH6886l0WiALXwHU9QoJvfsg1r6GZIcpArZwr21OZuvQzCH0N1C/C9QoFdeYNQPg9/VtuEL9OVYrOaPSIniXGEHiF7U6+2bFWZBLD1NnHieHqBsfraqL+PmAUtBH3rCANoCsyLhfO5I+wZHeC1bgYqM/5ATWJL+dpY3HuhfgnQp+9k5+Bu9vFQtilFCmh5XQjibB+jfIZpCB8ChFxTRhcapO/xHYF+T0a/GeBUyltBW8NMJT5V5z8YblgcPOuZwNN4gTPmfrkL4ZpaeXxfHG2ZOf0CCzOWOKUZ7pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750951980; c=relaxed/relaxed;
	bh=ZBJYqNEFUsGcSKAGhcxt9dDlG97Ga+bpIV5ghyvlETw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MEYCfd8cG9bumGPlkMIod8NSH8ISK9friwq81gwjH4uASMjjQ8P3kJD7itPamx7OM4ij2Dyz4reDi4Eh2sqd7eYDTIMCcpHwxos2F0cODDc81C1OxXLSxxnj4gvVqfMrNDoN1KTM3nwAinu2H4LzCOmBLF4OnZjwww9crluijNx6Z6eTZMSWARORV4IriAAgykfcoOENG2MlD6PdgXr9NfuWbh7iU2MeopVNJYaCGLWLo+OuV75jaeG6iUV3mugRAUHDMCw80o3uFjEwYZxy2VGD0n+uFn3vD9z7cU1gIdLjxFKIRxKyPHSzvXJ+N9sMv4g7G1BsFUgHntZnPwJ0jw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ii5Nj5qz; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ii5Nj5qz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSjPR52Q3z3bNt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jun 2025 01:32:59 +1000 (AEST)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-553b6a349ccso1266249e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 08:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750951976; x=1751556776; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZBJYqNEFUsGcSKAGhcxt9dDlG97Ga+bpIV5ghyvlETw=;
        b=ii5Nj5qzT3RM4cPRdN8MiHiUWHjYzkrpa12sxhFqkErZgKrrkgh+W/uX/bEN2NSbbS
         Q8g5dfLgEBH1S/WLQpAQAouX2LmqaEVTcZnO6CYP2FsL1foLWO5wdZNPEmJGUY6JDyMM
         oahtwtjIBLtA6Rx81z2Go5QLdF3jntbh8lbY5rPNM0rVCXljXnoSgXEOc55h02xGz8Bd
         rVXEqMqsbfW2ALfC7T/XVtrz90HBH4RxmXb5d957El+eeJNzU1oOWCb8QdRsyhpZxqhP
         1LogNjRni0db+/TfqnIQawHpzhr+qroEHxZjQmdx7jlyWdQ1TGZkxHVs8tVFkHZmT6WH
         WTSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750951976; x=1751556776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZBJYqNEFUsGcSKAGhcxt9dDlG97Ga+bpIV5ghyvlETw=;
        b=oZU+j7FHfeob9IqDl7D/vZbrd2W0dNqSLWna/Efi2xunFc8Kv/bkI9SP6ghN5Zin/+
         ps5hkM1ZJqs1jw9MSJKJHeBD9584P9dQfNwQswb24Cc6edd3u7THv0YC6i9Nn7Hktj1M
         ottdTdPl3hi7btfzKIcZd9wbqlkH6jzDc3CPk3ZQtsyZ9K3Gs6lTqkVztkGn8oSDGGPk
         zgCruq8FkaJhtlTUeikBEyRwlDbszKl0cvk4ArFAk7k/YEPHUMhhMkofEo5xsS14rd2V
         uHVsRePWNMoL+x6Q1H/M1EesPHL3HWix7fRVYMk4cSL7Xy1tjAzq6sHMc9A4lyGcuvyK
         k6Sw==
X-Forwarded-Encrypted: i=1; AJvYcCWqA00O0aLBdn0Cbx1lCwgo0I9r8gHgXjDGrf+ptOm8rqYTB1WqHcDI8NGFDs8Nu+4i5MRrt2s6hhsdpY8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzqpFvhrIopEH6GUPKLXPvKxBwTXmdaZmCaXvW9VkjM3sMgJIKZ
	l3HrtfDy/8TotdpQYx/01P7+QbsgOor6Z+6XMRCcHcPEjwak0Dxwvja1
X-Gm-Gg: ASbGnctDzYKx22KOD1FaY1LcVvZW7TLSctHL0WoSjQgU6yrJbgR4m7M9jmiJ2Rmajok
	X+fk/HzaVt8t8EfRYSq7ZIamLJIsL/0jkobwQt6A/br/LjxcOjggTR8ioi53nEzNKE6fGImQqsy
	vmffvMFDaZS1Dqpqul25NG0plVcCOP9j4i9ykgqzFKVUTRUQH5FtTZGub6UVI3fXd2UTuVmwwt3
	ixnUlGLS8VcYEK0zMY/jTxYnf4qMsMDrcwhBSNJsLFk06w66junEkEtq8vBGBIozAVunNInLHSz
	C/EnRUUTMK9g2Qnra3v0FYYNl2EBPFWmb9kOS7eiVxCQnW/3AF/q4h5YXzPD27HpD73CBR3CWrq
	BBE5H2po9Jn1mPGvbbN0GXg2LqNo7RFGOkprj/QQ8
X-Google-Smtp-Source: AGHT+IEFT2kc8D9hjhRCI4Kut+1atHj8fN6ClIv95YfFL1i2Q+3r8LuVnLNmbJZfRzfJp4+oWdZNgw==
X-Received: by 2002:a05:6512:3dab:b0:553:26f6:bbfd with SMTP id 2adb3069b0e04-554fdce00cdmr2633203e87.8.1750951976245;
        Thu, 26 Jun 2025 08:32:56 -0700 (PDT)
Received: from localhost.localdomain (2.135.54.165.dynamic.telecom.kz. [2.135.54.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2ce1fasm42792e87.174.2025.06.26.08.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 08:32:55 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: ryabinin.a.a@gmail.com,
	glider@google.com,
	andreyknvl@gmail.com,
	dvyukov@google.com,
	vincenzo.frascino@arm.com,
	linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com,
	svens@linux.ibm.com,
	richard@nod.at,
	anton.ivanov@cambridgegreys.com,
	johannes@sipsolutions.net,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	akpm@linux-foundation.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com
Cc: arnd@arndb.de,
	rppt@kernel.org,
	geert@linux-m68k.org,
	mcgrof@kernel.org,
	guoweikang.kernel@gmail.com,
	tiwei.btw@antgroup.com,
	kevin.brodsky@arm.com,
	benjamin.berg@intel.com,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	snovitoll@gmail.com
Subject: [PATCH v2 08/11] kasan/s390: call kasan_init_generic in kasan_init
Date: Thu, 26 Jun 2025 20:31:44 +0500
Message-Id: <20250626153147.145312-9-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250626153147.145312-1-snovitoll@gmail.com>
References: <20250626153147.145312-1-snovitoll@gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Call kasan_init_generic() which enables the static flag
to mark generic KASAN initialized, otherwise it's an inline stub.
Also prints the banner from the single place.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218315
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
 arch/s390/kernel/early.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/s390/kernel/early.c b/arch/s390/kernel/early.c
index 54cf0923050..7ada1324f6a 100644
--- a/arch/s390/kernel/early.c
+++ b/arch/s390/kernel/early.c
@@ -21,6 +21,7 @@
 #include <linux/kernel.h>
 #include <asm/asm-extable.h>
 #include <linux/memblock.h>
+#include <linux/kasan.h>
 #include <asm/access-regs.h>
 #include <asm/asm-offsets.h>
 #include <asm/machine.h>
@@ -65,7 +66,7 @@ static void __init kasan_early_init(void)
 {
 #ifdef CONFIG_KASAN
 	init_task.kasan_depth = 0;
-	pr_info("KernelAddressSanitizer initialized\n");
+	kasan_init_generic();
 #endif
 }
 
-- 
2.34.1


