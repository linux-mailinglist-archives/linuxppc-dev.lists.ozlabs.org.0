Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D754D598A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 05:27:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KFCZb0Pzlz30Pj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 15:27:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Vqdg28P7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFCZ009qBz2xTp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Mar 2022 15:26:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Vqdg28P7; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KFCYv1GnHz4xcC;
 Fri, 11 Mar 2022 15:26:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1646972804;
 bh=kj3Y9rFdntioquAOckINO/fYRpiknqyh9JlE9pvUSLI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Vqdg28P7wEvdR0OsQnFjMnSgKWofZcoNHyHbXt0cZ7SR6tnO/hQW7oW3YF+ec5eGT
 zca6xSirV7Bo549tLPW6tvMtbO92cD5kBEmrhUCeeVRCJ0UWJdkrbE1x2pMd1GdAn5
 dlrGwS53BaUpvKIm7RMCAFWPU7XGk/66iIo899FRq685I2uDHEs8DDDKqOgsR23l2l
 OrO8lkePGsmUXZcNq7KvouVFnn5Iunaa8q5+RNlY953xnFe2X1CmhDeOjlgNMs5pry
 71qVg1KcR0r5Z9kuGD/cDNSdkPM3glbDcZWYiBujM8HfGC3P7uUFTb4sttCuFu75HE
 tb9mg13cRZH+A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>
Subject: Re: [PATCH v8 00/14] Convert powerpc to default topdown mmap layout
 (v8)
In-Reply-To: <ddfed61b-e387-4554-eb88-6654b391d1a4@csgroup.eu>
References: <cover.1646847561.git.christophe.leroy@csgroup.eu>
 <ddfed61b-e387-4554-eb88-6654b391d1a4@csgroup.eu>
Date: Fri, 11 Mar 2022 15:26:42 +1100
Message-ID: <877d91m7wd.fsf@mpe.ellerman.id.au>
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
Cc: "alex@ghiti.fr" <alex@ghiti.fr>, "will@kernel.org" <will@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Hi Michael, hi Andrew
>
> Le 09/03/2022 =C3=A0 18:44, Christophe Leroy a =C3=A9crit=C2=A0:
>> Rebased on top of powerpc/next branch
>>=20
>> This series converts powerpc to default topdown mmap layout.
>>=20
>> powerpc requires its own arch_get_unmapped_area() only when
>> slices are needed, which is only for book3s/64. First part of
>> the series moves slices into book3s/64 specific directories
>> and cleans up other subarchitectures.
>>=20
>> Last part converts to default topdown mmap layout.
>>=20
>> A small modification is done to core mm to allow
>> powerpc to still provide its own arch_randomize_brk()
>>=20
>> Another modification is done to core mm to allow powerpc
>> to use generic versions of get_unmapped_area functions for Radix
>> while still providing its own implementation for Hash, the
>> selection between Radix and Hash being doing at runtime.
>>=20
>> Last modification to core mm is to give len and flags to
>> arch_get_mmap_end().
>>=20
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>
> What's the way forward for this series ?

It's a bit of a tricky series.

> Patches 1 has been merged in PCI tree.

That's fine I guess, it can go into v5.18, it's only patch 14 that
depends on it.

> Patches 2 to 5 are core mm, patch 5 being a fix.

A fix for arm64 even, just to complicate things :)

> Then patches 6 to 14 are powerpc.

With a fairly sizable diffstat, ie. likely to conflict.

> What will be the merge strategy ? I guess it's a bit late to get it=20
> through powerpc tree, so I was just wondering whether we could get=20
> patches 2 to 5 in mm this cycle, and the powerpc ones next cycle ?

Yeah I didn't pick it up because the mm changes don't have many acks and
I'm always nervous about carrying generic mm changes.

It would be my preference if Andrew could take 2-5 through mm for v5.18,
but it is quite late, so I'm not sure how he will feel about that.

Arguably 2, 3, 4 do very little. It's only patch 5 that has much effect,
and it has a reviewed-by from Catalin at least.

cheers
