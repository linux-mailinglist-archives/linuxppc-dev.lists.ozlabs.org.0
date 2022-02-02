Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A254A6C63
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Feb 2022 08:38:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JpYZC5K3Qz3bVW
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Feb 2022 18:38:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ttC/UT8k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ttC/UT8k; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JpYYZ3JGvz30JB
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Feb 2022 18:37:54 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4526F6178B;
 Wed,  2 Feb 2022 07:37:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79825C004E1;
 Wed,  2 Feb 2022 07:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643787471;
 bh=7Zag7dWQmRrl03hXTb84l3LTObjja6xIUoq+LfZuQXk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ttC/UT8kEhBhnoU8XxjcM+p0HX+TJ8ZQD46rgIV95aQ62WZkyTz2SCPAD8aVNNPfd
 4y7xCYEmK+ZfPA61pTFl/sPSnTMlkF55i7nwGo9tGjsiiFSX4wcyKiRELSf+Q8mlGJ
 owSoa28EIL1M7x8JHcOINTehR6vQlheRxUr7IIwBnFyiKIlr80xn1pY4O5KmIWJXDZ
 8RyTbYPZQa42Joj4T5iGucj+EvoGd81De984eK0epLrIWjmbwgl7AIGdz0jrDL22GR
 kYFTRLX7vyfZKTO5TceTnUIfAy/CwPH7+hSedDh48ijxSe8XSXDgT31hzBzgiaXaTu
 3wLM+EmzJYSTQ==
Date: Wed, 2 Feb 2022 09:37:41 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] mm: Merge pte_mkhuge() call into arch_make_huge_pte()
Message-ID: <Yfo0xR30H5jf3BsN@kernel.org>
References: <1643780286-18798-1-git-send-email-anshuman.khandual@arm.com>
 <YfoiLdboxJAxKi6Y@kernel.org>
 <76605ef1-f2fe-8682-1eb7-2323f0b9bbaa@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <76605ef1-f2fe-8682-1eb7-2323f0b9bbaa@csgroup.eu>
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
Cc: Will Deacon <will@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 02, 2022 at 06:25:31AM +0000, Christophe Leroy wrote:
> 
> 
> Le 02/02/2022 à 07:18, Mike Rapoport a écrit :
> > On Wed, Feb 02, 2022 at 11:08:06AM +0530, Anshuman Khandual wrote:
> >> Each call into pte_mkhuge() is invariably followed by arch_make_huge_pte().
> >> Instead arch_make_huge_pte() can accommodate pte_mkhuge() at the beginning.
> >> This updates generic fallback stub for arch_make_huge_pte() and available
> >> platforms definitions. This makes huge pte creation much cleaner and easier
> >> to follow.
> > 
> > Won't it break architectures that don't define arch_make_huge_pte()?
> 
> It shouldn't, see below

Right, overlooked that.
 
> >> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> >> index d1897a69c540..52c462390aee 100644
> >> --- a/include/linux/hugetlb.h
> >> +++ b/include/linux/hugetlb.h
> >> @@ -754,7 +754,7 @@ static inline void arch_clear_hugepage_flags(struct page *page) { }
> >>   static inline pte_t arch_make_huge_pte(pte_t entry, unsigned int shift,
> >>   				       vm_flags_t flags)
> >>   {
> >> -	return entry;
> >> +	return pte_mkhuge(entry);
> >>   }
> >>   #endif
> >>   

-- 
Sincerely yours,
Mike.
