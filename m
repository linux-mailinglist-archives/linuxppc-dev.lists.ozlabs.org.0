Return-Path: <linuxppc-dev+bounces-13354-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC3AC12130
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 00:40:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwVP61h1zz304H;
	Tue, 28 Oct 2025 10:40:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761607339;
	cv=none; b=GyiVge5mKONWfu6jqTBlwDqn2Xm1iub6PVsDFi2ULQaabXw/xPoHAyOMeAEkjsWEfJ72aYqByWpDWeAX2d4AV9W/UIGLaOsCKC8cnPg56l1yiUZMe20NHQzZmOjX2zPXXGhw825wpE2yJxS2791P0rnmNlofAUyc6wzF9J6cbTIOMfsxyebEbm0GzYDFOQyhGNS6lWwiHtEkkcRN4fB/kBVhlhlEq1wYaDsoHPRlrrzb213vi4GT84EzwT3u2cAWdh+rL9IG63lT1wu7gqWNe90bQ66BZ3x1izDRM+VtU3EOmucHTJsUhe2ltEY772vPRJiAkIBoFKdM91P+WHFHyg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761607339; c=relaxed/relaxed;
	bh=bzKh10D2M5wAZYJrCmVZjTfXmrcFt0t/yXYz0QplU9k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Psd1Lxdpu1YxKHsm7c4+fXi/kT8oUUARhKBSp1mjE9sWySu7Gsgo9SBVT1cK4XUTMT5jIF9CKA8Tjb144F5ttFAsKw3Q6+OY462QIqscBZHMUxF/rah3M7ttlb2USOCRNDW19smlIVu2zz6rZbDX2jNyOfZssJLXRxFE1TQJ/wqDCTSfGOwVmtmLCD8n+U6BMCjbbo7/UFiPFSkXx1RxjH9PSifnOA9QqBSr86lhNEQO1n3Xe3ppF6PIU8IM4HexX4bhKvS1Q0Zs4xn8PGqApv4CIp7feknOtRQ8ggZ2H//yk0N1G8qGXwCW8lZOqocdIy7qwQLMxgDwQP4Uzp2z4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ufgn7wwv; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=devnull+dave.vasilevsky.ca@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ufgn7wwv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=devnull+dave.vasilevsky.ca@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwV0B1HmKz2yFx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 10:22:18 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 97A756031B;
	Mon, 27 Oct 2025 23:22:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4548BC116B1;
	Mon, 27 Oct 2025 23:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761607335;
	bh=onxRzI4qOeKxeNuAcJ0ae/Pha4L/2LJ+E+8mbQS1rjs=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Ufgn7wwvyEHJcYZm2u94ouAm/8OKru7xfw5V091ddfWYr9FvF3m1ze4nwm6AThnD6
	 C1u9dzYYCuQtC0mSexKvqflAl7SCsTBjBri8Skl6CMxU/9b7Ya/v7w41p2kcjgocxm
	 fOSwm6lrPaBd824qX26A6KQohob1A4m5OXX6Jt9GPHPPG6+x2waM4q3npwFYOSldsZ
	 JHpQE7yU9RhHmHInFAIYurnyLmj03wHwJRgTg07GHb0Eyj7KvEqhRD1GDYWY9oW9j/
	 gwynTtyxW3Q0/NRAS8NJnG3rG0bTcQ7gyExWms1Ml87HO3eKasgcO9+dwUyvTB1p3m
	 vYu1RiebHn/pQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C993CCF9E0;
	Mon, 27 Oct 2025 23:22:15 +0000 (UTC)
From: Dave Vasilevsky via B4 Relay <devnull+dave.vasilevsky.ca@kernel.org>
Date: Mon, 27 Oct 2025 19:21:47 -0400
Subject: [PATCH] powerpc: Fix mprotect on book3s32
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
Message-Id: <20251027-vasi-mprotect-g3-v1-1-3c5187085f9a@vasilevsky.ca>
X-B4-Tracking: v=1; b=H4sIAIr+/2gC/x3MQQqAIBBA0avErBtQS5SuEi0ix5pFKhoRhHdPW
 r7F/y8UykwFpu6FTDcXjqFB9h1sxxp2QnbNoITSUiiD91oYz5TjRduF+4Deeq2MdaMcBbQsZfL
 8/Mt5qfUDcHtzDGIAAAA=
X-Change-ID: 20251027-vasi-mprotect-g3-f8f5278d4140
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Nadav Amit <nadav.amit@gmail.com>, 
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Dave Vasilevsky <dave@vasilevsky.ca>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761607334; l=2972;
 i=dave@vasilevsky.ca; s=20251027; h=from:subject:message-id;
 bh=E1aBGzZxrKFyEjSh5tyf0kwyoQ+SazFw/xbQmkHQC8c=;
 b=stXn+ddNorVpT4m4xv4DpE0jTKLzbB53xuvhLM3AsQqN7nWd+GkbidV1wVWZ/ynrPTQgsSvxj
 RF8akzSsGFIAuOfxrGVn1gCyHKBiUqsfRdMLRLPFG2DkjhzYuR0HhW/
X-Developer-Key: i=dave@vasilevsky.ca; a=ed25519;
 pk=Jsd1btZeqqg6x6y73Dx0YrleQb3A3pCBnUeE0qmoKq4=
X-Endpoint-Received: by B4 Relay for dave@vasilevsky.ca/20251027 with
 auth_id=556
X-Original-From: Dave Vasilevsky <dave@vasilevsky.ca>
Reply-To: dave@vasilevsky.ca
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Dave Vasilevsky <dave@vasilevsky.ca>

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
Signed-off-by: Dave Vasilevsky <dave@vasilevsky.ca>
---
 arch/powerpc/include/asm/book3s/32/tlbflush.h | 8 ++++++--
 arch/powerpc/mm/book3s32/tlb.c                | 6 ++++++
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/tlbflush.h b/arch/powerpc/include/asm/book3s/32/tlbflush.h
index e43534da5207aa3b0cb3c07b78e29b833c141f3f..b8c587ad2ea954f179246a57d6e86e45e91dcfdc 100644
--- a/arch/powerpc/include/asm/book3s/32/tlbflush.h
+++ b/arch/powerpc/include/asm/book3s/32/tlbflush.h
@@ -11,6 +11,7 @@
 void hash__flush_tlb_mm(struct mm_struct *mm);
 void hash__flush_tlb_page(struct vm_area_struct *vma, unsigned long vmaddr);
 void hash__flush_range(struct mm_struct *mm, unsigned long start, unsigned long end);
+void hash__flush_gather(struct mmu_gather *tlb);
 
 #ifdef CONFIG_SMP
 void _tlbie(unsigned long address);
@@ -28,9 +29,12 @@ void _tlbia(void);
  */
 static inline void tlb_flush(struct mmu_gather *tlb)
 {
-	/* 603 needs to flush the whole TLB here since it doesn't use a hash table. */
-	if (!mmu_has_feature(MMU_FTR_HPTE_TABLE))
+	if (mmu_has_feature(MMU_FTR_HPTE_TABLE)) {
+		hash__flush_gather(tlb);
+	} else {
+		/* 603 needs to flush the whole TLB here since it doesn't use a hash table. */
 		_tlbia();
+	}
 }
 
 static inline void flush_range(struct mm_struct *mm, unsigned long start, unsigned long end)
diff --git a/arch/powerpc/mm/book3s32/tlb.c b/arch/powerpc/mm/book3s32/tlb.c
index 9ad6b56bfec96e989b96f027d075ad5812500854..3da95ecfbbb296303082e378425e92a5fbdbfac8 100644
--- a/arch/powerpc/mm/book3s32/tlb.c
+++ b/arch/powerpc/mm/book3s32/tlb.c
@@ -105,3 +105,9 @@ void hash__flush_tlb_page(struct vm_area_struct *vma, unsigned long vmaddr)
 		flush_hash_pages(mm->context.id, vmaddr, pmd_val(*pmd), 1);
 }
 EXPORT_SYMBOL(hash__flush_tlb_page);
+
+void hash__flush_gather(struct mmu_gather *tlb)
+{
+	hash__flush_range(tlb->mm, tlb->start, tlb->end);
+}
+EXPORT_SYMBOL(hash__flush_gather);

---
base-commit: dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
change-id: 20251027-vasi-mprotect-g3-f8f5278d4140

Best regards,
-- 
Dave Vasilevsky <dave@vasilevsky.ca>



