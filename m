Return-Path: <linuxppc-dev+bounces-9829-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD253AEA2A4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jun 2025 17:33:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSjPK6MTcz3bby;
	Fri, 27 Jun 2025 01:32:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::132"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750951973;
	cv=none; b=aODK4QMhV75FdfmbCeS4gyJsEHsFefEwZNybCuporBpAyNVOD5FdsW2ZJgYzzol1llO0Si1zlZ0SszwCG9QcU1Jc/hgFUTirFE4nlBDxsdO7H9XTBFP1xbB4XeZoMicJWWMWXsvBF5azbiQtV2e0bSGTm9QvsbWuLOqpa/LMDPA0XT2KE9I16BVp5t3fsI2vfOCk/h9Z1JxuvK8Q94MxDDZrhuELfxAgVKK+9F2w4h6FJsTnCIib41EFvaV/9TKidq0r8Eb7Ftng3+6650wjjiyrrf9VnsrJsjgRqa7pnmtFQUEQrW2bCMiZmAXia0w/74QlVRuvI1AsRWf8FvOrgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750951973; c=relaxed/relaxed;
	bh=iNdRW1IbQwaJLK3IU9ZGilulsvtFwP6FJhql802bOZE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DUZicWLIwalUnignjabmHXHjRpV9bTn+CMUpCEDH2ce0IqsBML3EW5fvk0npJ4psYOXCM+gR2WfWqa1uTdwPWIoO/zVT+uhUgnpteJxi58WWJqbYjs/aaAjSyzBUj/6s5D+j5EtWvCaaNKO46/zRuo+g7k53MgqUeWQrd0DrjdZoGS9HOSTe+l8wGlf/vQesztXDLlnA/v44PBdd1Wk13T8QEvmeUXvtwBu0cpoEyKluYmuEimyRiTPfECgAL9/7l8kA9gODpaSAZtjmrCQX338vJmhPTiP3mQNYRbcG4GYQojQtcqm+b6RDEG9vYXmbER/KOTMkuC5q2Wj7Ba7xLA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KzvsEBWd; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KzvsEBWd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSjPJ6KfDz3bNt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jun 2025 01:32:52 +1000 (AEST)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-553b544e7b4so1182828e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 08:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750951970; x=1751556770; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iNdRW1IbQwaJLK3IU9ZGilulsvtFwP6FJhql802bOZE=;
        b=KzvsEBWdSzyIGPwTEaghSnq8GrGQ9E5Ygnmv2oBaxB/JqXQWg5t0T1CFpNbeWAviCe
         sDUggi3bXiHAJSoH2/ywUUBoOoOIXKW4j+Kis8XvOUrIPB6q6yJtNvEY7EeuKT5sfiSp
         yIzUWOJB1U+5sRgXa8Et+oL/h8+KtBZVgI4FBNqS+3exzGC6GcWkMqbJHu6bjxXA4tq+
         3v9/QLFw2dvf4IFGFsIvdXh2Uu+qxGH4H2acd4tQIfYKf4D9aSGG51kfSMrXG+YWh+/k
         BDVaXrjO75w8AOFWD/MQQaxeHcVPKa9G1XTYhNIe4m8scTuWqCKy2dPsYlOEPXckYBiy
         H2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750951970; x=1751556770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iNdRW1IbQwaJLK3IU9ZGilulsvtFwP6FJhql802bOZE=;
        b=HVbUEIkx7hyQ21vHtA+X+n1wGuHALZ3LxIu2IitMMMgiKbmkgOzQU90Ag8jzwyQcgW
         CJYK1ohWc2jnii2RXBefvHqiOcli9WyxZqbHy2YUsftxctS6VZf84plYhLxvmrzZmZMu
         cdsBXSXzS+RECSyktXgddrDQZTndi20A+9GLnCdaDjG4KxHmONlgxkLJnYzNwUGJ7W99
         t5h4tGqoiG1u54VPRszLlkeKofsN/PXz9vTLAc9JO5Sb5W7aogHWggUSXylijIZE5RW2
         kyhwT9Tc69yk12Z6wCixSZqxRO6gC2zX4nszWVUNM/2i0kBCore0iubnxzwt1Jn+lRzB
         HH3g==
X-Forwarded-Encrypted: i=1; AJvYcCUnIDzijGtaUFhUQaF56oAiHwC8QJI5a99X7VlD+JcUrA4kQeS3SYBH/D5Ty3qVbW8ApZgMBUXGpZSV5Yc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzof7vSFdZCbdrtk6V+A8zWJyNcdTLVlkoeHFXjNw/vQURlNQEE
	F6N4MAV4FY+1P19GcvdLa5Y8ybWMjKMbVtPR+V+2ddMwQXi2nvvdDvZG
X-Gm-Gg: ASbGnct1BXmlCLahgKztaB8cWztmkH0t3m2jBAhl/astx5yfJEdviSZKpqnu3QWlMra
	NWFlaSgybKmzvEIexmTiMufBPlM0VyzAf64V4Wq+EOTFyo/SYQSHTfRd0K/Qnp6UiHgUBOuhSBr
	f2cxBKsZZa25CRa7nKffFBrj7CjPIlO3KkQD4vEy380+Rnq2b9ZVldTcbTUDpVEN7BP/f1E7iVh
	CZ//L85fSPMCJVCOv3PRLb8JTGLjCuqC1We0VKkGgAqZ48khRtwZayotrWTS9il+zfmOgilNa5g
	FDzqFUpB9cwf0qDSD4GU3CPUWpfO7i57Mpo/8Or0BMFj6hr7tkQxWkdod71/bl+ijwC3DAXUbbq
	alqxtlUlqW0SnjgAFnB/phZix2m/oAg==
X-Google-Smtp-Source: AGHT+IEJ8rUJC6ORRfCQpyeVpgt13wcImWaXJ02l+Sh7w1+4iNgFiJrQa6DpXH1RNUwTGuIGr0B3/g==
X-Received: by 2002:a05:6512:3d8d:b0:553:d637:1e96 with SMTP id 2adb3069b0e04-554fdd1d556mr3088387e87.31.1750951969599;
        Thu, 26 Jun 2025 08:32:49 -0700 (PDT)
Received: from localhost.localdomain (2.135.54.165.dynamic.telecom.kz. [2.135.54.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2ce1fasm42792e87.174.2025.06.26.08.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 08:32:49 -0700 (PDT)
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
Subject: [PATCH v2 07/11] kasan/x86: call kasan_init_generic in kasan_init
Date: Thu, 26 Jun 2025 20:31:43 +0500
Message-Id: <20250626153147.145312-8-snovitoll@gmail.com>
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
 arch/x86/mm/kasan_init_64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/mm/kasan_init_64.c b/arch/x86/mm/kasan_init_64.c
index 0539efd0d21..998b6010d6d 100644
--- a/arch/x86/mm/kasan_init_64.c
+++ b/arch/x86/mm/kasan_init_64.c
@@ -451,5 +451,5 @@ void __init kasan_init(void)
 	__flush_tlb_all();
 
 	init_task.kasan_depth = 0;
-	pr_info("KernelAddressSanitizer initialized\n");
+	kasan_init_generic();
 }
-- 
2.34.1


