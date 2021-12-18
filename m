Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A4C479DA7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Dec 2021 22:49:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JGfdb1RW9z3cnT
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Dec 2021 08:49:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RKeJvy+T;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32e;
 helo=mail-ot1-x32e.google.com; envelope-from=yury.norov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=RKeJvy+T; dkim-atps=neutral
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JGf0l1mNYz2ynV
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Dec 2021 08:21:11 +1100 (AEDT)
Received: by mail-ot1-x32e.google.com with SMTP id
 35-20020a9d08a6000000b00579cd5e605eso7535929otf.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Dec 2021 13:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=cEbjV/8Ctr1QdXazsGfe+PbDs+iZrrBmmo9YNkbLBy0=;
 b=RKeJvy+TVkzSfE1DWFH8SBdk923FOhJaAQ0Dv9PrOLQIHftv5DaeBCB4tNKlvmYIPN
 nbkzjP+1Trtphdpdl224Vn1sYOGVLTg43YwIfJM5nH7KPfFHi7vCRPN0TaIMV0CuMzT2
 orCQwO8bJ9qk1nVA1GCOdVDNRIyHknNBzcXqS9rgvqtOTbjhHhWXGI5No2Z0UTz3TByx
 0Ag3UOeLtIQjs7s0rKEZ/24IhDlJLiBtoBDajcozUIGSHrQXSkW6AtgOu9kPk/Lq3qoc
 U8VDenhPvveU8b2bWmVJzG2Nt6HLvQlM90dIQDx+rucC4nLouHJTrpPqTNt21VK+DFl2
 nNhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cEbjV/8Ctr1QdXazsGfe+PbDs+iZrrBmmo9YNkbLBy0=;
 b=ffdx+MtXJgSQI27YWJA/pgbxaOOv1uGnzezSVSgJ5IDl+23qJVUPDDu9r0pA1TF01y
 +HG4SAdfE7l1bkAdy8o/oh38LwUZWSX4hVxxfFXdCBA2j12biXYiazjNy0cWizYk+HNM
 ZVd1LgYcyhJbZq/9mIL+3r6KY6kLR7cxjSu0U09D7e5yLosBnLZLRfSOxj0Nnt/T1hmP
 f4s1Ssebrzkhul2MF6dToblWMP9N7ttX9HVEmbN5c15EA+tqrVgIU1Hzue8xlputpokV
 3epVMXiTu1IDovVtK3Jwkk4CGiU8fvQGSsmpuOB6ItSJjww9hgbFFRbHiPaGxOJZjVxO
 bnGw==
X-Gm-Message-State: AOAM530pKkzE1He7rSVzoIKE0Avy0Op6eqqhIDml+Ky6TYrp3gep+Tmi
 iBi8fOmdVCskN3mrzHXpWwQ=
X-Google-Smtp-Source: ABdhPJwWLUowWO6z/6XzIWLGx6yfCwM40JettYuf4PfjeM7nkzCXO3jf+T1ejyUHBwjqYOIYE68+UA==
X-Received: by 2002:a9d:82a:: with SMTP id 39mr6499375oty.282.1639862468685;
 Sat, 18 Dec 2021 13:21:08 -0800 (PST)
Received: from localhost (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id b17sm2560486ots.66.2021.12.18.13.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 13:21:08 -0800 (PST)
From: Yury Norov <yury.norov@gmail.com>
To: linux-kernel@vger.kernel.org, Yury Norov <yury.norov@gmail.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
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
 Dennis Zhou <dennis@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Geetha sowjanya <gakula@marvell.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guo Ren <guoren@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Heiko Carstens <hca@linux.ibm.com>, Ian Rogers <irogers@google.com>,
 Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, Jens Axboe <axboe@fb.com>,
 Jiri Olsa <jolsa@redhat.com>, Joe Perches <joe@perches.com>,
 Jonathan Cameron <jic23@kernel.org>, Juri Lelli <juri.lelli@redhat.com>,
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
 Russell King <linux@armlinux.org.uk>, Saeed Mahameed <saeedm@nvidia.com>,
 Sagi Grimberg <sagi@grimberg.me>,
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
Subject: [PATCH 16/17] tools/bitmap: sync bitmap_weight
Date: Sat, 18 Dec 2021 13:20:12 -0800
Message-Id: <20211218212014.1315894-17-yury.norov@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211218212014.1315894-1-yury.norov@gmail.com>
References: <20211218212014.1315894-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 19 Dec 2021 08:39:01 +1100
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

Pull bitmap_weight_{cmp,eq,gt,ge,lt,le} from mother kernel and
use where applicable.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 tools/include/linux/bitmap.h | 44 ++++++++++++++++++++++++++++++++++++
 tools/lib/bitmap.c           | 20 ++++++++++++++++
 tools/perf/util/pmu.c        |  2 +-
 3 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/tools/include/linux/bitmap.h b/tools/include/linux/bitmap.h
index ea97804d04d4..e8ae9a85d555 100644
--- a/tools/include/linux/bitmap.h
+++ b/tools/include/linux/bitmap.h
@@ -12,6 +12,8 @@
 	unsigned long name[BITS_TO_LONGS(bits)]
 
 int __bitmap_weight(const unsigned long *bitmap, int bits);
+int __bitmap_weight_cmp(const unsigned long *bitmap, unsigned int bits,
+			 unsigned int num);
 void __bitmap_or(unsigned long *dst, const unsigned long *bitmap1,
 		 const unsigned long *bitmap2, int bits);
 int __bitmap_and(unsigned long *dst, const unsigned long *bitmap1,
@@ -68,6 +70,48 @@ static inline int bitmap_weight(const unsigned long *src, unsigned int nbits)
 	return __bitmap_weight(src, nbits);
 }
 
+static __always_inline
+int bitmap_weight_cmp(const unsigned long *src, unsigned int nbits, int num)
+{
+	if (num > (int)nbits || num < 0)
+		return -num;
+
+	if (small_const_nbits(nbits))
+		return hweight_long(*src & BITMAP_LAST_WORD_MASK(nbits)) - num;
+
+	return __bitmap_weight_cmp(src, nbits, num);
+}
+
+static __always_inline
+bool bitmap_weight_eq(const unsigned long *src, unsigned int nbits, int num)
+{
+	return bitmap_weight_cmp(src, nbits, num) == 0;
+}
+
+static __always_inline
+bool bitmap_weight_gt(const unsigned long *src, unsigned int nbits, int num)
+{
+	return bitmap_weight_cmp(src, nbits, num) > 0;
+}
+
+static __always_inline
+bool bitmap_weight_ge(const unsigned long *src, unsigned int nbits, int num)
+{
+	return bitmap_weight_cmp(src, nbits, num - 1) > 0;
+}
+
+static __always_inline
+bool bitmap_weight_lt(const unsigned long *src, unsigned int nbits, int num)
+{
+	return bitmap_weight_cmp(src, nbits, num - 1) <= 0;
+}
+
+static __always_inline
+bool bitmap_weight_le(const unsigned long *src, unsigned int nbits, int num)
+{
+	return bitmap_weight_cmp(src, nbits, num) <= 0;
+}
+
 static inline void bitmap_or(unsigned long *dst, const unsigned long *src1,
 			     const unsigned long *src2, unsigned int nbits)
 {
diff --git a/tools/lib/bitmap.c b/tools/lib/bitmap.c
index db466ef7be9d..06e58fee8523 100644
--- a/tools/lib/bitmap.c
+++ b/tools/lib/bitmap.c
@@ -18,6 +18,26 @@ int __bitmap_weight(const unsigned long *bitmap, int bits)
 	return w;
 }
 
+int __bitmap_weight_cmp(const unsigned long *bitmap, unsigned int bits, int num)
+{
+	unsigned int k, w, lim = bits / BITS_PER_LONG;
+
+	for (k = 0, w = 0; k < lim; k++) {
+		if (w + bits - k * BITS_PER_LONG < num)
+			goto out;
+
+		w += hweight_long(bitmap[k]);
+
+		if (w > num)
+			goto out;
+	}
+
+	if (bits % BITS_PER_LONG)
+		w += hweight_long(bitmap[k] & BITMAP_LAST_WORD_MASK(bits));
+out:
+	return w - num;
+}
+
 void __bitmap_or(unsigned long *dst, const unsigned long *bitmap1,
 		 const unsigned long *bitmap2, int bits)
 {
diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index 6ae58406f4fc..015ee1321c7c 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -1314,7 +1314,7 @@ static int pmu_config_term(const char *pmu_name,
 	 */
 	if (term->type_val == PARSE_EVENTS__TERM_TYPE_NUM) {
 		if (term->no_value &&
-		    bitmap_weight(format->bits, PERF_PMU_FORMAT_BITS) > 1) {
+		    bitmap_weight_gt(format->bits, PERF_PMU_FORMAT_BITS, 1)) {
 			if (err) {
 				parse_events_error__handle(err, term->err_val,
 					   strdup("no value assigned for term"),
-- 
2.30.2

