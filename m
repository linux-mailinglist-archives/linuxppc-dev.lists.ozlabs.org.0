Return-Path: <linuxppc-dev+bounces-17191-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OL+5Emrunmk/XwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17191-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 13:43:22 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B5819784B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 13:43:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLZ504pYlz3f4F;
	Wed, 25 Feb 2026 23:43:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::834"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772023396;
	cv=none; b=Nvywq+WeaMXT+zw40l/qdYjCw3L7ste3Dx0CdSYZIJPFOwKdzn0iSIkGS4lnSKsU0cYcyeC2R2CHCmvmKo5pRYeiEZIe9HhQB9rnElpDainLc5VGupsnOJtSXhgbwwmae3Vx8JYtvvkbTRFX+rGXJ7tYJZe0CMQ8EpEv4TFbGvfDx6e7yCQq3Q4CmMyDaoluTlgCV1TcgBXWIwVRZSWzDEs2+0t8W0ln4R9xGq7NiqdBjQh7PCaF278GHwrU8T/4rYx32yrplehkGhU0tNBD6RAEC0763nW08GEkVm6+TLN0tN7dwq0Kv8YTHGy7NP6G4c7DpaLDeIcT+CEGyKkglA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772023396; c=relaxed/relaxed;
	bh=zCgxlgUh2Kzipr/6PqsqlcJ2dmxQyt6oZKQKS/otnAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ICLa3AKZlvufBF2CI8QqiETqVVulzdll4kr6snThOkITiMZvpEFKZigE1q8jsh7Ey5hCVDglzPukhPeAjl34u120LlieWOtdGYod0IOyVAQbQUIZ61rpNV7EUSCqs1QUyNcj6yR9/Y3iak9BM8W93U45/YI0dQSPZRuH7Tspw5Ryo9zNGigB711KSkGoNaHiF6Z4AGb1u2ix8SC6W6oFZXHY1p7vB4HLk5D4QDXtfMoqJoI61vSH9bbIAztTR/wJnhVrSTwrHpNkfYVUqxGp6GTEC8TGxH6m9r9LgxZOdTF0f0QDIiKdPoq3zmU/7NNCHtQCMQOBBKQ3DBGK+ii5CQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WeugJPXk; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::834; helo=mail-qt1-x834.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WeugJPXk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::834; helo=mail-qt1-x834.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLZ4y72ZNz3f3G
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 23:43:13 +1100 (AEDT)
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-5033387c80aso11200731cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 04:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772023391; x=1772628191; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCgxlgUh2Kzipr/6PqsqlcJ2dmxQyt6oZKQKS/otnAk=;
        b=WeugJPXkvxqFdNF1rj7N2xQP4JsVgXrK4BgjwY/DOLkSDyP8dVhC9ZJOyj4NspJOKq
         Q8B01SnXuOCmFNPkNmnii13e5TtdifV/C2Mrt/GJeA6P/v4vtzyVNPfrc6y5hBpmzqZZ
         JOtiydP/pZEbuta39vJFKh4T0sljX9RRY/XaEGEsd8W4ztvCoGgBIpFR6TSvFWIPqmcj
         VtEhzLt0my3/NJEsB4VtnRRyl+JK7WUnE0t+AkQSithn9rVYRCXQXG8Sc+9J9pVPRQvk
         g80WL1HUa8N9hjBIMTNzjonRTtE6x8GQRHuvG92mT1IBABHxddGO28/ebkomeoQzkIWE
         EGsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772023391; x=1772628191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zCgxlgUh2Kzipr/6PqsqlcJ2dmxQyt6oZKQKS/otnAk=;
        b=doARSJiKZobpgnQlfzIy1ovLRc3lWHvzTo9j3l4o2iOw96BQmkwuM730ilwwuRT5Pi
         msH72Ch924IzZ7/2RYa3igWIsDxOs3GqiJ8m/dr9Bvw01zLTQx1BAhCxQYOUFZ+WTVI3
         M24j9CPnlxIRwxtpZ44BQkJjxDxWueTk8eNuZCtoprAXaHuWiwdxHWuvVVT0iR5l2Xsq
         vE/x80ScoVQXf7ChuoitV6z0sBwxHs9K1cs4TqJEuyE3Pi85fPmKtRvCnF3Rr2mNt7AG
         8MVSm38k3LBA1+J/xJhlz+bGtW7lVIrvzH0De9hXEfEGTi6CKTouUUIpFWjK2fDesPlJ
         HNpg==
X-Gm-Message-State: AOJu0YxQxH98WuI4bgYsbxYTvzFZ81QN0aOrri8zoCNKOCl0I4k9DnmR
	8l8trkS5nn3xjdKCesT8WwIC0mdePWdFVlwdr+njLjSNuP1Qkr7Wcmkl+qjRCAs5
X-Gm-Gg: ATEYQzy+sGQtyeDZ/Mghl9JhjLiQVkDZ3H5/R3f5evcOkFh8C14vFYDK3GQLK3pilZQ
	aUseYvKJigGBLA8teGJIampxIj0rKrNldsWoemaulTBLYB8RNfSXI07I5tNIRXCAzyUFq+DBeM4
	dpyKtoQxGEzJZnA0G/QiMgvGyioJw8NH4BIQo9RP1mAQEJiwGd+6e+o42Cu/O3VgwF0of68Ll3g
	FQQ4UbXdHanW6eyH9L2SeXLewgTUsL9ji19gJRcGM+8o1rutVs8blCQs+QEDAvWaZ8L1JwW6nE9
	bnV+Yet50KliQYAXZmjkPgv9f9nCl/es/h5xUkU3DaDfGB0+IqELD5qfN5fyENYgiGxmhWjoDLM
	z10O5XONWnGWRgiSHqPDOiiAnBlpieOKEiMoVpTnugoLyZ58VGgoLmI8vdjtkKjDstkpJiGj17t
	6j2vfNbayQs1xqp6jntdkS+MyZfVMinT8=
X-Received: by 2002:a17:903:2f8c:b0:2a9:320d:285e with SMTP id d9443c01a7336-2adbde07482mr26085165ad.27.1772017488500;
        Wed, 25 Feb 2026 03:04:48 -0800 (PST)
Received: from dw-tp.ibmuc.com ([203.81.242.210])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7503f9f5sm138365975ad.77.2026.02.25.03.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 03:04:47 -0800 (PST)
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
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC v1 01/10] powerpc/pgtable-frag: Fix bad page state in pte_frag_destroy
Date: Wed, 25 Feb 2026 16:34:22 +0530
Message-ID: <62dfff55a7f4f465ac1f8077cee93e6e87ebddd0.1772013273.git.ritesh.list@gmail.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17191-lists,linuxppc-dev=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kvack.org,google.com,linux-foundation.org,linux.ibm.com,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: E3B5819784B
X-Rspamd-Action: no action

powerpc uses pt_frag_refcount as a reference counter for tracking it's
pte and pmd page table fragments. For PTE table, in case of Hash with
64K pagesize, we have 16 fragments of 4K size in one 64K page.

Patch series [1] "mm: free retracted page table by RCU"
added pte_free_defer() to defer the freeing of PTE tables when
retract_page_tables() is called for madvise MADV_COLLAPSE on shmem
range.
[1]: https://lore.kernel.org/all/7cd843a9-aa80-14f-5eb2-33427363c20@google.com/

pte_free_defer() sets the active flag on the corresponding fragment's
folio & calls pte_fragment_free(), which reduces the pt_frag_refcount.
When pt_frag_refcount reaches 0 (no active fragment using the folio), it
checks if the folio active flag is set, if set, it calls call_rcu to
free the folio, it the active flag is unset then it calls pte_free_now().

Now, this can lead to following problem in a corner case...

[  265.351553][  T183] BUG: Bad page state in process a.out  pfn:20d62
[  265.353555][  T183] page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x20d62
[  265.355457][  T183] flags: 0x3ffff800000100(active|node=0|zone=0|lastcpupid=0x7ffff)
[  265.358719][  T183] raw: 003ffff800000100 0000000000000000 5deadbeef0000122 0000000000000000
[  265.360177][  T183] raw: 0000000000000000 c0000000119caf58 00000000ffffffff 0000000000000000
[  265.361438][  T183] page dumped because: PAGE_FLAGS_CHECK_AT_FREE flag(s) set
[  265.362572][  T183] Modules linked in:
[  265.364622][  T183] CPU: 0 UID: 0 PID: 183 Comm: a.out Not tainted 6.18.0-rc3-00141-g1ddeaaace7ff-dirty #53 VOLUNTARY
[  265.364785][  T183] Hardware name: IBM pSeries (emulated by qemu) POWER10 (architected) 0x801200 0xf000006 of:SLOF,git-ee03ae pSeries
[  265.364908][  T183] Call Trace:
[  265.364955][  T183] [c000000011e6f7c0] [c000000001cfaa18] dump_stack_lvl+0x130/0x148 (unreliable)
[  265.365202][  T183] [c000000011e6f7f0] [c000000000794758] bad_page+0xb4/0x1c8
[  265.365384][  T183] [c000000011e6f890] [c00000000079c020] __free_frozen_pages+0x838/0xd08
[  265.365554][  T183] [c000000011e6f980] [c0000000000a70ac] pte_frag_destroy+0x298/0x310
[  265.365729][  T183] [c000000011e6fa30] [c0000000000aa764] arch_exit_mmap+0x34/0x218
[  265.365912][  T183] [c000000011e6fa80] [c000000000751698] exit_mmap+0xb8/0x820
[  265.366080][  T183] [c000000011e6fc30] [c0000000001b1258] __mmput+0x98/0x300
[  265.366244][  T183] [c000000011e6fc80] [c0000000001c81f8] do_exit+0x470/0x1508
[  265.366421][  T183] [c000000011e6fd70] [c0000000001c95e4] do_group_exit+0x88/0x148
[  265.366602][  T183] [c000000011e6fdc0] [c0000000001c96ec] pid_child_should_wake+0x0/0x178
[  265.366780][  T183] [c000000011e6fdf0] [c00000000003a270] system_call_exception+0x1b0/0x4e0
[  265.366958][  T183] [c000000011e6fe50] [c00000000000d05c] system_call_vectored_common+0x15c/0x2ec

The bad page state error occurs when such a folio gets freed (with
active flag set), from do_exit() path in parallel.

... this can happen when the pte fragment was allocated from this folio,
but when all the fragments get freed, the pte_frag_refcount still had some
unused fragments. Now, if this process exits, with such folio as it's cached
pte_frag in mm->context, then during pte_frag_destroy(), we simply call
pagetable_dtor() and pagetable_free(), meaning it doesn't clear the
active flag. This, can lead to the above bug. Since we are anyway in
do_exit() path, then if the refcount is 0, then I guess it should be
ok to simply clear the folio active flag before calling pagetable_dtor()
& pagetable_free().

Fixes: 32cc0b7c9d50 ("powerpc: add pte_free_defer() for pgtables sharing page")
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/pgtable-frag.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/mm/pgtable-frag.c b/arch/powerpc/mm/pgtable-frag.c
index 77e55eac16e4..ae742564a3d5 100644
--- a/arch/powerpc/mm/pgtable-frag.c
+++ b/arch/powerpc/mm/pgtable-frag.c
@@ -25,6 +25,7 @@ void pte_frag_destroy(void *pte_frag)
 	count = ((unsigned long)pte_frag & ~PAGE_MASK) >> PTE_FRAG_SIZE_SHIFT;
 	/* We allow PTE_FRAG_NR fragments from a PTE page */
 	if (atomic_sub_and_test(PTE_FRAG_NR - count, &ptdesc->pt_frag_refcount)) {
+		folio_clear_active(ptdesc_folio(ptdesc));
 		pagetable_dtor(ptdesc);
 		pagetable_free(ptdesc);
 	}
-- 
2.53.0


