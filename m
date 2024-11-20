Return-Path: <linuxppc-dev+bounces-3453-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E0D9D4474
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2024 00:27:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XtyFd62fhz2xg3;
	Thu, 21 Nov 2024 10:27:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732145253;
	cv=none; b=NMQFy7gVgajNLzCB62jMiJXzm5OfEkhvNh1gGAlei9bKyNlsRuhE1xd2P01IJKtZYoNzsibK2Cm3s64O+SOpDTKVENs0ko0Mxqf1OFiYeDyD63nMzdgcwRL5sYaQeAl7YlzMtVaVvAeUbGdn84Ghkl/JN8Jjl3Kfa2hUNaIJ4doO/o6nDJzReuHmwEoJLHrddVQXkvfOnrV+4MRN/79x6NhNYK/doM9gFD4IiJSIqE2TZCNKdFy7vkagi0FRffcWLzKmn+0nVc4Fw+a72KCe8+mSpPwxnUwExCmOgp1pC1wnzhUBfFIUJB+1biVBjk/XTJ8MHYHJGvgED7c8X7gszQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732145253; c=relaxed/relaxed;
	bh=+YSQEd3q7fygoQalTO+87OZtrZtg4dX9obtqWzCL/KM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HSr4CSeAXQkWbVUhbZKO4JpFK/OMlnVfDs1CmeEpdU9Lx5/q5eW/ldz1IrjPKyB87ODk7cl088ptrH42yY8AACQXdlqqS9nSRS7qTuldjRJs3iWlPdvGD2f1w7jn6weoGCLTZRQZvhsIu3IlQWPfXa8qfsDYHMN0bpdI62TknZ+OFOZk0HEs5JkeUvbIThwR3FGXZH/vt2/VHrsNKpGQ/sAuBEJoACrR5cvNSnh8cY1/K+waMIyLO3KO3h9zCjy2B3A/pC7HpNn8hlPv5E4stEN783r4Rb6ryHk9CBduC9ZfEOcacLk7PXm3MQwGiXwsKJCfet8YE1gh2bdI3+BwKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=VJhbAJqP; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=VJhbAJqP;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XtyFY3JNMz2xks
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2024 10:27:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1732145240;
	bh=+YSQEd3q7fygoQalTO+87OZtrZtg4dX9obtqWzCL/KM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VJhbAJqPJS66DtpTzp1tvz+e5z1F0ugaJQpwDjfq+tjqHAk5pLg5rLglTS4HdBCXZ
	 TUwLWJU8tCsrCaTqTkQhSBm44+7/b4fhdBwQNnAJMKh+u9vJzmRIflR4RnT4kSPbgX
	 eOIbj8pcwXFHtZQ71xQP1R2CfE44GegT5D7k+obvDDejaLFeXF7JXW8yPaNtiM3etY
	 GMHt2Th8OhLz/6Mx28vl47QP2MT086bir5VXhfC9GPaGJHx90rQB3hpXRc8pd+dhts
	 lXRzwzm3LCPLKkVGotf9fpUQqE6PsykAa3VIFISHBWU7tOgtzeQssh9O1zefiCzVqB
	 wNz/vRrjLLwQA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XtyFN1HgHz4wbr;
	Thu, 21 Nov 2024 10:27:19 +1100 (AEDT)
Date: Thu, 21 Nov 2024 10:27:21 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Naveen N Rao <naveen@kernel.org>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the ftrace tree
Message-ID: <20241121102721.63ed1c05@canb.auug.org.au>
In-Reply-To: <20241106140414.760b502c@canb.auug.org.au>
References: <20241106140414.760b502c@canb.auug.org.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/FIE00dymjcaY7df1kFG/KuE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

--Sig_/FIE00dymjcaY7df1kFG/KuE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 6 Nov 2024 14:04:14 +1100 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>=20
> After merging the ftrace tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>=20
> In file included from include/linux/ftrace.h:23,
>                  from include/linux/kvm_host.h:32,
>                  from arch/powerpc/include/asm/kvm_ppc.h:19,
>                  from arch/powerpc/include/asm/dbell.h:17,
>                  from arch/powerpc/kernel/asm-offsets.c:36:
> arch/powerpc/include/asm/ftrace.h: In function 'arch_ftrace_set_direct_ca=
ller':
> arch/powerpc/include/asm/ftrace.h:141:38: error: invalid use of undefined=
 type 'struct ftrace_regs'
>   141 |         struct pt_regs *regs =3D &fregs->regs;
>       |                                      ^~
>=20
> Caused by commit
>=20
>   7888af4166d4 ("ftrace: Make ftrace_regs abstract from direct use")
>=20
> interacting with commit
>=20
>   a52f6043a223 ("powerpc/ftrace: Add support for DYNAMIC_FTRACE_WITH_DIRE=
CT_CALLS")
>=20
> from the powerpc tree.
>=20
> I have applied the following merge fix patch for today.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 6 Nov 2024 13:33:53 +1100
> Subject: [PATCH] fix up for "ftrace: Make ftrace_regs abstract from direc=
t use"
>=20
> from the ftrace tree interacting with "powerpc/ftrace: Add support for
> DYNAMIC_FTRACE_WITH_DIRECT_CALLS" from the powerpc tree
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/powerpc/include/asm/ftrace.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm=
/ftrace.h
> index bb2c90997618..db481b336bca 100644
> --- a/arch/powerpc/include/asm/ftrace.h
> +++ b/arch/powerpc/include/asm/ftrace.h
> @@ -138,7 +138,7 @@ unsigned long ftrace_call_adjust(unsigned long addr);
>   */
>  static inline void arch_ftrace_set_direct_caller(struct ftrace_regs *fre=
gs, unsigned long addr)
>  {
> -	struct pt_regs *regs =3D &fregs->regs;
> +	struct pt_regs *regs =3D &arch_ftrace_regs(fregs)->regs;
> =20
>  	regs->orig_gpr3 =3D addr;
>  }

This patch is now needed when the powerpc tree is merged with Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/FIE00dymjcaY7df1kFG/KuE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmc+cFkACgkQAVBC80lX
0Gye0AgAodgxJy4R0rW9HUNlTNnWc+YqfTilmXVKX4MuAVUCW065K3YcOlCjYjs9
usP0rq+X3rVRs1+1xm5G6HiLoAe8E0na+THm20Uvm0MgZFcU8UdBSRz0bfyLUAB4
r7wJYESLQVeSuPB0VMEYb3loRzQzQCkrq78bGXBadHVklc6xr8aTbwgMqV9yqu4I
ac39x8taNOIHiIprW0nQssJqW0Z6Lqel32KnQmM1Yd8lWrQNr402h8qVs5SnCuaT
moMZDlR3s2kMli4wbzN+dKu9TQU9ECLk4a4XItUlfCyfQFH0gr0dH3Rj07tmOUO+
m0rvRpoP4PXzRGug4gaRiKOufMXU/Q==
=HWsg
-----END PGP SIGNATURE-----

--Sig_/FIE00dymjcaY7df1kFG/KuE--

