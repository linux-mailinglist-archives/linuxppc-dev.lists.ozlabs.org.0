Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4905AC41B
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Sep 2022 13:25:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ML8T041Y4z3bqC
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Sep 2022 21:25:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pLWU3vik;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ML8SH6bJWz2xJF
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 Sep 2022 21:24:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pLWU3vik;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ML8SD6XYnz4xD3;
	Sun,  4 Sep 2022 21:24:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1662290669;
	bh=SkbbySYMzjN681JuXWKI64my/YXEjiJSMepW8ZINa6s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pLWU3vikvJcfF6Zr9d88cqXSzuA9+HNfmlheNkAlLN3tzYR2MD2I5LbPXWfJ1GlP3
	 83o5WLJze5vFcVWcK6brd+2l2mTBUxE2tHJlsnr5M8SQo70Q1oh+cK2wE3dMjmKoo0
	 Yi04j6y3C1aDDIesv0GWXSe375VUay62WL2iIj0V/nTrTfqgbuOavVz5TGfgR1P7LH
	 qSC2/v4FvctidpicN2Kzt2M/KZOzISMpDjleo+PC75HTs4YjAkbNesuO3VorlxmdXY
	 laAvbcj3wV3mtJ+jmFoNnDzFsmcpyIsaTdPKCxhhk1ew3xMXh/vv7fZrYEp76P4qC7
	 o+CRFsSyKvoyQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 1/2] powerpc/mm/64s: Drop pgd_huge()
In-Reply-To: <9534a2bd-57d7-400c-500b-4a591dbb3fbc@csgroup.eu>
References: <20220903123640.719846-1-mpe@ellerman.id.au>
 <9534a2bd-57d7-400c-500b-4a591dbb3fbc@csgroup.eu>
Date: Sun, 04 Sep 2022 21:24:23 +1000
Message-ID: <87o7vvtmag.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, "aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>, "mike.kravetz@oracle.com" <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 03/09/2022 =C3=A0 14:36, Michael Ellerman a =C3=A9crit=C2=A0:
>
> ...
>
>>=20
>> However in commit ba95b5d03596 ("powerpc/mm/book3s/64: Rework page table
>> geometry for lower memory usage") the page table layout was reworked to
>> shrink the size of the PGD.
>>=20
>> As a result the 16GB page size now fits at the PUD level when using 64K
>> base page size.
>>=20
>> Therefore there are no longer any supported configurations where
>> pgd_huge() can be true, so drop the definitions for pgd_huge(), and
>> fallback to the generic definition which is always false.
>
> We also have pgd_huge defined as always false in:
>   arch/powerpc/include/asm/page.h
>   arch/powerpc/include/asm/nohash/pgtable.h
>
> Those could be removed as well as there is a default definition in=20
> include/linux/hugetlb.h
=20
Yep.

> And then all uses of pgd_huge() in the core mm can be dropped because=20
> powerpc was the only user.

The original reason I looked at this is because Mike was looking at
things on the mm side and noticed that we were the only user of
pgd_huge().

So yeah I think it can be removed from core mm, but I'll leave that up
to the mm folks. There are already some other changes in that area in
flight that could conflict if I try to do more extensive changes in this
series.

cheers
