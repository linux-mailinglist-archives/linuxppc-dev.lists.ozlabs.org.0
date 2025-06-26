Return-Path: <linuxppc-dev+bounces-9824-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEA1AEA296
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jun 2025 17:32:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSjNj3bqJz30Vl;
	Fri, 27 Jun 2025 01:32:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750951941;
	cv=none; b=Ga6DTnT41Ds5+dbfosv0Lwt0j5Adp1y50u9A9UIWprIHhEtuUyA4Y1L3AdP830tBFwxuMtdFvuMbhtrs8WLJcMRpFqydlzK1VCEblQ/2nEFw4BPl8QKEvZLMzTPuzpU3GTiEuFHX+ZnK5qHsicb6ACUCyAAAkwNeJ8X0RaB/bVa1xNUSSEkiVJ4mY4hy9ErskmnHaBiYM2ZLwJW8rICq1AXE40N/N5zQzt96TXqAKkL2j3dBL5xDRruyTdxGhrw2jD5qK2j/NMwIDCM+U4KEgCKVWxLwgxG/HITYZlmJOmk+4W1ikz+HvAiFufg/17EASe/BMshTb+H2KVZjbrtV+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750951941; c=relaxed/relaxed;
	bh=m8+Li4ZqAZW0QY7sIIldmBLFf6VQ+4AeP6Iv95ugt8g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UqGtXjRFa29o6hgiyzZRrJlDyECsOF2pi73d3/KzI/Loa/oXXTxuomYGN8QaulGmVjzcFhD2U6lOKozF2hVO7f+hi/BEs5pqlQ31GzCG72Cz7I0giSX4VfpM8H84Ksy/pG5FDxPKZZkYKQNb0Ss9ug6QBxjqXIJ5Ev1d4kCwXM4i3pf2r1oFUdN0+viBBPcjWC80YydGmlO3g4imNJjs5slAlWFjYwjiOPpxltBneoIYx+a1h2FRp2ascUk3yzZOPg1EyeKgPOgOkcDEh9DXQzWnIED4f5JrNELseg+UwI/4IYhDhERIgH1lAJc136w5DYRk+43SVcKGIPAFWp0EeQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZtXbDKiY; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZtXbDKiY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSjNh3Xjwz30Vb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jun 2025 01:32:20 +1000 (AEST)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-553b9eb2299so2020122e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 08:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750951937; x=1751556737; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m8+Li4ZqAZW0QY7sIIldmBLFf6VQ+4AeP6Iv95ugt8g=;
        b=ZtXbDKiY6IrUkBXTIYsST1TYrzMH+HFyeJkVesRjxmjZv3A/4d9mn+7OzOJsgICE1s
         0D/PnbYT4aA8PvITAml+70aOeXR5+8de3whyn81/yleFWu+l3oJrwMVWPY7KJRR9Ve+T
         Wr0Wv+MtyqK4ceRMOCUYUiPg100h6MeqF0W9foUlq9Qn2xHYHyYUMh4cAavG8zWpGUri
         92UjAFLk6H9Kryy78g/PSkrgCvMvQZoYfiOesMPGG8sZqGJGbsfLEFoFCSG3jF6Vaz1w
         skpR64yL5fNy9W7PtC1DjVoJrDKdbLeXBaNIyCKrgurz/K8vE6dQucsgSO+OPtJzZvcY
         8tkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750951937; x=1751556737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m8+Li4ZqAZW0QY7sIIldmBLFf6VQ+4AeP6Iv95ugt8g=;
        b=IKJ8pI8j4Q5LLGFL3ZI553Q6cBKeRI+dMNdr15M96rcj30jveqlrtbzDrr5WbuB8jX
         uzlHUfQ27vK5D+rlBMGLo/JCJSaeBRQaRa6GqIt+HeqFxReTcwTekfB26DvrE9RDImX9
         YI6dwdlvI2Gafd7JIlzlLm5AtVKoIkC7I+wsLZMe3MnTZu7WrVt4or2fxhgtgus3i1qF
         iW4szq8erTfkxeTmkTVfgvn1ZHsYbmDoaqCERH7Hk5Oo9Z+Vl43alr8k88MgVLWSONj0
         gJZnjzDSjq3XlwKkme9C5NssqdugEzTxtVHAVCyLV6hx72s8a77br3GZ818t6mpwYzGI
         53VQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlq0NCbXwKv1vw4KEGYAWPdkPoJ2ny6pVjaTuxq00q2OzaDe1EZc7zR7X+63yyFNsRVl3OlMtiQisUcUg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw8/6HFTI2W8nwgoyBPuv7gviqL+DKYTDBMvN6/5EwCKCQ+1MRp
	DiJjjOBzpnJpRfUXrRcuxAmXiVnDWh43tCr/jI9QrEjmyd1CBxGgjgoT
X-Gm-Gg: ASbGnctMUp9aqE4kaEDj28Rw1bAG3Y1U++EpaTRr39bTOmS1uJzFKSwMsCvfs+O6ckn
	wP+bpNXZE/Yg4ipRZ/4pZvx8zpQU/rv4v5EW8Q6en33Jsm1/yRr2HGnyQMN35jBJfWmdQcju4Al
	thHRZ6iOJYIOUOEWOiK16P83+gOEVRxcmZ1aVG4FOGiK8vPkqSQ+/cuzjRVs/GgOTHCf1DK+ApB
	j5kkT9BJjBGFw7sHzo3PXWaTAVqQEfi2Pbx8GFoTa0rdPUGEaQkt5DF6I9TTZH39GPr0gHcDmYf
	7rKl9IE3rOPfAyc2ZeU3Rgvfmn3kN+PeDYLfNzPbGq3yZmbA57GB8uSlTL4daGU/41EfNLpmmaa
	iUNXktfrrAFurzW8gRJhhpZ7CKhsooA==
X-Google-Smtp-Source: AGHT+IFV82PjQkEQV8pwkpgH+uEG2XxjLf7tDKt0/XCF6qX83TTzJXquCdeUIk26UtVJ1dwuwllM0A==
X-Received: by 2002:a05:6512:3e0f:b0:553:cab0:3800 with SMTP id 2adb3069b0e04-55502c95046mr1480652e87.14.1750951936982;
        Thu, 26 Jun 2025 08:32:16 -0700 (PDT)
Received: from localhost.localdomain (2.135.54.165.dynamic.telecom.kz. [2.135.54.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2ce1fasm42792e87.174.2025.06.26.08.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 08:32:16 -0700 (PDT)
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
Subject: [PATCH v2 02/11] kasan/arm64: call kasan_init_generic in kasan_init
Date: Thu, 26 Jun 2025 20:31:38 +0500
Message-Id: <20250626153147.145312-3-snovitoll@gmail.com>
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

Call kasan_init_generic() which enables the static flag to mark KASAN
initialized in CONFIG_KASAN_GENERIC mode, otherwise it's an inline stub,
and the flag is enabled in kasan_init_sw_tags() or kasan_init_hw_tags().

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218315
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
 arch/arm64/mm/kasan_init.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
index d541ce45dae..abeb81bf6eb 100644
--- a/arch/arm64/mm/kasan_init.c
+++ b/arch/arm64/mm/kasan_init.c
@@ -399,14 +399,12 @@ void __init kasan_init(void)
 {
 	kasan_init_shadow();
 	kasan_init_depth();
-#if defined(CONFIG_KASAN_GENERIC)
+	kasan_init_generic();
 	/*
 	 * Generic KASAN is now fully initialized.
 	 * Software and Hardware Tag-Based modes still require
 	 * kasan_init_sw_tags() and kasan_init_hw_tags() correspondingly.
 	 */
-	pr_info("KernelAddressSanitizer initialized (generic)\n");
-#endif
 }
 
 #endif /* CONFIG_KASAN_GENERIC || CONFIG_KASAN_SW_TAGS */
-- 
2.34.1


