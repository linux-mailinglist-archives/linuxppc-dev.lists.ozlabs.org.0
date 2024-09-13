Return-Path: <linuxppc-dev+bounces-1356-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBF4978BA0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Sep 2024 01:04:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X58y31FJkz3013;
	Sat, 14 Sep 2024 09:04:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b4a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726263239;
	cv=none; b=EPE+5jM5lFcbRT72e0bm1+zfrUjc/z8LwpvSZbpjJ9VXY+XnVtonffrRzALjxqq6mm0yb+RrcUikkOyAyStSAwfWZih8vc06/+YTOTvf+Ck9VvOlxmGW0BI5Z69ZQTulVrAQqQdE5RQRrxldoO+ZCrfZixMjn4z+VSBFvKk6mqk55LedFonSVEfNvaAu1XHVqb13DpFcJsMqx5JwQAOdqyIjJ8zaoYCMRhPocxDgY5z68kb+0ukrKPrsu/EegRyAxg1j1Dj88Rfz8fl1r6XjwNyJBTkxpfSqdmUf5wo85L60CO//Dk44WTmK33eH6d9iNcvK6IW7q35ct6yEN8TX6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726263239; c=relaxed/relaxed;
	bh=C2T8h7PkrQu/P499dIgiz7AXqfHfFO+K5APloBO//pM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=QJqoydDwgfnwiHDcurqJ4KFP2Sxd0IiiSxCjCZhzEVnXW3/JGb3ie0CAiYxQu2pW8Dz20p3ujlUkSU8Nt9vdgkDfIJUzI2gzOtY79PwBmBeMXDP7WQSd+ERm3IEAR1z/ZxKI02sLdMxfUb0q0I79Ftb0OWEIaNCPRQnNnAQjs0oMgteTh5/VBCkVOsN+fGgp0/wEwrUkcAV50g+JhGsBUnxHWfGX0VlJCQcswyBBXB8UA1iX70nnUynw2+76ngD9Cx/MV9v0b0aigivI/V4aiXsiNSgMi51eGQfjnMU49UwenBTpKSeSYut1fste4t2NWViB7x5WyLc/MeF0+51U0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=dfRw8Cm2; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3wa_kzgskdpasdeskjqeafsyggydw.ugedafmphhu-vwndaklk.grdstk.gjy@flex--almasrymina.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=dfRw8Cm2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--almasrymina.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3wa_kzgskdpasdeskjqeafsyggydw.ugedafmphhu-vwndaklk.grdstk.gjy@flex--almasrymina.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X56xy2rwfz2yYK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2024 07:33:57 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e178e745c49so3683313276.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2024 14:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726263234; x=1726868034; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C2T8h7PkrQu/P499dIgiz7AXqfHfFO+K5APloBO//pM=;
        b=dfRw8Cm2VSEmLbmrMn+f80yywwEtbTUjwwyATyMZs3CR+xRjzyvjAnyDLCsVnlfcgy
         Z3yyP2fVLJc+VDINFyyuZL7yy1TXYSTGwKBM/cU4hKXZQ6iwwvVSal6GRquT02ItgH0Q
         LynI60L5C+eKPuHuwtmwcDYeCZO8zfY1J+oDrRwZyvkbeaDediVWQ4szC9iXOk9TKSMe
         C1PIHxinaZBbm8hOJVUYd5kHP6GlbfmkcRt7f+2wD7mTWAjVImyQuTe1FOMIWFAKMsqu
         Utvz3zmypiQMxJpBwcAmtL3X/ZfIJTMURdyFZFlmqFzOMLg5NEKO0tSufcrkV8DBbZH1
         VwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726263234; x=1726868034;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C2T8h7PkrQu/P499dIgiz7AXqfHfFO+K5APloBO//pM=;
        b=XRS5V+WIQQQv9btjJQOq2foEfWD9mu8dUYq68IF3gCixz7lpIwC0hXgEOWUd0nG1m1
         Iht8oI0dG6tZ+HuDHvl4sFp3GKKUImtex50BylJvCqlqRth7B47WY1GqLLaMvRLozQvw
         lMXpQrU/5WrJzd4QeOIIY4p5f5hFC9swWzr08h8V/arXQOnVonhycIv4gOa+5c26G52A
         /p4nWX+EuGldKH9wNyIfCyaogo4Hk3s5RUAGNOliWkegsEXfOfBFWGpbu4d4Wp22ilgE
         CmDrVEiszkeH6KSEzAvTofXDBFECDwp7r5Dha7lGsdA9LNeV++FuUb7G+KYR1jHjpG8X
         pxgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpBR0JpIAtxOEpugQnwLTno0k7xA5pLmIu2+lU1Bz8vckvOmOsyPbBJ5kzZ94G/tUTEZ+1qWZQGLvyOyY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyNY2NiHRFVF0xhbJnKrjZv9DKygNS8CAJQf6TNSM6/XUxOlKTM
	q/O++A/puqjWZfJmmu8lN+3kDWIhZQFmA/2QCYNk7PWlyG1v4edE7Lvehx6UYU36MKrm4gi/YgW
	LJtuXKPB4eRKbjJkFib22gQ==
X-Google-Smtp-Source: AGHT+IGKRzJx5PjSFO3E8tqWdgVC95OAYqJ2OCpdJ9chaj4/FshFhL9QqOypm1YXq6OH+fxO5D7luhUe9GMEMnCStg==
X-Received: from almasrymina.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:4bc5])
 (user=almasrymina job=sendgmr) by 2002:a25:cec3:0:b0:e1a:44fa:f09 with SMTP
 id 3f1490d57ef6-e1d9db95493mr10461276.2.1726263233997; Fri, 13 Sep 2024
 14:33:53 -0700 (PDT)
Date: Fri, 13 Sep 2024 21:33:51 +0000
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.46.0.662.g92d0881bb0-goog
Message-ID: <20240913213351.3537411-1-almasrymina@google.com>
Subject: [PATCH net-next v2] page_pool: fix build on powerpc with GCC 14
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"

Building net-next with powerpc with GCC 14 compiler results in this
build error:

/home/sfr/next/tmp/ccuSzwiR.s: Assembler messages:
/home/sfr/next/tmp/ccuSzwiR.s:2579: Error: operand out of domain (39 is
not a multiple of 4)
make[5]: *** [/home/sfr/next/next/scripts/Makefile.build:229:
net/core/page_pool.o] Error 1

Root caused in this thread:
https://lore.kernel.org/netdev/913e2fbd-d318-4c9b-aed2-4d333a1d5cf0@cs-soprasteria.com/

We try to access offset 40 in the pointer returned by this function:

static inline unsigned long _compound_head(const struct page *page)
{
        unsigned long head = READ_ONCE(page->compound_head);

        if (unlikely(head & 1))
                return head - 1;
        return (unsigned long)page_fixed_fake_head(page);
}

The GCC 14 (but not 11) compiler optimizes this by doing:

ld page + 39

Rather than:

ld (page - 1) + 40

And causing an unaligned load. Get around this by issuing a READ_ONCE as
we convert the page to netmem.  That disables the compiler optimizing the
load in this way.

Cc: Simon Horman <horms@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: David Miller <davem@davemloft.net>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Cc: Matthew Wilcox <willy@infradead.org>

Suggested-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Mina Almasry <almasrymina@google.com>

---

v2: https://lore.kernel.org/netdev/20240913192036.3289003-1-almasrymina@google.com/

- Work around this issue as we convert the page to netmem, instead of
  a generic change that affects compound_head().
---
 net/core/page_pool.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index a813d30d2135..74ea491d0ab2 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -859,12 +859,25 @@ void page_pool_put_page_bulk(struct page_pool *pool, void **data,
 {
 	int i, bulk_len = 0;
 	bool allow_direct;
+	netmem_ref netmem;
+	struct page *page;
 	bool in_softirq;
 
 	allow_direct = page_pool_napi_local(pool);
 
 	for (i = 0; i < count; i++) {
-		netmem_ref netmem = page_to_netmem(virt_to_head_page(data[i]));
+		page = virt_to_head_page(data[i]);
+
+		/* GCC 14 powerpc compiler will optimize reads into the
+		 * resulting netmem_ref into unaligned reads as it sees address
+		 * arithmetic in _compound_head() call that the page has come
+		 * from.
+		 *
+		 * The READ_ONCE here gets around that by breaking the
+		 * optimization chain between the address arithmetic and later
+		 * indexing.
+		 */
+		netmem = page_to_netmem(READ_ONCE(page));
 
 		/* It is not the last user for the page frag case */
 		if (!page_pool_is_last_ref(netmem))
-- 
2.46.0.662.g92d0881bb0-goog


