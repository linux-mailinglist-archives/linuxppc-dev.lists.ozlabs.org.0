Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C46C226450
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 17:44:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9Qy64fcxzDqgb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 01:44:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=bmeneg@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=YGk74o4E; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=YGk74o4E; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9Qr06GM5zDqdj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 01:38:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595259530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Nj5CVbO042d9zu7TAo3vkfTDVgfDO82EbmPSLZjSnng=;
 b=YGk74o4E7uSId8YWXcYIRbJ43WRiqDauxevrhc885P5mzGGAvRbVz9r3QfD6/JMXJhpBa1
 Yh8UBIZ3jmCigAfMyWg2w+5SEqEhNtMluPR8WU9XhOboPKG5qNxXB70xQ/xFGpsFipukg/
 E0/7u35+q5dsfLSlFW+B+BMw6Yt6Alg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595259530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Nj5CVbO042d9zu7TAo3vkfTDVgfDO82EbmPSLZjSnng=;
 b=YGk74o4E7uSId8YWXcYIRbJ43WRiqDauxevrhc885P5mzGGAvRbVz9r3QfD6/JMXJhpBa1
 Yh8UBIZ3jmCigAfMyWg2w+5SEqEhNtMluPR8WU9XhOboPKG5qNxXB70xQ/xFGpsFipukg/
 E0/7u35+q5dsfLSlFW+B+BMw6Yt6Alg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-n8nRwOJfNmeINbcE0cT-lQ-1; Mon, 20 Jul 2020 11:38:45 -0400
X-MC-Unique: n8nRwOJfNmeINbcE0cT-lQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99E5F1932480;
 Mon, 20 Jul 2020 15:38:43 +0000 (UTC)
Received: from localhost (ovpn-116-11.gru2.redhat.com [10.97.116.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B5F0274F45;
 Mon, 20 Jul 2020 15:38:42 +0000 (UTC)
Date: Mon, 20 Jul 2020 12:38:41 -0300
From: Bruno Meneguele <bmeneg@redhat.com>
To: Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [PATCH v6] ima: move APPRAISE_BOOTPARAM dependency on
 ARCH_POLICY to runtime
Message-ID: <20200720153841.GG10323@glitch>
References: <20200713164830.101165-1-bmeneg@redhat.com>
 <d337cbba-e996-e898-1e75-9f142d480e5e@linux.vnet.ibm.com>
 <1595257015.5055.8.camel@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <1595257015.5055.8.camel@linux.ibm.com>
X-PGP-Key: http://keys.gnupg.net/pks/lookup?op=get&search=0x3823031E4660608D
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zGQnqpIoxlsbsOfg"
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

--zGQnqpIoxlsbsOfg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2020 at 10:56:55AM -0400, Mimi Zohar wrote:
> On Mon, 2020-07-20 at 10:40 -0400, Nayna wrote:
> > On 7/13/20 12:48 PM, Bruno Meneguele wrote:
> > > The IMA_APPRAISE_BOOTPARAM config allows enabling different "ima_appr=
aise=3D"
> > > modes - log, fix, enforce - at run time, but not when IMA architectur=
e
> > > specific policies are enabled. =A0This prevents properly labeling the
> > > filesystem on systems where secure boot is supported, but not enabled=
 on the
> > > platform. =A0Only when secure boot is actually enabled should these I=
MA
> > > appraise modes be disabled.
> > >
> > > This patch removes the compile time dependency and makes it a runtime
> > > decision, based on the secure boot state of that platform.
> > >
> > > Test results as follows:
> > >
> > > -> x86-64 with secure boot enabled
> > >
> > > [    0.015637] Kernel command line: <...> ima_policy=3Dappraise_tcb i=
ma_appraise=3Dfix
> > > [    0.015668] ima: Secure boot enabled: ignoring ima_appraise=3Dfix =
boot parameter option
> > >
>=20
> Is it common to have two colons in the same line? =A0Is the colon being
> used as a delimiter when parsing the kernel logs? =A0Should the second
> colon be replaced with a hyphen? =A0(No need to repost. =A0I'll fix it
> up.)
> =A0

AFAICS it has been used without any limitations, e.g:

PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 13=
3484873504 ns
microcode: CPU0: patch_level=3D0x08701013
Lockdown: modprobe: unsigned module loading is restricted; see man kernel_l=
ockdown.7
...

I'd say we're fine using it.

>=20
> > > -> powerpc with secure boot disabled
> > >
> > > [    0.000000] Kernel command line: <...> ima_policy=3Dappraise_tcb i=
ma_appraise=3Dfix
> > > [    0.000000] Secure boot mode disabled
> > >
> > > -> Running the system without secure boot and with both options set:
> > >
> > > CONFIG_IMA_APPRAISE_BOOTPARAM=3Dy
> > > CONFIG_IMA_ARCH_POLICY=3Dy
> > >
> > > Audit prompts "missing-hash" but still allow execution and, consequen=
tly,
> > > filesystem labeling:
> > >
> > > type=3DINTEGRITY_DATA msg=3Daudit(07/09/2020 12:30:27.778:1691) : pid=
=3D4976
> > > uid=3Droot auid=3Droot ses=3D2
> > > subj=3Dunconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 op=3Dapp=
raise_data
> > > cause=3Dmissing-hash comm=3Dbash name=3D/usr/bin/evmctl dev=3D"dm-0" =
ino=3D493150
> > > res=3Dno
> > >
> > > Cc: stable@vger.kernel.org
> > > Fixes: d958083a8f64 ("x86/ima: define arch_get_ima_policy() for x86")
> > > Signed-off-by: Bruno Meneguele <bmeneg@redhat.com>
> >=20
> >=20
> > Reviewed-by: Nayna Jain<nayna@linux.ibm.com>
> > Tested-by: Nayna Jain<nayna@linux.ibm.com>
>=20
> Thanks, Nayna.
>=20
> Mimi
>=20

--=20
bmeneg=20
PGP Key: http://bmeneg.com/pubkey.txt

--zGQnqpIoxlsbsOfg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEdWo6nTbnZdbDmXutYdRkFR+RokMFAl8VuoEACgkQYdRkFR+R
okPE9AgAzeX+81xWo21ombBBIIV7StgWU8qS6SadvIvUksysp8K1+912UFK1SAVA
IKLtwrRnv0HH4f3syFCsnQNb8m2Z5HRiBwj/kr/1h+xUkujfolpUgLdgQvlscVTD
HkHUTSA86vjACGW7YvnyumWroHwirVUOovA91k0mk9pfkUq57Wrmr5G5rmacjMeK
SKEu3NZlQKF6NTr0LUwxQ6y4e9i4skeNCIBFNFVR6re92LNhEAASVNMF6rhU7DCy
9BQmy9QSvIwyDd0o+b3/FeskWyxYj6g40gtXYjlrl3BBMWk1oGF5KRdboclfL21U
GioxjG6g710tRaCOZwB+9Wkwk/I49g==
=1i4d
-----END PGP SIGNATURE-----

--zGQnqpIoxlsbsOfg--

