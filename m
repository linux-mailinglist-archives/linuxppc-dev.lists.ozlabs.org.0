Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0680810FB8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Dec 2023 12:22:43 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=mVVUW+tA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SqtPY2SsHz3cY6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Dec 2023 22:22:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.a=rsa-sha256 header.s=key1 header.b=mVVUW+tA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ew.tq-group.com (client-ip=93.104.207.81; helo=mx1.tq-group.com; envelope-from=matthias.schiffer@ew.tq-group.com; receiver=lists.ozlabs.org)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SqtNk6Vhjz3c13
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Dec 2023 22:21:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1702466519; x=1734002519;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=ourCIgEXwb49HY0a/VAqrzT1ZIAkfkNeTXmDQob5whA=;
  b=mVVUW+tAY4fQPfpFQUhM0LEwCRoBcTuvwnLtkvIUEzAbwj6nNytrul9j
   /WQT902rYm6Pc4872LhwqkXH7JebxKeHnVaUP1sHBKlnib9aaRLJ9zE5q
   yhfXYL3J7lu4A2MC9Trj5bvx5FS5oF4WvootwhW+mfClyUyhV+QZGrF0Z
   44pvnfd+RZZsiq+46fXy8gmrqBM4qnEEw2UeUyD6+KZHSE34Wso/vTwfl
   vn8ROB2/u+XgjvF8xcI9pZoT5XK58S8MgEDEVbXDm/LXd+MF/sIvLAIhx
   cp6T2txMr1ehl21aOIkIRnGgUUvywx1jfaSIIcmsIIKw1itAnRv9gZOdN
   A==;
X-IronPort-AV: E=Sophos;i="6.04,272,1695679200"; 
   d="scan'208";a="34480876"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 13 Dec 2023 12:21:52 +0100
Received: from [192.168.2.128] (SCHIFFERM-M2.tq-net.de [10.121.53.15])
	by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 8F4C1280075;
	Wed, 13 Dec 2023 12:21:52 +0100 (CET)
Message-ID: <a7ed5eddc674b0fcb7062af58c10d0190ccda2b8.camel@ew.tq-group.com>
Subject: Re: [PATCH] Reapply "kbuild: Create directory for target DTB"
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 13 Dec 2023 12:21:52 +0100
In-Reply-To: <CAK7LNAQhVJ6kYC_+LutUzE9m-dQmaZ2HnWbLcOj54w5LZJe2FA@mail.gmail.com>
References: <20231212161610.100862-1-matthias.schiffer@ew.tq-group.com>
	 <CAK7LNAQhVJ6kYC_+LutUzE9m-dQmaZ2HnWbLcOj54w5LZJe2FA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
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
Cc: Nicolas Schier <nicolas@fjasle.eu>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux@ew.tq-group.com" <linux@ew.tq-group.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2023-12-12 at 17:13 +0000, Masahiro Yamada wrote:
>=20
>=20
> On Wed, Dec 13, 2023 at 1:17=E2=80=AFAM Matthias Schiffer
> <matthias.schiffer@ew.tq-group.com> wrote:
> >=20
> > This reverts commit dd7699e37f289fa433f42c6bcc108468c8b198c0.
> >=20
> > On powerpc, dtb-y is usually empty unless CONFIG_OF_ALL_DTBS is set. Wh=
ile
> > passing a DTB as a make target explicitly works fine, individual DTB
> > builds may also be pulled in as dependencies by cuImage.% and similar
> > targets. In this case, nothing creates the arch/powerpc/dts directory,
> > causing out-of-tree builds to fail.
> >=20
> > Fixes: dd7699e37f28 ("Revert "kbuild: Create directory for target DTB""=
)
> > Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> > ---
>=20
>=20
>=20
> NACK.
>=20
> %.dtb is generated by if_changed_dep.
>=20
> Each Makefile is responsible for adding %.dtb to 'targets'
> if it is pulled in as dependencies of other images.
>=20
> If it does not work for PowerPC, it is a bug in PowerPC Makefile.
>=20
>=20
> Just checking arch/powerpc/boot/Makefile,
> it adds dts/%.dtb and dts/fsl/%.dtb to 'targets'. [1] [2]
>=20
> cuImage.% should be file, but it does not cover all images.
>=20
> Fix arch/powerpc/boot/Makefile.

Ah, thank you for the pointers, I did not quite get the meaning of those Ma=
kefile lines when first
reading them. So the issue is that I'm trying to build a cuImage that is no=
t added to image-y in the
powerpc Makefile. It is unfortunate that this leads to a very confusing err=
or message about the
missing dts directory.

I'll send a new patch if I come to the conclusion that I actually need the =
cuImage (for the ancient
TQM5200 which hasn't really been touched since 2011).

Regards,
Matthias


>=20
>=20
>=20
> [1] https://github.com/torvalds/linux/blob/v6.7-rc5/arch/powerpc/boot/Mak=
efile#L386
> [2] https://github.com/torvalds/linux/blob/v6.7-rc5/arch/powerpc/boot/Mak=
efile#L388
>=20
>=20
>=20
> >  scripts/Makefile.lib | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > index 1a965fe68e011..3fe0fc46badfe 100644
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -389,7 +389,8 @@ $(obj)/%.dtbo.S: $(obj)/%.dtbo FORCE
> >         $(call if_changed,wrap_S_dtb)
> >=20
> >  quiet_cmd_dtc =3D DTC     $@
> > -cmd_dtc =3D $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(d=
tc-tmp) $< ; \
> > +cmd_dtc =3D mkdir -p $(dir ${dtc-tmp}) ; \
> > +       $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tm=
p) $< ; \
> >         $(DTC) -o $@ -b 0 \
> >                 $(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
> >                 -d $(depfile).dtc.tmp $(dtc-tmp) ; \
> > --
> > TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, =
Germany
> > Amtsgericht M=C3=BCnchen, HRB 105018
> > Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan=
 Schneider
> > https://www.tq-group.com/
> >=20
>=20
>=20
> --
> Best Regards
>=20
> Masahiro Yamada
>=20

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/
