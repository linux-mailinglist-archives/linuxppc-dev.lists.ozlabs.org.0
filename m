Return-Path: <linuxppc-dev+bounces-17280-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mM/kA8NioGk0jAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17280-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 16:12:03 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 178901A84F1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 16:12:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMFKz0Zdjz2ydq;
	Fri, 27 Feb 2026 02:11:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772118710;
	cv=none; b=o3TajNvwwAcW2F/s7bPb9T9jrCOtkyuQ1TpgQXFX4nSPfT6KDkybM0aKQ8ltm9k72pdRDIqlpCLf3nyzTqlckjyEf5Uy+vXZAnDNBcZofYulRegyLRtnpaVhCLDpkyYnMv3tf7BusECHZ5wsOdUSotPb9feUyIIg6TZ24RIeNsBeZ6/d04ruqhpubXMMXzGh5i2SAEwkXPWe7PJAxz9Hxo+F6l/3p5zmYG8P5vDRksmObRooClDcjJaEC0z6tv3Gwc+eKZvZtztV0lL46IAlFHAIT73avTYFjCEnEFrSn7IAbHhP07qskeLPOMuAROtuddzjlNq2AlV2SqUeclKKPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772118710; c=relaxed/relaxed;
	bh=uWVTxVXofLMNGO7crXJ27khW3O1RifHdgil+Iut8nqA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OMwnB221ZVhi5A+TUxywp2inG2e/+FyFyhz45mBgQnJRKq4nyg6ylChYNqr7YVFkHYBmPzmizh6MJKqscFkbofoCypTv7COkkRS0o2RFK9T2bQAPgXPbaRAiU0xlEyW/C5ToS11BS0WkRDNiKx786uZbOdt7GdPAHZqW6z+29wRGXQEZ8nWRUUWHc4pK3RACeQSd4y+5b2hIlKudktEqVbvYEfyyu8qmDXY3FJ3PPCWoFTVq5goHohlmyQXocijVZUNcWCRE0mmQegvhaZKPD7uHUBfYb1skoHDMYelDDZLn1UviiN8s1fU3RKioBpUJdEsx4Q0Us07gUM4+aEVpVw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=lst.de; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=URePQ71d; dkim-atps=neutral; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+c5cab09b19de097b6dd3+8222+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=URePQ71d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+c5cab09b19de097b6dd3+8222+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMFKs2n8nz2yFc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 02:11:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=uWVTxVXofLMNGO7crXJ27khW3O1RifHdgil+Iut8nqA=; b=URePQ71dMeGUGa1CdsTZ/NWEcU
	kN7dqnbo+IzYt3fKmhdSuC1u4M2JlRpUp43VemPG2p9a8/X3pJTAmS286DayguZoIDqV7DNCh1Lr9
	04AkA3PabrFV1Mog+67HBx1F6PkOEbIO+WDokW7MRWklmqx8pINKSn+zvu12BeHbdB6aRWzLtLyUP
	e3qCRYeMLvojSKA7IgpEyu4XiRAzp1GCOh1K3OUjqgd5L4kg7pFHo07P+HGRtUew16mP0ZWekmYbW
	OYdfZGW8Aw+NzDr5qC2Au5lsmLuRDqKVA6UIwN941qa5z0Y+Vb7w41AVKv0i/1x6e12Sp4p1TR0Jb
	vNeljVKA==;
Received: from [4.28.11.157] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvd1F-00000006PyU-0jJQ;
	Thu, 26 Feb 2026 15:11:13 +0000
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
Subject: [PATCH 04/25] xor: move to lib/raid/
Date: Thu, 26 Feb 2026 07:10:16 -0800
Message-ID: <20260226151106.144735-5-hch@lst.de>
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
	TAGGED_FROM(0.00)[bounces-17280-lists,linuxppc-dev=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:dkim,lst.de:mid,lst.de:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 178901A84F1
X-Rspamd-Action: no action

Move the RAID XOR code to lib/raid/ as it has nothing to do with the
crypto API.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 crypto/Kconfig                          | 2 --
 crypto/Makefile                         | 1 -
 lib/Kconfig                             | 1 +
 lib/Makefile                            | 2 +-
 lib/raid/Kconfig                        | 3 +++
 lib/raid/Makefile                       | 2 ++
 lib/raid/xor/Makefile                   | 5 +++++
 crypto/xor.c => lib/raid/xor/xor-core.c | 0
 8 files changed, 12 insertions(+), 4 deletions(-)
 create mode 100644 lib/raid/Kconfig
 create mode 100644 lib/raid/Makefile
 create mode 100644 lib/raid/xor/Makefile
 rename crypto/xor.c => lib/raid/xor/xor-core.c (100%)

diff --git a/crypto/Kconfig b/crypto/Kconfig
index e2b4106ac961..5cdb1b25ae87 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -2,8 +2,6 @@
 #
 # Generic algorithms support
 #
-config XOR_BLOCKS
-	tristate
 
 #
 # async_tx api: hardware offloaded memory transfer/transform support
diff --git a/crypto/Makefile b/crypto/Makefile
index 04e269117589..795c2eea51fe 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -196,7 +196,6 @@ obj-$(CONFIG_CRYPTO_ECRDSA) += ecrdsa_generic.o
 #
 # generic algorithms and the async_tx api
 #
-obj-$(CONFIG_XOR_BLOCKS) += xor.o
 obj-$(CONFIG_ASYNC_CORE) += async_tx/
 obj-$(CONFIG_ASYMMETRIC_KEY_TYPE) += asymmetric_keys/
 crypto_simd-y := simd.o
diff --git a/lib/Kconfig b/lib/Kconfig
index 0f2fb9610647..5be57adcd454 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -138,6 +138,7 @@ config TRACE_MMIO_ACCESS
 
 source "lib/crc/Kconfig"
 source "lib/crypto/Kconfig"
+source "lib/raid/Kconfig"
 
 config XXHASH
 	tristate
diff --git a/lib/Makefile b/lib/Makefile
index 1b9ee167517f..84da412a044f 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -120,7 +120,7 @@ endif
 obj-$(CONFIG_DEBUG_INFO_REDUCED) += debug_info.o
 CFLAGS_debug_info.o += $(call cc-option, -femit-struct-debug-detailed=any)
 
-obj-y += math/ crc/ crypto/ tests/ vdso/
+obj-y += math/ crc/ crypto/ tests/ vdso/ raid/
 
 obj-$(CONFIG_GENERIC_IOMAP) += iomap.o
 obj-$(CONFIG_HAS_IOMEM) += iomap_copy.o devres.o
diff --git a/lib/raid/Kconfig b/lib/raid/Kconfig
new file mode 100644
index 000000000000..4b720f3454a2
--- /dev/null
+++ b/lib/raid/Kconfig
@@ -0,0 +1,3 @@
+
+config XOR_BLOCKS
+	tristate
diff --git a/lib/raid/Makefile b/lib/raid/Makefile
new file mode 100644
index 000000000000..382f2d1694bd
--- /dev/null
+++ b/lib/raid/Makefile
@@ -0,0 +1,2 @@
+
+obj-y				+= xor/
diff --git a/lib/raid/xor/Makefile b/lib/raid/xor/Makefile
new file mode 100644
index 000000000000..7bca0ce8e90a
--- /dev/null
+++ b/lib/raid/xor/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_XOR_BLOCKS)	+= xor.o
+
+xor-y				+= xor-core.o
diff --git a/crypto/xor.c b/lib/raid/xor/xor-core.c
similarity index 100%
rename from crypto/xor.c
rename to lib/raid/xor/xor-core.c
-- 
2.47.3


