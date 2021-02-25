Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 160A432494C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 04:13:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmHsy0bk8z3dx1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 14:13:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=l0c6fqX6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::62b;
 helo=mail-pl1-x62b.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=l0c6fqX6; dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmHq03jZ0z3d2k
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 14:10:36 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id d11so2409528plo.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Feb 2021 19:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8I9sfIKEFXdp7hBjfU4bxls9UrgkqgjNWgByH1IIWQw=;
 b=l0c6fqX6kA5C7+uYldMZaZVTO8ngfp/h7bl9GsZEXaDDgbW+WyGIC4aqetqS2uAzz2
 Blb8u5pzj/chtIWFttpI3LT0NvxmcZyTcyn8rISAzHTXK0TojSnIWr5TeKARdqK7anQd
 puRzJDvu5YzFdUjlLscjsOUuTSoWGyHpQCbOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8I9sfIKEFXdp7hBjfU4bxls9UrgkqgjNWgByH1IIWQw=;
 b=YuzqVooWp0zMq46+KGh2cvOVMXlmje0IikAL7QYNg7xnZBRoURObET9dK9FPwpOVkV
 9Go6OnJBl+IeuhX4U+C1O9k3lYaMBMm7pWx2fObAt3ksxK+gBWBmN50ikJ3jZSJpEUWy
 LhMe0Az89vuMTydpoJXI1Yo0bFVKlSx7PPjnRdICl26IXXVRn2+srHNGY7tTmRUfWRr5
 jb4dtOiyjMvrD8heLHwF6+mzDWunbmUsujEpzkHK4pNasjCkRNYoZQURVmwfJJ4Nu1aE
 a3at1GdJvxl6HH3qMXT5eJ2nZsMQPI2YQi9bVklhnJ/6SWpX7E2A6UokuB4FMAi9iibs
 P8TA==
X-Gm-Message-State: AOAM532Eqm3GTocAIcwEHV0an7m43imfVeY0TL18lFNkyBKf6CnqQt6B
 z43c8TU4wtCPThfCAxG6pMrV6w==
X-Google-Smtp-Source: ABdhPJx3aNj1ktLbFdGDDsW6s6HczNHDTWWVyfSBige8AH243SjYmaZ+LCIA0z/qkK6IklK5eWVYkw==
X-Received: by 2002:a17:90a:6383:: with SMTP id
 f3mr1083441pjj.14.1614222634418; 
 Wed, 24 Feb 2021 19:10:34 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-6e65-7e50-8dac-f7ef.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:6e65:7e50:8dac:f7ef])
 by smtp.gmail.com with ESMTPSA id x9sm4080321pjp.3.2021.02.24.19.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 19:10:34 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: llvmlinux@lists.linuxfoundation.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 6/8] powerpc/mm/book3s64/hash: drop pre 2.06 tlbiel for
 clang
Date: Thu, 25 Feb 2021 14:10:04 +1100
Message-Id: <20210225031006.1204774-7-dja@axtens.net>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210225031006.1204774-1-dja@axtens.net>
References: <20210225031006.1204774-1-dja@axtens.net>
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
Cc: Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The llvm integrated assembler does not recognise the ISA 2.05 tlbiel
version. Eventually do this more smartly.

Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 arch/powerpc/mm/book3s64/hash_native.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/powerpc/mm/book3s64/hash_native.c b/arch/powerpc/mm/book3s64/hash_native.c
index 52e170bd95ae..c5937f69a452 100644
--- a/arch/powerpc/mm/book3s64/hash_native.c
+++ b/arch/powerpc/mm/book3s64/hash_native.c
@@ -267,9 +267,14 @@ static inline void __tlbiel(unsigned long vpn, int psize, int apsize, int ssize)
 		va |= ssize << 8;
 		sllp = get_sllp_encoding(apsize);
 		va |= sllp << 5;
+#if 0
 		asm volatile(ASM_FTR_IFSET("tlbiel %0", "tlbiel %0,0", %1)
 			     : : "r" (va), "i" (CPU_FTR_ARCH_206)
 			     : "memory");
+#endif
+		asm volatile("tlbiel %0"
+			     : : "r" (va)
+			     : "memory");
 		break;
 	default:
 		/* We need 14 to 14 + i bits of va */
@@ -286,9 +291,14 @@ static inline void __tlbiel(unsigned long vpn, int psize, int apsize, int ssize)
 		 */
 		va |= (vpn & 0xfe);
 		va |= 1; /* L */
+#if 0
 		asm volatile(ASM_FTR_IFSET("tlbiel %0", "tlbiel %0,1", %1)
 			     : : "r" (va), "i" (CPU_FTR_ARCH_206)
 			     : "memory");
+#endif
+		asm volatile("tlbiel %0"
+			     : : "r" (va)
+			     : "memory");
 		break;
 	}
 	trace_tlbie(0, 1, va, 0, 0, 0, 0);
-- 
2.27.0

