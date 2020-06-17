Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 249761FC503
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 06:18:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49msHd2Hq2zDqGt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 14:18:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=VyUAIoha; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49msFm1hHMzDqwV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jun 2020 14:16:27 +1000 (AEST)
Received: from kernel.org (unknown [87.70.103.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E1E78206D8;
 Wed, 17 Jun 2020 04:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592367385;
 bh=YSs3rS7jimINWeUYP1cnNHyH0AxuWxWgoOijCC6+TGw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VyUAIohaqZorUXwTkRH2qBJCKLfdZvByHmqUzFZW7GdZb1lS4b+q8M1JrPeSpsERq
 kkY/b+DZfIuDP7TQMB0ubgyezfg8YBTEV5Wdvj6Kiuvzf5zUfTIiJmKvIp1vBs+SOC
 hVA54LY75gmPA9Nr3sNmUHwkfzx4I+RfAZut/9sY=
Date: Wed, 17 Jun 2020 07:16:17 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/8xx: use pmd_off() to access a PMD entry in
 pte_update()
Message-ID: <20200617041617.GA6571@kernel.org>
References: <20200615092229.23142-1-rppt@kernel.org>
 <20200616124304.bbe36933fcd48c5f467f4be9@linux-foundation.org>
 <87o8piegvt.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o8piegvt.fsf@mpe.ellerman.id.au>
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, linux-kernel@vger.kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 17, 2020 at 09:21:42AM +1000, Michael Ellerman wrote:
> Andrew Morton <akpm@linux-foundation.org> writes:
> > On Mon, 15 Jun 2020 12:22:29 +0300 Mike Rapoport <rppt@kernel.org> wrote:
> >
> >> From: Mike Rapoport <rppt@linux.ibm.com>
> >> 
> >> The pte_update() implementation for PPC_8xx unfolds page table from the PGD
> >> level to access a PMD entry. Since 8xx has only 2-level page table this can
> >> be simplified with pmd_off() shortcut.
> >> 
> >> Replace explicit unfolding with pmd_off() and drop defines of pgd_index()
> >> and pgd_offset() that are no longer needed.
> >> 
> >> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> >> ---
> >> 
> >> I think it's powerpc material, but I won't mind if Andrew picks it up :)
> >
> > Via the powerpc tree would be better, please.
> 
> I'll take it into next for v5.9, unless there's a reason it needs to go
> into v5.8.

I consider it a fixup for 5.8 merge window conflicts. Besides, mering it
now may avoid new conflicts in 5.9 ;-)

> cheers

-- 
Sincerely yours,
Mike.
