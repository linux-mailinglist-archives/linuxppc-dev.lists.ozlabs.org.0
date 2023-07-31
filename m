Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6921769F7F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jul 2023 19:29:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=bucd5YCH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RF4x744sJz3dwM
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 03:29:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=bucd5YCH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2d; helo=mail-yb1-xb2d.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RF4NS153Nz3bcL
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 03:04:40 +1000 (AEST)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-d075a831636so5107689276.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jul 2023 10:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690823078; x=1691427878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ES9RfFz84BcV9KH4Nk3AfkjPOEvVVRdPbPMSiTejLcw=;
        b=bucd5YCHLhUvx7sCV87tgBpS/yvMqV1hEBgLcIdtkbm6tehUvQ4b8S8cGlWi7/sHjP
         BwMI7RjEZDCFEoZqNSu1BeMgh4cbrdk5jNpPQbDjyiWAygQ6GF4RuUGGOqf6kg0VdfDp
         NpGCzdPUkKHCC4r7KLVhXjv8laMIW1vLz9Hl1FxyK0cd8KUbq0iEAg4q7XF5QTVPGxVT
         zofHi8CwcgETUVRV13Pib0COy9kOuveisGg57GrFHsyYwDdtVuj+zN7pcxA+niXzYe26
         MUnkSw5QHmNGRsesWl9frKtr+MQAPLnxo4yz7glnwyiVSVRMIHwbjCv+Zju9S3AQsrM+
         fRtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690823078; x=1691427878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ES9RfFz84BcV9KH4Nk3AfkjPOEvVVRdPbPMSiTejLcw=;
        b=PIvpim5l33eCOGdhscHCwbFeMlA42JPEyh5zGX8QJCHv+rFbhb1h/YKbNQp+Yvs9bV
         aFII4yov0cBhEsZgzzexxnGz3RfAZKKts3DRbLezKS0zL1buZOg71U0AlOWyOzMnu6CO
         UMv2fpde+HEwizx7Gr0sJQ0idY0BB0GY/+PQVLXMEG4SLOBjvhr41FvMpQgAbpOVEMN3
         VKRR8ojEdK1LqRxyoZksJ2hSryW79SGgNSXNYW44lwZjd/lG2xSiHHTDnuUmVorIOCll
         z4dBPbt1QhotZtYE4tAMw+OTSAUR+39gNkzTX48tZO7mTTF85LXmLwT/UHZ9Titlkx1u
         NWPg==
X-Gm-Message-State: ABy/qLaLMOjvHX5zO1PxvR0mUULyKelLpY3PNrzks1fHEvLqwR5uUuhN
	kreUGJuSTGjgbUu1b7DUOko=
X-Google-Smtp-Source: APBJJlH4kzdzBzRUIaE/50pCy+wwrgbHVj7GhIP0EpKNGW/07mJrSi1SmuvJmvqLlmEJ9bXKX+N7ow==
X-Received: by 2002:a25:2496:0:b0:d0d:f5f3:d2bf with SMTP id k144-20020a252496000000b00d0df5f3d2bfmr9661709ybk.48.1690823077914;
        Mon, 31 Jul 2023 10:04:37 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id x31-20020a25ac9f000000b00c832ad2e2eesm2511833ybi.60.2023.07.31.10.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 10:04:37 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH mm-unstable v8 29/31] sparc: Convert pgtable_pte_page_{ctor, dtor}() to ptdesc equivalents
Date: Mon, 31 Jul 2023 10:03:30 -0700
Message-Id: <20230731170332.69404-30-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230731170332.69404-1-vishal.moola@gmail.com>
References: <20230731170332.69404-1-vishal.moola@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Hugh Dickins <hughd@google.com>, Mike Rapoport <rppt@kernel.org>, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Part of the conversions to replace pgtable pte constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/sparc/mm/srmmu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
index 13f027afc875..8393faa3e596 100644
--- a/arch/sparc/mm/srmmu.c
+++ b/arch/sparc/mm/srmmu.c
@@ -355,7 +355,8 @@ pgtable_t pte_alloc_one(struct mm_struct *mm)
 		return NULL;
 	page = pfn_to_page(__nocache_pa((unsigned long)ptep) >> PAGE_SHIFT);
 	spin_lock(&mm->page_table_lock);
-	if (page_ref_inc_return(page) == 2 && !pgtable_pte_page_ctor(page)) {
+	if (page_ref_inc_return(page) == 2 &&
+			!pagetable_pte_ctor(page_ptdesc(page))) {
 		page_ref_dec(page);
 		ptep = NULL;
 	}
@@ -371,7 +372,7 @@ void pte_free(struct mm_struct *mm, pgtable_t ptep)
 	page = pfn_to_page(__nocache_pa((unsigned long)ptep) >> PAGE_SHIFT);
 	spin_lock(&mm->page_table_lock);
 	if (page_ref_dec_return(page) == 1)
-		pgtable_pte_page_dtor(page);
+		pagetable_pte_dtor(page_ptdesc(page));
 	spin_unlock(&mm->page_table_lock);
 
 	srmmu_free_nocache(ptep, SRMMU_PTE_TABLE_SIZE);
-- 
2.40.1

