Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C73630F00
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Nov 2022 14:33:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NDvjk0fdxz3dwc
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Nov 2022 00:33:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=fjPjkKK9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=kernel.org (client-ip=202.248.20.74; helo=condef-09.nifty.com; envelope-from=masahiroy@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=fjPjkKK9;
	dkim-atps=neutral
X-Greylist: delayed 122 seconds by postgrey-1.36 at boromir; Sun, 20 Nov 2022 00:32:22 AEDT
Received: from condef-09.nifty.com (condef-09.nifty.com [202.248.20.74])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NDvhk1m2Wz3cJY
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Nov 2022 00:32:22 +1100 (AEDT)
Received: from conssluserg-04.nifty.com ([10.126.8.83])by condef-09.nifty.com with ESMTP id 2AJDS69B024115
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Nov 2022 22:28:06 +0900
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52]) (authenticated)
	by conssluserg-04.nifty.com with ESMTP id 2AJDRfte000710
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Nov 2022 22:27:41 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 2AJDRfte000710
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1668864461;
	bh=wAXMhSJey5VSvKgw6HCvXuj93I1hlQIEOyp+rwYZByg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fjPjkKK9o2dUO+O5tZMdi9H7hQlTp5JAl9WDB5W2yXwju7VXI1sfRR6mRuh0t6oGv
	 mNtYC6N6Uw7LRFAGIEuGUNj4QzNCpISk2oFrs2kHUh/4ZrpOYK8fy5hT+Q34bVg84L
	 yBB3ziyOIZgqDh08/QxDBDoT/RRWCrSSmKPM65FuiLJkHpNKKAcaD7fxcBvw9x6act
	 A4nHH9W8keDqZQFRAwNmH8e2+UY+2G12gR13+JWFEM3OpBeVIacIUcb5sVqja5QWRL
	 NUMIMX0FXivq0W1Z9tRKvFlq1lGsFBhp7FcGUeTNePqfD4/7JL8c5UtYTmFdFzZ1Sv
	 mKTUXrqKMwy7A==
X-Nifty-SrcIP: [209.85.161.52]
Received: by mail-oo1-f52.google.com with SMTP id t15-20020a4a96cf000000b0049f7e18db0dso1177690ooi.10
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Nov 2022 05:27:41 -0800 (PST)
X-Gm-Message-State: ANoB5pn/M50vV9Okmt5Mx2lP20Co/1lT0YFlzJYz5AdRJ8oy+05XpH9t
	nRIFWXGsO5ILwBpyKiD/DcCJlBudnD2+0+JmOqk=
X-Google-Smtp-Source: AA0mqf6XzWLHsPIdmgP8chub/cRX8/Fvp3IqeLVQ+n1Vo/B1UPAu+IZq+JU5ZzzXJJHhnxFBp6Y5zZaukuR/pAQrwFU=
X-Received: by 2002:a4a:b145:0:b0:49f:449a:5f6c with SMTP id
 e5-20020a4ab145000000b0049f449a5f6cmr5352439ooo.93.1668864460545; Sat, 19 Nov
 2022 05:27:40 -0800 (PST)
MIME-Version: 1.0
References: <20221118150351.GV28810@kitsune.suse.cz> <b8191c01-4d78-537b-9650-a783e14e5997@infradead.org>
In-Reply-To: <b8191c01-4d78-537b-9650-a783e14e5997@infradead.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 19 Nov 2022 22:27:04 +0900
X-Gmail-Original-Message-ID: <CAK7LNASBhTvzkjXuJDH8ePCVXnZ=GUYdNa-OU+QURbBp3oyEBQ@mail.gmail.com>
Message-ID: <CAK7LNASBhTvzkjXuJDH8ePCVXnZ=GUYdNa-OU+QURbBp3oyEBQ@mail.gmail.com>
Subject: Re: build failure in linux-next: offb missing fb helpers
To: Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-fbdev@vger.kernel.org, =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Nov 19, 2022 at 3:20 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Hi--
>
> [adding Masahiro-san]
>
>
> On 11/18/22 07:03, Michal Such=C3=A1nek wrote:
> > Hello,
> >
> > I am seeing these errors:
> >
> > [ 3825s]   AR      built-in.a
> > [ 3827s]   AR      vmlinux.a
> > [ 3835s]   LD      vmlinux.o
> > [ 3835s]   OBJCOPY modules.builtin.modinfo
> > [ 3835s]   GEN     modules.builtin
> > [ 3835s]   GEN     .vmlinux.objs
> > [ 3848s]   MODPOST Module.symvers
> > [ 3848s]   CC      .vmlinux.export.o
> > [ 3849s]   UPD     include/generated/utsversion.h
> > [ 3849s]   CC      init/version-timestamp.o
> > [ 3849s]   LD      .tmp_vmlinux.btf
> > [ 3864s] ld: drivers/video/fbdev/offb.o:(.data.rel.ro+0x58): undefined
> > reference to `cfb_fillrect'
> > [ 3864s] ld: drivers/video/fbdev/offb.o:(.data.rel.ro+0x60): undefined
> > reference to `cfb_copyarea'
> > [ 3864s] ld: drivers/video/fbdev/offb.o:(.data.rel.ro+0x68): undefined
> > reference to `cfb_imageblit'
> >
> > cfb_fillrect is provided by drivers/video/fbdev/core/cfbfillrect.c
> >
> > It is compiled when CONFIG_FB_CFB_FILLRECT
> > drivers/video/fbdev/core/Makefile:obj-$(CONFIG_FB_CFB_FILLRECT)  +=3D c=
fbfillrect.o
> >
> > drivers/video/fbdev/Makefile:obj-$(CONFIG_FB_OF)               +=3D off=
b.o
> > is compiled when CONFIG_FB_OF
> >
> > It selects CONFIG_FB_CFB_FILLRECT
> > config FB_OF
> >         bool "Open Firmware frame buffer device support"
> >         depends on (FB =3D y) && PPC && (!PPC_PSERIES || PCI)
> >         select APERTURE_HELPERS
> >         select FB_CFB_FILLRECT
> >         select FB_CFB_COPYAREA
> >         select FB_CFB_IMAGEBLIT
> >         select FB_MACMODES
> >
> > The config has FB_OF built-in and FB_CFB_FILLRECT modular
> > config/ppc64le/vanilla:CONFIG_FB_CFB_FILLRECT=3Dm
> > config/ppc64le/vanilla:CONFIG_FB_CFB_COPYAREA=3Dm
> > config/ppc64le/vanilla:CONFIG_FB_CFB_IMAGEBLIT=3Dm
> > config/ppc64le/vanilla:CONFIG_FB_OF=3Dy
> >
> > It only depends on FB which mut be built-in for FB_OF
> > config FB_CFB_FILLRECT
> >         tristate
> >         depends on FB
> >
> > Is select in kconfig broken?
> >
> > Attachnig the config in question.
>
> The symbol info from xconfig says:
>
> Symbol: FB_CFB_FILLRECT [=3Dm]
> Type : tristate
> Defined at drivers/video/fbdev/Kconfig:69
> Depends on: HAS_IOMEM [=3Dy] && FB [=3Dy]
> Selected by [m]:
> [deleted]
> - FB_OF [=3Dy] && HAS_IOMEM [=3Dy] && FB [=3Dy]=3Dy && PPC [=3Dy] && (!PP=
C_PSERIES [=3Dy] || PCI [=3Dy]) && !DRM_OFDRM [=3Dm]
>
> I don't see why the 'select' from (bool) FB_OF would leave FB_CFB_FILLREC=
T (and the others)
> as =3Dm instead of =3Dy.
>
> Hopefully Masahiro can shed some light on this.
>
> --
> ~Randy


The reason is shown in your paste of help message:

"&& !DRM_OFDRM [=3Dm]" downgrades it to "selected by m"

To aid this particular case, the following will select
FB_CFB_FILLRECT=3Dy.




diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 66f36b69e8f3..2bcf8627819f 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -458,7 +458,7 @@ config FB_ATARI
 config FB_OF
        bool "Open Firmware frame buffer device support"
        depends on (FB =3D y) && PPC && (!PPC_PSERIES || PCI)
-       depends on !DRM_OFDRM
+       depends on DRM_OFDRM !=3D y
        select APERTURE_HELPERS
        select FB_CFB_FILLRECT
        select FB_CFB_COPYAREA




Or, perhaps "depends on DRM_OFDRM =3D n"
I do not know the intention of this dependency.

Recommendation is to use "depends on" instead of "select" though.



BTW, this is similar to what you asked before.

https://lore.kernel.org/linux-kbuild/e1a6228d-1341-6264-d97a-e2bd52a65c82@i=
nfradead.org/


I tried to fix it in the past, but the issue was not as shallow as I
had expected.
I did not get around to revisiting this topic.

https://patchwork.kernel.org/project/linux-kbuild/patch/1543216969-2227-1-g=
it-send-email-yamada.masahiro@socionext.com/










--
Best Regards
Masahiro Yamada
