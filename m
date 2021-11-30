Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0736E46323F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 12:22:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3KZC0Jr4z3cWG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 22:22:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fglLFmgm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3KYW2vm5z2yP3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 22:21:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=fglLFmgm; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4J3KYV6vFNz4xYy;
 Tue, 30 Nov 2021 22:21:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1638271311;
 bh=+oqQHDsZp2moI+NvP3YpOT0CCfUUg0y1WPehauJHJlg=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=fglLFmgmfTuoPaKndfKnPK6Hu/TUm2A2gnQdNpX8mZTvZYI4wAxW9sZPjAE2Om31x
 FUqrPHbNOWa73k0MSK0/n/BAqMmeaetHq8PZHrSmGAWLmNeFQrqw1I7tBXC0dsb4/e
 XhB1PNihWYTCsFHvgdG7HtM/avZl/PU/Szx+88VRrIn/XdSJN4KVyUpJXUBFJCsIAe
 DE2qWn7kkrIyjxBJvoWlPfvsctC/nGKSsLf8otp/OC06Y7pFq3NQvCVN1jN9cNaCSE
 FreQMM+U1Xi0DxJ61ooMtrRJmHacf9EZ3+7uZeYHLGyTWRgsHao5Pj8YjeV4AEdMSv
 XM+UqMw1JOmBg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Haren Myneni <haren@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/pseries/vas: Don't print an error when VAS is
 unavailable
In-Reply-To: <200d69c3f168f84bd8165935ad778c49bf8b83ff.camel@linux.ibm.com>
References: <20211126052133.1664375-1-npiggin@gmail.com>
 <43d21c1a-9122-d698-2229-e56c77a91313@kaod.org>
 <1637922573.8ofrolskkj.astroid@bobo.none>
 <87fsrepms0.fsf@mpe.ellerman.id.au>
 <200d69c3f168f84bd8165935ad778c49bf8b83ff.camel@linux.ibm.com>
Date: Tue, 30 Nov 2021 22:21:46 +1100
Message-ID: <87czmhq46t.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Haren Myneni <haren@linux.ibm.com> writes:
> On Tue, 2021-11-30 at 10:25 +1100, Michael Ellerman wrote:
>> Nicholas Piggin <npiggin@gmail.com> writes:
>> > Excerpts from C=C3=A9dric Le Goater's message of November 26, 2021 5:13
>> > pm:
>> > > On 11/26/21 06:21, Nicholas Piggin wrote:
>> > > > KVM does not support VAS so guests always print a useless error
>> > > > on boot
>> > > >=20
>> > > >      vas: HCALL(398) error -2, query_type 0, result buffer
>> > > > 0x57f2000
>> > > >=20
>> > > > Change this to only print the message if the error is not
>> > > > H_FUNCTION.
>> > >=20
>> > > Just being curious, why is it even called since "ibm,compression"
>> > > should
>> > > not be exposed in the DT ?
>> >=20
>> > It looks like vas does not test for it. I guess in theory there can
>> > be=20
>> > other functions than compression implemented as an accelerator.
>> > Maybe
>> > that's why?
>>=20
>> Yeah I guess, or it's just not structured that well. The vas platform
>> code is a bit awkward, it's there to support drivers, but it's not
>> actually driver code.
>>=20
>> I think we can probably rework it so the vas code does nothing until
>> a
>> driver calls in to it.
>>=20
>> eg. something like below.
>
> Correct, Even though NXGZIP is the only usage right now, VAS is
> accelerator switchboard which should support other coprocessor types
> such as GZIP and 842 or SW type solutions such as fast thread wakeup
> and fast memory copy.=20
>
> So can we leave VAS initialization separate from drivers and use some
> feature such as FW_FEATURE_LPAR to differentiate from KVM guests?

FW_FEATURE_LPAR is true on KVM guests as well.

As Tyrel pointed out, you should be looking for "hcall-vas" in
"ibm,hypertas-functions" and setting a new FW_FEATURE_VAS based on that.
Then use that to gate the vas init routine.

cheers
