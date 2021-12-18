Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D3E479D84
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Dec 2021 22:48:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JGfc727Ckz3dnH
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Dec 2021 08:48:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IIMnrKu1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::230;
 helo=mail-oi1-x230.google.com; envelope-from=yury.norov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=IIMnrKu1; dkim-atps=neutral
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JGf0c6H3Xz2yPD
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Dec 2021 08:21:04 +1100 (AEDT)
Received: by mail-oi1-x230.google.com with SMTP id be32so9311902oib.11
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Dec 2021 13:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ZG1Hs62u68C5ALHAshDdD3Z6hgReTGi0eu0fnhr5AEs=;
 b=IIMnrKu1E+8J4ZeqIVFH4MIk+q707s4MTfXZMSHu7EsoSEaHXz6Xdcyp2j22iBGRbw
 WVHVFtLogRqg/mGYdxkJxTg1IZGqZrXfKAFHvN0SWyjvRKWVp2T/DFgrLVfndTJrfq2u
 OwC9HVCN/kSFoZV+Kt3qvSFSLRRXYLNLYsAXekXr654BC7f14NeaRIzjiQBBILSD3qyj
 HBL/MEAh3jwy7tfBsIQxRy8T/fhSamJaDFD5J49R6eZuWJv1xKEfJ4rEwC5POkESFzri
 oaICpv9ciOKT7yj04uxRt9vA6WWjGWqFCOU3UqGCbRh1xAC0FuFqTq7fyF8WHavhh7BP
 l2Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZG1Hs62u68C5ALHAshDdD3Z6hgReTGi0eu0fnhr5AEs=;
 b=RQJELINr/vYcGC06oajjMWeKwS6pTsE1eT+W057NQCnyI65KpBQ1piy8xggNYhTi9J
 gTX4OJRHw9GWX3FNNk2JdWo8Txd6K9vWDFTjg0TAduW2yTWmkwoYWocWTagD0DDxpB5D
 DbvIODjS8KILrJxB38G2UqDoDFaCf5jAmMYbZxisq9X5n7RQfJ2icAHZ7wXf7Cz4lw8a
 cuVk4msU0o29TTO1Y9TZlbwKGd5FxUV49iLLwjuso+k9XsJEHkegSQqyd+DlGt+29cSG
 pOm6Uvt0cqkjSV3O3r9F8KsgH4QpvFXID9XeO59olOu5eAgOJ+/bd/T9/o0yb1092DdD
 GXUQ==
X-Gm-Message-State: AOAM530T62vqbNv5dYUSHffmiBVNFTtWrBoIXA7yj3Mtj6Et6m4LIU7B
 PfkuYF+iedcgV2s0GTmb6UE=
X-Google-Smtp-Source: ABdhPJzk/ppqcCd39lkFC0tyQzboJ0USG4d79V7IO5XKOSDBVZhakYMUNSWF7GIAyJsgsStLI/YQiw==
X-Received: by 2002:a54:4e0c:: with SMTP id a12mr6723576oiy.12.1639862462273; 
 Sat, 18 Dec 2021 13:21:02 -0800 (PST)
Received: from localhost (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id i29sm2386537ots.49.2021.12.18.13.21.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 13:21:02 -0800 (PST)
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
Subject: [PATCH 14/17] kernel/cpu: add num_present_cpu counter
Date: Sat, 18 Dec 2021 13:20:10 -0800
Message-Id: <20211218212014.1315894-15-yury.norov@gmail.com>
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

Similarly to the online cpus, the cpu_present_mask is actively used
in the kernel. This patch adds a counter for present cpus, so that
users that call num_present_cpus() would know the result immediately,
instead of calling the bitmap_weight for the mask.

Suggested-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 include/linux/cpumask.h | 25 +++++++++++++++----------
 kernel/cpu.c            | 16 ++++++++++++++++
 2 files changed, 31 insertions(+), 10 deletions(-)

diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
index 0be2504d8e4c..c2a9d15e2cbd 100644
--- a/include/linux/cpumask.h
+++ b/include/linux/cpumask.h
@@ -100,6 +100,7 @@ extern struct cpumask __cpu_dying_mask;
 
 extern atomic_t __num_online_cpus;
 extern atomic_t __num_possible_cpus;
+extern atomic_t __num_present_cpus;
 
 extern cpumask_t cpus_booted_once_mask;
 
@@ -873,15 +874,7 @@ void init_cpu_online(const struct cpumask *src);
 
 void set_cpu_possible(unsigned int cpu, bool possible);
 void reset_cpu_possible_mask(void);
-
-static inline void
-set_cpu_present(unsigned int cpu, bool present)
-{
-	if (present)
-		cpumask_set_cpu(cpu, &__cpu_present_mask);
-	else
-		cpumask_clear_cpu(cpu, &__cpu_present_mask);
-}
+void set_cpu_present(unsigned int cpu, bool present);
 
 void set_cpu_online(unsigned int cpu, bool online);
 
@@ -965,7 +958,19 @@ static inline unsigned int num_possible_cpus(void)
 {
 	return atomic_read(&__num_possible_cpus);
 }
-#define num_present_cpus()	cpumask_weight(cpu_present_mask)
+
+/**
+ * num_present_cpus() - Read the number of present CPUs
+ *
+ * Despite the fact that __num_present_cpus is of type atomic_t, this
+ * interface gives only a momentary snapshot and is not protected against
+ * concurrent CPU hotplug operations unless invoked from a cpuhp_lock held
+ * region.
+ */
+static inline unsigned int num_present_cpus(void)
+{
+	return atomic_read(&__num_present_cpus);
+}
 #define num_active_cpus()	cpumask_weight(cpu_active_mask)
 
 static inline bool cpu_online(unsigned int cpu)
diff --git a/kernel/cpu.c b/kernel/cpu.c
index a0a815911173..1f7ea1bdde1a 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -2597,6 +2597,9 @@ EXPORT_SYMBOL(__cpu_online_mask);
 struct cpumask __cpu_present_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_present_mask);
 
+atomic_t __num_present_cpus __read_mostly;
+EXPORT_SYMBOL(__num_present_cpus);
+
 struct cpumask __cpu_active_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_active_mask);
 
@@ -2609,6 +2612,7 @@ EXPORT_SYMBOL(__num_online_cpus);
 void init_cpu_present(const struct cpumask *src)
 {
 	cpumask_copy(&__cpu_present_mask, src);
+	atomic_set(&__num_present_cpus, cpumask_weight(cpu_present_mask));
 }
 
 void init_cpu_possible(const struct cpumask *src)
@@ -2662,6 +2666,18 @@ void set_cpu_possible(unsigned int cpu, bool possible)
 }
 EXPORT_SYMBOL(set_cpu_possible);
 
+void set_cpu_present(unsigned int cpu, bool present)
+{
+	if (present) {
+		if (!cpumask_test_and_set_cpu(cpu, &__cpu_present_mask))
+			atomic_inc(&__num_present_cpus);
+	} else {
+		if (cpumask_test_and_clear_cpu(cpu, &__cpu_present_mask))
+			atomic_dec(&__num_present_cpus);
+	}
+}
+EXPORT_SYMBOL(set_cpu_present);
+
 /*
  * Activate the first processor.
  */
-- 
2.30.2

