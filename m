Return-Path: <linuxppc-dev+bounces-8660-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E10ABBAB3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 May 2025 12:12:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1D5Q6t40z2xjK;
	Mon, 19 May 2025 20:12:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747649562;
	cv=none; b=n31ag4JJZ8BJpg+5HEyljIcqC+NPvWMIzHfkpLMuWoeK1iITlP4oixbT8jl29bI+Hjxpi4E5Cil2exRZqkcH7nEZvo+QgQR8k1Pv6Wx/Ji/7rrvIp64ObmgefWD1g6xN2gedzwazsPpVCZJXnfu2Bkk504gRe94iV30vhfsgGF51uNE4RJbeBUSVC4YBZMs2N14CaRitoX9DGbW/vt7xoyViXiCdT6v92PijiVNczDicepYY2GMbSr3DSFjukCfli1xIXnNNLu8NfOWmmZ2m3tF98ES1I8SMd9aQ9pY3WlOdH5nOy/Ic+F1ILJArQBYXqO6/XPBNL+r3ymbYYO2+NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747649562; c=relaxed/relaxed;
	bh=B2VoqW3zntAzzsTrqJBj493QtiX0t+gVZTk5VvQi+s0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NOEVSUyfnAcqtBYWTbOAZinwbqSGDHZsd5eAlM01J9Fo31oh6Cz5mTeG1MvaA75SkqRoRylbbqQoIBh3VcjtgAMiGVKGaOJ5hzDOnEHduU63MFadv57HbbeM2M+5YMHobKZzDcnlNlcldbbltayJKImgRFSIe5d7ntTUa53PORISTDLDkyTRvKNQt1hEaR3iNzH7B5gmvbNFJcbUYt/KzvcAeXvx5/BsaHpr0guumbmh3XPNHNg3V1T20KrbFWqp07IUdR+B1+zBEHP0Dxp7Wm9grUYLEV3q3Z6/B5dIwJH+8KNLNlNrzoGHCZfRlOOKifKIBWukqmnsuadPOSILVg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nscdB7qP; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nscdB7qP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1D5P5v3Mz2xWc
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 May 2025 20:12:41 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4B400A4C76D;
	Mon, 19 May 2025 10:12:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1230AC4CEE4;
	Mon, 19 May 2025 10:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747649557;
	bh=36bTK+sJWp8PopkJbOlgwt9Ctf7FBzVSvSeBcSMc0sE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nscdB7qPs2zNee5BR3hmpAZQZCQBcXkdlF7Y6HsbM6UzPRdA3dF1BnWAVcJTPuKIv
	 O3FYecQBdB24pQIIhnt57UfVPAxV9LgWpjYqCVizpPuKxRzp3e1tGtoxdxzCiww3pg
	 KrBMVyUKbWn6bQi5E33gX2v1WUEStGoaCf1YS4m8mdcMbsKi6bgaKULPdgFE1O08w4
	 NTbvxawzw3RhqwBP/2mlOvuL311cjPZ4d3W4fwM+V1XeLsP7wD/Giz/f3N3kZmH93H
	 7tJGZQKhVupyasLyUF8vXgTKkesU5dptYyyOeOnTmIGAbpjsR1fJD00I4DSLdkVhBQ
	 vnhqqJsWmqhWw==
Date: Mon, 19 May 2025 12:12:21 +0200
From: Christian Brauner <brauner@kernel.org>
To: Amir Goldstein <amir73il@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, 
	Andrey Albershteyn <aalbersh@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S . Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>, 
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Tyler Hicks <code@tyhicks.com>, Miklos Szeredi <miklos@szeredi.hu>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, 
	Linux-Arch <linux-arch@vger.kernel.org>, selinux@vger.kernel.org, ecryptfs@vger.kernel.org, 
	linux-unionfs@vger.kernel.org, linux-xfs@vger.kernel.org, 
	Andrey Albershteyn <aalbersh@kernel.org>
Subject: Re: [PATCH v5 0/7] fs: introduce file_getattr and file_setattr
 syscalls
Message-ID: <20250519-reklamieren-unsolidarisch-7cd73317561d@brauner>
References: <20250513-xattrat-syscall-v5-0-22bb9c6c767f@kernel.org>
 <399fdabb-74d3-4dd6-9eee-7884a986dab1@app.fastmail.com>
 <20250515-bedarf-absagen-464773be3e72@brauner>
 <CAOQ4uxicuEkOas2UR4mqfus9Q2RAeKKYTwbE2XrkcE_zp8oScQ@mail.gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOQ4uxicuEkOas2UR4mqfus9Q2RAeKKYTwbE2XrkcE_zp8oScQ@mail.gmail.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, May 15, 2025 at 12:33:31PM +0200, Amir Goldstein wrote:
> On Thu, May 15, 2025 at 11:02 AM Christian Brauner <brauner@kernel.org> wrote:
> >
> > On Tue, May 13, 2025 at 11:53:23AM +0200, Arnd Bergmann wrote:
> > > On Tue, May 13, 2025, at 11:17, Andrey Albershteyn wrote:
> > >
> > > >
> > > >     long syscall(SYS_file_getattr, int dirfd, const char *pathname,
> > > >             struct fsxattr *fsx, size_t size, unsigned int at_flags);
> > > >     long syscall(SYS_file_setattr, int dirfd, const char *pathname,
> > > >             struct fsxattr *fsx, size_t size, unsigned int at_flags);
> > >
> > > I don't think we can have both the "struct fsxattr" from the uapi
> > > headers, and a variable size as an additional argument. I would
> > > still prefer not having the extensible structure at all and just
> >
> > We're not going to add new interfaces that are fixed size unless for the
> > very basic cases. I don't care if we're doing that somewhere else in the
> > kernel but we're not doing that for vfs apis.
> >
> > > use fsxattr, but if you want to make it extensible in this way,
> > > it should use a different structure (name). Otherwise adding
> > > fields after fsx_pad[] would break the ioctl interface.
> >
> > Would that really be a problem? Just along the syscall simply add
> > something like:
> >
> > diff --git a/fs/ioctl.c b/fs/ioctl.c
> > index c91fd2b46a77..d3943805c4be 100644
> > --- a/fs/ioctl.c
> > +++ b/fs/ioctl.c
> > @@ -868,12 +868,6 @@ static int do_vfs_ioctl(struct file *filp, unsigned int fd,
> >         case FS_IOC_SETFLAGS:
> >                 return ioctl_setflags(filp, argp);
> >
> > -       case FS_IOC_FSGETXATTR:
> > -               return ioctl_fsgetxattr(filp, argp);
> > -
> > -       case FS_IOC_FSSETXATTR:
> > -               return ioctl_fssetxattr(filp, argp);
> > -
> >         case FS_IOC_GETFSUUID:
> >                 return ioctl_getfsuuid(filp, argp);
> >
> > @@ -886,6 +880,20 @@ static int do_vfs_ioctl(struct file *filp, unsigned int fd,
> >                 break;
> >         }
> >
> > +       switch (_IOC_NR(cmd)) {
> > +       case _IOC_NR(FS_IOC_FSGETXATTR):
> > +               if (WARN_ON_ONCE(_IOC_TYPE(cmd) != _IOC_TYPE(FS_IOC_FSGETXATTR)))
> > +                       return SOMETHING_SOMETHING;
> > +               /* Only handle original size. */
> > +               return ioctl_fsgetxattr(filp, argp);
> > +
> > +       case _IOC_NR(FFS_IOC_FSSETXATTR):
> > +               if (WARN_ON_ONCE(_IOC_TYPE(cmd) != _IOC_TYPE(FFS_IOC_FSSETXATTR)))
> > +                       return SOMETHING_SOMETHING;
> > +               /* Only handle original size. */
> > +               return ioctl_fssetxattr(filp, argp);
> > +       }
> > +
> 
> I think what Arnd means is that we will not be able to change struct
> sfxattr in uapi
> going forward, because we are not going to deprecate the ioctls and
> certainly not
> the XFS specific ioctl XFS_IOC_FSGETXATTRA.

Sure, I'm just saying this could very likely be handled without the
kernel or userspace having to care about the changed structure provided
we teach the kernel to use the ioctl number, not the command and only
ever copy v1 of the struct for the ioctls in new kernels. But anyway...

> 
> This struct is part of XFS uapi:
> https://man7.org/linux/man-pages/man2/ioctl_xfs_fsgetxattr.2.html
> 
> Should we will need to depart from this struct definition and we might
> as well do it for the initial release of the syscall rather than later on, e.g.:
> 
> --- a/include/uapi/linux/fs.h
> +++ b/include/uapi/linux/fs.h
> @@ -148,6 +148,17 @@ struct fsxattr {
>         unsigned char   fsx_pad[8];
>  };
> 
> +/*
> + * Variable size structure for file_[sg]et_attr().
> + */
> +struct fsx_fileattr {
> +       __u32           fsx_xflags;     /* xflags field value (get/set) */
> +       __u32           fsx_extsize;    /* extsize field value (get/set)*/
> +       __u32           fsx_nextents;   /* nextents field value (get)   */
> +       __u32           fsx_projid;     /* project identifier (get/set) */
> +       __u32           fsx_cowextsize; /* CoW extsize field value (get/set)*/
> +};
> +
> +#define FSXATTR_SIZE_VER0 20
> +#define FSXATTR_SIZE_LATEST FSXATTR_SIZE_VER0
> +
> 
> Right?

Sure, I don't have a problem with that since I find the current name
with "fsxattr" quite problematic anyway.

