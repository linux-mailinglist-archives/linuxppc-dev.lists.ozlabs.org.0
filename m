Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC8F4D2D20
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 11:29:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KD7jC2YVGz3bTt
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 21:29:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=reA0wEc7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KD7hX5GpYz30K0
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Mar 2022 21:28:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=reA0wEc7; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KD7hX2jG0z4xcl;
 Wed,  9 Mar 2022 21:28:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1646821724;
 bh=fIpjsewHTmjYkWokF6RA3q1V2Q8A8cV3wzX2JhLtD3A=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=reA0wEc76tJdZBYALh9kwBVspHwK07UiJRgenk3bWy4P+bGza4kSqIsh6jINCc6Np
 89QrC+x2KWaOZXKsEck05ADBjv/d2Zx+Udx8xy51YRrDQnW3mmviF0UXE91rLs0C5h
 Zs2SPwmNh0Jtvd4dbsvRUDqCOxkvWiJCElBEvPaHQgtPwjZsZ4kzm+uwvVPIbnhcAr
 nRmcoXvCUhhR2EyZxIfcKW7jlsTMh+16d/vJJR/1mj0DynqXBwiIcNkvojWHp4iBwl
 IoTEEt7vdYEh91R7HOP7yC0pkHnpHMncBJyCjgW5EP3VZpdHPJIsuVeQ1uL3J5vm1e
 ksawGTKtIDHPQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Alistair Popple
 <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 4/7] powerpc/dt_cpu_ftrs: Set current thread fscr bits
In-Reply-To: <4c76a361-09a6-3c91-4ee8-36e035437496@csgroup.eu>
References: <20200521014341.29095-1-alistair@popple.id.au>
 <20200521014341.29095-5-alistair@popple.id.au>
 <4c76a361-09a6-3c91-4ee8-36e035437496@csgroup.eu>
Date: Wed, 09 Mar 2022 21:28:40 +1100
Message-ID: <87lexjmnc7.fsf@mpe.ellerman.id.au>
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
Cc: aneesh.kumar@linux.ibm.com, mikey@neuling.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 21/05/2020 =C3=A0 03:43, Alistair Popple a =C3=A9crit=C2=A0:
>> Setting the FSCR bit directly in the SPR only sets it during the initial
>> boot and early init of the kernel but not for the init process or any
>> subsequent kthreads. This is because the thread_struct for those is
>> copied from the current thread_struct setup at boot which doesn't
>> reflect any changes made to the FSCR during cpu feature detection. This
>> patch ensures the current thread state is updated to match once feature
>> detection is complete.
>>=20
>> Signed-off-by: Alistair Popple <alistair@popple.id.au>
>
> I see that the series has been merged but this patch was left over.
>
> Has it been forgotten or is it rejected ?

I fixed the underlying issue, see:

  912c0a7f2b5d ("powerpc/64s: Save FSCR to init_task.thread.fscr after feat=
ure init")

So I guess it was superseeded (by a preceeding patch).

cheers
