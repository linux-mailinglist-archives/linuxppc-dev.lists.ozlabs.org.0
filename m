Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4FC228958
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 21:41:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BB8936mpRzDqgL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 05:41:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=bmeneg@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=AC9K9Ghw; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=AC9K9Ghw; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BB86J4XPFzDqCY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 05:38:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595360318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W/5FQTzNceZ8+x82aqOM3eIUsHFNM5pTOLDBmqIIiW0=;
 b=AC9K9GhwSEdL9yG8uPlKHRZOxTPAdHoBB1nHOiUwJKxcOv4GTfMAuVDQ/53fXGz+BP4f1c
 rHk6/zV/X4WPqQmgwLhWCbAmjO4Q0o07/ZBzPmhPRHufNnYv85SCwPyHtPz0qbWfvKW17r
 lIQsN02626xMxvJ/N20HT5Rr6hCXpxo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595360318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W/5FQTzNceZ8+x82aqOM3eIUsHFNM5pTOLDBmqIIiW0=;
 b=AC9K9GhwSEdL9yG8uPlKHRZOxTPAdHoBB1nHOiUwJKxcOv4GTfMAuVDQ/53fXGz+BP4f1c
 rHk6/zV/X4WPqQmgwLhWCbAmjO4Q0o07/ZBzPmhPRHufNnYv85SCwPyHtPz0qbWfvKW17r
 lIQsN02626xMxvJ/N20HT5Rr6hCXpxo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-KyfIS5FeMT-drxH4SXRg7A-1; Tue, 21 Jul 2020 15:38:33 -0400
X-MC-Unique: KyfIS5FeMT-drxH4SXRg7A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D224680BCAE;
 Tue, 21 Jul 2020 19:38:31 +0000 (UTC)
Received: from localhost (ovpn-116-10.gru2.redhat.com [10.97.116.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B898756BE;
 Tue, 21 Jul 2020 19:38:31 +0000 (UTC)
Date: Tue, 21 Jul 2020 16:38:30 -0300
From: Bruno Meneguele <bmeneg@redhat.com>
To: Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [PATCH v6] ima: move APPRAISE_BOOTPARAM dependency on
 ARCH_POLICY to runtime
Message-ID: <20200721193830.GE2716@glitch>
References: <20200713164830.101165-1-bmeneg@redhat.com>
 <d337cbba-e996-e898-1e75-9f142d480e5e@linux.vnet.ibm.com>
 <1595257015.5055.8.camel@linux.ibm.com>
 <20200720153841.GG10323@glitch>
 <1595352376.5311.8.camel@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <1595352376.5311.8.camel@linux.ibm.com>
X-PGP-Key: http://keys.gnupg.net/pks/lookup?op=get&search=0x3823031E4660608D
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="k3qmt+ucFURmlhDS"
Content-Disposition: inline
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
Cc: linux-s390@vger.kernel.org, Nayna <nayna@linux.vnet.ibm.com>,
 erichte@linux.ibm.com, nayna@linux.ibm.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--k3qmt+ucFURmlhDS
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2020 at 01:26:16PM -0400, Mimi Zohar wrote:
> On Mon, 2020-07-20 at 12:38 -0300, Bruno Meneguele wrote:
> > On Mon, Jul 20, 2020 at 10:56:55AM -0400, Mimi Zohar wrote:
> > > On Mon, 2020-07-20 at 10:40 -0400, Nayna wrote:
> > > > On 7/13/20 12:48 PM, Bruno Meneguele wrote:
> > > > > The IMA_APPRAISE_BOOTPARAM config allows enabling different "ima_=
appraise=3D"
> > > > > modes - log, fix, enforce - at run time, but not when IMA archite=
cture
> > > > > specific policies are enabled. =A0This prevents properly labeling=
 the
> > > > > filesystem on systems where secure boot is supported, but not ena=
bled on the
> > > > > platform. =A0Only when secure boot is actually enabled should the=
se IMA
> > > > > appraise modes be disabled.
> > > > >
> > > > > This patch removes the compile time dependency and makes it a run=
time
> > > > > decision, based on the secure boot state of that platform.
> > > > >
> > > > > Test results as follows:
> > > > >
> > > > > -> x86-64 with secure boot enabled
> > > > >
> > > > > [    0.015637] Kernel command line: <...> ima_policy=3Dappraise_t=
cb ima_appraise=3Dfix
> > > > > [    0.015668] ima: Secure boot enabled: ignoring ima_appraise=3D=
fix boot parameter option
> > > > >
> > >=20
> > > Is it common to have two colons in the same line? =A0Is the colon bei=
ng
> > > used as a delimiter when parsing the kernel logs? =A0Should the secon=
d
> > > colon be replaced with a hyphen? =A0(No need to repost. =A0I'll fix i=
t
> > > up.)
> > > =A0
> >=20
> > AFAICS it has been used without any limitations, e.g:
> >=20
> > PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
> > clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns=
: 133484873504 ns
> > microcode: CPU0: patch_level=3D0x08701013
> > Lockdown: modprobe: unsigned module loading is restricted; see man kern=
el_lockdown.7
> > ...
> >=20
> > I'd say we're fine using it.
>=20
> Ok. =A0FYI, it's now in next-integrity.
>=20
> Mimi
>=20

Thanks Mimi.

--=20
bmeneg=20
PGP Key: http://bmeneg.com/pubkey.txt

--k3qmt+ucFURmlhDS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEdWo6nTbnZdbDmXutYdRkFR+RokMFAl8XRDUACgkQYdRkFR+R
okOv3QgAidrD9B9w904OYqq3pVlZyT8GUdDpbIr0jliOvPKjHKVooNHQemfJhGU+
HzoVi2pG8ARlFC4elJBAwVXR8S9KWCT/xNL9C6N0VMg8FDik0TjmMJ0DRwh4s3oZ
oriQmx4vxaS4eNEfh5gBJrG4EwJdH2rCrbWtc4ojOzEhXE06xCsK9SN9PHy4x2Gp
zMleiQuD/YVOQK5+A3DII5/BQquL5r5zcwmZ82jho8dZGo5Ot/wc0xq6W5dSLdJw
7EScY58JI/z7H0JbxQuUG3qVmQNa4pVVx9v75cyoTwn5UeZ7XtOvshiO0pRY7M3z
8xueI7dSvd0gv2/Z6BsTFphHrfjQVw==
=mPff
-----END PGP SIGNATURE-----

--k3qmt+ucFURmlhDS--

