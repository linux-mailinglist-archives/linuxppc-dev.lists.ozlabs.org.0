Return-Path: <linuxppc-dev+bounces-9753-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E23A8AE855F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 15:59:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bS3N02Pvvz30T9;
	Wed, 25 Jun 2025 23:59:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::22c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750845193;
	cv=none; b=JOq8o08wGq/ItyDOPDS2amrRs5qEq+dqJVLavDdDcM+FiSDYwuLCos4Vo7K+FeM7QVuiHL1YMnJQGk7tPlSJEKzJvQESL7oEa0bj+P4c6uaGRSJNxfmSLUJpbG7Pexf4BgPUFrp3uch2EKUoHeEVMwLt9YdFO7PI58SkxwgAPyQteIdGAIkFBr91WGH67kvt7CLJKIOZfphlydy9Vpbny9UYZAJS3NGGY0MaRO6ZHaTSgbG6fibYNsrwAViUFqcbMQAyJFKSQuhzsH/zDmYtc44HVPYitvUGJ0Z9TP/JrUHiaF2d/DauuEIqeolX2bRhq+hKe/NcC9B3QrmMEDJcXA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750845193; c=relaxed/relaxed;
	bh=GQiI3pji6r3skZCyeT+2q6FDZmdcyPERVGy1ENHzh48=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hIQe5I64dr/olxOe4sm32RGZOnL9nEUVzwbe1iHbP0jGvVuaXHGlBXmQH9EczzXKhWGFgdAJNOAHNkgQplwdThV4a8QDw2fFWwyDE7Bi8Z6Qe5UFZVScMjHJ3loDOyJt857a9kY3g0LJ7dUpePfrYSoD2NM2Aw8UQst71FOuxX/9Mkrty4T6vQOZWXpt3EUSgHl7RGS89jr4ET18hrube9nXcfmCAsGswyEe4ac2hENfe5e1aSOfprxJ9MA8v5dB7ntbeb4WO+nfCQxMc7D7hmuJKlX3K9P3qG8pAdO/mM2g2G3qtgKszCPxI23eMoXPJA0bwrGz2nDUmMX5Z8PLQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AlpKhUkz; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AlpKhUkz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRxvr5CD6z2yKq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 19:53:12 +1000 (AEST)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-32addf54a00so50566401fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 02:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750845190; x=1751449990; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GQiI3pji6r3skZCyeT+2q6FDZmdcyPERVGy1ENHzh48=;
        b=AlpKhUkz5tPe0YPW5mwPCjsHdvFDKZMZD7mxrQPgDBdfexJD3w7rEeCB1q99Zv3GJq
         U05a4ndJQ7CU29OA7/LDkuKv36zvBSaDv65MaJMfVISOR/qs/Lq1L5gDQ5/h9+1Pez5C
         1Jv+Jd6OsTawW5Uhh/48IXUpeVaHrJKVsN/r3CAvasY2seF0Z/Mv4fh36a8OlXkdbOHH
         lLBsBcX/fyqc2G5/H6mEqFnliqK9arG1NjwvVuMpedRLnGlQQ1zA1v87FwczaVaOzxlJ
         Cmn6MfkgQG+UjAzSIiD7D1WYHjOqJHNHqmHnfXvzRCpz0WHe8XxDTkvhU1dWT6CYphQu
         mHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750845190; x=1751449990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GQiI3pji6r3skZCyeT+2q6FDZmdcyPERVGy1ENHzh48=;
        b=NiXTc7PIOuxQBFk8kewePcDEY4nNKH9QDKZqLeZI/2fLlINWTzDtCV3zU3YOOYbiGY
         5JOhEX0XdP+Dd2OqYuN7osoBnmPBwQTzumDOjKBm0br3gnmas3in9X6qqV3WTsuG5iPJ
         2IM7qQGPXqZ6TqyJsIiDa7+Zkch63o0vmZSHnjcI/zKEQIg+smE6Z1rpDFXdbENQ/u1N
         EHfAuTOh6XnKPFzJiFs3lPF62G01g81A9ryCyEQm/tixz5ETzqxQp50YsCG1VrBqU5T1
         n+9PgVPdfnhdtTgu16SEtiZvmYKK6CDycN8TPpmjJWT2PbytBYUr/X2WO2DSMeHmtvHY
         CCVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcnCSy6RdBgAhPQyCFsOkLcJIUZdOTopEdwAHNEtCPq8srI0zunYq1CMLsGmiFuLjfh50GagBMLfBCRQc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxOApqzoE3PBDXDH8e+BMuqbXabRo+zdQR+F0gv0J2Xm2LFqqvt
	lm8drU52W6xjppvQ++LDwNr0mlV00NGMvwsVfzuZNL6asVR5qtSyg79t
X-Gm-Gg: ASbGnctJXDaXEJp+jM5W4o7eCPwalGN6foXPzZ5GN44Ugyzc+o7NuaLyfyakja93pKM
	WEeVu/zrYq/o7+RmTfuH0lYpg+kJ5hhsIAYphHeAqsjGD65EyHjonL2dycZq05vZvRTuGueDLR1
	9ZhNE/eMIDUYFUe06t+P1/JZL32WGLx5zGVtPpG5MM4HQBZkuethbejVUye9nICskzbJ4bnxgh9
	xWgvozvR3VZJlo6TGZJLUHQDhoPPa+LaixmxGHZaNfswsUdZDjI43lfwC267ScIm9JKp2yZFLPf
	ucDoZCDQrOIJzxg+f0WJl8pQyYsLGVUNNYFiO89GMLPXZI+Yr2LxCs9TH9a1zrpkiaJQObxpZQk
	yZx/1bZ66DjJiEzGnYnT+pNrcxT3DuPd1aYOkGcRL
X-Google-Smtp-Source: AGHT+IEfK1Xq7ZnXyT0Os2Uk+Tl7A2yRnzkJG2IvrwiF+G9b2Q8GisEMs1F3MxkK27tqhocl20BnLg==
X-Received: by 2002:a2e:a54d:0:b0:32a:7270:5c29 with SMTP id 38308e7fff4ca-32cc6421a2bmr9358961fa.2.1750845189565;
        Wed, 25 Jun 2025 02:53:09 -0700 (PDT)
Received: from localhost.localdomain (2.135.54.165.dynamic.telecom.kz. [2.135.54.165])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b980a36c0sm19311851fa.62.2025.06.25.02.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:53:09 -0700 (PDT)
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
Subject: [PATCH 4/9] kasan/xtensa: call kasan_init_generic in kasan_init
Date: Wed, 25 Jun 2025 14:52:19 +0500
Message-Id: <20250625095224.118679-5-snovitoll@gmail.com>
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


