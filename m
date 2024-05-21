Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 9C1DB8CA578
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2024 02:56:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=X5NRwOCp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vjwmf1YtJz3g55
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2024 10:49:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=X5NRwOCp;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vjwlt2rd7z3dXC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2024 10:48:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1716252502;
	bh=YLA3mOlhQu9l5RqU75xfAtJgMMySlJsqBiBjGwoY8Fw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=X5NRwOCpFcBotgjRna13dxvT/o7xnf+Qgsg7NLp8c5A5cJz4rwMGdkHkS5s2nEst7
	 zZS3eFvoplEpepU32h45RjftKksRrdyYsQPgjDhaXdvsS71vnBI/seSpC0RP8Iw32f
	 udgFlZzlIi4FsxYS7hlqq9vKbhVbrLCzvAMIM8s9aYXk162otscAuQcVwFj1uT98WF
	 QUpdduIflhhd+BYm+bfn61BmCMxbgWxFaozRgF5a3NlcAfFJ1GQmPDwmfXMboL94Qg
	 ukh2cf8tz/B4A+ccwPbAIuoNWFg2J2g+ZUwW9SBlGkSh++THJRNvQ2mVP8AZxgLO4J
	 H8Xzu0Nu12FkQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Vjwln66Mgz4wjF;
	Tue, 21 May 2024 10:48:21 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Oscar Salvador
 <osalvador@suse.de>
Subject: Re: [RFC PATCH v2 06/20] powerpc/8xx: Fix size given to
 set_huge_pte_at()
In-Reply-To: <f26807dd-bbd2-405d-9a88-c0654c525a5c@csgroup.eu>
References: <cover.1715971869.git.christophe.leroy@csgroup.eu>
 <04f4e737608ea0b177b88057db138fbf0d6ab138.1715971869.git.christophe.leroy@csgroup.eu>
 <ZksUiwNaKx2n1fJO@localhost.localdomain>
 <f26807dd-bbd2-405d-9a88-c0654c525a5c@csgroup.eu>
Date: Tue, 21 May 2024 10:48:21 +1000
Message-ID: <87zfsk2dnu.fsf@mail.lhotse>
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Hi Oscar, hi Michael,
>
> Le 20/05/2024 =C3=A0 11:14, Oscar Salvador a =C3=A9crit=C2=A0:
>> On Fri, May 17, 2024 at 09:00:00PM +0200, Christophe Leroy wrote:
>>> set_huge_pte_at() expects the real page size, not the psize which is
>>=20
>> "expects the size of the huge page" sounds bettter?
>
> Parameter 'pzize' already provides the size of the hugepage, but not in=20
> the way set_huge_pte_at() expects it.
>
> psize has one of the values defined by MMU_PAGE_XXX macros defined in=20
> arch/powerpc/include/asm/mmu.h while set_huge_pte_at() expects the size=20
> as a value.
>
>>=20
>>> the index of the page definition in table mmu_psize_defs[]
>>>
>>> Fixes: 935d4f0c6dc8 ("mm: hugetlb: add huge page size param to set_huge=
_pte_at()")
>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>=20
>> Reviewed-by: Oscar Salvador <osalvador@suse.de>
>>=20
>> AFAICS, this fixup is not related to the series, right? (yes, you will
>> the parameter later)
>> I would have it at the very beginning of the series.
>
> You are right, I should have submitted it separately.
>
> Michael can you take it as a fix for 6.10 ?

Yeah I can. Does it actually cause a bug at runtime (I assume so)?

cheers
