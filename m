Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0A68AF90F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Apr 2024 23:41:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=hV+LMIhL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VPFtD2j4mz3vkl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Apr 2024 07:41:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=hV+LMIhL;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VPFsR4RxHz3dLN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Apr 2024 07:40:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1713908427;
	bh=wHYxct6asNImlbeupPEFHpTTxlZt2liy9+CRSPwAYVg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hV+LMIhLeShhLbbuSeOQACQUCwvMaCJajbPMaBmdA1nt+3efGfvv5XCRRWY8QMgMH
	 h/z9n6gMxzzNDZk+vrohsItjtT7IdFrtiItiPC4IcPOSVZc6jjCalCsQaBei0LSK9Z
	 6EsFkhmhhCIRVO5HUYy410IA1L/+j4HxWmloflDGyobq4t6fKkPuzHU9rEO5H2rset
	 dffwhCAjvSs5MXtDNrt9jsUyaFa11FtPz4Ck2IGwisQx2GLust2FpoThSHcYuQX0N8
	 FvC+wALA+kYwqHw9gL+JbvVpQPdaXVS1hhX/Cvc53h6ClgrTN94djyP+NRM/J7s+iT
	 8/j9cFPP+S9gg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VPFsQ4vX0z4wc5;
	Wed, 24 Apr 2024 07:40:26 +1000 (AEST)
Date: Wed, 24 Apr 2024 07:40:23 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: Please add powerpc topic/kdump-hotplug branch to linux-next
Message-ID: <20240424074023.43932cca@canb.auug.org.au>
In-Reply-To: <87bk60ji79.fsf@mail.lhotse>
References: <87bk60ji79.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ATeAZrrv2EJbPtCU7.6+XEM";
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
Cc: kexec@lists.infradead.org, Linux Next Mailing List <linux-next@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bhe@redhat.com, sourabhjain@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/ATeAZrrv2EJbPtCU7.6+XEM
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Tue, 23 Apr 2024 23:56:42 +1000 Michael Ellerman <mpe@ellerman.id.au> wr=
ote:
>
\> Can you please add the topic/kdump-hotplug branch of the powerpc tree to
> linux-next. It contains a series that touches generic kexec code as well
> as x86 and powerpc code.
>=20
> The hope is to have to get it merged for v6.10, so it should go along
> with the powerpc next branch in the merge order.
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/log/?h=
=3Dtopic/kdump-hotplug

Added from today.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--=20
Cheers,
Stephen Rothwell

--Sig_/ATeAZrrv2EJbPtCU7.6+XEM
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmYoKscACgkQAVBC80lX
0Gyc/QgAoeBb/nq8jS4FDhTR1whXCAYnYtDtBfITZ+rhVw+j8iIMfMNpdjWIuHKp
EmcHHvC6tkE3aFbNIALtDH3oHVmGD9GNJBnkWvJxefymoLOGxaNH44ld2o+lX3WJ
chIyEnZzqcf7hO+CdtobArpLdPkrfRX7FU+yIsNCCdJYYhzPcdUvnvBE7ZJgZHGB
sgrCoMjOEMDfQO3ZYUw7AYbZiZt5imEq/UH0pIf6CK5qXfnrtc9iXA0GoA1/Pg14
aF+B1RX24/4Tk+lkvnOsT/YGk7bFzhodDuQvnMUb5Ht13MbyQZQj4749q2BUg5L8
DVcqvB/sysHxdGcFJjM0dQKNjpf3Zw==
=IxtL
-----END PGP SIGNATURE-----

--Sig_/ATeAZrrv2EJbPtCU7.6+XEM--
