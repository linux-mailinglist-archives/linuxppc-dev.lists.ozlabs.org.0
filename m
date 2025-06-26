Return-Path: <linuxppc-dev+bounces-9825-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54992AEA297
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jun 2025 17:32:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSjNq5WcYz30VZ;
	Fri, 27 Jun 2025 01:32:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::22f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750951947;
	cv=none; b=dYR9rZs6umhBP/GuDK2ySPc7LqgQNQsBuCwJ1hLhVOYLsTNGHiQrUPG5TXTAyHtO+haghhxjIVZhWMX6g8kqqzAqfMeHrz06wZ3A/LYI7pJx5rf98Q2i/Q2LYneIbbUAoBuHotwMvU7AOsk4lz8Y//plJp8pXxS8FXaxIk8PY7jKucV0GPYn9JvfHZkyN4fXRRVg+X+0K3EwhHEfhUiEE2Sck390hGYO04DirHGBIBGrIVcmmzsKLZpdDiH1maJiNx8o4r/y4k83DtD5FfpHfRjejBASJaxgpaReC2kQZ/8mcMifBTgQZCDEdYbbiMe1G+oXlNcvo493f5rgChL87w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750951947; c=relaxed/relaxed;
	bh=PCoYbCl3wZIeXCSyY3ZNY+HzBteHxI7NOqzCSDqwFag=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=atLLz3/FObBU8ffAElT4Z/kxLOhm/YM/3mNSsfwuRXgiaVK9G0osH6pjEgnZQPHJLHxZfbMwYHRbsG4t9plXhHm4VvFjq77cU6q6CjcFev0TivOYnba/KAYg41DFRinWbFG7qvX8dJK7Q6nG77Znndg3ohnvCmPxTzURY1YZpTBbTcJgo4gYXcAmFlDfMMoGj31YL/ILCYpP2OI1H/NCO98AAUpseVP47nS4RuEXi/aLIDWymGo2jVKP/qrkt+r6/FoHjeQIvXCynSpqn3D4OJCUpLDavssWY+G2871sAKbewotVIfVT4hWPjeHGq77iftnTbGTZnEDFZFLcE84wAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Gfumj8B4; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Gfumj8B4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSjNp4dPWz30T9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jun 2025 01:32:26 +1000 (AEST)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-32b78b5aa39so11778531fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 08:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750951943; x=1751556743; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PCoYbCl3wZIeXCSyY3ZNY+HzBteHxI7NOqzCSDqwFag=;
        b=Gfumj8B42rNPSRZ64oYOYgYcBQRCYI6hAqsJkUcuwDQOAEEPq7Yz058x9DotT3enJU
         E4XodAcYWkaCayfL5zbbnpi4wyUFPuTJmCIrkAVvDcVB2EzRC7v5nWP6PpCN8A6rVBA5
         bp4U6dt9CLtYlgOyuuNJWB2ja+4/QK5OtQ5ms2BNGNc7Xm+UAtEl57HTAhxEkUwMeuMx
         I3ragmGSNEIbvMzpVqfwTAyqETFgO7Z0ckaxsA1Mj+3XEy1GD7U8wg0RUVc6mdLsSBpu
         LeTV9/ttNtPkU6iPHWC4CezDK+2ogAsfUc32ezPCSDvxZpjHASOIUSmkHzPhMIMW2ITE
         t+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750951943; x=1751556743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PCoYbCl3wZIeXCSyY3ZNY+HzBteHxI7NOqzCSDqwFag=;
        b=eXQFI4ldk1swd1Y1jLwf8TJMQOD+XVzcQfkVzudXFGNoVZFbDPcPh8y6lVjnPVwpWC
         EA6oAAm0/NzgUNv20+rDJH7/DFb6Q1+D8DsRwsiFqZA3/S4evdNSa/cOjzceRGSqDjW9
         IHbBv1xkp7PPsUe2/JYdGJNWkqaXmglXtPdOEvnKtM7Y/cbvlB9aaWop1XuZJo54lrgZ
         xCEOYZgjEDS5ck3lO0i87mKJdUt0qW8nJ79nEt9Q3DA3bByN4uV6axGFJwToUWXJjmhc
         zwctZTjWHKrIpkqAFTLegIk+FXzGX1GcrFZM91gxMPs0gSM5+fHoiwf2CNWrRO8vPn+R
         kDYg==
X-Forwarded-Encrypted: i=1; AJvYcCW4FqT/iWRo0Fsy4KDS4/Bwtx+Z/jOmz0FUkBm7gKZ/fUEUZZ0QQvwM79leE21c5RG7RA8a47+V0uBqQTY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywg06LhmZNpz0OsiHtyUIbgRMEVc5P52rN5FubZ3gI5buhXi7ad
	zyxaQ5TlEMowD3TGGO7Tb8E/34U1th8bCcIIA5nZp5wJMbCQOCTihQIC
X-Gm-Gg: ASbGncuAwAJ/fTPxuOykRfF7WDwEpOEk7Zj6xC/lJ5DzjzKzgN8FOWs0DoXlbr74B9n
	9bh7gk+IRQWyFiDLu2hy1meGbhnlS1YYHvYdtLhgFs3vd3ASDjr12lLUsL5PyzsYjCioMUrvSxc
	ZOVx86l85hDO1ygLQ1uCgjlDKCE4Pq/Q2wlVPJLEmsdlgedHpjqyJdw9M2yImplGTcetDncxtrr
	6ymD7gbJ2BuW20BYZ7f6fOYL59atA3Ud+FpY90sFMH7mxYMu13gmsIbTk1oZLUlRupI1UfV3xZx
	O2EPLRHvXItC4KbKHmItpkDSPp5r2DoEKj/DhBK5+j58XI51kF3Xuh9hmN64iAjJVRnKmeUAHVC
	O8M15FfIJrjkUhFOjB8buSJBHeYSo99U6UaNLml6L
X-Google-Smtp-Source: AGHT+IEkjyG404mf0WVWC0akoOQBzKpFWvtutC6can+yvjxVSyNvAZo7Oo5uRf5TEFNgUYRmuuUuuA==
X-Received: by 2002:a05:6512:3da2:b0:553:26a7:70ec with SMTP id 2adb3069b0e04-5550b79db9cmr1980e87.0.1750951943188;
        Thu, 26 Jun 2025 08:32:23 -0700 (PDT)
Received: from localhost.localdomain (2.135.54.165.dynamic.telecom.kz. [2.135.54.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2ce1fasm42792e87.174.2025.06.26.08.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 08:32:22 -0700 (PDT)
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
Subject: [PATCH v2 03/11] kasan/arm: call kasan_init_generic in kasan_init
Date: Thu, 26 Jun 2025 20:31:39 +0500
Message-Id: <20250626153147.145312-4-snovitoll@gmail.com>
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
initialized in CONFIG_KASAN_GENERIC mode, otherwise it's an inline stub.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218315
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
 arch/arm/mm/kasan_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mm/kasan_init.c b/arch/arm/mm/kasan_init.c
index 111d4f70313..c6625e808bf 100644
--- a/arch/arm/mm/kasan_init.c
+++ b/arch/arm/mm/kasan_init.c
@@ -300,6 +300,6 @@ void __init kasan_init(void)
 	local_flush_tlb_all();
 
 	memset(kasan_early_shadow_page, 0, PAGE_SIZE);
-	pr_info("Kernel address sanitizer initialized\n");
 	init_task.kasan_depth = 0;
+	kasan_init_generic();
 }
-- 
2.34.1


