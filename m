Return-Path: <linuxppc-dev+bounces-17110-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAQcDWemnWmgQwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17110-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 14:23:51 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF77187990
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Feb 2026 14:23:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKz2B4S5wz3cNQ;
	Wed, 25 Feb 2026 00:23:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771939426;
	cv=none; b=Qg03flEPTWZ0F8En6CV+Fwld+AEQ6x9vN7GA2B4Loc3d4cNtizNrmasRJ/X8X2qiV+fSr8WQkgQbP6Y21YfrhIlGI+0m7TXnMeCGzTxySJ0RdRNwj3OFu1YTHpdNdBMsI03M+uvaZdZhs8zZBO2HK+Hz+QeA/3eXpvheiR2e0pYNAK+YXDYhNR6TpZIYl2kxrwnqTEAP1AWNACZiuHcERhfRiaQo01BC/hNhagrUu652COQlytt9j4FpDbp51DqSl0UZpD6eEs520lvsp7RcliUd4AJqKJ5lhZ46AOHv7Tgq1TMJdNsuc6YXkng84yr8m4mDE/Vql7A/pL9bM049hw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771939426; c=relaxed/relaxed;
	bh=h/vTWhMTFB0Dk21wQu2UrghHtfm/CBbtvTcuyWrVL08=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kkKGwloe9PHKMOjYLfKEtr0X1QXYGXXgFbNwR5rS4DJ/q7uSXZd+JLPJ7upROHVvicyMI1RJcAjV1IripaVjGHnZ8lQP56GMScFZiTFG7AuGvFwsdApCtLftr+nQSNL8hlV97R2IGNcxfV3kic+hzqjmXGFg6xIP1qrEmytzXJwovzYVLXH5erliAPsTzQlE/JO4dGOHLJ0itPUQV+orqRnkDLAzQrGqYIboNBvUT96P0lU0D7vIi4g5IIuFKJYKalr5w6ln+rGiqZ7UpUe7ucPQAdIY1jt33ccAy8jc6UvSr7xfNQ1Pft0x0STu4XnAgUUoPu3GLsuxx2xmAnxnfA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Mu/Mfh39; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Mu/Mfh39;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKz290nxQz3cND
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 00:23:44 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2ad9a9be502so5397555ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 05:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771939421; x=1772544221; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h/vTWhMTFB0Dk21wQu2UrghHtfm/CBbtvTcuyWrVL08=;
        b=Mu/Mfh39SvudxQqmE06j9qCaA+Zhx5Wi3F0BB4HOE0eREEqHx+6qWmuz0+2GegQ+ov
         dqJW3iEaB6ddFaeM3nFilLaZUGXSpeCYKlUZHPT85lMiiAXjeQ7Zxv2hTA0K2j6eleng
         qMcPPuDLyDWXUPi4rboY7EHqcQU7gwtoJ/5ypkW0VyX7PhLqN6FwHh2/V4cpbISNPxTZ
         twXj/1x/LSSPmyqCaUiHP5810xnSyBi0Z/cVRg0Z2iAFElSienAbvHJ0DxbO3mBcj6WY
         ZFmzmLPdIs7weFcOjjxsxj+Sp0FFeikBLDUsBkINO8X307s4e3AVMM/wwhH2g+wGzZCA
         CF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771939421; x=1772544221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h/vTWhMTFB0Dk21wQu2UrghHtfm/CBbtvTcuyWrVL08=;
        b=lhzmaXRUdLrKnBbzqh0ybhEFYl5qt4aOk54upkS9ivMDlYvA6WovGYMquPAcdv003z
         B5K/xa5bIN2738RVylpzqfI/KMAaYQnW4vX/HHSCOwfIUCZa+d1MlnkVEv1xVyyIjmM/
         7c7+GWbFezlGWxw2pDxcV5UBgOxpz6RkH66tC6OJvWJbEBEDS+BjmyWhUDlkQ1zAHDk0
         TIDmR/QzYO1SQSgAqGajXNZB6u5G2jXOrdWraKh8/TzXgEs33NAJEaLdJGwAqvUNC0WO
         67l/EaXGUDU/uLegPxRYdWbDZZI9QUh1W+4I8in0XBUPv0T3HoyyNBENmOE7isg/00F4
         7o3A==
X-Forwarded-Encrypted: i=1; AJvYcCX31dU/QNmj3c7UJ7XNeZSnEcA9RTdfojVeVGIE6JSCUPlGAI8UiiHAut9vSC/XTUnGV7yFOGy8hJk07Hc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxgRDCGi1dd3E5uDJJGbP40Uj4/fJvCUbVtlnBjQzAL2JgK497f
	6NexIqt4kAP5AIHTcXJFXVsTFk7k903MymBDXEFmfsC8qtzLGdhef6Jz
X-Gm-Gg: ATEYQzweiFgWnLXOVZmlya6sE+WuOuj/SPMKA0a73cjV3y4el5AnNLNd+fApfZT3pxg
	Me4R5RnN5s64JMQd0/Rp5S/L0j39p8F5wb8TNFK2sTkHDwQshnYNFUE6Xe7/Vb9SgkBr2+pjCpa
	JYIdC1R0OzUDENnudxz4hYpAMsUkudO2YXRr0yc1INW0eNvL6Oe/aYRMDfa2JL1octogvOYB3eA
	rDsstaYO+RrKrioCcyenfYd+GKEBzKMjdKZ95LYRC/t7XMzF0H/P4EzuE/+cSWXcPuIHje8YZH/
	IKVgwO7Lsi/buS2A/GXIVkihvhHyIg/y5bHLxDw1jCEdswt+8ZlmvNrhNntCbsk7WrpJbeDJWXr
	3Qa4BZ/La45Q+W1GTi587qq1r4XL6nr155B70aGCzed8gxjpT5KZG02Lni2NjVVrsFXrqp4df70
	4DfGp3oN9wdmOKVimuEg==
X-Received: by 2002:a17:902:e787:b0:2a9:3396:738 with SMTP id d9443c01a7336-2ad74547d8dmr105272735ad.44.1771939420973;
        Tue, 24 Feb 2026 05:23:40 -0800 (PST)
Received: from dw-tp ([203.81.243.253])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7500e1cbsm96620195ad.50.2026.02.24.05.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 05:23:40 -0800 (PST)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: kasan-dev@googlegroups.com
Cc: linux-mm@kvack.org,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	linuxppc-dev@lists.ozlabs.org,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	stable@vger.kernel.org,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [PATCH v2] mm/kasan: Fix double free for kasan pXds
Date: Tue, 24 Feb 2026 18:53:16 +0530
Message-ID: <2f9135c7866c6e0d06e960993b8a5674a9ebc7ec.1771938394.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.53.0
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
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-17110-lists,linuxppc-dev=lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kvack.org,gmail.com,google.com,arm.com,lists.ozlabs.org,vger.kernel.org,linux.ibm.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:kasan-dev@googlegroups.com,m:linux-mm@kvack.org,m:ryabinin.a.a@gmail.com,m:glider@google.com,m:andreyknvl@gmail.com,m:dvyukov@google.com,m:vincenzo.frascino@arm.com,m:linuxppc-dev@lists.ozlabs.org,m:ritesh.list@gmail.com,m:stable@vger.kernel.org,m:venkat88@linux.ibm.com,m:ryabininaa@gmail.com,m:riteshlist@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.995];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 6FF77187990
X-Rspamd-Action: no action

kasan_free_pxd() assumes the page table is always struct page aligned.
But that's not always the case for all architectures. E.g. In case of
powerpc with 64K pagesize, PUD table (of size 4096) comes from slab
cache named pgtable-2^9. Hence instead of page_to_virt(pxd_page()) let's
just directly pass the start of the pxd table which is passed as the 1st
argument.

This fixes the below double free kasan issue seen with PMEM:

radix-mmu: Mapped 0x0000047d10000000-0x0000047f90000000 with 2.00 MiB pages
==================================================================
BUG: KASAN: double-free in kasan_remove_zero_shadow+0x9c4/0xa20
Free of addr c0000003c38e0000 by task ndctl/2164

CPU: 34 UID: 0 PID: 2164 Comm: ndctl Not tainted 6.19.0-rc1-00048-gea1013c15392 #157 VOLUNTARY
Hardware name: IBM,9080-HEX POWER10 (architected) 0x800200 0xf000006 of:IBM,FW1060.00 (NH1060_012) hv:phyp pSeries
Call Trace:
 dump_stack_lvl+0x88/0xc4 (unreliable)
 print_report+0x214/0x63c
 kasan_report_invalid_free+0xe4/0x110
 check_slab_allocation+0x100/0x150
 kmem_cache_free+0x128/0x6e0
 kasan_remove_zero_shadow+0x9c4/0xa20
 memunmap_pages+0x2b8/0x5c0
 devm_action_release+0x54/0x70
 release_nodes+0xc8/0x1a0
 devres_release_all+0xe0/0x140
 device_unbind_cleanup+0x30/0x120
 device_release_driver_internal+0x3e4/0x450
 unbind_store+0xfc/0x110
 drv_attr_store+0x78/0xb0
 sysfs_kf_write+0x114/0x140
 kernfs_fop_write_iter+0x264/0x3f0
 vfs_write+0x3bc/0x7d0
 ksys_write+0xa4/0x190
 system_call_exception+0x190/0x480
 system_call_vectored_common+0x15c/0x2ec
---- interrupt: 3000 at 0x7fff93b3d3f4
NIP:  00007fff93b3d3f4 LR: 00007fff93b3d3f4 CTR: 0000000000000000
REGS: c0000003f1b07e80 TRAP: 3000   Not tainted  (6.19.0-rc1-00048-gea1013c15392)
MSR:  800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 48888208  XER: 00000000
<...>
NIP [00007fff93b3d3f4] 0x7fff93b3d3f4
LR [00007fff93b3d3f4] 0x7fff93b3d3f4
---- interrupt: 3000

 The buggy address belongs to the object at c0000003c38e0000
  which belongs to the cache pgtable-2^9 of size 4096
 The buggy address is located 0 bytes inside of
  4096-byte region [c0000003c38e0000, c0000003c38e1000)

 The buggy address belongs to the physical page:
 page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x3c38c
 head: order:2 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
 memcg:c0000003bfd63e01
 flags: 0x63ffff800000040(head|node=6|zone=0|lastcpupid=0x7ffff)
 page_type: f5(slab)
 raw: 063ffff800000040 c000000140058980 5deadbeef0000122 0000000000000000
 raw: 0000000000000000 0000000080200020 00000000f5000000 c0000003bfd63e01
 head: 063ffff800000040 c000000140058980 5deadbeef0000122 0000000000000000
 head: 0000000000000000 0000000080200020 00000000f5000000 c0000003bfd63e01
 head: 063ffff800000002 c00c000000f0e301 00000000ffffffff 00000000ffffffff
 head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000004
 page dumped because: kasan: bad access detected

[  138.953636] [   T2164] Memory state around the buggy address:
[  138.953643] [   T2164]  c0000003c38dff00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[  138.953652] [   T2164]  c0000003c38dff80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[  138.953661] [   T2164] >c0000003c38e0000: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[  138.953669] [   T2164]                    ^
[  138.953675] [   T2164]  c0000003c38e0080: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[  138.953684] [   T2164]  c0000003c38e0100: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[  138.953692] [   T2164] ==================================================================
[  138.953701] [   T2164] Disabling lock debugging due to kernel taint

Fixes: 0207df4fa1a8 ("kernel/memremap, kasan: make ZONE_DEVICE with work with KASAN")
Cc: stable@vger.kernel.org
Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---

v1 -> v2:
1. cc'd linux-mm
2. Added tags (Fixes, CC, Reported).

 mm/kasan/init.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/mm/kasan/init.c b/mm/kasan/init.c
index f084e7a5df1e..9c880f607c6a 100644
--- a/mm/kasan/init.c
+++ b/mm/kasan/init.c
@@ -292,7 +292,7 @@ static void kasan_free_pte(pte_t *pte_start, pmd_t *pmd)
 			return;
 	}

-	pte_free_kernel(&init_mm, (pte_t *)page_to_virt(pmd_page(*pmd)));
+	pte_free_kernel(&init_mm, pte_start);
 	pmd_clear(pmd);
 }

@@ -307,7 +307,7 @@ static void kasan_free_pmd(pmd_t *pmd_start, pud_t *pud)
 			return;
 	}

-	pmd_free(&init_mm, (pmd_t *)page_to_virt(pud_page(*pud)));
+	pmd_free(&init_mm, pmd_start);
 	pud_clear(pud);
 }

@@ -322,7 +322,7 @@ static void kasan_free_pud(pud_t *pud_start, p4d_t *p4d)
 			return;
 	}

-	pud_free(&init_mm, (pud_t *)page_to_virt(p4d_page(*p4d)));
+	pud_free(&init_mm, pud_start);
 	p4d_clear(p4d);
 }

@@ -337,7 +337,7 @@ static void kasan_free_p4d(p4d_t *p4d_start, pgd_t *pgd)
 			return;
 	}

-	p4d_free(&init_mm, (p4d_t *)page_to_virt(pgd_page(*pgd)));
+	p4d_free(&init_mm, p4d_start);
 	pgd_clear(pgd);
 }

--
2.53.0


