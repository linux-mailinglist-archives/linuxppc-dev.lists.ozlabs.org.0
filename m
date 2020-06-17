Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EBB1FCE10
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 15:06:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49n51Z436hzDqyX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 23:06:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49n4zC6lNHzDqj1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jun 2020 23:04:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=pOBB48QN; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49n4zB03pYz9sRf;
 Wed, 17 Jun 2020 23:04:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1592399078;
 bh=lMWVaP+IJqwxYXx0XCxsVq12dX+k4WTJuX55RHp3h1g=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=pOBB48QNNv+NWyG+uTcUl0oO3zQAIjTArOPfy/VLqEuTmAGX5fFF7C50tT8P+62Er
 rGr/wuxLv+MsvwOdScWGvovUwgSJWKWf0Brmnr82YrLuq1MBQJhWzADu0Id83GqrmO
 eJZCKgX3rCGFuz4Hmlh09Tq6EFKZSpG78NpgrW9Q0kGqFOsHigTTDxSBXAWMpDJHmG
 zgLICJUjpfsu+8NpJ+rAbJWEUTxeDljV+Oti9Ds+DIRIy8f7yrNsQxpjy0khgVcP67
 yT5gCbn6VB2VjjsvwWMCBksgkFJ9ZBVv/ET6ToZ29c6h0cD/nBS36rufuUldzrUrYa
 GfmuXSQvkDwJg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH] powerpc/8xx: use pmd_off() to access a PMD entry in
 pte_update()
In-Reply-To: <20200617041617.GA6571@kernel.org>
References: <20200615092229.23142-1-rppt@kernel.org>
 <20200616124304.bbe36933fcd48c5f467f4be9@linux-foundation.org>
 <87o8piegvt.fsf@mpe.ellerman.id.au> <20200617041617.GA6571@kernel.org>
Date: Wed, 17 Jun 2020 23:05:04 +1000
Message-ID: <875zbpetbz.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

Mike Rapoport <rppt@kernel.org> writes:
> On Wed, Jun 17, 2020 at 09:21:42AM +1000, Michael Ellerman wrote:
>> Andrew Morton <akpm@linux-foundation.org> writes:
>> > On Mon, 15 Jun 2020 12:22:29 +0300 Mike Rapoport <rppt@kernel.org> wrote:
>> >
>> >> From: Mike Rapoport <rppt@linux.ibm.com>
>> >> 
>> >> The pte_update() implementation for PPC_8xx unfolds page table from the PGD
>> >> level to access a PMD entry. Since 8xx has only 2-level page table this can
>> >> be simplified with pmd_off() shortcut.
>> >> 
>> >> Replace explicit unfolding with pmd_off() and drop defines of pgd_index()
>> >> and pgd_offset() that are no longer needed.
>> >> 
>> >> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
>> >> ---
>> >> 
>> >> I think it's powerpc material, but I won't mind if Andrew picks it up :)
>> >
>> > Via the powerpc tree would be better, please.
>> 
>> I'll take it into next for v5.9, unless there's a reason it needs to go
>> into v5.8.
>
> I consider it a fixup for 5.8 merge window conflicts. Besides, mering it
> now may avoid new conflicts in 5.9 ;-)

OK, I'll pick it up for v5.8.

cheers
