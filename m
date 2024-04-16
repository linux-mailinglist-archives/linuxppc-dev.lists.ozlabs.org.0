Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DBC8A7492
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 21:21:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=motorola.com header.i=@motorola.com header.a=rsa-sha256 header.s=DKIM202306 header.b=Jwc5YnkS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJv6009Vmz3vZF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Apr 2024 05:21:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=motorola.com header.i=@motorola.com header.a=rsa-sha256 header.s=DKIM202306 header.b=Jwc5YnkS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=motorola.com (client-ip=148.163.152.46; helo=mx0b-00823401.pphosted.com; envelope-from=mbland@motorola.com; receiver=lists.ozlabs.org)
Received: from mx0b-00823401.pphosted.com (mx0b-00823401.pphosted.com [148.163.152.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJv4q0gFSz3vYN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Apr 2024 05:20:10 +1000 (AEST)
Received: from pps.filterd (m0355091.ppops.net [127.0.0.1])
	by mx0b-00823401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43GGDbkP026743;
	Tue, 16 Apr 2024 19:19:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=motorola.com; h=
	message-id:in-reply-to:references:to:cc:from:subject:date; s=
	DKIM202306; bh=Oc2SUwX6uzMkXCJf4ZSU5CLVXrP2N2CrXvm6EA3BRc0=; b=J
	wc5YnkSa9VTYoe44uJ8PpfZJJ4I1RO0Ec5TEt2adm0mt1nvygMy/T04tcYsJyWuV
	kUzcaafDi4Bsd2bVw9aoUvomRqgoHF4S77vYS2srx9bOnn2iEV2uVtmlrxJOaq6p
	qSCjW/5TXBzgN9lsY7xm5E8yRWiaE1vXDVbRTO8VhAEcjuYj6mwS7r5BvVpXVz+r
	FzYwhWzGUyOuHDT7oPu1klDPE+syM5GlnXghz20136x1kHZBmTYA9t99uJ4V+/gG
	X81O07yG4prTi38sq+NIu0yuwjPU0BLHrgmQWpNj/GQnGqhp5L1V7/eXONP294JB
	QBZxML18jVgaMH5opSXWQ==
Received: from ilclpfpp02.lenovo.com ([144.188.128.68])
	by mx0b-00823401.pphosted.com (PPS) with ESMTPS id 3xhjbekf1r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Apr 2024 19:19:22 +0000 (GMT)
Received: from va32lmmrp02.lenovo.com (va32lmmrp02.mot.com [10.62.176.191])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ilclpfpp02.lenovo.com (Postfix) with ESMTPS id 4VJv3t1srTzfBb2;
	Tue, 16 Apr 2024 19:19:22 +0000 (UTC)
Received: from ilclbld243.mot.com (ilclbld243.mot.com [100.64.22.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mbland)
	by va32lmmrp02.lenovo.com (Postfix) with ESMTPSA id 4VJv3t0ZCdz2Z122;
	Tue, 16 Apr 2024 19:19:22 +0000 (UTC)
Message-Id: <20240416122254.868007168-6-mbland@motorola.com>
In-Reply-To: <20240416122254.868007168-1-mbland@motorola.com>
References: <20240416122254.868007168-1-mbland@motorola.com>
To: linux-mm@kvack.org
From: Maxwell Bland <mbland@motorola.com>
Subject: [PATCH 5/5 RESEND] ptdump: add state parameter for non-leaf callback
Date: Tue, 16 Apr 2024 14:18:19 -0500
X-Proofpoint-ORIG-GUID: 2te5hZS_SLkB4TyM1Y9ZD386LAS6NjDY
X-Proofpoint-GUID: 2te5hZS_SLkB4TyM1Y9ZD386LAS6NjDY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-16_16,2024-04-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 mlxscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0
 mlxlogscore=997 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404160120
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Conor Dooley <conor.dooley@microchip.com>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Christoph Hellwig <hch@infradead.org>, Yu Chien Peter Lin <peterlin@andestech.com>, x86@kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Maxwell Bland <mbland@motorola.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, An
 dy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Song Shuai <suagrfillet@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ptdump can now note non-leaf descriptor entries, a useful addition for
debugging table descriptor permissions when working on related code

Signed-off-by: Maxwell Bland <mbland@motorola.com>
---
 arch/arm64/mm/ptdump.c          |  6 ++++--
 arch/powerpc/mm/ptdump/ptdump.c |  2 ++
 arch/riscv/mm/ptdump.c          |  6 ++++--
 arch/s390/mm/dump_pagetables.c  |  6 ++++--
 arch/x86/mm/dump_pagetables.c   |  3 ++-
 include/linux/ptdump.h          |  1 +
 mm/ptdump.c                     | 13 +++++++++++++
 7 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
index 796231a4fd63..1a6f4a3513e5 100644
--- a/arch/arm64/mm/ptdump.c
+++ b/arch/arm64/mm/ptdump.c
@@ -299,7 +299,8 @@ void ptdump_walk(struct seq_file *s, struct ptdump_info *info)
 			.range = (struct ptdump_range[]){
 				{info->base_addr, end},
 				{0, 0}
-			}
+			},
+			.note_non_leaf = false
 		}
 	};
 
@@ -335,7 +336,8 @@ bool ptdump_check_wx(void)
 			.range = (struct ptdump_range[]) {
 				{_PAGE_OFFSET(vabits_actual), ~0UL},
 				{0, 0}
-			}
+			},
+			.note_non_leaf = false
 		}
 	};
 
diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
index 9dc239967b77..89e673f5fd3d 100644
--- a/arch/powerpc/mm/ptdump/ptdump.c
+++ b/arch/powerpc/mm/ptdump/ptdump.c
@@ -307,6 +307,7 @@ static int ptdump_show(struct seq_file *m, void *v)
 		.ptdump = {
 			.note_page = note_page,
 			.range = ptdump_range,
+			.note_non_leaf = false
 		}
 	};
 
@@ -340,6 +341,7 @@ bool ptdump_check_wx(void)
 		.ptdump = {
 			.note_page = note_page,
 			.range = ptdump_range,
+			.note_non_leaf = false
 		}
 	};
 
diff --git a/arch/riscv/mm/ptdump.c b/arch/riscv/mm/ptdump.c
index 1289cc6d3700..b355633afcaf 100644
--- a/arch/riscv/mm/ptdump.c
+++ b/arch/riscv/mm/ptdump.c
@@ -328,7 +328,8 @@ static void ptdump_walk(struct seq_file *s, struct ptd_mm_info *pinfo)
 			.range = (struct ptdump_range[]) {
 				{pinfo->base_addr, pinfo->end},
 				{0, 0}
-			}
+			},
+			.note_non_leaf = false
 		}
 	};
 
@@ -350,7 +351,8 @@ bool ptdump_check_wx(void)
 			.range = (struct ptdump_range[]) {
 				{KERN_VIRT_START, ULONG_MAX},
 				{0, 0}
-			}
+			},
+			.note_non_leaf = false
 		}
 	};
 
diff --git a/arch/s390/mm/dump_pagetables.c b/arch/s390/mm/dump_pagetables.c
index ffd07ed7b4af..6468cfd53e2a 100644
--- a/arch/s390/mm/dump_pagetables.c
+++ b/arch/s390/mm/dump_pagetables.c
@@ -200,7 +200,8 @@ bool ptdump_check_wx(void)
 			.range = (struct ptdump_range[]) {
 				{.start = 0, .end = max_addr},
 				{.start = 0, .end = 0},
-			}
+			},
+			.note_non_leaf = false
 		},
 		.seq = NULL,
 		.level = -1,
@@ -239,7 +240,8 @@ static int ptdump_show(struct seq_file *m, void *v)
 			.range = (struct ptdump_range[]) {
 				{.start = 0, .end = max_addr},
 				{.start = 0, .end = 0},
-			}
+			},
+			.note_non_leaf = false
 		},
 		.seq = m,
 		.level = -1,
diff --git a/arch/x86/mm/dump_pagetables.c b/arch/x86/mm/dump_pagetables.c
index 89079ea73e65..43f00dfb955f 100644
--- a/arch/x86/mm/dump_pagetables.c
+++ b/arch/x86/mm/dump_pagetables.c
@@ -380,7 +380,8 @@ bool ptdump_walk_pgd_level_core(struct seq_file *m,
 		.ptdump = {
 			.note_page	= note_page,
 			.effective_prot = effective_prot,
-			.range		= ptdump_ranges
+			.range		= ptdump_ranges,
+			.note_non_leaf  = false
 		},
 		.level = -1,
 		.to_dmesg	= dmesg,
diff --git a/include/linux/ptdump.h b/include/linux/ptdump.h
index 8dbd51ea8626..b3e793a5c77f 100644
--- a/include/linux/ptdump.h
+++ b/include/linux/ptdump.h
@@ -16,6 +16,7 @@ struct ptdump_state {
 			  int level, u64 val);
 	void (*effective_prot)(struct ptdump_state *st, int level, u64 val);
 	const struct ptdump_range *range;
+	bool note_non_leaf;
 };
 
 bool ptdump_walk_pgd_level_core(struct seq_file *m,
diff --git a/mm/ptdump.c b/mm/ptdump.c
index 106e1d66e9f9..97da7a765b22 100644
--- a/mm/ptdump.c
+++ b/mm/ptdump.c
@@ -41,6 +41,9 @@ static int ptdump_pgd_entry(pgd_t *pgd, unsigned long addr,
 	if (st->effective_prot)
 		st->effective_prot(st, 0, pgd_val(val));
 
+	if (st->note_non_leaf && !pgd_leaf(val))
+		st->note_page(st, addr, 0, pgd_val(val));
+
 	if (pgd_leaf(val)) {
 		st->note_page(st, addr, 0, pgd_val(val));
 		walk->action = ACTION_CONTINUE;
@@ -64,6 +67,9 @@ static int ptdump_p4d_entry(p4d_t *p4d, unsigned long addr,
 	if (st->effective_prot)
 		st->effective_prot(st, 1, p4d_val(val));
 
+	if (st->note_non_leaf && !p4d_leaf(val))
+		st->note_page(st, addr, 1, p4d_val(val));
+
 	if (p4d_leaf(val)) {
 		st->note_page(st, addr, 1, p4d_val(val));
 		walk->action = ACTION_CONTINUE;
@@ -87,6 +93,9 @@ static int ptdump_pud_entry(pud_t *pud, unsigned long addr,
 	if (st->effective_prot)
 		st->effective_prot(st, 2, pud_val(val));
 
+	if (st->note_non_leaf && !pud_leaf(val))
+		st->note_page(st, addr, 2, pud_val(val));
+
 	if (pud_leaf(val)) {
 		st->note_page(st, addr, 2, pud_val(val));
 		walk->action = ACTION_CONTINUE;
@@ -108,6 +117,10 @@ static int ptdump_pmd_entry(pmd_t *pmd, unsigned long addr,
 
 	if (st->effective_prot)
 		st->effective_prot(st, 3, pmd_val(val));
+
+	if (st->note_non_leaf && !pmd_leaf(val))
+		st->note_page(st, addr, 3, pmd_val(val));
+
 	if (pmd_leaf(val)) {
 		st->note_page(st, addr, 3, pmd_val(val));
 		walk->action = ACTION_CONTINUE;
-- 
2.39.2

