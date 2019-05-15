Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE701F58C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 15:24:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453wJY5QwlzDqQJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 23:24:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="b4tRdBqZ"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453wDh1pmqzDqQm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 23:21:22 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id d30so776794pgm.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 06:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UuF5JmpoANujb+aVXS9mdWRXSQPbwJ+7x1JTARJZaCI=;
 b=b4tRdBqZOnTV18iCcCZa7NI9wBo8DwPblHdIVe4RYrU0u2KifznkLqFV/iHZ93/I2j
 Nm+VCQWRfhC3NlNqs05EzSO8FETyO3wR8RGFbw040/MwXNM739LLrzWe6gErbtdEHc6l
 wYGGaK6mm0B/Ow8oFu+4Tt/qCuAF8w7Zw7QMPqxQhn21yOpPC/H+kyB9ntng4/E6lFl5
 MdrET+qd6g7B5rX9AlwU61oF41qg35xCdO3NgmxaWSol1vxFlSaIGlTlYFGXqYIcik8G
 K+JBpFvT/VGrD0SLLfiWDahMevjQhfaB8Wml5Pux8zBujGhMAoAbtoS0dLW/63y+l9FF
 kq9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UuF5JmpoANujb+aVXS9mdWRXSQPbwJ+7x1JTARJZaCI=;
 b=mhgKOrTZFU8TH1MID4vzd48o6QI7wmyASBqqy74QMVlfccanFFMAyBdVykRX31wP6S
 OwEvlHmbkziwjq6ZqZZfZeUPfp0rqNmuT40BfVVq8bNFNoJ6RkCX3JqeRBm1J7QlNMtG
 sZQcjp+gWGgrrvuUhVx1YvDgq26aBzktCx3FC7N8fcEckwvod+Ijj+iy1yRYIRBB1EcE
 SlVLRNuk9OEzmduEfJ/yoWBuGbeWK0tNOsl4HxHYLXHZmSeEt+3k4MW3HIVfkkTG5nNO
 MuWYHaUlAyQTXgwryMP/abNPditZKgQhC4xDmOn/E9ViDhIqQ6V8Ihe7iVR228xBWZBM
 B+rg==
X-Gm-Message-State: APjAAAWvLFtFDxVuMm/zRu5gN/IujP0TY0UF6c1Mn/+zh/DVlmrRHKe+
 5zSi5HW8alzrUyz5MZV89eJbyDXI
X-Google-Smtp-Source: APXvYqw37IsZcBf13+bcc6eMW9pqha/YVVnPh5EBfP+6sp+7xg2XlzfvmxEuPyF4yfFGXkhrQEPTEg==
X-Received: by 2002:a63:d949:: with SMTP id e9mr43714694pgj.437.1557926479788; 
 Wed, 15 May 2019 06:21:19 -0700 (PDT)
Received: from bobo.local0.net (115-64-240-98.tpgi.com.au. [115.64.240.98])
 by smtp.gmail.com with ESMTPSA id a19sm2784459pgm.46.2019.05.15.06.21.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 May 2019 06:21:19 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org,
	linux-mm@kvack.org
Subject: [RFC PATCH 2/5] mm: large system hash avoid vmap for non-NUMA
 machines when hashdist
Date: Wed, 15 May 2019 23:19:41 +1000
Message-Id: <20190515131944.12489-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190515131944.12489-1-npiggin@gmail.com>
References: <20190515131944.12489-1-npiggin@gmail.com>
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

hashdist currently always uses vmalloc when hashdist is true. When
there is only 1 online node and size <= MAX_ORDER, vmalloc can be
avoided.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 mm/page_alloc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 1683d54d6405..1312d4db5602 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -7978,7 +7978,8 @@ void *__init alloc_large_system_hash(const char *tablename,
 			else
 				table = memblock_alloc_raw(size,
 							   SMP_CACHE_BYTES);
-		} else if (get_order(size) >= MAX_ORDER || hashdist) {
+		} else if (get_order(size) >= MAX_ORDER ||
+				(hashdist && num_online_nodes() > 1)) {
 			table = __vmalloc(size, gfp_flags, PAGE_KERNEL);
 		} else {
 			/*
-- 
2.20.1

