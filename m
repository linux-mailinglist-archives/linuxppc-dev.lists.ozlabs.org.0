Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B43166B4E4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Jan 2023 01:07:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NwC521s7xz3c7s
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Jan 2023 11:07:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=q7J3XXP0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NwC453xygz2yWN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Jan 2023 11:06:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=q7J3XXP0;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NwC440BT8z4xN4;
	Mon, 16 Jan 2023 11:06:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1673827588;
	bh=1rICq1o5u85oCHK43ij3t3NWNz3O+CXQZT/fj6UR108=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=q7J3XXP0IjhEFcAZ7C/0bPwrtjTncprqS/t38/Wxkm2htW1H3pgkXSMr64szCuZAC
	 ngdKVWI/LgYFDqVmnzjAUWKp6bhj+a1RYJIYkWhJqlDHHgtcucyW+HBm1h6EYYTbtD
	 Q4ZVnCku9HFPbGPV4QUXvsMHeeQE0lOqqsHgiHKsI8iF0ckPkG1xYyv3HKxC9u70Nb
	 nUEKSIuvQRMhFFySbTaNkVyPyRfgDvhQnstge5vPX9i6FixAX6faW8KaAEV1tpoEhf
	 +naBsLAbUFdertQNE1vKTOFQ2SjwVYXCMUlyyqtUJrJ0ynQrHY+dnr6HedhYzvKtJr
	 W18kqnACXlbPA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Geoff Levand <geoff@infradead.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 1/2] powerpc/ps3: Change updateboltedpp panic to info
In-Reply-To: <284aed88-dc26-d74a-cf7a-f5875ba058eb@infradead.org>
References: <cover.1672767868.git.geoff@infradead.org>
 <2df879d982809c05b0dfade57942fe03dbe9e7de.1672767868.git.geoff@infradead.org>
 <25cc9a51-2311-d7d3-3451-08725e6384cd@csgroup.eu>
 <284aed88-dc26-d74a-cf7a-f5875ba058eb@infradead.org>
Date: Mon, 16 Jan 2023 11:06:24 +1100
Message-ID: <87mt6j9wcf.fsf@mpe.ellerman.id.au>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Geoff Levand <geoff@infradead.org> writes:
> On 1/9/23 09:41, Christophe Leroy wrote:
>>=20
>>=20
>> Le 03/01/2023 =C3=A0 18:51, Geoff Levand a =C3=A9crit :
>>> Commit fdacae8a84024474afff234bdd1dbe19ad597a10 (powerpc: Activate
>>> CONFIG_STRICT_KERNEL_RWX by default) causes ps3_hpte_updateboltedpp()
>>> to be called.  Change the panic statment in ps3_hpte_updateboltedpp()
>>> to a pr_info statement so that bootup can continue.
>>=20
>> But if I understand correctly, it means that CONFIG_STRICT_KERNEL_RWX=20
>> won't work then.
>>=20
>> So, shouldn't we keep the panic and forbid CONFIG_STRICT_KERNEL_RWX on P=
S3 ?
>
> mmu_hash_ops.updateboltedpp returns void, so I can't return an error code=
 to
> indicate the feature is not supported.

We could change that in the medium term.

> I could do something like this in arch/powerpc/Kconfig:
>
> -       select ARCH_HAS_STRICT_KERNEL_RWX       if (PPC_BOOK3S || PPC_8xx=
 || 40x) && !HIBERNATION
> +       select ARCH_HAS_STRICT_KERNEL_RWX       if (PPC_BOOK3S || PPC_8xx=
 || 40x) && !PPC_PS3 && !HIBERNATION
>
> But then the ppc64_defconfig would be built without STRICT_KERNEL_RWX.

Yeah that would be a pity.

We could do the above and disable PS3 in ppc64_defconfig, allowing
ppc64_defconfig to still have STRICT_KERNEL_RWX.

I assume actual PS3 users would use a ps3_defconfig anyway right?

Relatedly are there any actual PS3 users left? ;)

> I could do this in ps3_defconfig:
>
> +# CONFIG_STRICT_KERNEL_RWX is not set
> +# CONFIG_STRICT_MODULE_RWX is not set
>
> But I don't like that way because it seems too easy for users to not add =
those
> into a custom kernel config, and then they need to figure out what to do =
after
> their kernel panics on startup.

Yep agreed.

> What other 'clean' way is there?

If we want to have a multi-platform kernel image that can boot on PS3
and other platforms, and have strict kernel RWX, then we need some
runtime logic to deal with that.

I'd rather not do that though, because it adds complexity to deal with a
pretty obscure corner case, and I suspect no one really boots a
ppc64_defconfig on actual PS3 hardware these days.

So my preference is we disable PS3 in ppc64_defconfig, and make PS3
incompatible with STRICT_KERNEL_RWX.

cheers
