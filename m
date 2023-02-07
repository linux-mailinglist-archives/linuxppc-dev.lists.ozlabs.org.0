Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB6868E1DF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 21:29:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBF8w0ZvQz3cdS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 07:29:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=U421Okqt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBF7t18rfz30QD
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Feb 2023 07:28:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XM5/DhrpywJuIcEgHHCo/8ZgkbeDJDYpTgAA6DELtws=; b=U421OkqtCK6gXcQf62Ryz9sZ/W
	LZu+W2C5RVzWjNR1EJOlHTdtbUA8ODN3LbSVdDS3DjxVjKsvyfrdU85iUtIK1EgYxrddQ0m2wTalm
	OssTp+Q+6OmZYy35VF4f8TBsgThmOB3u+RJ5a68V/pzMcXN/KM/Ez/WO3wthlQHUm0ELHHtc9xZYE
	D46tkAcEKppoPWtpXr3+JsOkVr4ibVV2RCEgi+21G7Cx3eq2LJAbAe7NpSaz6q0Nunm9jiFI6Bw1a
	MDE52Mqb5eTuWPKHiCG+W54+Ozx9KzoajI/jLRKPpRgEHssXN6Hk+ibtCKSSi8VsmJPAbnS9pIDOm
	jRVggYwA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPUZ1-000XLi-7h; Tue, 07 Feb 2023 20:27:39 +0000
Date: Tue, 7 Feb 2023 20:27:39 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-arch@vger.kernel.org
Subject: Re: API for setting multiple PTEs at once
Message-ID: <Y+K0O35jNNzxiXE6@casper.infradead.org>
References: <Y9wnr8SGfGGbi/bk@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9wnr8SGfGGbi/bk@casper.infradead.org>
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
Cc: linux-xtensa@linux-xtensa.org, linux-parisc@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, linux-sh@vger.kernel.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, Yin Fengwei <fengwei.yin@intel.com>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, loongarch@lists.linux.dev, linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 02, 2023 at 09:14:23PM +0000, Matthew Wilcox wrote:
> For those of you not subscribed, linux-mm is currently discussing
> how best to handle page faults on large folios.  I simply made it work
> when adding large folio support.  Now Yin Fengwei is working on
> making it fast.

OK, here's an actual implementation:

https://lore.kernel.org/linux-mm/20230207194937.122543-3-willy@infradead.org/

It survives a run of xfstests.  If your architecture doesn't store its
PFNs at PAGE_SHIFT, you're going to want to implement your own set_ptes(),
or you'll see entirely the wrong pages mapped into userspace.  You may
also wish to implement set_ptes() if it can be done more efficiently
than __pte(pteval(pte) + PAGE_SIZE).

Architectures that implement things like flush_icache_page() and
update_mmu_cache() may want to propose batched versions of those.
That's alpha, csky, m68k, mips, nios2, parisc, sh,
arm, loongarch, openrisc, powerpc, riscv, sparc and xtensa.
Maintainers BCC'd, mailing lists CC'd.

I'm happy to collect implementations and submit them as part of a v6.
