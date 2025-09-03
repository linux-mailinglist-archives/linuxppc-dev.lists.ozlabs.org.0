Return-Path: <linuxppc-dev+bounces-11683-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 33782B42935
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Sep 2025 20:59:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHBk40JvHz2yw7;
	Thu,  4 Sep 2025 04:59:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756925979;
	cv=none; b=cUxKNRnzyTqU4P73ry39l3D/7KEv5Zl547j+Ubl9zgkHv9ffukgLZKiI3ILKhlrC9kGHh7cYJzdhHV171IfR5VzaCatdBcDluBjDKBWE1pSUtgXuCX8upHfPJ3YJrJcFvThT5Ewfsx+Vp+jr46KXnmwMzBr0RFDRHGm9FzIhzK1CXqjM63ynw5PacTovDltxXeapH/CJrHz/X9WkANYwrily+6yRfvrda0bsRxTTI3rMFHBtN9Qb8X/VvttqehL7QZZiSQWKOrD7Dy0lvuqy+GwWI/9u2t8IxpjppUyr7ugsP3WbPLmuhWTS3ifMeXh5AgjoPh6tWcV8+3HE1TCgVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756925979; c=relaxed/relaxed;
	bh=Cg3vWTOesz5aa5s3lECf1v2j8z5ZoWgWQOpdmwDONGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kz78ybmGbu4nK+Pr531+OJZyBMH7ciTvCYCHgvfj58aa1cZACC8E6xuzeRb/Zx15+kz7oUYfBQI3/d8431fvd2i6CdJEv7Y7dP0ZzvbROng7A/hVgrQgjgMS+YdswiGgiPDneVBHFYIsyJ16Fa3eQGHgoQ2mM+ckWm35L+iD/H0qyGJsRrF+oUQhEUJcTMBzR/uBTAggBv3XtzfekflxSKP5HQvT4xt8gNbLYX5zlH/9jXRS+YBASpiv4kDaqzaAAgk8toWF/hQTZK8rWDCZNMQsCKKI+Z6ZydZLFo1m9f9ijFF1YXFWyEa/zZ5oul203gGqLze01gqO417lNmlmRQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Vbltkudk; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Vbltkudk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cHBk227pGz2xpn
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Sep 2025 04:59:37 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-24622df0d95so2156325ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Sep 2025 11:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756925976; x=1757530776; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cg3vWTOesz5aa5s3lECf1v2j8z5ZoWgWQOpdmwDONGE=;
        b=VbltkudkwEt971bAeYiEl1WHuNTkjmzau6KQqSccF2DrbRMab2EuXQtIefKJUemH8N
         52H71/Dcqq7qDor/2G7fwSYC9+MRkfE2Gvjq5OIqcezMgSJPZVd7/ALBtgfprkWy9MPs
         oXBKzVPzmDqG2gIwzsAf1upAhygDPJdzCEIOxT9vnD0lKaMfFEgCPL47P5xrpmpX8C0W
         ZhA8V5nl/RfZxZnOhjdWh+ZqYIHQPERD3vVLb0POxtOjeDXeaTYNWomwupfFhhkCFtVT
         ZB3mdAICSV43kwdTBc9Fss+f9VOiYkFbNIbCdWIqGiD7uLQQfUEsiFQXT8WyK9NM5yPa
         no0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756925976; x=1757530776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cg3vWTOesz5aa5s3lECf1v2j8z5ZoWgWQOpdmwDONGE=;
        b=iGANIVlXgLbK3Vo/2SFKK73pBbJm1yNhzfHsO9nNdOo3n3X8utDtMpYuwgcxP5YUb5
         DpC7nJFkKvC2d3/ltCKZ8TxSurQwb5LY4nXNhyz6DgfPZduLIRdZa+Iuvt4yAoADFtt0
         bG7AzY2e9rADY64cACOMW2IPeNxlXAGtWzwHn2ie+Cy8GHXHbOOo2YxBwDuTXQW/OrYS
         vC3OslGagP8U/Y0FZM5tW/RnovPJRxwjt3tZzMKj5SrDxm3Oywdxs2w1GO52lmhfodTb
         +ZdNBrrxq7oLiGTtMJ17IPx+J302u6lHIHmVdNHIk7ulOs5TUztha89x17YPEus0wY4+
         5ZzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLv+XVhxUGfSJdFGJEYoeRxiD8WTAxWbM+kcNz1uoXLR4KdFS4q/TdcDfdDZWSaxfJlgT4XX5z3l835zk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy4nDLRiw7qnYGWYTcWuYRXTCtcB1cj6IfB4ytJ2mzyQ6ngqjVX
	u+BfOU/MNqnXCVE5wwcbDLpnMSJ/yCIWCYfYnYCogAGNKrmS/KTtUV7o
X-Gm-Gg: ASbGncsN4pQmCFW+jR/uiTFCmvDw5C/n//yF6am+wNXIQS6ju7KPrG/hXmA00/1GbF9
	dUfmcFk4MptunzAMNL/atK+4b7gW56r/HkRTDkdNNLqYH99Z0MoJhDKOLIvcXK7vinu1UzHAFtr
	vHBwldTmgzb67ACGSfYAO/Jx3vrBaPP803av454FMBmqAiSQz6U32DC30C/oDXynmV2n2TvxMtj
	0chRxJoL9mr22A1g7OHxVFd/lIx4/LZvuPo+0hhkxgfbAm/o+4wZhBPsovrRnnqhzfV22wKt7Vq
	GWAuJN9XlfP4uDWuyumLdkG8ApzUGnvqGLHvbGKcVbvuSv4UQ3kF8EvfMR7+3huW3J5fg6pMzJH
	zbakT0f4mUrUI6CWcD0blhRDGuRZ4A+YPQkDp+DtcZhmTQVsOjLaYlQ==
X-Google-Smtp-Source: AGHT+IEDGbdRM9mEhaV+2ag53MUmou+Up6hgUY2vpYZIptsrNmf4dFU9V5zvfqRBlRBpWDsd4n9KQA==
X-Received: by 2002:a17:902:d552:b0:248:fbc1:daf6 with SMTP id d9443c01a7336-24944ad55a3mr207897875ad.43.1756925975667;
        Wed, 03 Sep 2025 11:59:35 -0700 (PDT)
Received: from fedora (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-249065ab343sm169403475ad.126.2025.09.03.11.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 11:59:35 -0700 (PDT)
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
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	SeongJae Park <sj@kernel.org>
Subject: [PATCH v3 1/7] mm/page_alloc: Add kernel-docs for free_pages()
Date: Wed,  3 Sep 2025 11:59:15 -0700
Message-ID: <20250903185921.1785167-2-vishal.moola@gmail.com>
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

Add kernel-docs to free_pages(). This will help callers understand when
to use it instead of __free_pages().

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Acked-by: SeongJae Park <sj@kernel.org>
---
 mm/page_alloc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index c2a254d877f8..0277b86b62ac 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -5269,6 +5269,15 @@ void free_pages_nolock(struct page *page, unsigned int order)
 	___free_pages(page, order, FPI_TRYLOCK);
 }
 
+/**
+ * free_pages - Free pages allocated with __get_free_pages().
+ * @addr: The virtual address tied to a page returned from __get_free_pages().
+ * @order: The order of the allocation.
+ *
+ * This function behaves the same as __free_pages(). Use this function
+ * to free pages when you only have a valid virtual address. If you have
+ * the page, call __free_pages() instead.
+ */
 void free_pages(unsigned long addr, unsigned int order)
 {
 	if (addr != 0) {
-- 
2.51.0


