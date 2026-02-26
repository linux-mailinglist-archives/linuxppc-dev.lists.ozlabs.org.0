Return-Path: <linuxppc-dev+bounces-17304-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJIYGodjoGk0jAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17304-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 16:15:19 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DC61A8644
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 16:15:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMFLW0hF6z2yvy;
	Fri, 27 Feb 2026 02:12:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772118738;
	cv=none; b=Lrfz7PnORzY3IL2YiC/YD5XmAxv324dh6lNpf6lcrgNsroa5uuqIxJgcCgGYP/lHS230wXrtlCY1S9T9wTHFAkyv4Kqu3uxbWn09xrQfWVWenSeauaEp3T8CoYvG0o+2auEYRuSfG3tE+ZBK9VQKuSnBED0txRw3dvIZqa8iHT45FMQI7X3GxPIss8YUi2vWmYo9HPZQNSTRUi2hZoiDl5Lzs298oBE5YpMzOq7QBok68oAO5ASeCPhd4kH+n7000IbxGDqdFkCPo4V8Pu6XTC7FduvPJ5X6BSlROF8WT+rMxxfwCcblzEieaZijk0iiBSMwJzufvIsvaw3cPSlqyw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772118738; c=relaxed/relaxed;
	bh=K4l9ZkzSckMxURtWF70ZO+gc5JoMPZeK4EVbJax8Sws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aXK9q511CgiYYHr8ye89c19WVC34zU/CcjFZu+dzuSRjJ1TW8mmiRSecGMfnu8kUQA1DSJvycRvCgIxGdSUby8tyMTzHqs5vfx+jCoFaH1onaXLvf10h0TzZXiABy3FCGWnGGN7E25SQup2OrDbj9f7eyuLPPeofmyJSfj9jtVvFikwV8VmPjTHAMxO6lUooUVjnkS8+0NYTnMEndiKq6Xz7vgB0LsmV+f9whPOj4gsZgv+PO9Z9GPCPYMqutaroEX+UzLR2W0hnXIlqN76Bd9Um55DKGW3Hk4gBAXcsh2kzhf+mt7DihF4nYHjBjZyu622LMxKSeqK/YC+SBlyHmw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=lst.de; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b/6dBKkm; dkim-atps=neutral; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+c5cab09b19de097b6dd3+8222+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b/6dBKkm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+c5cab09b19de097b6dd3+8222+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMFLT2myVz2yqs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 02:12:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=K4l9ZkzSckMxURtWF70ZO+gc5JoMPZeK4EVbJax8Sws=; b=b/6dBKkmydVkehF8XwlrV2zif8
	SeB+r29TQrXc2nff7Wbevdc6AqCS8omcX0XQwFNqV+Aqzq34wmvu1p5eENQJjqEUBZEXyEENopCeY
	nx0Pjuql6bch9np3IgJuYw3bQzmVPOfvH0EYAo4yJKPBzaJHNGeTwoUOorasCl8PyOyULylGYatKz
	ks3G3JNvHmo4WwmiFg9AwMmqzCPt+dxj595CPStB04pFNGuDIjSyxgDN7VufPE8iOW1p3Iym2NPUr
	PpEDra22Kqlj3n7cAUo6FhEPgB5ZNSnSLg72a8IiOKG6GXKE+uRlwBjaVqW6TSUWG02B0eWIJVBmW
	EJY2e2pQ==;
Received: from [4.28.11.157] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvd1o-00000006Qov-2ars;
	Thu, 26 Feb 2026 15:11:48 +0000
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
Subject: [PATCH 24/25] xor: pass the entire operation to the low-level ops
Date: Thu, 26 Feb 2026 07:10:36 -0800
Message-ID: <20260226151106.144735-25-hch@lst.de>
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17304-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:richard.henderson@linaro.org,m:mattst88@gmail.com,m:linmag7@gmail.com,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:davem@davemloft.net,m:andreas@gaisler.com,m:richard@nod.at,m:anton.ivanov@cambridgegreys.com,m:johannes@sipsolutions.net,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:herbert@gondor.apana.org.au,m:dan.j.williams@intel.com,m:clm@fb.com,m:dsterba@suse.com,m:arnd@arndb.de,m:song@kernel.org,m:yukuai@fnnas.com,m:linan122@huawei.com,m:linux-alpha@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@li
 sts.infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-um@lists.infradead.org,m:linux-crypto@vger.kernel.org,m:linux-btrfs@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-raid@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[hch@lst.de,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,armlinux.org.uk,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,dabbelt.com,eecs.berkeley.edu,ghiti.fr,davemloft.net,gaisler.com,nod.at,cambridgegreys.com,sipsolutions.net,redhat.com,alien8.de,linux.intel.com,zytor.com,gondor.apana.org.au,intel.com,fb.com,suse.com,arndb.de,fnnas.com,huawei.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:mid,lst.de:email,infradead.org:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 30DC61A8644
X-Rspamd-Action: no action

Currently the high-level xor code chunks up all operations into small
units for only up to 1 + 4 vectors, and passes it to four different
methods.  This means the FPU/vector context is entered and left a lot
for wide stripes, and a lot of indirect expensive indirect calls are
performed.  Switch to passing the entire gen_xor request to the
low-level ops, and provide a macro to dispatch it to the existing
helper.

This reduce the number of indirect calls and FPU/vector context switches
by a factor approaching nr_stripes / 4, and also reduces source and
binary code size.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/raid/xor.h               |  5 --
 lib/raid/xor/alpha/xor.c               | 19 ++++----
 lib/raid/xor/arm/xor-neon-glue.c       | 49 ++------------------
 lib/raid/xor/arm/xor-neon.c            |  9 +---
 lib/raid/xor/arm/xor.c                 | 10 ++--
 lib/raid/xor/arm/xor_arch.h            |  3 ++
 lib/raid/xor/arm64/xor-neon-glue.c     | 44 ++----------------
 lib/raid/xor/arm64/xor-neon.c          | 20 +++++---
 lib/raid/xor/arm64/xor-neon.h          | 32 ++-----------
 lib/raid/xor/loongarch/xor_simd_glue.c | 62 +++++--------------------
 lib/raid/xor/powerpc/xor_vmx.c         | 40 ++++++++--------
 lib/raid/xor/powerpc/xor_vmx.h         | 16 +------
 lib/raid/xor/powerpc/xor_vmx_glue.c    | 49 ++------------------
 lib/raid/xor/riscv/xor-glue.c          | 43 +++--------------
 lib/raid/xor/s390/xor.c                |  9 ++--
 lib/raid/xor/sparc/xor-niagara-glue.c  | 10 ++--
 lib/raid/xor/sparc/xor-sparc32.c       |  9 ++--
 lib/raid/xor/sparc/xor-vis-glue.c      |  9 ++--
 lib/raid/xor/x86/xor-avx.c             | 29 ++++--------
 lib/raid/xor/x86/xor-mmx.c             | 64 ++++++++++----------------
 lib/raid/xor/x86/xor-sse.c             | 63 +++++++++----------------
 lib/raid/xor/xor-32regs-prefetch.c     | 10 ++--
 lib/raid/xor/xor-32regs.c              |  9 ++--
 lib/raid/xor/xor-8regs-prefetch.c      | 11 +++--
 lib/raid/xor/xor-8regs.c               |  9 ++--
 lib/raid/xor/xor-core.c                | 47 ++-----------------
 lib/raid/xor/xor_impl.h                | 48 +++++++++++++------
 27 files changed, 224 insertions(+), 504 deletions(-)

diff --git a/include/linux/raid/xor.h b/include/linux/raid/xor.h
index 4735a4e960f9..11620d5f5b93 100644
--- a/include/linux/raid/xor.h
+++ b/include/linux/raid/xor.h
@@ -2,11 +2,6 @@
 #ifndef _XOR_H
 #define _XOR_H
 
-#define MAX_XOR_BLOCKS 4
-
-extern void xor_blocks(unsigned int count, unsigned int bytes,
-	void *dest, void **srcs);
-
 void xor_gen(void *dest, void **srcss, unsigned int src_cnt,
 		unsigned int bytes);
 
diff --git a/lib/raid/xor/alpha/xor.c b/lib/raid/xor/alpha/xor.c
index 90694cc47395..a8f72f2dd3a5 100644
--- a/lib/raid/xor/alpha/xor.c
+++ b/lib/raid/xor/alpha/xor.c
@@ -832,18 +832,17 @@ xor_alpha_prefetch_5:						\n\
 	.end xor_alpha_prefetch_5				\n\
 ");
 
+DO_XOR_BLOCKS(alpha, xor_alpha_2, xor_alpha_3, xor_alpha_4, xor_alpha_5);
+
 struct xor_block_template xor_block_alpha = {
-	.name	= "alpha",
-	.do_2	= xor_alpha_2,
-	.do_3	= xor_alpha_3,
-	.do_4	= xor_alpha_4,
-	.do_5	= xor_alpha_5,
+	.name		= "alpha",
+	.xor_gen	= xor_gen_alpha,
 };
 
+DO_XOR_BLOCKS(alpha_prefetch, xor_alpha_prefetch_2, xor_alpha_prefetch_3,
+		xor_alpha_prefetch_4, xor_alpha_prefetch_5);
+
 struct xor_block_template xor_block_alpha_prefetch = {
-	.name	= "alpha prefetch",
-	.do_2	= xor_alpha_prefetch_2,
-	.do_3	= xor_alpha_prefetch_3,
-	.do_4	= xor_alpha_prefetch_4,
-	.do_5	= xor_alpha_prefetch_5,
+	.name		= "alpha prefetch",
+	.xor_gen	= xor_gen_alpha_prefetch,
 };
diff --git a/lib/raid/xor/arm/xor-neon-glue.c b/lib/raid/xor/arm/xor-neon-glue.c
index 7afd6294464b..cea39e019904 100644
--- a/lib/raid/xor/arm/xor-neon-glue.c
+++ b/lib/raid/xor/arm/xor-neon-glue.c
@@ -5,54 +5,15 @@
 #include "xor_impl.h"
 #include "xor_arch.h"
 
-extern struct xor_block_template const xor_block_neon_inner;
-
-static void
-xor_neon_2(unsigned long bytes, unsigned long * __restrict p1,
-	   const unsigned long * __restrict p2)
-{
-	kernel_neon_begin();
-	xor_block_neon_inner.do_2(bytes, p1, p2);
-	kernel_neon_end();
-}
-
-static void
-xor_neon_3(unsigned long bytes, unsigned long * __restrict p1,
-	   const unsigned long * __restrict p2,
-	   const unsigned long * __restrict p3)
-{
-	kernel_neon_begin();
-	xor_block_neon_inner.do_3(bytes, p1, p2, p3);
-	kernel_neon_end();
-}
-
-static void
-xor_neon_4(unsigned long bytes, unsigned long * __restrict p1,
-	   const unsigned long * __restrict p2,
-	   const unsigned long * __restrict p3,
-	   const unsigned long * __restrict p4)
-{
-	kernel_neon_begin();
-	xor_block_neon_inner.do_4(bytes, p1, p2, p3, p4);
-	kernel_neon_end();
-}
-
-static void
-xor_neon_5(unsigned long bytes, unsigned long * __restrict p1,
-	   const unsigned long * __restrict p2,
-	   const unsigned long * __restrict p3,
-	   const unsigned long * __restrict p4,
-	   const unsigned long * __restrict p5)
+static void xor_gen_neon(void *dest, void **srcs, unsigned int src_cnt,
+		unsigned int bytes)
 {
 	kernel_neon_begin();
-	xor_block_neon_inner.do_5(bytes, p1, p2, p3, p4, p5);
+	xor_gen_neon_inner(dest, srcs, src_cnt, bytes);
 	kernel_neon_end();
 }
 
 struct xor_block_template xor_block_neon = {
-	.name	= "neon",
-	.do_2	= xor_neon_2,
-	.do_3	= xor_neon_3,
-	.do_4	= xor_neon_4,
-	.do_5	= xor_neon_5
+	.name		= "neon",
+	.xor_gen	= xor_gen_neon,
 };
diff --git a/lib/raid/xor/arm/xor-neon.c b/lib/raid/xor/arm/xor-neon.c
index 806a42c5952c..23147e3a7904 100644
--- a/lib/raid/xor/arm/xor-neon.c
+++ b/lib/raid/xor/arm/xor-neon.c
@@ -4,6 +4,7 @@
  */
 
 #include "xor_impl.h"
+#include "xor_arch.h"
 
 #ifndef __ARM_NEON__
 #error You should compile this file with '-march=armv7-a -mfloat-abi=softfp -mfpu=neon'
@@ -22,10 +23,4 @@
 #define NO_TEMPLATE
 #include "../xor-8regs.c"
 
-struct xor_block_template const xor_block_neon_inner = {
-	.name	= "__inner_neon__",
-	.do_2	= xor_8regs_2,
-	.do_3	= xor_8regs_3,
-	.do_4	= xor_8regs_4,
-	.do_5	= xor_8regs_5,
-};
+__DO_XOR_BLOCKS(neon_inner, xor_8regs_2, xor_8regs_3, xor_8regs_4, xor_8regs_5);
diff --git a/lib/raid/xor/arm/xor.c b/lib/raid/xor/arm/xor.c
index 5bd5f048bbe9..45139b6c55ea 100644
--- a/lib/raid/xor/arm/xor.c
+++ b/lib/raid/xor/arm/xor.c
@@ -127,10 +127,10 @@ xor_arm4regs_5(unsigned long bytes, unsigned long * __restrict p1,
 	} while (--lines);
 }
 
+DO_XOR_BLOCKS(arm4regs, xor_arm4regs_2, xor_arm4regs_3, xor_arm4regs_4,
+		xor_arm4regs_5);
+
 struct xor_block_template xor_block_arm4regs = {
-	.name	= "arm4regs",
-	.do_2	= xor_arm4regs_2,
-	.do_3	= xor_arm4regs_3,
-	.do_4	= xor_arm4regs_4,
-	.do_5	= xor_arm4regs_5,
+	.name		= "arm4regs",
+	.xor_gen	= xor_gen_arm4regs,
 };
diff --git a/lib/raid/xor/arm/xor_arch.h b/lib/raid/xor/arm/xor_arch.h
index 5a7eedb48fbb..775ff835df65 100644
--- a/lib/raid/xor/arm/xor_arch.h
+++ b/lib/raid/xor/arm/xor_arch.h
@@ -7,6 +7,9 @@
 extern struct xor_block_template xor_block_arm4regs;
 extern struct xor_block_template xor_block_neon;
 
+void xor_gen_neon_inner(void *dest, void **srcs, unsigned int src_cnt,
+		unsigned int bytes);
+
 static __always_inline void __init arch_xor_init(void)
 {
 	xor_register(&xor_block_arm4regs);
diff --git a/lib/raid/xor/arm64/xor-neon-glue.c b/lib/raid/xor/arm64/xor-neon-glue.c
index 3db0a318cf5b..f0284f86feb4 100644
--- a/lib/raid/xor/arm64/xor-neon-glue.c
+++ b/lib/raid/xor/arm64/xor-neon-glue.c
@@ -10,50 +10,16 @@
 #include "xor-neon.h"
 
 #define XOR_TEMPLATE(_name)						\
-static void								\
-xor_##_name##_2(unsigned long bytes, unsigned long * __restrict p1,	\
-	   const unsigned long * __restrict p2)				\
+static void xor_gen_##_name(void *dest, void **srcs, unsigned int src_cnt, \
+		unsigned int bytes)					\
 {									\
 	scoped_ksimd()							\
-		__xor_##_name##_2(bytes, p1, p2);			\
-}									\
-									\
-static void								\
-xor_##_name##_3(unsigned long bytes, unsigned long * __restrict p1,	\
-	   const unsigned long * __restrict p2,				\
-	   const unsigned long * __restrict p3)				\
-{									\
-	scoped_ksimd()							\
-		__xor_##_name##_3(bytes, p1, p2, p3);			\
-}									\
-									\
-static void								\
-xor_##_name##_4(unsigned long bytes, unsigned long * __restrict p1,	\
-	   const unsigned long * __restrict p2,				\
-	   const unsigned long * __restrict p3,				\
-	   const unsigned long * __restrict p4)				\
-{									\
-	scoped_ksimd()							\
-		__xor_##_name##_4(bytes, p1, p2, p3, p4);		\
-}									\
-									\
-static void								\
-xor_##_name##_5(unsigned long bytes, unsigned long * __restrict p1,	\
-	   const unsigned long * __restrict p2,				\
-	   const unsigned long * __restrict p3,				\
-	   const unsigned long * __restrict p4,				\
-	   const unsigned long * __restrict p5)				\
-{									\
-	scoped_ksimd()							\
-		__xor_##_name##_5(bytes, p1, p2, p3, p4, p5);		\
+		xor_gen_##_name##_inner(dest, srcs, src_cnt, bytes);	\
 }									\
 									\
 struct xor_block_template xor_block_##_name = {				\
-	.name   = __stringify(_name),					\
-	.do_2   = xor_##_name##_2,					\
-	.do_3   = xor_##_name##_3,					\
-	.do_4   = xor_##_name##_4,					\
-	.do_5	= xor_##_name##_5					\
+	.name   	= __stringify(_name),				\
+	.xor_gen	= xor_gen_##_name,				\
 };
 
 XOR_TEMPLATE(neon);
diff --git a/lib/raid/xor/arm64/xor-neon.c b/lib/raid/xor/arm64/xor-neon.c
index 61f00c4fee49..97ef3cb92496 100644
--- a/lib/raid/xor/arm64/xor-neon.c
+++ b/lib/raid/xor/arm64/xor-neon.c
@@ -10,7 +10,7 @@
 #include "xor_arch.h"
 #include "xor-neon.h"
 
-void __xor_neon_2(unsigned long bytes, unsigned long * __restrict p1,
+static void __xor_neon_2(unsigned long bytes, unsigned long * __restrict p1,
 		const unsigned long * __restrict p2)
 {
 	uint64_t *dp1 = (uint64_t *)p1;
@@ -37,7 +37,7 @@ void __xor_neon_2(unsigned long bytes, unsigned long * __restrict p1,
 	} while (--lines > 0);
 }
 
-void __xor_neon_3(unsigned long bytes, unsigned long * __restrict p1,
+static void __xor_neon_3(unsigned long bytes, unsigned long * __restrict p1,
 		const unsigned long * __restrict p2,
 		const unsigned long * __restrict p3)
 {
@@ -73,7 +73,7 @@ void __xor_neon_3(unsigned long bytes, unsigned long * __restrict p1,
 	} while (--lines > 0);
 }
 
-void __xor_neon_4(unsigned long bytes, unsigned long * __restrict p1,
+static void __xor_neon_4(unsigned long bytes, unsigned long * __restrict p1,
 		const unsigned long * __restrict p2,
 		const unsigned long * __restrict p3,
 		const unsigned long * __restrict p4)
@@ -118,7 +118,7 @@ void __xor_neon_4(unsigned long bytes, unsigned long * __restrict p1,
 	} while (--lines > 0);
 }
 
-void __xor_neon_5(unsigned long bytes, unsigned long * __restrict p1,
+static void __xor_neon_5(unsigned long bytes, unsigned long * __restrict p1,
 		const unsigned long * __restrict p2,
 		const unsigned long * __restrict p3,
 		const unsigned long * __restrict p4,
@@ -172,6 +172,9 @@ void __xor_neon_5(unsigned long bytes, unsigned long * __restrict p1,
 	} while (--lines > 0);
 }
 
+__DO_XOR_BLOCKS(neon_inner, __xor_neon_2, __xor_neon_3, __xor_neon_4,
+		__xor_neon_5);
+
 static inline uint64x2_t eor3(uint64x2_t p, uint64x2_t q, uint64x2_t r)
 {
 	uint64x2_t res;
@@ -182,7 +185,7 @@ static inline uint64x2_t eor3(uint64x2_t p, uint64x2_t q, uint64x2_t r)
 	return res;
 }
 
-void __xor_eor3_3(unsigned long bytes, unsigned long * __restrict p1,
+static void __xor_eor3_3(unsigned long bytes, unsigned long * __restrict p1,
 		const unsigned long * __restrict p2,
 		const unsigned long * __restrict p3)
 {
@@ -216,7 +219,7 @@ void __xor_eor3_3(unsigned long bytes, unsigned long * __restrict p1,
 	} while (--lines > 0);
 }
 
-void __xor_eor3_4(unsigned long bytes, unsigned long * __restrict p1,
+static void __xor_eor3_4(unsigned long bytes, unsigned long * __restrict p1,
 		const unsigned long * __restrict p2,
 		const unsigned long * __restrict p3,
 		const unsigned long * __restrict p4)
@@ -259,7 +262,7 @@ void __xor_eor3_4(unsigned long bytes, unsigned long * __restrict p1,
 	} while (--lines > 0);
 }
 
-void __xor_eor3_5(unsigned long bytes, unsigned long * __restrict p1,
+static void __xor_eor3_5(unsigned long bytes, unsigned long * __restrict p1,
 		const unsigned long * __restrict p2,
 		const unsigned long * __restrict p3,
 		const unsigned long * __restrict p4,
@@ -304,3 +307,6 @@ void __xor_eor3_5(unsigned long bytes, unsigned long * __restrict p1,
 		dp5 += 8;
 	} while (--lines > 0);
 }
+
+__DO_XOR_BLOCKS(eor3_inner, __xor_neon_2, __xor_eor3_3, __xor_eor3_4,
+		__xor_eor3_5);
diff --git a/lib/raid/xor/arm64/xor-neon.h b/lib/raid/xor/arm64/xor-neon.h
index cec0ac846fea..514699ba8f5f 100644
--- a/lib/raid/xor/arm64/xor-neon.h
+++ b/lib/raid/xor/arm64/xor-neon.h
@@ -1,30 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-void __xor_neon_2(unsigned long bytes, unsigned long * __restrict p1,
-		const unsigned long * __restrict p2);
-void __xor_neon_3(unsigned long bytes, unsigned long * __restrict p1,
-		const unsigned long * __restrict p2,
-		const unsigned long * __restrict p3);
-void __xor_neon_4(unsigned long bytes, unsigned long * __restrict p1,
-		const unsigned long * __restrict p2,
-		const unsigned long * __restrict p3,
-		const unsigned long * __restrict p4);
-void __xor_neon_5(unsigned long bytes, unsigned long * __restrict p1,
-		const unsigned long * __restrict p2,
-		const unsigned long * __restrict p3,
-		const unsigned long * __restrict p4,
-		const unsigned long * __restrict p5);
-
-#define __xor_eor3_2	__xor_neon_2
-void __xor_eor3_3(unsigned long bytes, unsigned long * __restrict p1,
-		const unsigned long * __restrict p2,
-		const unsigned long * __restrict p3);
-void __xor_eor3_4(unsigned long bytes, unsigned long * __restrict p1,
-		const unsigned long * __restrict p2,
-		const unsigned long * __restrict p3,
-		const unsigned long * __restrict p4);
-void __xor_eor3_5(unsigned long bytes, unsigned long * __restrict p1,
-		const unsigned long * __restrict p2,
-		const unsigned long * __restrict p3,
-		const unsigned long * __restrict p4,
-		const unsigned long * __restrict p5);
+void xor_gen_neon_inner(void *dest, void **srcs, unsigned int src_cnt,
+		unsigned int bytes);
+void xor_gen_eor3_inner(void *dest, void **srcs, unsigned int src_cnt,
+		unsigned int bytes);
diff --git a/lib/raid/xor/loongarch/xor_simd_glue.c b/lib/raid/xor/loongarch/xor_simd_glue.c
index b387aa0213b4..7f324d924f87 100644
--- a/lib/raid/xor/loongarch/xor_simd_glue.c
+++ b/lib/raid/xor/loongarch/xor_simd_glue.c
@@ -11,63 +11,23 @@
 #include "xor_arch.h"
 #include "xor_simd.h"
 
-#define MAKE_XOR_GLUE_2(flavor)							\
-static void xor_##flavor##_2(unsigned long bytes, unsigned long * __restrict p1,\
-		      const unsigned long * __restrict p2)			\
+#define MAKE_XOR_GLUES(flavor)							\
+DO_XOR_BLOCKS(flavor##_inner, __xor_##flavor##_2, __xor_##flavor##_3,		\
+		__xor_##flavor##_4, __xor_##flavor##_5);			\
+										\
+static void xor_gen_##flavor(void *dest, void **srcs, unsigned int src_cnt,	\
+		unsigned int bytes)						\
 {										\
 	kernel_fpu_begin();							\
-	__xor_##flavor##_2(bytes, p1, p2);					\
+	xor_gen_##flavor##_inner(dest, srcs, src_cnt, bytes);			\
 	kernel_fpu_end();							\
 }										\
-
-#define MAKE_XOR_GLUE_3(flavor)							\
-static void xor_##flavor##_3(unsigned long bytes, unsigned long * __restrict p1,\
-		      const unsigned long * __restrict p2,			\
-		      const unsigned long * __restrict p3)			\
-{										\
-	kernel_fpu_begin();							\
-	__xor_##flavor##_3(bytes, p1, p2, p3);					\
-	kernel_fpu_end();							\
-}										\
-
-#define MAKE_XOR_GLUE_4(flavor)							\
-static void xor_##flavor##_4(unsigned long bytes, unsigned long * __restrict p1,\
-		      const unsigned long * __restrict p2,			\
-		      const unsigned long * __restrict p3,			\
-		      const unsigned long * __restrict p4)			\
-{										\
-	kernel_fpu_begin();							\
-	__xor_##flavor##_4(bytes, p1, p2, p3, p4);				\
-	kernel_fpu_end();							\
-}										\
-
-#define MAKE_XOR_GLUE_5(flavor)							\
-static void xor_##flavor##_5(unsigned long bytes, unsigned long * __restrict p1,\
-		      const unsigned long * __restrict p2,			\
-		      const unsigned long * __restrict p3,			\
-		      const unsigned long * __restrict p4,			\
-		      const unsigned long * __restrict p5)			\
-{										\
-	kernel_fpu_begin();							\
-	__xor_##flavor##_5(bytes, p1, p2, p3, p4, p5);				\
-	kernel_fpu_end();							\
-}										\
-
-#define MAKE_XOR_GLUES(flavor)				\
-	MAKE_XOR_GLUE_2(flavor);			\
-	MAKE_XOR_GLUE_3(flavor);			\
-	MAKE_XOR_GLUE_4(flavor);			\
-	MAKE_XOR_GLUE_5(flavor);			\
-							\
-struct xor_block_template xor_block_##flavor = {	\
-	.name = __stringify(flavor),			\
-	.do_2 = xor_##flavor##_2,			\
-	.do_3 = xor_##flavor##_3,			\
-	.do_4 = xor_##flavor##_4,			\
-	.do_5 = xor_##flavor##_5,			\
+										\
+struct xor_block_template xor_block_##flavor = {				\
+	.name		= __stringify(flavor),					\
+	.xor_gen	= xor_gen_##flavor					\
 }
 
-
 #ifdef CONFIG_CPU_HAS_LSX
 MAKE_XOR_GLUES(lsx);
 #endif /* CONFIG_CPU_HAS_LSX */
diff --git a/lib/raid/xor/powerpc/xor_vmx.c b/lib/raid/xor/powerpc/xor_vmx.c
index aab49d056d18..09bed98c1bc7 100644
--- a/lib/raid/xor/powerpc/xor_vmx.c
+++ b/lib/raid/xor/powerpc/xor_vmx.c
@@ -10,6 +10,7 @@
  * Sparse (as at v0.5.0) gets very, very confused by this file.
  * Make it a bit simpler for it.
  */
+#include "xor_impl.h"
 #if !defined(__CHECKER__)
 #include <altivec.h>
 #else
@@ -49,9 +50,9 @@ typedef vector signed char unative_t;
 		V1##_3 = vec_xor(V1##_3, V2##_3);	\
 	} while (0)
 
-void __xor_altivec_2(unsigned long bytes,
-		     unsigned long * __restrict v1_in,
-		     const unsigned long * __restrict v2_in)
+static void __xor_altivec_2(unsigned long bytes,
+		unsigned long * __restrict v1_in,
+		const unsigned long * __restrict v2_in)
 {
 	DEFINE(v1);
 	DEFINE(v2);
@@ -68,10 +69,10 @@ void __xor_altivec_2(unsigned long bytes,
 	} while (--lines > 0);
 }
 
-void __xor_altivec_3(unsigned long bytes,
-		     unsigned long * __restrict v1_in,
-		     const unsigned long * __restrict v2_in,
-		     const unsigned long * __restrict v3_in)
+static void __xor_altivec_3(unsigned long bytes,
+		unsigned long * __restrict v1_in,
+		const unsigned long * __restrict v2_in,
+		const unsigned long * __restrict v3_in)
 {
 	DEFINE(v1);
 	DEFINE(v2);
@@ -92,11 +93,11 @@ void __xor_altivec_3(unsigned long bytes,
 	} while (--lines > 0);
 }
 
-void __xor_altivec_4(unsigned long bytes,
-		     unsigned long * __restrict v1_in,
-		     const unsigned long * __restrict v2_in,
-		     const unsigned long * __restrict v3_in,
-		     const unsigned long * __restrict v4_in)
+static void __xor_altivec_4(unsigned long bytes,
+		unsigned long * __restrict v1_in,
+		const unsigned long * __restrict v2_in,
+		const unsigned long * __restrict v3_in,
+		const unsigned long * __restrict v4_in)
 {
 	DEFINE(v1);
 	DEFINE(v2);
@@ -121,12 +122,12 @@ void __xor_altivec_4(unsigned long bytes,
 	} while (--lines > 0);
 }
 
-void __xor_altivec_5(unsigned long bytes,
-		     unsigned long * __restrict v1_in,
-		     const unsigned long * __restrict v2_in,
-		     const unsigned long * __restrict v3_in,
-		     const unsigned long * __restrict v4_in,
-		     const unsigned long * __restrict v5_in)
+static void __xor_altivec_5(unsigned long bytes,
+		unsigned long * __restrict v1_in,
+		const unsigned long * __restrict v2_in,
+		const unsigned long * __restrict v3_in,
+		const unsigned long * __restrict v4_in,
+		const unsigned long * __restrict v5_in)
 {
 	DEFINE(v1);
 	DEFINE(v2);
@@ -154,3 +155,6 @@ void __xor_altivec_5(unsigned long bytes,
 		v5 += 4;
 	} while (--lines > 0);
 }
+
+__DO_XOR_BLOCKS(altivec_inner, __xor_altivec_2, __xor_altivec_3,
+		__xor_altivec_4, __xor_altivec_5);
diff --git a/lib/raid/xor/powerpc/xor_vmx.h b/lib/raid/xor/powerpc/xor_vmx.h
index 573c41d90dac..1d26c1133a86 100644
--- a/lib/raid/xor/powerpc/xor_vmx.h
+++ b/lib/raid/xor/powerpc/xor_vmx.h
@@ -6,17 +6,5 @@
  * outside of the enable/disable altivec block.
  */
 
-void __xor_altivec_2(unsigned long bytes, unsigned long * __restrict p1,
-		     const unsigned long * __restrict p2);
-void __xor_altivec_3(unsigned long bytes, unsigned long * __restrict p1,
-		     const unsigned long * __restrict p2,
-		     const unsigned long * __restrict p3);
-void __xor_altivec_4(unsigned long bytes, unsigned long * __restrict p1,
-		     const unsigned long * __restrict p2,
-		     const unsigned long * __restrict p3,
-		     const unsigned long * __restrict p4);
-void __xor_altivec_5(unsigned long bytes, unsigned long * __restrict p1,
-		     const unsigned long * __restrict p2,
-		     const unsigned long * __restrict p3,
-		     const unsigned long * __restrict p4,
-		     const unsigned long * __restrict p5);
+void xor_gen_altivec_inner(void *dest, void **srcs, unsigned int src_cnt,
+		unsigned int bytes);
diff --git a/lib/raid/xor/powerpc/xor_vmx_glue.c b/lib/raid/xor/powerpc/xor_vmx_glue.c
index 56e99ddfb64f..dbfbb5cadc36 100644
--- a/lib/raid/xor/powerpc/xor_vmx_glue.c
+++ b/lib/raid/xor/powerpc/xor_vmx_glue.c
@@ -12,56 +12,17 @@
 #include "xor_arch.h"
 #include "xor_vmx.h"
 
-static void xor_altivec_2(unsigned long bytes, unsigned long * __restrict p1,
-		const unsigned long * __restrict p2)
+static void xor_gen_altivec(void *dest, void **srcs, unsigned int src_cnt,
+		unsigned int bytes)
 {
 	preempt_disable();
 	enable_kernel_altivec();
-	__xor_altivec_2(bytes, p1, p2);
-	disable_kernel_altivec();
-	preempt_enable();
-}
-
-static void xor_altivec_3(unsigned long bytes, unsigned long * __restrict p1,
-		const unsigned long * __restrict p2,
-		const unsigned long * __restrict p3)
-{
-	preempt_disable();
-	enable_kernel_altivec();
-	__xor_altivec_3(bytes, p1, p2, p3);
-	disable_kernel_altivec();
-	preempt_enable();
-}
-
-static void xor_altivec_4(unsigned long bytes, unsigned long * __restrict p1,
-		const unsigned long * __restrict p2,
-		const unsigned long * __restrict p3,
-		const unsigned long * __restrict p4)
-{
-	preempt_disable();
-	enable_kernel_altivec();
-	__xor_altivec_4(bytes, p1, p2, p3, p4);
-	disable_kernel_altivec();
-	preempt_enable();
-}
-
-static void xor_altivec_5(unsigned long bytes, unsigned long * __restrict p1,
-		const unsigned long * __restrict p2,
-		const unsigned long * __restrict p3,
-		const unsigned long * __restrict p4,
-		const unsigned long * __restrict p5)
-{
-	preempt_disable();
-	enable_kernel_altivec();
-	__xor_altivec_5(bytes, p1, p2, p3, p4, p5);
+	xor_gen_altivec_inner(dest, srcs, src_cnt, bytes);
 	disable_kernel_altivec();
 	preempt_enable();
 }
 
 struct xor_block_template xor_block_altivec = {
-	.name = "altivec",
-	.do_2 = xor_altivec_2,
-	.do_3 = xor_altivec_3,
-	.do_4 = xor_altivec_4,
-	.do_5 = xor_altivec_5,
+	.name		= "altivec",
+	.xor_gen	= xor_gen_altivec,
 };
diff --git a/lib/raid/xor/riscv/xor-glue.c b/lib/raid/xor/riscv/xor-glue.c
index 060e5f22ebcc..2e4c1b05d998 100644
--- a/lib/raid/xor/riscv/xor-glue.c
+++ b/lib/raid/xor/riscv/xor-glue.c
@@ -9,48 +9,17 @@
 #include "xor_impl.h"
 #include "xor_arch.h"
 
-static void xor_vector_2(unsigned long bytes, unsigned long *__restrict p1,
-			 const unsigned long *__restrict p2)
-{
-	kernel_vector_begin();
-	xor_regs_2_(bytes, p1, p2);
-	kernel_vector_end();
-}
-
-static void xor_vector_3(unsigned long bytes, unsigned long *__restrict p1,
-			 const unsigned long *__restrict p2,
-			 const unsigned long *__restrict p3)
-{
-	kernel_vector_begin();
-	xor_regs_3_(bytes, p1, p2, p3);
-	kernel_vector_end();
-}
-
-static void xor_vector_4(unsigned long bytes, unsigned long *__restrict p1,
-			 const unsigned long *__restrict p2,
-			 const unsigned long *__restrict p3,
-			 const unsigned long *__restrict p4)
-{
-	kernel_vector_begin();
-	xor_regs_4_(bytes, p1, p2, p3, p4);
-	kernel_vector_end();
-}
+DO_XOR_BLOCKS(vector_inner, xor_regs_2_, xor_regs_3_, xor_regs_4_, xor_regs_5_);
 
-static void xor_vector_5(unsigned long bytes, unsigned long *__restrict p1,
-			 const unsigned long *__restrict p2,
-			 const unsigned long *__restrict p3,
-			 const unsigned long *__restrict p4,
-			 const unsigned long *__restrict p5)
+static void xor_gen_vector(void *dest, void **srcs, unsigned int src_cnt,
+		unsigned int bytes)
 {
 	kernel_vector_begin();
-	xor_regs_5_(bytes, p1, p2, p3, p4, p5);
+	xor_gen_vector_inner(dest, srcs, src_cnt, bytes);
 	kernel_vector_end();
 }
 
 struct xor_block_template xor_block_rvv = {
-	.name = "rvv",
-	.do_2 = xor_vector_2,
-	.do_3 = xor_vector_3,
-	.do_4 = xor_vector_4,
-	.do_5 = xor_vector_5
+	.name		= "rvv",
+	.xor_gen	= xor_gen_vector,
 };
diff --git a/lib/raid/xor/s390/xor.c b/lib/raid/xor/s390/xor.c
index 48b8cdc684a3..d8a62a70db6c 100644
--- a/lib/raid/xor/s390/xor.c
+++ b/lib/raid/xor/s390/xor.c
@@ -126,10 +126,9 @@ static void xor_xc_5(unsigned long bytes, unsigned long * __restrict p1,
 		: : "0", "cc", "memory");
 }
 
+DO_XOR_BLOCKS(xc, xor_xc_2, xor_xc_3, xor_xc_4, xor_xc_5);
+
 struct xor_block_template xor_block_xc = {
-	.name = "xc",
-	.do_2 = xor_xc_2,
-	.do_3 = xor_xc_3,
-	.do_4 = xor_xc_4,
-	.do_5 = xor_xc_5,
+	.name		= "xc",
+	.xor_gen	= xor_gen_xc,
 };
diff --git a/lib/raid/xor/sparc/xor-niagara-glue.c b/lib/raid/xor/sparc/xor-niagara-glue.c
index 92d4712c65e1..a4adb088e7d3 100644
--- a/lib/raid/xor/sparc/xor-niagara-glue.c
+++ b/lib/raid/xor/sparc/xor-niagara-glue.c
@@ -24,10 +24,10 @@ void xor_niagara_5(unsigned long bytes, unsigned long * __restrict p1,
 		   const unsigned long * __restrict p4,
 		   const unsigned long * __restrict p5);
 
+DO_XOR_BLOCKS(niagara, xor_niagara_2, xor_niagara_3, xor_niagara_4,
+		xor_niagara_5);
+
 struct xor_block_template xor_block_niagara = {
-        .name	= "Niagara",
-        .do_2	= xor_niagara_2,
-        .do_3	= xor_niagara_3,
-        .do_4	= xor_niagara_4,
-        .do_5	= xor_niagara_5,
+        .name		= "Niagara",
+	.xor_gen	= xor_gen_niagara,
 };
diff --git a/lib/raid/xor/sparc/xor-sparc32.c b/lib/raid/xor/sparc/xor-sparc32.c
index 307c4a84f535..fb37631e90e6 100644
--- a/lib/raid/xor/sparc/xor-sparc32.c
+++ b/lib/raid/xor/sparc/xor-sparc32.c
@@ -244,10 +244,9 @@ sparc_5(unsigned long bytes, unsigned long * __restrict p1,
 	} while (--lines > 0);
 }
 
+DO_XOR_BLOCKS(sparc32, sparc_2, sparc_3, sparc_4, sparc_5);
+
 struct xor_block_template xor_block_SPARC = {
-	.name	= "SPARC",
-	.do_2	= sparc_2,
-	.do_3	= sparc_3,
-	.do_4	= sparc_4,
-	.do_5	= sparc_5,
+	.name		= "SPARC",
+	.xor_gen	= xor_gen_sparc32,
 };
diff --git a/lib/raid/xor/sparc/xor-vis-glue.c b/lib/raid/xor/sparc/xor-vis-glue.c
index 1c0977e85f53..ef39d6c8b9bb 100644
--- a/lib/raid/xor/sparc/xor-vis-glue.c
+++ b/lib/raid/xor/sparc/xor-vis-glue.c
@@ -26,10 +26,9 @@ void xor_vis_5(unsigned long bytes, unsigned long * __restrict p1,
 
 /* XXX Ugh, write cheetah versions... -DaveM */
 
+DO_XOR_BLOCKS(vis, xor_vis_2, xor_vis_3, xor_vis_4, xor_vis_5);
+
 struct xor_block_template xor_block_VIS = {
-        .name	= "VIS",
-        .do_2	= xor_vis_2,
-        .do_3	= xor_vis_3,
-        .do_4	= xor_vis_4,
-        .do_5	= xor_vis_5,
+        .name		= "VIS",
+	.xor_gen	= xor_gen_vis,
 };
diff --git a/lib/raid/xor/x86/xor-avx.c b/lib/raid/xor/x86/xor-avx.c
index d411efa1ff43..f7777d7aa269 100644
--- a/lib/raid/xor/x86/xor-avx.c
+++ b/lib/raid/xor/x86/xor-avx.c
@@ -29,8 +29,6 @@ static void xor_avx_2(unsigned long bytes, unsigned long * __restrict p0,
 {
 	unsigned long lines = bytes >> 9;
 
-	kernel_fpu_begin();
-
 	while (lines--) {
 #undef BLOCK
 #define BLOCK(i, reg) \
@@ -47,8 +45,6 @@ do { \
 		p0 = (unsigned long *)((uintptr_t)p0 + 512);
 		p1 = (unsigned long *)((uintptr_t)p1 + 512);
 	}
-
-	kernel_fpu_end();
 }
 
 static void xor_avx_3(unsigned long bytes, unsigned long * __restrict p0,
@@ -57,8 +53,6 @@ static void xor_avx_3(unsigned long bytes, unsigned long * __restrict p0,
 {
 	unsigned long lines = bytes >> 9;
 
-	kernel_fpu_begin();
-
 	while (lines--) {
 #undef BLOCK
 #define BLOCK(i, reg) \
@@ -78,8 +72,6 @@ do { \
 		p1 = (unsigned long *)((uintptr_t)p1 + 512);
 		p2 = (unsigned long *)((uintptr_t)p2 + 512);
 	}
-
-	kernel_fpu_end();
 }
 
 static void xor_avx_4(unsigned long bytes, unsigned long * __restrict p0,
@@ -89,8 +81,6 @@ static void xor_avx_4(unsigned long bytes, unsigned long * __restrict p0,
 {
 	unsigned long lines = bytes >> 9;
 
-	kernel_fpu_begin();
-
 	while (lines--) {
 #undef BLOCK
 #define BLOCK(i, reg) \
@@ -113,8 +103,6 @@ do { \
 		p2 = (unsigned long *)((uintptr_t)p2 + 512);
 		p3 = (unsigned long *)((uintptr_t)p3 + 512);
 	}
-
-	kernel_fpu_end();
 }
 
 static void xor_avx_5(unsigned long bytes, unsigned long * __restrict p0,
@@ -125,8 +113,6 @@ static void xor_avx_5(unsigned long bytes, unsigned long * __restrict p0,
 {
 	unsigned long lines = bytes >> 9;
 
-	kernel_fpu_begin();
-
 	while (lines--) {
 #undef BLOCK
 #define BLOCK(i, reg) \
@@ -152,14 +138,19 @@ do { \
 		p3 = (unsigned long *)((uintptr_t)p3 + 512);
 		p4 = (unsigned long *)((uintptr_t)p4 + 512);
 	}
+}
+
+DO_XOR_BLOCKS(avx_inner, xor_avx_2, xor_avx_3, xor_avx_4, xor_avx_5);
 
+static void xor_gen_avx(void *dest, void **srcs, unsigned int src_cnt,
+			unsigned int bytes)
+{
+	kernel_fpu_begin();
+	xor_gen_avx_inner(dest, srcs, src_cnt, bytes);
 	kernel_fpu_end();
 }
 
 struct xor_block_template xor_block_avx = {
-	.name = "avx",
-	.do_2 = xor_avx_2,
-	.do_3 = xor_avx_3,
-	.do_4 = xor_avx_4,
-	.do_5 = xor_avx_5,
+	.name		= "avx",
+	.xor_gen	= xor_gen_avx,
 };
diff --git a/lib/raid/xor/x86/xor-mmx.c b/lib/raid/xor/x86/xor-mmx.c
index e48c58f92874..63a8b0444fce 100644
--- a/lib/raid/xor/x86/xor-mmx.c
+++ b/lib/raid/xor/x86/xor-mmx.c
@@ -21,8 +21,6 @@ xor_pII_mmx_2(unsigned long bytes, unsigned long * __restrict p1,
 {
 	unsigned long lines = bytes >> 7;
 
-	kernel_fpu_begin();
-
 	asm volatile(
 #undef BLOCK
 #define BLOCK(i)				\
@@ -55,8 +53,6 @@ xor_pII_mmx_2(unsigned long bytes, unsigned long * __restrict p1,
 	  "+r" (p1), "+r" (p2)
 	:
 	: "memory");
-
-	kernel_fpu_end();
 }
 
 static void
@@ -66,8 +62,6 @@ xor_pII_mmx_3(unsigned long bytes, unsigned long * __restrict p1,
 {
 	unsigned long lines = bytes >> 7;
 
-	kernel_fpu_begin();
-
 	asm volatile(
 #undef BLOCK
 #define BLOCK(i)				\
@@ -105,8 +99,6 @@ xor_pII_mmx_3(unsigned long bytes, unsigned long * __restrict p1,
 	  "+r" (p1), "+r" (p2), "+r" (p3)
 	:
 	: "memory");
-
-	kernel_fpu_end();
 }
 
 static void
@@ -117,8 +109,6 @@ xor_pII_mmx_4(unsigned long bytes, unsigned long * __restrict p1,
 {
 	unsigned long lines = bytes >> 7;
 
-	kernel_fpu_begin();
-
 	asm volatile(
 #undef BLOCK
 #define BLOCK(i)				\
@@ -161,8 +151,6 @@ xor_pII_mmx_4(unsigned long bytes, unsigned long * __restrict p1,
 	  "+r" (p1), "+r" (p2), "+r" (p3), "+r" (p4)
 	:
 	: "memory");
-
-	kernel_fpu_end();
 }
 
 
@@ -175,8 +163,6 @@ xor_pII_mmx_5(unsigned long bytes, unsigned long * __restrict p1,
 {
 	unsigned long lines = bytes >> 7;
 
-	kernel_fpu_begin();
-
 	/* Make sure GCC forgets anything it knows about p4 or p5,
 	   such that it won't pass to the asm volatile below a
 	   register that is shared with any other variable.  That's
@@ -237,8 +223,6 @@ xor_pII_mmx_5(unsigned long bytes, unsigned long * __restrict p1,
 	   Clobber them just to be sure nobody does something stupid
 	   like assuming they have some legal value.  */
 	asm("" : "=r" (p4), "=r" (p5));
-
-	kernel_fpu_end();
 }
 
 #undef LD
@@ -255,8 +239,6 @@ xor_p5_mmx_2(unsigned long bytes, unsigned long * __restrict p1,
 {
 	unsigned long lines = bytes >> 6;
 
-	kernel_fpu_begin();
-
 	asm volatile(
 	" .align 32	             ;\n"
 	" 1:                         ;\n"
@@ -293,8 +275,6 @@ xor_p5_mmx_2(unsigned long bytes, unsigned long * __restrict p1,
 	  "+r" (p1), "+r" (p2)
 	:
 	: "memory");
-
-	kernel_fpu_end();
 }
 
 static void
@@ -304,8 +284,6 @@ xor_p5_mmx_3(unsigned long bytes, unsigned long * __restrict p1,
 {
 	unsigned long lines = bytes >> 6;
 
-	kernel_fpu_begin();
-
 	asm volatile(
 	" .align 32,0x90             ;\n"
 	" 1:                         ;\n"
@@ -351,8 +329,6 @@ xor_p5_mmx_3(unsigned long bytes, unsigned long * __restrict p1,
 	  "+r" (p1), "+r" (p2), "+r" (p3)
 	:
 	: "memory" );
-
-	kernel_fpu_end();
 }
 
 static void
@@ -363,8 +339,6 @@ xor_p5_mmx_4(unsigned long bytes, unsigned long * __restrict p1,
 {
 	unsigned long lines = bytes >> 6;
 
-	kernel_fpu_begin();
-
 	asm volatile(
 	" .align 32,0x90             ;\n"
 	" 1:                         ;\n"
@@ -419,8 +393,6 @@ xor_p5_mmx_4(unsigned long bytes, unsigned long * __restrict p1,
 	  "+r" (p1), "+r" (p2), "+r" (p3), "+r" (p4)
 	:
 	: "memory");
-
-	kernel_fpu_end();
 }
 
 static void
@@ -432,8 +404,6 @@ xor_p5_mmx_5(unsigned long bytes, unsigned long * __restrict p1,
 {
 	unsigned long lines = bytes >> 6;
 
-	kernel_fpu_begin();
-
 	/* Make sure GCC forgets anything it knows about p4 or p5,
 	   such that it won't pass to the asm volatile below a
 	   register that is shared with any other variable.  That's
@@ -510,22 +480,36 @@ xor_p5_mmx_5(unsigned long bytes, unsigned long * __restrict p1,
 	   Clobber them just to be sure nobody does something stupid
 	   like assuming they have some legal value.  */
 	asm("" : "=r" (p4), "=r" (p5));
+}
+
+DO_XOR_BLOCKS(pII_mmx_inner, xor_pII_mmx_2, xor_pII_mmx_3, xor_pII_mmx_4,
+		xor_pII_mmx_5);
 
+static void xor_gen_pII_mmx(void *dest, void **srcs, unsigned int src_cnt,
+		unsigned int bytes)
+{
+	kernel_fpu_begin();
+	xor_gen_pII_mmx_inner(dest, srcs, src_cnt, bytes);
 	kernel_fpu_end();
 }
 
 struct xor_block_template xor_block_pII_mmx = {
-	.name = "pII_mmx",
-	.do_2 = xor_pII_mmx_2,
-	.do_3 = xor_pII_mmx_3,
-	.do_4 = xor_pII_mmx_4,
-	.do_5 = xor_pII_mmx_5,
+	.name		= "pII_mmx",
+	.xor_gen	= xor_gen_pII_mmx,
 };
 
+DO_XOR_BLOCKS(p5_mmx_inner, xor_p5_mmx_2, xor_p5_mmx_3, xor_p5_mmx_4,
+		xor_p5_mmx_5);
+
+static void xor_gen_p5_mmx(void *dest, void **srcs, unsigned int src_cnt,
+		unsigned int bytes)
+{
+	kernel_fpu_begin();
+	xor_gen_p5_mmx_inner(dest, srcs, src_cnt, bytes);
+	kernel_fpu_end();
+}
+
 struct xor_block_template xor_block_p5_mmx = {
-	.name = "p5_mmx",
-	.do_2 = xor_p5_mmx_2,
-	.do_3 = xor_p5_mmx_3,
-	.do_4 = xor_p5_mmx_4,
-	.do_5 = xor_p5_mmx_5,
+	.name		= "p5_mmx",
+	.xor_gen	= xor_gen_p5_mmx,
 };
diff --git a/lib/raid/xor/x86/xor-sse.c b/lib/raid/xor/x86/xor-sse.c
index 5993ed688c15..c6626ecae6ba 100644
--- a/lib/raid/xor/x86/xor-sse.c
+++ b/lib/raid/xor/x86/xor-sse.c
@@ -51,8 +51,6 @@ xor_sse_2(unsigned long bytes, unsigned long * __restrict p1,
 {
 	unsigned long lines = bytes >> 8;
 
-	kernel_fpu_begin();
-
 	asm volatile(
 #undef BLOCK
 #define BLOCK(i)					\
@@ -93,8 +91,6 @@ xor_sse_2(unsigned long bytes, unsigned long * __restrict p1,
 	  [p1] "+r" (p1), [p2] "+r" (p2)
 	: [inc] XOR_CONSTANT_CONSTRAINT (256UL)
 	: "memory");
-
-	kernel_fpu_end();
 }
 
 static void
@@ -103,8 +99,6 @@ xor_sse_2_pf64(unsigned long bytes, unsigned long * __restrict p1,
 {
 	unsigned long lines = bytes >> 8;
 
-	kernel_fpu_begin();
-
 	asm volatile(
 #undef BLOCK
 #define BLOCK(i)			\
@@ -128,8 +122,6 @@ xor_sse_2_pf64(unsigned long bytes, unsigned long * __restrict p1,
 	  [p1] "+r" (p1), [p2] "+r" (p2)
 	: [inc] XOR_CONSTANT_CONSTRAINT (256UL)
 	: "memory");
-
-	kernel_fpu_end();
 }
 
 static void
@@ -139,8 +131,6 @@ xor_sse_3(unsigned long bytes, unsigned long * __restrict p1,
 {
 	unsigned long lines = bytes >> 8;
 
-	kernel_fpu_begin();
-
 	asm volatile(
 #undef BLOCK
 #define BLOCK(i) \
@@ -188,8 +178,6 @@ xor_sse_3(unsigned long bytes, unsigned long * __restrict p1,
 	  [p1] "+r" (p1), [p2] "+r" (p2), [p3] "+r" (p3)
 	: [inc] XOR_CONSTANT_CONSTRAINT (256UL)
 	: "memory");
-
-	kernel_fpu_end();
 }
 
 static void
@@ -199,8 +187,6 @@ xor_sse_3_pf64(unsigned long bytes, unsigned long * __restrict p1,
 {
 	unsigned long lines = bytes >> 8;
 
-	kernel_fpu_begin();
-
 	asm volatile(
 #undef BLOCK
 #define BLOCK(i)			\
@@ -226,8 +212,6 @@ xor_sse_3_pf64(unsigned long bytes, unsigned long * __restrict p1,
 	  [p1] "+r" (p1), [p2] "+r" (p2), [p3] "+r" (p3)
 	: [inc] XOR_CONSTANT_CONSTRAINT (256UL)
 	: "memory");
-
-	kernel_fpu_end();
 }
 
 static void
@@ -238,8 +222,6 @@ xor_sse_4(unsigned long bytes, unsigned long * __restrict p1,
 {
 	unsigned long lines = bytes >> 8;
 
-	kernel_fpu_begin();
-
 	asm volatile(
 #undef BLOCK
 #define BLOCK(i) \
@@ -294,8 +276,6 @@ xor_sse_4(unsigned long bytes, unsigned long * __restrict p1,
 	  [p2] "+r" (p2), [p3] "+r" (p3), [p4] "+r" (p4)
 	: [inc] XOR_CONSTANT_CONSTRAINT (256UL)
 	: "memory");
-
-	kernel_fpu_end();
 }
 
 static void
@@ -306,8 +286,6 @@ xor_sse_4_pf64(unsigned long bytes, unsigned long * __restrict p1,
 {
 	unsigned long lines = bytes >> 8;
 
-	kernel_fpu_begin();
-
 	asm volatile(
 #undef BLOCK
 #define BLOCK(i)			\
@@ -335,8 +313,6 @@ xor_sse_4_pf64(unsigned long bytes, unsigned long * __restrict p1,
 	  [p2] "+r" (p2), [p3] "+r" (p3), [p4] "+r" (p4)
 	: [inc] XOR_CONSTANT_CONSTRAINT (256UL)
 	: "memory");
-
-	kernel_fpu_end();
 }
 
 static void
@@ -348,8 +324,6 @@ xor_sse_5(unsigned long bytes, unsigned long * __restrict p1,
 {
 	unsigned long lines = bytes >> 8;
 
-	kernel_fpu_begin();
-
 	asm volatile(
 #undef BLOCK
 #define BLOCK(i) \
@@ -411,8 +385,6 @@ xor_sse_5(unsigned long bytes, unsigned long * __restrict p1,
 	  [p3] "+r" (p3), [p4] "+r" (p4), [p5] "+r" (p5)
 	: [inc] XOR_CONSTANT_CONSTRAINT (256UL)
 	: "memory");
-
-	kernel_fpu_end();
 }
 
 static void
@@ -424,8 +396,6 @@ xor_sse_5_pf64(unsigned long bytes, unsigned long * __restrict p1,
 {
 	unsigned long lines = bytes >> 8;
 
-	kernel_fpu_begin();
-
 	asm volatile(
 #undef BLOCK
 #define BLOCK(i)			\
@@ -455,22 +425,35 @@ xor_sse_5_pf64(unsigned long bytes, unsigned long * __restrict p1,
 	  [p3] "+r" (p3), [p4] "+r" (p4), [p5] "+r" (p5)
 	: [inc] XOR_CONSTANT_CONSTRAINT (256UL)
 	: "memory");
+}
+
+DO_XOR_BLOCKS(sse_inner, xor_sse_2, xor_sse_3, xor_sse_4, xor_sse_5);
 
+static void xor_gen_sse(void *dest, void **srcs, unsigned int src_cnt,
+			unsigned int bytes)
+{
+	kernel_fpu_begin();
+	xor_gen_sse_inner(dest, srcs, src_cnt, bytes);
 	kernel_fpu_end();
 }
 
 struct xor_block_template xor_block_sse = {
-	.name = "sse",
-	.do_2 = xor_sse_2,
-	.do_3 = xor_sse_3,
-	.do_4 = xor_sse_4,
-	.do_5 = xor_sse_5,
+	.name		= "sse",
+	.xor_gen	= xor_gen_sse,
 };
 
+DO_XOR_BLOCKS(sse_pf64_inner, xor_sse_2_pf64, xor_sse_3_pf64, xor_sse_4_pf64,
+		xor_sse_5_pf64);
+
+static void xor_gen_sse_pf64(void *dest, void **srcs, unsigned int src_cnt,
+			unsigned int bytes)
+{
+	kernel_fpu_begin();
+	xor_gen_sse_pf64_inner(dest, srcs, src_cnt, bytes);
+	kernel_fpu_end();
+}
+
 struct xor_block_template xor_block_sse_pf64 = {
-	.name = "prefetch64-sse",
-	.do_2 = xor_sse_2_pf64,
-	.do_3 = xor_sse_3_pf64,
-	.do_4 = xor_sse_4_pf64,
-	.do_5 = xor_sse_5_pf64,
+	.name		= "prefetch64-sse",
+	.xor_gen	= xor_gen_sse_pf64,
 };
diff --git a/lib/raid/xor/xor-32regs-prefetch.c b/lib/raid/xor/xor-32regs-prefetch.c
index 2856a8e50cb8..ade2a7d8cbe2 100644
--- a/lib/raid/xor/xor-32regs-prefetch.c
+++ b/lib/raid/xor/xor-32regs-prefetch.c
@@ -258,10 +258,10 @@ xor_32regs_p_5(unsigned long bytes, unsigned long * __restrict p1,
 		goto once_more;
 }
 
+DO_XOR_BLOCKS(32regs_p, xor_32regs_p_2, xor_32regs_p_3, xor_32regs_p_4,
+		xor_32regs_p_5);
+
 struct xor_block_template xor_block_32regs_p = {
-	.name = "32regs_prefetch",
-	.do_2 = xor_32regs_p_2,
-	.do_3 = xor_32regs_p_3,
-	.do_4 = xor_32regs_p_4,
-	.do_5 = xor_32regs_p_5,
+	.name		= "32regs_prefetch",
+	.xor_gen	= xor_gen_32regs_p,
 };
diff --git a/lib/raid/xor/xor-32regs.c b/lib/raid/xor/xor-32regs.c
index cc44d64032fa..acb4a10d1e95 100644
--- a/lib/raid/xor/xor-32regs.c
+++ b/lib/raid/xor/xor-32regs.c
@@ -209,10 +209,9 @@ xor_32regs_5(unsigned long bytes, unsigned long * __restrict p1,
 	} while (--lines > 0);
 }
 
+DO_XOR_BLOCKS(32regs, xor_32regs_2, xor_32regs_3, xor_32regs_4, xor_32regs_5);
+
 struct xor_block_template xor_block_32regs = {
-	.name = "32regs",
-	.do_2 = xor_32regs_2,
-	.do_3 = xor_32regs_3,
-	.do_4 = xor_32regs_4,
-	.do_5 = xor_32regs_5,
+	.name		= "32regs",
+	.xor_gen	= xor_gen_32regs,
 };
diff --git a/lib/raid/xor/xor-8regs-prefetch.c b/lib/raid/xor/xor-8regs-prefetch.c
index 1d53aec50d27..451527a951b1 100644
--- a/lib/raid/xor/xor-8regs-prefetch.c
+++ b/lib/raid/xor/xor-8regs-prefetch.c
@@ -136,10 +136,11 @@ xor_8regs_p_5(unsigned long bytes, unsigned long * __restrict p1,
 		goto once_more;
 }
 
+
+DO_XOR_BLOCKS(8regs_p, xor_8regs_p_2, xor_8regs_p_3, xor_8regs_p_4,
+		xor_8regs_p_5);
+
 struct xor_block_template xor_block_8regs_p = {
-	.name = "8regs_prefetch",
-	.do_2 = xor_8regs_p_2,
-	.do_3 = xor_8regs_p_3,
-	.do_4 = xor_8regs_p_4,
-	.do_5 = xor_8regs_p_5,
+	.name		= "8regs_prefetch",
+	.xor_gen	= xor_gen_8regs_p,
 };
diff --git a/lib/raid/xor/xor-8regs.c b/lib/raid/xor/xor-8regs.c
index 72a44e898c55..1edaed8acffe 100644
--- a/lib/raid/xor/xor-8regs.c
+++ b/lib/raid/xor/xor-8regs.c
@@ -94,11 +94,10 @@ xor_8regs_5(unsigned long bytes, unsigned long * __restrict p1,
 }
 
 #ifndef NO_TEMPLATE
+DO_XOR_BLOCKS(8regs, xor_8regs_2, xor_8regs_3, xor_8regs_4, xor_8regs_5);
+
 struct xor_block_template xor_block_8regs = {
-	.name = "8regs",
-	.do_2 = xor_8regs_2,
-	.do_3 = xor_8regs_3,
-	.do_4 = xor_8regs_4,
-	.do_5 = xor_8regs_5,
+	.name		= "8regs",
+	.xor_gen	= xor_gen_8regs,
 };
 #endif /* NO_TEMPLATE */
diff --git a/lib/raid/xor/xor-core.c b/lib/raid/xor/xor-core.c
index b7c29ca931ec..f18dcc57004b 100644
--- a/lib/raid/xor/xor-core.c
+++ b/lib/raid/xor/xor-core.c
@@ -13,39 +13,9 @@
 #include <linux/preempt.h>
 #include "xor_impl.h"
 
-/* The xor routines to use.  */
+/* The xor routine to use.  */
 static struct xor_block_template *active_template;
 
-void
-xor_blocks(unsigned int src_count, unsigned int bytes, void *dest, void **srcs)
-{
-	unsigned long *p1, *p2, *p3, *p4;
-
-	WARN_ON_ONCE(in_interrupt());
-
-	p1 = (unsigned long *) srcs[0];
-	if (src_count == 1) {
-		active_template->do_2(bytes, dest, p1);
-		return;
-	}
-
-	p2 = (unsigned long *) srcs[1];
-	if (src_count == 2) {
-		active_template->do_3(bytes, dest, p1, p2);
-		return;
-	}
-
-	p3 = (unsigned long *) srcs[2];
-	if (src_count == 3) {
-		active_template->do_4(bytes, dest, p1, p2, p3);
-		return;
-	}
-
-	p4 = (unsigned long *) srcs[3];
-	active_template->do_5(bytes, dest, p1, p2, p3, p4);
-}
-EXPORT_SYMBOL(xor_blocks);
-
 /**
  * xor_gen - generate RAID-style XOR information
  * @dest:	destination vector
@@ -61,16 +31,8 @@ EXPORT_SYMBOL(xor_blocks);
  */
 void xor_gen(void *dest, void **srcs, unsigned int src_cnt, unsigned int bytes)
 {
-	unsigned int src_off = 0;
-
-	while (src_cnt > 0) {
-		unsigned int this_cnt = min(src_cnt, MAX_XOR_BLOCKS);
-
-		xor_blocks(this_cnt, bytes, dest, srcs + src_off);
-
-		src_cnt -= this_cnt;
-		src_off += this_cnt;
-	}
+	WARN_ON_ONCE(in_interrupt());
+	active_template->xor_gen(dest, srcs, src_cnt, bytes);
 }
 EXPORT_SYMBOL(xor_gen);
 
@@ -114,6 +76,7 @@ do_xor_speed(struct xor_block_template *tmpl, void *b1, void *b2)
 	int speed;
 	unsigned long reps;
 	ktime_t min, start, t0;
+	void *srcs[1] = { b2 };
 
 	preempt_disable();
 
@@ -124,7 +87,7 @@ do_xor_speed(struct xor_block_template *tmpl, void *b1, void *b2)
 		cpu_relax();
 	do {
 		mb(); /* prevent loop optimization */
-		tmpl->do_2(BENCH_SIZE, b1, b2);
+		tmpl->xor_gen(b1, srcs, 1, BENCH_SIZE);
 		mb();
 	} while (reps++ < REPS || (t0 = ktime_get()) == start);
 	min = ktime_sub(t0, start);
diff --git a/lib/raid/xor/xor_impl.h b/lib/raid/xor/xor_impl.h
index 44b6c99e2093..968dd07df627 100644
--- a/lib/raid/xor/xor_impl.h
+++ b/lib/raid/xor/xor_impl.h
@@ -3,27 +3,47 @@
 #define _XOR_IMPL_H
 
 #include <linux/init.h>
+#include <linux/minmax.h>
 
 struct xor_block_template {
 	struct xor_block_template *next;
 	const char *name;
 	int speed;
-	void (*do_2)(unsigned long, unsigned long * __restrict,
-		     const unsigned long * __restrict);
-	void (*do_3)(unsigned long, unsigned long * __restrict,
-		     const unsigned long * __restrict,
-		     const unsigned long * __restrict);
-	void (*do_4)(unsigned long, unsigned long * __restrict,
-		     const unsigned long * __restrict,
-		     const unsigned long * __restrict,
-		     const unsigned long * __restrict);
-	void (*do_5)(unsigned long, unsigned long * __restrict,
-		     const unsigned long * __restrict,
-		     const unsigned long * __restrict,
-		     const unsigned long * __restrict,
-		     const unsigned long * __restrict);
+	void (*xor_gen)(void *dest, void **srcs, unsigned int src_cnt,
+			unsigned int bytes);
 };
 
+#define __DO_XOR_BLOCKS(_name, _handle1, _handle2, _handle3, _handle4)	\
+void								\
+xor_gen_##_name(void *dest, void **srcs, unsigned int src_cnt,		\
+		unsigned int bytes)					\
+{									\
+	unsigned int src_off = 0;					\
+									\
+	while (src_cnt > 0) {						\
+		unsigned int this_cnt = min(src_cnt, 4);		\
+		unsigned long *p1 = (unsigned long *)srcs[src_off];	\
+		unsigned long *p2 = (unsigned long *)srcs[src_off + 1];	\
+		unsigned long *p3 = (unsigned long *)srcs[src_off + 2];	\
+		unsigned long *p4 = (unsigned long *)srcs[src_off + 3];	\
+									\
+		if (this_cnt == 1)					\
+			_handle1(bytes, dest, p1);			\
+		else if (this_cnt == 2)					\
+			_handle2(bytes, dest, p1, p2);			\
+		else if (this_cnt == 3)					\
+			_handle3(bytes, dest, p1, p2, p3);		\
+		else							\
+			_handle4(bytes, dest, p1, p2, p3, p4);		\
+									\
+		src_cnt -= this_cnt;					\
+		src_off += this_cnt;					\
+	}								\
+}
+
+#define DO_XOR_BLOCKS(_name, _handle1, _handle2, _handle3, _handle4)	\
+	static __DO_XOR_BLOCKS(_name, _handle1, _handle2, _handle3, _handle4)
+
 /* generic implementations */
 extern struct xor_block_template xor_block_8regs;
 extern struct xor_block_template xor_block_32regs;
-- 
2.47.3


