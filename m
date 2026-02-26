Return-Path: <linuxppc-dev+bounces-17299-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAXxEF5joGk0jAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17299-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 16:14:38 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5586C1A85F8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 16:14:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMFLK45gdz3cZj;
	Fri, 27 Feb 2026 02:12:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772118729;
	cv=none; b=NqYEkqLfJyRkcMV16Q2oCVep3yYXYxbADItvPgcs4z/HUa4VieOlgKUbb5t5taas9E+CFT/ZVV4zTDdNLPutXP1Q2+Krz5Xv6jOl5eVfecwrLUE+89MwRsQfL1ne25gr23agitcjxoe3ZQ4VAC5JMjWlOpepPCQaQoAUPAs768BQPmRnFqmaJSqA+aYhY2jBr6pGLoyULJxdc1pqlTOyIlHc1PQB8v2gB+sSe7fksxKK9Ep0Ma/7FFzBJQC6gyV8RzoQwSf4VF3rziEJZvZgRP7AW/7Fcz4lFnXz1oqAa5aC2jPHw++lesejUwhHm32fiDmtCNKPoEmPglv/nYO2Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772118729; c=relaxed/relaxed;
	bh=pTdUEl8wkKA23Mw4Qdu3YQ7HfEMCp1HEM50sIH6JtDU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iDZ/u4BZF/87LBjWNplkRTt3pT28kM0Qsu+dcaQWXa+3571KJMuD7CwOry3xGk0CPlaMF+5oA1GvfQywwXT1n1AoOpDi/ZGSiKY3q64BMJ3YP7sWxWL38wHfxMoUCKbQF5n4ty5+PHGylGii+ijxafpeoRYtnpJ9i4tIM324mZ5L7bDu/CGMsuvVqBYKStzREehSLQlQMN7wWgLksSNVAUPx3WxWKpuU9WijNv7bDdRmLw8/DNujMdW77ybqGNuQZrnve00LKKHnAwGqGSmsVkVhssCKlr1R8Ah3XYCKvCyYt3cyJ1611kdJqX6Imj+MTjFI7bvytKxu9nnmnGc7tg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=lst.de; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q6Sf2GbK; dkim-atps=neutral; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+c5cab09b19de097b6dd3+8222+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q6Sf2GbK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+c5cab09b19de097b6dd3+8222+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMFLJ4C8Xz3cZh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 02:12:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=pTdUEl8wkKA23Mw4Qdu3YQ7HfEMCp1HEM50sIH6JtDU=; b=Q6Sf2GbKDjsbGSi1KkJiJlk5Ms
	dUyoHMIGXOJK79BRmjwIZTvYTPRWS33qpsS5nEbaR67tKUfuNmSQgDYF1YQ14Z6Pcok9XvPX+OTfb
	BY2Yfc3/Plt4Z+9zi0P/mix4TFudlpQPekYEpvvyloSkCZJlCM+4wgwNf2HzUlEw5qDDbQ6wDRZwM
	UBhNzprBe508a9n21DkoCribtZA58LzOJ5hDsUMnmfPUFcC+P9MwRgYVh7qlbU3vUJpQFdGSc8R9u
	yVpaP9XV08YoMbh/InEP/hbb+KTIGdo0shTzeO1Gwt034nGsOG18dz13EXlhi0T+auh6rHe9ooKQV
	2vD+SukA==;
Received: from [4.28.11.157] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvd1e-00000006Qb4-1pd5;
	Thu, 26 Feb 2026 15:11:40 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Dan Williams <dan.j.williams@intel.com>,
	Chris Mason <clm@fb.com>,
	David Sterba <dsterba@suse.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Song Liu <song@kernel.org>,
	Yu Kuai <yukuai@fnnas.com>,
	Li Nan <linan122@huawei.com>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-raid@vger.kernel.org
Subject: [PATCH 20/25] xor: make xor.ko self-contained in lib/raid/
Date: Thu, 26 Feb 2026 07:10:32 -0800
Message-ID: <20260226151106.144735-21-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260226151106.144735-1-hch@lst.de>
References: <20260226151106.144735-1-hch@lst.de>
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
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.11 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17299-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:richard.henderson@linaro.org,m:mattst88@gmail.com,m:linmag7@gmail.com,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:davem@davemloft.net,m:andreas@gaisler.com,m:richard@nod.at,m:anton.ivanov@cambridgegreys.com,m:johannes@sipsolutions.net,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:herbert@gondor.apana.org.au,m:dan.j.williams@intel.com,m:clm@fb.com,m:dsterba@suse.com,m:arnd@arndb.de,m:song@kernel.org,m:yukuai@fnnas.com,m:linan122@huawei.com,m:linux-alpha@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@li
 sts.infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-um@lists.infradead.org,m:linux-crypto@vger.kernel.org,m:linux-btrfs@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-raid@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[hch@lst.de,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,armlinux.org.uk,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,dabbelt.com,eecs.berkeley.edu,ghiti.fr,davemloft.net,gaisler.com,nod.at,cambridgegreys.com,sipsolutions.net,redhat.com,alien8.de,linux.intel.com,zytor.com,gondor.apana.org.au,intel.com,fb.com,suse.com,arndb.de,fnnas.com,huawei.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	RCPT_COUNT_GT_50(0.00)[54];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:mid,lst.de:email,kylinos.cn:email,linaro.org:email,davemloft.net:email,linux.cz:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,infradead.org:dkim,xen0n.name:email]
X-Rspamd-Queue-Id: 5586C1A85F8
X-Rspamd-Action: no action

Move the asm/xor.h headers to lib/raid/xor/$(SRCARCH)/xor_arch.h and
include/linux/raid/xor_impl.h to lib/raid/xor/xor_impl.h so that the
xor.ko module implementation is self-contained in lib/raid/.

As this remove the asm-generic mechanism a new kconfig symbol is
added to indicate that a architecture-specific implementations
exists, and xor_arch.h should be included.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/alpha/Kconfig                             |  1 +
 arch/arm/Kconfig                               |  1 +
 arch/arm64/Kconfig                             |  1 +
 arch/loongarch/Kconfig                         |  1 +
 arch/powerpc/Kconfig                           |  1 +
 arch/riscv/Kconfig                             |  1 +
 arch/s390/Kconfig                              |  1 +
 arch/sparc/Kconfig                             |  1 +
 arch/um/Kconfig                                |  1 +
 arch/x86/Kconfig                               |  1 +
 include/asm-generic/Kbuild                     |  1 -
 include/asm-generic/xor.h                      | 11 -----------
 lib/raid/Kconfig                               |  4 ++++
 lib/raid/xor/Makefile                          |  6 ++++++
 lib/raid/xor/alpha/xor.c                       |  4 ++--
 .../asm/xor.h => lib/raid/xor/alpha/xor_arch.h |  2 --
 lib/raid/xor/arm/xor-neon-glue.c               |  4 ++--
 lib/raid/xor/arm/xor-neon.c                    |  2 +-
 lib/raid/xor/arm/xor.c                         |  4 ++--
 .../asm/xor.h => lib/raid/xor/arm/xor_arch.h   |  2 --
 lib/raid/xor/arm64/xor-neon-glue.c             |  4 ++--
 lib/raid/xor/arm64/xor-neon.c                  |  4 ++--
 .../asm/xor.h => lib/raid/xor/arm64/xor_arch.h |  3 ---
 .../xor.h => lib/raid/xor/loongarch/xor_arch.h |  7 -------
 lib/raid/xor/loongarch/xor_simd_glue.c         |  4 ++--
 .../xor.h => lib/raid/xor/powerpc/xor_arch.h   |  7 -------
 lib/raid/xor/powerpc/xor_vmx_glue.c            |  4 ++--
 lib/raid/xor/riscv/xor-glue.c                  |  4 ++--
 .../asm/xor.h => lib/raid/xor/riscv/xor_arch.h |  2 --
 lib/raid/xor/s390/xor.c                        |  4 ++--
 .../asm/xor.h => lib/raid/xor/s390/xor_arch.h  |  6 ------
 lib/raid/xor/sparc/xor-niagara-glue.c          |  4 ++--
 lib/raid/xor/sparc/xor-sparc32.c               |  4 ++--
 lib/raid/xor/sparc/xor-vis-glue.c              |  4 ++--
 .../asm/xor.h => lib/raid/xor/sparc/xor_arch.h |  9 ---------
 .../asm/xor.h => lib/raid/xor/um/xor_arch.h    |  7 +------
 lib/raid/xor/x86/xor-avx.c                     |  4 ++--
 lib/raid/xor/x86/xor-mmx.c                     |  4 ++--
 lib/raid/xor/x86/xor-sse.c                     |  4 ++--
 .../asm/xor.h => lib/raid/xor/x86/xor_arch.h   |  7 -------
 lib/raid/xor/xor-32regs-prefetch.c             |  3 +--
 lib/raid/xor/xor-32regs.c                      |  3 +--
 lib/raid/xor/xor-8regs-prefetch.c              |  3 +--
 lib/raid/xor/xor-8regs.c                       |  3 +--
 lib/raid/xor/xor-core.c                        | 18 +++++++++++-------
 .../linux/raid => lib/raid/xor}/xor_impl.h     |  6 ++++++
 46 files changed, 73 insertions(+), 109 deletions(-)
 delete mode 100644 include/asm-generic/xor.h
 rename arch/alpha/include/asm/xor.h => lib/raid/xor/alpha/xor_arch.h (90%)
 rename arch/arm/include/asm/xor.h => lib/raid/xor/arm/xor_arch.h (87%)
 rename arch/arm64/include/asm/xor.h => lib/raid/xor/arm64/xor_arch.h (89%)
 rename arch/loongarch/include/asm/xor.h => lib/raid/xor/loongarch/xor_arch.h (85%)
 rename arch/powerpc/include/asm/xor.h => lib/raid/xor/powerpc/xor_arch.h (77%)
 rename arch/riscv/include/asm/xor.h => lib/raid/xor/riscv/xor_arch.h (84%)
 rename arch/s390/include/asm/xor.h => lib/raid/xor/s390/xor_arch.h (71%)
 rename arch/sparc/include/asm/xor.h => lib/raid/xor/sparc/xor_arch.h (81%)
 rename arch/um/include/asm/xor.h => lib/raid/xor/um/xor_arch.h (61%)
 rename arch/x86/include/asm/xor.h => lib/raid/xor/x86/xor_arch.h (89%)
 rename {include/linux/raid => lib/raid/xor}/xor_impl.h (80%)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 6c7dbf0adad6..8b9d7005bcd5 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -40,6 +40,7 @@ config ALPHA
 	select MMU_GATHER_NO_RANGE
 	select MMU_GATHER_RCU_TABLE_FREE
 	select SPARSEMEM_EXTREME if SPARSEMEM
+	select XOR_BLOCKS_ARCH
 	select ZONE_DMA
 	help
 	  The Alpha is a 64-bit general-purpose processor designed and
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index ec33376f8e2b..92917231789d 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -159,6 +159,7 @@ config ARM
 	select HAVE_ARCH_VMAP_STACK if MMU && ARM_HAS_GROUP_RELOCS
 	select TRACE_IRQFLAGS_SUPPORT if !CPU_V7M
 	select USE_OF if !(ARCH_FOOTBRIDGE || ARCH_RPC || ARCH_SA1100)
+	select XOR_BLOCKS_ARCH
 	# Above selects are sorted alphabetically; please add new ones
 	# according to that.  Thanks.
 	help
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 38dba5f7e4d2..0ee65af90085 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -285,6 +285,7 @@ config ARM64
 	select USER_STACKTRACE_SUPPORT
 	select VDSO_GETRANDOM
 	select VMAP_STACK
+	select XOR_BLOCKS_ARCH
 	help
 	  ARM 64-bit (AArch64) Linux support.
 
diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index d211c6572b0a..f262583b07a4 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -215,6 +215,7 @@ config LOONGARCH
 	select USE_PERCPU_NUMA_NODE_ID
 	select USER_STACKTRACE_SUPPORT
 	select VDSO_GETRANDOM
+	select XOR_BLOCKS_ARCH
 	select ZONE_DMA32
 
 config 32BIT
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index ad7a2fe63a2a..c28776660246 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -328,6 +328,7 @@ config PPC
 	select THREAD_INFO_IN_TASK
 	select TRACE_IRQFLAGS_SUPPORT
 	select VDSO_GETRANDOM
+	select XOR_BLOCKS_ARCH
 	#
 	# Please keep this list sorted alphabetically.
 	#
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 90c531e6abf5..03ac092adb41 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -227,6 +227,7 @@ config RISCV
 	select UACCESS_MEMCPY if !MMU
 	select VDSO_GETRANDOM if HAVE_GENERIC_VDSO && 64BIT
 	select USER_STACKTRACE_SUPPORT
+	select XOR_BLOCKS_ARCH
 	select ZONE_DMA32 if 64BIT
 
 config RUSTC_SUPPORTS_RISCV
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index edc927d9e85a..163df316ee0e 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -287,6 +287,7 @@ config S390
 	select VDSO_GETRANDOM
 	select VIRT_CPU_ACCOUNTING
 	select VMAP_STACK
+	select XOR_BLOCKS_ARCH
 	select ZONE_DMA
 	# Note: keep the above list sorted alphabetically
 
diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index 8699be91fca9..fbdc88910de1 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -50,6 +50,7 @@ config SPARC
 	select NEED_DMA_MAP_STATE
 	select NEED_SG_DMA_LENGTH
 	select TRACE_IRQFLAGS_SUPPORT
+	select XOR_BLOCKS_ARCH
 
 config SPARC32
 	def_bool !64BIT
diff --git a/arch/um/Kconfig b/arch/um/Kconfig
index 098cda44db22..77f752fc72d5 100644
--- a/arch/um/Kconfig
+++ b/arch/um/Kconfig
@@ -43,6 +43,7 @@ config UML
 	select THREAD_INFO_IN_TASK
 	select SPARSE_IRQ
 	select MMU_GATHER_RCU_TABLE_FREE
+	select XOR_BLOCKS_ARCH
 
 config MMU
 	bool
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index e2df1b147184..19783304e34c 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -336,6 +336,7 @@ config X86
 	select ARCH_SUPPORTS_SCHED_CLUSTER	if SMP
 	select ARCH_SUPPORTS_SCHED_MC		if SMP
 	select HAVE_SINGLE_FTRACE_DIRECT_OPS	if X86_64 && DYNAMIC_FTRACE_WITH_DIRECT_CALLS
+	select XOR_BLOCKS_ARCH
 
 config INSTRUCTION_DECODER
 	def_bool y
diff --git a/include/asm-generic/Kbuild b/include/asm-generic/Kbuild
index 9aff61e7b8f2..2c53a1e0b760 100644
--- a/include/asm-generic/Kbuild
+++ b/include/asm-generic/Kbuild
@@ -65,4 +65,3 @@ mandatory-y += vermagic.h
 mandatory-y += vga.h
 mandatory-y += video.h
 mandatory-y += word-at-a-time.h
-mandatory-y += xor.h
diff --git a/include/asm-generic/xor.h b/include/asm-generic/xor.h
deleted file mode 100644
index fc151fdc45ab..000000000000
--- a/include/asm-generic/xor.h
+++ /dev/null
@@ -1,11 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * include/asm-generic/xor.h
- *
- * Generic optimized RAID-5 checksumming functions.
- */
-
-extern struct xor_block_template xor_block_8regs;
-extern struct xor_block_template xor_block_32regs;
-extern struct xor_block_template xor_block_8regs_p;
-extern struct xor_block_template xor_block_32regs_p;
diff --git a/lib/raid/Kconfig b/lib/raid/Kconfig
index 4b720f3454a2..dfa73530848e 100644
--- a/lib/raid/Kconfig
+++ b/lib/raid/Kconfig
@@ -1,3 +1,7 @@
 
 config XOR_BLOCKS
 	tristate
+
+# selected by architectures that provide an optimized XOR implementation
+config XOR_BLOCKS_ARCH
+	bool
diff --git a/lib/raid/xor/Makefile b/lib/raid/xor/Makefile
index eeda2610f7e7..447471b100b1 100644
--- a/lib/raid/xor/Makefile
+++ b/lib/raid/xor/Makefile
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
+ccflags-y			+= -I $(src)
+
 obj-$(CONFIG_XOR_BLOCKS)	+= xor.o
 
 xor-y				+= xor-core.o
@@ -8,6 +10,10 @@ xor-y				+= xor-32regs.o
 xor-y				+= xor-8regs-prefetch.o
 xor-y				+= xor-32regs-prefetch.o
 
+ifeq ($(CONFIG_XOR_BLOCKS_ARCH),y)
+CFLAGS_xor-core.o		+= -I$(src)/$(SRCARCH)
+endif
+
 xor-$(CONFIG_ALPHA)		+= alpha/xor.o
 xor-$(CONFIG_ARM)		+= arm/xor.o
 ifeq ($(CONFIG_ARM),y)
diff --git a/lib/raid/xor/alpha/xor.c b/lib/raid/xor/alpha/xor.c
index 0964ac420604..90694cc47395 100644
--- a/lib/raid/xor/alpha/xor.c
+++ b/lib/raid/xor/alpha/xor.c
@@ -2,8 +2,8 @@
 /*
  * Optimized XOR parity functions for alpha EV5 and EV6
  */
-#include <linux/raid/xor_impl.h>
-#include <asm/xor.h>
+#include "xor_impl.h"
+#include "xor_arch.h"
 
 extern void
 xor_alpha_2(unsigned long bytes, unsigned long * __restrict p1,
diff --git a/arch/alpha/include/asm/xor.h b/lib/raid/xor/alpha/xor_arch.h
similarity index 90%
rename from arch/alpha/include/asm/xor.h
rename to lib/raid/xor/alpha/xor_arch.h
index e517be577a09..0dcfea578a48 100644
--- a/arch/alpha/include/asm/xor.h
+++ b/lib/raid/xor/alpha/xor_arch.h
@@ -1,7 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 
 #include <asm/special_insns.h>
-#include <asm-generic/xor.h>
 
 extern struct xor_block_template xor_block_alpha;
 extern struct xor_block_template xor_block_alpha_prefetch;
@@ -10,7 +9,6 @@ extern struct xor_block_template xor_block_alpha_prefetch;
  * Force the use of alpha_prefetch if EV6, as it is significantly faster in the
  * cold cache case.
  */
-#define arch_xor_init arch_xor_init
 static __always_inline void __init arch_xor_init(void)
 {
 	if (implver() == IMPLVER_EV6) {
diff --git a/lib/raid/xor/arm/xor-neon-glue.c b/lib/raid/xor/arm/xor-neon-glue.c
index c7b162b383a2..7afd6294464b 100644
--- a/lib/raid/xor/arm/xor-neon-glue.c
+++ b/lib/raid/xor/arm/xor-neon-glue.c
@@ -2,8 +2,8 @@
 /*
  *  Copyright (C) 2001 Russell King
  */
-#include <linux/raid/xor_impl.h>
-#include <asm/xor.h>
+#include "xor_impl.h"
+#include "xor_arch.h"
 
 extern struct xor_block_template const xor_block_neon_inner;
 
diff --git a/lib/raid/xor/arm/xor-neon.c b/lib/raid/xor/arm/xor-neon.c
index c9d4378b0f0e..806a42c5952c 100644
--- a/lib/raid/xor/arm/xor-neon.c
+++ b/lib/raid/xor/arm/xor-neon.c
@@ -3,7 +3,7 @@
  * Copyright (C) 2013 Linaro Ltd <ard.biesheuvel@linaro.org>
  */
 
-#include <linux/raid/xor_impl.h>
+#include "xor_impl.h"
 
 #ifndef __ARM_NEON__
 #error You should compile this file with '-march=armv7-a -mfloat-abi=softfp -mfpu=neon'
diff --git a/lib/raid/xor/arm/xor.c b/lib/raid/xor/arm/xor.c
index 2263341dbbcd..5bd5f048bbe9 100644
--- a/lib/raid/xor/arm/xor.c
+++ b/lib/raid/xor/arm/xor.c
@@ -2,8 +2,8 @@
 /*
  *  Copyright (C) 2001 Russell King
  */
-#include <linux/raid/xor_impl.h>
-#include <asm/xor.h>
+#include "xor_impl.h"
+#include "xor_arch.h"
 
 #define __XOR(a1, a2) a1 ^= a2
 
diff --git a/arch/arm/include/asm/xor.h b/lib/raid/xor/arm/xor_arch.h
similarity index 87%
rename from arch/arm/include/asm/xor.h
rename to lib/raid/xor/arm/xor_arch.h
index 989c55872ef6..5a7eedb48fbb 100644
--- a/arch/arm/include/asm/xor.h
+++ b/lib/raid/xor/arm/xor_arch.h
@@ -2,13 +2,11 @@
 /*
  *  Copyright (C) 2001 Russell King
  */
-#include <asm-generic/xor.h>
 #include <asm/neon.h>
 
 extern struct xor_block_template xor_block_arm4regs;
 extern struct xor_block_template xor_block_neon;
 
-#define arch_xor_init arch_xor_init
 static __always_inline void __init arch_xor_init(void)
 {
 	xor_register(&xor_block_arm4regs);
diff --git a/lib/raid/xor/arm64/xor-neon-glue.c b/lib/raid/xor/arm64/xor-neon-glue.c
index 08c3e3573388..3db0a318cf5b 100644
--- a/lib/raid/xor/arm64/xor-neon-glue.c
+++ b/lib/raid/xor/arm64/xor-neon-glue.c
@@ -4,9 +4,9 @@
  * Copyright (C) 2018,Tianjin KYLIN Information Technology Co., Ltd.
  */
 
-#include <linux/raid/xor_impl.h>
 #include <asm/simd.h>
-#include <asm/xor.h>
+#include "xor_impl.h"
+#include "xor_arch.h"
 #include "xor-neon.h"
 
 #define XOR_TEMPLATE(_name)						\
diff --git a/lib/raid/xor/arm64/xor-neon.c b/lib/raid/xor/arm64/xor-neon.c
index 61194c292917..61f00c4fee49 100644
--- a/lib/raid/xor/arm64/xor-neon.c
+++ b/lib/raid/xor/arm64/xor-neon.c
@@ -4,10 +4,10 @@
  * Copyright (C) 2018,Tianjin KYLIN Information Technology Co., Ltd.
  */
 
-#include <linux/raid/xor_impl.h>
 #include <linux/cache.h>
 #include <asm/neon-intrinsics.h>
-#include <asm/xor.h>
+#include "xor_impl.h"
+#include "xor_arch.h"
 #include "xor-neon.h"
 
 void __xor_neon_2(unsigned long bytes, unsigned long * __restrict p1,
diff --git a/arch/arm64/include/asm/xor.h b/lib/raid/xor/arm64/xor_arch.h
similarity index 89%
rename from arch/arm64/include/asm/xor.h
rename to lib/raid/xor/arm64/xor_arch.h
index 4782c760bcac..5dbb40319501 100644
--- a/arch/arm64/include/asm/xor.h
+++ b/lib/raid/xor/arm64/xor_arch.h
@@ -3,14 +3,11 @@
  * Authors: Jackie Liu <liuyun01@kylinos.cn>
  * Copyright (C) 2018,Tianjin KYLIN Information Technology Co., Ltd.
  */
-
-#include <asm-generic/xor.h>
 #include <asm/simd.h>
 
 extern struct xor_block_template xor_block_neon;
 extern struct xor_block_template xor_block_eor3;
 
-#define arch_xor_init arch_xor_init
 static __always_inline void __init arch_xor_init(void)
 {
 	xor_register(&xor_block_8regs);
diff --git a/arch/loongarch/include/asm/xor.h b/lib/raid/xor/loongarch/xor_arch.h
similarity index 85%
rename from arch/loongarch/include/asm/xor.h
rename to lib/raid/xor/loongarch/xor_arch.h
index 7e32f72f8b03..fe5e8244fd0e 100644
--- a/arch/loongarch/include/asm/xor.h
+++ b/lib/raid/xor/loongarch/xor_arch.h
@@ -2,9 +2,6 @@
 /*
  * Copyright (C) 2023 WANG Xuerui <git@xen0n.name>
  */
-#ifndef _ASM_LOONGARCH_XOR_H
-#define _ASM_LOONGARCH_XOR_H
-
 #include <asm/cpu-features.h>
 
 /*
@@ -15,12 +12,10 @@
  * the scalar ones, maybe for errata or micro-op reasons. It may be
  * appropriate to revisit this after one or two more uarch generations.
  */
-#include <asm-generic/xor.h>
 
 extern struct xor_block_template xor_block_lsx;
 extern struct xor_block_template xor_block_lasx;
 
-#define arch_xor_init arch_xor_init
 static __always_inline void __init arch_xor_init(void)
 {
 	xor_register(&xor_block_8regs);
@@ -36,5 +31,3 @@ static __always_inline void __init arch_xor_init(void)
 		xor_register(&xor_block_lasx);
 #endif
 }
-
-#endif /* _ASM_LOONGARCH_XOR_H */
diff --git a/lib/raid/xor/loongarch/xor_simd_glue.c b/lib/raid/xor/loongarch/xor_simd_glue.c
index 11fa3b47ba83..b387aa0213b4 100644
--- a/lib/raid/xor/loongarch/xor_simd_glue.c
+++ b/lib/raid/xor/loongarch/xor_simd_glue.c
@@ -6,9 +6,9 @@
  */
 
 #include <linux/sched.h>
-#include <linux/raid/xor_impl.h>
 #include <asm/fpu.h>
-#include <asm/xor.h>
+#include "xor_impl.h"
+#include "xor_arch.h"
 #include "xor_simd.h"
 
 #define MAKE_XOR_GLUE_2(flavor)							\
diff --git a/arch/powerpc/include/asm/xor.h b/lib/raid/xor/powerpc/xor_arch.h
similarity index 77%
rename from arch/powerpc/include/asm/xor.h
rename to lib/raid/xor/powerpc/xor_arch.h
index 3293ac87181c..3b00a4a2fd67 100644
--- a/arch/powerpc/include/asm/xor.h
+++ b/lib/raid/xor/powerpc/xor_arch.h
@@ -5,15 +5,10 @@
  *
  * Author: Anton Blanchard <anton@au.ibm.com>
  */
-#ifndef _ASM_POWERPC_XOR_H
-#define _ASM_POWERPC_XOR_H
-
 #include <asm/cpu_has_feature.h>
-#include <asm-generic/xor.h>
 
 extern struct xor_block_template xor_block_altivec;
 
-#define arch_xor_init arch_xor_init
 static __always_inline void __init arch_xor_init(void)
 {
 	xor_register(&xor_block_8regs);
@@ -25,5 +20,3 @@ static __always_inline void __init arch_xor_init(void)
 		xor_register(&xor_block_altivec);
 #endif
 }
-
-#endif /* _ASM_POWERPC_XOR_H */
diff --git a/lib/raid/xor/powerpc/xor_vmx_glue.c b/lib/raid/xor/powerpc/xor_vmx_glue.c
index c41e38340700..56e99ddfb64f 100644
--- a/lib/raid/xor/powerpc/xor_vmx_glue.c
+++ b/lib/raid/xor/powerpc/xor_vmx_glue.c
@@ -7,9 +7,9 @@
 
 #include <linux/preempt.h>
 #include <linux/sched.h>
-#include <linux/raid/xor_impl.h>
 #include <asm/switch_to.h>
-#include <asm/xor.h>
+#include "xor_impl.h"
+#include "xor_arch.h"
 #include "xor_vmx.h"
 
 static void xor_altivec_2(unsigned long bytes, unsigned long * __restrict p1,
diff --git a/lib/raid/xor/riscv/xor-glue.c b/lib/raid/xor/riscv/xor-glue.c
index 11666a4b6b68..060e5f22ebcc 100644
--- a/lib/raid/xor/riscv/xor-glue.c
+++ b/lib/raid/xor/riscv/xor-glue.c
@@ -3,11 +3,11 @@
  * Copyright (C) 2021 SiFive
  */
 
-#include <linux/raid/xor_impl.h>
 #include <asm/vector.h>
 #include <asm/switch_to.h>
 #include <asm/asm-prototypes.h>
-#include <asm/xor.h>
+#include "xor_impl.h"
+#include "xor_arch.h"
 
 static void xor_vector_2(unsigned long bytes, unsigned long *__restrict p1,
 			 const unsigned long *__restrict p2)
diff --git a/arch/riscv/include/asm/xor.h b/lib/raid/xor/riscv/xor_arch.h
similarity index 84%
rename from arch/riscv/include/asm/xor.h
rename to lib/raid/xor/riscv/xor_arch.h
index 614d9209d078..9240857d760b 100644
--- a/arch/riscv/include/asm/xor.h
+++ b/lib/raid/xor/riscv/xor_arch.h
@@ -3,11 +3,9 @@
  * Copyright (C) 2021 SiFive
  */
 #include <asm/vector.h>
-#include <asm-generic/xor.h>
 
 extern struct xor_block_template xor_block_rvv;
 
-#define arch_xor_init arch_xor_init
 static __always_inline void __init arch_xor_init(void)
 {
 	xor_register(&xor_block_8regs);
diff --git a/lib/raid/xor/s390/xor.c b/lib/raid/xor/s390/xor.c
index 2d5e33eca2a8..48b8cdc684a3 100644
--- a/lib/raid/xor/s390/xor.c
+++ b/lib/raid/xor/s390/xor.c
@@ -7,8 +7,8 @@
  */
 
 #include <linux/types.h>
-#include <linux/raid/xor_impl.h>
-#include <asm/xor.h>
+#include "xor_impl.h"
+#include "xor_arch.h"
 
 static void xor_xc_2(unsigned long bytes, unsigned long * __restrict p1,
 		     const unsigned long * __restrict p2)
diff --git a/arch/s390/include/asm/xor.h b/lib/raid/xor/s390/xor_arch.h
similarity index 71%
rename from arch/s390/include/asm/xor.h
rename to lib/raid/xor/s390/xor_arch.h
index 4e2233f64da9..4a233ed2b97a 100644
--- a/arch/s390/include/asm/xor.h
+++ b/lib/raid/xor/s390/xor_arch.h
@@ -5,15 +5,9 @@
  * Copyright IBM Corp. 2016
  * Author(s): Martin Schwidefsky <schwidefsky@de.ibm.com>
  */
-#ifndef _ASM_S390_XOR_H
-#define _ASM_S390_XOR_H
-
 extern struct xor_block_template xor_block_xc;
 
-#define arch_xor_init arch_xor_init
 static __always_inline void __init arch_xor_init(void)
 {
 	xor_force(&xor_block_xc);
 }
-
-#endif /* _ASM_S390_XOR_H */
diff --git a/lib/raid/xor/sparc/xor-niagara-glue.c b/lib/raid/xor/sparc/xor-niagara-glue.c
index 5087e63ac130..92d4712c65e1 100644
--- a/lib/raid/xor/sparc/xor-niagara-glue.c
+++ b/lib/raid/xor/sparc/xor-niagara-glue.c
@@ -6,8 +6,8 @@
  * Copyright (C) 2006 David S. Miller <davem@davemloft.net>
  */
 
-#include <linux/raid/xor_impl.h>
-#include <asm/xor.h>
+#include "xor_impl.h"
+#include "xor_arch.h"
 
 void xor_niagara_2(unsigned long bytes, unsigned long * __restrict p1,
 		   const unsigned long * __restrict p2);
diff --git a/lib/raid/xor/sparc/xor-sparc32.c b/lib/raid/xor/sparc/xor-sparc32.c
index b65a75a6e59d..307c4a84f535 100644
--- a/lib/raid/xor/sparc/xor-sparc32.c
+++ b/lib/raid/xor/sparc/xor-sparc32.c
@@ -5,8 +5,8 @@
  *
  * Copyright (C) 1999 Jakub Jelinek (jj@ultra.linux.cz)
  */
-#include <linux/raid/xor_impl.h>
-#include <asm/xor.h>
+#include "xor_impl.h"
+#include "xor_arch.h"
 
 static void
 sparc_2(unsigned long bytes, unsigned long * __restrict p1,
diff --git a/lib/raid/xor/sparc/xor-vis-glue.c b/lib/raid/xor/sparc/xor-vis-glue.c
index 73e5b293d0c9..1c0977e85f53 100644
--- a/lib/raid/xor/sparc/xor-vis-glue.c
+++ b/lib/raid/xor/sparc/xor-vis-glue.c
@@ -6,8 +6,8 @@
  * Copyright (C) 1997, 1999 Jakub Jelinek (jj@ultra.linux.cz)
  */
 
-#include <linux/raid/xor_impl.h>
-#include <asm/xor.h>
+#include "xor_impl.h"
+#include "xor_arch.h"
 
 void xor_vis_2(unsigned long bytes, unsigned long * __restrict p1,
 	       const unsigned long * __restrict p2);
diff --git a/arch/sparc/include/asm/xor.h b/lib/raid/xor/sparc/xor_arch.h
similarity index 81%
rename from arch/sparc/include/asm/xor.h
rename to lib/raid/xor/sparc/xor_arch.h
index f923b009fc24..af288abe4e91 100644
--- a/arch/sparc/include/asm/xor.h
+++ b/lib/raid/xor/sparc/xor_arch.h
@@ -3,16 +3,12 @@
  * Copyright (C) 1997, 1999 Jakub Jelinek (jj@ultra.linux.cz)
  * Copyright (C) 2006 David S. Miller <davem@davemloft.net>
  */
-#ifndef ___ASM_SPARC_XOR_H
-#define ___ASM_SPARC_XOR_H
-
 #if defined(__sparc__) && defined(__arch64__)
 #include <asm/spitfire.h>
 
 extern struct xor_block_template xor_block_VIS;
 extern struct xor_block_template xor_block_niagara;
 
-#define arch_xor_init arch_xor_init
 static __always_inline void __init arch_xor_init(void)
 {
 	/* Force VIS for everything except Niagara.  */
@@ -28,12 +24,8 @@ static __always_inline void __init arch_xor_init(void)
 }
 #else /* sparc64 */
 
-/* For grins, also test the generic routines.  */
-#include <asm-generic/xor.h>
-
 extern struct xor_block_template xor_block_SPARC;
 
-#define arch_xor_init arch_xor_init
 static __always_inline void __init arch_xor_init(void)
 {
 	xor_register(&xor_block_8regs);
@@ -41,4 +33,3 @@ static __always_inline void __init arch_xor_init(void)
 	xor_register(&xor_block_SPARC);
 }
 #endif /* !sparc64 */
-#endif /* ___ASM_SPARC_XOR_H */
diff --git a/arch/um/include/asm/xor.h b/lib/raid/xor/um/xor_arch.h
similarity index 61%
rename from arch/um/include/asm/xor.h
rename to lib/raid/xor/um/xor_arch.h
index c9ddedc19301..c75cd9caf792 100644
--- a/arch/um/include/asm/xor.h
+++ b/lib/raid/xor/um/xor_arch.h
@@ -1,7 +1,4 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_UM_XOR_H
-#define _ASM_UM_XOR_H
-
 #ifdef CONFIG_64BIT
 #undef CONFIG_X86_32
 #else
@@ -9,6 +6,4 @@
 #endif
 
 #include <asm/cpufeature.h>
-#include <../../x86/include/asm/xor.h>
-
-#endif
+#include <../x86/xor_arch.h>
diff --git a/lib/raid/xor/x86/xor-avx.c b/lib/raid/xor/x86/xor-avx.c
index b49cb5199e70..d411efa1ff43 100644
--- a/lib/raid/xor/x86/xor-avx.c
+++ b/lib/raid/xor/x86/xor-avx.c
@@ -8,9 +8,9 @@
  * Based on Ingo Molnar and Zach Brown's respective MMX and SSE routines
  */
 #include <linux/compiler.h>
-#include <linux/raid/xor_impl.h>
 #include <asm/fpu/api.h>
-#include <asm/xor.h>
+#include "xor_impl.h"
+#include "xor_arch.h"
 
 #define BLOCK4(i) \
 		BLOCK(32 * i, 0) \
diff --git a/lib/raid/xor/x86/xor-mmx.c b/lib/raid/xor/x86/xor-mmx.c
index cf0fafea33b7..e48c58f92874 100644
--- a/lib/raid/xor/x86/xor-mmx.c
+++ b/lib/raid/xor/x86/xor-mmx.c
@@ -4,9 +4,9 @@
  *
  * Copyright (C) 1998 Ingo Molnar.
  */
-#include <linux/raid/xor_impl.h>
 #include <asm/fpu/api.h>
-#include <asm/xor.h>
+#include "xor_impl.h"
+#include "xor_arch.h"
 
 #define LD(x, y)	"       movq   8*("#x")(%1), %%mm"#y"   ;\n"
 #define ST(x, y)	"       movq %%mm"#y",   8*("#x")(%1)   ;\n"
diff --git a/lib/raid/xor/x86/xor-sse.c b/lib/raid/xor/x86/xor-sse.c
index 0e727ced8b00..5993ed688c15 100644
--- a/lib/raid/xor/x86/xor-sse.c
+++ b/lib/raid/xor/x86/xor-sse.c
@@ -12,9 +12,9 @@
  * x86-64 changes / gcc fixes from Andi Kleen.
  * Copyright 2002 Andi Kleen, SuSE Labs.
  */
-#include <linux/raid/xor_impl.h>
 #include <asm/fpu/api.h>
-#include <asm/xor.h>
+#include "xor_impl.h"
+#include "xor_arch.h"
 
 #ifdef CONFIG_X86_32
 /* reduce register pressure */
diff --git a/arch/x86/include/asm/xor.h b/lib/raid/xor/x86/xor_arch.h
similarity index 89%
rename from arch/x86/include/asm/xor.h
rename to lib/raid/xor/x86/xor_arch.h
index d1aab8275908..99fe85a213c6 100644
--- a/arch/x86/include/asm/xor.h
+++ b/lib/raid/xor/x86/xor_arch.h
@@ -1,9 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
-#ifndef _ASM_X86_XOR_H
-#define _ASM_X86_XOR_H
-
 #include <asm/cpufeature.h>
-#include <asm-generic/xor.h>
 
 extern struct xor_block_template xor_block_pII_mmx;
 extern struct xor_block_template xor_block_p5_mmx;
@@ -20,7 +16,6 @@ extern struct xor_block_template xor_block_avx;
  *
  * 32-bit without MMX can fall back to the generic routines.
  */
-#define arch_xor_init arch_xor_init
 static __always_inline void __init arch_xor_init(void)
 {
 	if (boot_cpu_has(X86_FEATURE_AVX) &&
@@ -39,5 +34,3 @@ static __always_inline void __init arch_xor_init(void)
 		xor_register(&xor_block_32regs_p);
 	}
 }
-
-#endif /* _ASM_X86_XOR_H */
diff --git a/lib/raid/xor/xor-32regs-prefetch.c b/lib/raid/xor/xor-32regs-prefetch.c
index 8666c287f777..2856a8e50cb8 100644
--- a/lib/raid/xor/xor-32regs-prefetch.c
+++ b/lib/raid/xor/xor-32regs-prefetch.c
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 #include <linux/prefetch.h>
-#include <linux/raid/xor_impl.h>
-#include <asm-generic/xor.h>
+#include "xor_impl.h"
 
 static void
 xor_32regs_p_2(unsigned long bytes, unsigned long * __restrict p1,
diff --git a/lib/raid/xor/xor-32regs.c b/lib/raid/xor/xor-32regs.c
index 58d4fac43eb4..cc44d64032fa 100644
--- a/lib/raid/xor/xor-32regs.c
+++ b/lib/raid/xor/xor-32regs.c
@@ -1,6 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-#include <linux/raid/xor_impl.h>
-#include <asm-generic/xor.h>
+#include "xor_impl.h"
 
 static void
 xor_32regs_2(unsigned long bytes, unsigned long * __restrict p1,
diff --git a/lib/raid/xor/xor-8regs-prefetch.c b/lib/raid/xor/xor-8regs-prefetch.c
index 67061e35a0a6..1d53aec50d27 100644
--- a/lib/raid/xor/xor-8regs-prefetch.c
+++ b/lib/raid/xor/xor-8regs-prefetch.c
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 #include <linux/prefetch.h>
-#include <linux/raid/xor_impl.h>
-#include <asm-generic/xor.h>
+#include "xor_impl.h"
 
 static void
 xor_8regs_p_2(unsigned long bytes, unsigned long * __restrict p1,
diff --git a/lib/raid/xor/xor-8regs.c b/lib/raid/xor/xor-8regs.c
index 769f796ab2cf..72a44e898c55 100644
--- a/lib/raid/xor/xor-8regs.c
+++ b/lib/raid/xor/xor-8regs.c
@@ -1,6 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-#include <linux/raid/xor_impl.h>
-#include <asm-generic/xor.h>
+#include "xor_impl.h"
 
 static void
 xor_8regs_2(unsigned long bytes, unsigned long * __restrict p1,
diff --git a/lib/raid/xor/xor-core.c b/lib/raid/xor/xor-core.c
index 3b53c70ba615..8dda4055ad09 100644
--- a/lib/raid/xor/xor-core.c
+++ b/lib/raid/xor/xor-core.c
@@ -9,10 +9,9 @@
 #include <linux/module.h>
 #include <linux/gfp.h>
 #include <linux/raid/xor.h>
-#include <linux/raid/xor_impl.h>
 #include <linux/jiffies.h>
 #include <linux/preempt.h>
-#include <asm/xor.h>
+#include "xor_impl.h"
 
 /* The xor routines to use.  */
 static struct xor_block_template *active_template;
@@ -141,16 +140,21 @@ static int __init calibrate_xor_blocks(void)
 	return 0;
 }
 
-static int __init xor_init(void)
-{
-#ifdef arch_xor_init
-	arch_xor_init();
+#ifdef CONFIG_XOR_BLOCKS_ARCH
+#include "xor_arch.h" /* $SRCARCH/xor_arch.h */
 #else
+static void __init arch_xor_init(void)
+{
 	xor_register(&xor_block_8regs);
 	xor_register(&xor_block_8regs_p);
 	xor_register(&xor_block_32regs);
 	xor_register(&xor_block_32regs_p);
-#endif
+}
+#endif /* CONFIG_XOR_BLOCKS_ARCH */
+
+static int __init xor_init(void)
+{
+	arch_xor_init();
 
 	/*
 	 * If this arch/cpu has a short-circuited selection, don't loop through
diff --git a/include/linux/raid/xor_impl.h b/lib/raid/xor/xor_impl.h
similarity index 80%
rename from include/linux/raid/xor_impl.h
rename to lib/raid/xor/xor_impl.h
index 6ed4c445ab24..44b6c99e2093 100644
--- a/include/linux/raid/xor_impl.h
+++ b/lib/raid/xor/xor_impl.h
@@ -24,6 +24,12 @@ struct xor_block_template {
 		     const unsigned long * __restrict);
 };
 
+/* generic implementations */
+extern struct xor_block_template xor_block_8regs;
+extern struct xor_block_template xor_block_32regs;
+extern struct xor_block_template xor_block_8regs_p;
+extern struct xor_block_template xor_block_32regs_p;
+
 void __init xor_register(struct xor_block_template *tmpl);
 void __init xor_force(struct xor_block_template *tmpl);
 
-- 
2.47.3


