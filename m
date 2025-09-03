Return-Path: <linuxppc-dev+bounces-11684-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA14B4293B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Sep 2025 20:59:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHBk44FpKz30N8;
	Thu,  4 Sep 2025 04:59:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::631"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756925980;
	cv=none; b=B67uE/ehMy+41dKtQom1FgpR+WUDXWgngsNLuQLnOpiQrtitkyjiyipMDyrqjd6r+ubeuYyl3aOiXm+Te9LHGHHCbXtaYtXujFoUAYiivmuk3CUH3DfDUj9C1Pp4vDwMKkjvw7k6/iANaVAg/Yd//m+ixYlyy8u9QHf6rqmmGFmfNpVP68SIW2eibc6K2PF68GIt4y8/1Hs9s66F1vM0OEUYGgo1kio+UI/3TVF5p4Wwm786UmqaI0lULVNNtIKbBDE8OCa3LSgtlsj5psruxj0wTOLFBEz6UaZzmM0UNc7w8S1ZydnFIfbRupHSsMLevEG/2vjsPcXvko92J9zzQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756925980; c=relaxed/relaxed;
	bh=p96JFKpspRPKBmH2rgBynj/gu4bh0EGooQeUZ0NhcIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o33QyKlsjd0BF10HuQvuXSPPGkoWX1wWcgTANT31YpoEAnz3Mi2309esHwqwiFjCricPxpy1fSjSsNbXID4CuL/xOePX26dhfTxCK3fbBrsGFP4ZtBcSiHz5zmsQCUyq977TgTWE+KZZCMfmns27YGmfXvJJNh9dPwsEoCXxhZAaCu7JoFbbeBCnGsG9WivqUi7mvgBpWvNnCRnhzpgJjULn9RW/OCt+WT+uJN2ZvAJi4iGLUff8ZHBDXVeo6Zl+MXlDYIcxjuBgxmXfsDufCZOM2V76aASIbZbvFSB8RswHptzg+VbOJb6j5oHVSjOA9Azk3T4ifAcXMHjhsFKeOQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VNWk1bCb; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VNWk1bCb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cHBk34rLMz2yrl
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Sep 2025 04:59:39 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-24b1596b1beso2815185ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Sep 2025 11:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756925977; x=1757530777; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p96JFKpspRPKBmH2rgBynj/gu4bh0EGooQeUZ0NhcIU=;
        b=VNWk1bCbZfeArwI2Ro06d1nCWADo2+FdPHDfH2Cy6uuJA+2FdMoEBGBtA3rjan6qXJ
         SXHitE2UZK0axNRimydKBmJBuogasVJ3tocD9v9yyPl7BISFPxz8gEltGGPv032q6TvC
         fmhFZxqzdJrvVlCOeP/P0oP6vuTGMONiqpZcVkZ2nDhtldHpV9QVwKlluoq0aNglqfRj
         Ku/EsPYBQXdn3J0YRjJnW121LeXp6O4ybYGVhYX6GEw2Bf4gO8216DifLuCKUolEXAEa
         TSEH9jeBHB3BjXzFDPVQ8Tk1q0AsuoOMzefiGifxlfW077By2Bc/ySMDPk1i57DQvicF
         AN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756925977; x=1757530777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p96JFKpspRPKBmH2rgBynj/gu4bh0EGooQeUZ0NhcIU=;
        b=R0blr/O8GFB18B73AcpU2AipO4HYhPkH5Fm9Zto1s06nSkCgko9KUpRsDMwpRO5ufk
         LAxDbY+K5XrFgVYWcKVB7lLSidK2JYDttbEDX0TW9f1tUdz6PCfc6HcL1K7I6oJpYVUU
         xA9mFcffG7W5e9MWoE5RTEm4ltWpScZ6R43Z/S6JlMzml9T6VtOq+iZgu4Dj7JKDh0Mr
         KaNxTe1SwCpAnbUNKXX+2TLoP8HudPQQXS3xndvzRHYnPGnbXfmgOJJOc0i9d+OWxN5F
         F0qq32WstWDmF3DohZOWQHpljd00G2OJNyTQC9yEueRcPyzU5S5OFRM6FtHdt76suJdP
         vsyg==
X-Forwarded-Encrypted: i=1; AJvYcCUn3PGehMspLfXJnOocEBhUDsom0KpXIJM4kyVqmAWeDTdskVRugNDT1RW3EXchCMvQZZ6PiPevJyAaFig=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxU9TWKX97IwkeMJIiNdA9DrIVE/GwLZHwwKzM/I6xEggITMtNh
	7OL8kUSOi1IDVXW+6+vAtuelpnImnp66YYDUMyl5nsCs/r3e1i5doaoV
X-Gm-Gg: ASbGncv0iyxlsYkPYNrJZN0pJHmyOUUCHwj5wasPAP8nL7Vimd6cS7Ut2E6jlIKcyv4
	Fc2qiao3roYeqqKq0i9LWe8X/OCAcJdvHk2V556kPH5sIQVKBx+QNKIDdFpLbMLaYgrW/EcyYNL
	54NJ+EL2XvivSdaTzHWADcFfGUMrHE7/ge5lglyLlcE52cRIQsZBhzfuHOv8zbllBfiJTT35j7o
	LYnU2k8dorcyKeKYg8OCZeJ5SuJMKGj8JNEfNMtMDy6h4PEB6OsFIME0qwYPYu0SrlqLRihHxe9
	deAho8EvTQwe6REhEI8roA0uUlzTZNH78X4FK4pb6vWQgGu0/72nmOqZiQ42ZkX8d47wVWXxZfP
	TLo9F143fdZCarZxWpx+0Y1P8cCCiFssbCxOyuCTkBQm126sOE0tp4Mz/jbaS5SuW8XLL18ucxi
	c=
X-Google-Smtp-Source: AGHT+IF6bU8SPLeBKOcF3DV0pz3IKcU2SprGWCJIgsDwHZ4utP76U3dUm2BhH0lDWIsPOTFAl0TAFQ==
X-Received: by 2002:a17:903:2f8f:b0:234:b743:c7a4 with SMTP id d9443c01a7336-24944b19ea3mr233283115ad.38.1756925977585;
        Wed, 03 Sep 2025 11:59:37 -0700 (PDT)
Received: from fedora (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-249065ab343sm169403475ad.126.2025.09.03.11.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 11:59:36 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-block@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org,
	virtualization@lists.linux.dev,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Justin Sanders <justin@coraid.com>,
	Jens Axboe <axboe@kernel.dk>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: [PATCH v3 2/7] aoe: Stop calling page_address() in free_page()
Date: Wed,  3 Sep 2025 11:59:16 -0700
Message-ID: <20250903185921.1785167-3-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250903185921.1785167-1-vishal.moola@gmail.com>
References: <20250903185921.1785167-1-vishal.moola@gmail.com>
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

free_page() should be used when we only have a virtual address. We
should call __free_page() directly on our page instead.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 drivers/block/aoe/aoecmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/aoe/aoecmd.c b/drivers/block/aoe/aoecmd.c
index 6298f8e271e3..a9affb7c264d 100644
--- a/drivers/block/aoe/aoecmd.c
+++ b/drivers/block/aoe/aoecmd.c
@@ -1761,6 +1761,6 @@ aoecmd_exit(void)
 	kfree(kts);
 	kfree(ktiowq);
 
-	free_page((unsigned long) page_address(empty_page));
+	__free_page(empty_page);
 	empty_page = NULL;
 }
-- 
2.51.0


