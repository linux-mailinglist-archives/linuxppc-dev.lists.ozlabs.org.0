Return-Path: <linuxppc-dev+bounces-11515-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E76B2B3C7AA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Aug 2025 05:54:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cDLqF2XhTz2yN2;
	Sat, 30 Aug 2025 13:54:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1029"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756526057;
	cv=none; b=XIuFF0Z+rb+WqLSgsi9CWYu8oDqE5mDmo89MnsGh5dHSOrl+0IkRAMFNQ6sZTDauSzWcoaXitYb/Xz+QI0LL57P7npXJx8EUgLSbx9ZCIO3epiGahf8H8LJ7p9SvYkiy6GbPP5HGYhYf8CzdjeSkY2utfdlOOPd6teK+D5UBoaIT/A2+T7hRHHS4I1+ANvhSuCygfJizkt+1w0uy8E9opvPwHQXu1aJTXWs1qTXliTxxV28u663VoTAbGtvlC1232GV79TUz85/aW9vPTdC0LpDG1DPP09obGXtnp9Bd/1wl0WP7qDRIaCFgyF4L1t/M9qTIvaYbF/yS0Q0R1Z/DCA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756526057; c=relaxed/relaxed;
	bh=plSsDdzABT1tznTCZ0rkJIcIYSYV3FYsa1ySWxvW7gE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L7TiQu2NmwlxYZDigmKYsdSfjU/gYltTigvUOoleHwu5BQop6ASYibKwzGVWPq0wOg3dYMYS+YyX8oeXZdq9hYuFDbxZ9NO0TPPsRihIq8+RUBjndf/qpRmMhPdwzd06mGH6dmENm+gIV9bYTU5uAbAyHHpeE0bZzOZM0yPz+QKX3Gp2OOupYCDuyg7VlEIdTjQiYXE6I8MycrBB/qynjyox9dc6k0N25mMKRVWTCtjRuMig5WWjNXysH6xq0mLmsJN4Q6m+5m1dgFq/NDUNnbUuI2jhaxVUMyPuy5U6FAdBjl2DMsHem7Vevk2ZItt9wyQEI4ONOOhytO5I4Nb2+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MXUnVUW+; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MXUnVUW+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cDLqD4KgBz2yyd
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Aug 2025 13:54:16 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-327771edfbbso2802768a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 20:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756526054; x=1757130854; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=plSsDdzABT1tznTCZ0rkJIcIYSYV3FYsa1ySWxvW7gE=;
        b=MXUnVUW+r+cvh1vhqxAe6vrPV4NXoEm/scEkRXN36aifIsT8mjeevwygxosjwv+AMT
         V04rnnv8za9Ow9xobranLGsjRogtQ8suc5nn5NwBGV91miHHyFuJm58CmNZSgeaXKQbC
         4UDTb7dAsa31lCy5626vhmpmYSscspixSLcdii8YVO7ykJBWCBSjhlPuvrf3ntHPXN7C
         nLX9/WKf36zqxdB2fWzUtuxTh8pY3sSdwhmWM3ZxxXkInsIuUI03Il8Ltikeix4MDNLs
         2xo0bc3hZymLnaFKbQDaQcSVedhBBeZEW6GcjGxMcX3VQx75rIzCKlw64en8nOhSATOe
         vc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756526054; x=1757130854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=plSsDdzABT1tznTCZ0rkJIcIYSYV3FYsa1ySWxvW7gE=;
        b=LXvqDzNa0bLAPkU2tzj3l32ggyR7CBCUkrfC1XsP7XPSJxFKhQXavxG3X/PuYzUes6
         xioGuvYtzKTm4jHyLXmGAMfd0flUWgyV3sg1Y7qHHuRjTOq/9skmLcpRvSXB5KgSzOIV
         VQ4Y4MF0yetD6Xe3cpTd7zTWogP1vSuHUlJ+0u3vCoXOjfC2btLnZQQoy649/QX+zsX7
         E883Yim/dy7MKmEiN//YbNyNe3689uV/cc6xuDZ2oJVb9AbJxU07Ema71oqtdRNFJWXP
         +/+FH5v4ioaEICSCqN0lyZGg9C3lcy9PJ6FyKhJIpzSIDunQmcLpySgCLZqljd3EYu7k
         X51g==
X-Gm-Message-State: AOJu0Yxb69P7fOV6Bcv/pTPmRCK7/q0mShz+OZDV9eOFqok9EcHQGDlc
	248GjVjf2xi0dhNp7stW1Ml3cci5zf8bPI01SVKxppn6t2/ZvC8ssARVqfz0PQ==
X-Gm-Gg: ASbGncsZU3dksC6hBt28tFDglNZfWLuHALIOIvAUCM2bprPX1d4yJiIpDb+lgea21IC
	T/++W3LEjOliSoUxrnUcCbD4PCp7a2oEU95wssFmfxb8q1uZ5Kax19lkC1gDDtn+c8LPq5qRD4o
	EE0KYmyrR6mVN78r50z8JHoL+Gx3Oo1APlXCj6F6PWjsyqShr2zl0k2ujebSVWyl0Tvw6G8VZu/
	Yv7ffk1FNaJvTvKeqMLQ1AUeH6V6XXIQWthFvTw1Kh5GZAT8hszhdEE80weVyZ7XHrRQKc65fOk
	9tlxX7pZiw+4NLZDSqzGfEEhJ5upYET98LmngKi9RHkEK11G9p25JDLefqus5VCIA457hZ4QN7U
	VfuZNdWdbtOJWNQk=
X-Google-Smtp-Source: AGHT+IEYZk48XHenX4s8rQf/XPe4K4SVLq22c03oF0PgZR03XOR+z7s7+PcNw1Ejo1XAgBxOL4gSxw==
X-Received: by 2002:a17:90b:1848:b0:327:6de3:24b6 with SMTP id 98e67ed59e1d1-3281541223dmr1465937a91.8.1756526053886;
        Fri, 29 Aug 2025 20:54:13 -0700 (PDT)
Received: from dw-tp ([171.76.86.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327da90ee17sm4279879a91.24.2025.08.29.20.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 20:54:13 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Mackerras <paulus@ozlabs.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Donet Tom <donettom@linux.ibm.com>
Subject: [RFC 3/8] book3s64/hash: Fix phys_addr_t printf format in htab_initialize()
Date: Sat, 30 Aug 2025 09:21:42 +0530
Message-ID: <20a8d7bb22c45eeab5cc1b7e5a78446dc1506777.1756522067.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1756522067.git.ritesh.list@gmail.com>
References: <cover.1756522067.git.ritesh.list@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

We get below errors when we try to enable debug logs in book3s64/hash_utils.c
This patch fixes these errors related to phys_addr_t printf format.

arch/powerpc/mm/book3s64/hash_utils.c: In function ‘htab_initialize’:
arch/powerpc/mm/book3s64/hash_utils.c:1401:21: error: format ‘%lx’ expects argument of type ‘long unsigned int’, but argument 2 has type ‘phys_addr_t’ {aka ‘long long unsigned int’} [-Werror=format=]
 1401 |                 DBG("creating mapping for region: %lx..%lx (prot: %lx)\n",
arch/powerpc/mm/book3s64/hash_utils.c:1401:21: error: format ‘%lx’ expects argument of type ‘long unsigned int’, but argument 3 has type ‘phys_addr_t’ {aka ‘long long unsigned int’} [-Werror=format=]
cc1: all warnings being treated as errors
make[6]: *** [../scripts/Makefile.build:287: arch/powerpc/mm/book3s64/hash_utils.o] Error 1

Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Paul Mackerras <paulus@ozlabs.org>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Donet Tom <donettom@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 1e062056cfb8..495b6da6f5d4 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1394,7 +1394,7 @@ static void __init htab_initialize(void)
 		size = end - base;
 		base = (unsigned long)__va(base);

-		DBG("creating mapping for region: %lx..%lx (prot: %lx)\n",
+		DBG("creating mapping for region: %llx..%llx (prot: %lx)\n",
 		    base, size, prot);

 		if ((base + size) >= H_VMALLOC_START) {
--
2.50.1


