Return-Path: <linuxppc-dev+bounces-11688-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 414D9B42946
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Sep 2025 21:00:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHBkC59WWz3bcP;
	Thu,  4 Sep 2025 04:59:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756925987;
	cv=none; b=kfAKUnsYT1y6YGVAt9/JgkC7Z78gs88IyfUyX5yScDF6FyJHiO/bgX757srKxc65N4WLTmNBZNJPSKnx11HYmAZZ/3GUuoW1LnPQfzqOnoECzDGMvKMZIUZlkBNL27WRwIzvey+1/63eM863GTUE95n1watm96dfo3OAzQMRyzzOibanBBSk3vNRcKpA7hNjcIEU/THCkOLqE/HJX2UUhGDhwQdF/LyHyqBwtLbMgDgfyjU/LR+qV8Q7w+p6zijfh8kJHvP8GmTa6WcmJhluNzAAtIJDpc1jnPriim3cMCIzIy9qQ7dmCRWErOk5ziD8+jDxv6wVwUMKjzKpQpT33A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756925987; c=relaxed/relaxed;
	bh=FA6weTM8vdilC/EIGooLzDUuRuJzTtRM53Ib1Pd9QnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XNeRfFLTBpmjzOO9zgRkTmOQtIyAkS0RHR/f3iNxGKDUx4z3g+YchytreLZcjo5MLNhIXeTAOBQQUduT/wDy8lYUvCZQ8UQ/SrV96gBUooSxqIN/zmy7eeiv0KTk0PSzQBohOrYcYpTUqc/WELb2qdW1RLy6/RfBuQPV+a95TBigQmI07Go6TvkzZcbxCAhE1NnAdVm0PMgBtnsY655n8vOXPs4Wr2EHoGlNAjDLtoKrl1qDPli8Mb6tPRmMRB2yaMmZTmiGMhG5FDxTJSWBrLjj51jiwTD0Z6Y+k6fjPyQQVumc0I0vPnYsm/r1StCxN1S5zMgsbuamYRq89EEJ1Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IuBnOGjp; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IuBnOGjp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cHBkC0F0Wz30WF
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Sep 2025 04:59:46 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-24456ce0b96so2501805ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Sep 2025 11:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756925985; x=1757530785; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FA6weTM8vdilC/EIGooLzDUuRuJzTtRM53Ib1Pd9QnA=;
        b=IuBnOGjpmKvmb60m4ML+NfyiW+Ss3XRsAN2DUS/O9knsqBFG4W0O7k7Yy282m/f9eh
         Z1G+8sziD+iR6PlyJ4anwa6Sowft7OzfJ4PSqjF48m5u0YPYtqcp1EyODmEW0iBiuwc7
         1Mf3H+eK2Yc1A6OPm96Ol0zMhG7WDACO7HHwuSUqmzX9zQU2mttG1OdTvtELxy8xF4WK
         zJllPWKVTbt8D5IWEcPKcUvuH4x2XCRbMbDeNV+GJzKMHn21ajU6pmhY4iJtfdnYCi/0
         Na8W94I5sCENygL3jFptln/qStFcwsDI2mRQ41ZGYpvlDnatN3GjBPzRjuaQAkfJhYd3
         QRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756925985; x=1757530785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FA6weTM8vdilC/EIGooLzDUuRuJzTtRM53Ib1Pd9QnA=;
        b=vLWal4FkHMsbTOtBB4IWVtZesj0OCFFuqXjDBQ2BwkKIZzXnJDY9QfO+62uJ7X68tK
         zq6kJUoFS1076WIpuZIU4zHnbrMcBmsj0akqdb6z5eASAvZSUJC2aU8VZJw0d8kmh8if
         PUY4cLn1J8QryAcMsTAMCtbVPs1xqfEckTfQSGjvSjyEqoevlraG30ybthT7M00N69cR
         7xm8/S5aZEw1TRyEkmvy1LJNnIyQ35s8NrvkNNEuQ/9P2CqTgNrI43NCk7uYjCK9FzpH
         SJ4TgC52PimZihbFCTT6JDd1BwnsEczsec+n1QIpVtx3o6nY4CK3mrKFM5BUMfXb2Bu/
         Rh6A==
X-Forwarded-Encrypted: i=1; AJvYcCUNQ+MSc7bvYvI2sF7sfOx+iYqkFMbJupV1kIwCJ0oaUhfxvlRUjuElBX9fbG9Nk31qtsd+VycTP/97xcc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxmuAv8BwuMnOhJg+T//72LPfTUuUfm+uGZW7RzQo01Vc7aymT0
	+V44Zt84sB3kSrW6teoEbTsG38msbfizJK1Ccb6SvvYOGoLtEcvxczMN
X-Gm-Gg: ASbGncv5gG/+OZHzCIoarqkBLbTWoLG+O4vyL3tVLfQuzo+Tw2aCF/gvHXz1BnadSEQ
	Af4kjLvDW2hi32NhR3Z2E0REVBMF+qXWKmzwjDzWqfN69Q+ibzIvRe0D92sLNJGXhzEurRQoRWK
	ho9QeRlLxQoZ1Qf1zF8jCozksBNRWk3arOel5HlRZMIxI4NMcr4mTQIy6MleZ3IFnkz4iFqbNQk
	PkvhQlOtPs7Q162rv5+vwJr2kMZ5Ae6vwUXngDz/GmZJNsIGTvsymHSF5lgwFkt06XSaXWRNE1d
	hWLeqwit1E1Kw+377IKXa79wcaWPpCBRnDpluL2NV/Pax62CBqzLjAAFapZviuIjT/QXYk/U/uI
	/WKGjcrv4nCGzneezZ6Q6K29XXAGQY8fvKwlCfLzyzI/yv8nZ/KfYf21ADVWxpaHz
X-Google-Smtp-Source: AGHT+IFoYEL3/2HJDWoKxsFsnkPmdjG5vBre6hTTnok3nMNP8kBMsMcFaEho42lHd4bWFQ52X19GJA==
X-Received: by 2002:a17:902:d489:b0:240:5bf7:97ac with SMTP id d9443c01a7336-2493ef50b32mr219143675ad.16.1756925984962;
        Wed, 03 Sep 2025 11:59:44 -0700 (PDT)
Received: from fedora (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-249065ab343sm169403475ad.126.2025.09.03.11.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 11:59:44 -0700 (PDT)
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
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v3 6/7] arm64: Stop calling page_address() in free_pages()
Date: Wed,  3 Sep 2025 11:59:20 -0700
Message-ID: <20250903185921.1785167-7-vishal.moola@gmail.com>
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

free_pages() should be used when we only have a virtual address. We
should call __free_pages() directly on our page instead.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
---
 arch/arm64/mm/mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 34e5d78af076..e14a75d0dbd3 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -843,7 +843,7 @@ static void free_hotplug_page_range(struct page *page, size_t size,
 		vmem_altmap_free(altmap, size >> PAGE_SHIFT);
 	} else {
 		WARN_ON(PageReserved(page));
-		free_pages((unsigned long)page_address(page), get_order(size));
+		__free_pages(page, get_order(size));
 	}
 }
 
-- 
2.51.0


