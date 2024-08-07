Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1306494B1F4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 23:17:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=0TFKINsp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfNLH6xh6z3dRP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 07:17:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=0TFKINsp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfNKc74LFz3cnv
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 07:17:08 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7F13161361;
	Wed,  7 Aug 2024 21:17:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43CC7C32781;
	Wed,  7 Aug 2024 21:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1723065425;
	bh=+gUpbSegd1rP99qLghMnsgBErS9zrHF45NWkbO3C0pc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=0TFKINspgpAlLabxd/er+hxRd2vgR0Zs5pOwaZjJoMxyXSkODwI2oFe2cXYsgU71q
	 Run8TO4CZCIZS1bbMHvyICsWBdEqyNihC5Nqewyg+REZ3YSGiX6Jk1u9Z9eJt6Ocsv
	 Ud42JWI0sqQqmHgCa6cvnF/vmd5PDgkW2tmTDDQA=
Date: Wed, 7 Aug 2024 14:17:03 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v4 0/7] mm/mprotect: Fix dax puds
Message-Id: <20240807141703.d641001ee14177ccf80a31d8@linux-foundation.org>
In-Reply-To: <20240807194812.819412-1-peterx@redhat.com>
References: <20240807194812.819412-1-peterx@redhat.com>
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

On Wed,  7 Aug 2024 15:48:04 -0400 Peter Xu <peterx@redhat.com> wrote:

> 
> Dax supports pud pages for a while, but mprotect on puds was missing since
> the start.  This series tries to fix that by providing pud handling in
> mprotect().  The goal is to add more types of pud mappings like hugetlb or
> pfnmaps.  This series paves way for it by fixing known pud entries.
> 
> Considering nobody reported this until when I looked at those other types
> of pud mappings, I am thinking maybe it doesn't need to be a fix for stable
> and this may not need to be backported.  I would guess whoever cares about
> mprotect() won't care 1G dax puds yet, vice versa.  I hope fixing that in
> new kernels would be fine, but I'm open to suggestions.

Yes, I'm not sure this is a "fix" at all.  We're implementing something
which previously wasn't there.  Perhaps the entire series should be
called "mm: implement mprotect() for DAX PUDs"?


