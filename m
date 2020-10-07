Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 673EC285F4C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 14:38:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5v5B1mvLzDqPT
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 23:38:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+47a0ee7340e53641f5ce+6254+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5v2y4GF7zDqHp
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Oct 2020 23:36:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=A8S5rW2sEaEJHpHml4mFPuJ2r5+DIxjOYtXnAeTe5d4=; b=cZcO41+5mqkO+dDkoy9Q3MuYw/
 vGjFobbV9rfsNmO8Vf9dzYmHg7toIxcvMAB4Xmsh0WCB3wKn+l6lwEawXUTLzi+gj7kBaBcruiwez
 gfcd4yrJ+Zce7OFzUkztjbQlz2/SQ7ISgG0vyzrDNbFnetzpeP3Qphof2P4Yh8Ik4R5tN0LCXpfNK
 IGD3h+jN4WY69QfQVtgCxs/FTAzGldoXol6IxO1sM66G/Hth5XDyV6EmJlmhI3xfEJxr2S91FEcsP
 9siebPZixepPSmbYEzyVH5amKjjV4nAaXypAfliKQbp5Y1z3vJFeg2ovOVMMEii5iR6uBgWnRj2Zr
 Z0/2uF5Q==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kQ8fY-0003dz-Db; Wed, 07 Oct 2020 12:35:44 +0000
Date: Wed, 7 Oct 2020 13:35:44 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Jann Horn <jannh@google.com>
Subject: Re: [PATCH 1/2] mm/mprotect: Call arch_validate_prot under mmap_lock
 and with length
Message-ID: <20201007123544.GA11433@infradead.org>
References: <20201007073932.865218-1-jannh@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201007073932.865218-1-jannh@google.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, Khalid Aziz <khalid.aziz@oracle.com>,
 Dave Kleikamp <shaggy@linux.vnet.ibm.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, Anthony Yznaga <anthony.yznaga@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 07, 2020 at 09:39:31AM +0200, Jann Horn wrote:
> diff --git a/arch/powerpc/kernel/syscalls.c b/arch/powerpc/kernel/syscalls.c
> index 078608ec2e92..b1fabb97d138 100644
> --- a/arch/powerpc/kernel/syscalls.c
> +++ b/arch/powerpc/kernel/syscalls.c
> @@ -43,7 +43,7 @@ static inline long do_mmap2(unsigned long addr, size_t len,
>  {
>  	long ret = -EINVAL;
>  
> -	if (!arch_validate_prot(prot, addr))
> +	if (!arch_validate_prot(prot, addr, len))

This call isn't under mmap lock.  I also find it rather weird as the
generic code only calls arch_validate_prot from mprotect, only powerpc
also calls it from mmap.

This seems to go back to commit ef3d3246a0d0
("powerpc/mm: Add Strong Access Ordering support")
