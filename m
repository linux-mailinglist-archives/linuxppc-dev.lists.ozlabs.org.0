Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8587F1EC70B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 04:03:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cBzH6ltWzDqXY
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jun 2020 12:03:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cBxN6lfMzDqDS
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jun 2020 12:02:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=ax87zDA2; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49cBxM6yJFz9sRR;
 Wed,  3 Jun 2020 12:02:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1591149736;
 bh=vhVIoWfRSqSXFrzE3g6qmYx7HtBU/h0jRCqrvADViUo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ax87zDA2OMU9bhGi7CX2giGqfJNRR4ffm4/mCm+/r4zM4WTK4ZIlQQVm4drgGDQV+
 KbJKZ47lVS/axmNhj/9uGtK+wp3RTDRY/YjZ+wpMgWVm8votFb3NqT4HooByZ82Qhv
 72aJfQc7Ste0xwseybcO/7Xrh1/l8Nm6KOeq0j6CzD4CLs3a1jHOUaI2UJtga6Jwdk
 z7d6kSY/KndFdKNmOIauZI2wC6qSYT09z/rew8HKknjKs0HcbV/9pav0Es5Us8lDUm
 92dHV8oQgaM0Ii3zbCld6TmJDPHF16/6BtLs3nMXpYcfsA7KeU5D7PvgNbRMi0K8CZ
 dt6PFgEQd2NLg==
Date: Wed, 3 Jun 2020 12:02:15 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: linux-next: manual merge of the rcu tree with the powerpc tree
Message-ID: <20200603120215.758ec1f0@canb.auug.org.au>
In-Reply-To: <20200519172316.3b37cbae@canb.auug.org.au>
References: <20200519172316.3b37cbae@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/re/4mt4BnHhc__uwjuL5lI1";
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
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/re/4mt4BnHhc__uwjuL5lI1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 19 May 2020 17:23:16 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Hi all,
>=20
> Today's linux-next merge of the rcu tree got a conflict in:
>=20
>   arch/powerpc/kernel/traps.c
>=20
> between commit:
>=20
>   116ac378bb3f ("powerpc/64s: machine check interrupt update NMI accounti=
ng")
>=20
> from the powerpc tree and commit:
>=20
>   187416eeb388 ("hardirq/nmi: Allow nested nmi_enter()")
>=20
> from the rcu tree.

This is now a conflict between commit

  69ea03b56ed2 ("hardirq/nmi: Allow nested nmi_enter()")

=46rom Linus tree and the above powerpc tree commit.
--=20
Cheers,
Stephen Rothwell

--Sig_/re/4mt4BnHhc__uwjuL5lI1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7XBKcACgkQAVBC80lX
0Gz/Wgf+L+rFqD4u+L0Kv5bqDMacIs7hXXsLQI+vN7E4C2cx1LcZiI9aWrRDpUTK
uUO5eVIwczW5tvq91C04sT7F6jrApts2PS2hbCwqPM+ZjWTI4SNO5yHopOrWKzUW
RfV7+lCLfE+SwDlA+ZbzJotktvIL6gpUEBRpiMcSe7ka3iAiarcywWzgo/vhQ4J9
I3oQUZiMblqFr653oSSYxwb7omI2TU3aAgV8Aheh8OmZktW90UfyYhJjoh6DYulQ
r+qCwBkQ+MpYcRTOklfrOt9N96sJy1WuNP6bCw34/jd8L/d44loxB4YLO18igyAE
biuCnndxOIm1utVMy+mR6g83z8twsA==
=sOc/
-----END PGP SIGNATURE-----

--Sig_/re/4mt4BnHhc__uwjuL5lI1--
