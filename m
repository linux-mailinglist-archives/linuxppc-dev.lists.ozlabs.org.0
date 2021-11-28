Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1956A4604EE
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Nov 2021 07:27:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J1z706zfsz3cR1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Nov 2021 17:27:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XZk2hdbI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::836;
 helo=mail-qt1-x836.google.com; envelope-from=yury.norov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=XZk2hdbI; dkim-atps=neutral
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J1vnX3X0dz2yfb
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Nov 2021 14:57:20 +1100 (AEDT)
Received: by mail-qt1-x836.google.com with SMTP id a2so12877137qtx.11
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Nov 2021 19:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jzLzZlFUvFeqj4QS59vSNbpytRIoqeqf9/2ASrWiyLI=;
 b=XZk2hdbImcYXcyTC2jMa8yUglMKlAaSa3xH9sAgN8RhIne1RnBqfSUZL708Dj5PShJ
 1QAgIr7OGJSVFq2mZi9yqGYZICTi3cTPrtQ0tOobYJNIG4wvvbUN4d801KAluKhZSNaw
 5kUnpLot57OvMvoht9gsbXIMAs09ng0JZiqnM+0yYWP+TepGtZssa5wn06dX9ufDHnvD
 ZPHBWKdLOu3HgdCy3bnlMuzdGZFZAy+/D4yK35zPune2uhYUFd+hI1kPxLZJWSAJgOhj
 nARVFLZUHE85Uc6xvOKK1lK1j8FJ1rHLaJoLnfMbZbIjECHtDtB3Pw6waYVEs3Vzk86C
 rZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jzLzZlFUvFeqj4QS59vSNbpytRIoqeqf9/2ASrWiyLI=;
 b=GNDWqttMDm15FGeclf31KTkOf85LJVr7f2B+XAQUZzMbygvOf9AfWk6fcMRKUB0qpD
 OzGahBW2HdKGH2y5rmxM+K9BaA2SC1jqJFtpq2zIV0MgzKXrea3SgLqKpOFXW/ppBJ8f
 7KI9kEbLcS7xbsKI8CY1KH4OX2kcexdghIJgqmyh//I+Dn1JdHdjvlCtkSM6o7WaYNas
 2Gp4hfyNbGKItlhlb9E3zziDTE6ADp3s+mVnRyhD+ZVfZD6wwMClb1tawJE++3jSk9Vt
 tJbEWnuCEdL9cFN8IZbluuy5Rzjzh9zJj1Eh1NN/RKElJFfwCujsUDknJG4cDwd1S8UR
 z3Pg==
X-Gm-Message-State: AOAM533juy+Q2zcPEzZRAU7xeocwEK3RC/6uCIrvawQjMPFqFBYjswb5
 4vxMnfMf0JXYTguHBNFvwuM=
X-Google-Smtp-Source: ABdhPJzvsa6ori4gMhvDjxhyLALutssBlk2zYDXBmn3Os/fHY+Flrm1nO4Hm4z35zKEFTRvnBCBPjg==
X-Received: by 2002:ac8:7d84:: with SMTP id c4mr35229985qtd.94.1638071838293; 
 Sat, 27 Nov 2021 19:57:18 -0800 (PST)
Received: from localhost ([66.216.211.25])
 by smtp.gmail.com with ESMTPSA id bj1sm1391494qkb.75.2021.11.27.19.57.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Nov 2021 19:57:18 -0800 (PST)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org, Yury Norov <yury.norov@gmail.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexey Klimov <aklimov@redhat.com>,
 Amitkumar Karwar <amitkarwar@gmail.com>, Andi Kleen <ak@linux.intel.com>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>,
 Andy Gross <agross@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 Andy Shevchenko <andy@infradead.org>, Anup Patel <anup.patel@wdc.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christoph Hellwig <hch@lst.de>, Christoph Lameter <cl@linux.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Hansen <dave.hansen@linux.intel.com>,
 David Airlie <airlied@linux.ie>, David Laight <David.Laight@ACULAB.COM>,
 Dennis Zhou <dennis@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Geetha sowjanya <gakula@marvell.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guo Ren <guoren@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Heiko Carstens <hca@linux.ibm.com>, Ian Rogers <irogers@google.com>,
 Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, Jens Axboe <axboe@fb.com>,
 Jiri Olsa <jolsa@redhat.com>, Jonathan Cameron <jic23@kernel.org>,
 Juri Lelli <juri.lelli@redhat.com>, Kalle Valo <kvalo@codeaurora.org>,
 Kees Cook <keescook@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Lee Jones <lee.jones@linaro.org>, Marc Zyngier <maz@kernel.org>,
 Marcin Wojtas <mw@semihalf.com>, Mark Gross <markgross@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Mel Gorman <mgorman@suse.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Mike Marciniszyn <mike.marciniszyn@cornelisnetworks.com>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Zijlstra <peterz@infradead.org>, Petr Mladek <pmladek@suse.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Roy Pledge <Roy.Pledge@nxp.com>, Russell King <linux@armlinux.org.uk>,
 Saeed Mahameed <saeedm@nvidia.com>, Sagi Grimberg <sagi@grimberg.me>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Solomon Peachy <pizza@shaftnet.org>, Stephen Boyd <sboyd@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Steven Rostedt <rostedt@goodmis.org>,
 Subbaraya Sundeep <sbhatta@marvell.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Sunil Goutham <sgoutham@marvell.com>,
 Tariq Toukan <tariqt@nvidia.com>, Tejun Heo <tj@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Ulf Hansson <ulf.hansson@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Vineet Gupta <vgupta@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, kvm@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 6/9] lib/nodemask: add nodemask_weight_{eq,gt,le}
Date: Sat, 27 Nov 2021 19:57:01 -0800
Message-Id: <20211128035704.270739-7-yury.norov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211128035704.270739-1-yury.norov@gmail.com>
References: <20211128035704.270739-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 28 Nov 2021 17:23:17 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add nodemask_weight_{eq,gt,le} and replace nodemask_weight() where
appropriate. This allows nodemask_weight_*() to return earlier
depending on the condition.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 arch/x86/mm/amdtopology.c    |  2 +-
 arch/x86/mm/numa_emulation.c |  4 ++--
 drivers/acpi/numa/srat.c     |  2 +-
 include/linux/nodemask.h     | 24 ++++++++++++++++++++++++
 mm/mempolicy.c               |  2 +-
 5 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/arch/x86/mm/amdtopology.c b/arch/x86/mm/amdtopology.c
index 058b2f36b3a6..b3ca7d23e4b0 100644
--- a/arch/x86/mm/amdtopology.c
+++ b/arch/x86/mm/amdtopology.c
@@ -154,7 +154,7 @@ int __init amd_numa_init(void)
 		node_set(nodeid, numa_nodes_parsed);
 	}
 
-	if (!nodes_weight(numa_nodes_parsed))
+	if (nodes_empty(numa_nodes_parsed))
 		return -ENOENT;
 
 	/*
diff --git a/arch/x86/mm/numa_emulation.c b/arch/x86/mm/numa_emulation.c
index 1a02b791d273..9a9305367fdd 100644
--- a/arch/x86/mm/numa_emulation.c
+++ b/arch/x86/mm/numa_emulation.c
@@ -123,7 +123,7 @@ static int __init split_nodes_interleave(struct numa_meminfo *ei,
 	 * Continue to fill physical nodes with fake nodes until there is no
 	 * memory left on any of them.
 	 */
-	while (nodes_weight(physnode_mask)) {
+	while (!nodes_empty(physnode_mask)) {
 		for_each_node_mask(i, physnode_mask) {
 			u64 dma32_end = PFN_PHYS(MAX_DMA32_PFN);
 			u64 start, limit, end;
@@ -270,7 +270,7 @@ static int __init split_nodes_size_interleave_uniform(struct numa_meminfo *ei,
 	 * Fill physical nodes with fake nodes of size until there is no memory
 	 * left on any of them.
 	 */
-	while (nodes_weight(physnode_mask)) {
+	while (!nodes_empty(physnode_mask)) {
 		for_each_node_mask(i, physnode_mask) {
 			u64 dma32_end = PFN_PHYS(MAX_DMA32_PFN);
 			u64 start, limit, end;
diff --git a/drivers/acpi/numa/srat.c b/drivers/acpi/numa/srat.c
index 66a0142dc78c..c4f80d2d85bf 100644
--- a/drivers/acpi/numa/srat.c
+++ b/drivers/acpi/numa/srat.c
@@ -67,7 +67,7 @@ int acpi_map_pxm_to_node(int pxm)
 	node = pxm_to_node_map[pxm];
 
 	if (node == NUMA_NO_NODE) {
-		if (nodes_weight(nodes_found_map) >= MAX_NUMNODES)
+		if (nodes_weight_gt(nodes_found_map, MAX_NUMNODES + 1))
 			return NUMA_NO_NODE;
 		node = first_unset_node(nodes_found_map);
 		__acpi_map_pxm_to_node(pxm, node);
diff --git a/include/linux/nodemask.h b/include/linux/nodemask.h
index 567c3ddba2c4..3801ec5b06f4 100644
--- a/include/linux/nodemask.h
+++ b/include/linux/nodemask.h
@@ -38,6 +38,9 @@
  * int nodes_empty(mask)		Is mask empty (no bits sets)?
  * int nodes_full(mask)			Is mask full (all bits sets)?
  * int nodes_weight(mask)		Hamming weight - number of set bits
+ * bool nodes_weight_eq(src, nbits, num) Hamming Weight is equal to num
+ * bool nodes_weight_gt(src, nbits, num) Hamming Weight is greater than num
+ * bool nodes_weight_le(src, nbits, num) Hamming Weight is less than num
  *
  * void nodes_shift_right(dst, src, n)	Shift right
  * void nodes_shift_left(dst, src, n)	Shift left
@@ -240,6 +243,27 @@ static inline int __nodes_weight(const nodemask_t *srcp, unsigned int nbits)
 	return bitmap_weight(srcp->bits, nbits);
 }
 
+#define nodes_weight_eq(nodemask, num) __nodes_weight_eq(&(nodemask), MAX_NUMNODES, (num))
+static inline int __nodes_weight_eq(const nodemask_t *srcp,
+					unsigned int nbits, unsigned int num)
+{
+	return bitmap_weight_eq(srcp->bits, nbits, num);
+}
+
+#define nodes_weight_gt(nodemask, num) __nodes_weight_gt(&(nodemask), MAX_NUMNODES, (num))
+static inline int __nodes_weight_gt(const nodemask_t *srcp,
+					unsigned int nbits, unsigned int num)
+{
+	return bitmap_weight_gt(srcp->bits, nbits, num);
+}
+
+#define nodes_weight_le(nodemask, num) __nodes_weight_le(&(nodemask), MAX_NUMNODES, (num))
+static inline int __nodes_weight_le(const nodemask_t *srcp,
+					unsigned int nbits, unsigned int num)
+{
+	return bitmap_weight_le(srcp->bits, nbits, num);
+}
+
 #define nodes_shift_right(dst, src, n) \
 			__nodes_shift_right(&(dst), &(src), (n), MAX_NUMNODES)
 static inline void __nodes_shift_right(nodemask_t *dstp,
diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index b1fcdb4d25d6..4a48ce5b86cf 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -1154,7 +1154,7 @@ int do_migrate_pages(struct mm_struct *mm, const nodemask_t *from,
 			 *          [0-7] - > [3,4,5] moves only 0,1,2,6,7.
 			 */
 
-			if ((nodes_weight(*from) != nodes_weight(*to)) &&
+			if (!nodes_weight_eq(*from, nodes_weight(*to)) &&
 						(node_isset(s, *to)))
 				continue;
 
-- 
2.25.1

