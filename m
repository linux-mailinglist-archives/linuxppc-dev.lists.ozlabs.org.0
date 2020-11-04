Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8DE2A63F4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 13:12:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CR5BR1mB8zDqF6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 23:12:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=eD89QmjZ; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CR54638mTzDqVq
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 23:07:02 +1100 (AEDT)
Received: from kernel.org (unknown [87.71.17.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1F9B621734;
 Wed,  4 Nov 2020 12:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604491619;
 bh=duO1j2GGcQwevtBQUg8hBjbl0GtrzLAe1ZI9BqgVsxw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eD89QmjZS7Bhb45LPDsNVTa4M6Lrt1nokstBxIOs5ZmPG9N4cbuMHN0DRZsPKkx2L
 OdwqGkhjrJ6WVz2H3idePpfpYx9n1cBBpsxJDMgxfvnGLZndLM6eqoSOdGTKabWkBk
 58XHdmB3TudbGRqfdtIz7zg4vR0uya8vePLxMXVA=
Date: Wed, 4 Nov 2020 14:06:51 +0200
From: Mike Rapoport <rppt@kernel.org>
To: osalvador <osalvador@suse.de>
Subject: Re: [PATCH v1 3/4] powerpc/mm: remove linear mapping if
 __add_pages() fails in arch_add_memory()
Message-ID: <20201104120651.GQ4879@kernel.org>
References: <20201029162718.29910-1-david@redhat.com>
 <20201029162718.29910-4-david@redhat.com>
 <20201104095007.GB4981@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201104095007.GB4981@localhost.localdomain>
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
Cc: Michal Hocko <mhocko@suse.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Rashmica Gupta <rashmica.g@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 04, 2020 at 10:50:07AM +0100, osalvador wrote:
> On Thu, Oct 29, 2020 at 05:27:17PM +0100, David Hildenbrand wrote:
> > Let's revert what we did in case seomthing goes wrong and we return an
> > error.
> 
> Dumb question, but should not we do this for other arches as well?

It seems arm64 and s390 already do that. 
x86 could have its arch_add_memory() improved though :)

> -- 
> Oscar Salvador
> SUSE L3

-- 
Sincerely yours,
Mike.
