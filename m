Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8269E7BB0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2019 22:46:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4727bJ6YbYzDsGh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 08:46:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::444;
 helo=mail-wr1-x444.google.com; envelope-from=richard.henderson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="ribUHw8K"; 
 dkim-atps=neutral
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4726hP3Gb4zDqhS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 08:06:12 +1100 (AEDT)
Received: by mail-wr1-x444.google.com with SMTP id e11so11392217wrv.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2019 14:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=mU+g+sfz1bIovsmfwMpnLnRDz98DNUSgbeHXg3LWxbU=;
 b=ribUHw8KQSMwF+HWzboOgcGnyDaK3YUsaQY5qHoPDIig1OlIIT+RSRtjqhXe7Dbg9E
 bSBQUcVMSR2hYT8aXJgTZ6f8OGIkctk+xHOQSOwJ6Q5CwvdDqm8e88AiepxRc7ZP1ybt
 fZNDCcdVU5u+XgHEnSecAhSA4O/3UGIAmBBvg8DDG4bGvgXFaAQ8BKz/3WIkMHUfBlmS
 oKK67aICFbH6k1HpTOZAE4EfYQIf0NUv0kei21drYEvGV16iP17AW1GGbOUwYExGH1Sj
 lsicZeW7Xu2uJgnaBUUTw18H4HUdfa/VFa8ufg7ZyBeH4hFKJ43/53r6cTSoTGfZETjQ
 vB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=mU+g+sfz1bIovsmfwMpnLnRDz98DNUSgbeHXg3LWxbU=;
 b=MCuYEPzOwxDvleENmFLyomdrKJAwMqBZYPsT+DqQY08/T6pJNAGJnjIKMyqKUk4Jzz
 6tevfQGCMeyeNig/9c86C8AhNAErELDztcLHVssnhk7ovOUTUIkWkXeRiQgr9quunSD0
 YDlwV5FioiUC6z9pZg/9BneM3+YN1R7Eq+OzHQnmy7ZA71BOOvg3zeTsjwF16KfItDjg
 iM+1160sliEkFYax/P+skOmceIMc6xbhVblXZz5J6kxRxhLeybPF3epbFoLh3Ms6FWFG
 9m/OIjfG0V/UXT0KGLwuAclMrI7f6Luke+Nll64076B+pfs/wP/jwi/4eKNQdDp0iIwD
 8kBQ==
X-Gm-Message-State: APjAAAWmyX+PhEAfUMwl5BWjhUolBZWx+Zqyk8SSOl8cYtyGasUCVb9+
 SC0CJPd3bqBx/V50tBXiFP6pjQ==
X-Google-Smtp-Source: APXvYqwLLcOvu9N5SeRwebeTNTR9kL0tb9M7ihMiJM5pCGfJvj4BNTg8/+5IGhg+G1oQqTj4kcEk6g==
X-Received: by 2002:adf:f192:: with SMTP id h18mr17665670wro.148.1572296769066; 
 Mon, 28 Oct 2019 14:06:09 -0700 (PDT)
Received: from localhost.localdomain (230.106.138.88.rev.sfr.net.
 [88.138.106.230])
 by smtp.gmail.com with ESMTPSA id b196sm927822wmd.24.2019.10.28.14.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 14:06:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
X-Google-Original-From: Richard Henderson <rth@twiddle.net>
To: linux-arch@vger.kernel.org
Subject: [PATCH 6/6] s390x: Mark archrandom.h functions __must_check
Date: Mon, 28 Oct 2019 22:05:59 +0100
Message-Id: <20191028210559.8289-7-rth@twiddle.net>
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
Cc: linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
 x86@kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We cannot use the pointer output without validating the
success of the random read.

Signed-off-by: Richard Henderson <rth@twiddle.net>
---
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
---
 arch/s390/include/asm/archrandom.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/s390/include/asm/archrandom.h b/arch/s390/include/asm/archrandom.h
index c67b82dfa558..f3f1ee0a8c38 100644
--- a/arch/s390/include/asm/archrandom.h
+++ b/arch/s390/include/asm/archrandom.h
@@ -33,17 +33,17 @@ static inline bool arch_has_random_seed(void)
 	return false;
 }
 
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
 	if (static_branch_likely(&s390_arch_random_available)) {
 		return s390_arch_random_generate((u8 *)v, sizeof(*v));
@@ -51,7 +51,7 @@ static inline bool arch_get_random_seed_long(unsigned long *v)
 	return false;
 }
 
-static inline bool arch_get_random_seed_int(unsigned int *v)
+static inline bool __must_check arch_get_random_seed_int(unsigned int *v)
 {
 	if (static_branch_likely(&s390_arch_random_available)) {
 		return s390_arch_random_generate((u8 *)v, sizeof(*v));
-- 
2.17.1

