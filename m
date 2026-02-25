Return-Path: <linuxppc-dev+bounces-17177-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOdkHVzXnmkTXgQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17177-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 12:05:00 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A31BB196348
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 12:04:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLWvY0jglz2xNT;
	Wed, 25 Feb 2026 22:04:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772017497;
	cv=none; b=HEQsYkpTwzYjr460rFV1VgF/fhfQimdCXIDDT8Rha0Fi0PBsQVZ5B1l1ilpA0oG6WQ3jmX28FeLses5b5eeBF+uEOg7athgQZy/i+5LYjl0VoaumRFHfNTY0YFHYl+wKrwzkl9FUKxHEO1zSrGm5+3i4UhPIvhvnharbuo17mb2WWldmSJn7EVDWCHUoR+Te/1tg4xopXsJiERXieKbpX1vKTYcTyN4umfSg8+CKecTzP+MqecZk5blM41lVAH+GWdN2zrZkA0UV3+9gS89KiPQrpInPqnIFEvCDc28pQ8JgzNfd0nPYe1q5PZe7Ik9Uu+Ge1WTVoEvMYyKWgjFAlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772017497; c=relaxed/relaxed;
	bh=J868TVnPJgR7LCa7+/bcaLOytmiRzF7462XYcNyDyzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ebuz8ozL7rYWN7fhtAPTiqek12n8pBurWlTUORo4hVc4uuipMpgWQNvDX6u8hI4oG1xpJLDHIjuty4URBW4lCE8FhM4CN4fHpID6alNNDyr4EvqL0SjglatW+pzUBJcQLvoYJrZ1qeZnWtT8I9tZ8HYvol51mH38S6gpVYSFR1IxFWYLDievq6E3fEKonHGWekBQuOv3vZQF7WOC4cw7Qk5DrAQUs7us3W+11UXi9gcJohUMIAFxZttUfLzFtJ6euf6QJaRvqKe4ZH5LEAh0nRJvaIALVKa468qXZpnvCEEPg+D5s7eVM2417jev1TllizghB96Ub/qQJ1fk2PvIyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AJlCFD7+; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AJlCFD7+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLWvX23xwz3f1K
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 22:04:56 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2aaf5d53eaaso44677905ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 03:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772017493; x=1772622293; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J868TVnPJgR7LCa7+/bcaLOytmiRzF7462XYcNyDyzw=;
        b=AJlCFD7+Yockcdc64W2+N0yZUIHTjN6LfVnn4rJDq4C6t6457O77mOh6ZFR8HtEmWO
         ZJkV9qoyYRIhySkmjlY3Mc/AZctYxecBjP+lb8R7SeM0VrL6kwNNNTw1njoo/zQWDmEL
         /Ou8OFlgDbgzhignt9YL1yQwG204eI5+EyIv2pTftBBhrAkS7Q1esbMOlJDTRPhqVlxn
         7f/EmnrlJqnNEBPZWmyBzurvsSbAA67lwUXZ5toY851Ip80E0h+UptZwGV27IIEvQUfC
         WZiciPBvHGdC+MC56m2K5C3/O7jNjrlFE75dxk1/ygfOBHoFSrdcZpJvLE5sDQOscox1
         a/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772017493; x=1772622293;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J868TVnPJgR7LCa7+/bcaLOytmiRzF7462XYcNyDyzw=;
        b=O7Vo7L8+D3obusrM5myCJlg0rQed82DP0vp50MN983afWMNdcNIf4vF7+ALzKeyWVN
         cKBEPoikL+ao8VKEOMcdM1pEK3SD2ZMsnhsZ+mETGAUsXON0DAbCgM0qJhgCorC0xWO6
         a2uWeYTJKa5JSGEePqOf+ROCCS5joxpA+e7tFSorBWKAIfL8jCnZO4PvqfDduleLn57g
         nClgeZNtoCOTT3lCOYe//uW/Gf/ZAw/nrZdZjlXgh/YbZZvZyWCrgiBFX+HLV+qleIF2
         PzIWbsVra1lwJTjtFHdmT7O5gfI+Ya9aELXtftJWegNii+3wJIzdcyTAzDbn0Aj2Czcf
         saUg==
X-Gm-Message-State: AOJu0YzgJTCQOZe57IMn8fy+PGswAguHECuLw+uW3/ro1/BnOiJIgjD9
	xd9atnoPwskIfdYqdyO99mkTUhaxX3TxgsUZ4lqBsPvUF3LcTKC8m7C3D0IIoQ==
X-Gm-Gg: ATEYQzzLAsADp0N3LK8wezSpxaKPB2BbwkLLAt8+59MJo+zHgUYzU41QZmOd2NplBmk
	RDQZdvDM8pJ0R12YsAoiw8jIlfhJP4/tNknE5wgiM3KTApqKxTVAJBWVAbvrT50MOsLVX+D6JyY
	BqVSiGW4mrkpxw14ugOEWIOWA2eD3Ehk/AJm6IvM9bQqzsS4a+sOpj0ZhVkpMqENJHsYYfY74vL
	5ZGqbO9XJydgaNx1UbJur1JzT6gnXXrZEmodjYGaZ7/cnH5uRvwJmi0+HbniMmapNQ/8eWyP3tl
	C1GoFufjv0kzTAbXsrSccqKqWD26g8Mnkte5qiyk77ehYK47wg8bDD+gi0d+NqmALOjpwufL9aa
	P7GVpNrdc1CXjk4HYdOd2zL+CsveS4MnRTinTX5/O2ypGZxT5OYTMEZi+TvfOvEb7+KmwOkdHaO
	HQyiVsixXw2IIpHgTDJlkd6gT+2He7GDc=
X-Received: by 2002:a17:902:cecc:b0:2a0:c58b:ed6 with SMTP id d9443c01a7336-2add1382e8amr25909715ad.29.1772017493421;
        Wed, 25 Feb 2026 03:04:53 -0800 (PST)
Received: from dw-tp.ibmuc.com ([203.81.242.210])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7503f9f5sm138365975ad.77.2026.02.25.03.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 03:04:52 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org,
	Hugh Dickins <hughd@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Pavithra Prakash <pavrampu@linux.vnet.ibm.com>
Subject: [RFC v1 02/10] powerpc: book3s64: Fix unmap race with PMD THP migration entry
Date: Wed, 25 Feb 2026 16:34:23 +0530
Message-ID: <6a1d3d5992307e181082b35ba238d7e09acc77a6.1772013273.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772013273.git.ritesh.list@gmail.com>
References: <cover.1772013273.git.ritesh.list@gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kvack.org,google.com,linux-foundation.org,linux.ibm.com,gmail.com,kernel.org,linux.vnet.ibm.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17177-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: A31BB196348
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

Fixes: 75358ea359e7c ("powerpc/mm/book3s64: Fix MADV_DONTNEED and parallel page fault race")
Reported-by: Pavithra Prakash <pavrampu@linux.vnet.ibm.com>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/pgtable.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 4b09c04654a8..359092001670 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -210,8 +210,23 @@ pmd_t pmdp_huge_get_and_clear_full(struct vm_area_struct *vma,
 {
 	pmd_t pmd;
 	VM_BUG_ON(addr & ~HPAGE_PMD_MASK);
-	VM_BUG_ON((pmd_present(*pmdp) && !pmd_trans_huge(*pmdp)) ||
-		   !pmd_present(*pmdp));
+	VM_BUG_ON((pmd_present(*pmdp) && !pmd_trans_huge(*pmdp)));
+
+	if (!pmd_present(*pmdp)) {
+		/*
+		 * Non-present PMDs can be migration entries or device-private
+		 * THP entries. Since these are non-present, so there is no TLB
+		 * backing. This happens when the address space is being
+		 * unmapped zap_huge_pmd(), and we encounter non-present pmds.
+		 * So it is safe to just clear the PMDs here. zap_huge_pmd(),
+		 * will take care of withdraw of the deposited table.
+		 */
+		pmd = pmdp_get(pmdp);
+		pmd_clear(pmdp);
+		page_table_check_pmd_clear(vma->vm_mm, addr, pmd);
+		return pmd;
+	}
+
 	pmd = pmdp_huge_get_and_clear(vma->vm_mm, addr, pmdp);
 	/*
 	 * if it not a fullmm flush, then we can possibly end up converting
--
2.53.0


