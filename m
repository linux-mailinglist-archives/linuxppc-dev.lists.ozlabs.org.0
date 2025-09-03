Return-Path: <linuxppc-dev+bounces-11686-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8836EB42941
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Sep 2025 21:00:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cHBk90llWz30WD;
	Thu,  4 Sep 2025 04:59:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::432"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756925985;
	cv=none; b=EcLHEKtdDH9pFgQdLnReRKjMY5uFHdCanABd4IbXCf1pGvtcaI+q9xiKcs/RssvnIVkMnI5lAlaVxD5qUySN7NuCIHvlUxieSVWGKla5nYl+bozCe9akMtAIIbysKE+E8jUMqIe2RdFEpApnhczu7LMnzWaTtnGgo1F6rcJz/a9lAwVMrjXoSEJ8A8tmKeVsxpcfAs3mgrCfeHcIHpc5YGoOKNjjwNrch7foC1dOaQX2bc3sqr9JEFmSfi5nxrOuKrTPkqeC8Lfc9Bu6ana/Y1XTI1GMrYbeWbpBGVnBfR0vYZXP9S2sRakJUbnSDdxMsuVtvsamvg2uACtHDxnAUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756925985; c=relaxed/relaxed;
	bh=tE4h8lAMatl8zOgx47ZsHYZprqFSGIay3bVnFsp5zpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aK1WJmB8B4BFQSK7UdlJpnyTdgMz14nCxizzaY6iFUcwkAPkDhTL5G8BoPk19WPR+D5Zttzyh7ryi/eex/EMHidAtFalGa60ZwN1ZZNLIgjJriv2AUJ3cKdUnpqNV89jRgndY9L9+42JPgxEr7ixgYUCIDARWyJ3ktSnVYko+E2vsbqyhVgg1ubpCnpEBm4OhSgs56NC4afdH4SlTOZPVLnylueA4EnEX8qg62qDgcJu+5MmZVyecnzIPGa9Iv8O0mwdgjqhpsfx+PHGJaP1R4as2N/xiMirPqsxqvvbYdVs176XuxMkBfX76rdmqpA7uaTp2aF6hm3Ui+ee/EiUSw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=D/9A+QZm; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=D/9A+QZm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cHBk75gx5z2yrl
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Sep 2025 04:59:43 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-77250e45d36so241277b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Sep 2025 11:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756925981; x=1757530781; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tE4h8lAMatl8zOgx47ZsHYZprqFSGIay3bVnFsp5zpE=;
        b=D/9A+QZm6rnPr7el+8pNlVouQqLcprEK2pmxtUSGloP3EWJ/FSmDkK+CUHQie9uVHc
         ajqhvqjcXLBHnhB8iftGotzkvV8f4/E+U6tuLE70rfOdVFWbNZHhwBGSavBWLw0+xdOE
         dGXdS67JZenKMNgsp/2EwODPwPEBFAnry/9urOAXAd47g3CBWtABjJ95KBO10mV2f622
         ChEEQqdqQDE0nfRCbtUYRb6gAITTQ7scfSGjLN4meQIAo5eAqlWESH0NVx1ffB+Ho26n
         txdpACboluhoKjnwPwPjVXrbgbs3dHVax+SY6uo/JIJiqUtgN3gK8DFpEUTz0EjIKumJ
         Jgng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756925981; x=1757530781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tE4h8lAMatl8zOgx47ZsHYZprqFSGIay3bVnFsp5zpE=;
        b=DYoQ5vSr5fv09BgZenoof/eOqzMkMB1E4KjX5Wv2E8NpRdq0Yp4PoBG+Hiuf3027aP
         Xx6ZNZhp1i+dRZgwNzuIzfcl35RtufUnnoAT3IhfQpv9zAJWbuvKAC4tZL6KpMGwZ0zH
         nodmMNlWlb0zf5YWcc+X3/EQgYZpLgxt1Lbz3z7QacJExJ3VuqN5+iiwBgS33E0GR3ka
         9zbhLYJC7/souts0hUy5p0ZnPhbznaz7brPm6JD7Uff84C1JXZEWmEJUKyBnD59H3Igy
         iz76ElV7Z/aILwkd2EluW+W/pS5mgDgDIk97Zq6GdBKVrDltVmOnikl3jOpMPilvPuXQ
         3uqw==
X-Forwarded-Encrypted: i=1; AJvYcCUxNS+qqrHwvcueAErpMWQuBhLFCeN+wEWHDuMrjMoRTPm8VG0O0z+JLIEeP3ZpiEdAsdXnite1G+saSEU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwJ8+GelWoI5IeBN3FuCXj3GcDJqKeRIoly+z0KRilW9OvMGNew
	VZ3BUbAme81XJXwzu8miBzj/Rlc6LoO1xc+FQFZOrjX49NPFGAjeO6/e
X-Gm-Gg: ASbGncsOla+iX9vbFRlnVd8LFT/cqbxh7xTV40K4iKoumpZVOiBVwTUE6iomXpLuXtz
	qR64TxnuFiheBuZdYqxpWu0VB5MxdVly00tRjk8oxme51SL89gKd67srIhp2auQ704aeXtwDWqg
	B98NVXbJRhNG5TNMgjhbrLya+Chzp0CTnyi1J3hAQfyXeh6jgyhNT86ARVXif4vh+8b3nyE22NB
	GltL/KIcwP+2nPsJAD9qxnStWppTlBY9ZGkxvqhvy4Ku9sGKxKHMPWV1I2bkDqkgKbMzKHkCVF2
	Pzvq8UolELKIHRYoQn9vYCVWTVJyxEb/0hqN78qsQdeNaqFNeSKPCVPa7VhGC+9wQWS4xhqxp1a
	GWAdnZIcwyEJF3H78/zPSyChydDlmtETN/nZYo9Tm5jB4k3O2obM3VjWsu+nKvW+M
X-Google-Smtp-Source: AGHT+IFOzZVS9DP4L6Y226muKjeIB1JH5DNA05hxxzbj7ORa/S2amssbHzjMdMYqRSy3xMpxXA++JA==
X-Received: by 2002:a17:902:cecc:b0:24a:aeb6:f1c8 with SMTP id d9443c01a7336-24aaeb6f63bmr166407785ad.43.1756925981346;
        Wed, 03 Sep 2025 11:59:41 -0700 (PDT)
Received: from fedora (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-249065ab343sm169403475ad.126.2025.09.03.11.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 11:59:40 -0700 (PDT)
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
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v3 4/7] riscv: Stop calling page_address() in free_pages()
Date: Wed,  3 Sep 2025 11:59:18 -0700
Message-ID: <20250903185921.1785167-5-vishal.moola@gmail.com>
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
---
 arch/riscv/mm/init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 15683ae13fa5..1056c11d3251 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1624,7 +1624,7 @@ static void __meminit free_pud_table(pud_t *pud_start, p4d_t *p4d)
 	if (PageReserved(page))
 		free_reserved_page(page);
 	else
-		free_pages((unsigned long)page_address(page), 0);
+		__free_pages(page, 0);
 	p4d_clear(p4d);
 }
 
@@ -1646,7 +1646,7 @@ static void __meminit free_vmemmap_storage(struct page *page, size_t size,
 		return;
 	}
 
-	free_pages((unsigned long)page_address(page), order);
+	__free_pages(page, order);
 }
 
 static void __meminit remove_pte_mapping(pte_t *pte_base, unsigned long addr, unsigned long end,
-- 
2.51.0


