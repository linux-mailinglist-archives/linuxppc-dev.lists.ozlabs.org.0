Return-Path: <linuxppc-dev+bounces-9826-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34403AEA29A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jun 2025 17:32:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSjNy2jX1z30WF;
	Fri, 27 Jun 2025 01:32:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::130"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750951954;
	cv=none; b=CxmOVdCQjBdbEDvFcryKPYuP8cNdlt0B+nKIJO58SpD1len8yyQVspBU+5yeRrydYDFVWH4++yXBAoHw5HFu91QzTKSikxgSds0ShvUpeJZWisjFSdiIAL3So0Q0U4BaFzrKTSq/iqNClAmaKypXPD5BtoROrhxrJk7GmvizelUydl2fm6xW6CNHR9snyHTACeWGOwm86LJgLrLI1CcIP/IMNiWoHmBppAtJLpNwy+MpnqW5izTXV0Lb8x91vB0U8ynIC263gS19sxyHTxqyT0B9IDAKnDi883DkD6wEtnAfgnUV5s8iN9z3v6xFjDP3Zo4tXweIiCAMgPS329sDIg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750951954; c=relaxed/relaxed;
	bh=Nxtugr6OI+iAiBoQ5DVdScoZ4wigsSWWp7UsuEUnh5g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WErchIZJV9D8+dw9Q5YXn87Cuxb4jdOWVYPHAqOrHOr+mLSWrM91NKq0qhXlJ03JOaFQ+R5o19WvZTTFwoonJuDsPKNti+/AyZYp6NKGtdzY6wONysuB5F3MUX8+mlV7din3CdOYVAO8/ydBg7D8EVkG0eFsq87+6jZ1r6h1ejptf6SITSv+Y01eZW5QHAP+owQk689/9ECAWXZZVUfeYyUS71Q5V+6uxkVzvPED0f0IAKDmpdonudvj2jlxAx+qSoQcNFnp7bAdbpx+Kjsqoni5eK7rc6B2yF6m1eI+DY1kxXfgAf/CULVYmk+ORFT8hp0qB2GppjWhPjyaLcj1OQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=M6vaVU09; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=M6vaVU09;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSjNx2ZY0z30WQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jun 2025 01:32:33 +1000 (AEST)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-553644b8f56so1077669e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 08:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750951950; x=1751556750; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nxtugr6OI+iAiBoQ5DVdScoZ4wigsSWWp7UsuEUnh5g=;
        b=M6vaVU095OIRH6PzR+OTu1bapqk/uHOMp8p9cCfyJJBaceIRhTjnYGmbG01wTY19ky
         IIJyuqCSlaKZFJgLNkAK98G6HguYO5d6v49trVDEekOWtR1cYCMAecGL0JJjSP9WK4D8
         EmmRL1Gi0mZ414WxT5iY4Qv9fKUWxzgd+1KTC+MrEmGYiSRNQn1LsJ4AQ7n9aNYr8Weq
         tOBOw1icrRdaXQgYAbWcvKnxtJaoED13uRsfxF+dYB/FLaY7Bi+nyXXUkpu5Q7YlJL0h
         qDgJD6yAv5lScUKilOtFh+2S1k8p7BPJHuNbu7lo6nH7ZNXDsg8y3Y4AH6n1Qt0HJo4r
         iPaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750951950; x=1751556750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nxtugr6OI+iAiBoQ5DVdScoZ4wigsSWWp7UsuEUnh5g=;
        b=S+V6AnOrCXF4PlzlOhgvEroYwxa6hIiodcLzfYuCHehzdRzFuHn3Ef1lZ3Ypg++gjr
         sJzmosYk7oiqtaPNqNqP1r2s5Z1RYQfTkjsfSOkww6CA2jhj58ygAGiodQy8AWDFgrh1
         m9WRRgL5V6L+3Ad4KqU/e1l7yqzukX7GgyVVKS1ivhM7L7UFBVaIGTAnTkxyuIaM0ZP5
         YO1SoRxdi3hVglLJEk6VQy8Yp93umMffbwQDwuoJ/bL0YJlIPLX8UDhS+vI9D3Bp5Wc7
         2zXXmBIfbPJ5L+ojoIYl57pjoPE7v50qFuwOVj/phUzItIbAeCv5wHG/6WWEZXcSDCyW
         NfDg==
X-Forwarded-Encrypted: i=1; AJvYcCW1rPOCi8CiO+0RYPPh8V2N1SEwMtpExK60auwPLfct95nopkKfCenMt73EL0K+bvdLnGm9uujgTOxA4Sk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxUgf1cIwBOZUh3xjMsHFw8WpFejIRwNq57IMoikavDHmg/3Qz/
	Mb50qgDfydpZiV/lbBkBJPJOozuGNEi0D5yGDgIVNWPoAUJgPT5LwWsL
X-Gm-Gg: ASbGncupISlOkXkTnVk3FB3AQI+A0GTCY0E+Osn6KLqkud2NCPUoKBJZ8wF2+SgLNyh
	29zeOvnpb12+uwGSJ45vTptIJCclaz9eoJ8j/lJLIEBRHXGmrX6h1TfomVAYyLUhPpC0mVCVS43
	Kqc9qH1DGvAskslKTUQfZW0XHh4J5a6pADKSM+X278WVixNDQmjYeNhLgor3VnuTeDiEaCuI4oZ
	ZKwMr01QnVJoy5/CQwFaPX4ahUBppYTlp2VD9hXT+r4EdE6M3Ew0cVhq6JzcSzBTMCVkcjbgEZV
	vIxrx+DU8NIvAVfJ4smPCdUILxAy8yXmrIXxOYPD81jm/a+3dhsoa3/5DLzLK8PB5gEKUufjErL
	jURPiDezqIkeOQ4SLgESbTF/JqWwWBQ==
X-Google-Smtp-Source: AGHT+IGGt6yu06Z/Fb2uJjOxPY5fFcWkWfnfjRjUezmHyuS+t/QogNEJZXQVSUvZn1n0IiNOe7m/dw==
X-Received: by 2002:a05:6512:1193:b0:553:ccef:e31f with SMTP id 2adb3069b0e04-5550b4749c2mr141485e87.13.1750951949806;
        Thu, 26 Jun 2025 08:32:29 -0700 (PDT)
Received: from localhost.localdomain (2.135.54.165.dynamic.telecom.kz. [2.135.54.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2ce1fasm42792e87.174.2025.06.26.08.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 08:32:29 -0700 (PDT)
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
Subject: [PATCH v2 04/11] kasan/xtensa: call kasan_init_generic in kasan_init
Date: Thu, 26 Jun 2025 20:31:40 +0500
Message-Id: <20250626153147.145312-5-snovitoll@gmail.com>
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

Note that arch/xtensa still uses "current" instead of "init_task" pointer
in `current->kasan_depth = 0;` to enable error messages. I haven't changed
this because I can't test the change.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218315
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
 arch/xtensa/mm/kasan_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/xtensa/mm/kasan_init.c b/arch/xtensa/mm/kasan_init.c
index f39c4d83173..0524b9ed5e6 100644
--- a/arch/xtensa/mm/kasan_init.c
+++ b/arch/xtensa/mm/kasan_init.c
@@ -94,5 +94,5 @@ void __init kasan_init(void)
 
 	/* At this point kasan is fully initialized. Enable error messages. */
 	current->kasan_depth = 0;
-	pr_info("KernelAddressSanitizer initialized\n");
+	kasan_init_generic();
 }
-- 
2.34.1


