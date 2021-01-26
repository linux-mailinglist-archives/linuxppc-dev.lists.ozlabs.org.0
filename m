Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA883033EB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 06:10:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DPvtl6znlzDqDV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 16:10:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Kh7bj2IR; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DPvMS3lH7zDqnn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jan 2021 15:46:28 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id u4so1500955pjn.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jan 2021 20:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hrndBY8R68kIi1pHIRutw3ucH/2Px5UWTBnGPJp9HrY=;
 b=Kh7bj2IR06EDd1qGZ2t3ulwctmkhxiZs/U4o/vDOkXNuGmRG3EiJDvHyiw26B1KE/Z
 noBts4EDsXI7gbOV9ihyk6VX5ck9GK6f3W3T+PkS4vyUxs/Izt2qYf4wrsTriSkNDYwG
 8K64qbx5re/qJBgvVDx6ImIm0xTaeBPkbVaexUyy4H8+lhfZpXxpTjpmv0ChdfpA8/Io
 NHmwmR26KBOHb/8slnYFAfQDKthfgoKBFsrBMSh+pFZkalrdy1KqFxovgB07EJpTs1F9
 fV674H7DUCRmTRlID/NC6dsv8Uz5aa9E0xd99LlPyoF7PQxZswj7finw26pOve/Kewcd
 KSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hrndBY8R68kIi1pHIRutw3ucH/2Px5UWTBnGPJp9HrY=;
 b=twgWYR9v9ewCTWiCbC1GHOodQDW9nHaWOw6uXIj9mo8Va3EcVbGGuawX8ZKTWF0yG8
 2aEOk4F+qL6XjlELMqQ/kl2yQBgTHwRH8xLCaTf9MRnKoAtxBzY3LlRuEGGUYPgrbOmE
 4l/wPccgDSpwU0k/T2WKlQIB32r8n3snJKeP2BcScJEHsF2IvNIBiAwy/CBhyfMQnTpD
 kZet9qZHxQOHvP0W30k4/n0pTOaEwOiAlfT+EQsfqhBYNDWE58mTaFkkoy7Qi4nD8Yg/
 P5WzPkvTZCcWkDWAhOMoHLZueNxCBKHaqFnQkDk20OSo+lXh9Vs5dhhEElkeDlZCkbdA
 MicA==
X-Gm-Message-State: AOAM530GSjqFLOMCNG1ixmO03h0tDkAcIvX5ZCTox/m4CU5z46pEGoCC
 c3U3cAgy4NGD0eU/uD2+TvA=
X-Google-Smtp-Source: ABdhPJwxZpxVcs5+yRJ6hGh8RKOyIh9OTe/nY1FORrQk/LwAUAC2vXL/Za9+EjHe6HQoxPwvXVNlgw==
X-Received: by 2002:a17:90b:350b:: with SMTP id
 ls11mr3967571pjb.166.1611636385804; 
 Mon, 25 Jan 2021 20:46:25 -0800 (PST)
Received: from bobo.ozlabs.ibm.com
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id 68sm19272293pfg.90.2021.01.25.20.46.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 20:46:25 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v11 11/13] mm/vmalloc: add vmap_range_noflush variant
Date: Tue, 26 Jan 2021 14:45:08 +1000
Message-Id: <20210126044510.2491820-12-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210126044510.2491820-1-npiggin@gmail.com>
References: <20210126044510.2491820-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Ding Tianhong <dingtianhong@huawei.com>,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Christoph Hellwig <hch@infradead.org>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As a side-effect, the order of flush_cache_vmap() and
arch_sync_kernel_mappings() calls are switched, but that now matches
the other callers in this file.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 mm/vmalloc.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index f043386bb51d..47ab4338cfff 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -240,7 +240,7 @@ static int vmap_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long end,
 	return 0;
 }
 
-int vmap_range(unsigned long addr, unsigned long end,
+static int vmap_range_noflush(unsigned long addr, unsigned long end,
 			phys_addr_t phys_addr, pgprot_t prot,
 			unsigned int max_page_shift)
 {
@@ -263,14 +263,24 @@ int vmap_range(unsigned long addr, unsigned long end,
 			break;
 	} while (pgd++, phys_addr += (next - addr), addr = next, addr != end);
 
-	flush_cache_vmap(start, end);
-
 	if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
 		arch_sync_kernel_mappings(start, end);
 
 	return err;
 }
 
+int vmap_range(unsigned long addr, unsigned long end,
+			phys_addr_t phys_addr, pgprot_t prot,
+			unsigned int max_page_shift)
+{
+	int err;
+
+	err = vmap_range_noflush(addr, end, phys_addr, prot, max_page_shift);
+	flush_cache_vmap(addr, end);
+
+	return err;
+}
+
 static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 			     pgtbl_mod_mask *mask)
 {
-- 
2.23.0

