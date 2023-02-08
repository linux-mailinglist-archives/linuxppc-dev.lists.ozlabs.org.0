Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEFB68EFE8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 14:36:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBgy91HZgz3f55
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 00:36:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=nv1U4Cs2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=nv1U4Cs2;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBgxB6DSMz3bVJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Feb 2023 00:35:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=PMp0gXsVfVTqwcUhaqwEjQxmo111+Dr+n4G2THRRgz4=; b=nv1U4Cs2toJAUKTbNLnEh3GkOY
	7TafoARROVHQSw9xJfz56g9qot5qCf4w6m4SWQjlNps1Oe5T2sHs3KDsj7DDyHZsEule4Fc1EDsFi
	1ot7N3tXnfTdb0UAUOhw7OBfMJkQv96CLrRBbzSzT9W9CzOllOmN6OP7nihODAjH1GrmhpTSrxXbw
	+FQ3rTbD5HBPPVYU6nfEd7rZEnlmQKhiACj6Chvr3AVC+hWz7Ee5CIY899SSczPizMsfNgyHKXZEr
	J+yG9hswiuu8WG3XCLcbAsJkbqGmrnhF93OGExxTKKUafWDJ+5Nvu8CB5rz+/ij9RclHTGYLDqeqN
	r07kkj+g==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPkbR-001F0R-Gf; Wed, 08 Feb 2023 13:35:13 +0000
Date: Wed, 8 Feb 2023 13:35:13 +0000
From: Matthew Wilcox <willy@infradead.org>
To: "Yin, Fengwei" <fengwei.yin@intel.com>
Subject: Re: API for setting multiple PTEs at once
Message-ID: <Y+OlEUqJotSN3tLV@casper.infradead.org>
References: <Y9wnr8SGfGGbi/bk@casper.infradead.org>
 <Y+K0O35jNNzxiXE6@casper.infradead.org>
 <ba99ed28-61e4-4acd-ce17-338f5a49ef26@ghiti.fr>
 <b44d5dc7-ee7a-80e0-5401-829bf5740de5@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b44d5dc7-ee7a-80e0-5401-829bf5740de5@intel.com>
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
Cc: linux-arch@vger.kernel.org, linux-xtensa@linux-xtensa.org, linux-parisc@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, Dinh Nguyen <dinguyen@kernel.org>, linux-sh@vger.kernel.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, loongarch@lists.linux.dev, linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 08, 2023 at 08:09:00PM +0800, Yin, Fengwei wrote:
> 
> 
> On 2/8/2023 7:23 PM, Alexandre Ghiti wrote:
> > Hi Matthew,
> > 
> > On 2/7/23 21:27, Matthew Wilcox wrote:
> >> On Thu, Feb 02, 2023 at 09:14:23PM +0000, Matthew Wilcox wrote:
> >>> For those of you not subscribed, linux-mm is currently discussing
> >>> how best to handle page faults on large folios.  I simply made it work
> >>> when adding large folio support.  Now Yin Fengwei is working on
> >>> making it fast.
> >> OK, here's an actual implementation:
> >>
> >> https://lore.kernel.org/linux-mm/20230207194937.122543-3-willy@infradead.org/
> >>
> >> It survives a run of xfstests.  If your architecture doesn't store its
> >> PFNs at PAGE_SHIFT, you're going to want to implement your own set_ptes(),
> > 
> > 
> > riscv stores its pfn at PAGE_PFN_SHIFT instead of PAGE_SHIFT, se we need to reimplement set_ptes. But I have been playing with your patchset and we never fall into the case where set_ptes is called with nr > 1, any idea why? I booted a large ubuntu defconfig and launched will_it_scale.page_fault4.
> Need to use xfs filesystem to get large folio for file mapping.
> Other filesystem may be also OK. But I just tried xfs. Thanks.

XFS is certainly the flagship filesystem to support large folios, but
others have added support, AFS and EROFS.  You can also get large folios
in tmpfs (which is slightly different as it focuses on THPs rather than
generic large folios).

You also have to have CONFIG_TRANSPARENT_HUGEPAGE selected, which riscv
can do.  That restriction will be lifted at some point, but for now
large folios depends on the THP infrastructure.
