Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3159866C59
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 14:17:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lX3q1NQ7zDqt0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 22:17:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=cyphar.com
 (client-ip=80.241.60.215; helo=mx2.mailbox.org;
 envelope-from=cyphar@cyphar.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=cyphar.com
Received: from mx2.mailbox.org (mx2.mailbox.org [80.241.60.215])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lWz05GY0zDqvZ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jul 2019 22:13:00 +1000 (AEST)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mx2.mailbox.org (Postfix) with ESMTPS id F1641A117C;
 Fri, 12 Jul 2019 14:12:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by gerste.heinlein-support.de (gerste.heinlein-support.de [91.198.250.173])
 (amavisd-new, port 10030)
 with ESMTP id P6ek3O6D-xUo; Fri, 12 Jul 2019 14:12:48 +0200 (CEST)
Date: Fri, 12 Jul 2019 22:12:01 +1000
From: Aleksa Sarai <cyphar@cyphar.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH v9 04/10] namei: split out nd->dfd handling to
 dirfd_path_init
Message-ID: <20190712121201.ouhwqgeszfq44t33@yavin>
References: <20190706145737.5299-1-cyphar@cyphar.com>
 <20190706145737.5299-5-cyphar@cyphar.com>
 <20190712042050.GH17978@ZenIV.linux.org.uk>
 <20190712120743.mka3vl5t4zndc5wj@yavin>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="37fzaqczvbcmjfqh"
Content-Disposition: inline
In-Reply-To: <20190712120743.mka3vl5t4zndc5wj@yavin>
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
 Alexei Starovoitov <ast@kernel.org>, linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>, linux-kselftest@vger.kernel.org,
 sparclinux@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, Aleksa Sarai <asarai@suse.de>,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>,
 linuxppc-dev@lists.ozlabs.org, linux-m68k@lists.linux-m68k.org,
 Andy Lutomirski <luto@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 David Drysdale <drysdale@google.com>, Christian Brauner <christian@brauner.io>,
 "J. Bruce Fields" <bfields@fieldses.org>, linux-parisc@vger.kernel.org,
 linux-api@vger.kernel.org, Chanho Min <chanho.min@lge.com>,
 Jeff Layton <jlayton@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Eric Biederman <ebiederm@xmission.com>, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 containers@lists.linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--37fzaqczvbcmjfqh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2019-07-12, Aleksa Sarai <cyphar@cyphar.com> wrote:
> On 2019-07-12, Al Viro <viro@zeniv.linux.org.uk> wrote:
> > On Sun, Jul 07, 2019 at 12:57:31AM +1000, Aleksa Sarai wrote:
> > > Previously, path_init's handling of *at(dfd, ...) was only done once,
> > > but with LOOKUP_BENEATH (and LOOKUP_IN_ROOT) we have to parse the
> > > initial nd->path at different times (before or after absolute path
> > > handling) depending on whether we have been asked to scope resolution
> > > within a root.
> >=20
> > >  	if (*s =3D=3D '/') {
> > > -		set_root(nd);
> > > -		if (likely(!nd_jump_root(nd)))
> > > -			return s;
> > > -		return ERR_PTR(-ECHILD);
> >=20
> > > +		if (likely(!nd->root.mnt))
> > > +			set_root(nd);
> >=20
> > How can we get there with non-NULL nd->root.mnt, when LOOKUP_ROOT case
> > has been already handled by that point?
>=20
> Yup, you're completely right. I will remove the
>   if (!nd->root.mnt)
> in the next version.

Ah sorry, there is a reason for it -- later in the series the
LOOKUP_BENEATH case means that you might end up with a non-NULL
nd->root.mnt. If you want, I can move the addition of the conditional to
later in the series (it was easier to split the patch by-hunk back when
you originally asked me to split out dirfd_path_init()).

--=20
Aleksa Sarai
Senior Software Engineer (Containers)
SUSE Linux GmbH
<https://www.cyphar.com/>

--37fzaqczvbcmjfqh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQSxZm6dtfE8gxLLfYqdlLljIbnQEgUCXSh5DgAKCRCdlLljIbnQ
EktsAQC+xy1gwgzkK07JhvJgn8Q1pT79AOQ14p3p2Zp9thYafQD9FEgBMo7bE+TU
IjLN9tnpuJF+ybsPFaA/VNK4FHH0igw=
=ZC2p
-----END PGP SIGNATURE-----

--37fzaqczvbcmjfqh--
