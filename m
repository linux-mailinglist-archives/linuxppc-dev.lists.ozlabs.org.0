Return-Path: <linuxppc-dev+bounces-17294-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJdeEjVjoGk0jAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17294-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 16:13:57 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 094D41A85C2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 16:13:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMFLD2L5Yz3cCM;
	Fri, 27 Feb 2026 02:12:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772118724;
	cv=none; b=oe5PJcb1qy4/XgQ4lYVSNbKt3vqlKayhWH6gxaQ3xlZqK7//Wh/wR+79nA5+BONkgJDWMHhnK7enkGr6HQvQxEgQB2EgNaofFaRJCUVimN7yUDw5R118BGoxTI/+4C+/j3iienXFp8Rhpwu3vK2sJ/dPzU3N5gegk0fsY7sql2xTesfmQ9GvFUaL3473abLY6ypSd+Oz342oBhdjlvZqQxXg7n9G3kniP94Ayeuz0wz3GITEsmpgRtkhMXCPMoVqPyK7oz/aZHXK/FwOKgcNgQ3Ub5O4kHV6ZfuRwp0JVf8SiFAMkoeCrKUtq8VinwUlmwl/KtmZVYKEkSIt5MRUbA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772118724; c=relaxed/relaxed;
	bh=UZ1AI4WO/A62adxyb/Oc887TemGMIj0BXG02atwm4qQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=difsxOKpqVVxIUNIc55SOd73UU4jX3BgB3Sz7gGFZspcNQH9YbvmFbbJ2L2tuPek/vWdLlG1i/WEEv8BO7grIb1jHqPtaArbp27NzNaGYQ/rRt9UHWwu7SCACSUUFWCFF0sh4dn++JgwIlj7Z2pFmfXJWA841nul8uwDkypdS6i/SRuRCn3ZHA35iDxJELchOc5CHTjrEiEfFx+wE0yzv/IjjqiYxRez2CT96wqyXyBqS6/hdi2fEDdiREk/ONQUS2gqv44D6sW6APxZBSvnbj3TsAm1reT5xArif/RbC2kU7vW2uHhtIwq5/bku/5zOXusKPohrZ+CZ3mXEzHJ95Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=lst.de; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xnHX5/c6; dkim-atps=neutral; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+c5cab09b19de097b6dd3+8222+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xnHX5/c6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+c5cab09b19de097b6dd3+8222+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMFL20m8dz3btS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 02:11:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=UZ1AI4WO/A62adxyb/Oc887TemGMIj0BXG02atwm4qQ=; b=xnHX5/c6BLaL+eGizbHcSes+Vt
	S1cd5vaUrpdJf9mzPQMBfkesh+HM48Hc5m2bZhcu1NPiT6ka3K208aaJLoVM2EBZGxoHBw4N+JXXs
	cLOtYlU12aYj5F9sRlJhDdkhkuFvUFg7sEueuEX2zq1e2RZmBOq8ALvupG6Og4YsX7SDz69wqZY33
	XH0k/6iK9vwqm0nbg1ZOTTIo1VmSMPZAkv54L49nDY20ur9kVMJIW5L0paC52VNiKXAqnk1+VecYe
	oX6eSviAc8mPByoDJIXmzSPqBp9C8YrKZgvPWIQbFe3QOax+bpSXTUgZWQOcg7nkOW9OmGI8RMV3h
	yCWa+bxw==;
Received: from [4.28.11.157] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvd1O-00000006Q8M-09qg;
	Thu, 26 Feb 2026 15:11:22 +0000
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
Subject: [PATCH 10/25] alpha: move the XOR code to lib/raid/
Date: Thu, 26 Feb 2026 07:10:22 -0800
Message-ID: <20260226151106.144735-11-hch@lst.de>
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
	HEADER_FROM_DIFFERENT_DOMAINS,LOTS_OF_MONEY,SPF_HELO_NONE,SPF_NONE
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
	TAGGED_FROM(0.00)[bounces-17294-lists,linuxppc-dev=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:mid,lst.de:email,infradead.org:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 094D41A85C2
X-Rspamd-Action: no action

Move the optimized XOR code out of line into lib/raid.

Note that the giant inline assembly block might be better off as a
separate assembly source file now, but I'll leave that to the alpha
maintainers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/alpha/include/asm/xor.h | 853 +----------------------------------
 lib/raid/xor/Makefile        |   2 +
 lib/raid/xor/alpha/xor.c     | 849 ++++++++++++++++++++++++++++++++++
 3 files changed, 855 insertions(+), 849 deletions(-)
 create mode 100644 lib/raid/xor/alpha/xor.c

diff --git a/arch/alpha/include/asm/xor.h b/arch/alpha/include/asm/xor.h
index 4c8085711df1..e517be577a09 100644
--- a/arch/alpha/include/asm/xor.h
+++ b/arch/alpha/include/asm/xor.h
@@ -1,856 +1,11 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * include/asm-alpha/xor.h
- *
- * Optimized RAID-5 checksumming functions for alpha EV5 and EV6
- */
-
-extern void
-xor_alpha_2(unsigned long bytes, unsigned long * __restrict p1,
-	    const unsigned long * __restrict p2);
-extern void
-xor_alpha_3(unsigned long bytes, unsigned long * __restrict p1,
-	    const unsigned long * __restrict p2,
-	    const unsigned long * __restrict p3);
-extern void
-xor_alpha_4(unsigned long bytes, unsigned long * __restrict p1,
-	    const unsigned long * __restrict p2,
-	    const unsigned long * __restrict p3,
-	    const unsigned long * __restrict p4);
-extern void
-xor_alpha_5(unsigned long bytes, unsigned long * __restrict p1,
-	    const unsigned long * __restrict p2,
-	    const unsigned long * __restrict p3,
-	    const unsigned long * __restrict p4,
-	    const unsigned long * __restrict p5);
-
-extern void
-xor_alpha_prefetch_2(unsigned long bytes, unsigned long * __restrict p1,
-		     const unsigned long * __restrict p2);
-extern void
-xor_alpha_prefetch_3(unsigned long bytes, unsigned long * __restrict p1,
-		     const unsigned long * __restrict p2,
-		     const unsigned long * __restrict p3);
-extern void
-xor_alpha_prefetch_4(unsigned long bytes, unsigned long * __restrict p1,
-		     const unsigned long * __restrict p2,
-		     const unsigned long * __restrict p3,
-		     const unsigned long * __restrict p4);
-extern void
-xor_alpha_prefetch_5(unsigned long bytes, unsigned long * __restrict p1,
-		     const unsigned long * __restrict p2,
-		     const unsigned long * __restrict p3,
-		     const unsigned long * __restrict p4,
-		     const unsigned long * __restrict p5);
 
-asm("								\n\
-	.text							\n\
-	.align 3						\n\
-	.ent xor_alpha_2					\n\
-xor_alpha_2:							\n\
-	.prologue 0						\n\
-	srl $16, 6, $16						\n\
-	.align 4						\n\
-2:								\n\
-	ldq $0,0($17)						\n\
-	ldq $1,0($18)						\n\
-	ldq $2,8($17)						\n\
-	ldq $3,8($18)						\n\
-								\n\
-	ldq $4,16($17)						\n\
-	ldq $5,16($18)						\n\
-	ldq $6,24($17)						\n\
-	ldq $7,24($18)						\n\
-								\n\
-	ldq $19,32($17)						\n\
-	ldq $20,32($18)						\n\
-	ldq $21,40($17)						\n\
-	ldq $22,40($18)						\n\
-								\n\
-	ldq $23,48($17)						\n\
-	ldq $24,48($18)						\n\
-	ldq $25,56($17)						\n\
-	xor $0,$1,$0		# 7 cycles from $1 load		\n\
-								\n\
-	ldq $27,56($18)						\n\
-	xor $2,$3,$2						\n\
-	stq $0,0($17)						\n\
-	xor $4,$5,$4						\n\
-								\n\
-	stq $2,8($17)						\n\
-	xor $6,$7,$6						\n\
-	stq $4,16($17)						\n\
-	xor $19,$20,$19						\n\
-								\n\
-	stq $6,24($17)						\n\
-	xor $21,$22,$21						\n\
-	stq $19,32($17)						\n\
-	xor $23,$24,$23						\n\
-								\n\
-	stq $21,40($17)						\n\
-	xor $25,$27,$25						\n\
-	stq $23,48($17)						\n\
-	subq $16,1,$16						\n\
-								\n\
-	stq $25,56($17)						\n\
-	addq $17,64,$17						\n\
-	addq $18,64,$18						\n\
-	bgt $16,2b						\n\
-								\n\
-	ret							\n\
-	.end xor_alpha_2					\n\
-								\n\
-	.align 3						\n\
-	.ent xor_alpha_3					\n\
-xor_alpha_3:							\n\
-	.prologue 0						\n\
-	srl $16, 6, $16						\n\
-	.align 4						\n\
-3:								\n\
-	ldq $0,0($17)						\n\
-	ldq $1,0($18)						\n\
-	ldq $2,0($19)						\n\
-	ldq $3,8($17)						\n\
-								\n\
-	ldq $4,8($18)						\n\
-	ldq $6,16($17)						\n\
-	ldq $7,16($18)						\n\
-	ldq $21,24($17)						\n\
-								\n\
-	ldq $22,24($18)						\n\
-	ldq $24,32($17)						\n\
-	ldq $25,32($18)						\n\
-	ldq $5,8($19)						\n\
-								\n\
-	ldq $20,16($19)						\n\
-	ldq $23,24($19)						\n\
-	ldq $27,32($19)						\n\
-	nop							\n\
-								\n\
-	xor $0,$1,$1		# 8 cycles from $0 load		\n\
-	xor $3,$4,$4		# 6 cycles from $4 load		\n\
-	xor $6,$7,$7		# 6 cycles from $7 load		\n\
-	xor $21,$22,$22		# 5 cycles from $22 load	\n\
-								\n\
-	xor $1,$2,$2		# 9 cycles from $2 load		\n\
-	xor $24,$25,$25		# 5 cycles from $25 load	\n\
-	stq $2,0($17)						\n\
-	xor $4,$5,$5		# 6 cycles from $5 load		\n\
-								\n\
-	stq $5,8($17)						\n\
-	xor $7,$20,$20		# 7 cycles from $20 load	\n\
-	stq $20,16($17)						\n\
-	xor $22,$23,$23		# 7 cycles from $23 load	\n\
-								\n\
-	stq $23,24($17)						\n\
-	xor $25,$27,$27		# 7 cycles from $27 load	\n\
-	stq $27,32($17)						\n\
-	nop							\n\
-								\n\
-	ldq $0,40($17)						\n\
-	ldq $1,40($18)						\n\
-	ldq $3,48($17)						\n\
-	ldq $4,48($18)						\n\
-								\n\
-	ldq $6,56($17)						\n\
-	ldq $7,56($18)						\n\
-	ldq $2,40($19)						\n\
-	ldq $5,48($19)						\n\
-								\n\
-	ldq $20,56($19)						\n\
-	xor $0,$1,$1		# 4 cycles from $1 load		\n\
-	xor $3,$4,$4		# 5 cycles from $4 load		\n\
-	xor $6,$7,$7		# 5 cycles from $7 load		\n\
-								\n\
-	xor $1,$2,$2		# 4 cycles from $2 load		\n\
-	xor $4,$5,$5		# 5 cycles from $5 load		\n\
-	stq $2,40($17)						\n\
-	xor $7,$20,$20		# 4 cycles from $20 load	\n\
-								\n\
-	stq $5,48($17)						\n\
-	subq $16,1,$16						\n\
-	stq $20,56($17)						\n\
-	addq $19,64,$19						\n\
-								\n\
-	addq $18,64,$18						\n\
-	addq $17,64,$17						\n\
-	bgt $16,3b						\n\
-	ret							\n\
-	.end xor_alpha_3					\n\
-								\n\
-	.align 3						\n\
-	.ent xor_alpha_4					\n\
-xor_alpha_4:							\n\
-	.prologue 0						\n\
-	srl $16, 6, $16						\n\
-	.align 4						\n\
-4:								\n\
-	ldq $0,0($17)						\n\
-	ldq $1,0($18)						\n\
-	ldq $2,0($19)						\n\
-	ldq $3,0($20)						\n\
-								\n\
-	ldq $4,8($17)						\n\
-	ldq $5,8($18)						\n\
-	ldq $6,8($19)						\n\
-	ldq $7,8($20)						\n\
-								\n\
-	ldq $21,16($17)						\n\
-	ldq $22,16($18)						\n\
-	ldq $23,16($19)						\n\
-	ldq $24,16($20)						\n\
-								\n\
-	ldq $25,24($17)						\n\
-	xor $0,$1,$1		# 6 cycles from $1 load		\n\
-	ldq $27,24($18)						\n\
-	xor $2,$3,$3		# 6 cycles from $3 load		\n\
-								\n\
-	ldq $0,24($19)						\n\
-	xor $1,$3,$3						\n\
-	ldq $1,24($20)						\n\
-	xor $4,$5,$5		# 7 cycles from $5 load		\n\
-								\n\
-	stq $3,0($17)						\n\
-	xor $6,$7,$7						\n\
-	xor $21,$22,$22		# 7 cycles from $22 load	\n\
-	xor $5,$7,$7						\n\
-								\n\
-	stq $7,8($17)						\n\
-	xor $23,$24,$24		# 7 cycles from $24 load	\n\
-	ldq $2,32($17)						\n\
-	xor $22,$24,$24						\n\
-								\n\
-	ldq $3,32($18)						\n\
-	ldq $4,32($19)						\n\
-	ldq $5,32($20)						\n\
-	xor $25,$27,$27		# 8 cycles from $27 load	\n\
-								\n\
-	ldq $6,40($17)						\n\
-	ldq $7,40($18)						\n\
-	ldq $21,40($19)						\n\
-	ldq $22,40($20)						\n\
-								\n\
-	stq $24,16($17)						\n\
-	xor $0,$1,$1		# 9 cycles from $1 load		\n\
-	xor $2,$3,$3		# 5 cycles from $3 load		\n\
-	xor $27,$1,$1						\n\
-								\n\
-	stq $1,24($17)						\n\
-	xor $4,$5,$5		# 5 cycles from $5 load		\n\
-	ldq $23,48($17)						\n\
-	ldq $24,48($18)						\n\
-								\n\
-	ldq $25,48($19)						\n\
-	xor $3,$5,$5						\n\
-	ldq $27,48($20)						\n\
-	ldq $0,56($17)						\n\
-								\n\
-	ldq $1,56($18)						\n\
-	ldq $2,56($19)						\n\
-	xor $6,$7,$7		# 8 cycles from $6 load		\n\
-	ldq $3,56($20)						\n\
-								\n\
-	stq $5,32($17)						\n\
-	xor $21,$22,$22		# 8 cycles from $22 load	\n\
-	xor $7,$22,$22						\n\
-	xor $23,$24,$24		# 5 cycles from $24 load	\n\
-								\n\
-	stq $22,40($17)						\n\
-	xor $25,$27,$27		# 5 cycles from $27 load	\n\
-	xor $24,$27,$27						\n\
-	xor $0,$1,$1		# 5 cycles from $1 load		\n\
-								\n\
-	stq $27,48($17)						\n\
-	xor $2,$3,$3		# 4 cycles from $3 load		\n\
-	xor $1,$3,$3						\n\
-	subq $16,1,$16						\n\
-								\n\
-	stq $3,56($17)						\n\
-	addq $20,64,$20						\n\
-	addq $19,64,$19						\n\
-	addq $18,64,$18						\n\
-								\n\
-	addq $17,64,$17						\n\
-	bgt $16,4b						\n\
-	ret							\n\
-	.end xor_alpha_4					\n\
-								\n\
-	.align 3						\n\
-	.ent xor_alpha_5					\n\
-xor_alpha_5:							\n\
-	.prologue 0						\n\
-	srl $16, 6, $16						\n\
-	.align 4						\n\
-5:								\n\
-	ldq $0,0($17)						\n\
-	ldq $1,0($18)						\n\
-	ldq $2,0($19)						\n\
-	ldq $3,0($20)						\n\
-								\n\
-	ldq $4,0($21)						\n\
-	ldq $5,8($17)						\n\
-	ldq $6,8($18)						\n\
-	ldq $7,8($19)						\n\
-								\n\
-	ldq $22,8($20)						\n\
-	ldq $23,8($21)						\n\
-	ldq $24,16($17)						\n\
-	ldq $25,16($18)						\n\
-								\n\
-	ldq $27,16($19)						\n\
-	xor $0,$1,$1		# 6 cycles from $1 load		\n\
-	ldq $28,16($20)						\n\
-	xor $2,$3,$3		# 6 cycles from $3 load		\n\
-								\n\
-	ldq $0,16($21)						\n\
-	xor $1,$3,$3						\n\
-	ldq $1,24($17)						\n\
-	xor $3,$4,$4		# 7 cycles from $4 load		\n\
-								\n\
-	stq $4,0($17)						\n\
-	xor $5,$6,$6		# 7 cycles from $6 load		\n\
-	xor $7,$22,$22		# 7 cycles from $22 load	\n\
-	xor $6,$23,$23		# 7 cycles from $23 load	\n\
-								\n\
-	ldq $2,24($18)						\n\
-	xor $22,$23,$23						\n\
-	ldq $3,24($19)						\n\
-	xor $24,$25,$25		# 8 cycles from $25 load	\n\
-								\n\
-	stq $23,8($17)						\n\
-	xor $25,$27,$27		# 8 cycles from $27 load	\n\
-	ldq $4,24($20)						\n\
-	xor $28,$0,$0		# 7 cycles from $0 load		\n\
-								\n\
-	ldq $5,24($21)						\n\
-	xor $27,$0,$0						\n\
-	ldq $6,32($17)						\n\
-	ldq $7,32($18)						\n\
-								\n\
-	stq $0,16($17)						\n\
-	xor $1,$2,$2		# 6 cycles from $2 load		\n\
-	ldq $22,32($19)						\n\
-	xor $3,$4,$4		# 4 cycles from $4 load		\n\
-								\n\
-	ldq $23,32($20)						\n\
-	xor $2,$4,$4						\n\
-	ldq $24,32($21)						\n\
-	ldq $25,40($17)						\n\
-								\n\
-	ldq $27,40($18)						\n\
-	ldq $28,40($19)						\n\
-	ldq $0,40($20)						\n\
-	xor $4,$5,$5		# 7 cycles from $5 load		\n\
-								\n\
-	stq $5,24($17)						\n\
-	xor $6,$7,$7		# 7 cycles from $7 load		\n\
-	ldq $1,40($21)						\n\
-	ldq $2,48($17)						\n\
-								\n\
-	ldq $3,48($18)						\n\
-	xor $7,$22,$22		# 7 cycles from $22 load	\n\
-	ldq $4,48($19)						\n\
-	xor $23,$24,$24		# 6 cycles from $24 load	\n\
-								\n\
-	ldq $5,48($20)						\n\
-	xor $22,$24,$24						\n\
-	ldq $6,48($21)						\n\
-	xor $25,$27,$27		# 7 cycles from $27 load	\n\
-								\n\
-	stq $24,32($17)						\n\
-	xor $27,$28,$28		# 8 cycles from $28 load	\n\
-	ldq $7,56($17)						\n\
-	xor $0,$1,$1		# 6 cycles from $1 load		\n\
-								\n\
-	ldq $22,56($18)						\n\
-	ldq $23,56($19)						\n\
-	ldq $24,56($20)						\n\
-	ldq $25,56($21)						\n\
-								\n\
-	xor $28,$1,$1						\n\
-	xor $2,$3,$3		# 9 cycles from $3 load		\n\
-	xor $3,$4,$4		# 9 cycles from $4 load		\n\
-	xor $5,$6,$6		# 8 cycles from $6 load		\n\
-								\n\
-	stq $1,40($17)						\n\
-	xor $4,$6,$6						\n\
-	xor $7,$22,$22		# 7 cycles from $22 load	\n\
-	xor $23,$24,$24		# 6 cycles from $24 load	\n\
-								\n\
-	stq $6,48($17)						\n\
-	xor $22,$24,$24						\n\
-	subq $16,1,$16						\n\
-	xor $24,$25,$25		# 8 cycles from $25 load	\n\
-								\n\
-	stq $25,56($17)						\n\
-	addq $21,64,$21						\n\
-	addq $20,64,$20						\n\
-	addq $19,64,$19						\n\
-								\n\
-	addq $18,64,$18						\n\
-	addq $17,64,$17						\n\
-	bgt $16,5b						\n\
-	ret							\n\
-	.end xor_alpha_5					\n\
-								\n\
-	.align 3						\n\
-	.ent xor_alpha_prefetch_2				\n\
-xor_alpha_prefetch_2:						\n\
-	.prologue 0						\n\
-	srl $16, 6, $16						\n\
-								\n\
-	ldq $31, 0($17)						\n\
-	ldq $31, 0($18)						\n\
-								\n\
-	ldq $31, 64($17)					\n\
-	ldq $31, 64($18)					\n\
-								\n\
-	ldq $31, 128($17)					\n\
-	ldq $31, 128($18)					\n\
-								\n\
-	ldq $31, 192($17)					\n\
-	ldq $31, 192($18)					\n\
-	.align 4						\n\
-2:								\n\
-	ldq $0,0($17)						\n\
-	ldq $1,0($18)						\n\
-	ldq $2,8($17)						\n\
-	ldq $3,8($18)						\n\
-								\n\
-	ldq $4,16($17)						\n\
-	ldq $5,16($18)						\n\
-	ldq $6,24($17)						\n\
-	ldq $7,24($18)						\n\
-								\n\
-	ldq $19,32($17)						\n\
-	ldq $20,32($18)						\n\
-	ldq $21,40($17)						\n\
-	ldq $22,40($18)						\n\
-								\n\
-	ldq $23,48($17)						\n\
-	ldq $24,48($18)						\n\
-	ldq $25,56($17)						\n\
-	ldq $27,56($18)						\n\
-								\n\
-	ldq $31,256($17)					\n\
-	xor $0,$1,$0		# 8 cycles from $1 load		\n\
-	ldq $31,256($18)					\n\
-	xor $2,$3,$2						\n\
-								\n\
-	stq $0,0($17)						\n\
-	xor $4,$5,$4						\n\
-	stq $2,8($17)						\n\
-	xor $6,$7,$6						\n\
-								\n\
-	stq $4,16($17)						\n\
-	xor $19,$20,$19						\n\
-	stq $6,24($17)						\n\
-	xor $21,$22,$21						\n\
-								\n\
-	stq $19,32($17)						\n\
-	xor $23,$24,$23						\n\
-	stq $21,40($17)						\n\
-	xor $25,$27,$25						\n\
-								\n\
-	stq $23,48($17)						\n\
-	subq $16,1,$16						\n\
-	stq $25,56($17)						\n\
-	addq $17,64,$17						\n\
-								\n\
-	addq $18,64,$18						\n\
-	bgt $16,2b						\n\
-	ret							\n\
-	.end xor_alpha_prefetch_2				\n\
-								\n\
-	.align 3						\n\
-	.ent xor_alpha_prefetch_3				\n\
-xor_alpha_prefetch_3:						\n\
-	.prologue 0						\n\
-	srl $16, 6, $16						\n\
-								\n\
-	ldq $31, 0($17)						\n\
-	ldq $31, 0($18)						\n\
-	ldq $31, 0($19)						\n\
-								\n\
-	ldq $31, 64($17)					\n\
-	ldq $31, 64($18)					\n\
-	ldq $31, 64($19)					\n\
-								\n\
-	ldq $31, 128($17)					\n\
-	ldq $31, 128($18)					\n\
-	ldq $31, 128($19)					\n\
-								\n\
-	ldq $31, 192($17)					\n\
-	ldq $31, 192($18)					\n\
-	ldq $31, 192($19)					\n\
-	.align 4						\n\
-3:								\n\
-	ldq $0,0($17)						\n\
-	ldq $1,0($18)						\n\
-	ldq $2,0($19)						\n\
-	ldq $3,8($17)						\n\
-								\n\
-	ldq $4,8($18)						\n\
-	ldq $6,16($17)						\n\
-	ldq $7,16($18)						\n\
-	ldq $21,24($17)						\n\
-								\n\
-	ldq $22,24($18)						\n\
-	ldq $24,32($17)						\n\
-	ldq $25,32($18)						\n\
-	ldq $5,8($19)						\n\
-								\n\
-	ldq $20,16($19)						\n\
-	ldq $23,24($19)						\n\
-	ldq $27,32($19)						\n\
-	nop							\n\
-								\n\
-	xor $0,$1,$1		# 8 cycles from $0 load		\n\
-	xor $3,$4,$4		# 7 cycles from $4 load		\n\
-	xor $6,$7,$7		# 6 cycles from $7 load		\n\
-	xor $21,$22,$22		# 5 cycles from $22 load	\n\
-								\n\
-	xor $1,$2,$2		# 9 cycles from $2 load		\n\
-	xor $24,$25,$25		# 5 cycles from $25 load	\n\
-	stq $2,0($17)						\n\
-	xor $4,$5,$5		# 6 cycles from $5 load		\n\
-								\n\
-	stq $5,8($17)						\n\
-	xor $7,$20,$20		# 7 cycles from $20 load	\n\
-	stq $20,16($17)						\n\
-	xor $22,$23,$23		# 7 cycles from $23 load	\n\
-								\n\
-	stq $23,24($17)						\n\
-	xor $25,$27,$27		# 7 cycles from $27 load	\n\
-	stq $27,32($17)						\n\
-	nop							\n\
-								\n\
-	ldq $0,40($17)						\n\
-	ldq $1,40($18)						\n\
-	ldq $3,48($17)						\n\
-	ldq $4,48($18)						\n\
-								\n\
-	ldq $6,56($17)						\n\
-	ldq $7,56($18)						\n\
-	ldq $2,40($19)						\n\
-	ldq $5,48($19)						\n\
-								\n\
-	ldq $20,56($19)						\n\
-	ldq $31,256($17)					\n\
-	ldq $31,256($18)					\n\
-	ldq $31,256($19)					\n\
-								\n\
-	xor $0,$1,$1		# 6 cycles from $1 load		\n\
-	xor $3,$4,$4		# 5 cycles from $4 load		\n\
-	xor $6,$7,$7		# 5 cycles from $7 load		\n\
-	xor $1,$2,$2		# 4 cycles from $2 load		\n\
-								\n\
-	xor $4,$5,$5		# 5 cycles from $5 load		\n\
-	xor $7,$20,$20		# 4 cycles from $20 load	\n\
-	stq $2,40($17)						\n\
-	subq $16,1,$16						\n\
-								\n\
-	stq $5,48($17)						\n\
-	addq $19,64,$19						\n\
-	stq $20,56($17)						\n\
-	addq $18,64,$18						\n\
-								\n\
-	addq $17,64,$17						\n\
-	bgt $16,3b						\n\
-	ret							\n\
-	.end xor_alpha_prefetch_3				\n\
-								\n\
-	.align 3						\n\
-	.ent xor_alpha_prefetch_4				\n\
-xor_alpha_prefetch_4:						\n\
-	.prologue 0						\n\
-	srl $16, 6, $16						\n\
-								\n\
-	ldq $31, 0($17)						\n\
-	ldq $31, 0($18)						\n\
-	ldq $31, 0($19)						\n\
-	ldq $31, 0($20)						\n\
-								\n\
-	ldq $31, 64($17)					\n\
-	ldq $31, 64($18)					\n\
-	ldq $31, 64($19)					\n\
-	ldq $31, 64($20)					\n\
-								\n\
-	ldq $31, 128($17)					\n\
-	ldq $31, 128($18)					\n\
-	ldq $31, 128($19)					\n\
-	ldq $31, 128($20)					\n\
-								\n\
-	ldq $31, 192($17)					\n\
-	ldq $31, 192($18)					\n\
-	ldq $31, 192($19)					\n\
-	ldq $31, 192($20)					\n\
-	.align 4						\n\
-4:								\n\
-	ldq $0,0($17)						\n\
-	ldq $1,0($18)						\n\
-	ldq $2,0($19)						\n\
-	ldq $3,0($20)						\n\
-								\n\
-	ldq $4,8($17)						\n\
-	ldq $5,8($18)						\n\
-	ldq $6,8($19)						\n\
-	ldq $7,8($20)						\n\
-								\n\
-	ldq $21,16($17)						\n\
-	ldq $22,16($18)						\n\
-	ldq $23,16($19)						\n\
-	ldq $24,16($20)						\n\
-								\n\
-	ldq $25,24($17)						\n\
-	xor $0,$1,$1		# 6 cycles from $1 load		\n\
-	ldq $27,24($18)						\n\
-	xor $2,$3,$3		# 6 cycles from $3 load		\n\
-								\n\
-	ldq $0,24($19)						\n\
-	xor $1,$3,$3						\n\
-	ldq $1,24($20)						\n\
-	xor $4,$5,$5		# 7 cycles from $5 load		\n\
-								\n\
-	stq $3,0($17)						\n\
-	xor $6,$7,$7						\n\
-	xor $21,$22,$22		# 7 cycles from $22 load	\n\
-	xor $5,$7,$7						\n\
-								\n\
-	stq $7,8($17)						\n\
-	xor $23,$24,$24		# 7 cycles from $24 load	\n\
-	ldq $2,32($17)						\n\
-	xor $22,$24,$24						\n\
-								\n\
-	ldq $3,32($18)						\n\
-	ldq $4,32($19)						\n\
-	ldq $5,32($20)						\n\
-	xor $25,$27,$27		# 8 cycles from $27 load	\n\
-								\n\
-	ldq $6,40($17)						\n\
-	ldq $7,40($18)						\n\
-	ldq $21,40($19)						\n\
-	ldq $22,40($20)						\n\
-								\n\
-	stq $24,16($17)						\n\
-	xor $0,$1,$1		# 9 cycles from $1 load		\n\
-	xor $2,$3,$3		# 5 cycles from $3 load		\n\
-	xor $27,$1,$1						\n\
-								\n\
-	stq $1,24($17)						\n\
-	xor $4,$5,$5		# 5 cycles from $5 load		\n\
-	ldq $23,48($17)						\n\
-	xor $3,$5,$5						\n\
-								\n\
-	ldq $24,48($18)						\n\
-	ldq $25,48($19)						\n\
-	ldq $27,48($20)						\n\
-	ldq $0,56($17)						\n\
-								\n\
-	ldq $1,56($18)						\n\
-	ldq $2,56($19)						\n\
-	ldq $3,56($20)						\n\
-	xor $6,$7,$7		# 8 cycles from $6 load		\n\
-								\n\
-	ldq $31,256($17)					\n\
-	xor $21,$22,$22		# 8 cycles from $22 load	\n\
-	ldq $31,256($18)					\n\
-	xor $7,$22,$22						\n\
-								\n\
-	ldq $31,256($19)					\n\
-	xor $23,$24,$24		# 6 cycles from $24 load	\n\
-	ldq $31,256($20)					\n\
-	xor $25,$27,$27		# 6 cycles from $27 load	\n\
-								\n\
-	stq $5,32($17)						\n\
-	xor $24,$27,$27						\n\
-	xor $0,$1,$1		# 7 cycles from $1 load		\n\
-	xor $2,$3,$3		# 6 cycles from $3 load		\n\
-								\n\
-	stq $22,40($17)						\n\
-	xor $1,$3,$3						\n\
-	stq $27,48($17)						\n\
-	subq $16,1,$16						\n\
-								\n\
-	stq $3,56($17)						\n\
-	addq $20,64,$20						\n\
-	addq $19,64,$19						\n\
-	addq $18,64,$18						\n\
-								\n\
-	addq $17,64,$17						\n\
-	bgt $16,4b						\n\
-	ret							\n\
-	.end xor_alpha_prefetch_4				\n\
-								\n\
-	.align 3						\n\
-	.ent xor_alpha_prefetch_5				\n\
-xor_alpha_prefetch_5:						\n\
-	.prologue 0						\n\
-	srl $16, 6, $16						\n\
-								\n\
-	ldq $31, 0($17)						\n\
-	ldq $31, 0($18)						\n\
-	ldq $31, 0($19)						\n\
-	ldq $31, 0($20)						\n\
-	ldq $31, 0($21)						\n\
-								\n\
-	ldq $31, 64($17)					\n\
-	ldq $31, 64($18)					\n\
-	ldq $31, 64($19)					\n\
-	ldq $31, 64($20)					\n\
-	ldq $31, 64($21)					\n\
-								\n\
-	ldq $31, 128($17)					\n\
-	ldq $31, 128($18)					\n\
-	ldq $31, 128($19)					\n\
-	ldq $31, 128($20)					\n\
-	ldq $31, 128($21)					\n\
-								\n\
-	ldq $31, 192($17)					\n\
-	ldq $31, 192($18)					\n\
-	ldq $31, 192($19)					\n\
-	ldq $31, 192($20)					\n\
-	ldq $31, 192($21)					\n\
-	.align 4						\n\
-5:								\n\
-	ldq $0,0($17)						\n\
-	ldq $1,0($18)						\n\
-	ldq $2,0($19)						\n\
-	ldq $3,0($20)						\n\
-								\n\
-	ldq $4,0($21)						\n\
-	ldq $5,8($17)						\n\
-	ldq $6,8($18)						\n\
-	ldq $7,8($19)						\n\
-								\n\
-	ldq $22,8($20)						\n\
-	ldq $23,8($21)						\n\
-	ldq $24,16($17)						\n\
-	ldq $25,16($18)						\n\
-								\n\
-	ldq $27,16($19)						\n\
-	xor $0,$1,$1		# 6 cycles from $1 load		\n\
-	ldq $28,16($20)						\n\
-	xor $2,$3,$3		# 6 cycles from $3 load		\n\
-								\n\
-	ldq $0,16($21)						\n\
-	xor $1,$3,$3						\n\
-	ldq $1,24($17)						\n\
-	xor $3,$4,$4		# 7 cycles from $4 load		\n\
-								\n\
-	stq $4,0($17)						\n\
-	xor $5,$6,$6		# 7 cycles from $6 load		\n\
-	xor $7,$22,$22		# 7 cycles from $22 load	\n\
-	xor $6,$23,$23		# 7 cycles from $23 load	\n\
-								\n\
-	ldq $2,24($18)						\n\
-	xor $22,$23,$23						\n\
-	ldq $3,24($19)						\n\
-	xor $24,$25,$25		# 8 cycles from $25 load	\n\
-								\n\
-	stq $23,8($17)						\n\
-	xor $25,$27,$27		# 8 cycles from $27 load	\n\
-	ldq $4,24($20)						\n\
-	xor $28,$0,$0		# 7 cycles from $0 load		\n\
-								\n\
-	ldq $5,24($21)						\n\
-	xor $27,$0,$0						\n\
-	ldq $6,32($17)						\n\
-	ldq $7,32($18)						\n\
-								\n\
-	stq $0,16($17)						\n\
-	xor $1,$2,$2		# 6 cycles from $2 load		\n\
-	ldq $22,32($19)						\n\
-	xor $3,$4,$4		# 4 cycles from $4 load		\n\
-								\n\
-	ldq $23,32($20)						\n\
-	xor $2,$4,$4						\n\
-	ldq $24,32($21)						\n\
-	ldq $25,40($17)						\n\
-								\n\
-	ldq $27,40($18)						\n\
-	ldq $28,40($19)						\n\
-	ldq $0,40($20)						\n\
-	xor $4,$5,$5		# 7 cycles from $5 load		\n\
-								\n\
-	stq $5,24($17)						\n\
-	xor $6,$7,$7		# 7 cycles from $7 load		\n\
-	ldq $1,40($21)						\n\
-	ldq $2,48($17)						\n\
-								\n\
-	ldq $3,48($18)						\n\
-	xor $7,$22,$22		# 7 cycles from $22 load	\n\
-	ldq $4,48($19)						\n\
-	xor $23,$24,$24		# 6 cycles from $24 load	\n\
-								\n\
-	ldq $5,48($20)						\n\
-	xor $22,$24,$24						\n\
-	ldq $6,48($21)						\n\
-	xor $25,$27,$27		# 7 cycles from $27 load	\n\
-								\n\
-	stq $24,32($17)						\n\
-	xor $27,$28,$28		# 8 cycles from $28 load	\n\
-	ldq $7,56($17)						\n\
-	xor $0,$1,$1		# 6 cycles from $1 load		\n\
-								\n\
-	ldq $22,56($18)						\n\
-	ldq $23,56($19)						\n\
-	ldq $24,56($20)						\n\
-	ldq $25,56($21)						\n\
-								\n\
-	ldq $31,256($17)					\n\
-	xor $28,$1,$1						\n\
-	ldq $31,256($18)					\n\
-	xor $2,$3,$3		# 9 cycles from $3 load		\n\
-								\n\
-	ldq $31,256($19)					\n\
-	xor $3,$4,$4		# 9 cycles from $4 load		\n\
-	ldq $31,256($20)					\n\
-	xor $5,$6,$6		# 8 cycles from $6 load		\n\
-								\n\
-	stq $1,40($17)						\n\
-	xor $4,$6,$6						\n\
-	xor $7,$22,$22		# 7 cycles from $22 load	\n\
-	xor $23,$24,$24		# 6 cycles from $24 load	\n\
-								\n\
-	stq $6,48($17)						\n\
-	xor $22,$24,$24						\n\
-	ldq $31,256($21)					\n\
-	xor $24,$25,$25		# 8 cycles from $25 load	\n\
-								\n\
-	stq $25,56($17)						\n\
-	subq $16,1,$16						\n\
-	addq $21,64,$21						\n\
-	addq $20,64,$20						\n\
-								\n\
-	addq $19,64,$19						\n\
-	addq $18,64,$18						\n\
-	addq $17,64,$17						\n\
-	bgt $16,5b						\n\
-								\n\
-	ret							\n\
-	.end xor_alpha_prefetch_5				\n\
-");
-
-static struct xor_block_template xor_block_alpha = {
-	.name	= "alpha",
-	.do_2	= xor_alpha_2,
-	.do_3	= xor_alpha_3,
-	.do_4	= xor_alpha_4,
-	.do_5	= xor_alpha_5,
-};
-
-static struct xor_block_template xor_block_alpha_prefetch = {
-	.name	= "alpha prefetch",
-	.do_2	= xor_alpha_prefetch_2,
-	.do_3	= xor_alpha_prefetch_3,
-	.do_4	= xor_alpha_prefetch_4,
-	.do_5	= xor_alpha_prefetch_5,
-};
-
-/* For grins, also test the generic routines.  */
+#include <asm/special_insns.h>
 #include <asm-generic/xor.h>
 
+extern struct xor_block_template xor_block_alpha;
+extern struct xor_block_template xor_block_alpha_prefetch;
+
 /*
  * Force the use of alpha_prefetch if EV6, as it is significantly faster in the
  * cold cache case.
diff --git a/lib/raid/xor/Makefile b/lib/raid/xor/Makefile
index 89a944c9f990..6d03c27c37c7 100644
--- a/lib/raid/xor/Makefile
+++ b/lib/raid/xor/Makefile
@@ -7,3 +7,5 @@ xor-y				+= xor-8regs.o
 xor-y				+= xor-32regs.o
 xor-y				+= xor-8regs-prefetch.o
 xor-y				+= xor-32regs-prefetch.o
+
+xor-$(CONFIG_ALPHA)		+= alpha/xor.o
diff --git a/lib/raid/xor/alpha/xor.c b/lib/raid/xor/alpha/xor.c
new file mode 100644
index 000000000000..0964ac420604
--- /dev/null
+++ b/lib/raid/xor/alpha/xor.c
@@ -0,0 +1,849 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Optimized XOR parity functions for alpha EV5 and EV6
+ */
+#include <linux/raid/xor_impl.h>
+#include <asm/xor.h>
+
+extern void
+xor_alpha_2(unsigned long bytes, unsigned long * __restrict p1,
+	    const unsigned long * __restrict p2);
+extern void
+xor_alpha_3(unsigned long bytes, unsigned long * __restrict p1,
+	    const unsigned long * __restrict p2,
+	    const unsigned long * __restrict p3);
+extern void
+xor_alpha_4(unsigned long bytes, unsigned long * __restrict p1,
+	    const unsigned long * __restrict p2,
+	    const unsigned long * __restrict p3,
+	    const unsigned long * __restrict p4);
+extern void
+xor_alpha_5(unsigned long bytes, unsigned long * __restrict p1,
+	    const unsigned long * __restrict p2,
+	    const unsigned long * __restrict p3,
+	    const unsigned long * __restrict p4,
+	    const unsigned long * __restrict p5);
+
+extern void
+xor_alpha_prefetch_2(unsigned long bytes, unsigned long * __restrict p1,
+		     const unsigned long * __restrict p2);
+extern void
+xor_alpha_prefetch_3(unsigned long bytes, unsigned long * __restrict p1,
+		     const unsigned long * __restrict p2,
+		     const unsigned long * __restrict p3);
+extern void
+xor_alpha_prefetch_4(unsigned long bytes, unsigned long * __restrict p1,
+		     const unsigned long * __restrict p2,
+		     const unsigned long * __restrict p3,
+		     const unsigned long * __restrict p4);
+extern void
+xor_alpha_prefetch_5(unsigned long bytes, unsigned long * __restrict p1,
+		     const unsigned long * __restrict p2,
+		     const unsigned long * __restrict p3,
+		     const unsigned long * __restrict p4,
+		     const unsigned long * __restrict p5);
+
+asm("								\n\
+	.text							\n\
+	.align 3						\n\
+	.ent xor_alpha_2					\n\
+xor_alpha_2:							\n\
+	.prologue 0						\n\
+	srl $16, 6, $16						\n\
+	.align 4						\n\
+2:								\n\
+	ldq $0,0($17)						\n\
+	ldq $1,0($18)						\n\
+	ldq $2,8($17)						\n\
+	ldq $3,8($18)						\n\
+								\n\
+	ldq $4,16($17)						\n\
+	ldq $5,16($18)						\n\
+	ldq $6,24($17)						\n\
+	ldq $7,24($18)						\n\
+								\n\
+	ldq $19,32($17)						\n\
+	ldq $20,32($18)						\n\
+	ldq $21,40($17)						\n\
+	ldq $22,40($18)						\n\
+								\n\
+	ldq $23,48($17)						\n\
+	ldq $24,48($18)						\n\
+	ldq $25,56($17)						\n\
+	xor $0,$1,$0		# 7 cycles from $1 load		\n\
+								\n\
+	ldq $27,56($18)						\n\
+	xor $2,$3,$2						\n\
+	stq $0,0($17)						\n\
+	xor $4,$5,$4						\n\
+								\n\
+	stq $2,8($17)						\n\
+	xor $6,$7,$6						\n\
+	stq $4,16($17)						\n\
+	xor $19,$20,$19						\n\
+								\n\
+	stq $6,24($17)						\n\
+	xor $21,$22,$21						\n\
+	stq $19,32($17)						\n\
+	xor $23,$24,$23						\n\
+								\n\
+	stq $21,40($17)						\n\
+	xor $25,$27,$25						\n\
+	stq $23,48($17)						\n\
+	subq $16,1,$16						\n\
+								\n\
+	stq $25,56($17)						\n\
+	addq $17,64,$17						\n\
+	addq $18,64,$18						\n\
+	bgt $16,2b						\n\
+								\n\
+	ret							\n\
+	.end xor_alpha_2					\n\
+								\n\
+	.align 3						\n\
+	.ent xor_alpha_3					\n\
+xor_alpha_3:							\n\
+	.prologue 0						\n\
+	srl $16, 6, $16						\n\
+	.align 4						\n\
+3:								\n\
+	ldq $0,0($17)						\n\
+	ldq $1,0($18)						\n\
+	ldq $2,0($19)						\n\
+	ldq $3,8($17)						\n\
+								\n\
+	ldq $4,8($18)						\n\
+	ldq $6,16($17)						\n\
+	ldq $7,16($18)						\n\
+	ldq $21,24($17)						\n\
+								\n\
+	ldq $22,24($18)						\n\
+	ldq $24,32($17)						\n\
+	ldq $25,32($18)						\n\
+	ldq $5,8($19)						\n\
+								\n\
+	ldq $20,16($19)						\n\
+	ldq $23,24($19)						\n\
+	ldq $27,32($19)						\n\
+	nop							\n\
+								\n\
+	xor $0,$1,$1		# 8 cycles from $0 load		\n\
+	xor $3,$4,$4		# 6 cycles from $4 load		\n\
+	xor $6,$7,$7		# 6 cycles from $7 load		\n\
+	xor $21,$22,$22		# 5 cycles from $22 load	\n\
+								\n\
+	xor $1,$2,$2		# 9 cycles from $2 load		\n\
+	xor $24,$25,$25		# 5 cycles from $25 load	\n\
+	stq $2,0($17)						\n\
+	xor $4,$5,$5		# 6 cycles from $5 load		\n\
+								\n\
+	stq $5,8($17)						\n\
+	xor $7,$20,$20		# 7 cycles from $20 load	\n\
+	stq $20,16($17)						\n\
+	xor $22,$23,$23		# 7 cycles from $23 load	\n\
+								\n\
+	stq $23,24($17)						\n\
+	xor $25,$27,$27		# 7 cycles from $27 load	\n\
+	stq $27,32($17)						\n\
+	nop							\n\
+								\n\
+	ldq $0,40($17)						\n\
+	ldq $1,40($18)						\n\
+	ldq $3,48($17)						\n\
+	ldq $4,48($18)						\n\
+								\n\
+	ldq $6,56($17)						\n\
+	ldq $7,56($18)						\n\
+	ldq $2,40($19)						\n\
+	ldq $5,48($19)						\n\
+								\n\
+	ldq $20,56($19)						\n\
+	xor $0,$1,$1		# 4 cycles from $1 load		\n\
+	xor $3,$4,$4		# 5 cycles from $4 load		\n\
+	xor $6,$7,$7		# 5 cycles from $7 load		\n\
+								\n\
+	xor $1,$2,$2		# 4 cycles from $2 load		\n\
+	xor $4,$5,$5		# 5 cycles from $5 load		\n\
+	stq $2,40($17)						\n\
+	xor $7,$20,$20		# 4 cycles from $20 load	\n\
+								\n\
+	stq $5,48($17)						\n\
+	subq $16,1,$16						\n\
+	stq $20,56($17)						\n\
+	addq $19,64,$19						\n\
+								\n\
+	addq $18,64,$18						\n\
+	addq $17,64,$17						\n\
+	bgt $16,3b						\n\
+	ret							\n\
+	.end xor_alpha_3					\n\
+								\n\
+	.align 3						\n\
+	.ent xor_alpha_4					\n\
+xor_alpha_4:							\n\
+	.prologue 0						\n\
+	srl $16, 6, $16						\n\
+	.align 4						\n\
+4:								\n\
+	ldq $0,0($17)						\n\
+	ldq $1,0($18)						\n\
+	ldq $2,0($19)						\n\
+	ldq $3,0($20)						\n\
+								\n\
+	ldq $4,8($17)						\n\
+	ldq $5,8($18)						\n\
+	ldq $6,8($19)						\n\
+	ldq $7,8($20)						\n\
+								\n\
+	ldq $21,16($17)						\n\
+	ldq $22,16($18)						\n\
+	ldq $23,16($19)						\n\
+	ldq $24,16($20)						\n\
+								\n\
+	ldq $25,24($17)						\n\
+	xor $0,$1,$1		# 6 cycles from $1 load		\n\
+	ldq $27,24($18)						\n\
+	xor $2,$3,$3		# 6 cycles from $3 load		\n\
+								\n\
+	ldq $0,24($19)						\n\
+	xor $1,$3,$3						\n\
+	ldq $1,24($20)						\n\
+	xor $4,$5,$5		# 7 cycles from $5 load		\n\
+								\n\
+	stq $3,0($17)						\n\
+	xor $6,$7,$7						\n\
+	xor $21,$22,$22		# 7 cycles from $22 load	\n\
+	xor $5,$7,$7						\n\
+								\n\
+	stq $7,8($17)						\n\
+	xor $23,$24,$24		# 7 cycles from $24 load	\n\
+	ldq $2,32($17)						\n\
+	xor $22,$24,$24						\n\
+								\n\
+	ldq $3,32($18)						\n\
+	ldq $4,32($19)						\n\
+	ldq $5,32($20)						\n\
+	xor $25,$27,$27		# 8 cycles from $27 load	\n\
+								\n\
+	ldq $6,40($17)						\n\
+	ldq $7,40($18)						\n\
+	ldq $21,40($19)						\n\
+	ldq $22,40($20)						\n\
+								\n\
+	stq $24,16($17)						\n\
+	xor $0,$1,$1		# 9 cycles from $1 load		\n\
+	xor $2,$3,$3		# 5 cycles from $3 load		\n\
+	xor $27,$1,$1						\n\
+								\n\
+	stq $1,24($17)						\n\
+	xor $4,$5,$5		# 5 cycles from $5 load		\n\
+	ldq $23,48($17)						\n\
+	ldq $24,48($18)						\n\
+								\n\
+	ldq $25,48($19)						\n\
+	xor $3,$5,$5						\n\
+	ldq $27,48($20)						\n\
+	ldq $0,56($17)						\n\
+								\n\
+	ldq $1,56($18)						\n\
+	ldq $2,56($19)						\n\
+	xor $6,$7,$7		# 8 cycles from $6 load		\n\
+	ldq $3,56($20)						\n\
+								\n\
+	stq $5,32($17)						\n\
+	xor $21,$22,$22		# 8 cycles from $22 load	\n\
+	xor $7,$22,$22						\n\
+	xor $23,$24,$24		# 5 cycles from $24 load	\n\
+								\n\
+	stq $22,40($17)						\n\
+	xor $25,$27,$27		# 5 cycles from $27 load	\n\
+	xor $24,$27,$27						\n\
+	xor $0,$1,$1		# 5 cycles from $1 load		\n\
+								\n\
+	stq $27,48($17)						\n\
+	xor $2,$3,$3		# 4 cycles from $3 load		\n\
+	xor $1,$3,$3						\n\
+	subq $16,1,$16						\n\
+								\n\
+	stq $3,56($17)						\n\
+	addq $20,64,$20						\n\
+	addq $19,64,$19						\n\
+	addq $18,64,$18						\n\
+								\n\
+	addq $17,64,$17						\n\
+	bgt $16,4b						\n\
+	ret							\n\
+	.end xor_alpha_4					\n\
+								\n\
+	.align 3						\n\
+	.ent xor_alpha_5					\n\
+xor_alpha_5:							\n\
+	.prologue 0						\n\
+	srl $16, 6, $16						\n\
+	.align 4						\n\
+5:								\n\
+	ldq $0,0($17)						\n\
+	ldq $1,0($18)						\n\
+	ldq $2,0($19)						\n\
+	ldq $3,0($20)						\n\
+								\n\
+	ldq $4,0($21)						\n\
+	ldq $5,8($17)						\n\
+	ldq $6,8($18)						\n\
+	ldq $7,8($19)						\n\
+								\n\
+	ldq $22,8($20)						\n\
+	ldq $23,8($21)						\n\
+	ldq $24,16($17)						\n\
+	ldq $25,16($18)						\n\
+								\n\
+	ldq $27,16($19)						\n\
+	xor $0,$1,$1		# 6 cycles from $1 load		\n\
+	ldq $28,16($20)						\n\
+	xor $2,$3,$3		# 6 cycles from $3 load		\n\
+								\n\
+	ldq $0,16($21)						\n\
+	xor $1,$3,$3						\n\
+	ldq $1,24($17)						\n\
+	xor $3,$4,$4		# 7 cycles from $4 load		\n\
+								\n\
+	stq $4,0($17)						\n\
+	xor $5,$6,$6		# 7 cycles from $6 load		\n\
+	xor $7,$22,$22		# 7 cycles from $22 load	\n\
+	xor $6,$23,$23		# 7 cycles from $23 load	\n\
+								\n\
+	ldq $2,24($18)						\n\
+	xor $22,$23,$23						\n\
+	ldq $3,24($19)						\n\
+	xor $24,$25,$25		# 8 cycles from $25 load	\n\
+								\n\
+	stq $23,8($17)						\n\
+	xor $25,$27,$27		# 8 cycles from $27 load	\n\
+	ldq $4,24($20)						\n\
+	xor $28,$0,$0		# 7 cycles from $0 load		\n\
+								\n\
+	ldq $5,24($21)						\n\
+	xor $27,$0,$0						\n\
+	ldq $6,32($17)						\n\
+	ldq $7,32($18)						\n\
+								\n\
+	stq $0,16($17)						\n\
+	xor $1,$2,$2		# 6 cycles from $2 load		\n\
+	ldq $22,32($19)						\n\
+	xor $3,$4,$4		# 4 cycles from $4 load		\n\
+								\n\
+	ldq $23,32($20)						\n\
+	xor $2,$4,$4						\n\
+	ldq $24,32($21)						\n\
+	ldq $25,40($17)						\n\
+								\n\
+	ldq $27,40($18)						\n\
+	ldq $28,40($19)						\n\
+	ldq $0,40($20)						\n\
+	xor $4,$5,$5		# 7 cycles from $5 load		\n\
+								\n\
+	stq $5,24($17)						\n\
+	xor $6,$7,$7		# 7 cycles from $7 load		\n\
+	ldq $1,40($21)						\n\
+	ldq $2,48($17)						\n\
+								\n\
+	ldq $3,48($18)						\n\
+	xor $7,$22,$22		# 7 cycles from $22 load	\n\
+	ldq $4,48($19)						\n\
+	xor $23,$24,$24		# 6 cycles from $24 load	\n\
+								\n\
+	ldq $5,48($20)						\n\
+	xor $22,$24,$24						\n\
+	ldq $6,48($21)						\n\
+	xor $25,$27,$27		# 7 cycles from $27 load	\n\
+								\n\
+	stq $24,32($17)						\n\
+	xor $27,$28,$28		# 8 cycles from $28 load	\n\
+	ldq $7,56($17)						\n\
+	xor $0,$1,$1		# 6 cycles from $1 load		\n\
+								\n\
+	ldq $22,56($18)						\n\
+	ldq $23,56($19)						\n\
+	ldq $24,56($20)						\n\
+	ldq $25,56($21)						\n\
+								\n\
+	xor $28,$1,$1						\n\
+	xor $2,$3,$3		# 9 cycles from $3 load		\n\
+	xor $3,$4,$4		# 9 cycles from $4 load		\n\
+	xor $5,$6,$6		# 8 cycles from $6 load		\n\
+								\n\
+	stq $1,40($17)						\n\
+	xor $4,$6,$6						\n\
+	xor $7,$22,$22		# 7 cycles from $22 load	\n\
+	xor $23,$24,$24		# 6 cycles from $24 load	\n\
+								\n\
+	stq $6,48($17)						\n\
+	xor $22,$24,$24						\n\
+	subq $16,1,$16						\n\
+	xor $24,$25,$25		# 8 cycles from $25 load	\n\
+								\n\
+	stq $25,56($17)						\n\
+	addq $21,64,$21						\n\
+	addq $20,64,$20						\n\
+	addq $19,64,$19						\n\
+								\n\
+	addq $18,64,$18						\n\
+	addq $17,64,$17						\n\
+	bgt $16,5b						\n\
+	ret							\n\
+	.end xor_alpha_5					\n\
+								\n\
+	.align 3						\n\
+	.ent xor_alpha_prefetch_2				\n\
+xor_alpha_prefetch_2:						\n\
+	.prologue 0						\n\
+	srl $16, 6, $16						\n\
+								\n\
+	ldq $31, 0($17)						\n\
+	ldq $31, 0($18)						\n\
+								\n\
+	ldq $31, 64($17)					\n\
+	ldq $31, 64($18)					\n\
+								\n\
+	ldq $31, 128($17)					\n\
+	ldq $31, 128($18)					\n\
+								\n\
+	ldq $31, 192($17)					\n\
+	ldq $31, 192($18)					\n\
+	.align 4						\n\
+2:								\n\
+	ldq $0,0($17)						\n\
+	ldq $1,0($18)						\n\
+	ldq $2,8($17)						\n\
+	ldq $3,8($18)						\n\
+								\n\
+	ldq $4,16($17)						\n\
+	ldq $5,16($18)						\n\
+	ldq $6,24($17)						\n\
+	ldq $7,24($18)						\n\
+								\n\
+	ldq $19,32($17)						\n\
+	ldq $20,32($18)						\n\
+	ldq $21,40($17)						\n\
+	ldq $22,40($18)						\n\
+								\n\
+	ldq $23,48($17)						\n\
+	ldq $24,48($18)						\n\
+	ldq $25,56($17)						\n\
+	ldq $27,56($18)						\n\
+								\n\
+	ldq $31,256($17)					\n\
+	xor $0,$1,$0		# 8 cycles from $1 load		\n\
+	ldq $31,256($18)					\n\
+	xor $2,$3,$2						\n\
+								\n\
+	stq $0,0($17)						\n\
+	xor $4,$5,$4						\n\
+	stq $2,8($17)						\n\
+	xor $6,$7,$6						\n\
+								\n\
+	stq $4,16($17)						\n\
+	xor $19,$20,$19						\n\
+	stq $6,24($17)						\n\
+	xor $21,$22,$21						\n\
+								\n\
+	stq $19,32($17)						\n\
+	xor $23,$24,$23						\n\
+	stq $21,40($17)						\n\
+	xor $25,$27,$25						\n\
+								\n\
+	stq $23,48($17)						\n\
+	subq $16,1,$16						\n\
+	stq $25,56($17)						\n\
+	addq $17,64,$17						\n\
+								\n\
+	addq $18,64,$18						\n\
+	bgt $16,2b						\n\
+	ret							\n\
+	.end xor_alpha_prefetch_2				\n\
+								\n\
+	.align 3						\n\
+	.ent xor_alpha_prefetch_3				\n\
+xor_alpha_prefetch_3:						\n\
+	.prologue 0						\n\
+	srl $16, 6, $16						\n\
+								\n\
+	ldq $31, 0($17)						\n\
+	ldq $31, 0($18)						\n\
+	ldq $31, 0($19)						\n\
+								\n\
+	ldq $31, 64($17)					\n\
+	ldq $31, 64($18)					\n\
+	ldq $31, 64($19)					\n\
+								\n\
+	ldq $31, 128($17)					\n\
+	ldq $31, 128($18)					\n\
+	ldq $31, 128($19)					\n\
+								\n\
+	ldq $31, 192($17)					\n\
+	ldq $31, 192($18)					\n\
+	ldq $31, 192($19)					\n\
+	.align 4						\n\
+3:								\n\
+	ldq $0,0($17)						\n\
+	ldq $1,0($18)						\n\
+	ldq $2,0($19)						\n\
+	ldq $3,8($17)						\n\
+								\n\
+	ldq $4,8($18)						\n\
+	ldq $6,16($17)						\n\
+	ldq $7,16($18)						\n\
+	ldq $21,24($17)						\n\
+								\n\
+	ldq $22,24($18)						\n\
+	ldq $24,32($17)						\n\
+	ldq $25,32($18)						\n\
+	ldq $5,8($19)						\n\
+								\n\
+	ldq $20,16($19)						\n\
+	ldq $23,24($19)						\n\
+	ldq $27,32($19)						\n\
+	nop							\n\
+								\n\
+	xor $0,$1,$1		# 8 cycles from $0 load		\n\
+	xor $3,$4,$4		# 7 cycles from $4 load		\n\
+	xor $6,$7,$7		# 6 cycles from $7 load		\n\
+	xor $21,$22,$22		# 5 cycles from $22 load	\n\
+								\n\
+	xor $1,$2,$2		# 9 cycles from $2 load		\n\
+	xor $24,$25,$25		# 5 cycles from $25 load	\n\
+	stq $2,0($17)						\n\
+	xor $4,$5,$5		# 6 cycles from $5 load		\n\
+								\n\
+	stq $5,8($17)						\n\
+	xor $7,$20,$20		# 7 cycles from $20 load	\n\
+	stq $20,16($17)						\n\
+	xor $22,$23,$23		# 7 cycles from $23 load	\n\
+								\n\
+	stq $23,24($17)						\n\
+	xor $25,$27,$27		# 7 cycles from $27 load	\n\
+	stq $27,32($17)						\n\
+	nop							\n\
+								\n\
+	ldq $0,40($17)						\n\
+	ldq $1,40($18)						\n\
+	ldq $3,48($17)						\n\
+	ldq $4,48($18)						\n\
+								\n\
+	ldq $6,56($17)						\n\
+	ldq $7,56($18)						\n\
+	ldq $2,40($19)						\n\
+	ldq $5,48($19)						\n\
+								\n\
+	ldq $20,56($19)						\n\
+	ldq $31,256($17)					\n\
+	ldq $31,256($18)					\n\
+	ldq $31,256($19)					\n\
+								\n\
+	xor $0,$1,$1		# 6 cycles from $1 load		\n\
+	xor $3,$4,$4		# 5 cycles from $4 load		\n\
+	xor $6,$7,$7		# 5 cycles from $7 load		\n\
+	xor $1,$2,$2		# 4 cycles from $2 load		\n\
+								\n\
+	xor $4,$5,$5		# 5 cycles from $5 load		\n\
+	xor $7,$20,$20		# 4 cycles from $20 load	\n\
+	stq $2,40($17)						\n\
+	subq $16,1,$16						\n\
+								\n\
+	stq $5,48($17)						\n\
+	addq $19,64,$19						\n\
+	stq $20,56($17)						\n\
+	addq $18,64,$18						\n\
+								\n\
+	addq $17,64,$17						\n\
+	bgt $16,3b						\n\
+	ret							\n\
+	.end xor_alpha_prefetch_3				\n\
+								\n\
+	.align 3						\n\
+	.ent xor_alpha_prefetch_4				\n\
+xor_alpha_prefetch_4:						\n\
+	.prologue 0						\n\
+	srl $16, 6, $16						\n\
+								\n\
+	ldq $31, 0($17)						\n\
+	ldq $31, 0($18)						\n\
+	ldq $31, 0($19)						\n\
+	ldq $31, 0($20)						\n\
+								\n\
+	ldq $31, 64($17)					\n\
+	ldq $31, 64($18)					\n\
+	ldq $31, 64($19)					\n\
+	ldq $31, 64($20)					\n\
+								\n\
+	ldq $31, 128($17)					\n\
+	ldq $31, 128($18)					\n\
+	ldq $31, 128($19)					\n\
+	ldq $31, 128($20)					\n\
+								\n\
+	ldq $31, 192($17)					\n\
+	ldq $31, 192($18)					\n\
+	ldq $31, 192($19)					\n\
+	ldq $31, 192($20)					\n\
+	.align 4						\n\
+4:								\n\
+	ldq $0,0($17)						\n\
+	ldq $1,0($18)						\n\
+	ldq $2,0($19)						\n\
+	ldq $3,0($20)						\n\
+								\n\
+	ldq $4,8($17)						\n\
+	ldq $5,8($18)						\n\
+	ldq $6,8($19)						\n\
+	ldq $7,8($20)						\n\
+								\n\
+	ldq $21,16($17)						\n\
+	ldq $22,16($18)						\n\
+	ldq $23,16($19)						\n\
+	ldq $24,16($20)						\n\
+								\n\
+	ldq $25,24($17)						\n\
+	xor $0,$1,$1		# 6 cycles from $1 load		\n\
+	ldq $27,24($18)						\n\
+	xor $2,$3,$3		# 6 cycles from $3 load		\n\
+								\n\
+	ldq $0,24($19)						\n\
+	xor $1,$3,$3						\n\
+	ldq $1,24($20)						\n\
+	xor $4,$5,$5		# 7 cycles from $5 load		\n\
+								\n\
+	stq $3,0($17)						\n\
+	xor $6,$7,$7						\n\
+	xor $21,$22,$22		# 7 cycles from $22 load	\n\
+	xor $5,$7,$7						\n\
+								\n\
+	stq $7,8($17)						\n\
+	xor $23,$24,$24		# 7 cycles from $24 load	\n\
+	ldq $2,32($17)						\n\
+	xor $22,$24,$24						\n\
+								\n\
+	ldq $3,32($18)						\n\
+	ldq $4,32($19)						\n\
+	ldq $5,32($20)						\n\
+	xor $25,$27,$27		# 8 cycles from $27 load	\n\
+								\n\
+	ldq $6,40($17)						\n\
+	ldq $7,40($18)						\n\
+	ldq $21,40($19)						\n\
+	ldq $22,40($20)						\n\
+								\n\
+	stq $24,16($17)						\n\
+	xor $0,$1,$1		# 9 cycles from $1 load		\n\
+	xor $2,$3,$3		# 5 cycles from $3 load		\n\
+	xor $27,$1,$1						\n\
+								\n\
+	stq $1,24($17)						\n\
+	xor $4,$5,$5		# 5 cycles from $5 load		\n\
+	ldq $23,48($17)						\n\
+	xor $3,$5,$5						\n\
+								\n\
+	ldq $24,48($18)						\n\
+	ldq $25,48($19)						\n\
+	ldq $27,48($20)						\n\
+	ldq $0,56($17)						\n\
+								\n\
+	ldq $1,56($18)						\n\
+	ldq $2,56($19)						\n\
+	ldq $3,56($20)						\n\
+	xor $6,$7,$7		# 8 cycles from $6 load		\n\
+								\n\
+	ldq $31,256($17)					\n\
+	xor $21,$22,$22		# 8 cycles from $22 load	\n\
+	ldq $31,256($18)					\n\
+	xor $7,$22,$22						\n\
+								\n\
+	ldq $31,256($19)					\n\
+	xor $23,$24,$24		# 6 cycles from $24 load	\n\
+	ldq $31,256($20)					\n\
+	xor $25,$27,$27		# 6 cycles from $27 load	\n\
+								\n\
+	stq $5,32($17)						\n\
+	xor $24,$27,$27						\n\
+	xor $0,$1,$1		# 7 cycles from $1 load		\n\
+	xor $2,$3,$3		# 6 cycles from $3 load		\n\
+								\n\
+	stq $22,40($17)						\n\
+	xor $1,$3,$3						\n\
+	stq $27,48($17)						\n\
+	subq $16,1,$16						\n\
+								\n\
+	stq $3,56($17)						\n\
+	addq $20,64,$20						\n\
+	addq $19,64,$19						\n\
+	addq $18,64,$18						\n\
+								\n\
+	addq $17,64,$17						\n\
+	bgt $16,4b						\n\
+	ret							\n\
+	.end xor_alpha_prefetch_4				\n\
+								\n\
+	.align 3						\n\
+	.ent xor_alpha_prefetch_5				\n\
+xor_alpha_prefetch_5:						\n\
+	.prologue 0						\n\
+	srl $16, 6, $16						\n\
+								\n\
+	ldq $31, 0($17)						\n\
+	ldq $31, 0($18)						\n\
+	ldq $31, 0($19)						\n\
+	ldq $31, 0($20)						\n\
+	ldq $31, 0($21)						\n\
+								\n\
+	ldq $31, 64($17)					\n\
+	ldq $31, 64($18)					\n\
+	ldq $31, 64($19)					\n\
+	ldq $31, 64($20)					\n\
+	ldq $31, 64($21)					\n\
+								\n\
+	ldq $31, 128($17)					\n\
+	ldq $31, 128($18)					\n\
+	ldq $31, 128($19)					\n\
+	ldq $31, 128($20)					\n\
+	ldq $31, 128($21)					\n\
+								\n\
+	ldq $31, 192($17)					\n\
+	ldq $31, 192($18)					\n\
+	ldq $31, 192($19)					\n\
+	ldq $31, 192($20)					\n\
+	ldq $31, 192($21)					\n\
+	.align 4						\n\
+5:								\n\
+	ldq $0,0($17)						\n\
+	ldq $1,0($18)						\n\
+	ldq $2,0($19)						\n\
+	ldq $3,0($20)						\n\
+								\n\
+	ldq $4,0($21)						\n\
+	ldq $5,8($17)						\n\
+	ldq $6,8($18)						\n\
+	ldq $7,8($19)						\n\
+								\n\
+	ldq $22,8($20)						\n\
+	ldq $23,8($21)						\n\
+	ldq $24,16($17)						\n\
+	ldq $25,16($18)						\n\
+								\n\
+	ldq $27,16($19)						\n\
+	xor $0,$1,$1		# 6 cycles from $1 load		\n\
+	ldq $28,16($20)						\n\
+	xor $2,$3,$3		# 6 cycles from $3 load		\n\
+								\n\
+	ldq $0,16($21)						\n\
+	xor $1,$3,$3						\n\
+	ldq $1,24($17)						\n\
+	xor $3,$4,$4		# 7 cycles from $4 load		\n\
+								\n\
+	stq $4,0($17)						\n\
+	xor $5,$6,$6		# 7 cycles from $6 load		\n\
+	xor $7,$22,$22		# 7 cycles from $22 load	\n\
+	xor $6,$23,$23		# 7 cycles from $23 load	\n\
+								\n\
+	ldq $2,24($18)						\n\
+	xor $22,$23,$23						\n\
+	ldq $3,24($19)						\n\
+	xor $24,$25,$25		# 8 cycles from $25 load	\n\
+								\n\
+	stq $23,8($17)						\n\
+	xor $25,$27,$27		# 8 cycles from $27 load	\n\
+	ldq $4,24($20)						\n\
+	xor $28,$0,$0		# 7 cycles from $0 load		\n\
+								\n\
+	ldq $5,24($21)						\n\
+	xor $27,$0,$0						\n\
+	ldq $6,32($17)						\n\
+	ldq $7,32($18)						\n\
+								\n\
+	stq $0,16($17)						\n\
+	xor $1,$2,$2		# 6 cycles from $2 load		\n\
+	ldq $22,32($19)						\n\
+	xor $3,$4,$4		# 4 cycles from $4 load		\n\
+								\n\
+	ldq $23,32($20)						\n\
+	xor $2,$4,$4						\n\
+	ldq $24,32($21)						\n\
+	ldq $25,40($17)						\n\
+								\n\
+	ldq $27,40($18)						\n\
+	ldq $28,40($19)						\n\
+	ldq $0,40($20)						\n\
+	xor $4,$5,$5		# 7 cycles from $5 load		\n\
+								\n\
+	stq $5,24($17)						\n\
+	xor $6,$7,$7		# 7 cycles from $7 load		\n\
+	ldq $1,40($21)						\n\
+	ldq $2,48($17)						\n\
+								\n\
+	ldq $3,48($18)						\n\
+	xor $7,$22,$22		# 7 cycles from $22 load	\n\
+	ldq $4,48($19)						\n\
+	xor $23,$24,$24		# 6 cycles from $24 load	\n\
+								\n\
+	ldq $5,48($20)						\n\
+	xor $22,$24,$24						\n\
+	ldq $6,48($21)						\n\
+	xor $25,$27,$27		# 7 cycles from $27 load	\n\
+								\n\
+	stq $24,32($17)						\n\
+	xor $27,$28,$28		# 8 cycles from $28 load	\n\
+	ldq $7,56($17)						\n\
+	xor $0,$1,$1		# 6 cycles from $1 load		\n\
+								\n\
+	ldq $22,56($18)						\n\
+	ldq $23,56($19)						\n\
+	ldq $24,56($20)						\n\
+	ldq $25,56($21)						\n\
+								\n\
+	ldq $31,256($17)					\n\
+	xor $28,$1,$1						\n\
+	ldq $31,256($18)					\n\
+	xor $2,$3,$3		# 9 cycles from $3 load		\n\
+								\n\
+	ldq $31,256($19)					\n\
+	xor $3,$4,$4		# 9 cycles from $4 load		\n\
+	ldq $31,256($20)					\n\
+	xor $5,$6,$6		# 8 cycles from $6 load		\n\
+								\n\
+	stq $1,40($17)						\n\
+	xor $4,$6,$6						\n\
+	xor $7,$22,$22		# 7 cycles from $22 load	\n\
+	xor $23,$24,$24		# 6 cycles from $24 load	\n\
+								\n\
+	stq $6,48($17)						\n\
+	xor $22,$24,$24						\n\
+	ldq $31,256($21)					\n\
+	xor $24,$25,$25		# 8 cycles from $25 load	\n\
+								\n\
+	stq $25,56($17)						\n\
+	subq $16,1,$16						\n\
+	addq $21,64,$21						\n\
+	addq $20,64,$20						\n\
+								\n\
+	addq $19,64,$19						\n\
+	addq $18,64,$18						\n\
+	addq $17,64,$17						\n\
+	bgt $16,5b						\n\
+								\n\
+	ret							\n\
+	.end xor_alpha_prefetch_5				\n\
+");
+
+struct xor_block_template xor_block_alpha = {
+	.name	= "alpha",
+	.do_2	= xor_alpha_2,
+	.do_3	= xor_alpha_3,
+	.do_4	= xor_alpha_4,
+	.do_5	= xor_alpha_5,
+};
+
+struct xor_block_template xor_block_alpha_prefetch = {
+	.name	= "alpha prefetch",
+	.do_2	= xor_alpha_prefetch_2,
+	.do_3	= xor_alpha_prefetch_3,
+	.do_4	= xor_alpha_prefetch_4,
+	.do_5	= xor_alpha_prefetch_5,
+};
-- 
2.47.3


