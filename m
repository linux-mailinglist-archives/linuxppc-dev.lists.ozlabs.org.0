Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F25220C3AC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 21:05:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49vNVJ65DhzDrGC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jun 2020 05:04:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=casper.20170209 header.b=rq00ouSx; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49vNSh3SZMzDrCB
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Jun 2020 05:03:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=OR7OBaJyU20QVLaZTPXddMLTo5rxOsqU6iEIJEupuWE=; b=rq00ouSxMdTmSFa28hDOUKTHBg
 3dXyfPXkTUDZyQHTetqsyMna5fwntHa6QKcic/h71IwcUCnGNbErGyqkiwiLcgU2nYHZh16/QaPeb
 b5zkBVG9gFL5QSc/VNDuNclsIuluvuMI/LYza+5r2JW/cLhLN6jZ5ik5eKIuodERFMabxSNfOI2Bi
 +dL26IWnzvmxsRx2Z0NmVql7PiiPOtRewW4aUiQeNyCevs8ZZkzP0faCH2uqSnyC23QLvVtj1Wi9z
 Fo+73sfYzK5rnUfqtXfFwYUwyfilRDtoIcUUPTCSGsmVmOCF5BvgZD7yS/O5QwZNMhirY3o8KlkeY
 6JIFEkYQ==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jpG6S-0005fe-2n; Sat, 27 Jun 2020 19:03:04 +0000
Date: Sat, 27 Jun 2020 20:03:04 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 4/8] asm-generic: pgalloc: provide generic
 pmd_alloc_one() and pmd_free_one()
Message-ID: <20200627190304.GG25039@casper.infradead.org>
References: <20200627143453.31835-1-rppt@kernel.org>
 <20200627143453.31835-5-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200627143453.31835-5-rppt@kernel.org>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>, linux-csky@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-hexagon@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org,
 linux-um@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Andy Lutomirski <luto@kernel.org>, Stafford Horne <shorne@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jun 27, 2020 at 05:34:49PM +0300, Mike Rapoport wrote:
> More elaborate versions on arm64 and x86 account memory for the user page
> tables and call to pgtable_pmd_page_ctor() as the part of PMD page
> initialization.
> 
> Move the arm64 version to include/asm-generic/pgalloc.h and use the generic
> version on several architectures.
> 
> The pgtable_pmd_page_ctor() is a NOP when ARCH_ENABLE_SPLIT_PMD_PTLOCK is
> not enabled, so there is no functional change for most architectures except
> of the addition of __GFP_ACCOUNT for allocation of user page tables.

Thanks for including this line; it reminded me that we're not setting
the PageTable flag on the page, nor accounting it to the zone page stats.
Hope you don't mind me tagging a patch to do that on as 9/8.

We could also do with a pud_page_[cd]tor and maybe even p4d/pgd versions.
But that brings me to the next question -- could/should some of this
be moved over to asm-generic/pgalloc.h?  The ctor/dtor aren't called
from anywhere else, and there's value to reducing the total amount of
code in mm.h, but then there's also value to keeping all the ifdef
ARCH_ENABLE_SPLIT_PMD_PTLOCK code together too.  So I'm a bit torn.
What do you think?
