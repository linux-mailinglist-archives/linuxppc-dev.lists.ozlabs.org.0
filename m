Return-Path: <linuxppc-dev+bounces-1353-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFC1978B92
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Sep 2024 00:59:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X58rr41qrz2xfP;
	Sat, 14 Sep 2024 08:59:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1149"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726255256;
	cv=none; b=E9AK4fUSOgz3QXS16MXwxwmIG2Yrvhyp1QecgUhydgPn2kzif6XDbzrUf1i8Hg2BHM5fWlrXIlCYJuZrensweiQcmaUX5kswq7LK44A4RwGSeDx6s5BGc7WGSixQV+c75Jdrs7ZklnLsFDZKfk38RcDkACgH/XxNuPN8FztwoiEQGatNqVF+6UQgePgakkob7Ij+qNJ97ZHbtm1ZqTa45ZSU0q/wVnZiVxfTgZPXEZejM547v7vX1ST5JH10ug3cL+UfqUc5a7kamY0QoTegIOF0NfXsOJ7hO2gbu8g/a4vW4g7qwjDEi7QBJZD69dTVJmRO4aJqTzDqZBin6U+mxw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726255256; c=relaxed/relaxed;
	bh=XyVwmJzFbJ/oT6rl4j6NoyNuLyObf2RLXKIfBjhIh5k=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=NcHMVnlRcrF+fyxTBlNbVYWNoPjOQZKS/St2lDxzqTG+l/IBtOsckcAcX3H+fEV3ejLhWI17iHe6PlVN96GrzaDU5Dnj53czN4GWZaZXHyyhTxUDcFp8CXJKVDlhbEDJ+8S9VywYmonEqXLVx817uTbwDb0Xcdggjz5u8uHxqrcLbsZJ0Wu4IBXeXvat4L9uRG9hyEioIgJN6VtmF86B5HW83hDxWVbMGgqB/gFzL4LJEkepUkrOl2wv3g1k+8LkWHAIUqQJCjytxLtxavSnMKd38Qqs2M/rdTHJkyJDR2ExYSgwbHaPl2rxtipl1bZjGsIu0WmqGVeqn7sRQzHabA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=tU50woYu; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3kjdkzgskdiefqrfxw3rnsflttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--almasrymina.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=tU50woYu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--almasrymina.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3kjdkzgskdiefqrfxw3rnsflttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--almasrymina.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X540S0Wxqz2yl1
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2024 05:20:54 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6d9e31e66eeso34154677b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2024 12:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726255249; x=1726860049; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XyVwmJzFbJ/oT6rl4j6NoyNuLyObf2RLXKIfBjhIh5k=;
        b=tU50woYuhaGRzCdw7azef9vBEMxs+QI/m0MwmVcWEhA7s/v9I3oBhMO5py6xoNejYD
         8fy5WCNuo7uXdoL4b5UyazzJe6BCQjK9ehfkc/vkkq8cPT9Pnxkn2Wm0YrHGedIb5DO2
         M6qMpqaDxJ7wreqRIznYjKZg+Uz69stn3MPj4lB+ss54dsK0xBGxmas+cBMWYx1A0cqP
         KWuOkAFUx2YbDlGHBM7wZZMPKukkHayZI905qkHbVxg+6b++9uSmqYSxVITW3671gcDc
         XmjF/k7SUSCqBp6xmBIHyLtuwjH1Gr08uLJxrtMF7F1S/XeuPey8o/7XP6RxV5oLw4Vu
         QoKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726255249; x=1726860049;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XyVwmJzFbJ/oT6rl4j6NoyNuLyObf2RLXKIfBjhIh5k=;
        b=VZ0GAjyhqv3Uq0bdSFrwUMGIFWakNvi1RaaNwnvomM1VXevuCloV5XgP2YXGE5UH2f
         bmI++p543e8Y9eF07kcBVxT+2xkog49/lvRExSJiuZmvAC3sx3iJ6qlbPK378Rj5x6tx
         KSz+4Alpa9FbVubacmM5AZJMn85q+GkxkSNiRt+caMfs9hjRXlpHfPW4ditNNzzqXStS
         YBwFImFahjIGg8cTDJTOTV9Bn29Kl/O4iEGgC6k/ErF6/gEST/EVAQD2oQ7FznmXP5Ar
         GK5P5vUJun9MYuUbIzRK2BfFLKgeGSECd/wLfkKW1FUhtjVXfHx3tKjAi5qNSD2GQDXk
         8Aeg==
X-Forwarded-Encrypted: i=1; AJvYcCV53gWeFWqhnue78QUjhSqw+EIHBwuw8F0G5xosQ7Lujauo5FRHsUMDPa5U1COBQt1jp5VwMsqvCZ9Vy7I=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YztKJzktIie2/JGoxLgLg9q1OApZt5yvL01VLI77wkohoGKAgLJ
	ag90l5gix77cwjU01L5R4DYbobSMY25TKlIgaW72w78Bll0Fw1CFEVSfcZxUxL/G9LbA2yXoDZg
	52VS9fBFBufEJBHhtXg6r1Q==
X-Google-Smtp-Source: AGHT+IFDF32N4mQwATZNCLz25QLEOkKmOIRWCMujqX0ZzKlzsSNpONZ53k1X0A26W9ZzFOaKPw2IjNpPtPK3sfm+wg==
X-Received: from almasrymina.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:4bc5])
 (user=almasrymina job=sendgmr) by 2002:a05:690c:7487:b0:6d5:df94:b7f2 with
 SMTP id 00721157ae682-6dbcc579a34mr1597487b3.5.1726255248865; Fri, 13 Sep
 2024 12:20:48 -0700 (PDT)
Date: Fri, 13 Sep 2024 19:20:36 +0000
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
Message-ID: <20240913192036.3289003-1-almasrymina@google.com>
Subject: [PATCH net-next v1] mm: fix build on powerpc with GCC 14
From: Mina Almasry <almasrymina@google.com>
To: netdev@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: Mina Almasry <almasrymina@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Simon Horman <horms@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Jakub Kicinski <kuba@kernel.org>, David Miller <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
	LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
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

Causing an unaligned read error. Fix this by bitwise operand instead of
an arthimetic operation to clear the pointer, which probably
communicates the intention of the code a bit better anyway.

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

Suggested-by: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
Signed-off-by: Mina Almasry <almasrymina@google.com>

---
 include/linux/page-flags.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 5769fe6e4950..ea4005d2d1a9 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -239,8 +239,8 @@ static inline unsigned long _compound_head(const struct page *page)
 {
 	unsigned long head = READ_ONCE(page->compound_head);
 
-	if (unlikely(head & 1))
-		return head - 1;
+	if (unlikely(head & 1UL))
+		return head & ~1UL;
 	return (unsigned long)page_fixed_fake_head(page);
 }
 
-- 
2.46.0.662.g92d0881bb0-goog


