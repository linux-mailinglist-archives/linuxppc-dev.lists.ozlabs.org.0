Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC9F1F4CED
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 07:31:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49hbF35FmMzDqY1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jun 2020 15:31:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49hbCM0WcxzDqRy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jun 2020 15:29:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=sEjIQdFj; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49hbCL5tLWz9sRR;
 Wed, 10 Jun 2020 15:29:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1591766974;
 bh=fNqo26CKoWyaZVJK1doGalsrS9SzepvHH6IhpKyC1zI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=sEjIQdFj22ErCzO5qG4LdatILMsTDC4pc0LJiC7MOivYgOdXcE01ibiku1SzxZhN/
 J+EEzypwSLbg0CfRDeXjYQP7HcetA4vu4njrC5cmFXi9Hd5t5/Xg/K90HZyWw266ho
 VcYmpHL4tJMp4TUB17vmdjf6frb+enHvviNZBqLLgwO0syPm7Hi5i90sKOyW18rQqP
 xbyQpKXgxvqKTc1AZaQ+mg73RPTZDIINnXmSwjemjeHL1Da/fg7C5Ci3JJhg2+DdY7
 goxKFwEKJg438MmksxYKFCkzvyJrS5K9sbihSnekpqfe254zGQrI0kLFRfBgYXS+Vp
 3XfMrGkVRqphQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Murilo Opsfelder =?utf-8?Q?Ara=C3=BAjo?= <mopsfelder@gmail.com>
Subject: Re: [PATCH v3 0/7] Base support for POWER10
In-Reply-To: <20200609165135.GA12260@kermit.br.ibm.com>
References: <20200521014341.29095-1-alistair@popple.id.au>
 <159168035553.1381411.323672966899358346.b4-ty@ellerman.id.au>
 <20200609165135.GA12260@kermit.br.ibm.com>
Date: Wed, 10 Jun 2020 15:30:00 +1000
Message-ID: <87wo4ffpyf.fsf@mpe.ellerman.id.au>
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
Cc: Alistair Popple <alistair@popple.id.au>, mikey@neuling.org,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Murilo Opsfelder Ara=C3=BAjo <mopsfelder@gmail.com> writes:
> On Tue, Jun 09, 2020 at 03:28:31PM +1000, Michael Ellerman wrote:
>> On Thu, 21 May 2020 11:43:34 +1000, Alistair Popple wrote:
>> > This series brings together several previously posted patches required=
 for
>> > POWER10 support and introduces a new patch enabling POWER10 architected
>> > mode to enable booting as a POWER10 pseries guest.
>> >
>> > It includes support for enabling facilities related to MMA and prefix
>> > instructions.
>> >
>> > [...]
>>
>> Patches 1-3 and 5-7 applied to powerpc/next.
>>
>> [1/7] powerpc: Add new HWCAP bits
>>       https://git.kernel.org/powerpc/c/ee988c11acf6f9464b7b44e9a091bf6af=
b3b3a49
>> [2/7] powerpc: Add support for ISA v3.1
>>       https://git.kernel.org/powerpc/c/3fd5836ee801ab9ac5b314c26550e209b=
afa5eaa
>> [3/7] powerpc/dt_cpu_ftrs: Advertise support for ISA v3.1 if selected
>>       https://git.kernel.org/powerpc/c/43d0d37acbe40a9a93d9891ca670638cd=
22116b1
>
> Just out of curiosity, why do we define ISA_V3_0B and ISA_V3_1 macros
> and don't use them anywhere else in the code?

Because we're sloppy :/

> Can't they be used in cpufeatures_setup_start() instead of 3000 and
> 3100 literals?

Yes please.

cheers
