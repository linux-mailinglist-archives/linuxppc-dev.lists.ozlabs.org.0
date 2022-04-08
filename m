Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0774F8CF7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 06:19:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZQ4X2cqyz3bZN
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 14:19:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Tuvt+Tlb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZQ3x3PNjz2xSP
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Apr 2022 14:18:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Tuvt+Tlb; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KZQ3w3FVDz4xYM;
 Fri,  8 Apr 2022 14:18:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1649391533;
 bh=cjYBTjklj00HDvhS3/U5cqicB2OBer7ACezpg5DgVZ4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Tuvt+TlbmzA2mXHv79hebUW9i/T3Xmbhfn/ul+eb8fB5gUYshaBZYfodcBHEy4w2T
 szlqJjJZmpBFyoXRLyQUF1RNu1eR9JOdI+OsRMzE/ylHcOGlsqnX9aO1YVhFhi+oMC
 SjRy2Qm8cy7UmCJLeFZ9WGyEwgp+ZxSLDh1GnU4shc9cYNr374glXC8VcFzbEh432X
 AhJlbwd/WfEhhB7Xz/xkCdLTtvIswW5YNO1RTGD5+Y1I4O5bVMzZOyoSlrU/IIbiIb
 s6TTkyfUfwcCWj3PRPT/oqGPzVzsvry4c981/bniw0FlXPmcv7NKJ9wBLcdVZYy5aC
 YZfFwySey7zkw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Andrew Morton
 <akpm@linux-foundation.org>
Subject: Re: [PATCH v8 00/14] Convert powerpc to default topdown mmap layout
 (v8)
In-Reply-To: <5666917d-81b3-e010-776a-2c2ddccd400e@csgroup.eu>
References: <cover.1646847561.git.christophe.leroy@csgroup.eu>
 <ddfed61b-e387-4554-eb88-6654b391d1a4@csgroup.eu>
 <877d91m7wd.fsf@mpe.ellerman.id.au>
 <20220310204917.3d42e6cf3088f7cf1c7fe7a6@linux-foundation.org>
 <e61f1ab5-075a-8d68-0315-4d7069be1650@csgroup.eu>
 <5666917d-81b3-e010-776a-2c2ddccd400e@csgroup.eu>
Date: Fri, 08 Apr 2022 14:18:52 +1000
Message-ID: <87sfqo6wcz.fsf@mpe.ellerman.id.au>
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
> Le 04/04/2022 =C3=A0 07:22, Christophe Leroy a =C3=A9crit=C2=A0:
>> Le 11/03/2022 =C3=A0 05:49, Andrew Morton a =C3=A9crit=C2=A0:
>>> On Fri, 11 Mar 2022 15:26:42 +1100 Michael Ellerman=20
>>> <mpe@ellerman.id.au> wrote:
>>>
>>>>> What will be the merge strategy ? I guess it's a bit late to get it
>>>>> through powerpc tree, so I was just wondering whether we could get
>>>>> patches 2 to 5 in mm this cycle, and the powerpc ones next cycle ?
>>>>
>>>> Yeah I didn't pick it up because the mm changes don't have many acks a=
nd
>>>> I'm always nervous about carrying generic mm changes.
>>>>
>>>> It would be my preference if Andrew could take 2-5 through mm for v5.1=
8,
>>>> but it is quite late, so I'm not sure how he will feel about that.
>>>
>>> 5.18 isn't a problem.=C2=A0 Perhaps you meant 5.17, which would be real=
 tough.
>>>
>>> Can we take a look after 5.18-rc1?
>>=20
>> 5.18-rc1 was released last night.
>>=20
>> Can you take patchs 2-5 as they are, or do you prefer I resend them to=20
>> yourself as a standalone series ?
>
> Are you expecting anything from me ? Do you need a resend of those 4=20
> patches as a standalone series ?

I think that's probably best, saves akpm having to extract the patches
from the series.

cheers
