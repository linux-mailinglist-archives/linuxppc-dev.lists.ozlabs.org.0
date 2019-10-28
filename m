Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E3BE7B78
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2019 22:38:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4727Q66XNxzDsJQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 08:38:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::341;
 helo=mail-wm1-x341.google.com; envelope-from=richard.henderson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="sr3/upyf"; 
 dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4726hM2kNQzDqXV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 08:06:11 +1100 (AEDT)
Received: by mail-wm1-x341.google.com with SMTP id w9so357640wmm.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2019 14:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Trmz1oMdXkgQduJ6dSMyWBdvnJGLiBd9x/YQsqmt/z4=;
 b=sr3/upyfRhBPqhCuVvZlquM3tMXK+FLoz2Y2nWEL97AxtydZpmz7kH//aqFGKiF4Uj
 T2vIJpuxpjgsJR3rIQpNvFQVY5soBLF7Rzf3kczte3zotj8zq3w2XVhRZTCaDR7CqU7r
 RBUwhO+4i3EY/QsMdN4kaoQeRTj+v8bmrvmbWptIdITT6sdQlhfl3EEo7901M1AVyGBF
 BzpN7dQq3QUNjSisrKVonu11+AOT7oLI7vEVJZTKkyM/rLfUXe7RO2M52K6BA/L+sGVl
 aqo/xtW2v0EDkxghzjz9ty/HLo5VwHQQyNkUAqMZydgPyJwt+m557X5M9tHGkKY6jlxL
 JIBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Trmz1oMdXkgQduJ6dSMyWBdvnJGLiBd9x/YQsqmt/z4=;
 b=PkmbQfBDb1KT6HAs8uPXH2ZK/PzphSoR2ya3OKuzsr6mJJ/vjOLorONe8No8VI4dDP
 w/WoG8lDPyyINpsH8J7fFrEMzFuYRw++YC3iCKmJYlwoJ3o5AGzUfTLHtHRMZDzZI8h8
 bKpPAFmfwEyFXDezeG1PO75dL5NXXF7xHiqrdH5w0BO7CnD599ttyHSGrWnQIgXDBY0s
 4TuKHMj9Lsjps3NknTAMR1uVurpo1tzbAgCXeVe0uW7kjrgkT6cz/1qQyFt4akWqOwHG
 IILPQG8KlsnKVo6LG+7QKE4lQLlGyzjYCIIbt1lj+NL+SnrdQ8B/RFAgtNg1f2ew6wGH
 b6BQ==
X-Gm-Message-State: APjAAAUAYCoHTucIyzgtisLUvijTI5jqfgIuOu/BvjMmjP8IOgUORf1e
 Ct1gPjs8cI1yDkzBg90D/BbD2Q==
X-Google-Smtp-Source: APXvYqzrjUNW6FASV5OYKYITB32BLwiqX3gvbSlyQ2rHCnIhZsijRUh3wkyp6SvrHbUKPhK9PwFpvQ==
X-Received: by 2002:a1c:c90f:: with SMTP id f15mr1074821wmb.125.1572296767937; 
 Mon, 28 Oct 2019 14:06:07 -0700 (PDT)
Received: from localhost.localdomain (230.106.138.88.rev.sfr.net.
 [88.138.106.230])
 by smtp.gmail.com with ESMTPSA id b196sm927822wmd.24.2019.10.28.14.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 14:06:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
X-Google-Original-From: Richard Henderson <rth@twiddle.net>
To: linux-arch@vger.kernel.org
Subject: [PATCH 5/6] powerpc: Mark archrandom.h functions __must_check
Date: Mon, 28 Oct 2019 22:05:58 +0100
Message-Id: <20191028210559.8289-6-rth@twiddle.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191028210559.8289-1-rth@twiddle.net>
References: <20191028210559.8289-1-rth@twiddle.net>
X-Mailman-Approved-At: Tue, 29 Oct 2019 08:33:29 +1100
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
Cc: linux-s390@vger.kernel.org, x86@kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We cannot use the pointer output without validating the
success of the random read.

Signed-off-by: Richard Henderson <rth@twiddle.net>
---
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/archrandom.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/archrandom.h b/arch/powerpc/include/asm/archrandom.h
index f8a887c8b7f8..ee214b153a71 100644
--- a/arch/powerpc/include/asm/archrandom.h
+++ b/arch/powerpc/include/asm/archrandom.h
@@ -6,17 +6,17 @@
 
 #include <asm/machdep.h>
 
-static inline bool arch_get_random_long(unsigned long *v)
+static inline bool __must_check arch_get_random_long(unsigned long *v)
 {
 	return false;
 }
 
-static inline bool arch_get_random_int(unsigned int *v)
+static inline bool __must_check arch_get_random_int(unsigned int *v)
 {
 	return false;
 }
 
-static inline bool arch_get_random_seed_long(unsigned long *v)
+static inline bool __must_check arch_get_random_seed_long(unsigned long *v)
 {
 	if (ppc_md.get_random_seed)
 		return ppc_md.get_random_seed(v);
@@ -24,7 +24,7 @@ static inline bool arch_get_random_seed_long(unsigned long *v)
 	return false;
 }
 
-static inline bool arch_get_random_seed_int(unsigned int *v)
+static inline bool __must_check arch_get_random_seed_int(unsigned int *v)
 {
 	unsigned long val;
 	bool rc;
-- 
2.17.1

