Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E283C94B252
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 23:45:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=w2C9n7PF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfNyP6CzNz3d96
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 07:45:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=w2C9n7PF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfNxl1CmBz30Vl
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 07:44:57 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 17812612DD;
	Wed,  7 Aug 2024 21:44:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB202C32781;
	Wed,  7 Aug 2024 21:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1723067095;
	bh=u8+YU0xnkjcGaJ9w379iyelLFwGeDj94LfvVMrPVPEI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=w2C9n7PFnx7zK5Xq2bWhli0FVCL5JC9CGBTq2MWwSTo6BFM0CDjmA0W9MgltygYd0
	 LMrw1YKcpgcWt8gpkPSMHLJKR1IoXZrrDja1AC0aCiN7cRCujdhx+PV/lKiOpnhH0w
	 ipjBpJJyvcuuo/mIhBYTSVOgGLL6+ElAGnRWHqLo=
Date: Wed, 7 Aug 2024 14:44:54 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v4 0/7] mm/mprotect: Fix dax puds
Message-Id: <20240807144454.15a9668c23d05141ae777696@linux-foundation.org>
In-Reply-To: <ZrPoUgISLqlF-iEQ@x1n>
References: <20240807194812.819412-1-peterx@redhat.com>
	<20240807141703.d641001ee14177ccf80a31d8@linux-foundation.org>
	<ZrPoUgISLqlF-iEQ@x1n>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Thomas Gleixner <tglx@linutronix.de>, Dave Jiang <dave.jiang@intel.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Huang Ying <ying.huang@intel.com>, Rik van Riel <riel@surriel.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, "Kirill A . Shutemov" <kirill@shutemov.name>, Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, Mel Gorman <mgorman@techsingularity.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 7 Aug 2024 17:34:10 -0400 Peter Xu <peterx@redhat.com> wrote:

> The problem is mprotect() will skip the dax 1G PUD while it shouldn't;
> meanwhile it'll dump some bad PUD in dmesg.  Both of them look like (corner
> case) bugs to me.. where:
> 
>   - skipping the 1G pud means mprotect() will succeed even if the pud won't
>     be updated with the correct permission specified. Logically that can
>     cause e.g. in mprotect(RO) then write the page can cause data corrupt,
>     as the pud page will still be writable.
> 
>   - the bad pud will generate a pr_err() into dmesg, with no limit so far I
>     can see.  So I think it means an userspace can DoS the kernel log if it
>     wants.. simply by creating the PUD and keep mprotect-ing it
> 

I edited this important info into the [0/n] text, thanks.

So current kernels can be made to spew into the kernel logs?  That's
considered serious.  Can unprivileged userspace code do this?

