Return-Path: <linuxppc-dev+bounces-14200-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78645C610E0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Nov 2025 07:40:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d8LqY0lngz30VQ;
	Sun, 16 Nov 2025 17:40:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763275256;
	cv=none; b=chiCsc75ruQ1+ncikEcgrNdmOxskhVEdUlQxc9k4F9Lh70Qfn4jk+CP6PYfJNVWxDx2FxPjGp4ML415EF/J5tdI6SKjyZcCPhEKWFtKQJUqTQam/HHcrnBRRn45ddsXIRMmoypq2Ezm6HoFYFf5//T7YSlpscxXSeJXPfwvMea1KPtRBLwTCk9Vnxy7yz69NZE2RViomv272dqEWzDgMmwwpFhm7cUQZgCffu/OX5CmmbO+BMqHsYEVS4jH5/BSCM4PnYDYph4NWVRv3kmaK1RHNuHeTmwtN6UQ71yPwCn6dblzQjSgYHiyFnye14MhJuaEebqZDem0YucQ1kq7Aug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763275256; c=relaxed/relaxed;
	bh=A/TBs7BuWibkRX4L1Mxki9I3H1/n/J1InK7hm63Zqwc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KTQBSL3BGb0Ah8DjK5f26MYz6ZccXapzjNJdt08sAo1B5OXqIbZZnBXQZkBD/BZS660EUxFLBbv2mfCS6eWPrYWlqKQoRkYllhKp6RHBb1Qs7s3ADVzMQkzc48kbhYljZy1E/lMR/Fo0M5peLamGa+766KzowAUeEQV1nqBnecSgt2P2o52ilb1BRuqLSFcrqnL2W636Q6Ai4FjZMS7qi6qw79mBGfNYKOWPc8Xbfl6elI9U4SabwA4CJ1fdcOPwBVpla+5AlT+cpEYhxSYPrcG6d/lRjmx2hUCm+Gy7hoVOLbTl0SC7F0WXzeNcY42gCtLIF5ovhaJLGQM9eSdGgg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=vasilevsky.ca; spf=pass (client-ip=209.85.160.181; helo=mail-qt1-f181.google.com; envelope-from=djvasi@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=vasilevsky.ca
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.181; helo=mail-qt1-f181.google.com; envelope-from=djvasi@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d8LqW37wfz30V3
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Nov 2025 17:40:54 +1100 (AEDT)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4ee1e18fb37so359611cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Nov 2025 22:40:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763275251; x=1763880051;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/TBs7BuWibkRX4L1Mxki9I3H1/n/J1InK7hm63Zqwc=;
        b=KRyqSwv63Cn6yeuiWzuwA0WmJG2DYeznAsh5pzOQhGT+1hJ9u5rdGz/OFV2VCIODh0
         WIAGFDFbY06SvPWQ3XdJcOcOx8wrOaXmXoWRohGhYn6MXj3e/1AfxmjNJBbiNKVIsz+h
         dHheUTMn8o3L5yXlgyuYTQMJXo8uYcqA4lIGBRdi/2nyTmuxqBU3tqOJ2iwVpgFe4ncx
         JRQGo7c0JbRpbwDmeLUNdXrl5a6JIwr9pjpoqyTI44dtz2XnpBOKS9Il6ZF0eQpbKlP/
         RXGEHTRoLD/Rkt1gkbph2CPq1iXHLS2OHONT/1zGtVXEUqciMR6uplkn+fo5uquYgjUo
         WNFw==
X-Gm-Message-State: AOJu0YxGQPbHKaPzsIhv/TbByYanWhznilHH6DE+ftJ9ZzPZA/Wtgdnp
	QpTMjrsi9TrnB248TNlBg8xPBURHauWNnMGnvQdxDXzYZ5jwHiX1zHUe
X-Gm-Gg: ASbGncumLR4m2dMGU+EqOLhBWiFBsr9aSDmWYWe0/klSZKd9Dp/XyAiDbPf/uU6el7q
	j8Ooqi4HVk8oYFF/i/lVrgsRJ7542ayOSsn40juM0E1+xA6JCamz+Uhn0uW/n0q/xNRED/C4H9O
	V07YF/nl3GVV0BAQKZw7LTfQVClV2cEIB4L3asKMHyaGhsXMzc2QISfsDsivgt+kRyx1MvXDoUq
	HzMrqOuZBaj/gfx6JeKltudNmor1TNTVwanGqV+ZALZsC/TO2DQZoNC5XHtEy9wN60lCD+F2Ffn
	UD57ITUlPZ+HjIQr8wpBFrZCR0BRtf/7Fwnbj4vw6s5SF03avOQFKQib0ZHYwtHLpOq1CMhc+LJ
	3tm7nF2uBxheWyEOYktoNKNHVEJukU4fh3JEI4XuoaII+Bubz6+38WRN7cIsqduFi9EAAAKJgfS
	9aRC7+DLJy0+SclFCUO/SU7SSnEIfKk0SozQcaU9R3KJuhvftvuy4Sv76fmOXOcd2up7Shob9FV
	g==
X-Google-Smtp-Source: AGHT+IG+qzsrR+dRWKF4NmoVX7b6CUaR8vMmbs3TLbWswTg9TED3bCbWhUIV58kjiV3MwgK5w6g1yA==
X-Received: by 2002:a05:622a:1107:b0:4ec:f7de:f5eb with SMTP id d75a77b69052e-4edf20a2ebbmr113268941cf.33.1763275250934;
        Sat, 15 Nov 2025 22:40:50 -0800 (PST)
Received: from [192.168.2.45] (bras-base-mtrlpq3141w-grc-10-65-95-13-196.dsl.bell.ca. [65.95.13.196])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ede87e6fecsm61188021cf.18.2025.11.15.22.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 22:40:50 -0800 (PST)
From: Dave Vasilevsky <dave@vasilevsky.ca>
Date: Sun, 16 Nov 2025 01:40:46 -0500
Subject: [PATCH v3] powerpc, mm: Fix mprotect on book3s 32-bit
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251116-vasi-mprotect-g3-v3-1-59a9bd33ba00@vasilevsky.ca>
X-B4-Tracking: v=1; b=H4sIAO1xGWkC/33NwQ6CMAwG4FchPTuzli0MT76H8TDHBosKZCOLh
 PDuDi4mxtjb3/z9ukC0wdsIp2KBYJOPfuhzKA8FmE73rWW+yRmIk0ROFUs6evYcwzBZM7G2ZE4
 5SZVqBAoO+WwM1vnXTl6uOXc+TkOY9w8Jt+0fLCFDVhqJquJKulqft8rDpnifj0bDBib6IHl+I
 JQRpdDUQrubEfSNrOv6BpGaqhz5AAAA
X-Change-ID: 20251027-vasi-mprotect-g3-f8f5278d4140
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Nadav Amit <nadav.amit@gmail.com>, 
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Ritesh Harjani <ritesh.list@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, linux-mm@kvack.org, 
 Dave Vasilevsky <dave@vasilevsky.ca>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763275249; l=3309;
 i=dave@vasilevsky.ca; s=20251027; h=from:subject:message-id;
 bh=muIWQccO36YRMVeS5U/f/4/TLToyy8blzhH60i2svbE=;
 b=BqibHhRBraGtc5DC4MXisv7cfh+xdLpFWAQQaxC9fzFoJvdvVanpK8QruKXcOddOsTtRvfNgH
 YlQotamK+KoD0aCejzMYbW1umsa7tkoXkMduqh2O3DDT0rZZS39zLZd
X-Developer-Key: i=dave@vasilevsky.ca; a=ed25519;
 pk=Jsd1btZeqqg6x6y73Dx0YrleQb3A3pCBnUeE0qmoKq4=
X-Spam-Status: No, score=0.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 32-bit book3s with hash-MMUs, tlb_flush() was a no-op. This was
unnoticed because all uses until recently were for unmaps, and thus
handled by __tlb_remove_tlb_entry().

After commit 4a18419f71cd ("mm/mprotect: use mmu_gather") in kernel 5.19,
tlb_gather_mmu() started being used for mprotect as well. This caused
mprotect to simply not work on these machines:

  int *ptr = mmap(NULL, 4096, PROT_READ|PROT_WRITE,
                  MAP_PRIVATE|MAP_ANONYMOUS, -1, 0);
  *ptr = 1; // force HPTE to be created
  mprotect(ptr, 4096, PROT_READ);
  *ptr = 2; // should segfault, but succeeds

Fixed by making tlb_flush() actually flush TLB pages. This finally
agrees with the behaviour of boot3s64's tlb_flush().

Fixes: 4a18419f71cd ("mm/mprotect: use mmu_gather")
Cc: stable@vger.kernel.org
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Signed-off-by: Dave Vasilevsky <dave@vasilevsky.ca>
---
Changes in v3:
- Fix formatting
- Link to v2: https://lore.kernel.org/r/20251111-vasi-mprotect-g3-v2-1-881c94afbc42@vasilevsky.ca

Changes in v2:
- Flush entire TLB if full mm is requested.
- Link to v1: https://lore.kernel.org/r/20251027-vasi-mprotect-g3-v1-1-3c5187085f9a@vasilevsky.ca
---
 arch/powerpc/include/asm/book3s/32/tlbflush.h | 5 ++++-
 arch/powerpc/mm/book3s32/tlb.c                | 9 +++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/book3s/32/tlbflush.h b/arch/powerpc/include/asm/book3s/32/tlbflush.h
index e43534da5207aa3b0cb3c07b78e29b833c141f3f..4be2200a3c7e1e8307f5ce1f1d5d28047429c106 100644
--- a/arch/powerpc/include/asm/book3s/32/tlbflush.h
+++ b/arch/powerpc/include/asm/book3s/32/tlbflush.h
@@ -11,6 +11,7 @@
 void hash__flush_tlb_mm(struct mm_struct *mm);
 void hash__flush_tlb_page(struct vm_area_struct *vma, unsigned long vmaddr);
 void hash__flush_range(struct mm_struct *mm, unsigned long start, unsigned long end);
+void hash__flush_gather(struct mmu_gather *tlb);
 
 #ifdef CONFIG_SMP
 void _tlbie(unsigned long address);
@@ -29,7 +30,9 @@ void _tlbia(void);
 static inline void tlb_flush(struct mmu_gather *tlb)
 {
 	/* 603 needs to flush the whole TLB here since it doesn't use a hash table. */
-	if (!mmu_has_feature(MMU_FTR_HPTE_TABLE))
+	if (mmu_has_feature(MMU_FTR_HPTE_TABLE))
+		hash__flush_gather(tlb);
+	else
 		_tlbia();
 }
 
diff --git a/arch/powerpc/mm/book3s32/tlb.c b/arch/powerpc/mm/book3s32/tlb.c
index 9ad6b56bfec96e989b96f027d075ad5812500854..e54a7b0112322e5818d80facd2e3c7722e6dd520 100644
--- a/arch/powerpc/mm/book3s32/tlb.c
+++ b/arch/powerpc/mm/book3s32/tlb.c
@@ -105,3 +105,12 @@ void hash__flush_tlb_page(struct vm_area_struct *vma, unsigned long vmaddr)
 		flush_hash_pages(mm->context.id, vmaddr, pmd_val(*pmd), 1);
 }
 EXPORT_SYMBOL(hash__flush_tlb_page);
+
+void hash__flush_gather(struct mmu_gather *tlb)
+{
+	if (tlb->fullmm || tlb->need_flush_all)
+		hash__flush_tlb_mm(tlb->mm);
+	else
+		hash__flush_range(tlb->mm, tlb->start, tlb->end);
+}
+EXPORT_SYMBOL(hash__flush_gather);

---
base-commit: 24172e0d79900908cf5ebf366600616d29c9b417
change-id: 20251027-vasi-mprotect-g3-f8f5278d4140

Best regards,
-- 
Dave Vasilevsky <dave@vasilevsky.ca>


