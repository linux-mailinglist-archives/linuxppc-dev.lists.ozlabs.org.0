Return-Path: <linuxppc-dev+bounces-17922-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCjcJC0Or2njNAIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17922-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 19:15:09 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8233223E6D3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 19:15:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fV4tC0kGRz3cF6;
	Tue, 10 Mar 2026 05:14:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773080099;
	cv=none; b=LoHD91zOsadcp3PF8wwQioLB2n/ckTFakiMjRhBp56x+1sDfAsvvp629Hho3aFsKlKFXAT94uampz+Qvn74AeIXsqEcQtlAJtbpffBrA65nm5hW3iBpybt0bu/p2RUprQStSyLhj8adrnIKlHffUiFY+/3p5LpbywiY3mMXlA9Dcyr2fAabhjhPebddruT0KbFsev3yocnkH3Mp1r2kGHlCdE00kao80L2AUVo/QQh9crGdihdwzHMB03UID0VMFhhQ4YsD6ynJgjLV/W5e4PWFImdAY1vdMh3qHOsYoq/zQs2NTvCVVj3dNh63ARayAj3Hiio5HeLWuz0sLd4bRvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773080099; c=relaxed/relaxed;
	bh=zNWDb1hTxmSoj/3ZXkkU29KgfcYG1qC/G5cIi3ndVgg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o3vaX4vgVj6a3tT5trHt083xftEpO1bA6wFKYE5/hDyjFVCBfkEp/6/NyJMxQLnuhiS/F6v46IxDWLFus0naw76dTQGbpfRVIq+3TFXxhkHqJhlg2TBgfYdum1SvXtRiW4GvXkYB9u9WUNa/jbhLwILy8TeBIVAM3ChCnf80VG7yGQMFqz3THWFGH2MkCxEcfOo+KWmR+NXSdZGMydvqJ2rlhs5rtORlI3aYOjBTjOhiamXhK/QTWBvwTOOMEbwpsvRkOKZUlJenqP5EZDZ76h2njEIV7KpeVT/Hij6FUXPXt3VqZRDh720X9t/fqN0XK8T+KWulccG5ILLhjkrs/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lhkCaiQB; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lhkCaiQB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fV4tB24ydz3cF4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2026 05:14:58 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-8296d553142so2720767b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Mar 2026 11:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773080096; x=1773684896; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNWDb1hTxmSoj/3ZXkkU29KgfcYG1qC/G5cIi3ndVgg=;
        b=lhkCaiQBNJPol3LLQEzuKfTh7iJ69dyfA0XGkcYnUIQbysw6MLnCP11d4EtUa4TVqX
         bosZGLryPaez4LHKUw79Wj+Ki/dUyq7wpn8t6jLG+hlTSBMuh6yk15X/KJQmGadQUBuI
         epvQgH+k3lCq1HAGs/dHwFeIiROJibzUMktScLUZXv+VWrQ1JWUjkC468l5s3PTxaAHp
         +/9LHKhW5yfsczcOcCYj34Sei6Mzu23Kc2sKKaMyocbLfMja2rbZSM0PbGiAH9lvt2UZ
         1f04HvCuoH0k6IDgWcA+jpKqo8SVS7Nl34wG+pgnkUb6Rvgw0b1YhNf66bzAiXnCVW5p
         r4QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773080096; x=1773684896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zNWDb1hTxmSoj/3ZXkkU29KgfcYG1qC/G5cIi3ndVgg=;
        b=ou66cLQykd5NqQKWTsbNKeGxZH+NHi/Ww7GB7ZOqht8LvLG3rwuU7WYBd0O362JTiW
         hQsKvwtjOBMLBP5mJMspWBfXToozPPPv2U/9s/Iq5rB2gwhoS4Q70TzT3PAIF2u0gC0u
         ddb0Fr3fWPQ2lrFti51uggEOQYarygW5kJ8uPhQ2dCWgv3ustT+DY8V8ghH9Amn0Ps0M
         Ug29J9OJA7t3jhJhZvLUzEiwMnBXsLVEhWq9zmASrsMArxnODc65YubI/pgR/r2pJxav
         vzS4+iLSvePRYq/cwYj7fHaH/bDlF52i7KQmFK9p36jZbSmBXnZdiXg763eNWRtFm/u0
         S4SA==
X-Gm-Message-State: AOJu0YxU2OOXeCjTlo3VqT04SOFd3KYe8nRTVMxkc0ZXzqLBmvEMhDbJ
	WsMrqqLEZRXkt4ZV8M+yus6l+o4Cx+KmyCtRLLwxD5aeqI80o5zMUszGy8JOOJ4t
X-Gm-Gg: ATEYQzw0zngwO/JsY6CNQgkHJAq+fJBEU57xA2PBunK0mfnB2tMStR+a44/xG1jDhUN
	TzekXSsWIZY8bsOIIFyZ4xWSZhtzlnzoGXJ24CTugpYzrwl8qbrXBGTC+sn/helIpcphDWUuddy
	JbK1h8A7hC/nnI6wUS4TC+haNVO+OvPQXudATJNex6pBm1PyBr+iP+Eqg8WZdNJzRm4EyCZIusF
	z6O1vI7SNYB54FrBnh+z4POpOnUeKHiFZhqqBUG/+WweZWztiHUOahP112nNGXzFKbuqY+GYkqJ
	/WzaTsUpdZMKV5KQEpBVZbxkqxP5orwNxE1EZ09WtJ9kgy+S0F3TpI2mlPDWoq7U1e9UdSnWasI
	iBBCEeIMMwUiN3vIOqqG9bWlHc+P+diGWm9Mqcsf0O9SzhXgMLvIjLNrWRbxyOU9pjvbjLrdWp6
	OF5oR90N0HyvrXI5UTSqES0P6IlOmCGCRgb8DKvg8QSTH92OCsN05G3H+XbP/ShMQNf2rAxSOzM
	n8=
X-Received: by 2002:a05:6a00:1597:b0:829:8990:3f86 with SMTP id d2e1a72fcca58-829a2f425damr8431540b3a.35.1773080095578;
        Mon, 09 Mar 2026 11:14:55 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1f29:53c8:742c:4036:d7c6:9024])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a46765a6sm10775477b3a.29.2026.03.09.11.14.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Mar 2026 11:14:55 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Sayali Patil <sayalip@linux.ibm.com>,
	Aboorva Devarajan <aboorvad@linux.ibm.com>,
	Donet Tom <donettom@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Pavithra Prakash <pavrampu@linux.vnet.ibm.com>
Subject: [PATCH v2 02/10] powerpc/64s: Fix unmap race with PMD migration entries
Date: Mon,  9 Mar 2026 23:44:25 +0530
Message-ID: <9437e5ef28d1e2f5cbdd7f8286350ce93c1d43c5.1773078178.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1773078178.git.ritesh.list@gmail.com>
References: <cover.1773078178.git.ritesh.list@gmail.com>
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
X-Rspamd-Queue-Id: 8233223E6D3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,gmail.com,linux.vnet.ibm.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17922-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

The following race is possible with migration swap entries or
device-private THP entries. e.g. when move_pages is called on a PMD THP
page, then there maybe an intermediate state, where PMD entry acts as
a migration swap entry (pmd_present() is true). Then if an munmap
happens at the same time, then this VM_BUG_ON() can happen in
pmdp_huge_get_and_clear_full().

This patch fixes that.

Thread A: move_pages() syscall
  add_folio_for_migration()
    mmap_read_lock(mm)
    folio_isolate_lru(folio)
    mmap_read_unlock(mm)

  do_move_pages_to_node()
    migrate_pages()
      try_to_migrate_one()
        spin_lock(ptl)
        set_pmd_migration_entry()
          pmdp_invalidate()     # PMD: _PAGE_INVALID | _PAGE_PTE | pfn
          set_pmd_at()          # PMD: migration swap entry (pmd_present=0)
        spin_unlock(ptl)
        [page copy phase]       # <--- RACE WINDOW -->

Thread B: munmap()
  mmap_write_downgrade(mm)
  unmap_vmas() -> zap_pmd_range()
    zap_huge_pmd()
      __pmd_trans_huge_lock()
        pmd_is_huge():          # !pmd_present && !pmd_none -> TRUE (swap entry)
        pmd_lock() -> 		# spin_lock(ptl), waits for Thread A to release ptl
      pmdp_huge_get_and_clear_full()
        VM_BUG_ON(!pmd_present(*pmdp))  # HITS!

[  287.738700][ T1867] ------------[ cut here ]------------
[  287.743843][ T1867] kernel BUG at arch/powerpc/mm/book3s64/pgtable.c:187!
cpu 0x0: Vector: 700 (Program Check) at [c00000044037f4f0]
    pc: c000000000094ca4: pmdp_huge_get_and_clear_full+0x6c/0x23c
    lr: c000000000645dec: zap_huge_pmd+0xb0/0x868
    sp: c00000044037f790
   msr: 800000000282b033
  current = 0xc0000004032c1a00
  paca    = 0xc000000004fe0000   irqmask: 0x03   irq_happened: 0x09
    pid   = 1867, comm = a.out
kernel BUG at :187!
Linux version 6.19.0-12136-g14360d4f917c-dirty (powerpc64le-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40) #27 SMP PREEMPT Sun Feb 22 10:38:56 IST 2026
enter ? for help
[link register   ] c000000000645dec zap_huge_pmd+0xb0/0x868
[c00000044037f790] c00000044037f7d0 (unreliable)
[c00000044037f7d0] c000000000645dcc zap_huge_pmd+0x90/0x868
[c00000044037f840] c0000000005724cc unmap_page_range+0x176c/0x1f40
[c00000044037fa00] c000000000572ea0 unmap_vmas+0xb0/0x1d8
[c00000044037fa90] c0000000005af254 unmap_region+0xb4/0x128
[c00000044037fb50] c0000000005af400 vms_complete_munmap_vmas+0x138/0x310
[c00000044037fbe0] c0000000005b0f1c do_vmi_align_munmap+0x1ec/0x238
[c00000044037fd30] c0000000005b3688 __vm_munmap+0x170/0x1f8
[c00000044037fdf0] c000000000587f74 sys_munmap+0x2c/0x40
[c00000044037fe10] c000000000032668 system_call_exception+0x128/0x350
[c00000044037fe50] c00000000000d05c system_call_vectored_common+0x15c/0x2ec
---- Exception: 3000 (System Call Vectored) at 0000000010064a2c
SP (7fff9b1ee9c0) is in userspace
0:mon> zh

commit a30b48bf1b24 ("mm/migrate_device: implement THP migration of zone device pages"),
enabled migration for device-private PMD entries. Hence this is one
other path where this warning could get trigger from.

 ------------[ cut here ]------------
 WARNING: arch/powerpc/mm/book3s64/hash_pgtable.c:199 at hash__pmd_hugepage_update+0x48/0x284, CPU#3: hmm-tests/1905
 Modules linked in: test_hmm
 CPU: 3 UID: 0 PID: 1905 Comm: hmm-tests Tainted: G    B   W    L   N  7.0.0-rc1-01438-g7e2f0ee7581c #21 PREEMPT
 Tainted: [B]=BAD_PAGE, [W]=WARN, [L]=SOFTLOCKUP, [N]=TEST
 Hardware name: IBM pSeries (emulated by qemu) POWER10 (architected) 0x801200 0xf000006 of:SLOF,git-ee03ae pSeries
 NIP [c000000000096b70] hash__pmd_hugepage_update+0x48/0x284
 LR [c000000000096e7c] hash__pmdp_huge_get_and_clear+0xd0/0xd4
 Call Trace:
 [c000000604707670] [c000000004e102b8] 0xc000000004e102b8 (unreliable)
 [c000000604707700] [c00000000064ec3c] set_pmd_migration_entry+0x414/0x498
 [c000000604707760] [c00000000063e5a4] migrate_vma_collect_pmd+0x12e8/0x16c4
 [c000000604707890] [c00000000059282c] walk_pgd_range+0x7fc/0xd2c
 [c000000604707990] [c000000000592e40] __walk_page_range+0xe4/0x2ac
 [c000000604707a10] [c000000000593534] walk_page_range_mm_unsafe+0x204/0x2a4
 [c000000604707ab0] [c00000000063af10] migrate_vma_setup+0x1dc/0x2e8
 [c000000604707b10] [c008000006a21838] dmirror_migrate_to_system.constprop.0+0x210/0x4b0 [test_hmm]
 [c000000604707c30] [c008000006a245b0] dmirror_fops_unlocked_ioctl+0x454/0xa5c [test_hmm]
 [c000000604707d20] [c0000000006aab84] sys_ioctl+0x4ec/0x1178
 [c000000604707e10] [c0000000000326a8] system_call_exception+0x128/0x350
 [c000000604707e50] [c00000000000d05c] system_call_vectored_common+0x15c/0x2ec
 ---- interrupt: 3000 at 0x7fffbe44f50c

Fixes: 75358ea359e7c ("powerpc/mm/book3s64: Fix MADV_DONTNEED and parallel page fault race")
Fixes: a30b48bf1b24 ("mm/migrate_device: implement THP migration of zone device pages")
Reported-by: Pavithra Prakash <pavrampu@linux.vnet.ibm.com>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h | 15 +++++++++++++++
 arch/powerpc/mm/book3s64/pgtable.c           | 13 +++++++++----
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 639cbf34f752..43d442a80a23 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1336,12 +1336,27 @@ static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
 {
 	pmd_t old_pmd;
 
+	/*
+	 * Non-present PMDs can be migration entries or device-private THP
+	 * entries. This can happen at 2 places:
+	 * - When the address space is being unmapped zap_huge_pmd(), and we
+	 *   encounter non-present pmds.
+	 * - migrate_vma_collect_huge_pmd() could calls this during migration
+	 *   of device-private pmd entries.
+	 */
+	if (!pmd_present(*pmdp)) {
+		old_pmd = READ_ONCE(*pmdp);
+		pmd_clear(pmdp);
+		goto out;
+	}
+
 	if (radix_enabled()) {
 		old_pmd = radix__pmdp_huge_get_and_clear(mm, addr, pmdp);
 	} else {
 		old_pmd = hash__pmdp_huge_get_and_clear(mm, addr, pmdp);
 	}
 
+out:
 	page_table_check_pmd_clear(mm, addr, old_pmd);
 
 	return old_pmd;
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 4b09c04654a8..42c7906d0e43 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -209,16 +209,21 @@ pmd_t pmdp_huge_get_and_clear_full(struct vm_area_struct *vma,
 				   unsigned long addr, pmd_t *pmdp, int full)
 {
 	pmd_t pmd;
+	bool was_present = pmd_present(*pmdp);
+
 	VM_BUG_ON(addr & ~HPAGE_PMD_MASK);
-	VM_BUG_ON((pmd_present(*pmdp) && !pmd_trans_huge(*pmdp)) ||
-		   !pmd_present(*pmdp));
+	VM_BUG_ON(was_present && !pmd_trans_huge(*pmdp));
+	/*
+	 * Check pmdp_huge_get_and_clear() for non-present pmd case.
+	 */
 	pmd = pmdp_huge_get_and_clear(vma->vm_mm, addr, pmdp);
 	/*
 	 * if it not a fullmm flush, then we can possibly end up converting
 	 * this PMD pte entry to a regular level 0 PTE by a parallel page fault.
-	 * Make sure we flush the tlb in this case.
+	 * Make sure we flush the tlb in this case. TLB flush not needed for
+	 * non-present case.
 	 */
-	if (!full)
+	if (was_present && !full)
 		flush_pmd_tlb_range(vma, addr, addr + HPAGE_PMD_SIZE);
 	return pmd;
 }
-- 
2.50.1 (Apple Git-155)


