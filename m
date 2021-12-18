Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6295E479D7D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Dec 2021 22:46:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JGfYw2Lgfz3f2M
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Dec 2021 08:46:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Y7D3jg2n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c34;
 helo=mail-oo1-xc34.google.com; envelope-from=yury.norov@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Y7D3jg2n; dkim-atps=neutral
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JGf0R2cR2z2yHj
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Dec 2021 08:20:55 +1100 (AEDT)
Received: by mail-oo1-xc34.google.com with SMTP id
 e17-20020a4a8291000000b002c5ee0645e7so1845199oog.2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Dec 2021 13:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=8sQyawONQ80DXJHmSDH3px/iwXnd508qWqR9G9S67zc=;
 b=Y7D3jg2nDdCluAFdaTzJ62WKeS2c+dtTaPmJUlV/zLE1aSF//0E3P38R+G4jEFET14
 xlE85wW7isyGuED/jOFVFQvwYzXv8BywpI00ruh0C9/BSkGpvfRpAFWq2F7h9v3+T5Il
 nblHP1zg9vVDXpyvwm44ndVFUUN5IjDhNlidNZbD5SDaUDw8vepg+0zNLqjNDTZ/05Nb
 X9u9YW1l3M1V6kBMEhcffptynzQERZgT84KYgY25ZHoJxBBze+XJLuZ0xAF092dd7tRz
 6Y9FD4MNstMB4NsMQkO+4hI6cQ1T/LuAF9uOZ/g+OPTNQBpwcWpSAFUUj7M8IYKHH6om
 iwjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8sQyawONQ80DXJHmSDH3px/iwXnd508qWqR9G9S67zc=;
 b=gu4/SW258PD03LETCjAVy0sb9pgF5LU1DEiewmgJfk+8kGw23xqQNdfSLcNOUmxYHR
 /exe7WH1zRx+SMVkKauUghOSbCGcEtKeqjkwBkmI5Zo5Li3Z/T4s5qoV0IbzrzOihPEi
 d6QtuwDLxq7EhG+/Ez3vIaEehW4KGw+jaNbq+rLYEWOprtqhaQtN8yNBUD3w6wn6LDjw
 kk2OwSf12Hl7AiC0b8vbieCOWCW/T+RHBKfTmUnbwbS5hP3KfiEAz7cKgXzl0g9887SV
 IlWyoyk3EVDgX6I0b1Bc4lOtd2MrUKxyfqGl8I7V78IHv2/fexip/fC882MPDHXg9rAE
 7RpA==
X-Gm-Message-State: AOAM532Af/sock40TMx6gXuicg+zogwt6o7QcT1bHUL18D67tXja698R
 YGYJdgRh1GlVIuBx9XypRDM=
X-Google-Smtp-Source: ABdhPJzvMncW7wCzGcCD5Uph699Rv7l1timnKLBDwWV9dbECCxOkiUPt5sqsHR2cKsTF/R/b2ELz2Q==
X-Received: by 2002:a4a:acca:: with SMTP id c10mr5895528oon.1.1639862452856;
 Sat, 18 Dec 2021 13:20:52 -0800 (PST)
Received: from localhost (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id q10sm2488824oiw.17.2021.12.18.13.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 13:20:52 -0800 (PST)
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
Subject: [PATCH 11/17] lib/nodemask: add num_node_state_eq()
Date: Sat, 18 Dec 2021 13:20:07 -0800
Message-Id: <20211218212014.1315894-12-yury.norov@gmail.com>
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

Kernel code calls num_node_state() to compare number of nodes with a given
number. The underlying code calls bitmap_weight(), and we can do it more
efficiently with num_node_state_eq because conditional nodes_weight may
stop traversing the nodemask earlier, as soon as condition is met.

Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 include/linux/nodemask.h | 5 +++++
 mm/page_alloc.c          | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/linux/nodemask.h b/include/linux/nodemask.h
index 197598e075e9..c5014dbf3cce 100644
--- a/include/linux/nodemask.h
+++ b/include/linux/nodemask.h
@@ -466,6 +466,11 @@ static inline int num_node_state(enum node_states state)
 	return nodes_weight(node_states[state]);
 }
 
+static inline int num_node_state_eq(enum node_states state, int num)
+{
+	return nodes_weight_eq(node_states[state], num);
+}
+
 #define for_each_node_state(__node, __state) \
 	for_each_node_mask((__node), node_states[__state])
 
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index edfd6c81af82..71f5652828b8 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -8323,7 +8323,7 @@ void __init page_alloc_init(void)
 	int ret;
 
 #ifdef CONFIG_NUMA
-	if (num_node_state(N_MEMORY) == 1)
+	if (num_node_state_eq(N_MEMORY, 1))
 		hashdist = 0;
 #endif
 
-- 
2.30.2

