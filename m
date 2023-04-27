Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4E16F070E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Apr 2023 16:14:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q6d5N1HcXz3fBF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Apr 2023 00:14:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=rxAoUoti;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q6d4S4MCDz3cT4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Apr 2023 00:13:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=rxAoUoti;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Q6d4S2KKRz4x5Q;
	Fri, 28 Apr 2023 00:13:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1682604792;
	bh=q8JlyF1aNHES3h7STLRujrhXXNku8XOt2DBhyeyLDsM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rxAoUotiaSZ0B2MNtNhK5O54ewKr2Y2p8GBh/uVfcRd9tG/U0VHYrTnPf3mNaz4dd
	 Mp/8hZCTKlweQnYjAb5Sj4Ov9JxcltPWKZE+x6DL3LxxrqN8TkChjPV1uF7qKM9SRT
	 hpgr0tQrXlRUty6wErrsWaImciH/uMlV/GDOrgokOcwaRK4cZyJlLQ3pWZFtJBgmtz
	 hT+B4HcnXs2kv+o+mBSWBYMTuBNVPyJKRqdfJl8AKMV//sefay3ZAt3ejWCkbtPb5c
	 zzEaWFUCwGojRWKmFYMstmPzw9jIxB5TLmOh/WySVKQFx+X0sl3RU/5fnAxo0tBayW
	 s6r1DNjDfs4iQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: Re: BUG : PowerPC RCU: torture test failed with __stack_chk_fail
In-Reply-To: <CAABZP2z=xu+07-y5fqFLidZz1VpSgrSwXa1mFHPb=b3Ezr3OtA@mail.gmail.com>
References: <CAABZP2xJRGhPmfB-PrfesQKzP7fsuZsj+3TewAiLLW8u=YK4dg@mail.gmail.com>
 <87cz3tylwx.fsf@mail.concordia>
 <CAABZP2zr=jypD7w_o18o95QEj1nkFugLcNH5sbuSAY-caBQoeQ@mail.gmail.com>
 <CAABZP2xVCQhizytn4H9Co7OU3UCSb_qNJaOszOawUFpeo=qpWQ@mail.gmail.com>
 <87v8hixbql.fsf@mail.concordia>
 <CAABZP2z=xu+07-y5fqFLidZz1VpSgrSwXa1mFHPb=b3Ezr3OtA@mail.gmail.com>
Date: Fri, 28 Apr 2023 00:13:11 +1000
Message-ID: <87wn1xquq0.fsf@mail.concordia>
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
Cc: rcu <rcu@vger.kernel.org>, lance@osuosl.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel <linux-kernel@vger.kernel.org>, "Paul E.
 McKenney" <paulmck@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Zhouyi Zhou <zhouzhouyi@gmail.com> writes:
> On Thu, Apr 27, 2023 at 11:09=E2=80=AFAM Michael Ellerman <mpe@ellerman.i=
d.au> wrote:
>>
>> Zhouyi Zhou <zhouzhouyi@gmail.com> writes:
>> > On Tue, Apr 25, 2023 at 2:01=E2=80=AFPM Zhouyi Zhou <zhouzhouyi@gmail.=
com> wrote:
>> >> On Tue, Apr 25, 2023 at 6:07=E2=80=AFAM Michael Ellerman <mpe@ellerma=
n.id.au> wrote:
>> ...
>> >> >
>> >> > There's 12.2.0 here:
>> >> >   https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86=
_64/12.2.0/
>> >> >   https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/ppc=
64le/12.2.0/
>>
>> > powerpc64le-linux-gnu-gcc-12 cross compiler on my Ubuntu 22.04 does
>> > not seem to have that issue as gcc-10 does
>>
>> OK. So so far it's only that GCC 10 that shows the problem.
>>
>> If you have time, you could use some of the other versions to narrow
>> down which versions show the bug:
>>
>>   https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/ppc64le/
>>
>> There's an 11.0, 11.1 and 11.3 there, as well as 9.5 and so on.
> GCC test results (Tested on PPC VM of Open Source Lab of Oregon State
> University)
> gcc 9.4 (ubuntu native):          positive, show bug
> gcc 9.5 (download form [1]):   positive, show bug
> gcc 10.1 (download from [1]): positive, show bug
> gcc 10.3 (download from [1]): positive, show bug
> gcc 10.4 (download from [1]): positive, show bug
>
> gcc 11.0 (download from [1]): negative, no bug
> gcc 11.1 (download from [1]): negative, no bug
> gcc 11.3 (download from [1]): negative, no bug
> gcc 12.1 (download from [1]): negative, no bug
> gcc 12.2 (download from [1]): negative, no bug

Awesome work.

How are you testing for presence/absence of the bug? By running your
test and seeing if it crashes, or by looking at the generated code?

cheers
