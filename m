Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC3120A8D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 17:01:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454ZPR6w8wzDqf5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2019 01:01:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=cyphar.com
 (client-ip=80.241.60.212; helo=mx1.mailbox.org;
 envelope-from=cyphar@cyphar.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=cyphar.com
Received: from mx1.mailbox.org (mx1.mailbox.org [80.241.60.212])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454ZJ25PlnzDqcT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2019 00:56:34 +1000 (AEST)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx1.mailbox.org (Postfix) with ESMTPS id 5BDF94CB10;
 Thu, 16 May 2019 16:56:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
 by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de
 [80.241.56.115]) (amavisd-new, port 10030)
 with ESMTP id 8d4PMuRmJICT; Thu, 16 May 2019 16:56:27 +0200 (CEST)
Date: Fri, 17 May 2019 00:56:07 +1000
From: Aleksa Sarai <cyphar@cyphar.com>
To: Oleg Nesterov <oleg@redhat.com>
Subject: Re: [PATCH v1 1/2] pid: add pidfd_open()
Message-ID: <20190516145607.j43xyj26k6l5vmbd@yavin>
References: <20190516135944.7205-1-christian@brauner.io>
 <20190516142659.GB22564@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="asldj7bns6ry6jfo"
Content-Disposition: inline
In-Reply-To: <20190516142659.GB22564@redhat.com>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-mips@vger.kernel.org, dhowells@redhat.com, joel@joelfernandes.org,
 linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-api@vger.kernel.org, elena.reshetova@intel.com,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, dancol@google.com,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Christian Brauner <christian@brauner.io>, serge@hallyn.com,
 linux-xtensa@linux-xtensa.org, keescook@chromium.org, arnd@arndb.de,
 jannh@google.com, linux-m68k@lists.linux-m68k.org, viro@zeniv.linux.org.uk,
 luto@kernel.org, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-parisc@vger.kernel.org, torvalds@linux-foundation.org,
 linux-kernel@vger.kernel.org, luto@amacapital.net, ebiederm@xmission.com,
 linux-alpha@vger.kernel.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--asldj7bns6ry6jfo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019-05-16, Oleg Nesterov <oleg@redhat.com> wrote:
> On 05/16, Christian Brauner wrote:
> >
> > With the introduction of pidfds through CLONE_PIDFD it is possible to
> > created pidfds at process creation time.
>=20
> Now I am wondering why do we need CLONE_PIDFD, you can just do
>=20
> 	pid =3D fork();
> 	pidfd_open(pid);

While the race window would be exceptionally short, there is the
possibility that the child will die and their pid will be recycled
before you do pidfd_open(). CLONE_PIDFD removes the race completely.

--=20
Aleksa Sarai
Senior Software Engineer (Containers)
SUSE Linux GmbH
<https://www.cyphar.com/>

--asldj7bns6ry6jfo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEb6Gz4/mhjNy+aiz1Snvnv3Dem58FAlzdegcACgkQSnvnv3De
m59otQ//cKLIBYu0NRjFiTL/Sy05MLpjdwxWtxgO+bUeTNYJNghTPgEJw+c+25c7
tNoebC+JCGcAwO8ACNKnZDd3AuaNys1ZrFwNP7s9IcfOhPEHbcgD2OthKJUE5zZJ
bXypZRJF+JWJYvn8yBVWpV0IKZwytCnY/yDelTQgcZnKQ2fnmPLEIDtYD3zAuab+
IgkiYZ/oDsrgUIjkgiYs7gHSqU/cZEDI+dxAZawR2xuSOg7nLUlZ9mJmFWiUYwfL
55w4joeTcTAlRUDEBzsJFemknqCEo+5qrX0C2qoTmZvdiaVqMQKmGiqYbxdTRC/o
6lH2q4JQE2aYetbZ9Q9gl4fnFsbbAZBADAuAd8xV0rFWbCB+gkTdZS4G3MZ9baAm
F0o5HofG0TvkzG5K81aRWlipjvnngapLm/xnSCrfe3rIi9Kw+u1+9jMr+1/BTN/5
dsHnpAqWPt81mJdlzOSqhCfG7aLmJ/AQKvrC8h2JvtKema98vpK7hJhCbAUi+6lU
1V9iCvnERBIOlmzkE67ZGtKRPXmPSKIxKgbvOhc1f9DAYQID20S+SNtRJcBpSwhH
+YDqmefCAfqC6+JU/ZySLZrkuNOmoGuHP+T3ku0JyGn4xUayM1ZtKece3ILcafoi
hRTQy5y2ax/fJ2EPN7o5qc8Oe8DMInckJzKsOvbMe43FldNhKzA=
=SNKZ
-----END PGP SIGNATURE-----

--asldj7bns6ry6jfo--
