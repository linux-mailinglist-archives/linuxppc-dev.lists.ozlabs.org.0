Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 125FC630F4D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Nov 2022 16:38:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NDyV569Gpz3f3X
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Nov 2022 02:38:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Y8d80i+4;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=YtXYxVkf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Y8d80i+4;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=YtXYxVkf;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NDyTB1jm9z3c3G
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Nov 2022 02:37:33 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 758401F747;
	Sat, 19 Nov 2022 15:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1668872250; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c5FuVv7ZVIQVzf6omBt/v/EHkFFanwV0mOMaz+dnj+U=;
	b=Y8d80i+4ux8qhzzd3kTDu31wqavk7AnVw3bxcCmd9GhtSy9Pr0eXK5c9wYhG8t1eY95/nO
	BTbbFrar1Ecf8ixVAR+Uq6/8b5MDr3NpiiDuNWryaoDKpsC8T0ILQQ+Zs9G16zqCGO2yID
	1nj4ZHYuDX1y3vl1QmsSZc0ABY6mxG0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1668872250;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c5FuVv7ZVIQVzf6omBt/v/EHkFFanwV0mOMaz+dnj+U=;
	b=YtXYxVkfy78m0XIGl7y/QT8KJvAHn1oB8umRUOkgF02KtyieCwUxlm8pIPTc4StZsn/2Kn
	NUjrsRBEqD4WQYDw==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 5172C2C141;
	Sat, 19 Nov 2022 15:37:30 +0000 (UTC)
Date: Sat, 19 Nov 2022 16:37:29 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: build failure in linux-next: offb missing fb helpers
Message-ID: <20221119153729.GX28810@kitsune.suse.cz>
References: <20221118150351.GV28810@kitsune.suse.cz>
 <b8191c01-4d78-537b-9650-a783e14e5997@infradead.org>
 <CAK7LNASBhTvzkjXuJDH8ePCVXnZ=GUYdNa-OU+QURbBp3oyEBQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNASBhTvzkjXuJDH8ePCVXnZ=GUYdNa-OU+QURbBp3oyEBQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-fbdev@vger.kernel.org, linux-kbuild@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Sat, Nov 19, 2022 at 10:27:04PM +0900, Masahiro Yamada wrote:
> On Sat, Nov 19, 2022 at 3:20 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> >
> > Hi--
> >
> > [adding Masahiro-san]
> >
> >
> > On 11/18/22 07:03, Michal Suchánek wrote:
> > > Hello,
> > >
> > > I am seeing these errors:
> > >
> > > [ 3825s]   AR      built-in.a
> > > [ 3827s]   AR      vmlinux.a
> > > [ 3835s]   LD      vmlinux.o
> > > [ 3835s]   OBJCOPY modules.builtin.modinfo
> > > [ 3835s]   GEN     modules.builtin
> > > [ 3835s]   GEN     .vmlinux.objs
> > > [ 3848s]   MODPOST Module.symvers
> > > [ 3848s]   CC      .vmlinux.export.o
> > > [ 3849s]   UPD     include/generated/utsversion.h
> > > [ 3849s]   CC      init/version-timestamp.o
> > > [ 3849s]   LD      .tmp_vmlinux.btf
> > > [ 3864s] ld: drivers/video/fbdev/offb.o:(.data.rel.ro+0x58): undefined
> > > reference to `cfb_fillrect'
> > > [ 3864s] ld: drivers/video/fbdev/offb.o:(.data.rel.ro+0x60): undefined
> > > reference to `cfb_copyarea'
> > > [ 3864s] ld: drivers/video/fbdev/offb.o:(.data.rel.ro+0x68): undefined
> > > reference to `cfb_imageblit'
> > >
> > > cfb_fillrect is provided by drivers/video/fbdev/core/cfbfillrect.c
> > >
> > > It is compiled when CONFIG_FB_CFB_FILLRECT
> > > drivers/video/fbdev/core/Makefile:obj-$(CONFIG_FB_CFB_FILLRECT)  += cfbfillrect.o
> > >
> > > drivers/video/fbdev/Makefile:obj-$(CONFIG_FB_OF)               += offb.o
> > > is compiled when CONFIG_FB_OF
> > >
> > > It selects CONFIG_FB_CFB_FILLRECT
> > > config FB_OF
> > >         bool "Open Firmware frame buffer device support"
> > >         depends on (FB = y) && PPC && (!PPC_PSERIES || PCI)
> > >         select APERTURE_HELPERS
> > >         select FB_CFB_FILLRECT
> > >         select FB_CFB_COPYAREA
> > >         select FB_CFB_IMAGEBLIT
> > >         select FB_MACMODES
> > >
> > > The config has FB_OF built-in and FB_CFB_FILLRECT modular
> > > config/ppc64le/vanilla:CONFIG_FB_CFB_FILLRECT=m
> > > config/ppc64le/vanilla:CONFIG_FB_CFB_COPYAREA=m
> > > config/ppc64le/vanilla:CONFIG_FB_CFB_IMAGEBLIT=m
> > > config/ppc64le/vanilla:CONFIG_FB_OF=y
> > >
> > > It only depends on FB which mut be built-in for FB_OF
> > > config FB_CFB_FILLRECT
> > >         tristate
> > >         depends on FB
> > >
> > > Is select in kconfig broken?
> > >
> > > Attachnig the config in question.
> >
> > The symbol info from xconfig says:
> >
> > Symbol: FB_CFB_FILLRECT [=m]
> > Type : tristate
> > Defined at drivers/video/fbdev/Kconfig:69
> > Depends on: HAS_IOMEM [=y] && FB [=y]
> > Selected by [m]:
> > [deleted]
> > - FB_OF [=y] && HAS_IOMEM [=y] && FB [=y]=y && PPC [=y] && (!PPC_PSERIES [=y] || PCI [=y]) && !DRM_OFDRM [=m]
> >
> > I don't see why the 'select' from (bool) FB_OF would leave FB_CFB_FILLRECT (and the others)
> > as =m instead of =y.
> >
> > Hopefully Masahiro can shed some light on this.
> >
> > --
> > ~Randy
> 
> 
> The reason is shown in your paste of help message:
> 
> "&& !DRM_OFDRM [=m]" downgrades it to "selected by m"
> 
> To aid this particular case, the following will select
> FB_CFB_FILLRECT=y.
> 
> 
> 
> 
> diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> index 66f36b69e8f3..2bcf8627819f 100644
> --- a/drivers/video/fbdev/Kconfig
> +++ b/drivers/video/fbdev/Kconfig
> @@ -458,7 +458,7 @@ config FB_ATARI
>  config FB_OF
>         bool "Open Firmware frame buffer device support"
>         depends on (FB = y) && PPC && (!PPC_PSERIES || PCI)
> -       depends on !DRM_OFDRM
> +       depends on DRM_OFDRM != y
>         select APERTURE_HELPERS
>         select FB_CFB_FILLRECT
>         select FB_CFB_COPYAREA

Thanks for clarification.

This change fixess the config for me.

Michal


> Or, perhaps "depends on DRM_OFDRM = n"
> I do not know the intention of this dependency.
> 
> Recommendation is to use "depends on" instead of "select" though.
> 
> 
> 
> BTW, this is similar to what you asked before.
> 
> https://lore.kernel.org/linux-kbuild/e1a6228d-1341-6264-d97a-e2bd52a65c82@infradead.org/
> 
> 
> I tried to fix it in the past, but the issue was not as shallow as I
> had expected.
> I did not get around to revisiting this topic.
> 
> https://patchwork.kernel.org/project/linux-kbuild/patch/1543216969-2227-1-git-send-email-yamada.masahiro@socionext.com/
> 
