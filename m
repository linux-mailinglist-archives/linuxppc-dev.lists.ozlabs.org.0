Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D245B45451C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 11:38:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HvKCJ5gcLz2ywW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 21:38:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=d7sQJzBA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HvKBg4NWSz2yPg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Nov 2021 21:37:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=d7sQJzBA; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HvKBf2qQsz4xbH;
 Wed, 17 Nov 2021 21:37:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1637145466;
 bh=qFA3JuqA2Tw13gbwPc6IINiIKmjfsV807G3AsjfIsYY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=d7sQJzBAb/zFd3yuJB74+iaphy40en8y2NWqfebW3+jnh6Mcgm8BQzmYS7PyP4ZYu
 PUSc8QI8wgrpEQFEWEZJcsGGIEwEnTPWqBFHTAQLt0HEyy72/R3BvRgMhw6i33G2AY
 8/LnOtxgJklCNptvnbpOQo+1Viy83ndsrlam+pwGTvy0CgsS8nXn0pzf4yN4bMzCvj
 hKg6TOQhfEheh+qpzXgDzTSXnxss0BG3HwmCVwSkvCRB0aNXQFBOZQcPuQLhiAOCSb
 WBWn+wmR60jUlD6Dj79yKv0/c3Do0xSCcD+dkS66C4gQr0GZjNRusxwYhqvCO/bmiU
 tnwZantoErbgw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/pseries: delete scanlog
In-Reply-To: <87sfvvijjw.fsf@linux.ibm.com>
References: <20210920173203.1800475-1-nathanl@linux.ibm.com>
 <87sfvvijjw.fsf@linux.ibm.com>
Date: Wed, 17 Nov 2021 21:37:42 +1100
Message-ID: <877dd7m5jd.fsf@mpe.ellerman.id.au>
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
Cc: tyreld@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:
> Nathan Lynch <nathanl@linux.ibm.com> writes:
>> Remove the pseries scanlog driver.
>>
>> This code supports functions from Power4-era servers that are not present
>> on targets currently supported by arch/powerpc. System manuals from this
>> time have this description:
>>
>>   Scan Dump data is a set of chip data that the service processor gathers
>>   after a system malfunction. It consists of chip scan rings, chip trace
>>   arrays, and Scan COM (SCOM) registers. This data is stored in the
>>   scan-log partition of the system=E2=80=99s Nonvolatile Random Access
>>   Memory (NVRAM).
>>
>> PowerVM partition firmware development doesn't recognize the associated
>> function call or property, and they don't see any references to them in
>> their codebase. It seems to have been specific to non-virtualized
>> pseries.
>
> Just bumping this to see if there are any objections.

Not an objection, I like nothing better than dropping old unused cruft,
but are we sure it's safe to remove the proc file?

I see that rtas_errd still looks for it, have you checked that it will
handle the absence of the file gracefully and continue doing whatever
else it does?

On further inspection it looks like the code that looks for it in
rtas_errd is #if 0'ed out (??), so maybe it's dead.

Anyway if you can test that rtas_errd still works that'd be good.

Presumably there's no other code that cares about the proc file.

cheers
