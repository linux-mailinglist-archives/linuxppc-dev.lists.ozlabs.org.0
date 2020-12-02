Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6702CB5BA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 08:19:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cm9MQ5XvNzDr6x
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 18:19:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=protonmail.com (client-ip=185.70.41.103;
 helo=mail-41103.protonmail.ch; envelope-from=skirmisher@protonmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=protonmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256
 header.s=protonmail header.b=V3NH88lN; 
 dkim-atps=neutral
Received: from mail-41103.protonmail.ch (mail-41103.protonmail.ch
 [185.70.41.103])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cm9Kj5MvWzDr39
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 18:18:01 +1100 (AEDT)
Received: from mail-02.mail-europe.com (mail-02.mail-europe.com
 [51.89.119.103])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 by mail-41103.protonmail.ch (Postfix) with ESMTPS id 5D77A2004870
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 07:17:57 +0000 (UTC)
Authentication-Results: mail-41103.protonmail.ch;
 dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.b="V3NH88lN"
Date: Wed, 02 Dec 2020 07:17:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1606893458;
 bh=2isua++9RtOCxcCi4KUJCJG3sk/CGzZ2FoGDNlXHizw=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=V3NH88lNtczfWpBS3ht4iP6SXB08/NlKKhR64qqwW+V2neCXp3q3OFHnziNlMOvi4
 2jypWbc2iDBtmeBUU5jnOls/6D+ToS5Yo5gOC6tSTiYkZ0juRhJ/QL5DbRRqb4sZ0V
 KzpFCBYI0mXFKiu3fwE4eqv8oBZ8EfvElFaJ2evw=
To: Sukadev Bhattiprolu <sukadev@linux.ibm.com>,
 Bulent Abali <abali@us.ibm.com>
From: Will Springer <skirmisher@protonmail.com>
Subject: Re: CONFIG_PPC_VAS depends on 64k pages...?
Message-ID: <7176054.EvYhyI6sBW@sheen>
In-Reply-To: <OF66F86744.2ADAED9E-ON85258631.0047CAC6-85258631.0048F494@notes.na.collabserv.com>
References: <7171078.EvYhyI6sBW@sheen>
 <2b234a7e-e9f6-d02b-a20f-74c0cc1df8d3@csgroup.eu>
 <20201201055228.GA2213889@us.ibm.com>
 <OF66F86744.2ADAED9E-ON85258631.0047CAC6-85258631.0048F494@notes.na.collabserv.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Will Springer <skirmisher@protonmail.com>
Cc: Tulio Magno Quites Machado Filho <tulioqm@br.ibm.com>, daniel@octaforge.org,
 haren@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 Raphael M Zinsly <rzinsly@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tuesday, December 1, 2020 5:16:51 AM PST Bulent Abali wrote:
> I don't know anything about VAS page size requirements in the kernel.  I
> checked the user compression library and saw that we do a sysconf to
> get the page size; so the library should be immune to page size by
> design. But it wouldn't surprise me if a 64KB constant is inadvertently
> hardcoded somewhere else in the library.  Giving heads up to Tulio and
> Raphael who are owners of the github repo.
>=20
> https://github.com/libnxz/power-gzip/blob/master/lib/nx_zlib.c#L922
>=20
> If we got this wrong in the library it might manifest itself as an error
> message of the sort "excessive page faults".  The library must touch
> pages ahead to make them present in the memory; occasional page faults
> is acceptable. It will retry.

Hm, good to know. As I said I haven't noticed any problems so far, over a=
=20
few different days of testing. My change is now in the Void Linux kernel=20
package, and is working for others as well (including the Void maintainer=
=20
Daniel/q66 who I CC'd initially).

>=20
> Bulent
>=20
>=20
>=20
>=20
> From:        "Sukadev Bhattiprolu" <sukadev@linux.ibm.com>
> To:        "Christophe Leroy" <christophe.leroy@csgroup.eu>
> Cc:        "Will Springer" <skirmisher@protonmail.com>,
> linuxppc-dev@lists.ozlabs.org, daniel@octaforge.org, Bulent
> Abali/Watson/IBM@IBM, haren@linux.ibm.com Date:        12/01/2020 12:53
> AM
> Subject:        Re: CONFIG_PPC_VAS depends on 64k pages...?
>=20
> Christophe Leroy [christophe.leroy@csgroup.eu] wrote:
> > Hi,
> >=20
> > Le 19/11/2020 =C3=A0 11:58, Will Springer a =C3=A9crit :
> > > I learned about the POWER9 gzip accelerator a few months ago when
> > > the
> > > support hit upstream Linux 5.8. However, for some reason the Kconfig
> > > dictates that VAS depends on a 64k page size, which is problematic
> > > as I
> > > run Void Linux, which uses a 4k-page kernel.
> > >=20
> > > Some early poking by others indicated there wasn't an obvious page
> > > size
> > > dependency in the code, and suggested I try modifying the config to
> > > switch it on. I did so, but was stopped by a minor complaint of an
> > > "unexpected DT configuration" by the VAS code. I wasn't equipped to
> > > figure out exactly what this meant, even after finding the
> > > offending condition, so after writing a very drawn-out forum post
> > > asking for help, I dropped the subject.
> > >=20
> > > Fast forward to today, when I was reminded of the whole thing again,
> > > and decided to debug a bit further. Apparently the VAS platform
> > > device (derived from the DT node) has 5 resources on my 4k kernel,
> > > instead of 4 (which evidently works for others who have had success
> > > on 64k kernels). I have no idea what this means in practice (I
> > > don't know how to introspect it), but after making a tiny patch[1],
> > > everything came up smoothly and I was doing blazing-fast gzip
> > > (de)compression in no time.
> > >=20
> > > Everything seems to work fine on 4k pages. So, what's up? Are there
> > > pitfalls lurking around that I've yet to stumble over? More
> > > reasonably,
> > > I'm curious as to why the feature supposedly depends on 64k pages,
> > > or if there's anything else I should be concerned about.
>=20
> Will,
>=20
> The reason I put in that config check is because we were only able to
> test 64K pages at that point.
>=20
> It is interesting that it is working for you. Following code in skiboot
> https://github.com/open-power/skiboot/blob/master/hw/vas.cshould
> restrict it to 64K pages. IIRC there is also a corresponding change in
> some NX registers that should also be configured to allow 4K pages.=20

Huh, that is interesting indeed. As far as the kernel code, the only thing=
=20
specific to 64k pages I could find was in [1], where=20
VAS_XLATE_LPCR_PAGE_SIZE is set. There is also NX_PAGE_SIZE in drivers/
crypto/nx/nx.h, which is set to 4096, but I don't know if that's related to=
=20
kernel page size at all. Without a better idea of the code base, I didn't
examine more thoroughly.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/=
arch/powerpc/platforms/powernv/vas-window.c#n293

>                 static int init_north_ctl(struct proc_chip *chip)
>                 {
>                                  uint64_t val =3D 0ULL;
>=20
>                                  val =3D SETFIELD(VAS_64K_MODE_MASK, val,
> true); val =3D SETFIELD(VAS_ACCEPT_PASTE_MASK, val, true); val =3D
> SETFIELD(VAS_ENABLE_WC_MMIO_BAR, val, true); val =3D
> SETFIELD(VAS_ENABLE_UWC_MMIO_BAR, val, true); val =3D
> SETFIELD(VAS_ENABLE_RMA_MMIO_BAR, val, true);
>=20
>                                  return vas_scom_write(chip,
> VAS_MISC_N_CTL, val); }
>=20
> I am copying Bulent Albali and Haren Myneni who have been working with
> VAS/NX for their thoughts/experience.

Thanks for this and for your input, by the way.

>=20
> > Maybe ask Sukadev who did the implementation and is maintaining it ?
> >=20
> > > I do have to say I'm quite satisfied with the results of the NX
> > > accelerator, though. Being able to shuffle data to a RaptorCS box
> > > over gigE and get compressed data back faster than most software
> > > gzip could ever hope to achieve is no small feat, let alone the
> > > instantaneous results locally.> >=20
> > > :)
> > >=20
> > > Cheers,
> > > Will Springer [she/her]
> > >=20
> > > [1]:
> > > https://github.com/Skirmisher/void-packages/blob/vas-4k-pages/srcpkgs=
/linux5.9/patches/ppc-vas-on-4k.patch
> > Christophe

Will [she/her]




