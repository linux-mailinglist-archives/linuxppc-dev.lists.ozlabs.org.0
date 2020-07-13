Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE91E21D9D8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 17:11:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B56YM4CmPzDqFF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 01:11:19 +1000 (AEST)
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
 header.s=mimecast20190719 header.b=Kb0AqKqn; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=ah/jukWR; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B56PJ5f39zDqTQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 01:04:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594652651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y5LgY+HXOyC1qLXaav2qwG6qSNorPKc5IVKdxzKAFRE=;
 b=Kb0AqKqnR6RzqZlXoRJ15JAnI4+yKRFz3jRtqOmLAm7A6ASnwjAseSsKGVKr/7XrJKnGSR
 dQLO4dk0xEXrkUBpUaHsKkwse1VMYlNcLbyYPy9jwgBzbR0alAJZPERxEMEFcEIkqpux+5
 LGETPd2LqPOtTVvAQTIDu1k7JJ0kXFI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594652652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y5LgY+HXOyC1qLXaav2qwG6qSNorPKc5IVKdxzKAFRE=;
 b=ah/jukWR2gva3u+hRAIHkcCJFPn98XImdQkyzQ054p/0o+up2szerv+GwCVtGT8N2+QLiN
 JcUBW5mABrYpRceQXh+Ve287B6LcMqDd/JTPu3bL9lkQ88WZPeSOfDEF9lWXc6w3vKrmp4
 bsmP0fheJlyGNRxpuASivXnF2V+Loxs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-O4iVewDkOQWpoMSBO_vvTQ-1; Mon, 13 Jul 2020 11:03:55 -0400
X-MC-Unique: O4iVewDkOQWpoMSBO_vvTQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66D4D1083E84;
 Mon, 13 Jul 2020 15:03:53 +0000 (UTC)
Received: from localhost (ovpn-116-148.gru2.redhat.com [10.97.116.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B5BD619D7D;
 Mon, 13 Jul 2020 15:03:52 +0000 (UTC)
Date: Mon, 13 Jul 2020 12:03:51 -0300
From: Bruno Meneguele <bmeneg@redhat.com>
To: Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [PATCH v5] ima: move APPRAISE_BOOTPARAM dependency on
 ARCH_POLICY to runtime
Message-ID: <20200713150351.GC4730@glitch>
References: <20200709164647.45153-1-bmeneg@redhat.com>
 <1594401804.14405.8.camel@linux.ibm.com>
 <20200710180338.GA10547@glitch> <20200710183420.GB10547@glitch>
 <1594407288.14405.36.camel@linux.ibm.com>
 <20200710192516.GC10547@glitch>
MIME-Version: 1.0
In-Reply-To: <20200710192516.GC10547@glitch>
X-PGP-Key: http://keys.gnupg.net/pks/lookup?op=get&search=0x3823031E4660608D
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/e2eDi0V/xtL+Mc8"
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
Cc: linux-s390@vger.kernel.org, nayna@linux.ibm.com, erichte@linux.ibm.com,
 x86@kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--/e2eDi0V/xtL+Mc8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2020 at 04:25:16PM -0300, Bruno Meneguele wrote:
> On Fri, Jul 10, 2020 at 02:54:48PM -0400, Mimi Zohar wrote:
> > On Fri, 2020-07-10 at 15:34 -0300, Bruno Meneguele wrote:
> > > On Fri, Jul 10, 2020 at 03:03:38PM -0300, Bruno Meneguele wrote:
> > > > On Fri, Jul 10, 2020 at 01:23:24PM -0400, Mimi Zohar wrote:
> > > > > On Thu, 2020-07-09 at 13:46 -0300, Bruno Meneguele wrote:
> > > > > > APPRAISE_BOOTPARAM has been marked as dependent on !ARCH_POLICY=
 in compile
> > > > > > time, enforcing the appraisal whenever the kernel had the arch =
policy option
> > > > > > enabled.
> > > > >=20
> > > > > > However it breaks systems where the option is set but the syste=
m didn't
> > > > > > boot in a "secure boot" platform. In this scenario, anytime an =
appraisal
> > > > > > policy (i.e. ima_policy=3Dappraisal_tcb) is used it will be for=
ced, without
> > > > > > giving the user the opportunity to label the filesystem, before=
 enforcing
> > > > > > integrity.
> > > > > >=20
> > > > > > Considering the ARCH_POLICY is only effective when secure boot =
is actually
> > > > > > enabled this patch remove the compile time dependency and move =
it to a
> > > > > > runtime decision, based on the secure boot state of that platfo=
rm.
> > > > >=20
> > > > > Perhaps we could simplify this patch description a bit?
> > > > >=20
> > > > > The IMA_APPRAISE_BOOTPARAM config allows enabling different
> > > > > "ima_appraise=3D" modes - log, fix, enforce - at run time, but no=
t when
> > > > > IMA architecture specific policies are enabled. =A0This prevents
> > > > > properly labeling the filesystem on systems where secure boot is
> > > > > supported, but not enabled on the platform. =A0Only when secure b=
oot is
> > > > > enabled, should these IMA appraise modes be disabled.
> > > > >=20
> > > > > This patch removes the compile time dependency and makes it a run=
time
> > > > > decision, based on the secure boot state of that platform.
> > > > >=20
> > > >=20
> > > > Sounds good to me.
> > > >=20
> > > > > <snip>
> > > > >=20
> > > > > > diff --git a/security/integrity/ima/ima_appraise.c b/security/i=
ntegrity/ima/ima_appraise.c
> > > > > > index a9649b04b9f1..884de471b38a 100644
> > > > > > --- a/security/integrity/ima/ima_appraise.c
> > > > > > +++ b/security/integrity/ima/ima_appraise.c
> > > > > > @@ -19,6 +19,11 @@
> > > > > >  static int __init default_appraise_setup(c
> > > > >=20
> > > > > > har *str)
> > > > > >  {
> > > > > >  #ifdef CONFIG_IMA_APPRAISE_BOOTPARAM
> > > > > > +=09if (arch_ima_get_secureboot()) {
> > > > > > +=09=09pr_info("appraise boot param ignored: secure boot enable=
d");
> > > > >=20
> > > > > Instead of a generic statement, is it possible to include the act=
ual
> > > > > option being denied? =A0Perhaps something like: "Secure boot enab=
led,
> > > > > ignoring %s boot command line option"
> > > > >=20
> > > > > Mimi
> > > > >=20
> > > >=20
> > > > Yes, sure.
> > > >=20
> > >=20
> > > Btw, would it make sense to first make sure we have a valid "str"
> > > option and not something random to print?
> > > =20
> > > diff --git a/security/integrity/ima/ima_appraise.c b/security/integri=
ty/ima/ima_appraise.c
> > > index a9649b04b9f1..1f1175531d3e 100644
> > > --- a/security/integrity/ima/ima_appraise.c
> > > +++ b/security/integrity/ima/ima_appraise.c
> > > @@ -25,6 +25,16 @@ static int __init default_appraise_setup(char *str=
)
> > >                 ima_appraise =3D IMA_APPRAISE_LOG;
> > >         else if (strncmp(str, "fix", 3) =3D=3D 0)
> > >                 ima_appraise =3D IMA_APPRAISE_FIX;
> > > +       else
> > > +               pr_info("invalid \"%s\" appraise option");
> > > +
> > > +       if (arch_ima_get_secureboot()) {
> > > +               if (!is_ima_appraise_enabled()) {
> > > +                       pr_info("Secure boot enabled: ignoring ima_ap=
praise=3D%s boot parameter option",
> > > +                               str);
> > > +                       ima_appraise =3D IMA_APPRAISE_ENFORCE;
> > > +               }
> > > +       }
> >=20
> > Providing feedback is probably a good idea. =A0However, the
> > "arch_ima_get_secureboot" test can't come after setting
> > "ima_appraise."
> >=20
>=20
> Sorry, but I'm not sure if I got the reason to why it can't be done
> after: would it be basically to prevent any further processing about
> ima_appraise as a matter of security principle? Or maybe to keep the
> dependency between secureboot and bootparam truly strict?=20
>=20
> Or are there something else I'm missing?
>=20

I'm going to send a v6 with the pr_info() placed in the beginning
directly printing 'str', thus we can have the actual issue solved.=20

Then later I send another patches to handle the other cases of limiting
'str' printing and also giving the user a feedback about invalid
ima_appraise=3D options. So we can discuss further on that.

Thanks Mimi.

> > Mimi
> >=20
> > >  #endif
> > >         return 1;
> > >  }
> > >=20
> > >=20
> > > The "else" there I think would make sense as well, at least to give t=
he
> > > user some feedback about a possible mispelling of him (as a separate
> > > patch).
> > >=20
> > > And "if(!is_ima_appraise_enabled())" would avoid to print anything ab=
out
> > > "ignoring the option" to the user in case he explicitly set "enforce"=
,
> > > which we know there isn't any real effect but is allowed and shown in
> > > kernel-parameters.txt.
> > >=20
> > > > Thanks!
> > > >=20
> > > > > > +=09=09return 1;
> > > > > > +=09}
> > > > > > +
> > > > > >  =09if (strncmp(str, "off", 3) =3D=3D 0)
> > > > > >  =09=09ima_appraise =3D 0;
> > > > > >  =09else if (strncmp(str, "log", 3) =3D=3D 0)
> > > > >=20
> > > >=20
> > > > --=20
> > > > bmeneg=20
> > > > PGP Key: http://bmeneg.com/pubkey.txt
> > >=20
> > >=20
> > >=20
> >=20
>=20
> --=20
> bmeneg=20
> PGP Key: http://bmeneg.com/pubkey.txt



--=20
bmeneg=20
PGP Key: http://bmeneg.com/pubkey.txt

--/e2eDi0V/xtL+Mc8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEdWo6nTbnZdbDmXutYdRkFR+RokMFAl8Md9cACgkQYdRkFR+R
okMtIQf8DZC6eBugwiFWL2eAc5ePgbdsvuo5aPMkQvTR20E/jr44coEpbyLHg4dI
v3/6Rl0NqtJpe+qXbBBQDneG5H3BmfV/fa34ie39pwc36ExkHsMEzlM8XWqK6pfW
fjlP16BYuwEcReffrmXPYOpDT0Ohl9tMqX6CVY16o2/8TELnTaWSY1Iq7ot+oPet
PnTIIFqFQ41o4nS31BssLtEChs1ZhPwiTCTWBQnDWOaFfL0IZAkaCdp13J8WRTEK
poTKWGTcw1TqtiRdppy7Gbs1ysCTrpAVlTRJyZKHIECFm3I/HH5breKFbom0GjWT
UgzMxlFa2Fwt5uTeSR8xvmVzIZXR+g==
=QwKI
-----END PGP SIGNATURE-----

--/e2eDi0V/xtL+Mc8--

