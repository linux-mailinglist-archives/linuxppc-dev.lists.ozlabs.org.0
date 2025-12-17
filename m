Return-Path: <linuxppc-dev+bounces-14826-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B33CC5F2F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Dec 2025 05:14:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWL5s6p9Sz2ySV;
	Wed, 17 Dec 2025 15:14:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765944849;
	cv=none; b=KVs0mCd5lPPKnymrSslCFW2aCVf4pt5HWTv6kFnHCx3mGTGQhdqjp8PoJdbgnxfZq+TM4y2AmN1Eg5BN//OK9l/AtMJsknNfdX3cmoWgLciifxzAVfgj3RmZUGf3CP+9drr0XH07WHMrXMR4KXmP5RvnaPdjZBC/9h6U1oSUB8KPigW3HZVx1aSbHg1RpYv4NgG9HqWD2l1WvQ3GEQd0UgUgN892KVxIOCkSw7wVQcLWTOQ35dYr3nduFUBpe6/bbY5QMG+iJS8ljahzIGrWyNMV/YJxdRI75nh6cnW9xcbplfPt4qYz11swZIyYT08fAuh/zkgCp8ERLLvXZvEcBg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765944849; c=relaxed/relaxed;
	bh=tIvslDrd3vRyKntdo1TKclAc08m0jxGuja83vYWFMz0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=MaCoPABqItYvaWBEKKU4hW3sr/1Qlf6C8X6o9teWIzV/3PUPXFQ2M/zVb6yrENf6YmwBb4YCc5sPCWcdtfnd6p/akY9h6OMhMYDFuHafPp9B4kA9cCqVmOr+j6UvuClUuRN6LNU0f/RygoZXlWb+QpcnLw9ZwxY6fQXIQ0XoRYppEmQuyYRZ4cW0rX7Uwijt1pg53iuNV9CJHaSq/hq1uMGRAh1K7veYh6YPIJZ1DjX/B17+QE55lODFhZcu71XKs2FSNzKyW7GEkeW35mXYP/iRjLPVsGAC2VW+oxx8zoBTK0zPHJimbVhWCXdWJvPPD9ykLPK7HCm8Y/4B4hsZzA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=mObMGKaH; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=mObMGKaH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dWL5r3DR8z2yRF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Dec 2025 15:14:07 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 07C734021D;
	Wed, 17 Dec 2025 04:14:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB41EC4CEFB;
	Wed, 17 Dec 2025 04:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1765944844;
	bh=xU2trvapXnk7g5CtACkCj5ikoDQ/txcQUif1mO1cIY8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mObMGKaHzs+oIi98uFJNPKFjcIbwG14MyPdinNriP9aRfBOmrP9YgUR0U5RY50Jcg
	 MRZ/eN62bquBtMDDTcWo7ge5Ui+mwLmddzDbSz+GfDkXxY71DhMOB9iezvOgCfm+sh
	 F57lldv0D0XP5sN73LEmpLArzoS8Y23dHH7bFz7M=
Date: Tue, 16 Dec 2025 20:14:03 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, Alexander Gordeev
 <agordeev@linux.ibm.com>, Andreas Larsson <andreas@gaisler.com>, Anshuman
 Khandual <anshuman.khandual@arm.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Borislav Petkov <bp@alien8.de>, Catalin
 Marinas <catalin.marinas@arm.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, David Woodhouse <dwmw2@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Jann Horn
 <jannh@google.com>, Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, Mike Rapoport
 <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Peter Zijlstra
 <peterz@infradead.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan
 <surenb@google.com>, Thomas Gleixner <tglx@linutronix.de>, Venkat Rao
 Bagalkote <venkat88@linux.ibm.com>, Vlastimil Babka <vbabka@suse.cz>, Will
 Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Subject: Re: [PATCH v6 14/14] mm: Add basic tests for lazy_mmu
Message-Id: <20251216201403.4647a4f9861d3122ee9e90d7@linux-foundation.org>
In-Reply-To: <20251215150323.2218608-15-kevin.brodsky@arm.com>
References: <20251215150323.2218608-1-kevin.brodsky@arm.com>
	<20251215150323.2218608-15-kevin.brodsky@arm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 15 Dec 2025 15:03:23 +0000 Kevin Brodsky <kevin.brodsky@arm.com> wrote:

> Add basic KUnit tests for the generic aspects of the lazy MMU mode:
> ensure that it appears active when it should, depending on how
> enable/disable and pause/resume pairs are nested.

I needed this for powerpc allmodconfig;

--- a/arch/powerpc/mm/book3s64/hash_tlb.c~mm-add-basic-tests-for-lazy_mmu-fix
+++ a/arch/powerpc/mm/book3s64/hash_tlb.c
@@ -30,6 +30,7 @@
 #include <trace/events/thp.h>
 
 DEFINE_PER_CPU(struct ppc64_tlb_batch, ppc64_tlb_batch);
+EXPORT_SYMBOL_GPL(ppc64_tlb_batch);
 
 /*
  * A linux PTE was changed and the corresponding hash table entry
@@ -154,6 +155,7 @@ void __flush_tlb_pending(struct ppc64_tl
 		flush_hash_range(i, local);
 	batch->index = 0;
 }
+EXPORT_SYMBOL_GPL(__flush_tlb_pending);
 
 void hash__tlb_flush(struct mmu_gather *tlb)
 {
_


