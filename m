Return-Path: <linuxppc-dev+bounces-9755-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B8CAE8563
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 15:59:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS3NM00c9z3bV6;
	Wed, 25 Jun 2025 23:59:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::229"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750845207;
	cv=none; b=IkTjbUD4qO8Ngl2cIpudSCMyVl1Ps0f2Cp1nSsOHSvXvh8NxJv8rdgyFsVM/uNm5u0Ak2/RPjsuafQd+imXWcUDaHAWY2NEPyaWOk9dj6ScdtuCC1T55buIjIkwfOyzG892K63bRtt/q+KTAbG8Ku9I0xyKcMpxHgP4VRi4XN5scj5Q1De3hKOiYFQN9ii5yCxeLrto2h55+33JmkWUN6mgiZoVQmYSKTqvR20dkm8pu8MvBzcos70RJyPt6ivPGg/jfQlXiZkkO/Vi3Jdl2fjCvaShnH54cqilkxUtSS96l6eo6dGeB9Qc4H/g96mghdSTYA5PF6fyB1cyQN03GDw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750845207; c=relaxed/relaxed;
	bh=8HfJTJJcJZY7/fCA0Tiz5Rc62kUV3pDrNC7eedpHA74=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q15C7nW8HDsWymF71XKkzeT2Q6uqX1A4HMvJrlPpTqOPA8WNXNtO2ub1JJ+j4NqSfpXDqpSQ6GTLlZVLmWFn3K+DbgqN7bfzueAZprG7ScQqOW6hvSoHqLiO1G8CpEiXH318MegohXPfXJYgVx26fW2IfUQzaYdgpiEB5ZUsBFH4LCaNmkmclzJ6YuvNA8ACCLFRlt6mcsR34AOFya2+shY9mMoAM70COaEPgUcXLkv24HzWdAzPwrnUOLCzGLHtYxxJKBO5Th4tn7xViddPWbEDYiOtFkC0tDJ5p655Plje5m4PEscKb4kBHjA8JqZQN0sAr+dVA2YVw5dkAei3Fw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MQCY8AkI; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MQCY8AkI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRxw61QsXz2yKq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 19:53:26 +1000 (AEST)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-30f30200b51so78899821fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 02:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750845203; x=1751450003; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8HfJTJJcJZY7/fCA0Tiz5Rc62kUV3pDrNC7eedpHA74=;
        b=MQCY8AkIQGA4qOZKQTGFHTJ2jLhanaT2BXMsaX8mxZJxGZG1AOu/w7p8BkRnXspf0B
         oNj8ACrixe9tzBhzeLUNZUzBqo04crNUCWFeS0156JGVeeNjdl8DZeTDFjNWVIcMO0xX
         bqvXri+nX5cj+emA/TjVS1gz7w9uXvCtRxTyzPYwBgLZLtPcHJmKhzKrjQy1AWm7OF4F
         jjdMYkn1AoNUFKpeszPAd8XS+y72inwHblTwtogTqcWaHw8bnG1s6P/1mIlCILQj5eDY
         fwpEEP4W0Hmh/yCurHtnkdmjh3tHHh+ip8ajVyzoiIW518fQRvX7hDPZLNminOT1W+MI
         mCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750845203; x=1751450003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8HfJTJJcJZY7/fCA0Tiz5Rc62kUV3pDrNC7eedpHA74=;
        b=Tv9xVyt7uJnS8NYFQk4QfX+U1kdYn23iH/dtLYm1KYur1cdU3DcDFwfplbiG6P1evB
         qO2CwuOLTWBHCiIRLHnP82dv93Nb3QggqUGkZel7YCBE1lwX1AdBO0FL46LRSn95vKkW
         EuXd9tc80LxC1OCmZnbK+61nysPttlBT2Uu4JETPj9hIZUOu59r9VmqYMZ4i7SjhIDSF
         aFz9E93b6Kx94Y5leQ+8zHjgD9hlBEp2UiYphUsJTzfks1aNcAvDHXg2Nl4tx7mG1nYq
         MS5iO7pVEpFTOydz4WYtxr8EdogjZ1Dp4itDHYHp9wshTLMqIdDVSdn5NUr1g8vv3sw1
         XT+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWxEXRHl+2bd7xvdaIDcGeQ7UUUR/jtU+DSolov4816ePmkT/FxO8qTPylAzS+hqtRItYpUciVHZiMULV8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzNSbOzXAhULzpp1/NKBESbtU+rniUGiWlvHVUsUv+fiYp+uCgJ
	7rdxWdCMo4ZIH/FKnzOv5KVu+NYI12xV0BBEv5NcQhKMBIxQCDI7R7Tb
X-Gm-Gg: ASbGncsgJidedbQKP0ArPSy1Bw4lK1pFXU4VUjsbEEZrGbjzavCQvw+ceGfnUpc6Qui
	3141tYVjz3z7nBMhoQ8Ef2nW4hctVHmfipf/dk3S0ZfOU0GNu6OJP4WXUXHoUHj9G+bLvmBmAls
	6MR5IUzn9dW+7xOsPLkps1VzLHy+616mUzpv5bM4mwV/Rq/LnQt0qU4/CyHPkllRCrH3oh/eoxr
	zcJCali4JwvJxb7bZaNuEE8o0kVTd2XfAq+ecytiIx2Uy4TWPqpeaS5IjkY3vmNNBu1b80mdY7A
	C3L30DJ18ctiWyt9uREgA1dKxoFPagdHjiUwMLor8VpYE77dZ3emBhjcx0eJ/hn/MNhLN8NVja2
	ofZASovrdlk6LuWXd3S0M2Tlw5fZaRQ==
X-Google-Smtp-Source: AGHT+IGryY1FCOgoaOa1ABgKWf+F5LHoFKkqdltui071JTPn8wvOuq6kBWhaIRALdveundDdtHS+Sw==
X-Received: by 2002:a05:651c:31c:b0:32c:a771:9899 with SMTP id 38308e7fff4ca-32cc648af6cmr6208261fa.9.1750845202774;
        Wed, 25 Jun 2025 02:53:22 -0700 (PDT)
Received: from localhost.localdomain (2.135.54.165.dynamic.telecom.kz. [2.135.54.165])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b980a36c0sm19311851fa.62.2025.06.25.02.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:53:22 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: ryabinin.a.a@gmail.com,
	glider@google.com,
	andreyknvl@gmail.com,
	dvyukov@google.com,
	vincenzo.frascino@arm.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
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
	akpm@linux-foundation.org
Cc: guoweikang.kernel@gmail.com,
	geert@linux-m68k.org,
	rppt@kernel.org,
	tiwei.btw@antgroup.com,
	richard.weiyang@gmail.com,
	benjamin.berg@intel.com,
	kevin.brodsky@arm.com,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-mm@kvack.org,
	snovitoll@gmail.com
Subject: [PATCH 6/9] kasan/um: call kasan_init_generic in kasan_init
Date: Wed, 25 Jun 2025 14:52:21 +0500
Message-Id: <20250625095224.118679-7-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250625095224.118679-1-snovitoll@gmail.com>
References: <20250625095224.118679-1-snovitoll@gmail.com>
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

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218315
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
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
index 76bec7de81b..2632269d530 100644
--- a/arch/um/kernel/mem.c
+++ b/arch/um/kernel/mem.c
@@ -21,9 +21,9 @@
 #include <os.h>
 #include <um_malloc.h>
 #include <linux/sched/task.h>
+#include <linux/kasan-enabled.h>
 
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


