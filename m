Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDB311E783
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 17:04:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ZFq80hkxzDrGq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Dec 2019 03:04:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=decadent.org.uk (client-ip=88.96.1.126;
 helo=shadbolt.e.decadent.org.uk; envelope-from=ben@decadent.org.uk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=decadent.org.uk
X-Greylist: delayed 1352 seconds by postgrey-1.36 at bilbo;
 Sat, 14 Dec 2019 03:02:29 AEDT
Received: from shadbolt.e.decadent.org.uk (shadbolt.e.decadent.org.uk
 [88.96.1.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ZFmj5JHMzDrGp
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Dec 2019 03:02:29 +1100 (AEDT)
Received: from [167.98.27.226] (helo=deadeye)
 by shadbolt.decadent.org.uk with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <ben@decadent.org.uk>)
 id 1ifn2Y-0001FZ-DR; Fri, 13 Dec 2019 15:39:38 +0000
Received: from ben by deadeye with local (Exim 4.93-RC7)
 (envelope-from <ben@decadent.org.uk>)
 id 1ifn2X-00056v-9m; Fri, 13 Dec 2019 15:39:37 +0000
Message-ID: <784d8f924612b91310baca25f2b0acc7ba78b83b.camel@decadent.org.uk>
Subject: Re: [PATCH] libbpf: fix readelf output parsing on powerpc with
 recent binutils
From: Ben Hutchings <ben@decadent.org.uk>
To: Michael Ellerman <mpe@ellerman.id.au>, Thadeu Lima de Souza Cascardo
 <cascardo@canonical.com>, Justin Forbes <jmforbes@linuxtx.org>
Date: Fri, 13 Dec 2019 15:39:32 +0000
In-Reply-To: <87a77ypdno.fsf@mpe.ellerman.id.au>
References: <20191201195728.4161537-1-aurelien@aurel32.net>
 <87zhgbe0ix.fsf@mpe.ellerman.id.au>
 <20191202093752.GA1535@localhost.localdomain>
 <CAFxkdAqg6RaGbRrNN3e_nHfHFR-xxzZgjhi5AnppTxxwdg0VyQ@mail.gmail.com>
 <20191210222553.GA4580@calabresa>
 <CAFxkdAp6Up0qSyp0sH0O1yD+5W3LvY-+-iniBrorcz2pMV+y-g@mail.gmail.com>
 <20191211160133.GB4580@calabresa> <87a77ypdno.fsf@mpe.ellerman.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-XTuTpKbXj3nCdOipqGDS"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 167.98.27.226
X-SA-Exim-Mail-From: ben@decadent.org.uk
X-SA-Exim-Scanned: No (on shadbolt.decadent.org.uk);
 SAEximRunCond expanded to false
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
Cc: Song Liu <songliubraving@fb.com>, Nick Clifton <nickc@redhat.com>,
 Daniel Borkmann <daniel@iogearbox.net>, "open
 list:BPF \(Safe dynamic programs and tools\)" <netdev@vger.kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Alexei Starovoitov <ast@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Yonghong Song <yhs@fb.com>,
 "open list:BPF \(Safe dynamic programs and
 tools\)" <bpf@vger.kernel.org>, Andrii Nakryiko <andriin@fb.com>,
 Martin KaFai Lau <kafai@fb.com>, Aurelien Jarno <aurelien@aurel32.net>,
 debian-kernel@lists.debian.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-XTuTpKbXj3nCdOipqGDS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-12-12 at 11:53 +1100, Michael Ellerman wrote:
> Thadeu Lima de Souza Cascardo <cascardo@canonical.com> writes:
[...]
> > This is a patch on binutils carried by Fedora:
> >=20
> > https://src.fedoraproject.org/rpms/binutils/c/b8265c46f7ddae23a792ee830=
6fbaaeacba83bf8
> >=20
> > " b8265c Have readelf display extra symbol information at the end of th=
e line. "
> >=20
> > It has the following comment:
> >=20
> > # FIXME:    The proper fix would be to update the scripts that are expe=
cting
> > #           a fixed output from readelf.  But it seems that some of the=
m are
> > #           no longer being maintained.
> >=20
> > This commit is from 2017, had it been on binutils upstream, maybe the s=
ituation
> > right now would be different.
>=20
> Bleeping bleep.
>=20
> Looks like it was actually ruby that was the original problem:
>=20
>   https://bugzilla.redhat.com/show_bug.cgi?id=3D1479302
>=20
>=20
> Why it wasn't hacked around in the ruby package I don't know, doing it in
> the distro binutils package is not ideal.

That wouldn't help people building Ruby from upstream.

Any tool generating tabular output like this should add new fields at
the end (or show them only if requested), since there are bound to be
scripts that parse the output like this.  So I think Fedora's change to
readelf was reasonable, but should have been pushed upstream as soon as
possible.

Now everyone is going to have to deal with both formats.

Ben.

--=20
Ben Hutchings
Horngren's Observation:
              Among economists, the real world is often a special case.



--=-XTuTpKbXj3nCdOipqGDS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAl3zsLQACgkQ57/I7JWG
EQn2Yg//TXyohEOZzCVyllfhvYlZubQmABin7AvKKCrohI86PUkKZzydMPKW7wjF
KSi+xCi62Q52OwskMvIaWjiBzvhijZaFWHB8EPGqRMeJtnbjjwGTTta0ZzPYBBEa
ngKWvU50Vjqlt8uF7qNXQk3M/mJloOXmqhjPjwuX2Yqa/aWz20NAzV2WQQ9OzNMn
8HQzX5jHN76CWmMwkqblKqO0yRpb8Cw08bpn42zkVYlIZapxAeBIY4DQP2A+TWPs
3ElgHxlL3Rgg4qvYqnhIzD7Jr/jOCFIcdD/j5SaNMJV6HzLK5/vUQs0NEA0y6M7I
91T2k3hhd6pJPpCn4eP0Vc2JQWZQl4P+x0FMlYiXfBiOjdy2cOqDiez0g3i3SqyQ
6i29+SUSriP5QvPHK8Pg2L4MRuelBoNyuP55IZWonDYpQx1qDoI8ycXgEtPpuP1s
B41ClX9UNrozPrEuDEcC7tbw+ak+xsJy+PqEF9RYnIJcJ8bJRI2YTR1h8ysWZyOI
13zEPyAZG2b34rBmUaqA2fBFTG98qPuEV6Amcq4rpdqsdbzTkD1PYCpEtXnqiok/
C0o/6Wsey1BpfcXsag7xX824BvJkgsWzQnFJ1cto4zmsHxUyLvLh+X5VXilsRgTd
ongG67DAwcznlANn9XjPGeN3qjDErgSWwXPdUecrKm0+xgMNPo0=
=ttgq
-----END PGP SIGNATURE-----

--=-XTuTpKbXj3nCdOipqGDS--
