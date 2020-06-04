Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9341EEC21
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 22:38:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49dHfn4rXCzDqss
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 06:38:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux-foundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=akpm@linux-foundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=Qq+Vitsm; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49dHcV379qzDqfL
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jun 2020 06:36:26 +1000 (AEST)
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D6040206E6;
 Thu,  4 Jun 2020 20:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591302983;
 bh=6tdvI6hVT12tR559Y0x/YhFiPVzayDyW2O1N/hc9g6c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Qq+Vitsm0LE8dgUTqTQ0PJt10JogRLNno17Te9gJX7oxFW7ATDBP35tpCOhVoRSDf
 ZLU6bXMm6yBmbq5o/AWzp33kWB8jss/xeVh6VQgYho6GvCdUNO06ShJ+VY6nDm9gw3
 UwiCaH4RqhPdb2XgCFpWNw4rgGS2KH5U7jjAZFbI=
Date: Thu, 4 Jun 2020 13:36:22 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH] mm: Fix pud_alloc_track()
Message-Id: <20200604133622.c23b365066af0b14a9f04961@linux-foundation.org>
In-Reply-To: <20200604164814.GA7600@kernel.org>
References: <20200604074446.23944-1-joro@8bytes.org>
 <20200604164814.GA7600@kernel.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
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
Cc: linux-arch@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 jroedel@suse.de, linux-mm@kvack.org, peterz@infradead.org,
 linuxppc-dev@lists.ozlabs.org, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Abdul Haleem <abdhalee@linux.vnet.ibm.com>, linux-next@vger.kernel.org,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 Andy Lutomirski <luto@kernel.org>, manvanth@linux.vnet.ibm.com, hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 4 Jun 2020 19:48:14 +0300 Mike Rapoport <rppt@kernel.org> wrote:

> On Thu, Jun 04, 2020 at 09:44:46AM +0200, Joerg Roedel wrote:
> > From: Joerg Roedel <jroedel@suse.de>
> > 
> > The pud_alloc_track() needs to do different checks based on whether
> > __ARCH_HAS_5LEVEL_HACK is defined, like it already does in
> > pud_alloc(). Otherwise it causes boot failures on PowerPC.
> > 
> > Provide the correct implementations for both possible settings of
> > __ARCH_HAS_5LEVEL_HACK to fix the boot problems.
> 
> There is a patch in mmotm [1] that completely removes
> __ARCH_HAS_5LEVEL_HACK which is a part of the series [2] that updates
> p4d folding accross architectures. This should fix boot on PowerPC and
> the addition of pXd_alloc_track() for __ARCH_HAS_5LEVEL_HACK wouldn't be
> necessary.
> 
> 
> [1] https://github.com/hnaz/linux-mm/commit/cfae68792af3731ac902ea6ba5ed8df5a0f6bd2f
> [2] https://lore.kernel.org/kvmarm/20200414153455.21744-1-rppt@kernel.org/

That patchset is stacked up behind many other patches, including all
the powerpc stuff in linux-next :(

As it's a big bug fix, I'll pull those patches forward, hopefully send it
all Linuswards later today...
