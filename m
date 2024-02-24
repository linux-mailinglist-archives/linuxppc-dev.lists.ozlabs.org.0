Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAB8862883
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Feb 2024 00:53:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QJl9jSue;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tj3cZ5kRPz3dWF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Feb 2024 10:53:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QJl9jSue;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tj3bh352rz3bqB
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Feb 2024 10:53:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1708818781;
	bh=1nyHqj0QOBXadNL1hyU/ColE1K5lSLjIwFZkoy6rtag=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QJl9jSuexI8C7+aTFRi4Uw3JVm/OzPKx0XyDV4jzYQ5bpBMXjczt1ClZljxOfF4Ik
	 srsogx7TfrD/T0zSjTW1cbU5tAitE6G+eqhAuNYBxrpbqSMfigcsr5KqSsBJng9W8J
	 0+4Wq2O6c/6wyMdoJ6futCIzZC7xIg9YLGsEZegDUZAFH5I6zApLSSEp0D0L4ETpEr
	 l2YNvJgsngE7EmCM7kLJT5IRXDbhZLBEuwLzUhbH4R6362It5/InBWPKnnXudXmOdP
	 5bgDUiVXJ4ilpMy5qr2hYBR8mrzDhk6lLExiZYOh2x3JcX5hG2gsOFtuuWqN2nm4l7
	 8UnXfG7bI+vNQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tj3bc4br7z4wc6;
	Sun, 25 Feb 2024 10:52:58 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 4/5] powerpc: Remove cpu-as-y completely
In-Reply-To: <94d19157-a343-425f-906f-546b1f4def6f@csgroup.eu>
References: <38a8d765ed9149bc6b5484a7142e3bc59ffa3b1a.1671475543.git.christophe.leroy@csgroup.eu>
 <9e43ad8b173c2fdb540e2555a8ba3e375419f3cf.1671475543.git.christophe.leroy@csgroup.eu>
 <873570zxio.fsf@mpe.ellerman.id.au>
 <94d19157-a343-425f-906f-546b1f4def6f@csgroup.eu>
Date: Sun, 25 Feb 2024 10:52:58 +1100
Message-ID: <87msrpa085.fsf@mail.lhotse>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "jbglaw@lug-owl.de" <jbglaw@lug-owl.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 20/02/2023 =C3=A0 07:00, Michael Ellerman a =C3=A9crit=C2=A0:
>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>> cpu-as-y is there to force assembler building options.
>>> But there is no need for that. Gcc is passed the necessary
>>> options and it automatically pass the appropriate option to
>>> GAS.
>>>
>>> GCC is given -maltivec when relevant, so no need
>>> for -Wa,-maltivec in addition
>>>
>>> And -Wa,-many is wrong as it will hide innapropriate
>>> instructions. Better to detect them and handle them on a
>>> case by case basis.
>>> -Wa,-many was added by commit 960e30029863 ("powerpc/Makefile:
>>> Fix PPC_BOOK3S_64 ASFLAGS") in order to fix an issue with
>>> clang and the passed -Wa,-mpower4 option. But we have now
>>> removed it expecting the compiler to automatically pass the
>>> proper options and instructions based on -mcpu=3Dpower4
>>=20
>> I wanted to apply this one, but it caused a lot of breakage for big
>> endian Book3S-64 builds - where we build for power4 but have lots of
>> code that uses >=3D power5 instructions.
>>=20
>> I'll try and get those all fixed and pick this up for the next merge
>> window.
>
> ping ?

Brutal :)

There's still a few issues, I have patches for most of them I think.
Will post this week.

cheers
