Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65295729ACA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 14:56:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qd1LT1SSnz3f90
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 22:56:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=EwB3F//8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qd1KX67WMz3f0T
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 22:56:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=EwB3F//8;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Qd1KQ2t5Qz4x3x;
	Fri,  9 Jun 2023 22:55:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1686315355;
	bh=6hU42edEeCSuu+D9dpO9GvNrSsgyCJqWaGuZfm40wB0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EwB3F//8pFCLNpmDUVeIo8piNUnx0Gt2G0w+0UXSMJrP1U57KHSECjtlTuFqAYtZc
	 L+mvTbBkg/fnsaZ34YaMSb09wNzpJfePZNiPn518SIurg50xsYo5FIesgQldwcalbo
	 0javXPbZ1zQjFhXDiPPtmTttttkc3QYUc8dhiGvBO71eaQcOr4UUgB3MD891tkir1Z
	 xWzMVc/ot7HOLiZ0VIkY9jiO92sW7gQk/WZTIrHIwnHgvYrtHAw5ZwZyPyLoB28Ig6
	 ZKaHSoEHZaLDlAKDJA/gEfmY7sPUuranAuGb+v8HPgmOy/vAcB5oZJONcLz0LdoMMW
	 tuBc+47MFsM6g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Marco Elver
 <elver@google.com>
Subject: Re: [PATCH 1/3] kcsan: Don't expect 64 bits atomic builtins from 32
 bits architectures
In-Reply-To: <662d074e-58cf-3bde-f454-e58d04803f34@csgroup.eu>
References: <cover.1683892665.git.christophe.leroy@csgroup.eu>
 <d9c6afc28d0855240171a4e0ad9ffcdb9d07fceb.1683892665.git.christophe.leroy@csgroup.eu>
 <CANpmjNMm-2Tdhp6rDzA7CYvotmmGmLUnZnA_35yLUvxHB=7s0g@mail.gmail.com>
 <662d074e-58cf-3bde-f454-e58d04803f34@csgroup.eu>
Date: Fri, 09 Jun 2023 22:55:49 +1000
Message-ID: <877cschk16.fsf@mail.lhotse>
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
Cc: Chris Zankel <chris@zankel.net>, "Paul E. McKenney" <paulmck@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, Rohan McLure <rmclure@linux.ibm.com>, "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 12/05/2023 =C3=A0 18:09, Marco Elver a =C3=A9crit=C2=A0:
>> On Fri, 12 May 2023 at 17:31, Christophe Leroy
>> <christophe.leroy@csgroup.eu> wrote:
>>>
>>> Activating KCSAN on a 32 bits architecture leads to the following
>>> link-time failure:
>>>
>>>      LD      .tmp_vmlinux.kallsyms1
>>>    powerpc64-linux-ld: kernel/kcsan/core.o: in function `__tsan_atomic6=
4_load':
>>>    kernel/kcsan/core.c:1273: undefined reference to `__atomic_load_8'
>>>    powerpc64-linux-ld: kernel/kcsan/core.o: in function `__tsan_atomic6=
4_store':
>>>    kernel/kcsan/core.c:1273: undefined reference to `__atomic_store_8'
...
>>>
>>> 32 bits architectures don't have 64 bits atomic builtins. Only
>>> include DEFINE_TSAN_ATOMIC_OPS(64) on 64 bits architectures.
>>>
>>> Fixes: 0f8ad5f2e934 ("kcsan: Add support for atomic builtins")
>>> Suggested-by: Marco Elver <elver@google.com>
>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>=20
>> Reviewed-by: Marco Elver <elver@google.com>
>>=20
>> Do you have your own tree to take this through with the other patches?
>
> I don't have my own tree but I guess that it can be taken by Michael for=
=20
> 6.5 via powerpc tree with acks from you and Max.
>
> Michael is that ok for you ?

Yeah I can take it.

cheers
