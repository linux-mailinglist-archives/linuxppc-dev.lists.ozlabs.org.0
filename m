Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B09877C693
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 06:01:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=CopCExEA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RPyJG32lFz3c7K
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 14:01:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=CopCExEA;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RPyHP60SQz2ytX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Aug 2023 14:01:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1692072063;
	bh=nIDeyPDR1fYGIXd4V15qRULGFD/IbdCDJF2LRUVHAXo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CopCExEAVijpln1YgNfHByuZGlpejzRWuq4nqWQRjTuvM22J4Ih8lVtwI5garc/IQ
	 /BaEptyMCsmF6h+XCmyex33B3boEnWDSdsTbC/BZ/6hNdy5JQiuvBD1R66b+41CeB7
	 MwTBUVBzwxKbkOvveNt4qWon6IcJR0ttIyrOoBLCeysHbBQyDYVDBzwGtbWYb7dN5o
	 yh5zzsc5ENsZcMCi6K9FJ7/hdaYrqHJgl7bJ2OctxemJU3Mr3okWEb4ZQb/nGzUWmM
	 yv/23K1mnLhsSHoLmB+8wBPi8fre6zCisWEqFUj/nXYabTAYZ1l+Iulpklqfbf4IE0
	 83PKtpfM4B2Vw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RPyHL1GWxz4wxK;
	Tue, 15 Aug 2023 14:01:01 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Michael Ellerman
 <patch-notifications@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Rob Herring
 <robh@kernel.org>
Subject: Re: [PATCH] powerpc: powermac: Use of_get_cpu_hwid() to read CPU
 node 'reg'
In-Reply-To: <f97e8c26-1379-dabc-21af-ebf4b06b31e7@wanadoo.fr>
References: <20230319145931.65499-1-robh@kernel.org>
 <168836201902.50010.13066091729121047041.b4-ty@ellerman.id.au>
 <f97e8c26-1379-dabc-21af-ebf4b06b31e7@wanadoo.fr>
Date: Tue, 15 Aug 2023 14:01:01 +1000
Message-ID: <874jl1dkea.fsf@mail.lhotse>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe JAILLET <christophe.jaillet@wanadoo.fr> writes:
> Le 03/07/2023 =C3=A0 07:26, Michael Ellerman a =C3=A9crit=C2=A0:
>> On Sun, 19 Mar 2023 09:59:31 -0500, Rob Herring wrote:
>>> Replace open coded reading of CPU nodes' "reg" properties with
>>> of_get_cpu_hwid() dedicated for this purpose.
>>>
>>>
>>=20
>> Applied to powerpc/next.
>>=20
>> [1/1] powerpc: powermac: Use of_get_cpu_hwid() to read CPU node 'reg'
>>        https://git.kernel.org/powerpc/c/bc1cf75027585f8d87f94e464ee5909a=
cf885a8c
>>=20
>> cheers
>>=20
>
> Hi,
>
> I guess, that it does not really matter, but shouldn't the=20
> of_node_put() be *after* the "reset_io =3D *rst;" statements to be=20
> absolutely safe?

Technically yes.

> (This change is in my backlog and I have apparently never proposed it)

Can you rebase and resend?

cheers
