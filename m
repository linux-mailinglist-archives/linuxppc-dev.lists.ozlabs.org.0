Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 890F994736D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Aug 2024 04:42:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=nRt84xla;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wcghq3cx2z3cdZ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Aug 2024 12:42:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=nRt84xla;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wcgh30KFFz3c5W
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Aug 2024 12:42:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1722825725;
	bh=aN1mQ5h0B1gUulDF7kud9hrLZTpQ24E1dfEgqPUNzfQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nRt84xlaxmukaZU2dg+E+mZ5AHbCK/cvxU6ItIe0y5M9GPKuFAu8f1m7e5rKIdCvC
	 1sZ1Dv9PIlh5KGqWZEiLH7UEvZuMHHDG3XtDxcH/7LGJ/vODqnid6+EHwVRMPEYPot
	 IAixGjqK91bPRbJQcsz97ANeVsQgxw35pM0hLKg9yk8A0Z5+p4AWiOeAsCd2KD1SLp
	 rFndiJw8TuqROgid1Zfiv8efKLgwU5ZOOo/jxbrc9KQL18w2KiNjE0yYVCpIxUiRAl
	 zFHX/u53aGFoBtgRvm0AiBrAtDfl/QYvOVeDo3gqByjWVt97JENivfQHzMKCj+vMxu
	 O4SGnSe/XhZJg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wcggx4jFQz4wbR;
	Mon,  5 Aug 2024 12:42:05 +1000 (AEST)
Date: Mon, 5 Aug 2024 12:42:04 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: List change - munging for From addresses
Message-ID: <20240805124204.49ed65df@canb.auug.org.au>
In-Reply-To: <20240802-agile-manipulative-dog-df4487@lemur>
References: <20240802130347.383a1b49@canb.auug.org.au>
	<20240802-agile-manipulative-dog-df4487@lemur>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EvTj260_PWFj8dPwMwnxQjz";
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
Cc: ppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/EvTj260_PWFj8dPwMwnxQjz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Konstantin,

On Fri, 2 Aug 2024 11:54:06 -0400 Konstantin Ryabitsev <konstantin@linuxfou=
ndation.org> wrote:
>
> Not really, for two reasons:
>=20
> - X-Original-From is widely used, but isn't really a standard header.

In our case, Mailman puts the original address in the Reply-To header.

> - From-munging breaks end-to-end attestation, so we consider x-original-f=
rom
>   and similar headers a potential impersonation attempt and ignore them.

OK.

> I would generally say that From-munging isn't a great option for any list=
 that
> receives patches. A much better approach is to just not modify the message
> headers or message body. This should be possible with mailman.

Unfortunately, I have not found a way to ensure Mailman (v2, at least)
will not modify messages in all cases e.g. in some circumstances it
will modify the To/Cc list.

So, an alternative for us (though considerable more work) is to change
mailing list software.  Mailmanv3 would be an option, but seems overly
complex.  I see vger.kernel.org is now using mlmmj - is that a
reasonable option for us (i.e. is it able to not modify messages but
still have enough features)?  If so any hints about migrating? ;-)
--=20
Cheers,
Stephen Rothwell

--Sig_/EvTj260_PWFj8dPwMwnxQjz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmawO/wACgkQAVBC80lX
0GyA6wf/dRijFPGOHUW+ZzoTiZk1i6DcFGD8rnbah4pz+OGtF5bP9h1OL+r3DOVv
xTdzAES2s0Xq6RKz+jtqXO+2JNpKAn0eQ2cMsIVok/EFcEMrWcrt8OAKO4kaSi3u
fesdWkdW5f65y8HMUXHKNHYDSuPvZ4nNdheZt5LOoYLX726ZYdZ1xdIYaP5ocn5g
jykBxxAHpbek5vHnmpSjQ7Wmt/V++Q3NzFxtXCS796p8C6G2BZUQrOwcxbcDvoHO
El7vGOaE/U+Kq14CjffIZ0T6fTnKOaNv7HgYGOIQxj0ti+/Kfs3nq6DxA+vTj+CV
PKM2Foi5SQ9zOO3ARUrFO1gViESteg==
=l//p
-----END PGP SIGNATURE-----

--Sig_/EvTj260_PWFj8dPwMwnxQjz--
