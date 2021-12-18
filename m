Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F3B479DA0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Dec 2021 22:49:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JGfcr6CYtz3bhh
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Dec 2021 08:49:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YQxoC6k8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::234;
 helo=mail-oi1-x234.google.com; envelope-from=yury.norov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=YQxoC6k8; dkim-atps=neutral
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JGf0h063Gz2yLX
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Dec 2021 08:21:07 +1100 (AEDT)
Received: by mail-oi1-x234.google.com with SMTP id q25so9435685oiw.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Dec 2021 13:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=4RN3kEyYZIUbVI8zbTA6/50Tm8Aie4ofxliWXaj5zzI=;
 b=YQxoC6k8cQ7kYClCwpVsfWWkBeb0lNCqOp+9jiaYb/x+5POwS9ABXWLPczVNlPCEzM
 iIHk+DzsjobRVCOlcC5XIikxxNxu5X/zaitga1umEIZCudyfpgSlCL7IQ38S7I467MHo
 pPRd3mGKnvvRiH7Kt5Sy8bEpLpHHxMLS79H6P18S/OWezxc8Qwp2CHDYEydPIFnIv0x5
 VcXpAYuGmxjUSgIfiyTeTuXnJrVXxQbs3XD4EhmGr5lZt2cuYbt1zrSxB7wNMUdtcoFY
 RjhzErjDlzWwlTmVjAk+PBKifp+nLo5LNJz73PCLWdF08B6e3IpAf6fIRMZDIp6xjPQz
 h1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4RN3kEyYZIUbVI8zbTA6/50Tm8Aie4ofxliWXaj5zzI=;
 b=W/6UGLD6HyK8NEc/Y/OyejnTz5wqwzFmIDuNqJXA8dbz2B/N1zRwShp+7rF9AfgvKp
 NAm3gHuT9umvIRlr06hg9VjzjPmFrKZ/FoU08/1Ov2PKWUMjyJ43n4Y/1Ig3OoXwuUWk
 Q+ba4toZbu5jnzJ2kXZUZhCHuCSK+/NHnzOQu58ID5zVUCuoDTMNF9N83Soj5WHVNqra
 xLR6A56q5vGdm01387YdkU6RDnB+BOWbg6fyXjEUfHXj7ZG+ELzkeO9dF0umvYWjm+oy
 z3uNiZuuJzFTfWqXQWjgRjOBefBFUDxzrazT9B3wQq+hBED5HEUkLgsqKSk0e+PugpLT
 B+jA==
X-Gm-Message-State: AOAM530oReYKUxI/VzJN4/24HrPe8+sPcSXIlQxanLmICNHXetMy6ykN
 F7DXWeTFyrMuYj1oYuB+yDg=
X-Google-Smtp-Source: ABdhPJyJ7o57fml/hco056UTSNVqP6S+b5PlRmb4MutSKjwWJkbs3cpttoLjNt0j+pq04ePN93Dndw==
X-Received: by 2002:aca:674a:: with SMTP id b10mr7011112oiy.66.1639862465447; 
 Sat, 18 Dec 2021 13:21:05 -0800 (PST)
Received: from localhost (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id n26sm2374672ooc.48.2021.12.18.13.21.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 13:21:05 -0800 (PST)
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
Subject: [PATCH 15/17] kernel/cpu: add num_active_cpu counter
Date: Sat, 18 Dec 2021 13:20:11 -0800
Message-Id: <20211218212014.1315894-16-yury.norov@gmail.com>
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

Similarly to the online cpus, the cpu_active_mask is actively used
in the kernel. This patch adds a counter for active cpus, so that
users that call num_active_cpus() would know the result immediately,
instead of calling the bitmap_weight for the mask.

Suggested-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 include/linux/cpumask.h | 26 +++++++++++++++-----------
 kernel/cpu.c            | 15 +++++++++++++++
 2 files changed, 30 insertions(+), 11 deletions(-)

diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
index c2a9d15e2cbd..0add872898f8 100644
--- a/include/linux/cpumask.h
+++ b/include/linux/cpumask.h
@@ -101,6 +101,7 @@ extern struct cpumask __cpu_dying_mask;
 extern atomic_t __num_online_cpus;
 extern atomic_t __num_possible_cpus;
 extern atomic_t __num_present_cpus;
+extern atomic_t __num_active_cpus;
 
 extern cpumask_t cpus_booted_once_mask;
 
@@ -875,17 +876,8 @@ void init_cpu_online(const struct cpumask *src);
 void set_cpu_possible(unsigned int cpu, bool possible);
 void reset_cpu_possible_mask(void);
 void set_cpu_present(unsigned int cpu, bool present);
-
 void set_cpu_online(unsigned int cpu, bool online);
-
-static inline void
-set_cpu_active(unsigned int cpu, bool active)
-{
-	if (active)
-		cpumask_set_cpu(cpu, &__cpu_active_mask);
-	else
-		cpumask_clear_cpu(cpu, &__cpu_active_mask);
-}
+void set_cpu_active(unsigned int cpu, bool active);
 
 static inline void
 set_cpu_dying(unsigned int cpu, bool dying)
@@ -971,7 +963,19 @@ static inline unsigned int num_present_cpus(void)
 {
 	return atomic_read(&__num_present_cpus);
 }
-#define num_active_cpus()	cpumask_weight(cpu_active_mask)
+
+/**
+ * num_active_cpus() - Read the number of active CPUs
+ *
+ * Despite the fact that __num_active_cpus is of type atomic_t, this
+ * interface gives only a momentary snapshot and is not protected against
+ * concurrent CPU hotplug operations unless invoked from a cpuhp_lock held
+ * region.
+ */
+static inline unsigned int num_active_cpus(void)
+{
+	return atomic_read(&__num_active_cpus);
+}
 
 static inline bool cpu_online(unsigned int cpu)
 {
diff --git a/kernel/cpu.c b/kernel/cpu.c
index 1f7ea1bdde1a..62b411d88810 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -2603,6 +2603,9 @@ EXPORT_SYMBOL(__num_present_cpus);
 struct cpumask __cpu_active_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_active_mask);
 
+atomic_t __num_active_cpus __read_mostly;
+EXPORT_SYMBOL(__num_active_cpus);
+
 struct cpumask __cpu_dying_mask __read_mostly;
 EXPORT_SYMBOL(__cpu_dying_mask);
 
@@ -2678,6 +2681,18 @@ void set_cpu_present(unsigned int cpu, bool present)
 }
 EXPORT_SYMBOL(set_cpu_present);
 
+void set_cpu_active(unsigned int cpu, bool active)
+{
+	if (active) {
+		if (!cpumask_test_and_set_cpu(cpu, &__cpu_active_mask))
+			atomic_inc(&__num_active_cpus);
+	} else {
+		if (cpumask_test_and_clear_cpu(cpu, &__cpu_active_mask))
+			atomic_dec(&__num_active_cpus);
+	}
+}
+EXPORT_SYMBOL(set_cpu_active);
+
 /*
  * Activate the first processor.
  */
-- 
2.30.2

