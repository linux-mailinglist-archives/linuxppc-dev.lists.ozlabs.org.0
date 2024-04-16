Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2058A7996
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Apr 2024 02:06:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=motorola.com header.i=@motorola.com header.a=rsa-sha256 header.s=DKIM202306 header.b=HUJud35s;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VK1Qy5jm9z3vXT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Apr 2024 10:06:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=motorola.com header.i=@motorola.com header.a=rsa-sha256 header.s=DKIM202306 header.b=HUJud35s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=motorola.com (client-ip=148.163.148.104; helo=mx0a-00823401.pphosted.com; envelope-from=mbland@motorola.com; receiver=lists.ozlabs.org)
Received: from mx0a-00823401.pphosted.com (mx0a-00823401.pphosted.com [148.163.148.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VK0kw1gyBz30Kd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Apr 2024 09:35:02 +1000 (AEST)
Received: from pps.filterd (m0355086.ppops.net [127.0.0.1])
	by mx0a-00823401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43GFWY7R014135;
	Tue, 16 Apr 2024 17:12:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=motorola.com; h=
	message-id:in-reply-to:references:to:cc:date:from; s=DKIM202306;
	 bh=+0oKsuxOJ+ao+KImx0m/FxKr962etjTELMfZAVNTvR0=; b=HUJud35sONT3
	12p5bcMnws6f9rYRgcVlt4KyduO+HKJrcwuWnQFyp4ttaKrplmKIZCJO7QAHussz
	H1JDq3AQAX2O917Y2Tso21atXf7jJrUEAlleRF6ynAEBMUIjBrGcSAZSrv6v2lI4
	qDTMb+reewQi4cDuQ24UI/bj1/eAUF8x7Fefq3Qu9rBorSHsAX/mJW+cW7/5k/ZW
	zx5QcNrBjKgIEiy4AZKILeAvA1e3L+GNU8GGdGXsAXuCgGhj6vLDExaCRSht/Do3
	4C/UtZEAMpMG66zyM8feuC+GuKi0Wgg4KckxQS/INHpjcM37PInnPqxfrfuNg+N5
	JPxWLri1lQ==
Received: from va32lpfpp04.lenovo.com ([104.232.228.24])
	by mx0a-00823401.pphosted.com (PPS) with ESMTPS id 3xh8qsv4vg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Apr 2024 17:12:42 +0000 (GMT)
Received: from va32lmmrp01.lenovo.com (va32lmmrp01.mot.com [10.62.177.113])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by va32lpfpp04.lenovo.com (Postfix) with ESMTPS id 4VJrFj1NRGzj9hF;
	Tue, 16 Apr 2024 17:12:41 +0000 (UTC)
Received: from ilclbld243.mot.com (ilclbld243.mot.com [100.64.22.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mbland)
	by va32lmmrp01.lenovo.com (Postfix) with ESMTPSA id 4VJrFj0wt7z2VZS6;
	Tue, 16 Apr 2024 17:12:41 +0000 (UTC)
Message-Id: <20240416120827.062020959-6-mbland@motorola.com>
In-Reply-To: <20240416120827.062020959-1-mbland@motorola.com>
References: <20240416120827.062020959-1-mbland@motorola.com>
To: linux-mm@kvack.org
Date: Tue, 16 Apr 2024 17:12:41 +0000 (UTC)
From: mbland@motorola.com
X-Proofpoint-GUID: P1eiHsdOlOVx1OG-b5rNCTNCTl9E_MmU
X-Proofpoint-ORIG-GUID: P1eiHsdOlOVx1OG-b5rNCTNCTl9E_MmU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-16_14,2024-04-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0 phishscore=0
 suspectscore=0 malwarescore=0 clxscore=1011 spamscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404160107
X-Mailman-Approved-At: Wed, 17 Apr 2024 10:05:40 +1000
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
Cc: Maxwell Bland <mbland@motorola.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Catalin Marinas <catalin.marinas@arm.com>,
Will Deacon <will@kernel.org>,
Michael Ellerman <mpe@ellerman.id.au>,
Nicholas Piggin <npiggin@gmail.com>,
Christophe Leroy <christophe.leroy@csgroup.eu>,
"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
Paul Walmsley <paul.walmsley@sifive.com>,
Palmer Dabbelt <palmer@dabbelt.com>,
Albert Ou <aou@eecs.berkeley.edu>,
Alexander Gordeev <agordeev@linux.ibm.com>,
Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
Heiko Carstens <hca@linux.ibm.com>,
Vasily Gorbik <gor@linux.ibm.com>,
Christian Borntraeger <borntraeger@linux.ibm.com>,
Sven Schnelle <svens@linux.ibm.com>,
Dave Hansen <dave.hansen@linux.intel.com>,
Andy Lutomirski <luto@kernel.org>,
Peter Zijlstra <peterz@infradead.org>,
Thomas Gleixner <tglx@linutronix.de>,
Ingo Molnar <mingo@redhat.com>,
Borislav Petkov <bp@alien8.de>,
x86@kernel.org,
"H. Peter Anvin" <hpa@zytor.com>,
Andrew Morton <akpm@linux-foundation.org>,
Ard Biesheuvel <ardb@kernel.org>,
Mark Rutland <mark.rutland@arm.com>,
Maxwell Bland <mbland@motorola.com>,
Alexandre Ghiti <alexghiti@rivosinc.com>,
Yu Chien Peter Lin <peterlin@andestech.com>,
Song Shuai <suagrfillet@gmail.com>,
linux-arm-kernel@lists.infradead.org,
linux-kernel@vger.kernel.org,
linuxppc-dev@lists.ozlabs.org,
linux-riscv@lists.infradead.org,
linux-s390@vger.kernel.org
From: Maxwell Bland <mbland@motorola.com>
Date: Mon, 15 Apr 2024 14:51:32 -0500
Subject: [PATCH 5/5] ptdump: add state parameter for non-leaf callback

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

