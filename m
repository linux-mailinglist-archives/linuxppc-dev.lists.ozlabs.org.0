Return-Path: <linuxppc-dev+bounces-2564-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E88649AF790
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2024 04:40:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZRpn3Kdbz2xYs;
	Fri, 25 Oct 2024 13:40:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729824033;
	cv=none; b=R1vkL+iZL2NM661NDxsrp6OvdtUxM4ufaJr0/Vpc2YJwiMpPTMyqWeniQNtdUPGpd2Z79Dz0NPuYt0ilVyxeVwulzZ6o4GQgNsb3aW5A+dig1cJYXV2aXlaeC4BXzJycqkWrfLq9zSNnxOLQf6MWOM2zicQx6yN9+rjttk4Sj4pOipTkPuqYp2orZ7JS0KByiARxpVfvqFbHnaogQD3kwK21BWrYrQZ8CKByRyX5EE7u/KvO878m8NBQxBtI6ODpzsPKQA7QhQ89832EVz8YKc2jrRDwLGGiZcAE+mMEiddVUd9FH9JSRboRoLXhTCXf4b7eGSRE+YZBXYn+6/mG1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729824033; c=relaxed/relaxed;
	bh=hRz6ek6f2mhiXmZ8EACPo8c6GZXKJ6CFOZ2CJK0Ot8c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ObNbOAmkJ43OtZN2yZ84zZEl1Ex3KTHQXHVuuGpEP+bLuv9hHAu8TRvVKKjGHKGm77BzqDrfG9lMVjzGro8IKYZeN16ZMJNWupaLReWRESJAJ8Was+b+Xs5GlvLWeYm0x4yh0M1oKvi5BZqDgbD8nTq9a5HyWLUf2DhOO92YfHjVa88wvn0loxMCKiBs1/0VIjsH2uOE8rEb/GHpqsp3qWnPwV7BkoQF63luz4qzJ23Ms/sLZO7u4RMOUL61Y9TT30Vqq98KhDBIRemPEedZP2447Z1AfP4tHisPHqi8zFYHdNeyo9HB/2yHXjfOGd5yLlDJ1darjfKfgLCmyiL70w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=jA9XIliP; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=jA9XIliP;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZRph6XhBz2xYk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2024 13:40:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1729824027;
	bh=hRz6ek6f2mhiXmZ8EACPo8c6GZXKJ6CFOZ2CJK0Ot8c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jA9XIliPS9NYc7b1XDiKTxyz0jxtXbbSCmM3C4UGmOuqn/eKlTvqJqHxPazXMQmNW
	 8swM8ZSQM0LhxSM+VmeRuPgN/HkK2xwCyf/ZZGXYtaDaPJT9GYHqqhrXA5kbjwwWOq
	 /DYMUF2fie8RIQOj5T0tuVZUP0Lp6l8clLVlnIklZyu/nOCIeEGL07vu+L3tODmXaX
	 g/AWliAXsrNpm0b9YdqWVHHrC1Eb817VbWqnNyJM3rRJ0YMxZoBPVA2jYln1xpekth
	 lltyI2i6pBTW+j5qUGTCnEBYgobrYGK6cPQ568NYGFygD354VDyqk2dQaAAKn6MpFW
	 Bn+afqtpfr9/Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XZRpd5yN9z4w2K;
	Fri, 25 Oct 2024 13:40:25 +1100 (AEDT)
Date: Fri, 25 Oct 2024 13:40:26 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: "Nysal Jan K.A." <nysal@linux.ibm.com>, Andrew Morton
 <akpm@linux-foundation.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, linuxppc-dev@lists.ozlabs.org, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Vlastimil Babka <vbabka@suse.cz>, Kent Overstreet
 <kent.overstreet@linux.dev>, Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Roman Gushchin <roman.gushchin@linux.dev>, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH] sched/membarrier: Fix redundant load of
 membarrier_state
Message-ID: <20241025134026.54ca0d57@canb.auug.org.au>
In-Reply-To: <87frolja8d.fsf@mail.lhotse>
References: <20241007053936.833392-1-nysal@linux.ibm.com>
	<87frolja8d.fsf@mail.lhotse>
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
Content-Type: multipart/signed; boundary="Sig_/xJN4qG0cvTfW=1E8/KUET+a";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

--Sig_/xJN4qG0cvTfW=1E8/KUET+a
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Fri, 25 Oct 2024 11:29:38 +1100 Michael Ellerman <mpe@ellerman.id.au> wr=
ote:
>
> > diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
> > index 07bb8d4181d7..042e60ab853a 100644
> > --- a/include/linux/sched/mm.h
> > +++ b/include/linux/sched/mm.h
> > @@ -540,6 +540,8 @@ enum {
> > =20
> >  static inline void membarrier_mm_sync_core_before_usermode(struct mm_s=
truct *mm)
> >  {
> > +	if (!IS_ENABLED(CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE))
> > +		return;
> >  	if (current->mm !=3D mm)
> >  		return;
> >  	if (likely(!(atomic_read(&mm->membarrier_state) & =20
>=20
> The other option would be to have a completely separate stub, eg:
>=20
>   #ifdef CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE
>   static inline void membarrier_mm_sync_core_before_usermode(struct mm_st=
ruct *mm)
>   {
>           if (current->mm !=3D mm)
>                   return;
>           if (likely(!(atomic_read(&mm->membarrier_state) &
>                        MEMBARRIER_STATE_PRIVATE_EXPEDITED_SYNC_CORE)))
>                   return;
>           sync_core_before_usermode();
>   }
>   #else
>   static inline void membarrier_mm_sync_core_before_usermode(struct mm_st=
ruct *mm) { }
>   #endif
>=20
> Not sure what folks prefer.

I case it matters, in general I prefer the first as there is less code
to get out of sync and all the code still gets parsed by the compiler
whether the CONFIG option is set or not.
--=20
Cheers,
Stephen Rothwell

--Sig_/xJN4qG0cvTfW=1E8/KUET+a
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcbBRoACgkQAVBC80lX
0GxfUwf/UNwbgf6ltUL5TSkUcQK+MHS1rAhtchOQGS8DB54i+pHE+xlMxRHVb7Vr
EBgHyKCS51DkgnpYstfbe5SohYx6cwHkewS4QsG3e4GCEoSskhtKPycCuhYvM5Am
dR4UzX/HZEZ8wPZytaqPFlnauT4lAnNBZ9yWK6uae/yXeTlWYL/pApuXpoeSknK7
vioVAYku96ksRs6afhzcv9C0TWPuv7G4+RaEp80B8FY6qtFLoaookb24jm5boKN0
5eM5t0Q1Oajk7Aq9kThjResSlk/0pdJz4QNaJ7mGJFQulHIuOJLwYn589kAK7z0G
ETGGHKj/fRXzVNNgXIPqNie9czn1lQ==
=62J7
-----END PGP SIGNATURE-----

--Sig_/xJN4qG0cvTfW=1E8/KUET+a--

