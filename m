Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2B25CDDC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 12:48:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dLYm4tQjzDqcn
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 20:48:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=will@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="lHT1gLTx"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dLWr5sslzDqNd
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2019 20:46:31 +1000 (AEST)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1F1912089C;
 Tue,  2 Jul 2019 10:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1562064389;
 bh=d+I6qmH/QCTka+zqQ3WJk0DN02qfJCa2dtx6zDjiFBw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lHT1gLTx89TB/WseAPEgeg3jwtTWQV6ml6he79iKQjNFXeKsq2Y/pY0Qx/aENG06K
 5DpyVTVBeZpDKR0tWxu8dHhMryM4/aMUuF6qEwhyWZfjnxML3x5zfiPL6RrMGHFpNu
 6t0z6xuHoV/H6X4hqAqpwROND3ZAIpBEhas5HSAI=
Date: Tue, 2 Jul 2019 11:46:24 +0100
From: Will Deacon <will@kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: Re: [PATCH 1/3] arm64: mm: Add p?d_large() definitions
Message-ID: <20190702104623.6mgpqt5ns4sj32in@willie-the-truck>
References: <20190623094446.28722-1-npiggin@gmail.com>
 <20190623094446.28722-2-npiggin@gmail.com>
 <20190701092756.s4u5rdjr7gazvu66@willie-the-truck>
 <3d002af8-d8cd-f750-132e-12109e1e3039@arm.com>
 <20190701101510.qup3nd6vm6cbdgjv@willie-the-truck>
 <1562036522.cz5nnz6ri2.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1562036522.cz5nnz6ri2.astroid@bobo.none>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Will Deacon <will.deacon@arm.com>, Steven Price <steven.price@arm.com>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 02, 2019 at 01:07:11PM +1000, Nicholas Piggin wrote:
> Will Deacon's on July 1, 2019 8:15 pm:
> > On Mon, Jul 01, 2019 at 11:03:51AM +0100, Steven Price wrote:
> >> On 01/07/2019 10:27, Will Deacon wrote:
> >> > On Sun, Jun 23, 2019 at 07:44:44PM +1000, Nicholas Piggin wrote:
> >> >> walk_page_range() is going to be allowed to walk page tables other than
> >> >> those of user space. For this it needs to know when it has reached a
> >> >> 'leaf' entry in the page tables. This information will be provided by the
> >> >> p?d_large() functions/macros.
> >> > 
> >> > I can't remember whether or not I asked this before, but why not call
> >> > this macro p?d_leaf() if that's what it's identifying? "Large" and "huge"
> >> > are usually synonymous, so I find this naming needlessly confusing based
> >> > on this patch in isolation.
> 
> Those page table macro names are horrible. Large, huge, leaf, wtf?
> They could do with a sensible renaming. But this series just follows
> naming that's alreay there on x86.

I realise that, and I wasn't meaning to have a go at you. Just wanted to
make my opinion clear by having a moan :)

Will
