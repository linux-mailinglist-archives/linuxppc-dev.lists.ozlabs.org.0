Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F15D940A319
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 04:09:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7mx773cMz2ynN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 12:08:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=fRbdcp8K;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canb.auug.org.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=sfr@canb.auug.org.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=fRbdcp8K; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7mwV1fzhz2yHb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 12:08:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1631585300;
 bh=YX/Srh4S60PRPjnNxVBWCQQin9P6BFcBIH7YYSh4zVI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fRbdcp8KjhHQjz6XV6ffHl4hFaRkfbq3b8P+ewZZy9eDr9ltDRq+rdkw2Dqm9MX2u
 z2ekM5vxIey7xaaMq8mprUkUvI/XuEmvuqQAl0FpnhPGLzkye++J+YCUgY6iwDeeZP
 svVgygjo5N0l2GquqZuMx22jbPLvKh9OgwSZHdIdLIoq5WW/zmq+SXjxlLzzu/Qhdu
 2Cd03JvoHyIZee+cwJT8BhYtp+BTSCNXTtufIH8/41xyim+XU4ztMlUSVXtMLhNkMq
 ZCkmu2XQnqTcalfcU020DdYfFCx86GcTxL6GYCekUl9tiAKqQ4zObEH/B9RjYlyT5V
 fMKPpWVFHyNIQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4H7mwM64q1z9sR4;
 Tue, 14 Sep 2021 12:08:19 +1000 (AEST)
Date: Tue, 14 Sep 2021 12:08:18 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the origin tree
Message-ID: <20210914120818.4a102b46@canb.auug.org.au>
In-Reply-To: <CAHk-=whyWUdJDeOBN1hRWYSkQkvzYiQ5RbSW5rJjExgnbSNX9Q@mail.gmail.com>
References: <20210914100853.3f502bc9@canb.auug.org.au>
 <CAHk-=whOv-LZKxBqQr8yzmhi7sN4zoFG7t8ALNx+2XFhXjGTpA@mail.gmail.com>
 <CAHk-=whGuEkYmQcJx8WfZ7MFhbKGJDcA6NUZWtrnM6Y6xFqATw@mail.gmail.com>
 <20210914105359.5c651d55@canb.auug.org.au>
 <CAHk-=whyWUdJDeOBN1hRWYSkQkvzYiQ5RbSW5rJjExgnbSNX9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1jekrzk1d8gX=b60zYOtwUN";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/1jekrzk1d8gX=b60zYOtwUN
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Linus,

On Mon, 13 Sep 2021 18:29:26 -0700 Linus Torvalds <torvalds@linux-foundatio=
n.org> wrote:
>
> On Mon, Sep 13, 2021 at 5:58 PM Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
> >
> > > I have no idea why it then complains about removal of the GCC4 macros.
> >
> > Me neither :-(
>=20
> Ooh.
>=20
> So I'm looking at gcc sources, just to see if "maybe this thing is
> somehow conditional".
>=20
> And bingo.
>=20
> In cpp_init_special_builtins(), gcc does
>=20
>       if (b->value =3D=3D BT_HAS_ATTRIBUTE
>           && (CPP_OPTION (pfile, lang) =3D=3D CLK_ASM
>               || pfile->cb.has_attribute =3D=3D NULL))
>         continue;
>=20
> which basically says that if we're pre-processing an ASM file, the
> magical pre-processor symbol for __has_attribute is not defined.
>=20
> I'm not sure what that 'pfile->cb.has_attribute =3D=3D NULL' thing means,
> but the libcpp/ChangeLog file also mentions this:
>=20
>         (cpp_init_special_builtins): Don't initialize __has_attribute
>         or __has_cpp_attribute if CLK_ASM or pfile->cb.has_attribute is N=
ULL.
>=20
> So this is a very very special magical thing: if building an *.S file,
> __has_attribute magically goes away.
>=20
> And sure enough, that's exactly what is going on. It's during that
> build of arch/powerpc/boot/crt0.S, and the reason this hits on powerpc
> is that in arch/powerpc/boot/Makefile we have
>=20
>          -include $(srctree)/include/linux/compiler_attributes.h
>=20
> as part of BOOTCFLAGS, and then it does
>=20
>         BOOTAFLAGS      :=3D -D__ASSEMBLY__ $(BOOTCFLAGS) -nostdinc
>=20
> to also include that header file when building ASM files.
>=20
> And our old GCC4 code silently hid this all, and made it work, because
> for a *.S file  you'd then (completely illogically) get those fake
> gcc-4 attribute macros.
>=20
> Now, do I know *why* that ppc Makefile it does that? No. Neither do I
> know why the gcc people decided to just make ASM preprocessor so
> special.
>=20
> But at least I understand how the odd error happens.

Its good to know there is a reason :-)

> This was too damn subtle. When you have to go read the compiler
> sources to figure things like this out, you know you are too deep.
>=20
> The fix should be pretty simple: remove almost all of BOOTCFLAGS from
> BOOTAFLAGS.
>=20
> But sadly, "almost all" isn't "all". There's the include path stuff,
> there's the ABI and endianness, and there's the bit size ones.
>=20
> So I think the fix is either
>=20
>  (a) remove that
>=20
>          -include $(srctree)/include/linux/compiler_attributes.h
>=20
>      thing entirely, and add it as required to the C files.
>=20
> OR
>=20
>  (b) something like this ENTIRELY UNTESTED ATTACHED patch
>=20
> I will leave it to the powerpc people to make the right choice.

That patch works for me - for the ppc64_defconfig build at least.

--=20
Cheers,
Stephen Rothwell

--Sig_/1jekrzk1d8gX=b60zYOtwUN
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmFABBIACgkQAVBC80lX
0Gw36gf5Abis6eF6S1lBVUcZ8TDSTmH/OH4r6cgqJa1KHJivgzxwa3ad/cR0UI2p
YgyVR6N/a0ON8I5LYzeFicj2JlsNtFn1qUEiw2/xtm8J+747KFC2VSHYObGkALM5
x7LaA+3YfWfyHkSOsWjeTB/L1WSJwby+TL7HvGVcoti/pJxnbqoR0l1xcpoQTKd2
RtR+YkmWST5uTAt5FRp+TwSo+hS7iXem03VWQtTk80/aNQJ/zJ6ttBsvXxSo2zdj
Bo5fkZfpsTweAk1OtyFSJ4GklYzRErZfD6VCV00j4imKndsyiLHdbMAx13RUaVv/
BpR+2toJg0tATicY/qPrcIixhomeLg==
=ccEB
-----END PGP SIGNATURE-----

--Sig_/1jekrzk1d8gX=b60zYOtwUN--
