Return-Path: <linuxppc-dev+bounces-9828-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C34D2AEA2A0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jun 2025 17:32:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSjPC5BHKz30Wg;
	Fri, 27 Jun 2025 01:32:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::235"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750951967;
	cv=none; b=MQ9mjgsqBw8wBXtK1K8wqQ1hxrtWKFqaGUaDqP80QYnHaEJnl5vyW7AggXgmoBDHwkLwNK268mu2n42nN7JqNvFXzQd995UP8y+v/rEi3vq/RVp7MMW2wAdNF39Lqx4GSh/CdTOm2NOPZer0uZSVz8alSa9NSU5hk3qocj23e4oOlJHovbpd+dgwCeGu964kooMyh6eAVLZDDpSoGQVwxuSaPJCNXAmw0XJzrxEhLdk2Ihnm2dMGfzexuh4p6AQoGlad8sgwB4McudgtPFT0yJdHbXW5DPB6g+Ys1r57z7UUtZL8QkZJevz/ixOPVzmWPD5FJruq0QWCFyHDB9Kabw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750951967; c=relaxed/relaxed;
	bh=UAzHyennbJbJNQdO/m8GiAxn8DKdiS3FDiXvLMA3BPc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CDgR1Z/oF35u+kyhCR37rqldKeogqv+59wl6ESxx5Ij3NiIaxyfrDfEqZqkL3+hseqfq4wFp3fvR28YY7ETwACDoHgfcrm7VDs/5C/oIY1T3Due6Vx0pxvGgD44teD5WlByc5melIRXeSisEUdAnuyYHjQMFyWXC1K+N7iHAyr89p1cBUWM4eXrxZoBHWOASpiz7Ey8Y6g0x0FMtuQD8R1YvH+oOuB5bqLuFwohQDMKiqgtBffiFYf090JiO4MxNu1NXfzVWoNN1gIcPPDkRHXQD4+LF8TmZ2BH1NvcahHtWf3ACVayL6Owds+BvHn1z5LLR+38h2F2y9xefBiQFgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PuakFk63; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PuakFk63;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSjPB4zHnz30WY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jun 2025 01:32:46 +1000 (AEST)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-32cd499007aso5414701fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 08:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750951963; x=1751556763; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UAzHyennbJbJNQdO/m8GiAxn8DKdiS3FDiXvLMA3BPc=;
        b=PuakFk636KJge0lfLOvKiZrsP0RpgqUzdTugI3bWego1YnJ7Zo6IXbb/LxdX6R48B6
         rzF/6t0yzpNVBggjcDdyjbHS0NAqzMnOQ6geL5TEHg6xAh67uz4CbztEMdhtcRt9by1f
         CGSUdqQePxsGwfhecwTSrHxk63pwDnlePHV+oRdoOvwQMSTGXqIdn+CKYMsL31Hf063w
         ntl5q8mU7uN6ZuyTe9BIiEtiKKlZkT3QY/9L/3zVUHKPvcXYBT6VjSKNQsdx74bEjgD1
         1rSXvy7avgwbGklmUSQdyw08x0x6mlzcc/XGhHIsc4VEKgydrw31E6iC848uc99Cp97Y
         PIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750951963; x=1751556763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UAzHyennbJbJNQdO/m8GiAxn8DKdiS3FDiXvLMA3BPc=;
        b=RdvS+2yCRoXP8+pVVuBnUGZTmSU4hZkIGy2FBg6Fc5a8kz7imSGf8DjOKQmSURxOgw
         5t4fMF8uc54/XxnyaykNe7oaJXfvvZKGtPBHqJInmJpOYDxBK8eKC/O7ffl9AGLeVjMe
         jIfQMAO8HsLhz0pdObtvczvrFzIEcYO9xc5BW/qbxv0qkiyRHMH0C3+8St3CWGzTmb2y
         Iaz9ee4G6Q4evWBrOYvECs155aCElEs5ihgbHJDLntRTwDCOFNB84M4oZr1J+KcgWGcj
         tTR0qWi0iMVyAt4A7K2ayJTZXWAu2b07exmx+o1nkZZYSY3ENI7v4GOkritB7z69FfrF
         3zNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFx7GP4tck4taDxVAGrZjsv+t4xdmGKmrq/SHwrQd+0soTomcr7+AW+hxGqwCj+cqI1LzuxrjZdA2JKi8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyL8PBF/1uVcCx9F/IjGkIZWE7bThfFlY4ddBodYfnfiohYFYAp
	ckBmcyPc5R5XLV+H4eCWNfQFcqmr+DtajeJDerVH+4xe65rXnNrbF61z
X-Gm-Gg: ASbGncve5O/jXd56i3KEC2dvnmMIipus8y6d6jTGaYvJJOKjL6E26ctH+q4U3zVJVEd
	Xz6HeuKGNL9+JcemhfWOnIOjawGngG6W05JCe9Bng18jQ5fPMbo/e+V0DjEryNzmw/86utanbKl
	VxnUKDITIwrX09kj4yfkFStTQ/3qJruG0mrcQa5guCbZBTGzclxIBiCX7T/ZRikZ9C0jGGZlbAr
	iAniSM/xz6NjpuUwpkveIXAUVb6zTiSGJIigkpVsnnq2fOdGNjYhHYqde50ZgiEEL/RbLL/a8+i
	Pldo6RKFZzDqJMIayhOoyyeC9+bqoGak3gB4VX4TsBOdn40Ds1jMZQEBx4fGgu/UfR4VT6Po6oi
	5cKvYoZz2/iwdURG508dtWdNG+dJzYg==
X-Google-Smtp-Source: AGHT+IFtddewk+sZIWQ3c8HpfmVyVU50AdMchy9LvQ1Hdy+bQ74fAWulfETp69JVrreL6trc7kJUOQ==
X-Received: by 2002:a05:6512:2392:b0:553:5d4a:1ce4 with SMTP id 2adb3069b0e04-5550b467d15mr132805e87.2.1750951963311;
        Thu, 26 Jun 2025 08:32:43 -0700 (PDT)
Received: from localhost.localdomain (2.135.54.165.dynamic.telecom.kz. [2.135.54.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2ce1fasm42792e87.174.2025.06.26.08.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 08:32:42 -0700 (PDT)
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
Subject: [PATCH v2 06/11] kasan/um: call kasan_init_generic in kasan_init
Date: Thu, 26 Jun 2025 20:31:42 +0500
Message-Id: <20250626153147.145312-7-snovitoll@gmail.com>
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

Delete the key `kasan_um_is_ready` in favor of the global static flag in
linux/kasan-enabled.h which is enabled with kasan_init_generic().

Note that "kasan_init_generic" has __init macro, which is called by
kasan_init() which is not marked with __init in arch/um code.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218315
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
Changes in v2:
- add the proper header `#include <linux/kasan.h>`
---
 arch/um/include/asm/kasan.h | 5 -----
 arch/um/kernel/mem.c        | 4 ++--
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/arch/um/include/asm/kasan.h b/arch/um/include/asm/kasan.h
index f97bb1f7b85..81bcdc0f962 100644
--- a/arch/um/include/asm/kasan.h
+++ b/arch/um/include/asm/kasan.h
@@ -24,11 +24,6 @@
 
 #ifdef CONFIG_KASAN
 void kasan_init(void);
-extern int kasan_um_is_ready;
-
-#ifdef CONFIG_STATIC_LINK
-#define kasan_arch_is_ready() (kasan_um_is_ready)
-#endif
 #else
 static inline void kasan_init(void) { }
 #endif /* CONFIG_KASAN */
diff --git a/arch/um/kernel/mem.c b/arch/um/kernel/mem.c
index 76bec7de81b..058cb70e330 100644
--- a/arch/um/kernel/mem.c
+++ b/arch/um/kernel/mem.c
@@ -21,9 +21,9 @@
 #include <os.h>
 #include <um_malloc.h>
 #include <linux/sched/task.h>
+#include <linux/kasan.h>
 
 #ifdef CONFIG_KASAN
-int kasan_um_is_ready;
 void kasan_init(void)
 {
 	/*
@@ -32,7 +32,7 @@ void kasan_init(void)
 	 */
 	kasan_map_memory((void *)KASAN_SHADOW_START, KASAN_SHADOW_SIZE);
 	init_task.kasan_depth = 0;
-	kasan_um_is_ready = true;
+	kasan_init_generic();
 }
 
 static void (*kasan_init_ptr)(void)
-- 
2.34.1


